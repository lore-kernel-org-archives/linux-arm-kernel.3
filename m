Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92DBCA9ECC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 13:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pe5ZoGWIz1vQLH5FnEmGSnJ3DTic8vhTTxWYQCwafgs=; b=WHYY7RHaSlvEHnR1CWSdOo5P+t
	EG/knbi8NrqNpNFI3J7GhVE/SC0ymlO3+QqIV3VF1TJDXkcTCp9scEzAqtI0TKlxSQ3o9QfJQVO7l
	kkkP6/sgmbCRIFSh8X0IMUajfUpdOYbKSOhvBneWvGLOYwW1yyIhN341T29q53qkjQB+c1OnviQY9
	feopf5F7pm96DdrMonb/Q1+UN1GquK8miRLCK3CUCyL83EYJhf3SkS5qowOszSinMPIweSCDlKUWq
	SIyUxmjMokVXAW/u4+9wllE6Sr+GrIZv4hXZ6JVCsWoapCajfuSM2ldFkDjXFBPgTpFb/O6mhkS0x
	ee8XY9WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtPJ-000000092sV-39fL;
	Sun, 11 Oct 2026 13:16:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtPI-000000092sP-1Ih9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 13:16:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25CA9600E2;
	Sun, 11 Oct 2026 13:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A2D1F0089B;
	Sun, 11 Oct 2026 13:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791724562;
	bh=pe5ZoGWIz1vQLH5FnEmGSnJ3DTic8vhTTxWYQCwafgs=;
	h=From:To:Cc:Subject:Date;
	b=cLgiQH8V1smqJMLx/3kIeIAKEfO6jMkuAucYMIBpHFmHilnilK2DAPcDC06BG/r5C
	 Neg5maOVRxjWyXBjWpu8Ex9rewgBDSQSZcSI7lcOCtRKgXY2H83fsdyxxAO/a0MZv/
	 eUhELVRQqB8RrZbDMZi9Ioj3b5bVnIUyoWbSnFXzBpcVRvXDiMwjYSK4ZBDwTZklUj
	 ZeP59kj0d/XJ24aBS7O7XoW+fcQwiN3CeQqKSKX0qzTGvsz5SXUrlCqe4Hdt7SxFD/
	 Yk7o5C1Uf9nONXBa3A5pvplxBnu/QzJnLd1O6yu7qGfW/3dgZMmUrF/mGCpEKc2+Hi
	 nULrVLJW9SyTA==
From: Thorsten Blum <blum@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] crypto: atmel-tdes - use separate DMA scatterlists
Date: Sun, 11 Oct 2026 15:15:56 +0200
Message-ID: <20261011131556.272382-4-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2443; i=blum@kernel.org; h=from:subject; bh=KEkmnMWgYaghFaXFMXtaovDls7gPJm8lfBR8aCes3mY=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmne3g2Kh/Pvi7Lv+O8rtKGWYGlITnSsRcKPaUXJAQtu fZ32r+ojlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZiI2EGG/x4OEj7tXPGPVuTE KfPxyd9TPbT9f879A2Z7tK3/c//dcpPhv9u9iSG/atMneZlMM8z3ymetXDot6SDrIvHlYZUSoqs a+AA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
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

Use two separate input and output scatterlists instead of an array.

Also use DMA_SLAVE_BUSWIDTH_4_BYTES directly and drop the now-unused
addr_width variable.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/crypto/atmel-tdes.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index f084fda42423..b2fca4baee2f 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -372,37 +372,32 @@ static int atmel_tdes_crypt_dma(struct atmel_tdes_dev *dd,
 				dma_addr_t dma_addr_in,
 				dma_addr_t dma_addr_out)
 {
-	struct scatterlist sg[2];
-	struct dma_async_tx_descriptor	*in_desc, *out_desc;
-	enum dma_slave_buswidth addr_width;
+	struct scatterlist sg_in, sg_out;
+	struct dma_async_tx_descriptor *in_desc, *out_desc;
 
-	addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-
-	dd->dma_lch_in.dma_conf.dst_addr_width = addr_width;
-	dd->dma_lch_out.dma_conf.src_addr_width = addr_width;
+	dd->dma_lch_in.dma_conf.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	dd->dma_lch_out.dma_conf.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 
 	dmaengine_slave_config(dd->dma_lch_in.chan, &dd->dma_lch_in.dma_conf);
 	dmaengine_slave_config(dd->dma_lch_out.chan, &dd->dma_lch_out.dma_conf);
 
 	dd->flags |= TDES_FLAGS_DMA;
 
-	sg_init_table(&sg[0], 1);
-	sg_dma_address(&sg[0]) = dma_addr_in;
-	sg_dma_len(&sg[0]) = dd->dma_size;
+	sg_init_table(&sg_in, 1);
+	sg_dma_address(&sg_in) = dma_addr_in;
+	sg_dma_len(&sg_in) = dd->dma_size;
 
-	sg_init_table(&sg[1], 1);
-	sg_dma_address(&sg[1]) = dma_addr_out;
-	sg_dma_len(&sg[1]) = dd->dma_size;
+	sg_init_table(&sg_out, 1);
+	sg_dma_address(&sg_out) = dma_addr_out;
+	sg_dma_len(&sg_out) = dd->dma_size;
 
-	in_desc = dmaengine_prep_slave_sg(dd->dma_lch_in.chan, &sg[0],
-				1, DMA_MEM_TO_DEV,
-				DMA_PREP_INTERRUPT  |  DMA_CTRL_ACK);
+	in_desc = dmaengine_prep_slave_sg(dd->dma_lch_in.chan, &sg_in, 1, DMA_MEM_TO_DEV,
+					  DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!in_desc)
 		return -EINVAL;
 
-	out_desc = dmaengine_prep_slave_sg(dd->dma_lch_out.chan, &sg[1],
-				1, DMA_DEV_TO_MEM,
-				DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	out_desc = dmaengine_prep_slave_sg(dd->dma_lch_out.chan, &sg_out, 1, DMA_DEV_TO_MEM,
+					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!out_desc)
 		return -EINVAL;
 

