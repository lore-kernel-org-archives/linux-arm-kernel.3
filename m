Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A638C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMqGPn5i1dBgX26P0LPYzxtUAGEpZYYhsp9BiJes8v0=; b=KzS60tDyzIqzS61KuBuabT+dPV
	o1AxK/Sl1yFqXe/oJGUok2+7PR2C4eKxBy6X0ZIdLNfwsNMt0VSTpC1fLWByQLktfQpnIgXieWHmq
	CX1QkEGPvLFqt6+aVUq/k8lq9xKxto3cCCiUerhyj5qTg79U0NY+DtbiE2ord0QnsTv7NlwF4ftqj
	P0RJpt0uCwJw6mTLYkRIJdREhTegLRik6lba7qLffZ6LgMCx26moYHBPzd7kg74fjizK7SeE6+yZ+
	H5wFS+BA8gQ8P5cDgDcWoL+bY9piiiK8jQrt1EMl7bsuPQsi4ekcRDCgVn+P/DgeHkBYhdmJ6a2r5
	+SFc/QmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umC1U-0000000Dr2u-0CCr;
	Wed, 13 Aug 2025 14:00:12 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBG5-0000000Dj6G-0yCS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:11:14 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-31efefd2655so702552a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 06:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755090672; x=1755695472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMqGPn5i1dBgX26P0LPYzxtUAGEpZYYhsp9BiJes8v0=;
        b=dDW+t6MUx9AhlZIpOalfneU3AmMe1MVB36VW7szrkF/ygDTH0VS68WTRSu0bwzm7DY
         qFNIfo694rX9+OTjfzNl+u+ryeVnyGH2oely20ISG5yaSwsKDQEf4uYJF0akRrGc9Xe6
         8huNniI3nO86pdponXJVmPnM8cORp2kgqkj2/Tzd9yU8b0Krtryr2TIu/itiqPQgjIjj
         osa5PKTqdIyHTqWsmlkjG9bdUXQeo4FBeUn/YegbvYGkJBinIApEcwFPPGEFRFgAsnUd
         /6EAysGEgTa0ZrhRuyeMD174ZaM9AvEVgitYvxM7rRvr1bfNkPMIBDSarz7JJ2RNsJya
         AUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755090672; x=1755695472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMqGPn5i1dBgX26P0LPYzxtUAGEpZYYhsp9BiJes8v0=;
        b=S70tZWv56zHuyTnzABLAdo6qr0giaoAW+ri3qs6sFeeOEwcSFM/MOT+/yknKzK4eOQ
         fRsypAyf9+H3Fr2+D7RchAhrxi4/5Ol5dcfGB2U5c79cIswilltG3LKA+BxrwA+j4L9T
         3Xe16ZPfbWGbqGjV3pFD1booaiLvGwv38qPrZ7CQ2gpU/ubriR/NBQ//fETSPaPHYXwX
         kvnpqfN3gc1juV7S6VLu4BO27NsQ0xhvlUryJSUZHK13NEAor+cAg4CNl6MRCpy4IbNx
         Vk6Aya5EYf9B5Bi3hNEKK+fmWagZan0WN7PIHwXp5pK+zLMuVVSatDVyzG0QemS67fuh
         PWKg==
X-Forwarded-Encrypted: i=1; AJvYcCVoCmpM6s4xdwelF4xL0F8CPhHN7OsFJULlNIgauTRiAOEqgNxQ/dGdxCNzV9/ANUOY6rGR0V0jHKLYPS9wBFme@lists.infradead.org
X-Gm-Message-State: AOJu0YxJz1y64iHRnyXTsip0Gal8fhRnSYTjD0PuDDRVwAPIt/p2N79l
	+HUT0oBNPenJvG6wVvjkETTWAUOXslGeZ4Zbd4N0wh4eeHgMyL6KmTR2
