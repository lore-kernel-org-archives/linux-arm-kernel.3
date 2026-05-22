Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B44CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 12:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JHMw4rHowryIGHkjcmpjPUf8sGdPW4drldezm1GiZm0=; b=XZUpBcOTf+zczyruGbXX1SCrNA
	6nwX3xeMivhOa6izVSwUyNsD28KtCmBy+C3mxhazugjJhp7HpnsTIyFftoLnMFKT2G699E5H3KDd/
	Qd1tTFs1gnVurdQLGbZlSxhnHdrqwRfdx2BpPOnZlUXbH0r3zBi0TLMy4oNvPyFbbICM+m3mfVZwM
	yxO5KiCvOddJKXZ8zRcnhV14X0Qkj8Ct/uARNTFy1uNM66rnUnYFCo7mIDNP6Q9iQ1xRTJnKtOTzv
	0IxUPCH1fMq5A4byCX6wX1aKAY9YnVfYhp5AmCkuTKuGzciohYaBQXuFZlr/+TVHSD5OiiyDgxr2k
	6qK7wKTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPBW-0000000ArI0-0cxs;
	Fri, 22 May 2026 12:41:02 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPBS-0000000ArH1-2L6M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 12:40:59 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8367df48711so3153512b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 05:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779453657; x=1780058457; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JHMw4rHowryIGHkjcmpjPUf8sGdPW4drldezm1GiZm0=;
        b=KjBC6XT0M+4drXtt/4i6Zb9TrvHkJiXuzBHleqY/TVz4hoq7nfEKgrI3F7n4RfWYqO
         3cgOUnSNi5jws4PBB9XyYupKkn83dopYjXuvTc8ZysjhDocSQQgTlw972IuJnara6IG+
         F68LLH5fOuJSuk+dZgi8H5/fJvIIIOWfIOQrc7hQ0g5GqU58pWAbEBJab4mdnkFGHmMy
         SdFWKeOP1A2JRELjUUpgExsT8VlXwmEpCM//hul20V8Zv+VUi7UnQCIu9sknGoL1NtJ9
         pIilnQBbCitHkKrdD5fUjRkKTRR9kI2+cyuBMbRkINN8+HTIzRFS5jBFSEN7sG6riCtb
         pj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779453657; x=1780058457;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHMw4rHowryIGHkjcmpjPUf8sGdPW4drldezm1GiZm0=;
        b=IvcGrEV3s4KgtxcJ9pZVw1A2icCx+CJW3nSGfNIapETYIQSPmxXzykQPAIUYTekqQ0
         NAr+8w/AlowdBnZt8M3HAOGwwbYl5Sjhn1qpPOVijBvrD1f1dVLHYZ5Pb01Y2Ss2Uhft
         PCnJkeQ4XQI8weiWMEAxRjjk/YP1tzVmG2UJqrZ1uHh4XR1FYJHsUzZsv871pZq8UzWL
         2ObXH5JTGLLFTDWKWfJ7p948rNgTwcEJC+JcOfZGqughXTPqTgY8q9StmGPwoOWmMssP
         d2coODaWS0geXlHrW+y6uQAuQxhQ7zzGwuPnSNjURgvJ/s0NIbfWtAYigmX+P7cBEg1A
         hX0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8BqKYeh8plkBTURSbAUvLH0w0QzeoOQGC/xco4J7PEOmqAi4nYthnw6BwRavnA77T0RCecWgeiMbGqz7rOvwaE@lists.infradead.org
X-Gm-Message-State: AOJu0YwvNfvDOABRg8D+7096i+ZQnfVk8xAf/Uyk1mKu/WJUzHrB9d+l
	m+r8O/yRyIMhCBI2a/YsWva38SV9YaRUEXb1jQcopXhF5zhxrmZ/mVXO
