Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314B1CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 10:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UDuDwKGGWf9UcWAu5URZf49U1RBStWeCP5aE01gKgdk=; b=AwzSzY6douslb5Qmq5ctTlh6tB
	2iwcrCc2QVnbLVWmy2y2cMZ2y+2ab1L8J8BSpN9WWOCu/NzNVAWRAvKc7pkeC2Go/YWLMEvGhSvDj
	NG84/r2m6YiHzenCl8cBWgBmoihHE576pG1zu78GgXqBtoos2F5bP94ufym3hrsuxH/daJSgqohC7
	Qoc2pjc8jQNOb0lb5HlJkAZy9QpaYVdzNa92gH5CktFcCBQI2hxi7/ZPCs/6O0w0ntN2wFKVWXVpc
	Fcd7lQuEgM9qs6fTjC+7uTdXNMiSzuW3DkULrsbbZhUBkAQ1RbjnR8dBeksPc6sAcRS12Wc6K9cvJ
	jimyiVHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOYvn-0000000CXa9-3CC7;
	Sun, 17 May 2026 10:41:11 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOYvl-0000000CXZX-0BWw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 10:41:10 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so527442a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 03:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779014467; x=1779619267; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UDuDwKGGWf9UcWAu5URZf49U1RBStWeCP5aE01gKgdk=;
        b=IPpGfHBFsTTkyYi+OL+Uqqkubvm3QpLdVKxR1UXG0AuuJPEVTkjLjMM4nu3THl77g6
         iFxgTIyoap6M5cM+NFs7ONc1ksmwuDbmpwnDYzCwRnPL2Uyta2uwuKZRKInnVSklx4vI
         Bx0iTNWC5d4mOOWuJBLCM4m3ys0iFw01BBQAYcK/FxNft9aQ4efzqDlSU/YkMH/3ddHV
         qIoKBtKTBmu12tYeN+Pp0wb3wRuddII6qAQkJnhmJ1o8Z3yhSokCvXKSgX6oGhZQUt4s
         W06jtkSSCtYkyKUJPGsb9MfdGHtUn4d94DhYPzFe4fnCHyrkrEWErbpSJcO4p78BoisW
         syIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779014467; x=1779619267;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDuDwKGGWf9UcWAu5URZf49U1RBStWeCP5aE01gKgdk=;
        b=Gn72KWIZvyImut63OkfQ3qtff+NdI3U7ZWMnGERpkwvZY1hwDr1HqrNlMf6KgRfqhX
         t5pmbHss1dNJl0Rcc/o9fvlbZ4l0Tp/2ZyjBOQY62gkOumP3LkkfcZVNp4X0mSYTxb1o
         +gHR7X/Bh5/H7N7wfC5r40UeZ84TpYCpl+JStq5P2daoBoCaVcb/MJx/L+YnG42fAa6/
         6PDjvnOBTmBls2ZX9m++HVKxj9i77o74lNu9zwMn3qgj7F8GMUh4H+yj/eYYRikMUeMQ
         hfQ2I06GhJ5XL4DHo2D5mU9CZBOD1K5BnDYcVBc5o4UT7UQ2XZSW6HmMss8YrF7UbkLx
         i+wg==
X-Forwarded-Encrypted: i=1; AFNElJ8U/QLGNKr4ZxWGSI9WmzWUfEf8l4VT2eytje/vu7egpdpZM8YqzkI1xKTBXbmGc4xgkeEzcQGF/MEtWVFOBOa8@lists.infradead.org
X-Gm-Message-State: AOJu0YxB2ObksZH2t2urD9d6wBidqErnZ/wt74apd2htARK2hsK3dWVq
	BlXdOnYUYyCNKpxWVcqojf8QKYqc1EYMBtZH4+zJ6R1bnglO8ACAEOGC
X-Gm-Gg: Acq92OED2CV8KVJOSI4XNL8f+65jW/R776KCusAdmAYOc4hA+Ui1duBDp+zEgqyAYsc
	w5fzhFH6X8xnFTSzTC0DHvdAprFag5r8nQe1TBvH1v/uwUT5zQP89kL/WvDmTEdMDnPyVrsGulE
	+Yxmg1JkFDcKccUndVpTYmbeAE+fQSUD1cgJQ14gvdLkvOH0VsM3JVCBuI5jriO7PpfTxvFaDBV
	ujWMcwHSwPT4qd6n3cs9MiOC0a2NXFkrtTUSzi/PY7/+aubtL32xKG78QSUg8yMXINKYTUIZfU8
	PCxd/8AThWx5DZLlh+rUDXpIPcalk4u5n/2EOXKIFc7hC/M7oDb4KhlGlqyMuLCte0GbNU4MIrK
	EHpZpvUn1w+oGWjdwO7IDQ3rN+6loDT5Ls4+NYoIh1mM1j23yfoIHbd0PibTqT4UZ4jp8xwR6q+
	IF8qgt25vT1e45tbG4mUKFvDJzEwFll8EkaleldPg0Zzjamd500lhxPL9R3dnb5pnQojMrpkSMg
	w4zZe9SBPMxVSpR3NwUuOJAHqxB
