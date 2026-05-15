Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9824DCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 17:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wVByEQNzHAoTLnCJhtnshp7ljQBgBd5RO0oGJrAuAM=; b=IYsYrh9/UxNPXIBI90TOriFdZk
	MCF5zRNdUYqCJp7Z5QSvqW4mqWnkxu0zuaGdyio9N0e/T6INl1OH9kjKSBKlyuPRVcqtlX1Ma/FKF
	AQWEKyLev6WU4/P4z2Ir5iqoysoh9nAOjDWM6GwLIbINKreeuVWYSWu2UsuWWKFnGvHcuzNUaN9of
	+84B70dQNu9kQIxHQRrjMzLPBUKEaJ7sL+EAfdek/g0NKQsyybIajJ/CWJSRlWhy5E5Q/yRZ9vzen
	AaLisbQxY23A4n9HbYYuUIxADefxtYG8SmAHUPf2a90HOBt10U9qQhR7SCZdw7LGlTjYKcahVst0Q
	wVdChnUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwDR-00000008yJj-2RtI;
	Fri, 15 May 2026 17:20:49 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwDO-00000008yHz-2Y0V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 17:20:47 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c80203b9d7bso17668a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 10:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778865646; x=1779470446; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wVByEQNzHAoTLnCJhtnshp7ljQBgBd5RO0oGJrAuAM=;
        b=KtTXcyFmn4Dbf1DFOEIXxZ8/3I0gorGKmWv7ZkEdql6QFLJqActic9/6Pr6x2E8Z+W
         jdXD5FpHOEWSr3BV+gW48bEwM0C6chjdpDHfVzxALrL/0UB+3MI499PW2M3TBET1VQkI
         KfzwlAH4w0uaXnXgblbiWs7xGQK9odmv6LN6c3j6AxhW8T4PUownHMRAfex9GEZSNyHq
         gVaPJOleOMFm2rqGeo56vGxSQJxfcbfK2io/d2EL698owOJLSQdLVbBoQ4x28oa80qmb
         PvopWuTKoe8llS2fjrLiMUkYTuI+AXBjSqiBnw8iJ8TlDYQ7lGUExTRxZJsVDrlOmvcs
         HJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778865646; x=1779470446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7wVByEQNzHAoTLnCJhtnshp7ljQBgBd5RO0oGJrAuAM=;
        b=kCqSagefqo3XiIWvyx8sfLnXCUIREXFZGNabTjXd6GGGskXhaykxnuPQAA+gu1fIOx
         j4nhMaq2xI9IoUHG/kSPDnNsijW3K1ZbzEitRTBqhVmNTbUf9I4HCELFnPIWHdhblZzZ
         3YlSIRGz/Y8Cgnw7v0JKDwrIbifNmwkEEyAgT1y4VJPgES7w6yge6O7zg1Plv9mkFovu
         XfbQFCxAH8tVtx6ViU8pbXrkHobPteEUPo1JSSJ132RNmBPXK5O+gX9A7qIkK2O4JikJ
         Yw5w3mLjbkeRIaVWW2mVgfDUtAvo//tEJOrSb6g+EpdZPphyd3AYN56nFtDzCrdzVEdl
         H1cA==
X-Forwarded-Encrypted: i=1; AFNElJ8b1aSm69Lb18z2hmieJA+c3AWJS7R7Uc3nKUkyh6URpmQOmAVC2gF9oQeiOVxqu0svLNIdVAdaILheQ/dX14Ik@lists.infradead.org
X-Gm-Message-State: AOJu0Yz85cO7UrYhq/09zk0GQX1sgH6+7y87RoqQ8H4qbxrLNGj6aBaD
	UG5B3n/HXPjhOMDC8YMVQr18PP9Rpgo3DB1ri+vbvO1XwTewgHogaA/P
X-Gm-Gg: Acq92OE6dQ5KpmuMDmdTKlHy+JePilZ/c+rNvPf7vQmBpKXDXfUF9fAwZ0Ux9RAm6tZ
	44KtlaNKA+zESOxr8rkD35SickatZ93X2CCYkrJJ58OPaj6DEBmwAzNMSkV/E3SLaBDQLpVpdbz
	CRqLpNQl5VwJ5GLrU4pw9rluOTlGpruFT6vEopi4Xg0enz4KZl8Cj8mq6aVO4ly6sYhTB9OO+pu
	sg9x3M+crl5cLj6xqv7BgtujFWDZX1x23zRCrc+PxQYXete4krVfjeWAdsAjtQlDmIuMYCxyTrP
	PuTq04jznJVvaqPkcL5dKoS36TTdJcQTbyKDnviiHFvz7p66f6ZQZfUMtJxJwe+NV5OfLWNKXP4
	1Q1I/I21NLRpk7T4O1H4VeC/xVvY/+gtJgJfI+dbuHRyYSlzvLCw3x3uKrWmeOhDO/Tp/QGTvIV
	eBrmcvc0zRH5KxHIKo2MMyljOAuEathG9hcGKjaMmKt/S+HePJDIPtPrN28xhxYU2+Q9hasZdVs
	N3yDyy2K9zZDEu76bQ=
