Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94839C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYtYa5Hmz7e97gZT2Sf2chY466RHYEoEJJ/npJRNZKw=; b=UrpkG7UcVEy+U5+UutimT5dW6X
	S5+1P2xT0VmqjFyLgAwir+S2CgEPLb1M09Hzu8SExwHs/I6f/68ua6fE4ILLrDPbJEmcZd/lCra5F
	fId3ceK6eQ9UzMkiGtRT64pxD83oodetfEHgv95Rbz8O8pTsIXlVdlWT+Bo4cfKbSS1MsgFgs4KFE
	PYg7HSD31zdjUdTIf2u2CwgYGjku92ex7YRC2QiZkV+FaFfvZE9GQPzy8UQ0UbDXfhsSQ5ZsI5Q9S
	wKpO/dc+We74pFBKCTImJDCPd4cF7GYsCGVbRplhg2QUc8Hsx4Gql7RAYut9VixYQjkBOYFyGnxkE
	T29reoKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH36G-00000009kpW-15OY;
	Mon, 19 May 2025 16:12:24 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2CG-00000009Zgc-1POf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 15:14:33 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso780720066b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 08:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747667670; x=1748272470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYtYa5Hmz7e97gZT2Sf2chY466RHYEoEJJ/npJRNZKw=;
        b=mMudD2+jj41ykTn5VFnVzln/SJS1rHLAMqXYR6p2cHWHgNN7Se4SaUuR9wok8+hY1E
         Ti6Gznp0lKm3c2V6kNPN7VFueQfXWUzBuOsjJRb2ICNQMjsAfxPM41IWrUW1zHKH8OZS
         ZPjNHbI3/IabPHpDDrCLbXYTlxvKz0w7VlMz3aF/GCaODcVOShAcu3bWtZMhxeP9Rjaz
         KflPznH7x/Wp+gKWZNyfhKYyBFW/G0wtCkm3JBws6+PFWYVGe6Yhf+m01WtPM40JSKrH
         Pl21FjxznQef2kVi6ODEB7iNyzWObeNda0AECU0w75KI0Vmo6w18UMJvbCCzZzJj15Rj
         kIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747667670; x=1748272470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYtYa5Hmz7e97gZT2Sf2chY466RHYEoEJJ/npJRNZKw=;
        b=o4qUu+s5DUaDMgFwxMWWQNkfVqk6FQbN77cyYY4cZ5uidGsaUiU5Y/eoeoZJdjSdIR
         cDNVH5nHbiX/nYeACeu0V5NaK7bsuErBDySzhi2FpqfmvPGJ3j8jpEKzHPqaXG5qvc5e
         pmyoCNI5RbCVCSBrTwp/P52LSkn5RAbQSm0s20lyFlbiGtIMdgQmXBAxNhVSqRC7Fl+i
         upi6Pblgi0e/Wt85fzC5PvX+4oG3onIRg4LFkgjagQ3rUOn1bDn0KCwu6BDhnRt1edtP
         ID0gWTVHUX3TjRKk/VGsd436OT0RpVPKOiQM3Ihc5IRnUoW2KbW2u7OxDyqA/Mk78SES
         12Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWmEUjSzYjgTh/eXG2XMc4p5HF1BOHDCLvD17wCj3IoTourNfW5U7NltuvAqsTGtvJPGEPN94bcT2A9dOKpRMiA@lists.infradead.org
X-Gm-Message-State: AOJu0YzKkZudObzMlW0pXLyH75vV5cpngqJlBXnYi3EixjuM1sUN1r2i
	N8/5ZsXvcQDx39P3QzFQl8q996UgqorKaKaSxLsF2jTWGCGLA+hCl1zJJD2J/w==
X-Gm-Gg: ASbGncsgsa4GzHKw/hW/SoxqhnuTB3dU2lOXGw6LGEmgII6+ADz/MAah6FN7CGNL3CV
	KMcymOr3+Q8VBv4zdzbosgmAfBUy49H9N2H3n08WVitP5eMsxBWIIWz89fZr+VjqRzdwE7zZ6Mn
	mwFXns+Sr49rAFTQ27e98PTqBqEb6d5Oc0DZHkcq2jWBICqSiUco+V8PWCUXdknn1u8pB5acvJy
	LxAYblGKzfHEaPlH9f/DfM+a/5lTBQji64LyX4bX9gJHmgERBWFaOdXEQAyykVMOE+uwj5gZCIB
	782xZFK6ZdLCqqVMTsL6mHsRF3ZM6i0V1UFjADKDcuOimhA9Jx77p1VM2TgISPWeEwG2W7k0DbX
	+yCc=