X-Received: by 2002:a05:6a00:a203:b0:834:df57:9d36 with SMTP id d2e1a72fcca58-83f33d9de2dmr11177169b3a.25.1779014467267;
        Sun, 17 May 2026 03:41:07 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664712sm11488415b3a.12.2026.05.17.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 03:41:06 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 17 May 2026 18:39:54 +0800
Subject: [PATCH v2] spi: atmel: fix DMA channel and bounce buffer leaks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-atmel-v2-1-36c836be6345@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPmaCWoC/12Nyw6DIBBFf8XMujRAFJKu+h+NC8BRp/HRAJI2x
 n8v2F2XJzn33B0CesIAt2oHj4kCrUsGeanAjWYZkFGXGSSXijdCMRNnnJjqlOWi4Wg1QnZfHnt
 6n51H++Ow2Se6WMbFGCnE1X/OoySK999MgnGmdN3bWnNtenUfZkPT1a0ztMdxfAFF+J8DrAAAA
 A==
X-Change-ID: 20260516-atmel-6d6b0150eb7e
To: Ryan Wanner <ryan.wanner@microchip.com>, 
 Mark Brown <broonie@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Radu Pirea <radu.pirea@microchip.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Wenyou Yang <wenyou.yang@atmel.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@opensource.wolfsonmicro.com>, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779014463; l=6687;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=h3D3ImvJVD6KhyB0VcERM9OQgo6ma0yzOWE/0rlCSBo=;
 b=0qKY9HBnhgMtap3+OWCRR3mUZrdhTKmDNnlawg6EwGL7t8sxY9470XxmzVCJ68Q6pbvjNTHZL
 1AUald4HO4HCINme2x8kCpvSdZ39/kPGz0j4q/bsnNGoQO5DbmO+TJn
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_034109_100944_B807442D 
X-CRM114-Status: GOOD (  20.44  )
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

The original code set use_dma to false when dma_alloc_coherent() for
bounce buffers failed, but DMA channels acquired earlier via
atmel_spi_configure_dma() were never freed.

When devm_request_irq() or clk_prepare_enable() failed later in probe,
the driver also did not release DMA channels or bounce buffers already
allocated.

And in the following error path, the driver released DMA channels but
did not free the bounce buffers.

Fix by moving bounce buffer allocation into atmel_spi_configure_dma()
and switching both DMA channels and bounce buffers to their devm-
managed variants. Any allocation failure in the DMA configuration path
now correctly rolls back through devres cleanup, and thenow-unnecessary
atmel_spi_release_dma() function is removed.

Fixes: a9889ed62d06 ("spi: atmel: Implements transfers with bounce buffer")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Switch to devm-managed variants to fix Claudiu Beznea's comment.
- Link to v1: https://patch.msgid.link/20260516-atmel-v1-0-674fb4707af6@gmail.com

To: Ryan Wanner <ryan.wanner@microchip.com>
To: Mark Brown <broonie@kernel.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Radu Pirea <radu.pirea@microchip.com>
Cc: linux-spi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/spi/spi-atmel.c | 94 ++++++++++++++-----------------------------------
 1 file changed, 27 insertions(+), 67 deletions(-)

diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
index 25aa294631c8..23022665c3a4 100644
--- a/drivers/spi/spi-atmel.c
+++ b/drivers/spi/spi-atmel.c
@@ -565,14 +565,15 @@ static int atmel_spi_configure_dma(struct spi_controller *host,
 	struct device *dev = &as->pdev->dev;
 	int err;
 
-	host->dma_tx = dma_request_chan(dev, "tx");
+	host->dma_tx = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(host->dma_tx)) {
 		err = PTR_ERR(host->dma_tx);
 		dev_dbg(dev, "No TX DMA channel, DMA is disabled\n");
-		goto error_clear;
+		host->dma_tx = NULL;
+		return err;
 	}
 
-	host->dma_rx = dma_request_chan(dev, "rx");
+	host->dma_rx = devm_dma_request_chan(dev, "rx");
 	if (IS_ERR(host->dma_rx)) {
 		err = PTR_ERR(host->dma_rx);
 		/*
@@ -580,12 +581,27 @@ static int atmel_spi_configure_dma(struct spi_controller *host,
 		 * requested tx channel.
 		 */
 		dev_dbg(dev, "No RX DMA channel, DMA is disabled\n");
-		goto error;
+		host->dma_rx = NULL;
+		return err;
 	}
 
 	err = atmel_spi_dma_slave_config(as, 8);
 	if (err)
