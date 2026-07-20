Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C662C44527
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cHJ+v/E14jZBDLKhft+LTxzEaKtkH3VvD3xnlIFMVc=; b=lRCk9VYs2DA8dmjyF9Csun50gd
	IjD9wV+5NfsdzO1E8DsY31J5Shh4a0Gg6nEt4Jzv/6Xn2UFmE/V46OEEZMDacYh2jJYW1bk0TmCXS
	jAs6ahvtVONpohiIRiWlXsxmHDA27gEdZmJVpHJ4mtto3ZnYwnlnLUbd2F/lULYPdT9bTb56iRlcL
	z6DbXr9kWP6Nn8dRd9+TSrUVQbsHDsJNAp8o9cohdoBBr9gxpfPChNf5lrgj9dGlQfPuCpqp23Gns
	vdtY7zMXuqSHWk9mUkdzsAfKtyQc0E008dC9o9T4e+FgPhuvK15gsqjGGsFmjORZRXKNIfe/3Qc9B
	E0Z6yONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllQc-00000006VqL-23Gk;
	Mon, 20 Jul 2026 10:40:54 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllQZ-00000006VoQ-44Xw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:40:53 +0000
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ce7d2adef4so94940185ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 03:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544051; x=1785148851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5cHJ+v/E14jZBDLKhft+LTxzEaKtkH3VvD3xnlIFMVc=;
        b=WngD0H70N9xVq5f2h+Q975GI6iJhvWolSYO9x+6LCxzHdShGHlmSd7VXp2WZMqrJLt
         /e2DqREQ33r29rET0muo9iqhA+tqvKXBYKH+BUyUysf2Nvp0ggcsHdWHr78rbvVJsRxJ
         vsnZnZo3IThXGt6Irglj8hNmGasb4wAQEAALB7rawMG9Jsp78MhJ3JyCBAY1rJ8EpD+N
         z9vSmk0eoosCWjER5f6V8ldMkKCOlaSv7vU0E9VNH1Ri/C1g2CPPmcyQPa6oVizAIE1I
         iXvJKcQzWyeLDOpEaGqyHPNKtzZ7PxakQJTK27VoGQVj749g6mxdP02gsMpfDvs5GdfW
         MMng==
X-Forwarded-Encrypted: i=1; AHgh+RoU2AbImRVWJrkEFes5wEtN6bqW+eOUjdNrlsHO7A8Vljy8WekySAClqZkL3mTBPMl0OUxD+bXn1pC/oONpeDYF@lists.infradead.org
X-Gm-Message-State: AOJu0YzWwy8fl6yNbvzsBJMwUTG155/VV+V1RqtdzeYy7znqjjCdp0Vk
	UnsXEFKGs7sPNVaGY+b+QS+t2j0OWUNJziUrOjVSC+uqdI/sQ6MbyzU=
X-Gm-Gg: AR+sD13iZcfndRLN/gzjD/XUrB2iEcgfGdHcqsMaYP21xVZoeEyJ+JvSdeqEW+IExKW
	IgZKYyacfgAU7J28dxWXyffiwGAG/6B/clyqcozgTSv07ZG9CbCywIgZRzXASJ13M7yEzohYiD6
	YqrU1/Qa/KFgTl5VH5xZJ1i+qBgxfUEgHgrciOsD5Qjp7198rH5VaSezPvUY77Dg3liAJdXDkaE
	8NPIYmYuq1DAxFkbS0JxIr6+nL9DOUSr0LHjmmuvA8oQWcid6xnyicxw/sDTrI207JU6PrdLsUf
	Cok96XtPhSS8RrdOXuDvRwjpuYpqlYI9o6B4pt5weMipx1H8/bKt0tX2AKFeODPf16e2vvMwzob
	h8px8B8jwOEnCrFcYlhpo267RxCcBai6SYN42q+/9vVLHbGCLmCFCue/HFX14dv97uDHov081Uo
	mI2r5dh1/t6oWFxBIOX+Ss2kGKC+eW05r7TyIOaXOdIhCMva90vgPATqob2MxeEhzNxOd7jVmOA
	lgPJfg2kdr+/dlcPw==
X-Received: by 2002:a17:902:e80a:b0:2c9:fc14:588f with SMTP id d9443c01a7336-2cf3494afc3mr150265455ad.29.1784544051064;
        Mon, 20 Jul 2026 03:40:51 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-16-100.dynamic-ip.hinet.net. [61.228.16.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f61ffsm54900325ad.33.2026.07.20.03.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:40:50 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v15 7/7] spi: pxa2xx: rename local status variable to ret
Date: Mon, 20 Jul 2026 18:40:29 +0800
Message-Id: <20260720104029.13740-8-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720104029.13740-1-fourdollars@debian.org>
References: <20260720104029.13740-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_034052_012423_679B606E 
X-CRM114-Status: GOOD (  17.15  )
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

Rename the return value variable name from 'status' to 'ret' in the
pxa2xx_spi_probe(), pxa2xx_spi_suspend(), pxa2xx_spi_resume(), and
pxa2xx_spi_runtime_resume() functions to conform to standard Linux kernel
coding conventions.

Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/spi/spi-pxa2xx.c | 62 ++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 56e434f6e794..612361ffe6dc 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -1313,7 +1313,7 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 	struct spi_controller *controller;
 	struct driver_data *drv_data;
 	const struct lpss_config *config;
