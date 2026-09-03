Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839FDC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 21:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6oeSnVhtmyqj21FKsdZ1xnSqIFIro7Jqz0lXnsWJ9fA=; b=zrmGL5CRwY0TvlWixstaEyj0pc
	8WO9k3a4VvmmY+FumHxXaVTdwas5bBsaJbJ4b6I/VfVryKdkd59S/9dtd+UaDK2TMP2gkyneSO3zc
	c1vyvlm7pftZUVEqk379STr9auwv2UnNkU9VIyXhm3yJStsywlszLPrpsZJRwR+LNvO/NlL8gO241
	1fXkDH6GSCGAwcal4PCTWLhnY0l4fS/dGMRQG2YvQTeYwUAhyby9bIp87b5CieBHfiTFbAMCFHQLC
	38Gv/yDUrchV8WC0rn1c8kSE+qKBSA21Zi2ak9NViEZkIVrcv5y2gafNqndWSfzhQsXpAo1/N1J78
	nSi0z0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ehl-00000000c8P-0yjX;
	Thu, 03 Sep 2026 21:10:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ehk-00000000c8E-3UCQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 21:10:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D01140E55;
	Thu,  3 Sep 2026 21:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C011F000E9;
	Thu,  3 Sep 2026 21:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788469840;
	bh=6oeSnVhtmyqj21FKsdZ1xnSqIFIro7Jqz0lXnsWJ9fA=;
	h=From:To:Cc:Subject:Date;
	b=B+60M1SII7FskWzBefV8lkrasipN5K7VBshmb8NLRrh2ZlyJ7w8jUhX5C4093hTUx
	 6z5HrR51BIRhK4pckfbjL3T9C/6TcNQ3zxgKgRZ3oEVluJd3mIqkuJG0GqbfU5H8fI
	 iBAxvt0LNBhKTyYFUS75oa8IpwsTHgDh/i/QZ6VD0a/PCYIJ/7H9PGB5Sn1I0JhzFd
	 N64UvZ+QgfUPYlgJkKHvFx0aslpzMVmxSk2HGmuv3umI7Ktp34Vaqw31rCt7AMlq6N
	 P+hEODQTFrFys+a54FAeC+2nHjI4MrgHFz8UAggH6zb9LexZK9Neg/NcQUYt3+RkL/
	 eQ9j66bOTjXmQ==
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
Subject: [PATCH] crypto: atmel-tdes - simplify DMA buffer initialization
Date: Thu,  3 Sep 2026 23:08:46 +0200
Message-ID: <20260903210845.162790-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2615; i=blum@kernel.org; h=from:subject; bh=0Cb2eNZMcOeloN0iBVNmGPSquG8IxZZ6t5T2eT3wTy0=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkzH96VXyMy6eKyG89fGazorDdWNbtdHrkyYtFd4QN/1 7762Z7k21HKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQATeZDNyHDwkNXBi04Zyvyz ftXVcIjylwkI9tv0v2OysHnn1X/kihbDfy/TGf5qYvt3N86Wllf9we897V+SxbJ9j752TbBf5PB 1FhcA
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

Calculate the buffer length in a single statement and simplify the error
handling. Inline the dma_mapping_error() checks and return -ENOMEM from
the common error path. If mapping the output buffer fails, unmap the
previously mapped input buffer first.

Also use dev_err() to log errors and %zu to format size_t, and clarify
the error messages.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/crypto/atmel-tdes.c | 36 ++++++++++++------------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index 7d17cdf9eef4..5cef4e2793f0 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -308,45 +308,33 @@ static int atmel_tdes_crypt_pdc_stop(struct atmel_tdes_dev *dd)
 
 static int atmel_tdes_buff_init(struct atmel_tdes_dev *dd)
 {
-	int err = -ENOMEM;
-
 	dd->buf_in = (void *)__get_free_page(GFP_KERNEL);
 	dd->buf_out = (void *)__get_free_page(GFP_KERNEL);
-	dd->buflen = PAGE_SIZE;
-	dd->buflen &= ~(DES_BLOCK_SIZE - 1);
+	dd->buflen = PAGE_SIZE & ~(DES_BLOCK_SIZE - 1);
 
 	if (!dd->buf_in || !dd->buf_out) {
-		dev_dbg(dd->dev, "unable to alloc pages.\n");
+		dev_err(dd->dev, "failed to allocate DMA buffers\n");
 		goto err_alloc;
 	}
 
-	/* MAP here */
-	dd->dma_addr_in = dma_map_single(dd->dev, dd->buf_in,
-					dd->buflen, DMA_TO_DEVICE);
-	err = dma_mapping_error(dd->dev, dd->dma_addr_in);
-	if (err) {
-		dev_dbg(dd->dev, "dma %zd bytes error\n", dd->buflen);
-		goto err_map_in;
-	}
+	dd->dma_addr_in = dma_map_single(dd->dev, dd->buf_in, dd->buflen, DMA_TO_DEVICE);
+	if (dma_mapping_error(dd->dev, dd->dma_addr_in))
+		goto err_map;
 
-	dd->dma_addr_out = dma_map_single(dd->dev, dd->buf_out,
-					dd->buflen, DMA_FROM_DEVICE);
-	err = dma_mapping_error(dd->dev, dd->dma_addr_out);
-	if (err) {
-		dev_dbg(dd->dev, "dma %zd bytes error\n", dd->buflen);
-		goto err_map_out;
+	dd->dma_addr_out = dma_map_single(dd->dev, dd->buf_out, dd->buflen, DMA_FROM_DEVICE);
+	if (dma_mapping_error(dd->dev, dd->dma_addr_out)) {
+		dma_unmap_single(dd->dev, dd->dma_addr_in, dd->buflen, DMA_TO_DEVICE);
+		goto err_map;
 	}
 
 	return 0;
 
-err_map_out:
-	dma_unmap_single(dd->dev, dd->dma_addr_in, dd->buflen,
-		DMA_TO_DEVICE);
-err_map_in:
+err_map:
+	dev_err(dd->dev, "failed to map %zu bytes for DMA\n", dd->buflen);
 err_alloc:
 	free_page((unsigned long)dd->buf_out);
 	free_page((unsigned long)dd->buf_in);
-	return err;
+	return -ENOMEM;
 }
 
 static void atmel_tdes_buff_cleanup(struct atmel_tdes_dev *dd)

