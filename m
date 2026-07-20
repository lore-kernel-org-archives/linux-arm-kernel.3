Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C275AC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRbZTqGpgqv9f3V5TsJU/zSn2sq4m20JPxg1ZUFyYfw=; b=jT1ksN8rzt4Jjy9B+fJVyKsWNi
	nAv3C0Ut5tVJLPXEdGHRpe+r5rgX6ZPZGRsbk1NkZxpeWtnQECbLIOSOiAl9YGFQDWX45gC+aNrfs
	nXLYk40f+goB9LtJtzGE4q6pf8BPjg23I7um/C3oqRm0l+73BA72igI0aSm9qZqPTC5cQQJuorQfA
	83WWOaGMyhQNHNQqglhG7zoUXO4qdvaQacRCCbMbUa/G/Oi0LC5XbB6vu/B4Xpa/qELR88slKeuOu
	q6618IVP1dQyxg+nPdm4ZOs5QVIndRp3g16h9kUvyrqh+gr0UOoetZh6aSvqog6qkpRKFGtjYfdUV
	AZVWGczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllQR-00000006VjI-3Zfp;
	Mon, 20 Jul 2026 10:40:43 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllQL-00000006Vgo-1ktu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:40:38 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc73e322dbso117054545ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 03:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544037; x=1785148837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CRbZTqGpgqv9f3V5TsJU/zSn2sq4m20JPxg1ZUFyYfw=;
        b=ZLGa0at6yaxfwLCoAKpOxYhxu+b+tbRmg6ogrQyoUsTuzrHSkN7HDePv9+QNPxVsCw
         Xt3wmnzNz36yk/1QnzP3l5fOhHXKNhIgP1e77mqgjcTnQBuCnRR5yo/hjXcVVR09tAzR
         08LFkam00b0iEkzlXZawUNSvMKrIihRzIKHuTnieb3ObRhukZvULB2ipPlfMjb2nzoms
         O3x9Syu25BrCerUaltAXZ34M3ak5WFDiJGC9YaDK67d4DA1ZbGFZ+uyPZLXQxAlKzHCb
         +NxoHUYZO/oDR4Ap9ngY6s24OLPAIjwFzz3UzCRsIF/NNVeTmYg1Ue8utaXFemVE+j7J
         yTmg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9DYZ1ghLtezpn2h0j94fkJiTVH21Lx9rWemOQvuxWm1++f+/F2xm0NRgx4TDXCaIohPbGUP5aBWR19TwJhBEm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3shc1L4K1GNCtVNjlSw7TMRYERx6vFHgzVzqGlzUCSBMVVCpe
	JgNY13cIB8yxpFmz6e8pW+YBcNgNFp718cZ9hnb3TgkpainAM+OeLu0=
X-Gm-Gg: AR+sD10SKm99/3tdErEFw5716nlNFElQQEBsveJWpuHg62gaRiv64gYFJWYPxKTKPTy
	PztxiXJUMA4S6Zb0CPyNr25M5NAxI/UWxM6VZ71CzTz2BNcUffPyEoi9h5LApIAd7LdHnyFEHKw
	1ER6XP/iXUjXw+qPmjIWUEOU9wxaLcshqdWKzJlcgRfj7Wbayxda71fwvkcsJtktFUi7QYsVVv0
	nurR1Q5rPDavVHCm5h5D20OmrUtAY+xI0pSjCje/FDx94Y7gUaD266ueVizcw/rtwdfTix3aHod
	g0XS0SsThC6ufvH81ffC9Qj2akQqz0ASwpnQ+H04hKa2hGuz1a0s0XscBHpk8pcjjTVWO1K562a
	ffjM/2Dn8dTeFp9O4uxnR13iDtUtoah3ddWwtc83Y85PizNS9PTelTunPomdJw5T5j2HkQYH5TS
	v1+bTuG58P+EgjbAKC7PI31K4XfI9EoY7dDbnLSU9vVsE3naNJgoSUZ72NUXRoszROzOQ1V0W4I
	dcKkemCDpk9nYQBKw==
X-Received: by 2002:a17:903:2c05:b0:2ca:ec6f:aeca with SMTP id d9443c01a7336-2cf3481b670mr148842085ad.8.1784544036593;
        Mon, 20 Jul 2026 03:40:36 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-16-100.dynamic-ip.hinet.net. [61.228.16.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f61ffsm54900325ad.33.2026.07.20.03.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:40:36 -0700 (PDT)
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
Subject: [PATCH v15 1/7] spi: pxa2xx: introduce clock enable and disable helper functions
Date: Mon, 20 Jul 2026 18:40:23 +0800
Message-Id: <20260720104029.13740-2-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720104029.13740-1-fourdollars@debian.org>
References: <20260720104029.13740-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_034037_456968_DECAAF98 
X-CRM114-Status: GOOD (  21.52  )
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
count underflows, generating kernel warnings. Furthermore, in the probe error
unwinding paths, failing to request the IRQ does not disable the clock, leaving
a clock enable leak.

Introduce pxa2xx_spi_clk_enable() and pxa2xx_spi_clk_disable() helper
functions that track the clock enable state using a new 'clk_enabled'
boolean flag in struct driver_data.

This ensures clk_disable_unprepare() is called only when the clock is
active, preventing clock underflows during suspend transitions and unbind. It
also allows the probe function to safely unwind resource allocations without
leaking the clock or triggering clock underflows.

Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/spi/spi-pxa2xx.c | 37 +++++++++++++++++++++++++++++--------
 drivers/spi/spi-pxa2xx.h |  3 +++
 2 files changed, 32 insertions(+), 8 deletions(-)

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
index 447be0369384..44f37bf9c519 100644
--- a/drivers/spi/spi-pxa2xx.h
+++ b/drivers/spi/spi-pxa2xx.h
@@ -72,6 +72,9 @@ struct driver_data {
 
 	void __iomem *lpss_base;
 
+	bool suspended;
+	bool clk_enabled;
+
 	/* Optional slave FIFO ready signal */
 	struct gpio_desc *gpiod_ready;
 };
-- 
2.39.5


