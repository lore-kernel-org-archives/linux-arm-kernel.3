Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EF1C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49rBEbH5fONL/HnT9WXrZZOfwE9egzJjXhPVZNXFswU=; b=BfjyFkTyEQFnCF5ef/9Yqqtsg/
	ASt/KTHuG1u+csKwJhh8+B1wgQki/nc2FEysjDJWvIq4GL9zBYeTDZNDJvuGhbnbPjx2DRGRClbv7
	WXvtWTGD8rwjTUFwqFyaf6WaMUHB2NrhZ1UwDAsx7VJ4tEitc5xP/JkYmb+Algh4tvfVrsYJtKwez
	H/za//qFuMSh5P/nZkGUsNaJFBJs6JD6Ucr6I96u3XBMgnftWrOTAQVLHBH0hATKOtxZ7xpR2fpfS
	c+en/MhwcZV1m/FfHovgdWXdqwZX20QWJU5UegxAAn7BhLKxdpU7dZO/3p6/WVAkV2asHofofc+zR
	2jgqqRiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqkE-00000007MGh-2zwP;
	Mon, 20 Jul 2026 16:21:30 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqk9-00000007MEb-2ZMd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:21:26 +0000
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caed617615so114024455ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784564485; x=1785169285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=49rBEbH5fONL/HnT9WXrZZOfwE9egzJjXhPVZNXFswU=;
        b=ih67Sb9swPKcSope9w5RhaUHE4MbCsxd2CK7cz4cjbz/DwRkTvoTc6BnIJLam0HFJc
         r4ozi3yfhTLPAmXrAnt6Hj28F6tHdPKOCc7voEPZOohc5Kg05UnWYGdgnnQn0vthf/0y
         /vqgNv7ooJocgQwDlgjwJWz4Yd8qMZL27qIG3g7XqidIqFP5BS+yN4icqjHtM12ZfPsk
         eYupVDWJ4HONBFY8lA6qiTwFKEGpWTGshy40ZRsFrI+1MZnk7EsqPkuWspzZoRdllW++
         2pI//AMPWUXkuNHaQDkp+kLD+hPABwZXKKWDnJqSAlM90dCW8WhelloQfXeqxFejMBKb
         dGWA==
X-Forwarded-Encrypted: i=1; AHgh+RrrA7wmSPoiOwr9f2ia/zJUiPpDG6Z2TZfebmk9OG5bpAU3FKFjm0p4BHvrJ+cbbuIOe+yaMJI/4BCs7604vHuG@lists.infradead.org
X-Gm-Message-State: AOJu0YwgerCWlAtCltxS8VPaYnqATgw15hrkq0Yqj57reAApfEsYWKyV
	MJXooYyRCoxSYWSyGvcKrPZ5R7kKAviK1fbF0BRCpSCgCmPcJb/sKJM=
X-Gm-Gg: AR+sD10FX9gk2YLB1xJ8BLqCzzFHv2tDT0aSsqR7kQhVGK49HeXJgiFrHdTVEJoDlFf
	qtcZKsUX9PYc12v4DMqXdNHE5dHlBLd0d99Vw1PS8JxUpnNtJ4iLhXHzoQUTkSf4r2HCkVhIDZT
	X+TzA15+J/xbvwn0wz1N6eYNgH75y5Y5Yixv+affFR9hmwqG8vqC2crKW7etRqrGWYgBdfN8mpl
	KFwtcuR942QRtWucAMdoVocaZ+L6hWyWbSMHyiO5+o4kej0cbKpRmhrcSfnibZjetA4FOXelPqw
	747rYZ1zFdC6yMExYK9fSR7eGQesQ7Oc/h4YBb+9yKWyK1CSbPykFMc8mzBwx8LmgwN8Axdjg4Z
	2V3pBQwcvdMLTDU4moBR25n991BcO18xA79iS7jaTKrSjB29eDJTKD/TEMNRF4ZWGfdI616me5n
	mpaMe691PBWkFV5zdAfV4HdaQVhj9/tp18+8C710herpcihEyVBiN6C7DwZbhYn9c4pUHnylFMh
	vA0f7LRnzjrSVbMyg==