X-Gm-Gg: Acq92OEoPim7qv9CYgrSCy7UuCBCTwkGTCJ3wYLKXq7+Ikl8qnnGrraS/kxU2Diw5n/
	i8gfP2qYjy68LJ9ldmm2EAcgFmRkPi4gV0hbXwkymHeW8ElCSgX8b+hrb2LpjPLG/2pLCEB41Ug
	lccQq+pLfS145mnLcCNndYVEztu18oz7V0k7O/umBWc+c+z+JYRMIeZ1QszA69Dj1zfLvoA7o13
	0GOlJg3U1xFiIrqRLbupGRP6dBEuJEox+Ue+uLBJurjS0//OM51MXqhLMlrIB5Sgv6pW11U+hXG
	JHNBL6RX2A96F0XNYTFsPrqK3Sxx271ncUboAZahIaOkFbpWlw0+fHIIEA/FkhtbaxVv5N03eXe
	aAMNPR6xXFRBKNyDiykqhbH31P1+iUElpZOATswLoF5zzAJHIsm0E2H6zMgqht8N0H+mBVzK8+L
	vvxruV43uzHEe9j4MoOsvLSqyaa2FEaBFVEyYDeY5NqeDE7sDTHgElkKLHlCNThH/xcKTrN5nDB
	OLomp3hpGewU356RA==
X-Received: by 2002:a05:6a00:1c8a:b0:83a:3155:c5e9 with SMTP id d2e1a72fcca58-8415f2dade2mr3857383b3a.6.1779453656944;
        Fri, 22 May 2026 05:40:56 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164aee7f5sm1929461b3a.14.2026.05.22.05.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:40:55 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 22 May 2026 20:40:48 +0800
Subject: [PATCH v3] spi: atmel: fix DMA channel and bounce buffer leaks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-atmel-v3-1-23f8c6e6aa43@gmail.com>
X-B4-Tracking: v=1; b=H4sIAM9OEGoC/12Nyw6CMBQFf4V0bU0fcGtc+R/GRVsuUAPUtNhoC
 P8uxZgQl5OcmTOTiMFhJOdiJgGTi86PK8hDQWynxxapq1cmgglgFQeqpwF7CjUYxiuGRiFZt4+
 AjXttnevty/Fp7minLOdF5+Lkw3s7Sjzv/puJU0ZBlY0pFVO6gUs7aNcfrR9Ibiaxt9TPEpRTC
 fYkwSDIstpby7J8AGtuoqbiAAAA
X-Change-ID: 20260516-atmel-6d6b0150eb7e
To: Ryan Wanner <ryan.wanner@microchip.com>, 
 Mark Brown <broonie@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Radu Pirea <radu.pirea@microchip.com>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779453651; l=7250;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=Y82jaR7ig01C99YVTX1uP7k3+xb7iSdiU2qTIciu+vY=;
 b=+R9Ushno/vwtOe8P1yjlWaCnoC/axXRM26wAw3q+bNjUEGjdFxqaHTLkeRe8cxvvOzvhgomID
 9Z1paZaF1J/AlSPXublvQaGFLTluZIsQ4maNSwnQBFkv0y4qiVQJDtp
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_054058_612781_A842E14F 
X-CRM114-Status: GOOD (  20.62  )
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

The out_free_dma error path released DMA channels but did not free the
bounce buffers.

Fix by moving bounce buffer allocation into atmel_spi_configure_dma()
and registering the devres cleanup for DMA channels and bounce buffers.

Fixes: a9889ed62d06 ("spi: atmel: Implements transfers with bounce buffer")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v3:
- Fix Mark's comment.
- Link to v2: https://patch.msgid.link/20260517-atmel-v2-1-36c836be6345@gmail.com

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
 drivers/spi/spi-atmel.c | 133 +++++++++++++++++++++++++-----------------------
 1 file changed, 68 insertions(+), 65 deletions(-)

diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
index 25aa294631c8..c8012c82c3a7 100644
--- a/drivers/spi/spi-atmel.c
+++ b/drivers/spi/spi-atmel.c
@@ -559,6 +559,38 @@ static int atmel_spi_dma_slave_config(struct atmel_spi *as, u8 bits_per_word)
 	return err;
 }
 
