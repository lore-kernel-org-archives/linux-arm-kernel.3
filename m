Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E56CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtsBsRfxsCildLBhMXrk/1mukmK+Bo0TNCGWMCSP/qs=; b=RpgRCF+r+n/P4NZsNcL4oJenjF
	cOrCMODJBUBfPdIPTfCQrdTh+gbhcmgCUS1OKEahmanqZ3VfrnPQzDX86VGI7hAIdvROjdcoJLvMu
	ZOS0tq1Y6TvQo4BN4aEkT6SR4zagQl1qdlfb2kJfzsiVHNuTKsWApWuGeoTfwBX9SPRu0Ae2PEZwi
	sLFicj1aUlbglC8H3OBWL4KbHMGG9lQeI+Y0E+Nju4NujaLaqde7gIeAKM/kwouaH1nM0b5R1Esm4
	NKD2t77UdzM33HK/ZuHmFs1Iu6vbJCtQU5022UEY6g6PbInWBMHlS5MmD+i58El3Xu0Bu6AKR/QL5
	NKI4V6Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWOX-00000001arM-2IJe;
	Tue, 02 Sep 2025 19:10:17 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQyV-00000000105-1Dlz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:23:05 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3d965477dc0so815613f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 06:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819382; x=1757424182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtsBsRfxsCildLBhMXrk/1mukmK+Bo0TNCGWMCSP/qs=;
        b=iMRCKGokDdx1NcVZ5xhK5dqhLfV3cYaQybdkWIeUUeauDOHZ/9ipDrPceHlZSU3Q6v
         o7kMiON/uKDME4cwVDDNsoZSwi50mgtZyCelYk02IFkpjkYEnvQfWIbHhjiR9S46J7rW
         RpotypJVFfjGkRHL40E9SBahHrSEqsOAjf+ZBzAWDGI1hhwFCU7Ff1UZSOFUT1YEHIgZ
         pU5SEwlReZIZv5ZGbjJuJFIilP/f9MBvUzH+64GFZM/Db9sKd4kYJYyHwrdi9qEZEMH5
         LDgjL1PlLD+UqivhO6SE/fzf7EbvttP8s8nHgqTU6lGqw3FgaNu3lxKV5Qv/35PsK3XP
         IDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819382; x=1757424182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtsBsRfxsCildLBhMXrk/1mukmK+Bo0TNCGWMCSP/qs=;
        b=sRflNXijLc2czxghYE7cBxef594RLMtOlkUBRgGkkn6xsZwhaOXKwVIW6XirAVAtrF
         0wIk5crENpLcfw3avu5UcsGheDx95yUx5i2RgHsLnCoMi5T7uoIic2uiN8zd3YLHCN+x
         L/F9i7W+lilTv/CaSg9r1/mjZ1B8dwAS9l8UAixiKuqYuVEphkzWSsYDIgNPLQN5tAQh
         pU2ph69MztrPQSAHNmrCNhy1bfduE/QF/rkdnXmSuytI8Wg/mI6ruA8z0g61Q1GrsYtu
         mnwql1W/cbO3kHUrpNjiC1IIrLgdzNY4IjP0RNJ8xTYndzv8/yViqk0TKZByl1KV7KTo
         8MqA==
X-Forwarded-Encrypted: i=1; AJvYcCWoyCUPWn7zentCzT98L3hTiH513iOdSfgk3OlhMM0WsmHPObOaaZnTI/1zcJmBCAnfhKzJhTdbjXGRf6M3S+6h@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ8+pboNuySJeAd618erox0SSiNkxRfvZ/92zLDEmcCZ6iBKYK
	RxubXGRrU/i5kWkybDcjQ1uaw2RjWv4V43BpyKMaXdo5aoGL3btaAyTH
X-Gm-Gg: ASbGncvvm37MPm1tu9RyP8MdJoQwjWAsasPSa6ZwrvHej9ysn4pWMviy7bsMMH2PtQB
	LTEsbH8nH/WvRsPwEPH6LzWEiaysV/GXznFm2juWHu3Q+ScHwHdvFXO8VvntHM07BGUKS0IQHcL
	6cZabcqfYy3XgK3E+X4tmbD9xHXaybjObUj2v/vsDRVPXC61455Jr1SFMvpj2CB4S3eOmE5mKqp
	L2QPbNGiZ0OEtDPyvEq61grT6XqVEgakU00TdDjkz0+G7NEOuByub5atb081f3WHX69KEYObuF7
	boqPT9b1GJmRhyU7tBVUa9eUgYrrWrg/Y9zvkoj/rzkPJ4J0xgYoSfwCDMXmJ59H2NivThS5e+l
	MH6XISdnbzDz2I5/8KppsjC9x/xnm7TymdP4F37SNXbLG
X-Google-Smtp-Source: AGHT+IETMOb0Rz6uokv2cCuXIze1UZwZd7stbSLwZ5/eUHfLJCESg1DUz9amO71j1f3f3X5J/fE/FA==
X-Received: by 2002:a05:6000:2f87:b0:3d4:d572:b8eb with SMTP id ffacd0b85a97d-3d4d5820387mr7918018f8f.45.1756819381342;
        Tue, 02 Sep 2025 06:23:01 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:23:01 -0700 (PDT)
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
Subject: [PATCH v3 5/9] crypto: sun8i-ce - move bounce_iv and backup_iv to request context
Date: Tue,  2 Sep 2025 16:21:30 +0300
Message-ID: <20250902132134.3287515-6-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
References: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_062303_337120_6E397B4E 
X-CRM114-Status: GOOD (  20.07  )
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

Currently, the iv buffers are allocated per flow during driver probe,
which means that the buffers are shared by all requests. This works
because the driver is not yet truly asynchronous, since it waits inside
do_one_request() for the completion irq.

However, the iv data is request-specific, so it should be part of the
request context. Move iv buffers to request context.

The bounce_iv buffer is aligned to sizeof(u32) to match the 'word address'
requirement for the task descriptor's iv field.

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
index f12c32d1843f..de3a096c476c 100644
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
+	u8 bounce_iv[AES_BLOCK_SIZE] __aligned(sizeof(u32));
+	u8 backup_iv[AES_BLOCK_SIZE];
 	struct skcipher_request fallback_req;   // keep at the end
 };
 
-- 
2.50.0


