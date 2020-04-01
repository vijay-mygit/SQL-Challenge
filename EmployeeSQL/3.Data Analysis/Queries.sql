--1.List the following details of each employee: employee number, last name, first name, gender, and salary.

select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from salaries as s
join employees as e on
e.emp_no = s.emp_no
order by emp_no asc;

--2.List employees who were hired in 1986.

select * from employees
where hire_date between '1986-01-01' and '1986-12-31';

--3.List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

select d.dept_no, de.dept_name, d.emp_no, e.last_name, e.first_name,d.from_date, d.to_date
from dept_manager as d
INNER join departments as de on d.dept_no = de.dept_no
INNER join employees as e on d.emp_no = e.emp_no;

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, de.dept_name
from employees as e
join dept_emp as d on e.emp_no = d.emp_no
join departments as de on d.dept_no = de.dept_no
order by emp_no asc;

--5.List all employees whose first name is "Hercules" and last names begin with "B."

select emp_no, first_name, last_name
from employees
where first_name = 'Hercules' and last_name like 'B%';

--6.list all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, de.dept_name
from employees as e
join dept_emp as d on e.emp_no = d.emp_no
join departments as de on d.dept_no = de.dept_no
where dept_name = 'Sales';

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, de.dept_name
from employees as e
join dept_emp as d on e.emp_no = d.emp_no
join departments as de on d.dept_no = de.dept_no
where dept_name = 'Sales' or dept_name= 'Development';

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name) as "Frequency Count"
from employees
group by last_name 
order by "Frequency Count" desc;