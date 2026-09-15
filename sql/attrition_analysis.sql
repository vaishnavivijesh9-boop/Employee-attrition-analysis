RENAME TABLE hr_attrition.hr_attrition
TO hr_attrition.employees;
SHOW TABLES FROM hr_attrition;
SELECT COUNT(*) AS total_rows
FROM hr_attrition.employees;
SELECT COUNT(*) AS total_rows
FROM hr_attrition.employees;
SHOW COLUMNS FROM hr_attrition.employees;
SELECT 
    Attrition,
    COUNT(*) AS employees
FROM hr_attrition.employees
GROUP BY Attrition;
SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT EmployeeNumber) AS unique_employees
FROM hr_attrition.employees;
SELECT
    SUM(Attrition IS NULL) AS missing_attrition,
    SUM(Age IS NULL) AS missing_age,
    SUM(MonthlyIncome IS NULL) AS missing_income,
    SUM(OverTime IS NULL) AS missing_overtime,
    SUM(JobSatisfaction IS NULL) AS missing_job_satisfaction,
    SUM(WorkLifeBalance IS NULL) AS missing_worklife_balance,
    SUM(YearsAtCompany IS NULL) AS missing_years_at_company
FROM hr_attrition.employees;
SELECT
    COUNT(DISTINCT EmployeeCount) AS employee_count_values,
    COUNT(DISTINCT Over18) AS over18_values,
    COUNT(DISTINCT StandardHours) AS standard_hours_values
FROM hr_attrition.employees;
SELECT 
    MIN(EmployeeNumber) AS min_employee_number,
    MAX(EmployeeNumber) AS max_employee_number,
    COUNT(DISTINCT EmployeeNumber) AS unique_employee_numbers
FROM hr_attrition.employees;
SELECT
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_attrition.employees;
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_attrition.employees
GROUP BY Department
ORDER BY attrition_rate_percent DESC;
SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_attrition.employees
GROUP BY OverTime
ORDER BY attrition_rate_percent DESC;
SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_attrition.employees
GROUP BY OverTime
ORDER BY attrition_rate_percent DESC;
SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Under 3000'
        WHEN MonthlyIncome < 5000 THEN '3000-4999'
        WHEN MonthlyIncome < 7000 THEN '5000-6999'
        WHEN MonthlyIncome < 10000 THEN '7000-9999'
        ELSE '10000+'
    END AS income_band,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_attrition.employees
GROUP BY income_band
ORDER BY attrition_rate_percent DESC;
SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age < 35 THEN '25-34'
        WHEN Age < 45 THEN '35-44'
        WHEN Age < 55 THEN '45-54'
        ELSE '55+'
    END AS age_band,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_attrition.employees
GROUP BY age_band
ORDER BY attrition_rate_percent DESC;
SELECT
    CASE
        WHEN TotalWorkingYears <= 2 THEN '0-2 years'
        WHEN TotalWorkingYears <= 5 THEN '3-5 years'
        WHEN TotalWorkingYears <= 10 THEN '6-10 years'
        WHEN TotalWorkingYears <= 20 THEN '11-20 years'
        ELSE '21+ years'
    END AS experience_band,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_attrition.employees
GROUP BY experience_band
ORDER BY attrition_rate_percent DESC;
SELECT
    CASE
        WHEN DistanceFromHome <= 5 THEN '1-5'
        WHEN DistanceFromHome <= 10 THEN '6-10'
        WHEN DistanceFromHome <= 20 THEN '11-20'
        ELSE '21+'
    END AS distance_band,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_attrition.employees
GROUP BY distance_band
ORDER BY attrition_rate_percent DESC;
SELECT
    JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_attrition.employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;
SELECT
    WorkLifeBalance,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_attrition.employees
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;
SELECT
    CASE
        WHEN YearsSinceLastPromotion <= 1 THEN '0-1 years'
        WHEN YearsSinceLastPromotion <= 3 THEN '2-3 years'
        WHEN YearsSinceLastPromotion <= 5 THEN '4-5 years'
        ELSE '6+ years'
    END AS promotion_wait,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_attrition.employees
