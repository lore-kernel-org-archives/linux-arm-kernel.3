Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE6BC88E65
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aZo8brA/mV4EAhLeK0x5tJFKmX0FKLKeJDGnh4sR4I=; b=Q9JT96JJOpv+7yuQcmw9aIDbnn
	uOYh4PdglGQ48mtsFpR4VcRdZwjStORaxlg+CDaviQx2ZLeEK5m/23gP9RjNpOiUwF/P2ShmrXIEK
	AgbN5RTI8rBHOzWrOhRHP5lvuFU/D83crjqPVyXNDCMzH+bS/127oTrdtYJ8K3QeCRFM7JZIaF2NQ
	N5YveDf5ToCtj2BP3KODxmNdDC4dbyN5GUc0aD2gao1sB9uwivJtviQJbVL9jLwGicOX6/HMC0pyP
	utT1fVtBYyB7g5b3oM+C0vho4jDQcKR+jCXMM6mSbcKb3nT8aGb3+/n1+0x6bAeYsSEKsndciEx2y
	hEG6J/9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lgc-00000001kfI-3FfX;
	Sun, 13 Sep 2026 15:00:06 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lgX-00000001kao-2Wdd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 15:00:04 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747eb79fbso6684765ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 08:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311601; x=1789916401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1aZo8brA/mV4EAhLeK0x5tJFKmX0FKLKeJDGnh4sR4I=;
        b=eHjSxayF6ExQ9hRvxh4sIBSrd6w1e3AoDcKVz+tRWs3AQeMUPn4S0gTRSSU9r+pVYp
         A6xJ/lAoIrIOIHrfc5BaWRc/R7lYyCj8g2sV5lNfq33fzGhjSkPDqrNEP96zekegeEjv
         HJM1zknoA244iJAU3suTdDf7PVPXhUkL3om53Y6qctKO6RFppA8pLpLG3K3fpUU0rBes
         9d6Opn4CbISZbWx/5wIt2jf6fyYQGI75+wMZStwy4VdG0EIEcxjrBDmRj8A5Xk5BDDk8
         lEjeV8qup1Jh3RmAuhu2KaG/p++qhP1jtnA8wfVZMscpFjeI6TCTD5xVYawD4WPkq0rx
         +/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311601; x=1789916401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1aZo8brA/mV4EAhLeK0x5tJFKmX0FKLKeJDGnh4sR4I=;
        b=PrEkjcJV0O+kp8/7IUKSWwfpFspG+4f4i1ksB+FAsdJ+ZwQ6hLZXyhcZQM5bviMcJK
         pPx2dV5xNNUE23F5JrRBFM1kWeUz3kKhGSUvY9MI7kl+1qiq+PPQ9PuNKGwRUY/IzIw+
         eCuZ8QHr4JasJB9EYW8rNMtVdkpvzwebjFrrFkBV8AKaFiPuLIyhBWSG8umQl/zOCO5i
         HVql0KuTI+pqUwTB/KfUjCP9Rm8ru/i630Q8GgfdKHNv8314fvK7l4J/6kHkJDeeiqhM
         BaojLUYM0U67oasA2Nhn0Oq5/6PnK+99cRWN5SrR7r9f6/Y9hS2M39Zc75iNy1j+kHnc
         UwBg==
X-Forwarded-Encrypted: i=1; AKwUvBw2ts2i7PSB4q9GQ0LWn3ZAM0wdW+qahhOzTXbWMs0XxlZhrzpQ6HzH5en5lP1Qit9/Fc3v+NZfWUFuF/LLyjCX@lists.infradead.org
X-Gm-Message-State: AFuF++m3/mOS5paA/3EgpN3SWIhDeaPsMo3nUg3CuJrmBZ1LTTtMvAjB
	RJwF04d9D2A2h4R0e5WVE5PBP4UEGnBnSOHqmHEOV2a+XZYzdb3pdoNF
X-Gm-Gg: AYBFou0ltOclmGdzGi6O00nKbuA6QctWA9+yV2/fg+V3VbrKfOYzgQB0785FtELv2bj
	SSzBxR7wkif4YiR+B2mzDk9O05j/2hZaNbvJgPk9smTjK0rSOoZuCYafIFtC7JinPIWqTJ0X7fB
	DA6DoZZWTHGBk2yhIhiQSUR7JiavdStCvI+q9p8QEQyPgRmfSjxGmAFLHFvUMqQ1waE3+DQZIh4
	zLFmEnQ3u0evGjAtGyKJwiS0vxawFf5kcxeomN4pBDl8DQBd210jDWIpR7/ofUVG7Ezy/ix+3W+
	o+pEO3lUkDqnIZ9Sek1h1iwRtW13/rddTeow/XPcQnsBaPo70HoiqtNCt8+3tP/E9Q9exiw5lU/
	qS2RfBy7KYSZtw8xltwctckibJPBxrRLKCHLf+N/mmRG6zwPx186M715nqI0HOmlYRt74thnrjg
	hX0Ip5MXaMY/0PAYYqR3Tbj352LMacUuQEEe1uUaf4DOwCgPzPDjVmSUwgnF1rTrJg7rY5s6U61
	wgEHlLSnFs=
