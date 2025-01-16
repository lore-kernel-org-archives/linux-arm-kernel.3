Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE54DC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 22:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkN93+yrdYBKl9xNfe45DamaUFWg9UXT6+TMNaEpy3s=; b=kuG2XOlhi1ViCoc9fsCuEMRODN
	kgOxy6iHKpQRVdh3CmwpcW7ZJwK9ytBkbFy2Yg9C0tJoX/9Mt+0M3VEdVkL3sUlK1tbp3ncZ++hz0
	Dk+uwhMVvEqDunTRcyc/jOXTChVD33ki+XfKPbtckMKLVeuQixSfnZx1KP2ZyjwC0F54/FYGzEbKG
	favuUWKXDA2T+4hHCOlYsCTRKHP8nEq+dsAmrnyPdNG2xbF1S/Jpy7uNOp4bNHQqC1t8wuvYI2Bg9
	4HqE+oqkrp5EHJoOXmWyeHc6jmBKRLeFFjIK2mGHyUNk09vgxY7ZpuxoQqk8G6xP6CzV/KjUFrSo2
	isuXaDlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYdw-0000000GErr-1ZBw;
	Thu, 16 Jan 2025 22:47:16 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYYu-0000000GEC1-0cFC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 22:42:06 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737067322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AkN93+yrdYBKl9xNfe45DamaUFWg9UXT6+TMNaEpy3s=;
	b=E3m2SaJhGMjqIJ6YCBPI+okrl46/kRMWEsArLRQR/WPgQsimn5anLiRebH/PpuBv4jcj1F
	MJmswt+Iwkhf3ml4X6QzCmhCPkN4vPnTTQkbK44lhpM5vnO1okBfoTQmw1As2Im3nHzZEd
	N+Xs/b87Xy99V89smS/j2jewSBSi6eM=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 3/5] spi: zynqmp-gqspi: Add helpers for enabling/disabling DMA
Date: Thu, 16 Jan 2025 17:41:28 -0500
Message-Id: <20250116224130.2684544-4-sean.anderson@linux.dev>
In-Reply-To: <20250116224130.2684544-1-sean.anderson@linux.dev>
References: <20250116224130.2684544-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_144204_336868_3F0642EE 
X-CRM114-Status: GOOD (  13.94  )
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

DMA is enabled and disabled several times in the driver. Add some
helper functions for this task.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/spi/spi-zynqmp-gqspi.c | 61 +++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 27 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 79dd1d56d05c..d18fa1282dde 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -739,6 +739,33 @@ static void zynqmp_qspi_fillgenfifo(struct zynqmp_qspi *xqspi, u8 nbits,
 	}
 }
 
