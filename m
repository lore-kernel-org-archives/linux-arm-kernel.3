Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B230BCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 10:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lK7aLsQ2vNUC+sXFqJ54lH3wydevJb7dJsdehGeIZEU=; b=oXKNFCWf6vTG2VtIJifd3vgZIq
	KKWSDgu65y4QAIDke50GGrKNcYOtWyJoKrUWy8X/9PlScN2PX/TpIccwUnnuqVE/8bt8EBXRwlnle
	ILTQucmTyatkvESlv/Nqi4YQM7Fef6XDwXWX7B6MyBAk0yV5vTUXQaqCb1SgfNvsMDoUCD+X4ualj
	CIPUTarbBHFtMNhBP6ykqWhukBkgpVqtfzTJqggRTNixwHTC6XuqyqQuMg0v/A0hSbHlbcpqvNtfV
	xbAYuMi7PjiWbQA4qMIjwFDUGwzWr61DqjyFp4XRILw2REkg2jdHdksBJcjKDuz57Jb7emab6LydQ
	fV9doLFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXcnA-00000009EtU-46Ee;
	Thu, 11 Jun 2026 10:37:44 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXcn7-00000009Esx-2nvY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 10:37:43 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781174256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lK7aLsQ2vNUC+sXFqJ54lH3wydevJb7dJsdehGeIZEU=;
	b=vcGNjb83OZRkvsvEjhdO3LYqqECTqMwfwPCNW/Q2Eu/Gl+S7nDf5tjGFwgpy4WaCr08fQ7
	tfyLzBuu5xZNXEi7ViodOHO1mMO/tnWgMEo6kc8rhGrz46YOGlv02xkhm0inJtnOIsYVRh
	fR6Ijg7efwr6kqA33vW9SVMNkTZFV+o=
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
Subject: [PATCH v2] crypto: atmel-tdes - use scatterlist length before DMA mapping
Date: Thu, 11 Jun 2026 12:36:35 +0200
Message-ID: <20260611103633.458381-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744; i=thorsten.blum@linux.dev; h=from:subject; bh=PoU866BV1nxWHRqy1pEpQ1dAssx7wsivtGO6ug6vq4E=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFla/Rsv3EzsPK6hbzoz1dlOUOKt/hGBavmFSrX8Svdzu p7tmxrXUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABOR6WNkmFbyfNavxZNdta9J uB6+Wz7//PsGP1/1zV2vFdZtmrj9aw/D/9qVaY6mwatklz81K/fO2mvqm/7B4r7x2ZA1a+12fe/ fzA8A
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_033742_476355_7E41A50F 
X-CRM114-Status: GOOD (  11.28  )
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

Drop the output scatterlist length in the fast path since it is equal to
->in_sg->length and does not change the transfer count.

Fixes: 13802005d8f2 ("crypto: atmel - add Atmel DES/TDES driver")
Fixes: 1f858040c2f7 ("crypto: atmel-tdes - add support for latest release of the IP (0x700)")
Cc: stable@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Drop ->out_sg->length in the fast path (Herbert)
- v1: https://lore.kernel.org/lkml/20260531204115.689052-3-thorsten.blum@linux.dev/
---
 drivers/crypto/atmel-tdes.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index 643e507f9c02..d380f6741a2c 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -463,14 +463,13 @@ static int atmel_tdes_crypt_start(struct atmel_tdes_dev *dd)
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
 
 		err = dma_map_sg(dd->dev, dd->in_sg, 1, DMA_TO_DEVICE);
 		if (!err) {

