Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20979CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 01:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nqcRE4ZV9h59aWUDKIwLPgkTSVEiGSZVcumouuNOvKo=; b=tfXpHHt7TK58xfzbLm4/hpIptK
	ltn0oDaTGa0G48TLscPz49rQLqL7SU8qkfLkfwcs9rloa5RrRSxfwdN2zMJrzR4ZCMDhW37o8f+mL
	47olKi6qu4m8Xp9YE3oPlldHPaz4jieiqJW9F3MEAHSFRlINH1zoarm6khp3G5HhFZTNSffdjGnsu
	J3q6oSRJLOuoAyrfAFFDZcNUKoe8PVL6UwuYnyo9ex+Pl8I4R9kdsG2P3ytxL7U/DMl9nfJ5LB3Ew
	W1jgjweF0WfTanZ7THcIV3U2Yy2qvUqG/vQcR233+8OLFnmMT+M7bGtXRwzjM5w5JlVn/+aqF7oJF
	DkWmdcDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUaRM-0000000E34m-3IOH;
	Wed, 03 Jun 2026 01:30:40 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUaRK-0000000E34H-1cBN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 01:30:39 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8ccea53f35cso54753976d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 18:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780450237; x=1781055037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nqcRE4ZV9h59aWUDKIwLPgkTSVEiGSZVcumouuNOvKo=;
        b=VLyptDnc6KW6/JOnOryT2BdE3vTaQx6Ef20/e6DPFNXYQ3rYG/0OM1Rfp8K/jpsa/s
         uoF4OadvPTvCY3raZnWODQcmkDCt/LSOFl6HeFo9dyeAirtQT36CWetR5KgFbV+5lj+4
         8tgB31hLe4b5Y0YS3CZCGEf7vYdTJ4SDYFEs4okA0W/mRPmnRYmFcpRwM4KSWjdQQv3l
         lBJGLtd9PtNyobK0fD6ifh+vwTy4d7/l2dn7ZnjZtbHZ5dXyhpXcJ2p7Cf9pR8hAGksM
         PR1zkh5Mwcx/BpsIJYumoxFBrCDoynKV/qYvIeAXJJ7z7u2leO/2kn1vZsOtCie1iTfu
         MjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780450237; x=1781055037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqcRE4ZV9h59aWUDKIwLPgkTSVEiGSZVcumouuNOvKo=;
        b=Q/o67m89UCjPW1RuXP5j9BB67EvDnAW4DjA6Uz9KC/2+ntaU75FLR0yTmuJ5vuWPV9
         o9yk8Ce0P4AZMNOIPeVn5MedjwpiW168OnvhTlMCR5YWfhfV2nZcMmILTshcEi2kLnDq
         nboExWVQZI2I1gzgJih57+g1lFuRwuBL0g9c9l1WvaG1nKzmq1O5qY5XW+tW0sf1KFUe
         yi6EV8O3tNkDUAvaz6JBm9ECvPuZD59r8AXEbrE2PKpAH6CZkORDmNBUSlnQJh/KAc7P
         qs4KMYSFTP3fJf0trbjh2UxV7RyYOD6P+UlCLJ+FG/l6fRj5KHlPSRhAbEW2C5ZstSWR
         Qozg==
X-Forwarded-Encrypted: i=1; AFNElJ/TxijDLOfv6LU+GOyqiZo3NE95S/oONRwMsd1+59caI3jXqFlnBMPHxlJh80lToeGYGo76HXWqLaCIdgszA75x@lists.infradead.org
X-Gm-Message-State: AOJu0YwYsEMOHRn4UO2VFW9iZAFbjs1duQjJqT2dvYJJDSv0aPdvjf1/
	8YGHEPNzLfI6mKAumDzcGEzLgrDDhiJ/1jmvqOfQjD1mrNNmXBv6+4T/
