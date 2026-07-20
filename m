Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F33CC44527
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2COBYw4BWPBdbvvAp87MLasINrhEHK6G1ompJUFtwUI=; b=vM7WPCl3ouLevFwEyHsSOhL5U9
	7eKeKeNUK0JqUnl4BJ0hN9i+awfqZhvSVuI5p8U0uNRTxJI0i1++VbqPmmc0PKjvI9mWGfdWBgdUX
	PXGd68ryMTDNB4/trul9uHD4QnPQhl/BVpb3wbs/CmjPsptSbhtKenMmhxg+qYRWnMoenowaZzYso
	55LDJuOrZCCnLluaCtEgrCouiOLXoEYa4naDwxd5p7mANdEN6WfAz56Pj36E/r70yKohhBLo6RHTY
	J0+sgXHQ3EQisKhO3+6peOP9rnsxq4nuiqp7eOJllDMAQuIeh/9iweg2G7TEHiMS5iKMtC2Ys3gUa
	su1lNnSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllQR-00000006Vje-3ykG;
	Mon, 20 Jul 2026 10:40:43 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllQN-00000006Vhe-2Voj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:40:40 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caced6038eso49113815ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 03:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544039; x=1785148839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2COBYw4BWPBdbvvAp87MLasINrhEHK6G1ompJUFtwUI=;
        b=Bccpm4rP48+Y478v5PBL2DpxPD+bkiEgzt1t4x04wnXGSNVlrFvJdIl7bXYV6uncbH
         y4xucoT5fNduEO+LYQs5GwbC9SE9WSJs1zUVGW3gtXy1Ir/8M9ANgXNNbJgdagKgI7We
         3U0FtTtJyfP1uiRVRfXC20yh3b9hJ332ri/WN/cJnq+/Xb0ydFYhVHtpoG+kM3g30Nf2
         UPWzyoIe/EKa+940fSXCu5peJKramoAdTyTvfhoeADYPCfIYhmXXsMNdjRczXLS9kt6H
         nFAlbgTyH0xtnWiVZEiXctEz2aRmXK0lmCVsbOhttQ9AZxjoR/1It+wkajrUF3wyGH/l
         28yA==
X-Forwarded-Encrypted: i=1; AHgh+RoyxFVzAPjSRvjI1+xrohyqjTYPjD7jN45n4OQQClynfI1bhM260RDTo5uzR1/6SIurbKFwR3bsUNYIlh8jRN7L@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr8QYsnFh2zpz+L748A9VkkrLl1odk7DXSW1+8Pa/nqJrDchbL
	3Oh/SJ9pM9OC7TUNCTnsO01o1/GCv1w5Ire2/5wiwSXeTDfGhW95QVg=
X-Gm-Gg: AR+sD13PPnQlGRVaEVhk7n8O2x3l6osi9IOnncRVzAoDzE80kUgeQ60T+uDt9eWAjar
	vdTMwAPJN3Bm++zpnQFZxeOvJVJwn8i4U7B9/4WWbW7uDL3VcqkMIqBJKXJLlc8nWOdnfi+qKXI
	xSZAdpDrA1rhFSAhqApbaUh5LZtCSvAs4zQk3Gn1/ECU1kn1XSJc6bUiKiNVCHnmAGqgZ6vigNf
	3NU2LY5KyGN2FSNmu52Qgpw8OvOsbFQabfXc2lXN0cREhbAR8TMcGDHKEcCsieOMw5bHuXmVJT5
	tRCDfyNy48Cb300p+P1+rc7HISIynSXzxyOGZEOZzv7qXCpDIA4SJ2VeIK2gZSXyVDbmzipvlr0
	jSDVREwPKVdpi257bISmGLoxo3RsP4SZxlHQsFX66eTmcZGgdSiFkJsC0+0cRDkb1KySr73JSE6
	CEz15eF746YjTUQDl0Rn3yFLoapdXH6oH8vFUaEz6Hl87ZYTlsjGCOgk0gGdR3f00ALc2EdSiOb
	vpYoZzGt3sYCmyA1Q==
