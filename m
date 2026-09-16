Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283E7C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 17:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rrxZXW0JV2dcAfSA/va77c8vfQZoNVpDQV381429spE=; b=i2yJwFqrkrCJBkwV0odCZ7koF9
	opP5gOb2xKQJNvtAFfwYAeYhlaBIY2fBJv/hrc+MTZFzvNqebGt7jhDvUDXin3BAgt/l6IzgYCX2B
	zN4M2fsb+xqUilv+gZQE4y9BtwIl6E84ftmsD8PPaEeYHv4MOWixzfjVF3Kavf3IYnNZ9UBPUhWMp
	Q+sAhc/CDii3BZGLdYbekTGvNMf4hE0AO7a00R8S9UfAMjXyenryH3k4soTfBJJ6eSl12SUl0FhnM
	KJsBkZIrNPrzRG2Th66KG3M9xkdy057yKf270DkPJN5RPrxLk2ah3oTHNpctFatqbOs18nuf/8r6L
	BwPQ50lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tH3-00000009qxS-1Jsf;
	Wed, 16 Sep 2026 17:18:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tH2-00000009qxE-0TsQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 17:18:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 831D04399F;
	Wed, 16 Sep 2026 17:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C701F000FF;
	Wed, 16 Sep 2026 17:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789579099;
	bh=rrxZXW0JV2dcAfSA/va77c8vfQZoNVpDQV381429spE=;
	h=From:To:Cc:Subject:Date;
	b=TImKmxgxeqTplqpkackbdVNFITpWZKLKh/DNeGShhOy6QYYe7Zy9eUFcKXcSCQqs4
	 mxgwxItHRnlXDjnASa31x/X28o+arPDfl2I59etmVicFnylFpYvghavr1ug53WaQY6
	 NVjV/BwaBCWajQ8rVHPFnIogpD/Mds6pq1B1MvTK/qWAUSnuXauo3bDi2eETcBVVKH
	 t+1cBNYP+cfvpMuEMilM9rpicCByvQv+ZDTiRf+u9tRcOIgspxcQ0I28AM3nFSTHAe
	 ibZo1urlOz55O6RkYPXkA8Y+Rm+hG5fBSfB7lO7/0BRiFtxcqBiXvfY7OYsaBN7NLV
	 Pg0LgAq9AMopw==
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
Subject: [PATCH] crypto: atmel-tdes - consolidate transfer setup
Date: Wed, 16 Sep 2026 19:17:01 +0200
Message-ID: <20260916171659.129009-3-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3344; i=blum@kernel.org; h=from:subject; bh=DaBVA3N71vqKpGjHJAcjR2l/h6S2sDfGJ/Uj6I9QoeM=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmrznM/ldI4OuXMCrX0taa7eRLy4/PKppovveNWtuTWh IXFVafzO0pZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAi9yMY/nD8uf37150LrwLV zv/9uyFWKzSQtXLL2dMrXDVFGEqu3elmZHjnqy2doXtCOPd1w3PeapV2Fs3SVxWMD/cVdUc+OPW jlB0A
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

atmel_tdes_crypt_pdc() and atmel_tdes_crypt_dma() store the transfer
length in dd->dma_size and synchronize the bounce buffers before a slow
transfer.

Move the shared code to atmel_tdes_crypt_start() and use dd->dma_size in
atmel_tdes_crypt_pdc() and atmel_tdes_crypt_dma() instead of passing the
length separately.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/crypto/atmel-tdes.c | 40 ++++++++++++-------------------------
 1 file changed, 13 insertions(+), 27 deletions(-)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index 53150f9b169b..f084fda42423 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -349,20 +349,9 @@ static void atmel_tdes_buff_cleanup(struct atmel_tdes_dev *dd)
 
 static int atmel_tdes_crypt_pdc(struct atmel_tdes_dev *dd,
 				dma_addr_t dma_addr_in,
-				dma_addr_t dma_addr_out, int length)
+				dma_addr_t dma_addr_out)
 {
-	int len32;
-
-	dd->dma_size = length;
-
-	if (!(dd->flags & TDES_FLAGS_FAST)) {
-		dma_sync_single_for_device(dd->dev, dma_addr_in, length,
-					   DMA_TO_DEVICE);
-		dma_sync_single_for_device(dd->dev, dma_addr_out, length,
-					   DMA_FROM_DEVICE);
-	}
-
-	len32 = DIV_ROUND_UP(length, sizeof(u32));
+	u32 len32 = DIV_ROUND_UP(dd->dma_size, sizeof(u32));
 
 	atmel_tdes_write(dd, TDES_PTCR, TDES_PTCR_TXTDIS|TDES_PTCR_RXTDIS);
 	atmel_tdes_write(dd, TDES_TPR, dma_addr_in);
@@ -381,21 +370,12 @@ static int atmel_tdes_crypt_pdc(struct atmel_tdes_dev *dd,
 
 static int atmel_tdes_crypt_dma(struct atmel_tdes_dev *dd,
 				dma_addr_t dma_addr_in,
-				dma_addr_t dma_addr_out, int length)
+				dma_addr_t dma_addr_out)
 {
 	struct scatterlist sg[2];
 	struct dma_async_tx_descriptor	*in_desc, *out_desc;
 	enum dma_slave_buswidth addr_width;
 
-	dd->dma_size = length;
-
-	if (!(dd->flags & TDES_FLAGS_FAST)) {
-		dma_sync_single_for_device(dd->dev, dma_addr_in, length,
-					   DMA_TO_DEVICE);
-		dma_sync_single_for_device(dd->dev, dma_addr_out, length,
-					   DMA_FROM_DEVICE);
-	}
-
 	addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 
 	dd->dma_lch_in.dma_conf.dst_addr_width = addr_width;
@@ -408,11 +388,11 @@ static int atmel_tdes_crypt_dma(struct atmel_tdes_dev *dd,
 
 	sg_init_table(&sg[0], 1);
 	sg_dma_address(&sg[0]) = dma_addr_in;
-	sg_dma_len(&sg[0]) = length;
+	sg_dma_len(&sg[0]) = dd->dma_size;
 
 	sg_init_table(&sg[1], 1);
 	sg_dma_address(&sg[1]) = dma_addr_out;
-	sg_dma_len(&sg[1]) = length;
+	sg_dma_len(&sg[1]) = dd->dma_size;
 
 	in_desc = dmaengine_prep_slave_sg(dd->dma_lch_in.chan, &sg[0],
 				1, DMA_MEM_TO_DEV,
@@ -486,11 +466,17 @@ static int atmel_tdes_crypt_start(struct atmel_tdes_dev *dd)
 	}
 
 	dd->total -= count;
+	dd->dma_size = count;
+
+	if (!fast) {
+		dma_sync_single_for_device(dd->dev, addr_in, dd->dma_size, DMA_TO_DEVICE);
+		dma_sync_single_for_device(dd->dev, addr_out, dd->dma_size, DMA_FROM_DEVICE);
+	}
 
 	if (dd->caps.has_dma)
-		err = atmel_tdes_crypt_dma(dd, addr_in, addr_out, count);
+		err = atmel_tdes_crypt_dma(dd, addr_in, addr_out);
 	else
-		err = atmel_tdes_crypt_pdc(dd, addr_in, addr_out, count);
+		err = atmel_tdes_crypt_pdc(dd, addr_in, addr_out);
 
 	if (err && (dd->flags & TDES_FLAGS_FAST)) {
 		dma_unmap_sg(dd->dev, dd->in_sg, 1, DMA_TO_DEVICE);

