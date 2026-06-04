Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA2ACD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 01:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4lpnYjV8Ig/zZCSkvQJauvrjccH7UfxeEgfbLG6AD0g=; b=sHTtrcYq4yab4n7lBME9iFCv9m
	8+YNMdH15hxHRDPsZtVk/4IXkkdG7pJfCW15oawt0h0PhQJXOEO/MP3WURQdgKhPQyxCr/VfKTnWp
	mNboEEoZl7KNktB5W+lVl+Fp+qgySa/35ayV0exTT2TmUDapHeXbe5KQMGphWTiczUmuZrMiY0zEM
	GKBVDkAG2tYwBazA4qn6gxeJrgtVTS/cU+SSycarMI23AdcyL7hbaWS7dP7wPIe7DvMW9LZBSqDL2
	5P3FdTq2FxoLpyP4Ub3ZwQA3XH/a445/95jiLWw6kkGGl9noydNYqEUNILLypuryQPjwjD8j8vA1j
	WuPQf5hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUx6n-0000000G0ah-2Dkw;
	Thu, 04 Jun 2026 01:42:57 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUx6k-0000000G0aN-1EUH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 01:42:55 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8424b6792efso46934b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 18:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780537373; x=1781142173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4lpnYjV8Ig/zZCSkvQJauvrjccH7UfxeEgfbLG6AD0g=;
        b=Fy+YYaBMA/bQUCh62qeip3tnQXtGuiW8yblvrZBHDPfd/ls/ZuIXCuURww5ggSkQQM
         wdN7LPiAFmdDMFRd37WNRmwVntUqgA5I1u5zyZxEhU4gMQkp62hyX7PWEcLbJIn3XUpF
         qMruZgg5xW1B6dmTXGx5CSqSEZnozIY73ylqKiFAOAOwMTJpGpvG8Vd3m5a9k+XF/kLm
         EGlsXqW6T4DOqt5X2sNTiOD0qqdXKrtH++vYhU69s6h9+m/K1r0cE5TggLlnKGAFHZk4
         CyMQ8cFGBOqofspBMBm2tC0Jv8iUtgpo4DtD/biZ+0YLW5mms+B/KoBmmbEkStjk7BqN
         RRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780537373; x=1781142173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lpnYjV8Ig/zZCSkvQJauvrjccH7UfxeEgfbLG6AD0g=;
        b=HNNf1tEb+ueSLb3Mlgu32TpRh4md1tKF6+fQKZK7M0kd3KIWhdbTCeVemv5c1YCNr1
         xx0wKs67SdgSey0OkHDYIhUtUGaFPn4IEb/FuflpPDIrmjuQp7KI8R34ADCkyu8zUkVv
         rV5k4oOLK1mL/Yq8IElqbEz0vHdMQRjpvzyn9CE9ckayMo4FujAEPpNlUFXCoQ4u/E4h
         BU3QxjklOzQoquI9Ogf0YJSNlq6DaTUPa6y70Y0RT/4EPHPMq/AzCMJtKdr06cRJq/kM
         iP5seXpY0+0EVbGtXFS2xWmrsp0WHiU98GE5kenVKJ5t+DJb7SSZULrdti/nRaK+eQl4
         Fjag==
X-Forwarded-Encrypted: i=1; AFNElJ8hFw6FTbAlEUiBadqppOs4hLevwZgVi+kKY10wHpEe5204RTf3OOQMjglYkdlSsBIPlGJW8oAUvFkHCO6mMZts@lists.infradead.org
X-Gm-Message-State: AOJu0YwK7LA0d7Iq7y3CntpvGHEBqhJJa8ob4JX4jEXVzu0xy/J7HJPR
	BBKKt/UWRIqhCPmkO/6/iind/RSeTl7qE3XrjgBhhj1ylDH5oXtMVtSC