X-Gm-Gg: ASbGnctlttEmwpJ18AbVtOKAA9S2na5iaM3ULpMox+iaARehxQZynmiXvQaUeJjem7a
	k6ci9TdAAOXjsTl1aKMJxF4+Awl+Svhc8HUyQOf+plfLDcyB1xFrT/FJaVU7BHGLL+2iITbd+7q
	zIoqgwPhIapzPGxHtA9Wr22FM8zaJQUNMaATP8blT3wL2WdHUe4mR9Br/L1uOe6+xirPXTWjhsf
	og/icCA5hXtv2qGh4RHD/SbV9ywdS/foaT8v68IWV++We8KuZ1rvsgqGcq+UWYA31iAogVrO22I
	qBNysqq1pctC7Uqx+Kyjv2osfDUwWwYwlbQseUFjBwU1t535kyT4YeYuojrw+lEKuBWY3lA6+Gk
	pn2t1e/9Akbd0T4S+0scYA2dMQ6ze01M=
X-Google-Smtp-Source: AGHT+IEPKcFPf/H6yHGsr0sS7omSEBlqNNcKUaAqL1joOuoGej9xA/Vpwpo3atGz6DL927Y0FQPKsg==
X-Received: by 2002:a17:90a:c2c8:b0:320:e145:26f3 with SMTP id 98e67ed59e1d1-321d27e34cbmr3948954a91.8.1755090672310;
        Wed, 13 Aug 2025 06:11:12 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32325765df6sm161504a91.12.2025.08.13.06.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:11:11 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Mateusz Majewski <m.majewski2@samsung.com>
Subject: [PATCH v7 7/7] thermal/drivers/exynos: Refactor IRQ clear logic using SoC-specific config
Date: Wed, 13 Aug 2025 18:39:51 +0530
Message-ID: <20250813131007.343402-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813131007.343402-1-linux.amoon@gmail.com>
References: <20250813131007.343402-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_061113_270468_9E480F90 
X-CRM114-Status: GOOD (  20.04  )
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

The Exynos TMU driver's IRQ clear logic has been refactored for improved
maintainability and reduced code duplication. A unified
exynos4210_tmu_clear_irqs() implementation now replaces the previous
reliance on SoC-specific functions and hardcoded register mappings.
This new implementation leverages SoC-specific configuration fields
(tmu_intstat, tmu_intclear, and IRQ bit mappings) stored within
exynos_tmu_data. These fields are populated during device setup within
exynos_map_dt_data(), thereby streamlining new SoC integration, ensuring
correct interrupt handling, and improving code clarity. This refactor
simplifies the addition of new SoC support, ensures correct interrupt
handling across platforms, and improves overall code clarity.

Cc: Mateusz Majewski <m.majewski2@samsung.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v7: new patch in this series
    split the IRQ function handler per SoC.
