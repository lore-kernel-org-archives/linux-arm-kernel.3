Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C639C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgaiOiiIv8UyT/OK2no2aphPsCtckyR44JUNKUXKM+Y=; b=GgTlNSmZFJY6OPREhESDYs2mcT
	BTPNvpdpeDxm8oIzYaNqiyTYF15YPEgq0v9/JrF58dFZHuFoem3JOfIXLy4AIpaWltwoIWmPH5VwR
	pZRMujEKQuEs+W/ljMpFutWRNLa1K29eXFkuUqasS26Kk9ujBOrEcju8f1wgfciap4aAp+RYpCCXv
	kUQBvpB2A+FlJSNsOSOl3qztLN2OLdA99VoVJOqveH6tDEUaeP7kGg+ALAzS8X7bSpayBffcOyyf7
	LiBiErUf9GGBi/RbSGEQNnGqvw6+Ec2Q17QnS25ABmGvvTHRMqkGFGCwwquPOvVpY4Qs8EWBW7Gra
	Hz4n8/6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREaP-00000005EJh-26R3;
	Mon, 16 Jun 2025 18:29:37 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCrd-0000000526P-21BW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 16:39:18 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b2fc93728b2so3835446a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 09:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750091957; x=1750696757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgaiOiiIv8UyT/OK2no2aphPsCtckyR44JUNKUXKM+Y=;
        b=FRuIGXQDhqPKXZUYEK2rt/r0SopFZ3aNfZN9lcforB1MkwKNBuoqoXLYzwF3kYL7si
         dVM2tRiHwqMSl7SVBNUjRvdBv31I03tqfNL1JuwYRDq4zqRcxTLcS7KYGKcL0wwi8XnR
         Njn34OAx3R18bfUCN9OUkxJJsGyEZf4DnQkZZ6jyutclO3F+Azt6huWAJF6VtPADP3W6
         jTVXtRx4l+PhgVL3EvzOkMYfhGIGnGMV/QpVoTHZ4vEFjcPf1+U3F+/9PZApsAEw4ucy
         HLD2V1yo1ZG9GAnv2iXuyDzMJRii6pzZViYebxNm5sgXWwwCN3vDBvRb3gS45irANeyI
         /OaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750091957; x=1750696757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgaiOiiIv8UyT/OK2no2aphPsCtckyR44JUNKUXKM+Y=;
        b=ZFTCt3ij5AFJDkVShWJsveM7p7XN4QhmtIyl3m2uK+Ga6vE3X63+rzs4c1igDfYY0F
         CGFlX8MiTO2/l7nmvzvwfgNuRvjz1uOYkK//FW7nPQIaBNnMHqp7eIwgfN93tHbXc5k4
         3zLKMs0sbEmairapVAZ6797A6hViABqN8EwUD6DNp7JQeh+6NCIle1QtCBUtd9OwZBUz
         qw1pdLJU/CBrtCsiMHiIDsas9ncX/dpwWP6xbXI3g+rqnBmjCFx6JGwmUe/Q59tVucBc
         HY/dwEKAJZll9ATpMg+45C5D5AzdQqiz1qKv+SNI1ukMIXAXo6g0ftzMtxBleDqW3vT7
         pxHw==
X-Forwarded-Encrypted: i=1; AJvYcCWCf/oaFgs/vtN8Lj9+Y8c6lvHnJJ+WHpaTQid0OtGrQdZ9DWzmJxZs5Kf+87t4YrjMjZgk7+ZgC97fhQKGQrMR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3dYCwIySOh1PPlRQVv1AvhDFEsgQAxqn5CnHsHDIJNMIWBw51
	L7s+ck9Wn/4tsoVe8MLL5IumlUwD3CDjGAAxVyDsfaDXQMh+ulWhxysm