X-Received: by 2002:a17:90b:280d:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39d9c207c5dmr25340885a91.18.1789311600595;
        Sun, 13 Sep 2026 08:00:00 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.07.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:59:59 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Subject: [PATCH v9 6/9] thermal/drivers/exynos: Use SoC-specific variant data to TMU configuration
Date: Sun, 13 Sep 2026 20:28:34 +0530
Message-ID: <20260913145905.9404-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_080002_437937_21450D43 
X-CRM114-Status: GOOD (  25.90  )
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

Replace the SoC-specific switch statement in exynos_map_dt_data() with
static variant data selected through the device tree match table.

Move SoC-specific TMU configuration, including calibration values and
operation callbacks, from struct exynos_tmu_data into
struct exynos_tmu_variant. The variant is selected using
of_device_get_match_data() and is used throughout the driver for
SoC-specific operations.

Keep the effective reference voltage in struct exynos_tmu_data to
preserve the Exynos5433 G3D-specific reference voltage override.

This removes duplicated per-SoC initialization from the probe path and
makes the SoC-specific configuration easier to maintain and extend.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 472 ++++++++++++++++-----------
 1 file changed, 282 insertions(+), 190 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 82cb4140646a..a689c6a40b67 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -136,60 +136,70 @@ enum soc_type {
 };
 
 /**
- * struct exynos_tmu_data : A structure to hold the private data of the TMU
- *			    driver
- * @base: base address of the single instance of the TMU controller.
- * @irq: irq number of the TMU controller.
- * @soc: id of the SOC type.
- * @lock: lock to implement synchronization.
- * @clk: pointer to the clock structure.
- * @clk_sec: pointer to the clock structure for accessing triminfo registers.
- * @sclk: pointer to the clock structure for accessing the tmu special clk.
- * @cal_type: calibration type for temperature
- * @efuse_value: SoC defined fuse value
- * @min_efuse_value: minimum valid trimming data
- * @max_efuse_value: maximum valid trimming data
- * @temp_error1: fused value of the first point trim.
- * @temp_error2: fused value of the second point trim.
- * @gain: gain of amplifier in the positive-TC generator block
- *	0 < gain <= 15
- * @reference_voltage: reference voltage of amplifier
- *	in the positive-TC generator block
- *	0 < reference_voltage <= 31
- * @tzd: pointer to thermal_zone_device structure
- * @enabled: current status of TMU device
- * @tmu_set_low_temp: SoC specific method to set trip (falling threshold)
- * @tmu_set_high_temp: SoC specific method to set trip (rising threshold)
- * @tmu_set_crit_temp: SoC specific method to set critical temperature
- * @tmu_disable_low: SoC specific method to disable an interrupt (falling threshold)
- * @tmu_disable_high: SoC specific method to disable an interrupt (rising threshold)
- * @tmu_initialize: SoC specific TMU initialization method
- * @tmu_control: SoC specific TMU control method
- * @tmu_read: SoC specific TMU temperature read method
- * @tmu_set_emulation: SoC specific TMU emulation setting method
- * @tmu_clear_irqs: SoC specific TMU interrupts clearing method
+ * struct exynos_tmu_data - private data for the Exynos TMU driver
+ * @base: base address of the TMU controller.
+ * @variant: pointer to SoC-specific TMU configuration data.
+ * @irq: IRQ number of the TMU controller.
+ * @lock: protects access to TMU registers and shared state.
+ * @clk: pointer to the TMU APB clock.
+ * @clk_sec: pointer to the optional triminfo clock.
+ * @sclk: pointer to the TMU special clock.
+ * @cal_type: calibration type for temperature.
+ * @reference_voltage: effective reference voltage for the TMU.
+ * @temp_error1: fused value of the first calibration point.
+ * @temp_error2: fused value of the second calibration point.
+ * @tzd: thermal zone device associated with the TMU.
+ * @enabled: current status of the TMU device.
  */
 struct exynos_tmu_data {
 	void __iomem *base;
+	const struct exynos_tmu_variant *variant;
 	int irq;
-	enum soc_type soc;
 	struct mutex lock;
-	struct clk *clk, *clk_sec, *sclk;
+	struct clk *clk;
+	struct clk *clk_sec;
+	struct clk *sclk;
 	u32 cal_type;
-	u32 efuse_value;
-	u32 min_efuse_value;
-	u32 max_efuse_value;
-	u16 temp_error1, temp_error2;
-	u8 gain;
 	u8 reference_voltage;
+	u16 temp_error1;
+	u16 temp_error2;
 	struct thermal_zone_device *tzd;
 	bool enabled;
+};
+
+/**
+ * struct exynos_tmu_variant - SoC-specific TMU configuration
+ * @soc: SoC type.
+ * @gain: gain of the amplifier in the positive-TC generator block.
+ * @reference_voltage: default reference voltage of the amplifier in the
+ *                     positive-TC generator block.
+ * @efuse_value: SoC-specific fuse value.
+ * @min_efuse_value: minimum valid trimming value.
+ * @max_efuse_value: maximum valid trimming value.
+ * @tmu_set_low_temp: SoC-specific method to set the low temperature trip.
+ * @tmu_set_high_temp: SoC-specific method to set the high temperature trip.
+ * @tmu_disable_low: SoC-specific method to disable the low temperature trip.
+ * @tmu_disable_high: SoC-specific method to disable the high temperature trip.
+ * @tmu_set_crit_temp: SoC-specific method to set the critical temperature trip.
+ * @tmu_initialize: SoC-specific TMU initialization method.
+ * @tmu_control: SoC-specific TMU enable/disable method.
+ * @tmu_read: SoC-specific TMU temperature read method.
+ * @tmu_set_emulation: SoC-specific TMU emulation setting method.
+ * @tmu_clear_irqs: SoC-specific TMU interrupt clearing method.
+ */
+struct exynos_tmu_variant {
+	enum soc_type soc;
+	u8 gain;
+	u8 reference_voltage;
+	u32 efuse_value;
+	u32 min_efuse_value;
+	u32 max_efuse_value;
 
 	void (*tmu_set_low_temp)(struct exynos_tmu_data *data, u8 temp);
 	void (*tmu_set_high_temp)(struct exynos_tmu_data *data, u8 temp);
-	void (*tmu_set_crit_temp)(struct exynos_tmu_data *data, u8 temp);
 	void (*tmu_disable_low)(struct exynos_tmu_data *data);
 	void (*tmu_disable_high)(struct exynos_tmu_data *data);
+	void (*tmu_set_crit_temp)(struct exynos_tmu_data *data, u8 temp);
 	void (*tmu_initialize)(struct platform_device *pdev);
 	void (*tmu_control)(struct platform_device *pdev, bool on);
 	int (*tmu_read)(struct exynos_tmu_data *data);
@@ -229,22 +239,25 @@ static int code_to_temp(struct exynos_tmu_data *data, u16 temp_code)
 
 static void sanitize_temp_error(struct exynos_tmu_data *data, u32 trim_info)
 {
-	u16 tmu_temp_mask =
-		(data->soc == SOC_ARCH_EXYNOS7) ? EXYNOS7_TMU_TEMP_MASK
-						: EXYNOS_TMU_TEMP_MASK;
+	u16 tmu_temp_mask = EXYNOS_TMU_TEMP_MASK;
+
+	if (data->variant->soc == SOC_ARCH_EXYNOS7)
+		tmu_temp_mask = EXYNOS7_TMU_TEMP_MASK;
 
 	data->temp_error1 = trim_info & tmu_temp_mask;
-	data->temp_error2 = ((trim_info >> EXYNOS_TRIMINFO_85_SHIFT) &
-				EXYNOS_TMU_TEMP_MASK);
+	data->temp_error2 = (trim_info >> EXYNOS_TRIMINFO_85_SHIFT) &
+		EXYNOS_TMU_TEMP_MASK;
 
 	if (!data->temp_error1 ||
-	    (data->min_efuse_value > data->temp_error1) ||
-	    (data->temp_error1 > data->max_efuse_value))
-		data->temp_error1 = data->efuse_value & EXYNOS_TMU_TEMP_MASK;
+	    data->variant->min_efuse_value > data->temp_error1 ||
+	    data->temp_error1 > data->variant->max_efuse_value)
+		data->temp_error1 = data->variant->efuse_value &
+			EXYNOS_TMU_TEMP_MASK;
 
 	if (!data->temp_error2)
 		data->temp_error2 =
-			(data->efuse_value >> EXYNOS_TRIMINFO_85_SHIFT) &
+			(data->variant->efuse_value >>
+			 EXYNOS_TRIMINFO_85_SHIFT) &
 			EXYNOS_TMU_TEMP_MASK;
 }
 
