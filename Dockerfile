# Встановлюємо базовий образ
FROM python:3.8-slim

# Встановлюємо робочу директорію в контейнері
WORKDIR /app

# Копіюємо файл requirements.txt і встановлюємо залежності
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо весь код додатку в контейнер
COPY . .

# Вказуємо команду для запуску додатку
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "app:app"]