X-Gm-Gg: ASbGncv7Fz6O1nplDLvRyPJZiomiTptmgWqNNuRr9HylHmpZ0o6h83Ibcvx39aiYW1H
	Dzo+Vt30MK2ANNbrJemS6rI3qdO66lkInXR2TNe5XntjtD4rqUzQyyDBcuzzma3x8nisy68/fOv
	q/VLr1GwmRhAiryMsfJk2MHJ4IGzEP+cAmWkFYQkK7Tg6zMPxw2wouqZH3tAEXel5EwCN2Q1vCD
	FNKtN+efd34FKhf6+fOJ2ftnDCYnGqZtKnDCHfZK73MvktnEoqlBwNugg0xXRF2RfMMjr1uVd59
	/OBKxnFVupJ3QBZ+Bf7DVqy3Vvh7Cf/VGCGvva1SQn/mvX9vMVbxNGgb9/ltBwLjlws2AqDUd+x
	kmpgrplO7mw==
X-Google-Smtp-Source: AGHT+IHsD566uR2iJmA1x5dTinmhbSc92nzu4ptM9O+HZPszU2hE5Hk8Ch3KBvp7WkOFDhYtt71tSA==
X-Received: by 2002:a05:6a21:4a41:b0:218:75de:d924 with SMTP id adf61e73a8af0-21fbd631648mr13177925637.19.1750091956904;
        Mon, 16 Jun 2025 09:39:16 -0700 (PDT)
Received: from localhost.localdomain ([45.112.0.181])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680c6asm6067882a12.42.2025.06.16.09.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:39:16 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RRC v1 3/3] thermal/drivers/exynos: Refactor IRQ clear logic using SoC-specific config
Date: Mon, 16 Jun 2025 22:08:24 +0530
Message-ID: <20250616163831.8138-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616163831.8138-1-linux.amoon@gmail.com>
References: <20250616163831.8138-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_093917_568653_50F1D4F0 
X-CRM114-Status: GOOD (  17.31  )
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

Refactors the IRQ clear logic in the Exynos TMU driver to eliminate
redundant code and enhance maintainability. Previously, the driver
relied on multiple SoC-specific functions or conditional branching
based on data->soc to handle differences in IRQ register behavior.

Change introduces a unified exynos_tmu_clear_irqs() function
that adapts its behavior using SoC-specific configuration fields
(tmu_intstat, tmu_intclear, and irq_clear_direct) defined in the
exynos_tmu_data structure. These fields are initialized per SoC
during device setup.