-		goto error;
+		return err;
+
+	if (IS_ENABLED(CONFIG_SOC_SAM_V4_V5)) {
+		as->addr_tx_bbuf = dmam_alloc_coherent(dev, SPI_MAX_DMA_XFER,
+						       &as->dma_addr_tx_bbuf,
+						       GFP_KERNEL | GFP_DMA);
+		if (!as->addr_tx_bbuf)
+			return -ENOMEM;
+
+		as->addr_rx_bbuf = dmam_alloc_coherent(dev, SPI_MAX_DMA_XFER,
+						       &as->dma_addr_rx_bbuf,
+						       GFP_KERNEL | GFP_DMA);
+		if (!as->addr_rx_bbuf)
+			return -ENOMEM;
+	}
 
 	dev_info(&as->pdev->dev,
 			"Using %s (tx) and %s (rx) for DMA transfers\n",
@@ -593,14 +609,7 @@ static int atmel_spi_configure_dma(struct spi_controller *host,
 			dma_chan_name(host->dma_rx));
 
 	return 0;
-error:
-	if (!IS_ERR(host->dma_rx))
-		dma_release_channel(host->dma_rx);
-	if (!IS_ERR(host->dma_tx))
-		dma_release_channel(host->dma_tx);
-error_clear:
-	host->dma_tx = host->dma_rx = NULL;
-	return err;
+
 }
 
 static void atmel_spi_stop_dma(struct spi_controller *host)
@@ -611,18 +620,6 @@ static void atmel_spi_stop_dma(struct spi_controller *host)
 		dmaengine_terminate_all(host->dma_tx);
 }
 
-static void atmel_spi_release_dma(struct spi_controller *host)
-{
-	if (host->dma_rx) {
-		dma_release_channel(host->dma_rx);
-		host->dma_rx = NULL;
-	}
-	if (host->dma_tx) {
-		dma_release_channel(host->dma_tx);
-		host->dma_tx = NULL;
-	}
-}
-
 /* This function is called by the DMA driver from tasklet context */
 static void dma_callback(void *data)
 {
@@ -1581,30 +1578,6 @@ static int atmel_spi_probe(struct platform_device *pdev)
 		as->use_pdc = true;
 	}
 
-	if (IS_ENABLED(CONFIG_SOC_SAM_V4_V5)) {
-		as->addr_rx_bbuf = dma_alloc_coherent(&pdev->dev,
-						      SPI_MAX_DMA_XFER,
-						      &as->dma_addr_rx_bbuf,
-						      GFP_KERNEL | GFP_DMA);
-		if (!as->addr_rx_bbuf) {
-			as->use_dma = false;
-		} else {
-			as->addr_tx_bbuf = dma_alloc_coherent(&pdev->dev,
-					SPI_MAX_DMA_XFER,
-					&as->dma_addr_tx_bbuf,
-					GFP_KERNEL | GFP_DMA);
-			if (!as->addr_tx_bbuf) {
-				as->use_dma = false;
-				dma_free_coherent(&pdev->dev, SPI_MAX_DMA_XFER,
-						  as->addr_rx_bbuf,
-						  as->dma_addr_rx_bbuf);
-			}
-		}
-		if (!as->use_dma)
-			dev_info(host->dev.parent,
-				 "  can not allocate dma coherent memory\n");
-	}
-
 	if (as->caps.has_dma_support && !as->use_dma)
 		dev_info(&pdev->dev, "Atmel SPI Controller using PIO only\n");
 
@@ -1652,7 +1625,7 @@ static int atmel_spi_probe(struct platform_device *pdev)
 
 	ret = spi_register_controller(host);
 	if (ret)
-		goto out_free_dma;
+		goto out_disable_rpm;
 
 	/* go! */
 	dev_info(&pdev->dev, "Atmel SPI Controller version 0x%x at 0x%08lx (irq %d)\n",
@@ -1661,16 +1634,13 @@ static int atmel_spi_probe(struct platform_device *pdev)
 
 	return 0;
 
-out_free_dma:
+out_disable_rpm:
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-
-	if (as->use_dma)
-		atmel_spi_release_dma(host);
-
 	spi_writel(as, CR, SPI_BIT(SWRST));
 	spi_writel(as, CR, SPI_BIT(SWRST)); /* AT91SAM9263 Rev B workaround */
-	clk_disable_unprepare(as->gclk);
+	if (as->gclk)
+		clk_disable_unprepare(as->gclk);
 out_disable_clk:
 	clk_disable_unprepare(clk);
 
@@ -1687,18 +1657,8 @@ static void atmel_spi_remove(struct platform_device *pdev)
 	spi_unregister_controller(host);
 
 	/* reset the hardware and block queue progress */
-	if (as->use_dma) {
+	if (as->use_dma)
 		atmel_spi_stop_dma(host);
-		atmel_spi_release_dma(host);
-		if (IS_ENABLED(CONFIG_SOC_SAM_V4_V5)) {
-			dma_free_coherent(&pdev->dev, SPI_MAX_DMA_XFER,
-					  as->addr_tx_bbuf,
-					  as->dma_addr_tx_bbuf);
-			dma_free_coherent(&pdev->dev, SPI_MAX_DMA_XFER,
-					  as->addr_rx_bbuf,
-					  as->dma_addr_rx_bbuf);
-		}
-	}
 
 	spin_lock_irq(&as->lock);
 	spi_writel(as, CR, SPI_BIT(SWRST));

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260516-atmel-6d6b0150eb7e

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