X-Received: by 2002:a17:903:1986:b0:2cf:18e5:1d18 with SMTP id d9443c01a7336-2cf1f5d7491mr198894955ad.29.1784544038972;
        Mon, 20 Jul 2026 03:40:38 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-16-100.dynamic-ip.hinet.net. [61.228.16.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f61ffsm54900325ad.33.2026.07.20.03.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:40:38 -0700 (PDT)
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
Subject: [PATCH v15 2/7] spi: pxa2xx: introduce suspended flag for interrupt synchronization
Date: Mon, 20 Jul 2026 18:40:24 +0800
Message-Id: <20260720104029.13740-3-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720104029.13740-1-fourdollars@debian.org>
References: <20260720104029.13740-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_034039_642735_5EBA9415 
X-CRM114-Status: GOOD (  20.79  )
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

When a shared interrupt line is used, the interrupt handler ssp_int()
can be triggered by other devices sharing the line. The handler must
ensure it does not access the SSP controller registers via MMIO when
the device is powered down or when its clock is gated; otherwise, it
will cause PCIe Completion Timeouts and system hangs.

Currently, ssp_int() guards MMIO access using:
    if (pm_runtime_suspended(drv_data->ssp->dev)) return IRQ_NONE;

However, during PM transitions (such as system suspend or runtime PM
autosuspend), device callbacks execute to disable the hardware and gate the
clock, but the PM state machine does not mark the device as RPM_SUSPENDED
until after the suspend callback returns. During this transitional state
(RPM_SUSPENDING), pm_runtime_suspended() returns false. If a shared
interrupt fires after the clock has been gated but before the PM state has
transitioned, ssp_int() will execute, attempt MMIO reads on the unclocked
register space, and hang the system.

Formal verification using Spin/PROMELA confirms that a scheduling window
exists where the interrupt thread accesses MMIO when clk_enabled is false,
violating safety properties.

Introduce a custom 'suspended' boolean flag in struct driver_data to
track the device's suspended state across all PM transitions. Check
both 'drv_data->suspended' and '!drv_data->clk_enabled' in ssp_int()
to return IRQ_NONE immediately before any MMIO access is attempted.

This closes the state transition race condition and mathematically guarantees
deadlock-free, safe shared interrupt handling during power transitions.

Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/spi/spi-pxa2xx.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index d50152aad348..d4a9a48c2624 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -743,12 +743,12 @@ static irqreturn_t ssp_int(int irq, void *dev_id)
 	u32 status;
 
 	/*
-	 * The IRQ might be shared with other peripherals so we must first
-	 * check that are we RPM suspended or not. If we are we assume that
-	 * the IRQ was not for us (we shouldn't be RPM suspended when the
-	 * interrupt is enabled).
+	 * The IRQ might be shared with other peripherals or trigger during
+	 * power state transitions. First check if device is suspended or if
+	 * clock is disabled; if so, return IRQ_NONE immediately to avoid
+	 * unclocked MMIO reads.
 	 */
-	if (pm_runtime_suspended(drv_data->ssp->dev))
+	if (drv_data->suspended || !drv_data->clk_enabled)
 		return IRQ_NONE;
 
 	/*
@@ -1310,6 +1310,7 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 	drv_data->controller = controller;
 	drv_data->controller_info = platform_info;
 	drv_data->ssp = ssp;
+	drv_data->suspended = true;
 
 	/* The spi->mode bits understood by this driver: */
 	controller->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH | SPI_LOOP;
@@ -1352,11 +1353,6 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 						| SSSR_ROR | SSSR_TUR;
 	}
 
-	status = request_irq(ssp->irq, ssp_int, IRQF_SHARED, dev_name(dev),
-			drv_data);
-	if (status < 0)
-		return dev_err_probe(dev, status, "cannot get IRQ %d\n", ssp->irq);
-
 	/* Setup DMA if requested */
 	if (platform_info->enable_dma) {
 		status = pxa2xx_spi_dma_setup(drv_data);
@@ -1376,7 +1372,16 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 	/* Enable SOC clock */
 	status = pxa2xx_spi_clk_enable(drv_data);
 	if (status)
-		goto out_error_dma_irq_alloc;
+		goto out_error_dma_alloc;
+
+	drv_data->suspended = false;
+
+	status = request_irq(ssp->irq, ssp_int, IRQF_SHARED, dev_name(dev),
+			drv_data);
+	if (status < 0) {
+		status = dev_err_probe(dev, status, "cannot get IRQ %d\n", ssp->irq);
+		goto out_error_clock_enabled;
+	}
 
 	controller->max_speed_hz = clk_get_rate(ssp->clk);
 	/*
@@ -1456,7 +1461,7 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 						"ready", GPIOD_OUT_LOW);
 		if (IS_ERR(drv_data->gpiod_ready)) {
 			status = PTR_ERR(drv_data->gpiod_ready);
-			goto out_error_clock_enabled;
+			goto out_error_irq_alloc;
 		}
 	}
 
@@ -1465,17 +1470,19 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 	status = spi_register_controller(controller);
 	if (status) {
 		dev_err_probe(dev, status, "problem registering SPI controller\n");
-		goto out_error_clock_enabled;
+		goto out_error_irq_alloc;
 	}
 
 	return status;
 
+out_error_irq_alloc:
+	free_irq(ssp->irq, drv_data);
+
 out_error_clock_enabled:
 	pxa2xx_spi_clk_disable(drv_data);
 
-out_error_dma_irq_alloc:
+out_error_dma_alloc:
 	pxa2xx_spi_dma_release(drv_data);
-	free_irq(ssp->irq, drv_data);
 
 	return status;
 }
-- 
2.39.5