X-Received: by 2002:a17:902:bb96:b0:2bd:147d:c712 with SMTP id d9443c01a7336-2bd7e78540bmr38358085ad.1.1778865645369;
        Fri, 15 May 2026 10:20:45 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600c3sm63151085ad.29.2026.05.15.10.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 10:20:44 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 16 May 2026 01:20:34 +0800
Subject: [PATCH 1/2] spi: atmel: fix resource leak on DMA buffer allocation
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-atmel-v1-1-674fb4707af6@gmail.com>
References: <20260516-atmel-v1-0-674fb4707af6@gmail.com>
In-Reply-To: <20260516-atmel-v1-0-674fb4707af6@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778865636; l=5833;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=lGBlNCNijk/Efa5PcvFYiun6BRP1lu0JZOhZHIl9RTg=;
 b=5Q+74fz79MgI4YIBMsTxIncGfHx+moPofA723Hs/A6xnwjiRnVh8nzw2LNOwc4mgE2iWD/nBL
 HHV9kWxV/dkBpiXGKjC6jk+WyFnJypGwKXXSKG6GakYrEojezMZrrMB
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_102046_660811_E8FFE534 
X-CRM114-Status: GOOD (  18.47  )
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

The original code set use_dma to false when dma_alloc_coherent() fails,
so DMA channels allocated earlier were never freed, causing a resource
leak.

Fix by moving the bounce buffer allocation into
atmel_spi_configure_dma() and extending atmel_spi_release_dma() to
also free the bounce buffers. Any allocation failure in the DMA
configuration path now rolls back both channels and buffers through
the same release function.

Fixes: a9889ed62d06 ("spi: atmel: Implements transfers with bounce buffer")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-atmel.c | 113 ++++++++++++++++++++++++------------------------
 1 file changed, 57 insertions(+), 56 deletions(-)

diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
index 25aa294631c8..e519a86a2b45 100644
--- a/drivers/spi/spi-atmel.c
+++ b/drivers/spi/spi-atmel.c
@@ -559,6 +559,34 @@ static int atmel_spi_dma_slave_config(struct atmel_spi *as, u8 bits_per_word)
 	return err;
 }
 
+static void atmel_spi_release_dma(struct spi_controller *host,
+				  struct atmel_spi *as)
+{
+	if (host->dma_rx) {
+		dma_release_channel(host->dma_rx);
+		host->dma_rx = NULL;
+	}
+	if (host->dma_tx) {
+		dma_release_channel(host->dma_tx);
+		host->dma_tx = NULL;
+	}
+
+	if (IS_ENABLED(CONFIG_SOC_SAM_V4_V5)) {
+		if (as->addr_tx_bbuf) {
+			dma_free_coherent(&as->pdev->dev, SPI_MAX_DMA_XFER,
+					  as->addr_tx_bbuf,
+					  as->dma_addr_tx_bbuf);
+			as->addr_tx_bbuf = NULL;
+		}
+		if (as->addr_rx_bbuf) {
+			dma_free_coherent(&as->pdev->dev, SPI_MAX_DMA_XFER,
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
@@ -569,7 +597,8 @@ static int atmel_spi_configure_dma(struct spi_controller *host,
 	if (IS_ERR(host->dma_tx)) {
 		err = PTR_ERR(host->dma_tx);
 		dev_dbg(dev, "No TX DMA channel, DMA is disabled\n");
-		goto error_clear;
+		host->dma_tx = NULL;
+		return err;
 	}
 
 	host->dma_rx = dma_request_chan(dev, "rx");
@@ -580,12 +609,31 @@ static int atmel_spi_configure_dma(struct spi_controller *host,
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
 
 	dev_info(&as->pdev->dev,
 			"Using %s (tx) and %s (rx) for DMA transfers\n",
@@ -593,13 +641,10 @@ static int atmel_spi_configure_dma(struct spi_controller *host,
 			dma_chan_name(host->dma_rx));
 
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
+	atmel_spi_release_dma(host, as);
+
 	return err;
 }
 
@@ -611,18 +656,6 @@ static void atmel_spi_stop_dma(struct spi_controller *host)
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
@@ -1581,30 +1614,6 @@ static int atmel_spi_probe(struct platform_device *pdev)
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
 
@@ -1666,7 +1675,7 @@ static int atmel_spi_probe(struct platform_device *pdev)
 	pm_runtime_set_suspended(&pdev->dev);
 
 	if (as->use_dma)
-		atmel_spi_release_dma(host);
+		atmel_spi_release_dma(host, as);
 
 	spi_writel(as, CR, SPI_BIT(SWRST));
 	spi_writel(as, CR, SPI_BIT(SWRST)); /* AT91SAM9263 Rev B workaround */
@@ -1689,15 +1698,7 @@ static void atmel_spi_remove(struct platform_device *pdev)
 	/* reset the hardware and block queue progress */
 	if (as->use_dma) {
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
+		atmel_spi_release_dma(host, as);
 	}
 
 	spin_lock_irq(&as->lock);

-- 
2.43.0


