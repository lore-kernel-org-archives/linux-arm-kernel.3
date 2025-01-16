Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E054C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 22:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQgA5NAVbBZn+dpRPKigk0QwJP0EjS+ozP2A1SsiBr0=; b=jYWcVcsK1bF8GIoMyTeYaiScac
	cRPS88flS7YOmNiss6nceTnASuDBOPcU8WXcL2CZazRP8xeLDY1ycCxh9P6VWRgP/FDO9BNQE7qVo
	3DImU8x0H+kgo+xuLoowvsKCLkmmrP54pozSDlqgXIzAJPeGAPCP7ioFaQTM9lNiOTFwVt6yEkU8n
	lMUAkcS5GELJuHLZEgW+m9jqxN0WskZwfNhjeMTpUMCyIKiMJOCNt54ZWmVZ658ygRwuDeu/HephO
	RpXNGW3XYTaB/fXTGPg+e0vpez3BEm2RwlZOqI70LmZESYtdzVSpaVAzVAMALyls4bcRLGPQn1yA1
	M5oLMBMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYfB-0000000GEy0-0U7l;
	Thu, 16 Jan 2025 22:48:33 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYYw-0000000GECs-1GhT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 22:42:07 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737067325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQgA5NAVbBZn+dpRPKigk0QwJP0EjS+ozP2A1SsiBr0=;
	b=dmZcMHzRlmVGvIDLPN99ildKd0ppwFZRNrEvwZj+tEPI12wPG1MZSUK60rb+dFaLEkRTLi
	wkqjiZHpieYKwd0zxwzQSJRaw4jT1DuUaEjM+lOta6SnMDIMFRgZqBDgelTrOQpq7JRSm8
	BRYSeFdO1r9gvtwkyCBofLgtlnH+pn4=
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
Subject: [PATCH 4/5] spi: zynqmp-gqspi: Clean up fillgenfifo
Date: Thu, 16 Jan 2025 17:41:29 -0500
Message-Id: <20250116224130.2684544-5-sean.anderson@linux.dev>
In-Reply-To: <20250116224130.2684544-1-sean.anderson@linux.dev>
References: <20250116224130.2684544-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_144206_486296_C94B0499 
X-CRM114-Status: GOOD (  12.67  )
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

This function does a lot more work (assigning things multiple times,
masking unnecessarily, comparing to zero, using superfluous parentheses)
than it needs to. This makes it difficult to understand and modify.
Clean it up. No functional change intended.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/spi/spi-zynqmp-gqspi.c | 78 ++++++++++++----------------------
 1 file changed, 28 insertions(+), 50 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index d18fa1282dde..b47973db3490 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -82,7 +82,6 @@
 #define GQSPI_GENFIFO_RX			0x00020000
 #define GQSPI_GENFIFO_STRIPE			0x00040000
 #define GQSPI_GENFIFO_POLL			0x00080000
-#define GQSPI_GENFIFO_EXP_START			0x00000100
 #define GQSPI_FIFO_CTRL_RST_RX_FIFO_MASK	0x00000004
 #define GQSPI_FIFO_CTRL_RST_TX_FIFO_MASK	0x00000002
 #define GQSPI_FIFO_CTRL_RST_GEN_FIFO_MASK	0x00000001
