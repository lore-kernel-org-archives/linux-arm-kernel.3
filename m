Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57807CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 20:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IBZfgEBkACCVPCY7cmNFU2XJMM4Oc8OiZa4+OutXhL4=; b=2WIJU0GOzi+yS1Ffi0km2lwgGI
	uOBhenoMxpiu/a0+kfbvjpIwC3Xzyi3if+sNM+ZmRHYJREPziDE3oC78q9PqjumWbab5oDqA1XSat
	aIjZw5pNo67tV4bjG+TkW3NdLdNHV22NhF+Ey42trE/lsFiDJWwo3KL/COa85xsXK/VB7rPJbNGeu
	UQW7A/MQTTrvFmJW6aHGwfmpzl1qC29aEB+gFfSHnQ6LMWFea9pKz9qTD9RdSBfeNGrSjOOjWCYVI
	afvrmwUxatZeVJWeD5pOR86RzUILWK/UBl8jqgpaqJ8XYHqqYsECT0V1fxunzgLtZkGFpsbtQh8xu
	v2Vw2TmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTmzn-00000009tgG-3RY7;
	Sun, 31 May 2026 20:42:55 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTmzk-00000009tfo-3Djm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 20:42:55 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780260167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IBZfgEBkACCVPCY7cmNFU2XJMM4Oc8OiZa4+OutXhL4=;
	b=rtRbvVNt/FVTtFQI8eay7CtAJiC+YH8+qMSrnGE5bJsNcddDC+kHU/ZtB+2BlHiFt1OhPa
	D86IaCSZ4+acAqIFkgfp1FlCwLFQM5AW4AjMdfVtHyGDkwK2Mo0M+AVTTOzs0MYnrVw8EF
	sdwZ7kkPjRdOsgZN25qhy7ZJPiQTWLM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Royer <nicolas@eukrea.com>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	stable@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel-tdes - use scatterlist length before DMA mapping
Date: Sun, 31 May 2026 22:41:17 +0200
Message-ID: <20260531204115.689052-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508; i=thorsten.blum@linux.dev; h=from:subject; bh=K9rdvMtrnZVho4l72+9X4eVyV5teUZKLUUzsbCLc2Os=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkyc14zLOBhNjCuaTd/pfVb4pHF3gns6/kMd7At6zi+b ZPuHJ57HaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJrAhXJwCMJG2Iob/BR/25Lx+13xjwXmn BQlPbz2dW7NcJj9/V3tMpI5wjbvOS4Z/asytH2LqD0e5LTKMs4vaF3Wj4r/r1Tk7U/LYT+z5NyO MHwA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_134253_665800_71A5A8DF 
X-CRM114-Status: GOOD (  10.32  )
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

Using sg_dma_len() is only valid after mapping the scatterlist with
dma_map_sg(). However, atmel_tdes_crypt_start() uses it before mapping
to compare input/output lengths and to compute the transfer count.

Use the original scatterlist lengths before DMA mapping to avoid reading
stale or uninitialized DMA lengths when CONFIG_NEED_SG_DMA_LENGTH=y.

Fixes: 13802005d8f2 ("crypto: atmel - add Atmel DES/TDES driver")
Fixes: 1f858040c2f7 ("crypto: atmel-tdes - add support for latest release of the IP (0x700)")
Cc: stable@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-tdes.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index 643e507f9c02..0d62b24e9fc7 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -463,14 +463,14 @@ static int atmel_tdes_crypt_start(struct atmel_tdes_dev *dd)
 			IS_ALIGNED(dd->out_sg->length, dd->ctx->block_size);
 		fast = in && out;
 
-		if (sg_dma_len(dd->in_sg) != sg_dma_len(dd->out_sg))
+		if (dd->in_sg->length != dd->out_sg->length)
 			fast = 0;
 	}
 
 
 	if (fast)  {
-		count = min_t(size_t, dd->total, sg_dma_len(dd->in_sg));
-		count = min_t(size_t, count, sg_dma_len(dd->out_sg));
+		count = min_t(size_t, dd->total, dd->in_sg->length);
+		count = min_t(size_t, count, dd->out_sg->length);
 
 		err = dma_map_sg(dd->dev, dd->in_sg, 1, DMA_TO_DEVICE);
 		if (!err) {