This refactor reduces code duplication, simplifies the addition of
new SoC support, and improves overall code clarity.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 52 +++++++++++++++++-----------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index b7522b7b1230..cd21b36674c3 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -172,6 +172,9 @@ enum soc_type {
  *	0 < reference_voltage <= 31
  * @tzd: pointer to thermal_zone_device structure
  * @enabled: current status of TMU device
+ * @tmu_intstat: interrupt status register
+ * @tmu_intclear: interrupt clear register
+ * @irq_clear_support: SoC supports clear IRQ
  * @tmu_set_low_temp: SoC specific method to set trip (falling threshold)
  * @tmu_set_high_temp: SoC specific method to set trip (rising threshold)
  * @tmu_set_crit_temp: SoC specific method to set critical temperature
@@ -198,6 +201,9 @@ struct exynos_tmu_data {
 	u8 reference_voltage;
 	struct thermal_zone_device *tzd;
 	bool enabled;
+	u32 tmu_intstat;
+	u32 tmu_intclear;
+	bool irq_clear_support;
 
 	void (*tmu_set_low_temp)(struct exynos_tmu_data *data, u8 temp);
 	void (*tmu_set_high_temp)(struct exynos_tmu_data *data, u8 temp);
@@ -785,28 +791,15 @@ static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
 	return IRQ_HANDLED;
 }
 
-static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
+static void exynos_tmu_clear_irqs(struct exynos_tmu_data *data)
 {
 	unsigned int val_irq, clearirq = 0;
-	u32 tmu_intstat, tmu_intclear;
-
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
-	}
+	u32 tmu_intstat = data->tmu_intstat;
+	u32 tmu_intclear = data->tmu_intclear;
 
 	val_irq = readl(data->base + tmu_intstat);
 
-	if (data->soc == SOC_ARCH_EXYNOS4210) {
+	if (!data->irq_clear_support) {
 		writel(val_irq, data->base + tmu_intclear);
 		return;
 	}
@@ -900,12 +893,15 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->tmu_initialize = exynos4210_tmu_initialize;
 		data->tmu_control = exynos4210_tmu_control;
 		data->tmu_read = exynos4210_tmu_read;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
+		data->tmu_clear_irqs = exynos_tmu_clear_irqs;
 		data->gain = 15;
 		data->reference_voltage = 7;
 		data->efuse_value = 55;
 		data->min_efuse_value = 40;
 		data->max_efuse_value = 100;
+		data->tmu_intstat = EXYNOS_TMU_REG_INTSTAT;
+		data->tmu_intclear = EXYNOS_TMU_REG_INTCLEAR;
+		data->irq_clear_support = false;
 		break;
 	case SOC_ARCH_EXYNOS3250:
 	case SOC_ARCH_EXYNOS4412:
@@ -922,7 +918,7 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->tmu_control = exynos4210_tmu_control;
 		data->tmu_read = exynos4412_tmu_read;
 		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
+		data->tmu_clear_irqs = exynos_tmu_clear_irqs;
 		data->gain = 8;
 		data->reference_voltage = 16;
 		data->efuse_value = 55;
@@ -932,6 +928,14 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		else
 			data->min_efuse_value = 0;
 		data->max_efuse_value = 100;
+		data->irq_clear_support = true;
+		if (data->soc == SOC_ARCH_EXYNOS5260) {
+			data->tmu_intstat = EXYNOS5260_TMU_REG_INTSTAT;
+			data->tmu_intclear = EXYNOS5260_TMU_REG_INTCLEAR;
+		} else {
+			data->tmu_intstat = EXYNOS_TMU_REG_INTSTAT;
+			data->tmu_intclear = EXYNOS_TMU_REG_INTCLEAR;
+		}
 		break;
 	case SOC_ARCH_EXYNOS5433:
 		data->tmu_set_low_temp = exynos5433_tmu_set_low_temp;
@@ -943,7 +947,7 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->tmu_control = exynos5433_tmu_control;
 		data->tmu_read = exynos4412_tmu_read;
 		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
+		data->tmu_clear_irqs = exynos_tmu_clear_irqs;
 		data->gain = 8;
 		if (res.start == EXYNOS5433_G3D_BASE)
 			data->reference_voltage = 23;
@@ -952,6 +956,9 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->efuse_value = 75;
 		data->min_efuse_value = 40;
 		data->max_efuse_value = 150;
+		data->tmu_intstat = EXYNOS5433_TMU_REG_INTPEND;
+		data->tmu_intclear = EXYNOS5433_TMU_REG_INTPEND;
+		data->irq_clear_support = true;
 		break;
 	case SOC_ARCH_EXYNOS7:
 		data->tmu_set_low_temp = exynos7_tmu_set_low_temp;
@@ -963,12 +970,15 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->tmu_control = exynos7_tmu_control;
 		data->tmu_read = exynos7_tmu_read;
 		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
-		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
+		data->tmu_clear_irqs = exynos_tmu_clear_irqs;
 		data->gain = 9;
 		data->reference_voltage = 17;
 		data->efuse_value = 75;
 		data->min_efuse_value = 15;
 		data->max_efuse_value = 100;
+		data->tmu_intstat = EXYNOS7_TMU_REG_INTPEND;
+		data->tmu_intclear = EXYNOS7_TMU_REG_INTPEND;
+		data->irq_clear_support = true;
 		break;
 	default:
 		dev_err(&pdev->dev, "Platform not supported\n");
-- 
2.49.0