X-Gm-Gg: Acq92OEYpXG1OBYxAb8O7MwuXTZHZylMkdbJLpeKNyJnynnVbsbF3DbIAm7E7fISlyg
	82nmVLO2Eej9J3QHZllHEIC3yox4Srjfdm5kIJ8p+jMtS9EzV2pdpLteiWczXNC8QSb0Q5RrCwT
	+BBisUALnEIVtaLm5BoNLwUpYLXvmMDeNSiVfpE2NCrZpHPzAM47iHE5O1QnjMVlyYDIoZ+429c
	FxUAic75Gvm7a4ARSY/+mG+yMhsCVSN3jJMWDwruxRYDin8dR0uwRMxgCnCjsqaZvpMyaY5FQnU
	3rwFU0bK6AZjATjccc0XV0hEVgee+dwh66kiwcAAYHaGn6szGUlP+5YSCpethLhH6uebXFfwOrb
	0g+ZycKFHGo5E1OJvwimN1ab4KLatQyDEWxneRFTQaUxGBf9gLIAasWf81K8hxS5kVL83+M9BDv
	cV/3zqNeEIMxKDuXeN5G2/WCcsv1iAdUMrVFbLz8iNLufQDlNVR0QwAq/8p2siwdC82idvA/WnF
	U3aig5lz4KjpG5Pw8y8xAcgI9ZtfLCqrtcr6xrvXwHFVA==
X-Received: by 2002:a05:6214:4992:b0:8ce:b2e9:a4bc with SMTP id 6a1803df08f44-8cecdc89589mr18651456d6.15.1780450237066;
        Tue, 02 Jun 2026 18:30:37 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccda0904sm7724306d6.7.2026.06.02.18.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 18:30:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] thermal/drivers/exynos: fix clock ordering race and shared IRQ handling
Date: Tue,  2 Jun 2026 18:30:18 -0700
Message-ID: <20260603013018.239703-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_183038_444599_81474CCF 
X-CRM114-Status: GOOD (  21.22  )
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

Fix two pre-existing issues in exynos_tmu_probe/remove:

1. Clock ordering race: The driver manually unprepares clocks in
   exynos_tmu_remove() and the probe error path, but the IRQ handler and
   thermal zone are devm-managed and remain active until after the manual
   cleanup.  If the shared IRQ fires or the thermal zone is polled in that
   window, clk_enable() is called on an unprepared clock, which is illegal.
   Replace devm_clk_get() + manual clk_prepare() with devm_clk_get_prepared(),
   and devm_clk_get() + manual clk_prepare_enable() with
   devm_clk_get_enabled(), so clock unprepare is tied to the devm lifetime
   and happens after the IRQ and thermal zone are released.  Remove the
   now-redundant manual cleanup from the error path and remove function.

2. Shared IRQ handling: The driver requests a shared IRQ (IRQF_SHARED) with
   NULL as the hardirq handler, causing the kernel to wake the threaded
   handler for every interrupt on the shared line.  The threaded handler
   unconditionally returned IRQ_HANDLED without verifying that the TMU
   actually generated the interrupt, which could cause other shared-IRQ
   devices to be starved.  Change tmu_clear_irqs to return the interrupt
   status register value, and return IRQ_NONE from the handler if no TMU
   interrupt was pending.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 81 +++++++++-------------------
 1 file changed, 24 insertions(+), 57 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 47a99b3c5395..5dc22006d7f8 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -196,7 +196,7 @@ struct exynos_tmu_data {
 	void (*tmu_control)(struct platform_device *pdev, bool on);
 	int (*tmu_read)(struct exynos_tmu_data *data);
 	void (*tmu_set_emulation)(struct exynos_tmu_data *data, int temp);
-	void (*tmu_clear_irqs)(struct exynos_tmu_data *data);
+	u32 (*tmu_clear_irqs)(struct exynos_tmu_data *data);
 };
 
 /*
@@ -760,24 +760,28 @@ static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
 {
 	struct exynos_tmu_data *data = id;
 
-	thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
-
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
 
+	if (!data->tmu_clear_irqs(data)) {
+		clk_disable(data->clk);
+		mutex_unlock(&data->lock);
+		return IRQ_NONE;
+	}
+
 	/* TODO: take action based on particular interrupt */
-	data->tmu_clear_irqs(data);
 
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
 
+	thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
+
 	return IRQ_HANDLED;
 }
 