+static void atmel_spi_release_dma(void *data)
+{
+	struct spi_controller *host = data;
+	struct atmel_spi *as = spi_controller_get_devdata(host);
+	struct device *dev = &as->pdev->dev;
+
+	if (host->dma_tx) {
+		dma_release_channel(host->dma_tx);
+		host->dma_tx = NULL;
+	}
+
+	if (host->dma_rx) {
+		dma_release_channel(host->dma_rx);
+		host->dma_rx = NULL;
+	}
+
+	if (IS_ENABLED(CONFIG_SOC_SAM_V4_V5)) {
+		if (as->addr_tx_bbuf) {
+			dma_free_coherent(dev, SPI_MAX_DMA_XFER,
+					  as->addr_tx_bbuf,
+					  as->dma_addr_tx_bbuf);
+			as->addr_tx_bbuf = NULL;
+		}
+		if (as->addr_rx_bbuf) {
+			dma_free_coherent(dev, SPI_MAX_DMA_XFER,
+					  as->addr_rx_bbuf,
+					  as->dma_addr_rx_bbuf);
+			as->addr_rx_bbuf = NULL;
+		}
+	}
+}
+
 static int atmel_spi_configure_dma(struct spi_controller *host,
 				   struct atmel_spi *as)
 {
@@ -569,7 +601,8 @@ static int atmel_spi_configure_dma(struct spi_controller *host,
 	if (IS_ERR(host->dma_tx)) {
 		err = PTR_ERR(host->dma_tx);
 		dev_dbg(dev, "No TX DMA channel, DMA is disabled\n");
-		goto error_clear;
+		host->dma_tx = NULL;
+		return err;
 	}
 
 	host->dma_rx = dma_request_chan(dev, "rx");
@@ -580,26 +613,45 @@ static int atmel_spi_configure_dma(struct spi_controller *host,
 		 * requested tx channel.
 		 */
 		dev_dbg(dev, "No RX DMA channel, DMA is disabled\n");
-		goto error;
+		host->dma_rx = NULL;
+		goto err_release_dma;
 	}
 
 	err = atmel_spi_dma_slave_config(as, 8);
 	if (err)
-		goto error;
+		goto err_release_dma;
+
+	if (IS_ENABLED(CONFIG_SOC_SAM_V4_V5)) {
+		as->addr_tx_bbuf = dma_alloc_coherent(dev, SPI_MAX_DMA_XFER,
+						      &as->dma_addr_tx_bbuf,
+						      GFP_KERNEL | GFP_DMA);
+		if (!as->addr_tx_bbuf) {
+			err = -ENOMEM;
+			goto err_release_dma;
+		}
+
+		as->addr_rx_bbuf = dma_alloc_coherent(dev, SPI_MAX_DMA_XFER,
+						      &as->dma_addr_rx_bbuf,
+						      GFP_KERNEL | GFP_DMA);
+		if (!as->addr_rx_bbuf) {
+			err = -ENOMEM;
+			goto err_release_dma;
+		}
+	}
+
+	err = devm_add_action_or_reset(dev, atmel_spi_release_dma, host);
+	if (err)
+		return err;
 
 	dev_info(&as->pdev->dev,
-			"Using %s (tx) and %s (rx) for DMA transfers\n",
-			dma_chan_name(host->dma_tx),
-			dma_chan_name(host->dma_rx));
+		 "Using %s (tx) and %s (rx) for DMA transfers\n",
+		 dma_chan_name(host->dma_tx), dma_chan_name(host->dma_rx));
 
 	return 0;
-error:
-	if (!IS_ERR(host->dma_rx))
-		dma_release_channel(host->dma_rx);
-	if (!IS_ERR(host->dma_tx))
-		dma_release_channel(host->dma_tx);
-error_clear:
-	host->dma_tx = host->dma_rx = NULL;
+
+err_release_dma:
+	atmel_spi_release_dma(host);
+
 	return err;
 }
 
@@ -611,18 +663,6 @@ static void atmel_spi_stop_dma(struct spi_controller *host)
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
@@ -1581,30 +1621,6 @@ static int atmel_spi_probe(struct platform_device *pdev)
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
 
@@ -1664,13 +1680,10 @@ static int atmel_spi_probe(struct platform_device *pdev)
 out_free_dma:
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
 
@@ -1687,18 +1700,8 @@ static void atmel_spi_remove(struct platform_device *pdev)
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


