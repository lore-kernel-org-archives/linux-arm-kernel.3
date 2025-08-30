Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A75CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 11:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nB6GsrC3suUPGYnBxDulbpNmOH6mvKZMR5+BvK4sW4=; b=o9TYeh8LO0OWV4XpeVFDUqjCiy
	oqqXDYwe5XsJfLQIqQ4YEUvcO9Tncl3RWEoFZurf4gmWy/+0EmMzuxRqacUcQb6bYKYMNxM4O6FvO
	KvbAipymXjnHr+vydyZHqat8W3VE5dZ4cTt7Lkixftmeoe6YtCC30zfYmdTT0tJlAEc9qzZStjGdu
	/M2UZj4BLipZ4Uo7Yt5b//g46bzJhoQUssTfT36GvR02ISMxQ5eo6bl8fezR9Vm4y7XS1csMcaiCs
	s/X5khDVecex6KlfWepY6fu9n8wcq8C7vkjHdHufl7n5GGP5qcKpd4z3N3Utv087VzLpY2XTjxuwi
	Z35QerWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJcR-00000007nes-05ug;
	Sat, 30 Aug 2025 11:19:39 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJSy-00000007mtJ-3RMP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 11:09:53 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-afe6a3ba50aso36311166b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 04:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756552191; x=1757156991; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8nB6GsrC3suUPGYnBxDulbpNmOH6mvKZMR5+BvK4sW4=;
        b=MTlex0eUpxKHZZ8OVc9JFjl03krSnpnmy3JO9Y7p8c0dwmcdmLcFhVJES5hYqxfWXY
         8hATsQ9PjecsGYtgGAUCAWmCyxHTvqpzMbznc3/5Zv+/0e1HVgGYC66o5T2eQ1pp6lDg
         bbsVmIeNvMA5+MLAcX3k6Xy8mYTH0fbVkxxeLbv32OEt7qppN8yB2Vwt9vJEZ1GZAcNG
         gd/Kx4Y3qd7Vh4cWw4soe84yPAWnH/jjE+MvVwWvIC7Kj/AQYXjFkJzch1j76uw0HCPQ
         lilhE9ef40aZLtDCYYrYlhuYVcrvEShNlThiUrXrv62l4nyvplVTU5sv2rf4B3GIe7wn
         I9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756552191; x=1757156991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nB6GsrC3suUPGYnBxDulbpNmOH6mvKZMR5+BvK4sW4=;
        b=F3P5oNjkiMYfYL/MZcKVZc36go+ITHj2TTBw/3GX5ZKqXf5vkYKkp/DargmyJ6jX4W
         dDY65AxYvy4MgGa8o7U6HERMw5DOwCN6gkdcuOtrTQBYDtj+wTx3qDkgEKinH+CMZqOD
         ZT1XaihUhnNC5mzxfgsTFJqlxAGHpJJQ8r9fv1mFWOxc2JdNPRZ3PwMvcQyg0HTVqJ/f
         k2+++UUkR4jFpKEBBn+7rfSvGb943UTJUf09yMWv7+vs9PaOPA7dOsvBib3Ih+oDYSip
         /3D9MRv2RMC3NxKuTynOaePRkRcuMAD1JsNJGbLkPDQygLW0JzdNUV+iArusBhMvPfiD
         80tw==
X-Forwarded-Encrypted: i=1; AJvYcCXuaW7nqCthEvK1m1xW961uGSTfoTSLMEm/a56Ze+xbeE738uS9MGmUN/AARdtJZNnNup2+QhurlidrjJFKq7lp@lists.infradead.org
X-Gm-Message-State: AOJu0YzrLcuU9tQ0oBJ7NSlX4+Ss+PzEf6GCC3fuFTrIsSfkApMQTLcR
	eFXVG+yH+qCcWH2MeI05BDZHeqO7Tf0VO5Nwfs2lY2VM69yuKcATcf3Dp1b15EMMMm8=