@@ -263,8 +276,8 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 	if (!status) {
 		ret = -EBUSY;
 	} else {
-		data->tmu_initialize(pdev);
-		data->tmu_clear_irqs(data);
+		data->variant->tmu_initialize(pdev);
+		data->variant->tmu_clear_irqs(data);
 	}
 
 	if (data->clk_sec)
@@ -284,7 +297,7 @@ static int exynos_thermal_zone_configure(struct platform_device *pdev)
 	ret = thermal_zone_get_crit_temp(tzd, &temp);
 	if (ret) {
 		/* FIXME: Remove this special case */
-		if (data->soc == SOC_ARCH_EXYNOS5433)
+		if (data->variant->soc == SOC_ARCH_EXYNOS5433)
 			return 0;
 
 		dev_err(&pdev->dev,
@@ -295,7 +308,7 @@ static int exynos_thermal_zone_configure(struct platform_device *pdev)
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
 
-	data->tmu_set_crit_temp(data, temp / MCELSIUS);
+	data->variant->tmu_set_crit_temp(data, temp / MCELSIUS);
 
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
@@ -305,18 +318,18 @@ static int exynos_thermal_zone_configure(struct platform_device *pdev)
 
 static u32 get_con_reg(struct exynos_tmu_data *data, u32 con)
 {
-	if (data->soc == SOC_ARCH_EXYNOS4412 ||
-	    data->soc == SOC_ARCH_EXYNOS3250)
+	if (data->variant->soc == SOC_ARCH_EXYNOS4412 ||
+	    data->variant->soc == SOC_ARCH_EXYNOS3250)
 		con |= (EXYNOS4412_MUX_ADDR_VALUE << EXYNOS4412_MUX_ADDR_SHIFT);
 
 	con &= ~(EXYNOS_TMU_REF_VOLTAGE_MASK << EXYNOS_TMU_REF_VOLTAGE_SHIFT);
 	con |= data->reference_voltage << EXYNOS_TMU_REF_VOLTAGE_SHIFT;
 
 	con &= ~(EXYNOS_TMU_BUF_SLOPE_SEL_MASK << EXYNOS_TMU_BUF_SLOPE_SEL_SHIFT);
-	con |= (data->gain << EXYNOS_TMU_BUF_SLOPE_SEL_SHIFT);
+	con |= data->variant->gain << EXYNOS_TMU_BUF_SLOPE_SEL_SHIFT;
 
 	con &= ~(EXYNOS_TMU_TRIP_MODE_MASK << EXYNOS_TMU_TRIP_MODE_SHIFT);
-	con |= (EXYNOS_NOISE_CANCEL_MODE << EXYNOS_TMU_TRIP_MODE_SHIFT);
+	con |= EXYNOS_NOISE_CANCEL_MODE << EXYNOS_TMU_TRIP_MODE_SHIFT;
 
 	return con;
 }
@@ -327,7 +340,7 @@ static void exynos_tmu_control(struct platform_device *pdev, bool on)
 
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
-	data->tmu_control(pdev, on);
+	data->variant->tmu_control(pdev, on);
 	data->enabled = on;
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
@@ -352,9 +365,8 @@ static void exynos_tmu_update_temp(struct exynos_tmu_data *data, int reg_off,
 	u16 tmu_temp_mask;
 	u32 th;
 
-	tmu_temp_mask =
-		(data->soc == SOC_ARCH_EXYNOS7) ? EXYNOS7_TMU_TEMP_MASK
-						: EXYNOS_TMU_TEMP_MASK;
+	tmu_temp_mask = (data->variant->soc == SOC_ARCH_EXYNOS7) ?
+		EXYNOS7_TMU_TEMP_MASK : EXYNOS_TMU_TEMP_MASK;
 
 	th = readl(data->base + reg_off);
 	th &= ~(tmu_temp_mask << bit_off);
@@ -444,12 +456,12 @@ static void exynos4412_tmu_initialize(struct platform_device *pdev)
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
 	unsigned int trim_info, ctrl;
 
-	if (data->soc == SOC_ARCH_EXYNOS3250 ||
-	    data->soc == SOC_ARCH_EXYNOS5250) {
+	if (data->variant->soc == SOC_ARCH_EXYNOS3250 ||
+	    data->variant->soc == SOC_ARCH_EXYNOS5250) {
 		ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON1);
 		ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
 		writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON1);
-	} else if (data->soc == SOC_ARCH_EXYNOS4412) {
+	} else if (data->variant->soc == SOC_ARCH_EXYNOS4412) {
 		ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON2);
 		ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
 		writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON2);
@@ -630,7 +642,7 @@ static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
 	struct exynos_tmu_data *data = thermal_zone_device_priv(tz);
 	int value, ret = 0;
 
-	if (!data || !data->tmu_read)
+	if (!data || !data->variant || !data->variant->tmu_read)
 		return -EINVAL;
 	else if (!data->enabled)
 		/*
@@ -642,7 +654,7 @@ static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
 
-	value = data->tmu_read(data);
+	value = data->variant->tmu_read(data);
 	if (value < 0)
 		ret = value;
 	else
@@ -663,7 +675,7 @@ static u32 get_emul_con_reg(struct exynos_tmu_data *data, unsigned int val,
 
 		val &= ~(EXYNOS_EMUL_TIME_MASK << EXYNOS_EMUL_TIME_SHIFT);
 		val |= (EXYNOS_EMUL_TIME << EXYNOS_EMUL_TIME_SHIFT);
-		if (data->soc == SOC_ARCH_EXYNOS7) {
+		if (data->variant->soc == SOC_ARCH_EXYNOS7) {
 			val &= ~(EXYNOS7_EMUL_DATA_MASK <<
 				EXYNOS7_EMUL_DATA_SHIFT);
 			val |= (temp_to_code(data, temp) <<
@@ -689,11 +701,11 @@ static void exynos4412_tmu_set_emulation(struct exynos_tmu_data *data,
 	unsigned int val;
 	u32 emul_con;
 
-	if (data->soc == SOC_ARCH_EXYNOS5260)
+	if (data->variant->soc == SOC_ARCH_EXYNOS5260)
 		emul_con = EXYNOS5260_EMUL_CON;
-	else if (data->soc == SOC_ARCH_EXYNOS5433)
+	else if (data->variant->soc == SOC_ARCH_EXYNOS5433)
 		emul_con = EXYNOS5433_TMU_EMUL_CON;
-	else if (data->soc == SOC_ARCH_EXYNOS7)
+	else if (data->variant->soc == SOC_ARCH_EXYNOS7)
 		emul_con = EXYNOS7_TMU_REG_EMUL_CON;
 	else
 		emul_con = EXYNOS_EMUL_CON;
@@ -708,7 +720,7 @@ static int exynos_tmu_set_emulation(struct thermal_zone_device *tz, int temp)
 	struct exynos_tmu_data *data = thermal_zone_device_priv(tz);
 	int ret = -EINVAL;
 
-	if (data->soc == SOC_ARCH_EXYNOS4210)
+	if (data->variant->soc == SOC_ARCH_EXYNOS4210)
 		goto out;
 
 	if (temp && temp < MCELSIUS)
@@ -716,7 +728,7 @@ static int exynos_tmu_set_emulation(struct thermal_zone_device *tz, int temp)
 
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
-	data->tmu_set_emulation(data, temp);
+	data->variant->tmu_set_emulation(data, temp);
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
 	return 0;
@@ -758,7 +770,7 @@ static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
 	clk_enable(data->clk);
 
 	/* TODO: take action based on particular interrupt */
-	data->tmu_clear_irqs(data);
+	data->variant->tmu_clear_irqs(data);
 
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
@@ -771,13 +783,13 @@ static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
 	unsigned int val_irq;
 	u32 tmu_intstat, tmu_intclear;
 
-	if (data->soc == SOC_ARCH_EXYNOS5260) {
+	if (data->variant->soc == SOC_ARCH_EXYNOS5260) {
 		tmu_intstat = EXYNOS5260_TMU_REG_INTSTAT;
 		tmu_intclear = EXYNOS5260_TMU_REG_INTCLEAR;
-	} else if (data->soc == SOC_ARCH_EXYNOS7) {
+	} else if (data->variant->soc == SOC_ARCH_EXYNOS7) {
 		tmu_intstat = EXYNOS7_TMU_REG_INTPEND;
 		tmu_intclear = EXYNOS7_TMU_REG_INTPEND;
-	} else if (data->soc == SOC_ARCH_EXYNOS5433) {
+	} else if (data->variant->soc == SOC_ARCH_EXYNOS5433) {
 		tmu_intstat = EXYNOS5433_TMU_REG_INTPEND;
 		tmu_intclear = EXYNOS5433_TMU_REG_INTPEND;
 	} else {
@@ -797,34 +809,204 @@ static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
 	writel(val_irq, data->base + tmu_intclear);
 }
 
+static const struct exynos_tmu_variant exynos3250_data = {
+	.soc = SOC_ARCH_EXYNOS3250,
+	.gain = 8,
+	.reference_voltage = 16,
+	.efuse_value = 55,
+	.min_efuse_value = 40,
+	.max_efuse_value = 100,
+	.tmu_set_low_temp = exynos4412_tmu_set_low_temp,
+	.tmu_set_high_temp = exynos4412_tmu_set_high_temp,
+	.tmu_disable_low = exynos4412_tmu_disable_low,
+	.tmu_disable_high = exynos4210_tmu_disable_high,
+	.tmu_set_crit_temp = exynos4412_tmu_set_crit_temp,
+	.tmu_initialize = exynos4412_tmu_initialize,
+	.tmu_control = exynos4210_tmu_control,
+	.tmu_read = exynos4412_tmu_read,
+	.tmu_set_emulation = exynos4412_tmu_set_emulation,
+	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+};
+
+static const struct exynos_tmu_variant exynos4210_data = {
+	.soc = SOC_ARCH_EXYNOS4210,
+	.gain = 15,
+	.reference_voltage = 7,
+	.efuse_value = 55,
+	.min_efuse_value = 40,
+	.max_efuse_value = 100,
+	.tmu_set_low_temp = exynos4210_tmu_set_low_temp,
+	.tmu_set_high_temp = exynos4210_tmu_set_high_temp,
+	.tmu_disable_low = exynos4210_tmu_disable_low,
+	.tmu_disable_high = exynos4210_tmu_disable_high,
+	.tmu_set_crit_temp = exynos4210_tmu_set_crit_temp,
+	.tmu_initialize = exynos4210_tmu_initialize,
+	.tmu_control = exynos4210_tmu_control,
+	.tmu_read = exynos4210_tmu_read,
+	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+};
+
+static const struct exynos_tmu_variant exynos4412_data = {
+	.soc = SOC_ARCH_EXYNOS4412,
+	.gain = 8,
+	.reference_voltage = 16,
+	.efuse_value = 55,
+	.min_efuse_value = 40,
+	.max_efuse_value = 100,
+	.tmu_set_low_temp = exynos4412_tmu_set_low_temp,
+	.tmu_set_high_temp = exynos4412_tmu_set_high_temp,
+	.tmu_disable_low = exynos4412_tmu_disable_low,
+	.tmu_disable_high = exynos4210_tmu_disable_high,
+	.tmu_set_crit_temp = exynos4412_tmu_set_crit_temp,
+	.tmu_initialize = exynos4412_tmu_initialize,
+	.tmu_control = exynos4210_tmu_control,
+	.tmu_read = exynos4412_tmu_read,
+	.tmu_set_emulation = exynos4412_tmu_set_emulation,
+	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+};
+
+static const struct exynos_tmu_variant exynos5250_data = {
+	.soc = SOC_ARCH_EXYNOS5250,
+	.gain = 8,
+	.reference_voltage = 16,
+	.efuse_value = 55,
+	.min_efuse_value = 40,
+	.max_efuse_value = 100,
+	.tmu_set_low_temp = exynos4412_tmu_set_low_temp,
+	.tmu_set_high_temp = exynos4412_tmu_set_high_temp,
+	.tmu_disable_low = exynos4412_tmu_disable_low,
+	.tmu_disable_high = exynos4210_tmu_disable_high,
+	.tmu_set_crit_temp = exynos4412_tmu_set_crit_temp,
+	.tmu_initialize = exynos4412_tmu_initialize,
+	.tmu_control = exynos4210_tmu_control,
+	.tmu_read = exynos4412_tmu_read,
+	.tmu_set_emulation = exynos4412_tmu_set_emulation,
+	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+};
+
+static const struct exynos_tmu_variant exynos5260_data = {
+	.soc = SOC_ARCH_EXYNOS5260,
+	.gain = 8,
+	.reference_voltage = 16,
+	.efuse_value = 55,
+	.min_efuse_value = 40,
+	.max_efuse_value = 100,
+	.tmu_set_low_temp = exynos4412_tmu_set_low_temp,
+	.tmu_set_high_temp = exynos4412_tmu_set_high_temp,
+	.tmu_disable_low = exynos4412_tmu_disable_low,
+	.tmu_disable_high = exynos4210_tmu_disable_high,
+	.tmu_set_crit_temp = exynos4412_tmu_set_crit_temp,
+	.tmu_initialize = exynos4412_tmu_initialize,
+	.tmu_control = exynos4210_tmu_control,
+	.tmu_read = exynos4412_tmu_read,
+	.tmu_set_emulation = exynos4412_tmu_set_emulation,
+	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+};
+
+static const struct exynos_tmu_variant exynos5420_data = {
+	.soc = SOC_ARCH_EXYNOS5420,
+	.gain = 8,
+	.reference_voltage = 16,
+	.efuse_value = 55,
+	.min_efuse_value = 16,
+	.max_efuse_value = 76,
+	.tmu_set_low_temp = exynos4412_tmu_set_low_temp,
+	.tmu_set_high_temp = exynos4412_tmu_set_high_temp,
+	.tmu_disable_low = exynos4412_tmu_disable_low,
+	.tmu_disable_high = exynos4210_tmu_disable_high,
+	.tmu_set_crit_temp = exynos4412_tmu_set_crit_temp,
+	.tmu_initialize = exynos4412_tmu_initialize,
+	.tmu_control = exynos4210_tmu_control,
+	.tmu_read = exynos4412_tmu_read,
+	.tmu_set_emulation = exynos4412_tmu_set_emulation,
+	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+};
+
+static const struct exynos_tmu_variant exynos5420_triminfo_data = {
+	.soc = SOC_ARCH_EXYNOS5420_TRIMINFO,
+	.gain = 8,
+	.reference_voltage = 16,
+	.efuse_value = 55,
+	.min_efuse_value = 16,
+	.max_efuse_value = 76,
+	.tmu_set_low_temp = exynos4412_tmu_set_low_temp,
+	.tmu_set_high_temp = exynos4412_tmu_set_high_temp,
+	.tmu_disable_low = exynos4412_tmu_disable_low,
+	.tmu_disable_high = exynos4210_tmu_disable_high,
+	.tmu_set_crit_temp = exynos4412_tmu_set_crit_temp,
+	.tmu_initialize = exynos4412_tmu_initialize,
+	.tmu_control = exynos4210_tmu_control,
+	.tmu_read = exynos4412_tmu_read,
+	.tmu_set_emulation = exynos4412_tmu_set_emulation,
+	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+};
+
+static const struct exynos_tmu_variant exynos5433_data = {
+	.soc = SOC_ARCH_EXYNOS5433,
+	.gain = 8,
+	.reference_voltage = 16,
+	.efuse_value = 75,
+	.min_efuse_value = 40,
+	.max_efuse_value = 150,
+	.tmu_set_low_temp = exynos5433_tmu_set_low_temp,
+	.tmu_set_high_temp = exynos5433_tmu_set_high_temp,
+	.tmu_disable_low = exynos5433_tmu_disable_low,
+	.tmu_disable_high = exynos5433_tmu_disable_high,
+	.tmu_set_crit_temp = exynos5433_tmu_set_crit_temp,
+	.tmu_initialize = exynos5433_tmu_initialize,
+	.tmu_control = exynos5433_tmu_control,
+	.tmu_read = exynos4412_tmu_read,
+	.tmu_set_emulation = exynos4412_tmu_set_emulation,
+	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+};
+
+static const struct exynos_tmu_variant exynos7_data = {
+	.soc = SOC_ARCH_EXYNOS7,
+	.gain = 9,
+	.reference_voltage = 17,
+	.efuse_value = 75,
+	.min_efuse_value = 15,
+	.max_efuse_value = 100,
+	.tmu_set_low_temp = exynos7_tmu_set_low_temp,
+	.tmu_set_high_temp = exynos7_tmu_set_high_temp,
+	.tmu_disable_low = exynos7_tmu_disable_low,
+	.tmu_disable_high = exynos7_tmu_disable_high,
+	.tmu_set_crit_temp = exynos7_tmu_set_crit_temp,
+	.tmu_initialize = exynos7_tmu_initialize,
+	.tmu_control = exynos7_tmu_control,
+	.tmu_read = exynos7_tmu_read,
+	.tmu_set_emulation = exynos4412_tmu_set_emulation,
+	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+};
+
 static const struct of_device_id exynos_tmu_match[] = {
 	{
 		.compatible = "samsung,exynos3250-tmu",
-		.data = (const void *)SOC_ARCH_EXYNOS3250,
+		.data = &exynos3250_data,
 	}, {
 		.compatible = "samsung,exynos4210-tmu",
-		.data = (const void *)SOC_ARCH_EXYNOS4210,
+		.data = &exynos4210_data,
 	}, {
 		.compatible = "samsung,exynos4412-tmu",
-		.data = (const void *)SOC_ARCH_EXYNOS4412,
+		.data = &exynos4412_data,
 	}, {
 		.compatible = "samsung,exynos5250-tmu",
-		.data = (const void *)SOC_ARCH_EXYNOS5250,
+		.data = &exynos5250_data,
 	}, {
 		.compatible = "samsung,exynos5260-tmu",
-		.data = (const void *)SOC_ARCH_EXYNOS5260,
+		.data = &exynos5260_data,
 	}, {
 		.compatible = "samsung,exynos5420-tmu",
-		.data = (const void *)SOC_ARCH_EXYNOS5420,
+		.data = &exynos5420_data,
 	}, {
 		.compatible = "samsung,exynos5420-tmu-ext-triminfo",
-		.data = (const void *)SOC_ARCH_EXYNOS5420_TRIMINFO,
+		.data = &exynos5420_triminfo_data,
 	}, {
 		.compatible = "samsung,exynos5433-tmu",
-		.data = (const void *)SOC_ARCH_EXYNOS5433,
+		.data = &exynos5433_data,
 	}, {
 		.compatible = "samsung,exynos7-tmu",
-		.data = (const void *)SOC_ARCH_EXYNOS7,
+		.data = &exynos7_data,
 	},
 	{ },
 };
@@ -855,108 +1037,18 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		return -EADDRNOTAVAIL;
 	}
 
-	data->soc = (uintptr_t)of_device_get_match_data(&pdev->dev);
-
-	switch (data->soc) {
-	case SOC_ARCH_EXYNOS4210:
-		data->tmu_set_low_temp = exynos4210_tmu_set_low_temp;
-		data->tmu_set_high_temp = exynos4210_tmu_set_high_temp;
-		data->tmu_disable_low = exynos4210_tmu_disable_low;
-		data->tmu_disable_high = exynos4210_tmu_disable_high;
-		data->tmu_set_crit_temp = exynos4210_tmu_set_crit_temp;
-		data->tmu_initialize = exynos4210_tmu_initialize;
-		data->tmu_control = exynos4210_tmu_control;
-		data->tmu_read = exynos4210_tmu_read;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
-		data->gain = 15;
-		data->reference_voltage = 7;
-		data->efuse_value = 55;
-		data->min_efuse_value = 40;
-		data->max_efuse_value = 100;
-		break;
-	case SOC_ARCH_EXYNOS3250:
-	case SOC_ARCH_EXYNOS4412:
-	case SOC_ARCH_EXYNOS5250:
-	case SOC_ARCH_EXYNOS5260:
-		data->tmu_set_low_temp = exynos4412_tmu_set_low_temp;
-		data->tmu_set_high_temp = exynos4412_tmu_set_high_temp;
-		data->tmu_disable_low = exynos4412_tmu_disable_low;
-		data->tmu_disable_high = exynos4210_tmu_disable_high;
-		data->tmu_set_crit_temp = exynos4412_tmu_set_crit_temp;
-		data->tmu_initialize = exynos4412_tmu_initialize;
-		data->tmu_control = exynos4210_tmu_control;
-		data->tmu_read = exynos4412_tmu_read;
-		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
-		data->gain = 8;
-		data->reference_voltage = 16;
-		data->efuse_value = 55;
-		data->min_efuse_value = 40;
-		data->max_efuse_value = 100;
-		break;
-	case SOC_ARCH_EXYNOS5420:
-	case SOC_ARCH_EXYNOS5420_TRIMINFO:
-		data->tmu_set_low_temp = exynos4412_tmu_set_low_temp;
-		data->tmu_set_high_temp = exynos4412_tmu_set_high_temp;
-		data->tmu_disable_low = exynos4412_tmu_disable_low;
-		data->tmu_disable_high = exynos4210_tmu_disable_high;
-		data->tmu_set_crit_temp = exynos4412_tmu_set_crit_temp;
-		data->tmu_initialize = exynos4412_tmu_initialize;
-		data->tmu_control = exynos4210_tmu_control;
-		data->tmu_read = exynos4412_tmu_read;
-		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
-		data->gain = 8;
-		data->reference_voltage = 16;
-		data->efuse_value = 55;
-		/* Valid efuse range according to the Exynos5422 user manual. */
-		data->min_efuse_value = 16;
-		data->max_efuse_value = 76;
-		break;
-	case SOC_ARCH_EXYNOS5433:
-		data->tmu_set_low_temp = exynos5433_tmu_set_low_temp;
-		data->tmu_set_high_temp = exynos5433_tmu_set_high_temp;
-		data->tmu_disable_low = exynos5433_tmu_disable_low;
-		data->tmu_disable_high = exynos5433_tmu_disable_high;
-		data->tmu_set_crit_temp = exynos5433_tmu_set_crit_temp;
-		data->tmu_initialize = exynos5433_tmu_initialize;
-		data->tmu_control = exynos5433_tmu_control;
-		data->tmu_read = exynos4412_tmu_read;
-		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
-		data->gain = 8;
-		if (res.start == EXYNOS5433_G3D_BASE)
-			data->reference_voltage = 23;
-		else
-			data->reference_voltage = 16;
-		data->efuse_value = 75;
-		data->min_efuse_value = 40;
-		data->max_efuse_value = 150;
-		break;
-	case SOC_ARCH_EXYNOS7:
-		data->tmu_set_low_temp = exynos7_tmu_set_low_temp;
-		data->tmu_set_high_temp = exynos7_tmu_set_high_temp;
-		data->tmu_disable_low = exynos7_tmu_disable_low;
-		data->tmu_disable_high = exynos7_tmu_disable_high;
-		data->tmu_set_crit_temp = exynos7_tmu_set_crit_temp;
-		data->tmu_initialize = exynos7_tmu_initialize;
-		data->tmu_control = exynos7_tmu_control;
-		data->tmu_read = exynos7_tmu_read;
-		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
-		data->gain = 9;
-		data->reference_voltage = 17;
-		data->efuse_value = 75;
-		data->min_efuse_value = 15;
-		data->max_efuse_value = 100;
-		break;
-	default:
-		dev_err(&pdev->dev, "Platform not supported\n");
+	data->variant = of_device_get_match_data(&pdev->dev);
+	if (!data->variant)
 		return -EINVAL;
-	}
 
 	data->cal_type = TYPE_ONE_POINT_TRIMMING;
 
+	data->reference_voltage = data->variant->reference_voltage;
+
+	if (data->variant->soc == SOC_ARCH_EXYNOS5433 &&
+	    res.start == EXYNOS5433_G3D_BASE)
+		data->reference_voltage = 23;
+
 	return 0;
 }
 
