Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F12C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6HV0b9sMqpNpq1FfedKJ4S6F9IUmh8TP/Cz/DVk+Z8=; b=fK6bU7+OhmVBBjPoU8zImWkkUJ
	HvR13ffM/4Lsm/ZOY2yrQC1psJZ6czxlrZdWeF4SaHlgkdcNYs1rEEnJg1z3ki0/70oclzbetxAyf
	NfT6JoSPxNqCJDg/oaCBwnjIQlHM1oy0FC9t3cpGfoBvGCB3vRL0qituZr2NWGs7tP/SBpS+6EJk8
	IzVVjiySWFhOkiCBlLTtZav7BxfquuJO9lZmn/gar0q7PSb7lsiT+oxOIKdnTKNHPWfxMv1x/8jlO
	iphwSb5qcHg0zjNfa00G/vj5lnzO3QtA/q38yQ8EPRLxoZufcCcT8t8HzXLbcFkpi6tLOaK5NJncD
	etwyI23Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgks8-0000000Cpgo-1mBx;
	Mon, 06 Jul 2026 15:04:36 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgks5-0000000Cpf0-0Juo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:04:34 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783350270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I6HV0b9sMqpNpq1FfedKJ4S6F9IUmh8TP/Cz/DVk+Z8=;
	b=CqvbK4RsoLH4/qwbrNeD/+kj7DtLkFYfI2qQVdUTkbDqsXWUMTPI40+DMQQWXgTEejqTVi
	qVYccIxhasI50UJTlcWRLRlXdymBdSNqUB3vUY1fKh+4KLPVDvsf1ZqZGINdhivXikamOC
	97xHasVYHVdgyVn3pELcYwf11RqI0QU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] crypto: atmel-tdes - drop redundant if check in crypt_dma_stop
Date: Mon,  6 Jul 2026 17:04:08 +0200
Message-ID: <20260706150404.382209-8-thorsten.blum@linux.dev>
In-Reply-To: <20260706150404.382209-5-thorsten.blum@linux.dev>
References: <20260706150404.382209-5-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1976; i=thorsten.blum@linux.dev; h=from:subject; bh=zBBXMLoE2TCrYVlVYb7oomLt3VwpY4MdVgmSJC4X9mE=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFneh58WTfte9mhFGNt05c7trExqD+UnLX6R4GLk7x9fI LFb4Uh6RykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEzEIYaRYVLQOQ+G7Qw1jB/9 z27df4uN4xfnzI2TNLd9OBNwM7Yys4qR4YZp2+kC7xhfnxcnvmy6kSV4p/VE0c8TGZ+2Fk9dP+G 7Jz8A
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_080433_262310_5EDBF265 
X-CRM114-Status: GOOD (  10.38  )
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

The call site already checks dd->flags & TDES_FLAGS_DMA before calling
atmel_tdes_crypt_dma_stop(). Remove the redundant check, return early on
error, and drop the now-obsolete return variable.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-tdes.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index 00a0b9694a26..208910d0d08d 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -601,28 +601,25 @@ static int atmel_tdes_handle_queue(struct atmel_tdes_dev *dd,
 
 static int atmel_tdes_crypt_dma_stop(struct atmel_tdes_dev *dd)
 {
-	int err = -EINVAL;
 	size_t count;
 
-	if (dd->flags & TDES_FLAGS_DMA) {
-		err = 0;
-		if  (dd->flags & TDES_FLAGS_FAST) {
-			dma_unmap_sg(dd->dev, dd->out_sg, 1, DMA_FROM_DEVICE);
-			dma_unmap_sg(dd->dev, dd->in_sg, 1, DMA_TO_DEVICE);
-		} else {
-			dma_sync_single_for_cpu(dd->dev, dd->dma_addr_out,
-						dd->dma_size, DMA_FROM_DEVICE);
-
-			/* copy data */
-			count = atmel_tdes_sg_copy(&dd->out_sg, &dd->out_offset,
-				dd->buf_out, dd->buflen, dd->dma_size, 1);
-			if (count != dd->dma_size) {
-				err = -EINVAL;
-				dev_dbg(dd->dev, "not all data converted: %zu\n", count);
-			}
+	if  (dd->flags & TDES_FLAGS_FAST) {
+		dma_unmap_sg(dd->dev, dd->out_sg, 1, DMA_FROM_DEVICE);
+		dma_unmap_sg(dd->dev, dd->in_sg, 1, DMA_TO_DEVICE);
+	} else {
+		dma_sync_single_for_cpu(dd->dev, dd->dma_addr_out, dd->dma_size,
+					DMA_FROM_DEVICE);
+
+		count = atmel_tdes_sg_copy(&dd->out_sg, &dd->out_offset,
+					   dd->buf_out, dd->buflen,
+					   dd->dma_size, 1);
+		if (count != dd->dma_size) {
+			dev_dbg(dd->dev, "not all data converted: %zu\n", count);
+			return -EINVAL;
 		}
 	}
-	return err;
+
+	return 0;
 }
 
 static int atmel_tdes_crypt(struct skcipher_request *req, unsigned long mode)