---
 drivers/thermal/samsung/exynos_tmu.c | 150 +++++++++++++++++----------
 1 file changed, 96 insertions(+), 54 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 5e581055e3f3..9f94c58e1e74 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -158,6 +158,8 @@ enum soc_type {
  *	0 < reference_voltage <= 31
  * @tzd: pointer to thermal_zone_device structure
  * @enabled: current status of TMU device
+ * @tmu_intstat: interrupt status register
+ * @tmu_intclear: interrupt clear register
  * @tmu_set_low_temp: SoC specific method to set trip (falling threshold)
  * @tmu_set_high_temp: SoC specific method to set trip (rising threshold)
  * @tmu_set_crit_temp: SoC specific method to set critical temperature
@@ -184,6 +186,8 @@ struct exynos_tmu_data {
 	u8 reference_voltage;
 	struct thermal_zone_device *tzd;
 	bool enabled;
+	u32 tmu_intstat;
+	u32 tmu_intclear;
 
 	void (*tmu_set_low_temp)(struct exynos_tmu_data *data, u8 temp);
 	void (*tmu_set_high_temp)(struct exynos_tmu_data *data, u8 temp);
@@ -770,67 +774,90 @@ static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
 }
 
 static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
+{
+	unsigned int val_irq;
+	u32 tmu_intstat = data->tmu_intstat;
+	u32 tmu_intclear = data->tmu_intclear;
+
+	val_irq = readl(data->base + tmu_intstat);
+
+	/* Exynos4210 doesn't support FALL interrupts */
+	writel(val_irq, data->base + tmu_intclear);
+}
+
+static void exynos4412_tmu_clear_irqs(struct exynos_tmu_data *data)
 {
 	unsigned int val_irq, clear_irq = 0;
-	u32 tmu_intstat, tmu_intclear;
+	u32 tmu_intstat = data->tmu_intstat;
+	u32 tmu_intclear = data->tmu_intclear;
 	struct tmu_irq_map irq_map = {0};
 
-	if (data->soc == SOC_ARCH_EXYNOS5260) {
-		tmu_intstat = EXYNOS5260_TMU_REG_INTSTAT;
-		tmu_intclear = EXYNOS5260_TMU_REG_INTCLEAR;
-	} else if (data->soc == SOC_ARCH_EXYNOS7) {
-		tmu_intstat = EXYNOS7_TMU_REG_INTPEND;
-		tmu_intclear = EXYNOS7_TMU_REG_INTPEND;
-	} else if (data->soc == SOC_ARCH_EXYNOS5433) {
-		tmu_intstat = EXYNOS5433_TMU_REG_INTPEND;
-		tmu_intclear = EXYNOS5433_TMU_REG_INTPEND;
-	} else {
-		tmu_intstat = EXYNOS_TMU_REG_INTSTAT;
-		tmu_intclear = EXYNOS_TMU_REG_INTCLEAR;
+	val_irq = readl(data->base + tmu_intstat);
+
+	/* Set SoC-specific interrupt bit mappings */
+	irq_map.fall[2] = BIT(20);
+	irq_map.fall[1] = BIT(16);
+	irq_map.fall[0] = BIT(12);
+	irq_map.rise[2] = BIT(8);
+	irq_map.rise[1] = BIT(4);
+	irq_map.rise[0] = BIT(0);
+
+	/* Map active INTSTAT bits to INTCLEAR */
+	for (int i = 0; i < 3; i++) {
+		if (val_irq & irq_map.fall[i])
+			clear_irq |= irq_map.fall[i];
+		if (val_irq & irq_map.rise[i])
+			clear_irq |= irq_map.rise[i];
 	}
 
+	if (clear_irq)
+		writel(clear_irq, data->base + tmu_intclear);
+}
+
+static void exynos5420_tmu_clear_irqs(struct exynos_tmu_data *data)
+{
+	unsigned int val_irq, clear_irq = 0;
+	u32 tmu_intstat = data->tmu_intstat;
+	u32 tmu_intclear = data->tmu_intclear;
+	struct tmu_irq_map irq_map = {0};
+
 	val_irq = readl(data->base + tmu_intstat);
 
-	/* Exynos4210 doesn't support FALL interrupts */
-	if (data->soc == SOC_ARCH_EXYNOS4210) {
-		writel(val_irq, data->base + tmu_intclear);
-		return;
+	/* Set SoC-specific interrupt bit mappings */
+	irq_map.fall[2] = BIT(24);
+	irq_map.fall[1] = BIT(20);
+	irq_map.fall[0] = BIT(16);
+	irq_map.rise[2] = BIT(8);
+	irq_map.rise[1] = BIT(4);
+	irq_map.rise[0] = BIT(0);
+
+	for (int i = 0; i < 3; i++) {
+		if (val_irq & irq_map.fall[i])
+			clear_irq |= irq_map.fall[i];
+		if (val_irq & irq_map.rise[i])
+			clear_irq |= irq_map.rise[i];
 	}
 
+	if (clear_irq)
+		writel(clear_irq, data->base + tmu_intclear);
+}
+
+static void exynos5433_tmu_clear_irqs(struct exynos_tmu_data *data)
+{
+	unsigned int val_irq, clear_irq = 0;
+	u32 tmu_intstat = data->tmu_intstat;
+	u32 tmu_intclear = data->tmu_intclear;
+	struct tmu_irq_map irq_map = {0};
+
+	val_irq = readl(data->base + tmu_intstat);
+
 	/* Set SoC-specific interrupt bit mappings */
-	switch (data->soc) {
-	case SOC_ARCH_EXYNOS3250:
-	case SOC_ARCH_EXYNOS4412:
-	case SOC_ARCH_EXYNOS5250:
-	case SOC_ARCH_EXYNOS5260:
-		irq_map.fall[2] = BIT(20);
-		irq_map.fall[1] = BIT(16);
-		irq_map.fall[0] = BIT(12);
-		irq_map.rise[2] = BIT(8);
-		irq_map.rise[1] = BIT(4);
-		irq_map.rise[0] = BIT(0);
-		break;
-	case SOC_ARCH_EXYNOS5420:
-	case SOC_ARCH_EXYNOS5420_TRIMINFO:
-		irq_map.fall[2] = BIT(24);
-		irq_map.fall[1] = BIT(20);
-		irq_map.fall[0] = BIT(16);
-		irq_map.rise[2] = BIT(8);
-		irq_map.rise[1] = BIT(4);
-		irq_map.rise[0] = BIT(0);
-		break;
-	case SOC_ARCH_EXYNOS5433:
-	case SOC_ARCH_EXYNOS7:
-		irq_map.fall[2] = BIT(23);
-		irq_map.fall[1] = BIT(17);
-		irq_map.fall[0] = BIT(16);
-		irq_map.rise[2] = BIT(7);
-		irq_map.rise[1] = BIT(1);
-		irq_map.rise[0] = BIT(0);
-		break;
-	default:
-		pr_warn("exynos-tmu: Unknown SoC type %d, using fallback IRQ mapping\n", soc);
-		break;
+	irq_map.fall[2] = BIT(23);
+	irq_map.fall[1] = BIT(17);
+	irq_map.fall[0] = BIT(16);
+	irq_map.rise[2] = BIT(7);
+	irq_map.rise[1] = BIT(1);
+	irq_map.rise[0] = BIT(0);
 
 	/* Map active INTSTAT bits to INTCLEAR */
 	for (int i = 0; i < 3; i++) {
@@ -915,6 +942,8 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->tmu_control = exynos4210_tmu_control;
 		data->tmu_read = exynos4210_tmu_read;
 		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
+		data->tmu_intstat = EXYNOS_TMU_REG_INTSTAT;
+		data->tmu_intclear = EXYNOS_TMU_REG_INTCLEAR;
 		data->gain = 15;
 		data->reference_voltage = 7;
 		data->efuse_value = 55;
@@ -934,7 +963,14 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->tmu_control = exynos4210_tmu_control;
 		data->tmu_read = exynos4412_tmu_read;
 		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
+		data->tmu_clear_irqs = exynos4412_tmu_clear_irqs;
+		if (data->soc == SOC_ARCH_EXYNOS5260) {
+			data->tmu_intstat = EXYNOS5260_TMU_REG_INTSTAT;
+			data->tmu_intclear = EXYNOS5260_TMU_REG_INTCLEAR;
+		} else {
+			data->tmu_intstat = EXYNOS_TMU_REG_INTSTAT;
+			data->tmu_intclear = EXYNOS_TMU_REG_INTCLEAR;
+		}
 		data->gain = 8;
 		data->reference_voltage = 16;
 		data->efuse_value = 55;
@@ -952,7 +988,9 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->tmu_control = exynos4210_tmu_control;
 		data->tmu_read = exynos4412_tmu_read;
 		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
+		data->tmu_clear_irqs = exynos5420_tmu_clear_irqs;
+		data->tmu_intstat = EXYNOS_TMU_REG_INTSTAT;
+		data->tmu_intclear = EXYNOS_TMU_REG_INTCLEAR;
 		data->gain = 8;
 		data->reference_voltage = 16;
 		data->efuse_value = 55;
@@ -969,7 +1007,9 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->tmu_control = exynos5433_tmu_control;
 		data->tmu_read = exynos4412_tmu_read;
 		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
+		data->tmu_clear_irqs = exynos5433_tmu_clear_irqs;
+		data->tmu_intstat = EXYNOS5433_TMU_REG_INTPEND;
+		data->tmu_intclear = EXYNOS5433_TMU_REG_INTPEND;
 		data->gain = 8;
 		if (res.start == EXYNOS5433_G3D_BASE)
 			data->reference_voltage = 23;
@@ -989,7 +1029,9 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->tmu_control = exynos7_tmu_control;
 		data->tmu_read = exynos7_tmu_read;
 		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
+		data->tmu_clear_irqs = exynos5433_tmu_clear_irqs;
+		data->tmu_intstat = EXYNOS7_TMU_REG_INTPEND;
+		data->tmu_intclear = EXYNOS7_TMU_REG_INTPEND;
 		data->gain = 9;
 		data->reference_voltage = 17;
 		data->efuse_value = 75;
-- 
2.50.1