GROUP BY promotion_wait
ORDER BY attrition_rate_percent DESC;
SELECT
    JobInvolvement,
    COUNT(*) AS total_employees,
    SUM(Attrition = 'Yes') AS employees_left,
    ROUND(
        100.0 * SUM(Attrition = 'Yes') / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_attrition.employees
GROUP BY JobInvolvement
ORDER BY JobInvolvement;
CREATE TABLE hr_attrition.analysis_employees AS
SELECT
    EmployeeNumber,
    Attrition,
    Age,
    Department,
    JobRole,
    Gender,
    MaritalStatus,
    BusinessTravel,
    DistanceFromHome,
    Education,
    EducationField,
    EnvironmentSatisfaction,
    JobInvolvement,
    JobLevel,
    JobSatisfaction,
    MonthlyIncome,
    NumCompaniesWorked,
    OverTime,
    PercentSalaryHike,
    PerformanceRating,
    RelationshipSatisfaction,
    StockOptionLevel,
    TotalWorkingYears,
    TrainingTimesLastYear,
    WorkLifeBalance,
    YearsAtCompany,
    YearsInCurrentRole,
    YearsSinceLastPromotion,
    YearsWithCurrManager
FROM hr_attrition.employees;
ALTER TABLE hr_attrition.analysis_employees
ADD COLUMN AgeBand VARCHAR(20);
UPDATE hr_attrition.analysis_employees
SET AgeBand =
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age < 35 THEN '25-34'
        WHEN Age < 45 THEN '35-44'
        WHEN Age < 55 THEN '45-54'
        ELSE '55+'
    END;
    SET SQL_SAFE_UPDATES = 0;
    UPDATE hr_attrition.analysis_employees
SET AgeBand =
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age < 35 THEN '25-34'
        WHEN Age < 45 THEN '35-44'
        WHEN Age < 55 THEN '45-54'
        ELSE '55+'
    END;
    ALTER TABLE hr_attrition.analysis_employees
ADD COLUMN TenureBand VARCHAR(20);
UPDATE hr_attrition.analysis_employees
SET TenureBand =
    CASE
        WHEN YearsAtCompany < 1 THEN 'Under 1 year'
        WHEN YearsAtCompany <= 2 THEN '1-2 years'
        WHEN YearsAtCompany <= 5 THEN '3-5 years'
        WHEN YearsAtCompany <= 10 THEN '6-10 years'
        ELSE '10+ years'
    END;
    ALTER TABLE hr_attrition.analysis_employees
ADD COLUMN IncomeBand VARCHAR(20);
UPDATE hr_attrition.analysis_employees
SET IncomeBand =
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Under 3000'
        WHEN MonthlyIncome < 5000 THEN '3000-4999'
        WHEN MonthlyIncome < 7000 THEN '5000-6999'
        WHEN MonthlyIncome < 10000 THEN '7000-9999'
        ELSE '10000+'
    END;
    ALTER TABLE hr_attrition.analysis_employees
ADD COLUMN DistanceBand VARCHAR(20);
UPDATE hr_attrition.analysis_employees
SET DistanceBand =
    CASE
        WHEN DistanceFromHome <= 5 THEN '1-5'
        WHEN DistanceFromHome <= 10 THEN '6-10'
        WHEN DistanceFromHome <= 20 THEN '11-20'
        ELSE '21+'
    END;
    ALTER TABLE hr_attrition.analysis_employees
ADD COLUMN PromotionWaitBand VARCHAR(20);
UPDATE hr_attrition.analysis_employees
SET PromotionWaitBand =
    CASE
        WHEN YearsSinceLastPromotion <= 1 THEN '0-1 years'
        WHEN YearsSinceLastPromotion <= 3 THEN '2-3 years'
        WHEN YearsSinceLastPromotion <= 5 THEN '4-5 years'
        ELSE '6+ years'
    END;
    ALTER TABLE hr_attrition.analysis_employees
ADD COLUMN AttritionFlag INT;
UPDATE hr_attrition.analysis_employees
SET AttritionFlag =
    CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END;
    SELECT
    EmployeeNumber,
    Attrition,
    AttritionFlag,
    Age,
    AgeBand,
    YearsAtCompany,
    TenureBand,
    MonthlyIncome,
    IncomeBand,
    DistanceFromHome,
    DistanceBand,
    YearsSinceLastPromotion,
    PromotionWaitBand
FROM hr_attrition.analysis_employees
LIMIT 20;
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT EmployeeNumber) AS unique_employees,
    SUM(AttritionFlag) AS total_attrition
FROM hr_attrition.analysis_employees;
    