@@ -672,71 +671,50 @@ static void zynqmp_qspi_readrxfifo(struct zynqmp_qspi *xqspi, u32 size)
 static void zynqmp_qspi_fillgenfifo(struct zynqmp_qspi *xqspi, u8 nbits,
 				    u32 genfifoentry)
 {
-	u32 transfer_len = 0;
+	u32 transfer_len, tempcount, exponent;
+	u8 imm_data;
 
-	if (xqspi->txbuf) {
-		genfifoentry &= ~GQSPI_GENFIFO_RX;
-		genfifoentry |= GQSPI_GENFIFO_DATA_XFER;
-		genfifoentry |= GQSPI_GENFIFO_TX;
-		transfer_len = xqspi->bytes_to_transfer;
-	} else if (xqspi->rxbuf) {
-		genfifoentry &= ~GQSPI_GENFIFO_TX;
-		genfifoentry |= GQSPI_GENFIFO_DATA_XFER;
+	genfifoentry |= GQSPI_GENFIFO_DATA_XFER;
+	if (xqspi->rxbuf) {
 		genfifoentry |= GQSPI_GENFIFO_RX;
 		if (xqspi->mode == GQSPI_MODE_DMA)
 			transfer_len = xqspi->dma_rx_bytes;
 		else
 			transfer_len = xqspi->bytes_to_receive;
 	} else {
-		/* Sending dummy circles here */
-		genfifoentry &= ~(GQSPI_GENFIFO_TX | GQSPI_GENFIFO_RX);
-		genfifoentry |= GQSPI_GENFIFO_DATA_XFER;
 		transfer_len = xqspi->bytes_to_transfer;
 	}
+
+	if (xqspi->txbuf)
+		genfifoentry |= GQSPI_GENFIFO_TX;
+
 	genfifoentry |= zynqmp_qspi_selectspimode(xqspi, nbits);
 	xqspi->genfifoentry = genfifoentry;
 	dev_dbg(xqspi->dev, "genfifo %05x transfer_len %u\n",
 		genfifoentry, transfer_len);
 
-	if ((transfer_len) < GQSPI_GENFIFO_IMM_DATA_MASK) {
-		genfifoentry &= ~GQSPI_GENFIFO_IMM_DATA_MASK;
-		genfifoentry |= transfer_len;
-		zynqmp_gqspi_write(xqspi, GQSPI_GEN_FIFO_OFST, genfifoentry);
-	} else {
-		int tempcount = transfer_len;
-		u32 exponent = 8;	/* 2^8 = 256 */
-		u8 imm_data = tempcount & 0xFF;
-
-		tempcount &= ~(tempcount & 0xFF);
-		/* Immediate entry */
-		if (tempcount != 0) {
-			/* Exponent entries */
-			genfifoentry |= GQSPI_GENFIFO_EXP;
-			while (tempcount != 0) {
-				if (tempcount & GQSPI_GENFIFO_EXP_START) {
-					genfifoentry &=
-						~GQSPI_GENFIFO_IMM_DATA_MASK;
-					genfifoentry |= exponent;
-					zynqmp_gqspi_write(xqspi,
-							   GQSPI_GEN_FIFO_OFST,
-							   genfifoentry);
-				}
-				tempcount = tempcount >> 1;
-				exponent++;
-			}
-		}
-		if (imm_data != 0) {
-			genfifoentry &= ~GQSPI_GENFIFO_EXP;
-			genfifoentry &= ~GQSPI_GENFIFO_IMM_DATA_MASK;
-			genfifoentry |= (u8)(imm_data & 0xFF);
+	/* Exponent entries */
+	imm_data = transfer_len;
+	tempcount = transfer_len >> 8;
+	exponent = 8;
+	genfifoentry |= GQSPI_GENFIFO_EXP;
+	while (tempcount) {
+		if (tempcount & 1)
 			zynqmp_gqspi_write(xqspi, GQSPI_GEN_FIFO_OFST,
-					   genfifoentry);
-		}
-	}
-	if (xqspi->mode == GQSPI_MODE_IO && xqspi->rxbuf) {
-		/* Dummy generic FIFO entry */
-		zynqmp_gqspi_write(xqspi, GQSPI_GEN_FIFO_OFST, 0x0);
+					   genfifoentry | exponent);
+		tempcount >>= 1;
+		exponent++;
 	}
+
+	/* Immediate entry */
+	genfifoentry &= ~GQSPI_GENFIFO_EXP;
+	if (imm_data)
+		zynqmp_gqspi_write(xqspi, GQSPI_GEN_FIFO_OFST,
+				   genfifoentry | imm_data);
+
+	/* Dummy generic FIFO entry */
+	if (xqspi->mode == GQSPI_MODE_IO && xqspi->rxbuf)
+		zynqmp_gqspi_write(xqspi, GQSPI_GEN_FIFO_OFST, 0);
 }
 
 /**
-- 
2.35.1.1320.gc452695387.dirty


