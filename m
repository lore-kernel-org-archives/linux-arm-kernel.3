Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2BCC44524
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjfjMNm+cQqraDceqixUdtwSS848knI19QAP7FSOitc=; b=CTkqkMGNvFxaX5AXjN1/EOkv/d
	Gd2jwLmEcBis7aXwdO2VMod7g0kIXPAWRVOXV4ycKHIb17M1KZErCtWQh7uR1rAPtOD5nn7gv4TSj
	8ptYMYhn53/4wiakcc7ahj4705mX5tbmNkobarBzMVBIVmVhPSf+NkMHlhD/lfX9ibBpPXT9n0kOr
	yPpyxQzwNFVBmpKEJkPFdQXiAdFmXqlwYEtz6DL9GGUqLYltHSwsoJtxGDZ5PTitTSnZkVmLNT/V0
	G4YCV8vGPwkiyJ32YE8uWMKdLOb2Qzq6b0d+Gu7uL5+4kKGKrGBZWrM3/hz3PnPLeZZFu+6yJZe+m
	X6tv35SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqkP-00000007MMq-0NXT;
	Mon, 20 Jul 2026 16:21:41 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqkF-00000007MHK-1IUs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:21:32 +0000
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cedda2ce6fso61324425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784564490; x=1785169290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zjfjMNm+cQqraDceqixUdtwSS848knI19QAP7FSOitc=;
        b=k+JN9zuvulLHUEDLWvXlYMFJunx71sndOSatYTYmKDm3RPXuLHs+4H/gFnPCxBw+s0
         gkSD7rSgvpi10PJl+iNLOFovl7k8TASXc46IwS6BHLF9ghAbQN06FSaMDOpYzZcPJHNo
         SOlFKq6kmjbXPHmpI5M5kILn23cm9YrSi7GLyx6HU03fqShyCxy79ejVHh8XGydhI1gG
         5rh/BFtKzDK2Lz/xGVktCBPUfwU/KEmq497Jb+1cnrh1VpMpdTpMR1h3K3dq08Ad8DXb
         JTQkAZYZ8FJSx0RDVPNrqX1+Tps88DRCCzvg3svgqvFcqAuZuSpyJWJxl9oLBwI+RtDP
         8ojw==
X-Forwarded-Encrypted: i=1; AHgh+RrlaiDK4g3Cw2JQxn047o3P47YSCT9Ev5FIYz+90mbsRpWoE1XF755xJBXks7Fw3uDlZ2XyYw2ppI9hJo7KVTli@lists.infradead.org
X-Gm-Message-State: AOJu0YyHcgfiBY6wh/6NLwaHVvZRS5hhjDDrg00CoUwrHqCDOgT+ZUFm
	LcfWmFhcmy6vfIzerVhVWPyEKtyC01d0Gc0GVF9eW3z8GNy0xjfGw/w=
X-Gm-Gg: AR+sD10ix8nVGc65qRILunT2fxT5dNMhGbYCNYp4jXejk8RQRoM9BGCEvX1E/scuzhm
	BVq56pKVuTSbjD6zR9nLpXS0AEBhT1xGOon+ERpYCWypN9uw/RgdgS6WKVIFu+v/UtB2woeLP+r
	lKlLbW9SPB3u4NCqInNotJDRU32jm/C02fdsDmodTY444E8UI0lSDFGyq4GOdR3Yn2peRd5GXVg
	XiqKIJl7TJ047LLtUHPyRwkH5gdLN1BsAttSXNTzQl+ZCx8s9gj5DPWGIT/MZ9ltQFNhD2+cW+/
	YZS8+255S0SDkLab3swSpWCnam7eC1x0gHHo8keqUDQbvVyPqiGEI73rCceP5cz2+2G++ye7gVV
	+HgjiATmSKjWXPsZPy1noC69J9fpgbpry9VuHngaq6UFG42qyhT4NwXKyvLUNe0zn+kA1QIgsdE
	i4y33yKyJRfk1Kl427e5ninCwZDdhUnArxczLCPeVq7MwBiWcuxYXGsL27UZCjRZvHd7kTesBx6
	1naklejXDH28EurVw==
