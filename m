Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207FBC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECUv2OBEiZbNwjfMV3/65e/S6w3Th/UZLtjgLjuN8Rg=; b=QROb+hxwiJ9782fhGeoxgJGL7F
	wBf6bf7557NbnNgC91GTfrklkkYifbC5ZLC6tChBSUodffq2jW7NkyhWP3ctS9c6CxH9KTwQM1fmV
	+p4IUfn/NGtrsAfy2OOnszJRuhpVrD3qDjKNAMRY22glWorVB6Kw58KZee36dof1Zs6bM+H7YsmKV
	pdOzlSzFZFIyn4uOWtMqgIw02YKApBTEr0rQx8FYs3ItzfieDBiw847limae+mgVxQQKiqc8aIMB0
	At+E5DixkkL3MBdQWSnyz320I+Y0+m6+fVHqo8cCIRBkOVWfPu8RPX8/W0n/Gr1RlcwLdSWxmdJZN
	en+pbotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllQc-00000006VpK-0GYa;
	Mon, 20 Jul 2026 10:40:54 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllQQ-00000006Vib-0f0N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:40:43 +0000
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cee9b74ee1so60332415ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 03:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544041; x=1785148841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ECUv2OBEiZbNwjfMV3/65e/S6w3Th/UZLtjgLjuN8Rg=;
        b=iad1HVZLnh4OXJH4emkOvICrqs8JSZqiQl3n4HZYmyzPRYoZ1QNGtrIwQ317gZKBQr
         iy73u+wkFFQidw+w3hO7Lc3v/3eHZELTpLoAc9TLARXgQfK0Gkv1CIzZdalLFFahkSYE
         PNqJviLNqdI2Ui7BDVJpLpPMy5cwpkWbSy7E6HbXgYjhyYqp/OUiyWCfe3F4T628rWo8
         OldGa22P20gUhz0cWu9Q6SpB93/On5w+sBQXaXt5Yo6r0KbfmSUP324JLikFPfwn61wf
         Ozwc362GsQzp2q60wxlNmqHkp0/YtA4dE+frRaKgVVJZTYipjnQztHP13dBQMzWehk7K
         A3Iw==
X-Forwarded-Encrypted: i=1; AHgh+Rp61CR7b+bs9hjQbl9T7ed57oxHuuSk+JQfWrFoai3cHbM7qxw7HFQNwpQR7ng20ltakOamdn3A8yLJVnrSnpFj@lists.infradead.org
X-Gm-Message-State: AOJu0YyALWxY9Eei+LvcZh9uu7fLf7oIXXoEZZoQHLeIdXNpIpRpZ4zI
	5Qg6fvXEybmD6zWjQ3AnZAymathCJbrai/7q6JZU5RTRN1rN9+VApfw=
X-Gm-Gg: AfdE7cm3knHeNNjljjEfKDrv70YspMkfhpU5TW5bxFgDcxk9OVvdphaH9B7i1pGbmQP
	5abcHLADDDyakDaeapUdRecEEqHS0Ic4PtwxJwpEfIDoWkJVaK9cKcKTTiuRnDQ3hCBaRfOKNeV
	sftvfhSVUavDLSX1tA+2Ft3doPM7v3QBLuXjSj4k7Aq4WyLia+uvani56BIt8l43+APREEp9hmv
	aT72cAi9ZX6AZyOLIgyKBeZueNaNh795I8ArCPjo7V8AWItCPhd6Wp+Wt9wmBnuhS6zkrrogwjs
	uPu7qpRx9+XNAgNks9g0rTF8Q4r3Gzw+wWIfASHKL84GaKWbQPfmPbCvl+dW6e14r+WMKIRevx+
	Ma52GyP9M71HUh19dc4KFpgCsEVMnMlqjipLfSgIaHkGFDkGX14hZEbHNIZ/rVrm0ELTJLcM27n
	dppQAljNTX0I/9otUv3ykfANgmZtlTKgrT5bTZ8IYwPfnu7Wy/+QgyxNdb8hCpLDVH+PlER86pQ
	3CIZ0YtcDx8DlhFJuGvSZbjx6zp
X-Received: by 2002:a17:902:f70d:b0:2ce:bb47:6f3c with SMTP id d9443c01a7336-2cf349c262emr151302235ad.34.1784544041432;
        Mon, 20 Jul 2026 03:40:41 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-16-100.dynamic-ip.hinet.net. [61.228.16.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f61ffsm54900325ad.33.2026.07.20.03.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:40:40 -0700 (PDT)
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
Subject: [PATCH v15 3/7] spi: pxa2xx: overhaul teardown and suspend sequence using pxa2xx_spi_off
Date: Mon, 20 Jul 2026 18:40:25 +0800
Message-Id: <20260720104029.13740-4-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720104029.13740-1-fourdollars@debian.org>
References: <20260720104029.13740-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_034042_221029_7F279D65 
X-CRM114-Status: GOOD (  17.52  )
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
 drivers/spi/spi-pxa2xx.c | 49 ++++++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index d4a9a48c2624..64b5ec744756 100644
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
 
@@ -1518,10 +1526,11 @@ static int pxa2xx_spi_suspend(struct device *dev)
 	if (status)
 		return status;
 
-	pxa_ssp_disable(ssp);
+	pxa2xx_spi_off(drv_data);
+	drv_data->suspended = true;
+	synchronize_irq(ssp->irq);
 
-	if (!pm_runtime_suspended(dev))
-		pxa2xx_spi_clk_disable(drv_data);
+	pxa2xx_spi_clk_disable(drv_data);
 
 	return 0;
 }
@@ -1529,6 +1538,7 @@ static int pxa2xx_spi_suspend(struct device *dev)
 static int pxa2xx_spi_resume(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
+	struct ssp_device *ssp = drv_data->ssp;
 	int status;
 
 	/* Enable the SSP clock */
@@ -1538,14 +1548,27 @@ static int pxa2xx_spi_resume(struct device *dev)
 			return status;
 	}
 
+	drv_data->suspended = false;
+
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
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
 
+	pxa2xx_spi_off(drv_data);
+	drv_data->suspended = true;
+	synchronize_irq(drv_data->ssp->irq);
 	pxa2xx_spi_clk_disable(drv_data);
 	return 0;
 }
@@ -1553,8 +1576,14 @@ static int pxa2xx_spi_runtime_suspend(struct device *dev)
 static int pxa2xx_spi_runtime_resume(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
+	int status;
+
+	status = pxa2xx_spi_clk_enable(drv_data);
+	if (status)
+		return status;
 
-	return pxa2xx_spi_clk_enable(drv_data);
+	drv_data->suspended = false;
+	return 0;
 }
 
 EXPORT_NS_GPL_DEV_PM_OPS(pxa2xx_spi_pm_ops, SPI_PXA2xx) = {
-- 
2.39.5


