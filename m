Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D81C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcZmpxuX179qfg6VaspTT0K7xGUvI9chfr3uCqZTPa4=; b=0ZnrifxTCZrJNmfO3/lS8WjVCb
	EJaW8glAbGMdJUJo54/5a9mYod/nZyLALKm3LaHDT+TqU7nJ9imNOQUrZyZy0d7NtfWBWlFKsOALe
	u3Wwoy1yIDphOg0yJJj5PC79IiYK1a+Q2Y0UF+4LAAzle7zrerG9sJT4zA46wrvM6qlY3yzFvbd/5
	StlHdmNYlV8z9wgB8w2PEQlrQzzY5BJuhJl+xLPVUA6Vf34wWzf5Sv2yKxyYOoP7c4SLuGhvT/rJY
	ag0k412HZp167SB2r6XzWDsqDY65zPoUuaCjKb3as61yVwWMXTgO8+ug3lxDatRr3YXy/i7JxAZju
	e9xbo+cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqkE-00000007MGw-3VUI;
	Mon, 20 Jul 2026 16:21:30 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqkC-00000007MFn-3C21
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:21:29 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf41bab353so37855445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784564488; x=1785169288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zcZmpxuX179qfg6VaspTT0K7xGUvI9chfr3uCqZTPa4=;
        b=X2ZxhkU8L7IuyirBSuJVN1X+Xv/NtEhKCx6g22ww2mqwoOGA094A9No2r6moPT7Sva
         v9AG74PuxwDBvd7kr2EtZXPFsyDfLxHgjcHE233Z8JSmN1LsfKuCM3H/VVJt3Esr2r58
         GBvZvdfyYr++AfAr5In89mWj6siyaYMEYDnY1F3mTVHIRu/EjFPPn22/wbnLfPNRDFh/
         pA6qI3hQBrCtOInZ2k+c1s7gKRkS+/mXsBD2/DMvFNWr/2MBYfS2q6TzkmK2Cp/duW7w
         UcsVBtZmIWpi6SN/PkKWmDc6CaMTszlUA1K31yFogYFEtcfmYgS7TzyvI/lPkap+fylW
         iD7w==
X-Forwarded-Encrypted: i=1; AHgh+RoxW1rRTwsefebY1a0blzS6/RgAo1J2Fj4GyyYWjWB3J+OwuoMYZIM1UVNi4QdqpUlVLUGTZnNPXt1kj4gf0L64@lists.infradead.org
X-Gm-Message-State: AOJu0YzVTXFDPDiftdeZu0F1iyu2A0IdHYCKzn4XFcoBuyxUVMXiqdPO
	Bpmc060kuIXokp/iuN5PG209dDop/j4LWLUCcD8tEt7P8iM8uwhhHt0=
X-Gm-Gg: AR+sD13KvBVUCWSsxS9oqHJ/T11sUVJ6gFEY2waXdBhYu1rCPxHreZoZDKSAVHvr8Qg
	8/aX3BdtHWfemH0RYGPV4Xu95hx37/CujjvoUyHQVSgcBuyvs8jv5RQME/MpgVWnVMYVwQ5HJmy
	aA8sJhMDzpQmHHUjigVyD64YKBJwKp5KdDtDbp+Ys2XIIN8BkWth81Hrf7wgVjyiLVzbQNgNs1H
	VSVCmhXrDFkqShWfxbA4GHApq72Qf8YRtPwOqMju1lMS2gUuEC7dlANhnpdd4SBNFW1137EkgLQ
	Als/DKepOqk/iyoZiDMKhLuyNlOzuSZs7yjrKrqKjH1DJNEW9VIs6Vyr6JacrKU+7y3Bze+ODi/
	7lAvYgJb1/xthkC3YHlzeKuDUpDvpO0ghbu7+lZG6T55NGaPMNczSPowdki3XG5HhHb/SLjEWqw
	PF8yjG/2L3acepSMyRqLmR7AQBy0EA/atfoMwrd5OG2nE20GPpBxTH5W+GCp+sP2d/ZERmf7XUY
	z6+4vtgo6Xt62DWe7NcenFDY8/0
X-Received: by 2002:a17:902:e805:b0:2c9:d277:2cdd with SMTP id d9443c01a7336-2cf34887c56mr163407575ad.13.1784564487720;
        Mon, 20 Jul 2026 09:21:27 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-16-100.dynamic-ip.hinet.net. [61.228.16.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3479463bsm58467385ad.80.2026.07.20.09.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:21:27 -0700 (PDT)
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
Subject: [PATCH v16 2/7] spi: pxa2xx: introduce suspended flag for interrupt synchronization
Date: Tue, 21 Jul 2026 00:21:11 +0800
Message-Id: <20260720162117.32304-3-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720162117.32304-1-fourdollars@debian.org>
References: <20260720162117.32304-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_092128_804421_E174471D 
X-CRM114-Status: GOOD (  25.83  )
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
 drivers/spi/spi-pxa2xx.c | 51 ++++++++++++++++++++++++++--------------
 drivers/spi/spi-pxa2xx.h |  1 +
 2 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index d50152aad348..c44349ab2b52 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -730,8 +730,8 @@ static int pxa2xx_spi_clk_enable(struct driver_data *drv_data)
 static void pxa2xx_spi_clk_disable(struct driver_data *drv_data)
 {
 	if (drv_data->clk_enabled) {
-		clk_disable_unprepare(drv_data->ssp->clk);
 		drv_data->clk_enabled = false;
+		clk_disable_unprepare(drv_data->ssp->clk);
 	}
 }
 
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
@@ -1511,6 +1518,7 @@ static int pxa2xx_spi_suspend(struct device *dev)
 	if (status)
 		return status;
 
+	drv_data->suspended = true;
 	pxa_ssp_disable(ssp);
 
 	if (!pm_runtime_suspended(dev))
@@ -1531,6 +1539,8 @@ static int pxa2xx_spi_resume(struct device *dev)
 			return status;
 	}
 
+	drv_data->suspended = false;
+
 	/* Start the queue running */
 	return spi_controller_resume(drv_data->controller);
 }
@@ -1539,6 +1549,7 @@ static int pxa2xx_spi_runtime_suspend(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
 
+	drv_data->suspended = true;
 	pxa2xx_spi_clk_disable(drv_data);
 	return 0;
 }
@@ -1546,8 +1557,14 @@ static int pxa2xx_spi_runtime_suspend(struct device *dev)
 static int pxa2xx_spi_runtime_resume(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
+	int ret;
 
-	return pxa2xx_spi_clk_enable(drv_data);
+	ret = pxa2xx_spi_clk_enable(drv_data);
+	if (ret)
+		return ret;
+
+	drv_data->suspended = false;
+	return 0;
 }
 
 EXPORT_NS_GPL_DEV_PM_OPS(pxa2xx_spi_pm_ops, SPI_PXA2xx) = {
diff --git a/drivers/spi/spi-pxa2xx.h b/drivers/spi/spi-pxa2xx.h
index 820e573a3c60..44f37bf9c519 100644
--- a/drivers/spi/spi-pxa2xx.h
+++ b/drivers/spi/spi-pxa2xx.h
@@ -72,6 +72,7 @@ struct driver_data {
 
 	void __iomem *lpss_base;
 
+	bool suspended;
 	bool clk_enabled;
 
 	/* Optional slave FIFO ready signal */
-- 
2.39.5