X-Received: by 2002:a17:902:f542:b0:2cc:741a:ff33 with SMTP id d9443c01a7336-2cf34a39f67mr156765115ad.43.1784564484731;
        Mon, 20 Jul 2026 09:21:24 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-16-100.dynamic-ip.hinet.net. [61.228.16.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3479463bsm58467385ad.80.2026.07.20.09.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:21:24 -0700 (PDT)
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
Subject: [PATCH v16 1/7] spi: pxa2xx: introduce clock enable and disable helper functions
Date: Tue, 21 Jul 2026 00:21:10 +0800
Message-Id: <20260720162117.32304-2-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720162117.32304-1-fourdollars@debian.org>
References: <20260720162117.32304-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_092125_680405_888F7471 
X-CRM114-Status: GOOD (  20.77  )
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

The driver disables the clock during PM runtime suspend, PM system
suspend, and device unbinding (remove). It also disables the clock
on various error unwinding paths in pxa2xx_spi_probe().

However, if the clock is already disabled (for example, if the device is
already runtime-suspended during driver unbinding), calling the common
clock framework's clk_disable_unprepare() again leads to clock prepare/enable
count underflows, generating kernel warnings.

Introduce pxa2xx_spi_clk_enable() and pxa2xx_spi_clk_disable() helper
functions that track the clock enable state using a new 'clk_enabled'
boolean flag in struct driver_data.

This ensures clk_disable_unprepare() is called only when the clock is
active, preventing clock underflows during suspend transitions and unbind.
It also allows the probe function to safely unwind resource allocations
without triggering clock underflows.

Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/spi/spi-pxa2xx.c | 37 +++++++++++++++++++++++++++++--------
 drivers/spi/spi-pxa2xx.h |  2 ++
 2 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 6291d7c2e06f..d50152aad348 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -713,6 +713,28 @@ static void handle_bad_msg(struct driver_data *drv_data)
 	dev_err(drv_data->ssp->dev, "bad message state in interrupt handler\n");
 }
 
+static int pxa2xx_spi_clk_enable(struct driver_data *drv_data)
+{
+	int ret;
+
+	if (drv_data->clk_enabled)
+		return 0;
+
+	ret = clk_prepare_enable(drv_data->ssp->clk);
+	if (ret == 0)
+		drv_data->clk_enabled = true;
+
+	return ret;
+}
+
+static void pxa2xx_spi_clk_disable(struct driver_data *drv_data)
+{
+	if (drv_data->clk_enabled) {
+		clk_disable_unprepare(drv_data->ssp->clk);
+		drv_data->clk_enabled = false;
+	}
+}
+
 static irqreturn_t ssp_int(int irq, void *dev_id)
 {
 	struct driver_data *drv_data = dev_id;
@@ -1352,7 +1374,7 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 	}
 
 	/* Enable SOC clock */
-	status = clk_prepare_enable(ssp->clk);
+	status = pxa2xx_spi_clk_enable(drv_data);
 	if (status)
 		goto out_error_dma_irq_alloc;
 
@@ -1449,7 +1471,7 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 	return status;
 
 out_error_clock_enabled:
-	clk_disable_unprepare(ssp->clk);
+	pxa2xx_spi_clk_disable(drv_data);
 
 out_error_dma_irq_alloc:
 	pxa2xx_spi_dma_release(drv_data);
@@ -1468,7 +1490,7 @@ void pxa2xx_spi_remove(struct device *dev)
 
 	/* Disable the SSP at the peripheral and SOC level */
 	pxa_ssp_disable(ssp);
-	clk_disable_unprepare(ssp->clk);
+	pxa2xx_spi_clk_disable(drv_data);
 
 	/* Release DMA */
 	if (drv_data->controller_info->enable_dma)
@@ -1492,7 +1514,7 @@ static int pxa2xx_spi_suspend(struct device *dev)
 	pxa_ssp_disable(ssp);
 
 	if (!pm_runtime_suspended(dev))
-		clk_disable_unprepare(ssp->clk);
+		pxa2xx_spi_clk_disable(drv_data);
 
 	return 0;
 }
@@ -1500,12 +1522,11 @@ static int pxa2xx_spi_suspend(struct device *dev)
 static int pxa2xx_spi_resume(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
-	struct ssp_device *ssp = drv_data->ssp;
 	int status;
 
 	/* Enable the SSP clock */
 	if (!pm_runtime_suspended(dev)) {
-		status = clk_prepare_enable(ssp->clk);
+		status = pxa2xx_spi_clk_enable(drv_data);
 		if (status)
 			return status;
 	}
@@ -1518,7 +1539,7 @@ static int pxa2xx_spi_runtime_suspend(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
 
-	clk_disable_unprepare(drv_data->ssp->clk);
+	pxa2xx_spi_clk_disable(drv_data);
 	return 0;
 }
 
@@ -1526,7 +1547,7 @@ static int pxa2xx_spi_runtime_resume(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
 
-	return clk_prepare_enable(drv_data->ssp->clk);
+	return pxa2xx_spi_clk_enable(drv_data);
 }
 
 EXPORT_NS_GPL_DEV_PM_OPS(pxa2xx_spi_pm_ops, SPI_PXA2xx) = {
diff --git a/drivers/spi/spi-pxa2xx.h b/drivers/spi/spi-pxa2xx.h
index 447be0369384..820e573a3c60 100644
--- a/drivers/spi/spi-pxa2xx.h
+++ b/drivers/spi/spi-pxa2xx.h
@@ -72,6 +72,8 @@ struct driver_data {
 
 	void __iomem *lpss_base;
 
+	bool clk_enabled;
+
 	/* Optional slave FIFO ready signal */
 	struct gpio_desc *gpiod_ready;
 };
-- 
2.39.5