+/**
+ * zynqmp_qspi_disable_dma() - Disable DMA mode
+ * @xqspi: GQSPI instance
+ */
+static void zynqmp_qspi_disable_dma(struct zynqmp_qspi *xqspi)
+{
+	u32 config_reg = zynqmp_gqspi_read(xqspi, GQSPI_CONFIG_OFST);
+
+	config_reg &= ~GQSPI_CFG_MODE_EN_MASK;
+	zynqmp_gqspi_write(xqspi, GQSPI_CONFIG_OFST, config_reg);
+	xqspi->mode = GQSPI_MODE_IO;
+}
+
+/**
+ * zynqmp_qspi_enable_dma() - Enable DMA mode
+ * @xqspi: GQSPI instance
+ */
+static void zynqmp_qspi_enable_dma(struct zynqmp_qspi *xqspi)
+{
+	u32 config_reg = zynqmp_gqspi_read(xqspi, GQSPI_CONFIG_OFST);
+
+	config_reg &= ~GQSPI_CFG_MODE_EN_MASK;
+	config_reg |= GQSPI_CFG_MODE_EN_DMA_MASK;
+	zynqmp_gqspi_write(xqspi, GQSPI_CONFIG_OFST, config_reg);
+	xqspi->mode = GQSPI_MODE_DMA;
+}
+
 /**
  * zynqmp_process_dma_irq - Handler for DMA done interrupt of QSPI
  *				controller
@@ -748,7 +775,7 @@ static void zynqmp_qspi_fillgenfifo(struct zynqmp_qspi *xqspi, u8 nbits,
  */
 static void zynqmp_process_dma_irq(struct zynqmp_qspi *xqspi)
 {
-	u32 config_reg, genfifoentry;
+	u32 genfifoentry;
 
 	dma_unmap_single(xqspi->dev, xqspi->dma_addr,
 			 xqspi->dma_rx_bytes, DMA_FROM_DEVICE);
@@ -762,9 +789,7 @@ static void zynqmp_process_dma_irq(struct zynqmp_qspi *xqspi)
 
 	if (xqspi->bytes_to_receive > 0) {
 		/* Switch to IO mode,for remaining bytes to receive */
-		config_reg = zynqmp_gqspi_read(xqspi, GQSPI_CONFIG_OFST);
-		config_reg &= ~GQSPI_CFG_MODE_EN_MASK;
-		zynqmp_gqspi_write(xqspi, GQSPI_CONFIG_OFST, config_reg);
+		zynqmp_qspi_disable_dma(xqspi);
 
 		/* Initiate the transfer of remaining bytes */
 		genfifoentry = xqspi->genfifoentry;
@@ -849,17 +874,14 @@ static irqreturn_t zynqmp_qspi_irq(int irq, void *dev_id)
  */
 static int zynqmp_qspi_setuprxdma(struct zynqmp_qspi *xqspi)
 {
-	u32 rx_bytes, rx_rem, config_reg;
+	u32 rx_bytes, rx_rem;
 	dma_addr_t addr;
 	u64 dma_align =  (u64)(uintptr_t)xqspi->rxbuf;
 
 	if (xqspi->bytes_to_receive < 8 ||
 	    ((dma_align & GQSPI_DMA_UNALIGN) != 0x0)) {
 		/* Setting to IO mode */
-		config_reg = zynqmp_gqspi_read(xqspi, GQSPI_CONFIG_OFST);
-		config_reg &= ~GQSPI_CFG_MODE_EN_MASK;
-		zynqmp_gqspi_write(xqspi, GQSPI_CONFIG_OFST, config_reg);
-		xqspi->mode = GQSPI_MODE_IO;
+		zynqmp_qspi_disable_dma(xqspi);
 		xqspi->dma_rx_bytes = 0;
 		return 0;
 	}
@@ -882,14 +904,7 @@ static int zynqmp_qspi_setuprxdma(struct zynqmp_qspi *xqspi)
 	zynqmp_gqspi_write(xqspi, GQSPI_QSPIDMA_DST_ADDR_MSB_OFST,
 			   ((u32)addr) & 0xfff);
 
-	/* Enabling the DMA mode */
-	config_reg = zynqmp_gqspi_read(xqspi, GQSPI_CONFIG_OFST);
-	config_reg &= ~GQSPI_CFG_MODE_EN_MASK;
-	config_reg |= GQSPI_CFG_MODE_EN_DMA_MASK;
-	zynqmp_gqspi_write(xqspi, GQSPI_CONFIG_OFST, config_reg);
-
-	/* Switch to DMA mode */
-	xqspi->mode = GQSPI_MODE_DMA;
+	zynqmp_qspi_enable_dma(xqspi);
 
 	/* Write the number of bytes to transfer */
 	zynqmp_gqspi_write(xqspi, GQSPI_QSPIDMA_DST_SIZE_OFST, rx_bytes);
@@ -909,18 +924,10 @@ static int zynqmp_qspi_setuprxdma(struct zynqmp_qspi *xqspi)
 static void zynqmp_qspi_write_op(struct zynqmp_qspi *xqspi, u8 tx_nbits,
 				 u32 genfifoentry)
 {
-	u32 config_reg;
-
 	zynqmp_qspi_fillgenfifo(xqspi, tx_nbits, genfifoentry);
 	zynqmp_qspi_filltxfifo(xqspi, GQSPI_TXD_DEPTH);
-	if (xqspi->mode == GQSPI_MODE_DMA) {
-		config_reg = zynqmp_gqspi_read(xqspi,
-					       GQSPI_CONFIG_OFST);
-		config_reg &= ~GQSPI_CFG_MODE_EN_MASK;
-		zynqmp_gqspi_write(xqspi, GQSPI_CONFIG_OFST,
-				   config_reg);
-		xqspi->mode = GQSPI_MODE_IO;
-	}
+	if (xqspi->mode == GQSPI_MODE_DMA)
+		zynqmp_qspi_disable_dma(xqspi);
 }
 
 /**
-- 
2.35.1.1320.gc452695387.dirty