-static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
+static u32 exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
 {
-	unsigned int val_irq;
-	u32 tmu_intstat, tmu_intclear;
+	u32 val_irq, tmu_intstat, tmu_intclear;
 
 	if (data->soc == SOC_ARCH_EXYNOS5260) {
 		tmu_intstat = EXYNOS5260_TMU_REG_INTSTAT;
@@ -803,6 +807,8 @@ static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
 	 * support FALL IRQs at all).
 	 */
 	writel(val_irq, data->base + tmu_intclear);
+
+	return val_irq;
 }
 
 static const struct of_device_id exynos_tmu_match[] = {
@@ -1036,43 +1042,22 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	data->clk = devm_clk_get(dev, "tmu_apbif");
+	data->clk = devm_clk_get_prepared(dev, "tmu_apbif");
 	if (IS_ERR(data->clk))
 		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");
 
-	data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
-	if (IS_ERR(data->clk_sec)) {
+	data->clk_sec = devm_clk_get_prepared(dev, "tmu_triminfo_apbif");
+	if (IS_ERR(data->clk_sec))
 		if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
 			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
 					     "Failed to get triminfo clock\n");
-	} else {
-		ret = clk_prepare(data->clk_sec);
-		if (ret) {
-			dev_err(dev, "Failed to get clock\n");
-			return ret;
-		}
-	}
-
-	ret = clk_prepare(data->clk);
-	if (ret) {
-		dev_err(dev, "Failed to get clock\n");
-		goto err_clk_sec;
-	}
 
 	switch (data->soc) {
 	case SOC_ARCH_EXYNOS5433:
 	case SOC_ARCH_EXYNOS7:
-		data->sclk = devm_clk_get(dev, "tmu_sclk");
-		if (IS_ERR(data->sclk)) {
-			ret = dev_err_probe(dev, PTR_ERR(data->sclk), "Failed to get sclk\n");
-			goto err_clk;
-		} else {
-			ret = clk_prepare_enable(data->sclk);
-			if (ret) {
-				dev_err(dev, "Failed to enable sclk\n");
-				goto err_clk;
-			}
-		}
+		data->sclk = devm_clk_get_enabled(dev, "tmu_sclk");
+		if (IS_ERR(data->sclk))
+			return dev_err_probe(dev, PTR_ERR(data->sclk), "Failed to get sclk\n");
 		break;
 	default:
 		break;
@@ -1081,20 +1066,18 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	ret = exynos_tmu_initialize(pdev);
 	if (ret) {
 		dev_err(dev, "Failed to initialize TMU\n");
-		goto err_sclk;
+		return ret;
 	}
 
 	data->tzd = devm_thermal_of_zone_register(dev, 0, data,
 						  &exynos_sensor_ops);
-	if (IS_ERR(data->tzd)) {
-		ret = dev_err_probe(dev, PTR_ERR(data->tzd), "Failed to register sensor\n");
-		goto err_sclk;
-	}
+	if (IS_ERR(data->tzd))
+		return dev_err_probe(dev, PTR_ERR(data->tzd), "Failed to register sensor\n");
 
 	ret = exynos_thermal_zone_configure(pdev);
 	if (ret) {
 		dev_err(dev, "Failed to configure the thermal zone\n");
-		goto err_sclk;
+		return ret;
 	}
 
 	ret = devm_request_threaded_irq(dev, data->irq, NULL,
@@ -1104,32 +1087,16 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 					dev_name(dev), data);
 	if (ret) {
 		dev_err(dev, "Failed to request irq: %d\n", data->irq);
-		goto err_sclk;
+		return ret;
 	}
 
 	exynos_tmu_control(pdev, true);
 	return 0;
-
-err_sclk:
-	clk_disable_unprepare(data->sclk);
-err_clk:
-	clk_unprepare(data->clk);
-err_clk_sec:
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
-	return ret;
 }
 
 static void exynos_tmu_remove(struct platform_device *pdev)
 {
-	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
-
 	exynos_tmu_control(pdev, false);
-
-	clk_disable_unprepare(data->sclk);
-	clk_unprepare(data->clk);
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.54.0