X-Google-Smtp-Source: AGHT+IEdFDlMvFo4JwLpnmG07B9+mYT8Lr9dmRx+b+IvnhMbKrdoukQEvMfyH7MVsguioYjxxvQVMQ==
X-Received: by 2002:a17:907:1c91:b0:ad5:5857:ece2 with SMTP id a640c23a62f3a-ad55857f064mr687560966b.37.1747667670306;
        Mon, 19 May 2025 08:14:30 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f07:610b:a400:6472:d2f9:d536:4c30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b08bsm608522566b.13.2025.05.19.08.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 08:14:29 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 2/3] crypto: sun8i-ce - remove ivlen field of sun8i_cipher_req_ctx
Date: Mon, 19 May 2025 18:13:49 +0300
Message-ID: <20250519151350.3442981-2-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250519151350.3442981-1-ovidiu.panait.oss@gmail.com>
References: <20250519151350.3442981-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_081432_372562_A5F15CD9 
X-CRM114-Status: GOOD (  15.47  )
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

Remove `ivlen` field of `sun8i_cipher_req_ctx`, as it is not really useful.

The iv length returned by crypto_skcipher_ivsize() is already available
everywhere and can be used instead.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 11 ++++++-----
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h        |  2 --
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 7cd3b13f3bdc..5663df49dd81 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -206,15 +206,14 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 	cet->t_key = desc_addr_val_le32(ce, rctx->addr_key);
 
 	ivsize = crypto_skcipher_ivsize(tfm);
-	if (areq->iv && crypto_skcipher_ivsize(tfm) > 0) {
-		rctx->ivlen = ivsize;
+	if (areq->iv && ivsize > 0) {
 		if (rctx->op_dir & CE_DECRYPTION) {
 			offset = areq->cryptlen - ivsize;
 			scatterwalk_map_and_copy(chan->backup_iv, areq->src,
 						 offset, ivsize, 0);
 		}
 		memcpy(chan->bounce_iv, areq->iv, ivsize);
-		rctx->addr_iv = dma_map_single(ce->dev, chan->bounce_iv, rctx->ivlen,
+		rctx->addr_iv = dma_map_single(ce->dev, chan->bounce_iv, ivsize,
 					       DMA_TO_DEVICE);
 		if (dma_mapping_error(ce->dev, rctx->addr_iv)) {
 			dev_err(ce->dev, "Cannot DMA MAP IV\n");
@@ -296,7 +295,8 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 theend_iv:
 	if (areq->iv && ivsize > 0) {
 		if (!dma_mapping_error(ce->dev, rctx->addr_iv))
-			dma_unmap_single(ce->dev, rctx->addr_iv, rctx->ivlen, DMA_TO_DEVICE);
+			dma_unmap_single(ce->dev, rctx->addr_iv, ivsize,
+					 DMA_TO_DEVICE);
 
 		offset = areq->cryptlen - ivsize;
 		if (rctx->op_dir & CE_DECRYPTION) {
@@ -345,7 +345,8 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
 
 	if (areq->iv && ivsize > 0) {
 		if (cet->t_iv)
-			dma_unmap_single(ce->dev, rctx->addr_iv, rctx->ivlen, DMA_TO_DEVICE);
+			dma_unmap_single(ce->dev, rctx->addr_iv, ivsize,
+					 DMA_TO_DEVICE);
 		offset = areq->cryptlen - ivsize;
 		if (rctx->op_dir & CE_DECRYPTION) {
 			memcpy(areq->iv, chan->backup_iv, ivsize);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 83df4d719053..0f9a89067016 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -260,7 +260,6 @@ static inline __le32 desc_addr_val_le32(struct sun8i_ce_dev *dev,
  * struct sun8i_cipher_req_ctx - context for a skcipher request
  * @op_dir:		direction (encrypt vs decrypt) for this request
  * @flow:		the flow to use for this request
- * @ivlen:		size of bounce_iv
  * @nr_sgs:		The number of source SG (as given by dma_map_sg())
  * @nr_sgd:		The number of destination SG (as given by dma_map_sg())
  * @addr_iv:		The IV addr returned by dma_map_single, need to unmap later
@@ -270,7 +269,6 @@ static inline __le32 desc_addr_val_le32(struct sun8i_ce_dev *dev,
 struct sun8i_cipher_req_ctx {
 	u32 op_dir;
 	int flow;
-	unsigned int ivlen;
 	int nr_sgs;
 	int nr_sgd;
 	dma_addr_t addr_iv;
-- 
2.48.1


