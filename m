Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5169C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RU/JGA5nOjMqs/efzn0kjJdYCZ/griCBQ2ley/7YLuw=; b=IWqY07MxR9iXS0iBpivw0CEks7
	1PmyQS8UELvOd4MmCufv9sa1za9mtFLBBAg9zg/iDVCmLxiSYP7A+NfYT9gXhRrcQQCRubP+GCfnc
	AE2YOI3cFCD0n5rb1oat3vOOq9axrnvwzLMojJKcnIdIiG7l8FIFHe/WyDOzinQvu0GksAPbitcBZ
	p7wEHnIcq6nYKfveqpdieSYP/UC5eM8+7PWWCIDqBaL9uSeZuYbX/b6XzO11e6QR4kAIdjfPs4nyB
	/8V8r1yGfnPS4KtmNdQCn/Ayfqr9byvQFUapVEISA2E41e3jlOTZmEgXpyGTm//BIC36oU3AVverP
	nQS1rN1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqke-00000007MYc-3EJ6;
	Mon, 20 Jul 2026 16:21:56 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqkQ-00000007MNr-02V8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:21:45 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf41bab353so37858305ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784564501; x=1785169301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RU/JGA5nOjMqs/efzn0kjJdYCZ/griCBQ2ley/7YLuw=;
        b=OCo2ziT35KCA3ecyZz5i7vKe71Qa0IuAUd77C2XEm4+NqsJEIDs/JERA6x6AbaTL07
         VxM/E/h5qUrmGVEY7phMcHiUvTWCGTOA84HcDNmu6zhgZUgYQP95MBxV4wTbEFnGs09H
         sTSbTMTaQlgkeJPgkXCSZKaeSld4mQJp2xS2s+y1kjUQ+rMnleLW7QJBPnKLeDsUODRC
         svf9BNWpAofU+zSJG2YVZ3HOkas+jPZFokBPs5SHK07GxfqHgeA5Lo/1c1lEJDZFcmiY
         8jk8qCPT7NCKsTb5R9P1ZG370bQGXcxpcKHQxScZdriF3alwb1jLEZWUaACGFh1LzOWu
         iyLw==
X-Forwarded-Encrypted: i=1; AHgh+Rpv0YjEHuTLJiDHIW1RouUhbtn/spfwUZcSo7kZu6ax3OH/aW/W4cptMNRMeFcSHXgnNQc8HEcjwRCHrwDD3tDW@lists.infradead.org
X-Gm-Message-State: AOJu0YzK+uggNuXp3wmmV46VyBpqzMcbgqZQPYBv9W6FqdhbfGHSrfMm
	n8zUuXLgCrfvtk8HJ4WGYXBio6PhkZEnEEpnMrcWHZB5zprhLmrwbOo=
X-Gm-Gg: AR+sD12vgEdK/xm12sa6N4x6KaK83r9QbdKa9yCFfcqXOVRZluWfYRIRWUMJAgp3D+a
	CtAFJxj2y4CXmT0UTAzLetX1N6n6CNLOdpLGZnCzCMxYsSLrsuXX9rkBVpry6QO90r7THSiAHQj
	gbNfSDoEdVC6hfedSf2H8BlYyxhmeJ8Z1LD4nyOupikeZmtFw5d2d0CqVn5gvYWYHg7v6sKe6Jc
	D0lYGGbTL8OxQyopVP1F1K/j8OBv/MFYfWfDIA/s3TiSmQnhQK+2U1Abzt+QLSefKrMQwJvAPpz
	LC1p8R1ltlL5SIZbhXJE2etEmrwxRSJwobR9VVEE5GweAtxUKJvSZIzxuTdm+Ymd1HoCZlTjPq5
	IE+3Ctd1ch+Ds3vfkcL/w1oOKsiyV7TcUTgSl78KBsh0ki+k4g5U9G0hVQqRyXrlSrslz6Iof0r
	6x5wGZK/5kQxV6+tozsuwWQGw7dSa6BGKhJh4bRk1hBjozRtR4atay+g01ZHGVvOkdDL2Uasds7
	EEjy6hbHRmk5HDrtQ==
X-Received: by 2002:a17:903:38c4:b0:2cc:fbf5:afaa with SMTP id d9443c01a7336-2cf348bd420mr159082955ad.20.1784564501163;
        Mon, 20 Jul 2026 09:21:41 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-16-100.dynamic-ip.hinet.net. [61.228.16.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3479463bsm58467385ad.80.2026.07.20.09.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:21:40 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v16 7/7] spi: pxa2xx: rename local status variable to ret
Date: Tue, 21 Jul 2026 00:21:16 +0800
Message-Id: <20260720162117.32304-8-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720162117.32304-1-fourdollars@debian.org>
References: <20260720162117.32304-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_092142_270197_0CCE33EA 
X-CRM114-Status: GOOD (  18.02  )
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
 drivers/spi/spi-pxa2xx.c | 66 +++++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 851626ead25e..9379aac82c7a 100644
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
 
@@ -1547,15 +1547,14 @@ static int pxa2xx_spi_suspend(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
 	struct ssp_device *ssp = drv_data->ssp;
-	int status;
-
-	status = pm_runtime_resume_and_get(dev);
-	if (status < 0)
-		return status;
+	int ret;
 
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
 
-	status = spi_controller_suspend(drv_data->controller);
-	if (status)
+	ret = spi_controller_suspend(drv_data->controller);
+	if (ret)
 		goto out_put;
 
 	/* Disable SSP interrupt generation on hardware level while clock is active */
@@ -1586,19 +1585,19 @@ static int pxa2xx_spi_suspend(struct device *dev)
 
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
 
@@ -1643,8 +1642,8 @@ static int pxa2xx_spi_resume(struct device *dev)
 	drv_data->suspended = false;
 
 	/* Start the queue running */
-	status = spi_controller_resume(drv_data->controller);
-	if (status) {
+	ret = spi_controller_resume(drv_data->controller);
+	if (ret) {
 		drv_data->suspended = true;
 		synchronize_irq(ssp->irq);
 		pxa2xx_spi_clk_disable(drv_data);
@@ -1653,7 +1652,7 @@ static int pxa2xx_spi_resume(struct device *dev)
 
 out_put:
 	if (!pm_runtime_suspended(dev)) {
-		if (status)
+		if (ret)
 			/*
 			 * Clock is already disabled on the error path; align
 			 * the PM runtime state with hardware reality before
@@ -1665,8 +1664,7 @@ static int pxa2xx_spi_resume(struct device *dev)
 		pm_runtime_put_noidle(dev);
 	}
 
-	return status;
-
+	return ret;
 }
 
 static int pxa2xx_spi_runtime_suspend(struct device *dev)
@@ -1683,11 +1681,11 @@ static int pxa2xx_spi_runtime_suspend(struct device *dev)
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