X-Gm-Gg: ASbGncv5tgu2iulLxaUHCnEYjTxsDF3/SkqOwsA6lL8BQo71y0/Jv9QsRRmVHSRlZyO
	eaxz68+bKve++kBVBiebgn13EhQgQz2nsfOrlqa/RiREK1xxHnJmIpu+jq4iXXeji/c7+y2kLDh
	N9itqpPAE6kFx7WnpjrF8XgU4/V46rBDxTP6rKBOgoRmsYC+sBbg8GhJqqcYTAm+X1muU1J4o/d
	sZbtMgpw/nUZYLyUWerBjQeK4+GpsZ8ND3AH1QMUFfZjp6EUq7XI1G0ttHDjVdm28Hh17zDZ/Ad
	ziAyxTxIAbUbVUcmuUC3JrtKdsKPfJsVNuUfYu3SDOqYcBhJ5x/XlrGQTBEhJSlwMpJnLz11o1V
	1qXggYJloSTd5EiYyDQZ3RUzKbNX+iN5Bnz6ZvvFgZS9UmoydMA==
X-Google-Smtp-Source: AGHT+IEwQjzrWdjkIQWH/5UdCAnPAwyzuWU85HpS7f8tCUYr19Z6zEYlEC4pDnHs7fe5Ih6Mw5O/gw==
X-Received: by 2002:a05:6402:13d0:b0:61c:cfb2:b2ce with SMTP id 4fb4d7f45d1cf-61d0d5f339cmr2022257a12.7.1756552191100;
        Sat, 30 Aug 2025 04:09:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc21542asm3285666a12.18.2025.08.30.04.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:09:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 13:09:39 +0200
Subject: [PATCH 2/5] iio: adc: exynos_adc: Drop touchscreen support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-adc-v1-2-de54dfb1d9ea@linaro.org>
References: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9603;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zHCa9J6rlUOO7tYPrfj8IXJe6YbyYyv4K6ql9TPqD00=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostv1Mf6SzYbmRYQ4l+395X7N5CPcC5zur7+7B
 o/VR8OOdPyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLb9QAKCRDBN2bmhouD
 10cMD/0VprNv1zGvyBDDUhs3p15+vnw3XyDMIDTTn/LzRmGTZfuZ7ZPnvmruBq3ekIZwSLKbUO3
 CHYak8y9aG0inxirN26ysoNlRTNhAq4M1Hn8yWQNWUKWFoY3zCBNlD17uXaXiovJdvI0soVQnr6
 5TZVkOn/f8WyDa1lNNheZFWm25R1CqCxo6vocJcdytINkj1+xRWrZEr1SS28t8GAbyIp2XD/MK5
 3KXmGkDGp0k3Tfkw6W8PWSGosEA59bWPJxI6q8WBAafUt66b6r8xLkUhMKA1IuWHlWjEHSe7j6x
 9y6yC5gtCROG+hATEXkYv1eYNl/Lv2kDII44RTcRnSpkoekLq5qFb1y90GvOumyOH6Kfx++uZ7+
 HLvNPsFWieBmWpTk6qNGEvPHiq4JpQoflHGAgkhUGIdC09fW22+Vbf6ZWFEHAwmdOaQ6nrboMLn
 y/7aFkjhmuMd1kBCn7OGMWY/TOOwojBwbtTA5BxArA8f0gU/wvqsbU8em00waArBGZTsSbyo7Bw
 WvQjHTFAJQAsRdg7IkUtf9Celey3Z2eDn4AJEU/+cd8XNi8QDF/gVg7neL+zVPebQEMAGmAXj3v
 j7MfIYPMMH5+PiezHfOB8wuYIBCCpLowAJx1RuBTPP40Lc9vbQqJ6k8NGvCGoNBQHESi3/YXKt2
 sDtjtNSKJpT+XJQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_040952_870532_2D3EB1A9 
