-- ===============================
-- Sales Performance Analysis
-- ===============================

-- Preview Data
select * from sales
limit 10;


-- Total Records
Select count(*)
from sales;


-- Unique Products
Select distinct 
Product
from sales;

-- ===============================
-- Total Revenue and Profit
-- ===============================

Select
		Sum(Revenue) as Total_Revenue,
        Sum(Profit) as Total_Profit
        from sales;
        
        
-- Revenue by Region--
select 
	Region,
	sum(Revenue) as Total_Revenue
from sales
group by Region
order by Total_Revenue Desc;

        
-- Profit by Region--
Select 
	Region,
	sum(Profit) as Total_Profit
from sales
Group by Region
order by Total_Profit Desc;
  
-- ===============================
-- Product & Customer Insights
-- ===============================
  
-- Top 2 Products by Revenue
Select 
	Product,
	Sum(Revenue) as Total_Revenue
from sales
Group by Product
Order by Total_Revenue Desc
Limit 2;
        
        
-- Top 5 Customers--
Select 
	Customer,
	sum(Revenue) as Total_Revenue
from sales
Group by Customer
order by Total_Revenue Desc
Limit 5;

-- ===============================
-- Business Performance
-- ===============================


-- Revenue Vs Budget Analysis
select 
	Product,
	sum(Revenue) as Total_Revenue,
	Sum(Budget_Revenue) as Budgeted_Revenue,
	Sum(Revenue)-Sum(Budget_Revenue) as Variance
from sales
Group by Product
Order by Total_Revenue Desc;


-- Profit margin by Product 
select 
	Product,
	Round((Sum(Profit)/Sum(Revenue))*100,2) as Profit_Margin
from sales
Group by Product
Order by Profit_Margin Desc;


-- Percentage Revenue Contribution by Region
Select 
	Region,
	Sum(Revenue) as Total_Revenue,
	Sum(Revenue)*100/ (Select Sum(Revenue) from sales) as Percentage_Revenue
from sales
Group by Region;