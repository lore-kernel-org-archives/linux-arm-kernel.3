Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7879C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 19:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+X8fG0ywPfrmQVR6r26O20nKFt/URQggWx0ndoBVaZQ=; b=hk5Slnow5Xlx57Y12i3jeNHh8S
	XtN793652h8CKE5CDqiQMRO3mDDDq1/IbN5e5nSuq7STIrAhIzdfY86/LmoZ/oEoojCiuj4CQFMMw
	QH+G4eog+o9eT4mqPLC+d2wkbKvep4mjp4YRbelBGrxIgyYjCBwGLNbIXejS4anZPzW2hEjFJTEAr
	vV0KHB/UJ3DTGaecmhC/lW2MyatZMhVmdv1p55Tsvd1JFRs9vfsHUvVMrQS5eqsw+FFCD4rc/jrRz
	PC9mUJIU5r/l5MPLhydiwgO3hNuoBNV0l2Xslxp+7MmrYC0wkDGE/Lr7KqFQtzw4Ob/oz4nG9oUg1
	S9BHmAuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uieM3-0000000918W-1y3x;
	Sun, 03 Aug 2025 19:26:47 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uie6v-00000008zXc-3QLC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 19:11:10 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3b785a69454so1475992f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Aug 2025 12:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248268; x=1754853068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+X8fG0ywPfrmQVR6r26O20nKFt/URQggWx0ndoBVaZQ=;
        b=X8qHOYF+6bQgcHS6AGOY55ZLVcHNvknYR/IjfJEpEbRb8+oS7qzrJsgozxfYE1+L17
         TrR+UuCSPnuPzy1IjFPHymMr1i4pto1CEVKEaY9YmefjuyCA37pvO9LZMXxXxgxgApGe
         KuXMHyuSwewXpUxrefN4II6xuimfVk01+ITv4Ju14P3iLlf4gU4NaC2Sa/9zJvcx9Zlf
         Ycs9mrAX0Qd7Ld4MGzo1/yc4ido8WOnLq3tyVQF3yEEYKfshmkYdNNpqRCp8V55MQAaS
         ghgaWR+D/Hk8O6rBA/bFT7mp3CRTe5gGbiYhDYWZxmV+VG8sbWv+Xthu0wWOs3KfhC17
         2dww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248268; x=1754853068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+X8fG0ywPfrmQVR6r26O20nKFt/URQggWx0ndoBVaZQ=;
        b=VuconmwFKQLwIUS60a6cGn+7nW7C4xApjuaVzFHZAIsbQa39/Yr6mW2f8ozqnUhhLq
         vtWQxWyj3ZrW9tbuQ4FuOBWsp2FfGjDDl5pORPLd0ceaQHsYKKgPT/0r5Njy+jANApF8
         ymJogMt592AmTlrlnM1MVXjySx0KCQSsG6afpKaIgFpa264/Tf6CZujUSA7MLo32zvfj
         3jYfuysQOk/3htOQ6tvWc6Mo+4CuCSURS/hie6J2Pvf78KbOgcNS7p1roxpmbqNJqxif
         nhYoVyvz1ncapxVNBG4urOTJHLrlAgcWv/A6WpqKAUjlAY8OOMUGZVxQFWIzDBo3Df2B
         Z7zg==
X-Forwarded-Encrypted: i=1; AJvYcCV7xFH9SdKA4+dv7PMNXjZoohP8hUDChtfr5pEKyMJzulRqdchUEHUFPOo6IrXLf9+7ENp10lvLtnOKkaP2KCSY@lists.infradead.org
X-Gm-Message-State: AOJu0YwgarytZwgJtXbkmdI9cVPypsRosCNmr46yYt6DN+r0APCS0QyF
	jhwOiG+tza1OyCHoqG0YVCVUInFrJ+YSbutQaSmzqivQSIsh7hXr7V7g
X-Gm-Gg: ASbGncum1yxaFhWYYZF2/i6K/Xc4/O6IB8m1potvJhDsZDerVug7y1wVSCCmiqHvRJb
	+B3TEP/2m5HSFhMjrw8ISIAhdGQrbccBck0tJsUPMsPrmdFfeESb3kGe21Hum6tMOu4/ID+WSun
	yVidFZHJUihVZjKAT8MzeSk9ElthWqKHIwvCKiiBpAYdQlBXxjmWiF8ykm/Ug6pRRdYEUB0uQaD
	LQ8VNFXfCpmyyaWpZyiaTXh4CF3BkXNGMEPwo698cI9T75fAqhaaDh5PjOdr0/2M8q21ws6iAdI
	hGEMDP2Me2ZLbRuW+bg64musTx1YZAV4RsAzgWdqTnKO1WGMUB3dZzDTReC/3uaiMwfuxPDVlhB
	PSDoU9D6lDMii82zH7ox8uc1PbOF2EHCS6Q==
X-Google-Smtp-Source: AGHT+IHmU63nL7KhrYVgzX7obJHqRHaKsmdzwuH3zpDNrqoBJQ2FLJGMFWpvAfGKl736d20CpxhjUQ==
X-Received: by 2002:a05:6000:290c:b0:3b7:97c8:da97 with SMTP id ffacd0b85a97d-3b8d94baa99mr5568207f8f.43.1754248268189;
        Sun, 03 Aug 2025 12:11:08 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:07 -0700 (PDT)
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
Subject: [PATCH v2 5/9] crypto: sun8i-ce - move bounce_iv and backup_iv to request context
Date: Sun,  3 Aug 2025 22:10:25 +0300
Message-ID: <20250803191029.3592987-6-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
References: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_121109_854886_ADC19949 
X-CRM114-Status: GOOD (  17.87  )
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