X-CRM114-Status: GOOD (  23.87  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

With last user of touchscreen via ADC (S3C24xx SoC) gone, drop the
remaining code from Samsung SoC ADC driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iio/adc/exynos_adc.c | 196 +------------------------------------------
 1 file changed, 1 insertion(+), 195 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index 17fd33c6bd6d0dcf41771331ecb328e58d820ed0..30f6d8436e775a8d2177951b436cd45152307ea2 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -19,11 +19,9 @@
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/of.h>
-#include <linux/of_irq.h>
 #include <linux/regulator/consumer.h>
 #include <linux/of_platform.h>
 #include <linux/err.h>
-#include <linux/input.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/machine.h>
@@ -35,14 +33,12 @@
 
 /* S3C/EXYNOS4412/5250 ADC_V1 registers definitions */
 #define ADC_V1_CON(x)		((x) + 0x00)
-#define ADC_V1_TSC(x)		((x) + 0x04)
 #define ADC_V1_DLY(x)		((x) + 0x08)
 #define ADC_V1_DATX(x)		((x) + 0x0C)
 #define ADC_V1_DATY(x)		((x) + 0x10)
 #define ADC_V1_UPDN(x)		((x) + 0x14)
 #define ADC_V1_INTCLR(x)	((x) + 0x18)
 #define ADC_V1_MUX(x)		((x) + 0x1c)
-#define ADC_V1_CLRINTPNDNUP(x)	((x) + 0x20)
 
 /* Future ADC_V2 registers definitions */
 #define ADC_V2_CON1(x)		((x) + 0x00)
@@ -61,17 +57,12 @@
 /* Bit definitions for S3C2410 / S3C6410 ADC */
 #define ADC_S3C2410_CON_SELMUX(x) (((x) & 7) << 3)
 
-/* touch screen always uses channel 0 */
-#define ADC_S3C2410_MUX_TS	0
-
 /* ADCTSC Register Bits */
 #define ADC_S3C2443_TSC_UD_SEN		(1u << 8)
 #define ADC_S3C2410_TSC_YM_SEN		(1u << 7)
 #define ADC_S3C2410_TSC_YP_SEN		(1u << 6)
 #define ADC_S3C2410_TSC_XM_SEN		(1u << 5)
 #define ADC_S3C2410_TSC_XP_SEN		(1u << 4)
-#define ADC_S3C2410_TSC_PULL_UP_DISABLE	(1u << 3)
-#define ADC_S3C2410_TSC_AUTO_PST	(1u << 2)
 #define ADC_S3C2410_TSC_XY_PST(x)	(((x) & 0x3) << 0)
 
 #define ADC_TSC_WAIT4INT (ADC_S3C2410_TSC_YM_SEN | \
@@ -79,12 +70,6 @@
 			 ADC_S3C2410_TSC_XP_SEN | \
 			 ADC_S3C2410_TSC_XY_PST(3))
 
-#define ADC_TSC_AUTOPST	(ADC_S3C2410_TSC_YM_SEN | \
-			 ADC_S3C2410_TSC_YP_SEN | \
-			 ADC_S3C2410_TSC_XP_SEN | \
-			 ADC_S3C2410_TSC_AUTO_PST | \
-			 ADC_S3C2410_TSC_XY_PST(0))
-
 /* Bit definitions for ADC_V2 */
 #define ADC_V2_CON1_SOFT_RESET	(1u << 2)
 