@@ -968,13 +1060,13 @@ static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
 	clk_enable(data->clk);
 
 	if (low > INT_MIN)
-		data->tmu_set_low_temp(data, low / MCELSIUS);
+		data->variant->tmu_set_low_temp(data, low / MCELSIUS);
 	else
-		data->tmu_disable_low(data);
+		data->variant->tmu_disable_low(data);
 	if (high < INT_MAX)
-		data->tmu_set_high_temp(data, high / MCELSIUS);
+		data->variant->tmu_set_high_temp(data, high / MCELSIUS);
 	else
-		data->tmu_disable_high(data);
+		data->variant->tmu_disable_high(data);
 
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
@@ -1033,12 +1125,12 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(data->clk_sec),
 				     "Failed to get tmu_triminfo_apbif clock\n");
 
-	if (!data->clk_sec && data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
+	if (!data->clk_sec && data->variant->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
 		return dev_err_probe(dev, -ENOENT,
 				     "Failed to get tmu_triminfo_apbif clock\n");
 
-	if (data->soc == SOC_ARCH_EXYNOS5433 ||
-	    data->soc == SOC_ARCH_EXYNOS7) {
+	if (data->variant->soc == SOC_ARCH_EXYNOS5433 ||
+	    data->variant->soc == SOC_ARCH_EXYNOS7) {
 		data->sclk = devm_clk_get_enabled(dev, "tmu_sclk");
 		if (IS_ERR(data->sclk))
 			return dev_err_probe(dev, PTR_ERR(data->sclk),
-- 
2.55.0