X-Gm-Gg: Acq92OElTNXova9SN8YzCpx59CBic3taa9HJuNIOKa757ywvACZ/JY3C8gRG9/dBRXk
	EfGMK6F5pMl/712Mz9VhUnaFFWrOcuKQO2tbY85LuAcIr0LtifLXPdCEiEk0QxH4eaIPCH/RqEl
	KGFBmktJOg5aEDLHBGqWTpg2PBXcBjMtLwty+4bifZsb21Fcz+YUZDkKcTUw7raqXkjcljCNyED
	BvNgBNWGMlJjM++G+JGy3UCQjj40l2ZphC6yFFnmGHDBdISLE+I3fxrDhKn3B+M/7LOlPfd7oxa
	TeA6jzm2kgIfkvinfIhUWyD31bX8yjENB3CSlq/y3iZWCgyaLVqHJ4W8kXshEnXeFLNtqVIKUDm
	/g47qakaa7CKhStuMjMmVi+RwGyR0NAaMrtFGoLNQmM4s1vQCjN+Ebi5D6pwxcTj27oGhViy/xI
	2goziT4vZp3JPhyO5547y9gyiZsEFo3bA1aNuzTc9/vTYP5GFSPwuaPrArBVzvRc/XXQlimFv51
	C9DGnAdfzd7P31Jpjio5ZEAqBuVPm4aKxrDynMAc7vf5g==
X-Received: by 2002:a05:6a00:17a9:b0:841:dc7d:306a with SMTP id d2e1a72fcca58-84284f5fedemr5522133b3a.25.1780537373220;
        Wed, 03 Jun 2026 18:42:53 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282375f2dsm4603728b3a.19.2026.06.03.18.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 18:42:52 -0700 (PDT)
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
Subject: [PATCHv2] thermal/drivers/exynos: fix clock ordering race and shared IRQ handling
Date: Wed,  3 Jun 2026 18:42:35 -0700
Message-ID: <20260604014235.39303-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_184254_389982_818C3C2E 
X-CRM114-Status: GOOD (  21.08  )
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
   NULL as the hardirq handler, causing irq_default_primary_handler to wake
   the threaded handler for every interrupt on the shared line and, combined
   with IRQF_ONESHOT, mask the line until the thread completes.  Replace the
   NULL handler with a hardirq handler that reads the TMU interrupt status
   register and returns IRQ_NONE when the TMU is not the interrupt source,
   so other devices on the shared line are not delayed.  Also return IRQ_NONE
   from the threaded handler as a safety net if the interrupt was already
   handled or cleared between the hardirq and threaded handler.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fixed sashiko comments and moved TODO.
 drivers/thermal/samsung/exynos_tmu.c | 104 ++++++++++++---------------
 1 file changed, 46 insertions(+), 58 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 47a99b3c5395..11b2f1e2670c 100644
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
@@ -756,28 +756,53 @@ static int exynos7_tmu_read(struct exynos_tmu_data *data)
 		EXYNOS7_TMU_TEMP_MASK;
 }

-static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
+static u32 exynos_tmu_intstat_offset(struct exynos_tmu_data *data)
+{
+	if (data->soc == SOC_ARCH_EXYNOS5260)
+		return EXYNOS5260_TMU_REG_INTSTAT;
+	if (data->soc == SOC_ARCH_EXYNOS7)
+		return EXYNOS7_TMU_REG_INTPEND;
+	if (data->soc == SOC_ARCH_EXYNOS5433)
+		return EXYNOS5433_TMU_REG_INTPEND;
+	return EXYNOS_TMU_REG_INTSTAT;
+}
+
+static irqreturn_t exynos_tmu_irq(int irq, void *id)
 {
 	struct exynos_tmu_data *data = id;

-	thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
+	if (!readl(data->base + exynos_tmu_intstat_offset(data)))
+		return IRQ_NONE;
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
+{
+	struct exynos_tmu_data *data = id;

 	mutex_lock(&data->lock);
 	clk_enable(data->clk);

 	/* TODO: take action based on particular interrupt */
-	data->tmu_clear_irqs(data);
+
+	if (!data->tmu_clear_irqs(data)) {
+		clk_disable(data->clk);
+		mutex_unlock(&data->lock);
+		return IRQ_NONE;
+	}

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
@@ -803,6 +828,8 @@ static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
 	 * support FALL IRQs at all).
 	 */
 	writel(val_irq, data->base + tmu_intclear);
+
+	return val_irq;
 }

 static const struct of_device_id exynos_tmu_match[] = {
@@ -1036,43 +1063,22 @@ static int exynos_tmu_probe(struct platform_device *pdev)
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
@@ -1081,55 +1087,37 @@ static int exynos_tmu_probe(struct platform_device *pdev)
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

-	ret = devm_request_threaded_irq(dev, data->irq, NULL,
+	ret = devm_request_threaded_irq(dev, data->irq, exynos_tmu_irq,
 					exynos_tmu_threaded_irq,
 					IRQF_TRIGGER_RISING
 						| IRQF_SHARED | IRQF_ONESHOT,
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