@@ -116,13 +101,11 @@
 struct exynos_adc {
 	struct exynos_adc_data	*data;
 	struct device		*dev;
-	struct input_dev	*input;
 	void __iomem		*regs;
 	struct regmap		*pmu_map;
 	struct clk		*clk;
 	struct clk		*sclk;
 	unsigned int		irq;
-	unsigned int		tsirq;
 	unsigned int		delay;
 	struct regulator	*vdd;
 
@@ -131,12 +114,6 @@ struct exynos_adc {
 	u32			value;
 	unsigned int            version;
 
-	bool			ts_enabled;
-
-	bool			read_ts;
-	u32			ts_x;
-	u32			ts_y;
-
 	/*
 	 * Lock to protect from potential concurrent access to the
 	 * completion callback during a manual conversion. For this driver
@@ -507,55 +484,13 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
 	return ret;
 }
 
-static int exynos_read_s3c64xx_ts(struct iio_dev *indio_dev, int *x, int *y)
-{
-	struct exynos_adc *info = iio_priv(indio_dev);
-	unsigned long time_left;
-	int ret;
-
-	mutex_lock(&info->lock);
-	info->read_ts = true;
-
-	reinit_completion(&info->completion);
-
-	writel(ADC_S3C2410_TSC_PULL_UP_DISABLE | ADC_TSC_AUTOPST,
-	       ADC_V1_TSC(info->regs));
-
-	/* Select the ts channel to be used and Trigger conversion */
-	info->data->start_conv(info, ADC_S3C2410_MUX_TS);
-
-	time_left = wait_for_completion_timeout(&info->completion,
-						EXYNOS_ADC_TIMEOUT);
-	if (time_left == 0) {
-		dev_warn(&indio_dev->dev, "Conversion timed out! Resetting\n");
-		if (info->data->init_hw)
-			info->data->init_hw(info);
-		ret = -ETIMEDOUT;
-	} else {
-		*x = info->ts_x;
-		*y = info->ts_y;
-		ret = 0;
-	}
-
-	info->read_ts = false;
-	mutex_unlock(&info->lock);
-
-	return ret;
-}
-
 static irqreturn_t exynos_adc_isr(int irq, void *dev_id)
 {
 	struct exynos_adc *info = dev_id;
 	u32 mask = info->data->mask;
 
 	/* Read value */
-	if (info->read_ts) {
-		info->ts_x = readl(ADC_V1_DATX(info->regs));
-		info->ts_y = readl(ADC_V1_DATY(info->regs));
-		writel(ADC_TSC_WAIT4INT | ADC_S3C2443_TSC_UD_SEN, ADC_V1_TSC(info->regs));
-	} else {
-		info->value = readl(ADC_V1_DATX(info->regs)) & mask;
-	}
+	info->value = readl(ADC_V1_DATX(info->regs)) & mask;
 
 	/* clear irq */
 	if (info->data->clear_irq)
@@ -566,46 +501,6 @@ static irqreturn_t exynos_adc_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-/*
- * Here we (ab)use a threaded interrupt handler to stay running
- * for as long as the touchscreen remains pressed, we report
- * a new event with the latest data and then sleep until the
- * next timer tick. This mirrors the behavior of the old
- * driver, with much less code.
- */
-static irqreturn_t exynos_ts_isr(int irq, void *dev_id)
-{
-	struct exynos_adc *info = dev_id;
-	struct iio_dev *dev = dev_get_drvdata(info->dev);
-	u32 x, y;
-	bool pressed;
-	int ret;
-
-	while (READ_ONCE(info->ts_enabled)) {
-		ret = exynos_read_s3c64xx_ts(dev, &x, &y);
-		if (ret == -ETIMEDOUT)
-			break;
-
-		pressed = x & y & ADC_DATX_PRESSED;
-		if (!pressed) {
-			input_report_key(info->input, BTN_TOUCH, 0);
-			input_sync(info->input);
-			break;
-		}
-
-		input_report_abs(info->input, ABS_X, x & ADC_DATX_MASK);
-		input_report_abs(info->input, ABS_Y, y & ADC_DATY_MASK);
-		input_report_key(info->input, BTN_TOUCH, 1);
-		input_sync(info->input);
-
-		usleep_range(1000, 1100);
-	}
-
-	writel(0, ADC_V1_CLRINTPNDNUP(info->regs));
-
-	return IRQ_HANDLED;
-}
-
 static int exynos_adc_reg_access(struct iio_dev *indio_dev,
 			      unsigned reg, unsigned writeval,
 			      unsigned *readval)
@@ -657,70 +552,12 @@ static int exynos_adc_remove_devices(struct device *dev, void *c)
 	return 0;
 }
 
-static int exynos_adc_ts_open(struct input_dev *dev)
-{
-	struct exynos_adc *info = input_get_drvdata(dev);
-
-	WRITE_ONCE(info->ts_enabled, true);
-	enable_irq(info->tsirq);
-
-	return 0;
-}
-
-static void exynos_adc_ts_close(struct input_dev *dev)
-{
-	struct exynos_adc *info = input_get_drvdata(dev);
-
-	WRITE_ONCE(info->ts_enabled, false);
-	disable_irq(info->tsirq);
-}
-
-static int exynos_adc_ts_init(struct exynos_adc *info)
-{
-	int ret;
-
-	if (info->tsirq <= 0)
-		return -ENODEV;
-
-	info->input = input_allocate_device();
-	if (!info->input)
-		return -ENOMEM;
-
-	info->input->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
-	info->input->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
-
-	input_set_abs_params(info->input, ABS_X, 0, 0x3FF, 0, 0);
-	input_set_abs_params(info->input, ABS_Y, 0, 0x3FF, 0, 0);
-
-	info->input->name = "S3C24xx TouchScreen";
-	info->input->id.bustype = BUS_HOST;
-	info->input->open = exynos_adc_ts_open;
-	info->input->close = exynos_adc_ts_close;
-
-	input_set_drvdata(info->input, info);
-
-	ret = input_register_device(info->input);
-	if (ret) {
-		input_free_device(info->input);
-		return ret;
-	}
-
-	ret = request_threaded_irq(info->tsirq, NULL, exynos_ts_isr,
-				   IRQF_ONESHOT | IRQF_NO_AUTOEN,
-				   "touchscreen", info);
-	if (ret)
-		input_unregister_device(info->input);
-
-	return ret;
-}
-
 static int exynos_adc_probe(struct platform_device *pdev)
 {
 	struct exynos_adc *info = NULL;
 	struct device_node *np = pdev->dev.of_node;
 	struct s3c2410_ts_mach_info *pdata = dev_get_platdata(&pdev->dev);
 	struct iio_dev *indio_dev = NULL;
-	bool has_ts = false;
 	int ret;
 	int irq;
 
@@ -753,27 +590,10 @@ static int exynos_adc_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* leave out any TS related code if unreachable */
-	if (IS_REACHABLE(CONFIG_INPUT)) {
-		has_ts = of_property_read_bool(pdev->dev.of_node,
-					       "has-touchscreen") || pdata;
-	}
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 	info->irq = irq;
-
-	if (has_ts) {
-		irq = platform_get_irq(pdev, 1);
-		if (irq == -EPROBE_DEFER)
-			return irq;
-
-		info->tsirq = irq;
-	} else {
-		info->tsirq = -1;
-	}
-
 	info->dev = &pdev->dev;
 
 	init_completion(&info->completion);
@@ -842,11 +662,6 @@ static int exynos_adc_probe(struct platform_device *pdev)
 	else
 		info->delay = 10000;
 
-	if (has_ts)
-		ret = exynos_adc_ts_init(info);
-	if (ret)
-		goto err_iio;
-
 	ret = of_platform_populate(np, exynos_adc_match, NULL, &indio_dev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed adding child nodes\n");
@@ -858,11 +673,6 @@ static int exynos_adc_probe(struct platform_device *pdev)
 err_of_populate:
 	device_for_each_child(&indio_dev->dev, NULL,
 				exynos_adc_remove_devices);
-	if (has_ts) {
-		input_unregister_device(info->input);
-		free_irq(info->tsirq, info);
-	}
-err_iio:
 	iio_device_unregister(indio_dev);
 err_irq:
 	free_irq(info->irq, info);
@@ -882,10 +692,6 @@ static void exynos_adc_remove(struct platform_device *pdev)
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
 	struct exynos_adc *info = iio_priv(indio_dev);
 
-	if (IS_REACHABLE(CONFIG_INPUT) && info->input) {
-		free_irq(info->tsirq, info);
-		input_unregister_device(info->input);
-	}
 	device_for_each_child(&indio_dev->dev, NULL,
 				exynos_adc_remove_devices);
 	iio_device_unregister(indio_dev);

-- 
2.48.1