X-Received: by 2002:a17:902:dac9:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2cf34853397mr160016285ad.12.1784564490463;
        Mon, 20 Jul 2026 09:21:30 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-16-100.dynamic-ip.hinet.net. [61.228.16.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3479463bsm58467385ad.80.2026.07.20.09.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:21:29 -0700 (PDT)
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
Subject: [PATCH v16 3/7] spi: pxa2xx: overhaul teardown and suspend sequence using pxa2xx_spi_off
Date: Tue, 21 Jul 2026 00:21:12 +0800
Message-Id: <20260720162117.32304-4-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720162117.32304-1-fourdollars@debian.org>
References: <20260720162117.32304-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_092131_358608_2999C110 
X-CRM114-Status: GOOD (  17.10  )
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

When removing the driver or suspending the device, the clock must not
be disabled while shared interrupts are still active. Gating the clock
before waiting for in-flight interrupt handlers to complete results
in race conditions where the handler performs unclocked MMIO accesses,
causing PCIe Completion Timeouts.

Overhaul the remove, suspend, and runtime_suspend paths to use a strict
synchronized teardown order:
1. Disable hardware interrupt generation at the controller level.
2. Mark the device state as suspended (suspended = true) to prevent
   subsequent interrupt handlers from attempting MMIO reads.
3. Call synchronize_irq() to wait for any active interrupt handlers
   to drain completely.
4. Gate the clock via pxa2xx_spi_clk_disable().

Additionally, commit 29d7e05c5f75 ("spi: pxa2xx: Avoid touching
SSCR0_SSE on MMP2") documented that disabling the hardware block via SSE on
MMP2 SoC platforms corrupts the RX/TX FIFO. Instead of calling
pxa_ssp_disable() directly, use the helper function pxa2xx_spi_off(),
which respects the MMP2 platform quirk by bypassing SSE register writes.

Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/spi/spi-pxa2xx.c | 45 ++++++++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index c44349ab2b52..6bfd3382acc3 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -1495,16 +1495,24 @@ void pxa2xx_spi_remove(struct device *dev)
 
 	spi_unregister_controller(drv_data->controller);
 
-	/* Disable the SSP at the peripheral and SOC level */
-	pxa_ssp_disable(ssp);
+	/* Disable SSP interrupt generation on hardware level while clock is active */
+	pxa2xx_spi_off(drv_data);
+
+	/* Mark as suspended to prevent further IRQ handling */
+	drv_data->suspended = true;
+
+	/* Wait for any pending interrupt handlers to complete */
+	synchronize_irq(ssp->irq);
+
+	/* Release IRQ */
+	free_irq(ssp->irq, drv_data);
+
+	/* Safe to disable the SSP clock now */
 	pxa2xx_spi_clk_disable(drv_data);
 
 	/* Release DMA */
 	if (drv_data->controller_info->enable_dma)
 		pxa2xx_spi_dma_release(drv_data);
-
-	/* Release IRQ */
-	free_irq(ssp->irq, drv_data);
 }
 EXPORT_SYMBOL_NS_GPL(pxa2xx_spi_remove, "SPI_PXA2xx");
 
@@ -1519,10 +1527,10 @@ static int pxa2xx_spi_suspend(struct device *dev)
 		return status;
 
 	drv_data->suspended = true;
-	pxa_ssp_disable(ssp);
+	pxa2xx_spi_off(drv_data);
+	synchronize_irq(ssp->irq);
 
-	if (!pm_runtime_suspended(dev))
-		pxa2xx_spi_clk_disable(drv_data);
+	pxa2xx_spi_clk_disable(drv_data);
 
 	return 0;
 }
@@ -1530,6 +1538,7 @@ static int pxa2xx_spi_suspend(struct device *dev)
 static int pxa2xx_spi_resume(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
+	struct ssp_device *ssp = drv_data->ssp;
 	int status;
 
 	/* Enable the SSP clock */
@@ -1542,7 +1551,15 @@ static int pxa2xx_spi_resume(struct device *dev)
 	drv_data->suspended = false;
 
 	/* Start the queue running */
-	return spi_controller_resume(drv_data->controller);
+	status = spi_controller_resume(drv_data->controller);
+	if (status) {
+		drv_data->suspended = true;
+		synchronize_irq(ssp->irq);
+		pxa2xx_spi_clk_disable(drv_data);
+		return status;
+	}
+
+	return 0;
 }
 
 static int pxa2xx_spi_runtime_suspend(struct device *dev)
@@ -1550,6 +1567,8 @@ static int pxa2xx_spi_runtime_suspend(struct device *dev)
 	struct driver_data *drv_data = dev_get_drvdata(dev);
 
 	drv_data->suspended = true;
+	pxa2xx_spi_off(drv_data);
+	synchronize_irq(drv_data->ssp->irq);
 	pxa2xx_spi_clk_disable(drv_data);
 	return 0;
 }
@@ -1557,11 +1576,11 @@ static int pxa2xx_spi_runtime_suspend(struct device *dev)
 static int pxa2xx_spi_runtime_resume(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
-	int ret;
+	int status;
 
-	ret = pxa2xx_spi_clk_enable(drv_data);
-	if (ret)
-		return ret;
+	status = pxa2xx_spi_clk_enable(drv_data);
+	if (status)
+		return status;
 
 	drv_data->suspended = false;
 	return 0;
-- 
2.39.5