-	int status;
+	int ret;
 	u32 tmp;
 
 	if (platform_info->is_target)
@@ -1372,8 +1372,8 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 
 	/* Setup DMA if requested */
 	if (platform_info->enable_dma) {
-		status = pxa2xx_spi_dma_setup(drv_data);
-		if (status) {
+		ret = pxa2xx_spi_dma_setup(drv_data);
+		if (ret) {
 			dev_warn(dev, "no DMA channels available, using PIO\n");
 			platform_info->enable_dma = false;
 		} else {
@@ -1387,16 +1387,16 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 	}
 
 	/* Enable SOC clock */
-	status = pxa2xx_spi_clk_enable(drv_data);
-	if (status)
+	ret = pxa2xx_spi_clk_enable(drv_data);
+	if (ret)
 		goto out_error_dma_alloc;
 
 	drv_data->suspended = false;
 
-	status = request_irq(ssp->irq, ssp_int, IRQF_SHARED, dev_name(dev),
+	ret = request_irq(ssp->irq, ssp_int, IRQF_SHARED, dev_name(dev),
 			drv_data);
-	if (status < 0) {
-		status = dev_err_probe(dev, status, "cannot get IRQ %d\n", ssp->irq);
+	if (ret < 0) {
+		ret = dev_err_probe(dev, ret, "cannot get IRQ %d\n", ssp->irq);
 		goto out_error_clock_enabled;
 	}
 
@@ -1477,23 +1477,23 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 		drv_data->gpiod_ready = devm_gpiod_get_optional(dev,
 						"ready", GPIOD_OUT_LOW);
 		if (IS_ERR(drv_data->gpiod_ready)) {
-			status = PTR_ERR(drv_data->gpiod_ready);
+			ret = PTR_ERR(drv_data->gpiod_ready);
 			goto out_error_irq_alloc;
 		}
 	}
 
 	/* Register with the SPI framework */
 	dev_set_drvdata(dev, drv_data);
-	status = spi_register_controller(controller);
-	if (status) {
-		dev_err_probe(dev, status, "problem registering SPI controller\n");
+	ret = spi_register_controller(controller);
+	if (ret) {
+		dev_err_probe(dev, ret, "problem registering SPI controller\n");
 		goto out_error_irq_alloc;
 	}
 
 	if (is_lpss_ssp(drv_data) && !platform_info->enable_dma)
 		pm_runtime_get_noresume(dev);
 
-	return status;
+	return ret;
 
 out_error_irq_alloc:
 	free_irq(ssp->irq, drv_data);
@@ -1504,7 +1504,7 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 out_error_dma_alloc:
 	pxa2xx_spi_dma_release(drv_data);
 
-	return status;
+	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(pxa2xx_spi_probe, "SPI_PXA2xx");
 
@@ -1542,14 +1542,14 @@ static int pxa2xx_spi_suspend(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
 	struct ssp_device *ssp = drv_data->ssp;
-	int status;
+	int ret;
 
-	status = pm_runtime_resume_and_get(dev);
-	if (status < 0)
-		return status;
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
 
-	status = spi_controller_suspend(drv_data->controller);
-	if (status)
+	ret = spi_controller_suspend(drv_data->controller);
+	if (ret)
 		goto out_put;
 
 	/* Disable SSP interrupt generation on hardware level while clock is active */
@@ -1582,19 +1582,19 @@ static int pxa2xx_spi_suspend(struct device *dev)
 
 out_put:
 	pm_runtime_put_noidle(dev);
-	return status;
+	return ret;
 }
 
 static int pxa2xx_spi_resume(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
 	struct ssp_device *ssp = drv_data->ssp;
-	int status;
+	int ret;
 
 	/* Enable the SSP clock */
 	if (!pm_runtime_suspended(dev)) {
-		status = pxa2xx_spi_clk_enable(drv_data);
-		if (status)
+		ret = pxa2xx_spi_clk_enable(drv_data);
+		if (ret)
 			goto out_put;
 	}
 
@@ -1639,8 +1639,8 @@ static int pxa2xx_spi_resume(struct device *dev)
 	drv_data->suspended = false;
 
 	/* Start the queue running */
-	status = spi_controller_resume(drv_data->controller);
-	if (status) {
+	ret = spi_controller_resume(drv_data->controller);
+	if (ret) {
 		drv_data->suspended = true;
 		synchronize_irq(ssp->irq);
 		pxa2xx_spi_clk_disable(drv_data);
@@ -1651,7 +1651,7 @@ static int pxa2xx_spi_resume(struct device *dev)
 	if (!pm_runtime_suspended(dev))
 		pm_runtime_put_noidle(dev);
 
-	return status;
+	return ret;
 }
 
 static int pxa2xx_spi_runtime_suspend(struct device *dev)
@@ -1668,11 +1668,11 @@ static int pxa2xx_spi_runtime_suspend(struct device *dev)
 static int pxa2xx_spi_runtime_resume(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
-	int status;
+	int ret;
 
-	status = pxa2xx_spi_clk_enable(drv_data);
-	if (status)
-		return status;
+	ret = pxa2xx_spi_clk_enable(drv_data);
+	if (ret)
+		return ret;
 
 	drv_data->suspended = false;
 	return 0;
-- 
2.39.5