Currently, the iv buffers are allocated once per flow during driver probe.
However, the iv buffers hold request-specific data, so they should be part
of the request context.

Therefore, allocate iv buffers per request, rather than per flow.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c       | 18 +++++++++---------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c  | 12 ------------
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h   |  8 ++++----
 3 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index c57c64a1a388..69ba8236cf2d 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -209,11 +209,11 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 	if (areq->iv && ivsize > 0) {
 		if (rctx->op_dir & CE_DECRYPTION) {
 			offset = areq->cryptlen - ivsize;
-			scatterwalk_map_and_copy(chan->backup_iv, areq->src,
+			scatterwalk_map_and_copy(rctx->backup_iv, areq->src,
 						 offset, ivsize, 0);
 		}
-		memcpy(chan->bounce_iv, areq->iv, ivsize);
-		rctx->addr_iv = dma_map_single(ce->dev, chan->bounce_iv, ivsize,
+		memcpy(rctx->bounce_iv, areq->iv, ivsize);
+		rctx->addr_iv = dma_map_single(ce->dev, rctx->bounce_iv, ivsize,
 					       DMA_TO_DEVICE);
 		if (dma_mapping_error(ce->dev, rctx->addr_iv)) {
 			dev_err(ce->dev, "Cannot DMA MAP IV\n");
@@ -299,13 +299,13 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 
 		offset = areq->cryptlen - ivsize;
 		if (rctx->op_dir & CE_DECRYPTION) {
-			memcpy(areq->iv, chan->backup_iv, ivsize);
-			memzero_explicit(chan->backup_iv, ivsize);
+			memcpy(areq->iv, rctx->backup_iv, ivsize);
+			memzero_explicit(rctx->backup_iv, ivsize);
 		} else {
 			scatterwalk_map_and_copy(areq->iv, areq->dst, offset,
 						 ivsize, 0);
 		}
-		memzero_explicit(chan->bounce_iv, ivsize);
+		memzero_explicit(rctx->bounce_iv, ivsize);
 	}
 
 	dma_unmap_single(ce->dev, rctx->addr_key, op->keylen, DMA_TO_DEVICE);
@@ -348,13 +348,13 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
 					 DMA_TO_DEVICE);
 		offset = areq->cryptlen - ivsize;
 		if (rctx->op_dir & CE_DECRYPTION) {
-			memcpy(areq->iv, chan->backup_iv, ivsize);
-			memzero_explicit(chan->backup_iv, ivsize);
+			memcpy(areq->iv, rctx->backup_iv, ivsize);
+			memzero_explicit(rctx->backup_iv, ivsize);
 		} else {
 			scatterwalk_map_and_copy(areq->iv, areq->dst, offset,
 						 ivsize, 0);
 		}
-		memzero_explicit(chan->bounce_iv, ivsize);
+		memzero_explicit(rctx->bounce_iv, ivsize);
 	}
 
 	dma_unmap_single(ce->dev, rctx->addr_key, op->keylen, DMA_TO_DEVICE);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index b7093fbb8e9d..c16bb6ce6ee3 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -759,18 +759,6 @@ static int sun8i_ce_allocate_chanlist(struct sun8i_ce_dev *ce)
 			err = -ENOMEM;
 			goto error_engine;
 		}
-		ce->chanlist[i].bounce_iv = devm_kmalloc(ce->dev, AES_BLOCK_SIZE,
-							 GFP_KERNEL | GFP_DMA);
-		if (!ce->chanlist[i].bounce_iv) {
-			err = -ENOMEM;
-			goto error_engine;
-		}
-		ce->chanlist[i].backup_iv = devm_kmalloc(ce->dev, AES_BLOCK_SIZE,
-							 GFP_KERNEL);
-		if (!ce->chanlist[i].backup_iv) {
-			err = -ENOMEM;
-			goto error_engine;
-		}
 	}
 	return 0;
 error_engine:
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index f12c32d1843f..0d46531c475c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -188,8 +188,6 @@ struct ce_task {
  * @status:	set to 1 by interrupt if task is done
  * @t_phy:	Physical address of task
  * @tl:		pointer to the current ce_task for this flow
- * @backup_iv:		buffer which contain the next IV to store
- * @bounce_iv:		buffer which contain the IV
  * @stat_req:	number of request done by this flow
  */
 struct sun8i_ce_flow {
@@ -198,8 +196,6 @@ struct sun8i_ce_flow {
 	int status;
 	dma_addr_t t_phy;
 	struct ce_task *tl;
-	void *backup_iv;
-	void *bounce_iv;
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 	unsigned long stat_req;
 #endif
@@ -264,6 +260,8 @@ static inline __le32 desc_addr_val_le32(struct sun8i_ce_dev *dev,
  * @nr_sgd:		The number of destination SG (as given by dma_map_sg())
  * @addr_iv:		The IV addr returned by dma_map_single, need to unmap later
  * @addr_key:		The key addr returned by dma_map_single, need to unmap later
+ * @bounce_iv:		Current IV buffer
+ * @backup_iv:		Next IV buffer
  * @fallback_req:	request struct for invoking the fallback skcipher TFM
  */
 struct sun8i_cipher_req_ctx {
@@ -273,6 +271,8 @@ struct sun8i_cipher_req_ctx {
 	int nr_sgd;
 	dma_addr_t addr_iv;
 	dma_addr_t addr_key;
+	u8 bounce_iv[AES_BLOCK_SIZE] ____cacheline_aligned;
+	u8 backup_iv[AES_BLOCK_SIZE] ____cacheline_aligned;
 	struct skcipher_request fallback_req;   // keep at the end
 };
 
-- 
2.50.0


