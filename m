Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1F6C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TntJfTNuRfw8H9ywL1n4IQi1UH/CB2DPSoGeEkzsKwc=; b=MB/AlvPU0E5xkh2nI8jFG7ooBp
	uvUS8tcuwcHRciyalL0KWlS/trdzsb/tuyKMkOUHGqWerC3rPoJuljHEFzBWcY3hc67ko11cvGxVV
	5YNIPR0ijG0BJ4YaLoUkzVfjoBgoZpmLz2pwvoha+DoFvXahrhCfVrn3Sf94HeZE3HVq49F7PoVSp
	6PSWKZPuRGvnWwlkQMKWjZjEBV6NCFgIbA4Ox8k9YSNmHxpLhOW0bxPRABQHU15OKR0PCOkYQ1vju
	rFAak76RZoRa6ODPaqwGVPs6XK05WSES8awTmrQOgVY8ChBAyhxcF1AW8cZoqf71TpaA+0U+nVWNA
	ib7p+kfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHUG-0000000DVqU-3kx7;
	Thu, 19 Jun 2025 15:47:36 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEJZ-0000000D2aP-2sa5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:24:23 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ade5b8aab41so145637766b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 05:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335860; x=1750940660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TntJfTNuRfw8H9ywL1n4IQi1UH/CB2DPSoGeEkzsKwc=;
        b=mfJi0HAU5DGLiaf26yEvUEbIValT43a35eKJnmW2JMlFoZHYi95JmzkrFLqha0ENUE
         JyXhCXSW5g7iGhOeaqdrKzRRrx5N4K1Y4oJvwVnLVM7GEpdaPOWvawcKwjLYcpQCS7TC
         Vs/9S7FiyvT7H/SuDgkSV/q5/VSSGajJKqdfFz0gBjdjLGVKHAPjZbVcATp9hjP0ua2M
         C9SGi1tc+oHeKBGfkGGJuqijraHKx6bcs8KGcC+1gsqCw4wnDKvDSFabzAXq8HPtT7Rh
         GgS6UuWyeqq7LUqppeDQWR53gY/0oVvvSxilf01HSS/Y/3ZiYMFwRhuDoN9PVAUwi5bC
         pTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335860; x=1750940660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TntJfTNuRfw8H9ywL1n4IQi1UH/CB2DPSoGeEkzsKwc=;
        b=kCV4WT51uSxOkKiS7+kVaVmRmRvI4J5L/tz5kXCiFFCFhfUSpYCwQHHj6tIdALL04I
         leKzpoCHb6N80K9hh10RRrcifI6tv/c0gphf8/Amt0upTH6NOzdbqn+eX734ppi5xqfC
         E4Lb44TA1g01J9U++LuuccINdv1Sz7RazS3KosT2z0YnvbGNSy7gmk57VjT30JqLgurx
         kNNyX7LjRXbZ02AqQwyx/ICo5SamdbvDrIVU2IAHTiOv5Oor7YsDm5tCBKuXRCssjXE6
         PD0JAct5IcvKZQ16r3i21AuLBc8tuCDerzn2lBNFap1OjqKsEs0pSOShXqyqQsuplQDT
         FYDw==
X-Forwarded-Encrypted: i=1; AJvYcCWVvrCs92UlNVd7fA+zdSwCaYt51q6oQxBMEKUkgbSfhRCqM9uawB5Ad58xshEhdRayHArG1Csqr9Mv9WLquNCn@lists.infradead.org
X-Gm-Message-State: AOJu0YzLlk7Au3+jJLVj73pDGmBHN2C4Ar/DzMh2j1E74wKTrd47Q/nP
	3FWwEs7VJxHwPFFB7MZkp1GKgJGaHoft8fMxLTXUwAraE/ggXQfcKbas
X-Gm-Gg: ASbGncvEr1CRKXedYxjUiThafZcgwPVJCou9MqURB/VzUvqYavWGfg6yRrjYwAKvX6V
	1kaZ9xGHi7QgsBJaF0du5d7sv419Ba5/il4ZO/D7z8fqscufhNtJP3TpZnUocBuccs/BU4NrMs3
	wQuz97AH6iaAmwSE7I3VhS8pf5EALZ0tb/LbVO9+cjZxHatNKIGfPgissdn2ioi3g3CB6L3FdYK
	G1qlK+d4QaZUSC8Z7Z3rzg+76DrPfP50zm5z/c7i4mBkJkPyRq+7Rlb3tm5S9uQf2dmCIMdDAIe
	WAn6QcYooM4YDq28Ufh60r+neXH4mRreHDbT0YiWWds1Muom4Q+1TvZx6HBMH3MGSdjmy1UzqvT
	qH8wFhL23466foQ==
X-Google-Smtp-Source: AGHT+IHwGI3VAdkps/w875TI+PTeKjZsVrfn6fAKJdMQGXVhrfDL7CIBgagxHkyrj9BPDgk2ITeRzw==
X-Received: by 2002:a17:907:3fa9:b0:ad8:89f8:3f51 with SMTP id a640c23a62f3a-adfad28d0e8mr2120856066b.6.1750335859832;
        Thu, 19 Jun 2025 05:24:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae000b02bd3sm504688066b.3.2025.06.19.05.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:24:19 -0700 (PDT)
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
Subject: [PATCH 08/10] crypto: sun8i-ce - factor out public versions of finalize request
Date: Thu, 19 Jun 2025 15:23:14 +0300
Message-ID: <20250619122316.2587236-9-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
References: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_052421_723480_D2B25E81 
X-CRM114-Status: GOOD (  13.06  )
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

Factor out hash and cipher finalize routines so that they can be used in
the next commits during do_batch_requests() callback.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 23 ++++++++++---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 33 ++++++++++++++-----
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  | 26 +++++++++++++++
 3 files changed, 69 insertions(+), 13 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index d206b4fb5084..22b1fe72aa71 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -346,6 +346,24 @@ static void sun8i_ce_cipher_unprepare(struct skcipher_request *areq,
 	dma_unmap_single(ce->dev, rctx->addr_key, op->keylen, DMA_TO_DEVICE);
 }
 
+void sun8i_ce_cipher_finalize_req(struct crypto_async_request *async_req,
+				  struct ce_task *cet, int err)
+{
+	struct skcipher_request *req = skcipher_request_cast(async_req);
+	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(req);
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	struct sun8i_cipher_tfm_ctx *ctx = crypto_skcipher_ctx(tfm);
+	struct sun8i_ce_flow *chan;
+
+	chan = &ctx->ce->chanlist[rctx->flow];
+
+	sun8i_ce_cipher_unprepare(req, cet);
+
+	local_bh_disable();
+	crypto_finalize_skcipher_request(chan->engine, req, err);
+	local_bh_enable();
+}
+
 int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq)
 {
 	struct skcipher_request *req = skcipher_request_cast(areq);
@@ -366,11 +384,8 @@ int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq)
 
 	err = sun8i_ce_run_task(ce, rctx->flow,
 				crypto_tfm_alg_name(req->base.tfm));
-	sun8i_ce_cipher_unprepare(req, cet);
 
-	local_bh_disable();
-	crypto_finalize_skcipher_request(engine, req, err);
-	local_bh_enable();
+	sun8i_ce_cipher_finalize_req(areq, cet, err);
 
 	return 0;
 }
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 7811fa17388c..5d8ac1394c0c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -453,6 +453,29 @@ static void sun8i_ce_hash_unprepare(struct ahash_request *areq,
 	dma_unmap_sg(ce->dev, areq->src, rctx->nr_sgs, DMA_TO_DEVICE);
 }
 
+void sun8i_ce_hash_finalize_req(struct crypto_async_request *async_req,
+				struct ce_task *cet,
+				int err)
+{
+	struct ahash_request *areq = ahash_request_cast(async_req);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
+	struct sun8i_ce_hash_tfm_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct sun8i_ce_flow *chan;
+
+	chan = &ctx->ce->chanlist[rctx->flow];
+
+	sun8i_ce_hash_unprepare(areq, cet);
+
+	if (!err)
+		memcpy(areq->result, rctx->result,
+		       crypto_ahash_digestsize(tfm));
+
+	local_bh_disable();
+	crypto_finalize_hash_request(chan->engine, areq, err);
+	local_bh_enable();
+}
+
 int sun8i_ce_hash_run(struct crypto_engine *engine, void *async_req)
 {
 	struct ahash_request *areq = ahash_request_cast(async_req);
@@ -473,15 +496,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *async_req)
 
 	err = sun8i_ce_run_task(ce, rctx->flow, crypto_ahash_alg_name(tfm));
 
-	sun8i_ce_hash_unprepare(areq, cet);
-
-	if (!err)
-		memcpy(areq->result, rctx->result,
-		       crypto_ahash_digestsize(tfm));
-
-	local_bh_disable();
-	crypto_finalize_hash_request(engine, async_req, err);
-	local_bh_enable();
+	sun8i_ce_hash_finalize_req(async_req, cet, err);
 
 	return 0;
 }
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 90b955787d37..1022fd590256 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -383,6 +383,19 @@ int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq);
 int sun8i_ce_skdecrypt(struct skcipher_request *areq);
 int sun8i_ce_skencrypt(struct skcipher_request *areq);
 
+/**
+ * sun8i_ce_cipher_finalize_req - finalize cipher request
+ * @async_req: request to be finalized
+ * @cet: task descriptor associated with @async_req
+ * @err: error code indicating if request was executed successfully
+ *
+ * This function does the final cleanups for request @async_req and
+ * finalizes the request.
+ */
+void sun8i_ce_cipher_finalize_req(struct crypto_async_request *async_req,
+				  struct ce_task *cet,
+				  int err);
+
 int sun8i_ce_get_engine_number(struct sun8i_ce_dev *ce);
 
 int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name);
@@ -398,6 +411,19 @@ int sun8i_ce_hash_finup(struct ahash_request *areq);
 int sun8i_ce_hash_digest(struct ahash_request *areq);
 int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq);
 
+/**
+ * sun8i_ce_hash_finalize_req - finalize hash request
+ * @async_req: request to be finalized
+ * @cet: task descriptor associated with @async_req
+ * @err: error code indicating if request was executed successfully
+ *
+ * This function does the final cleanups for request @async_req and
+ * finalizes the request.
+ */
+void sun8i_ce_hash_finalize_req(struct crypto_async_request *async_req,
+				struct ce_task *cet,
+				int err);
+
 int sun8i_ce_prng_generate(struct crypto_rng *tfm, const u8 *src,
 			   unsigned int slen, u8 *dst, unsigned int dlen);
 int sun8i_ce_prng_seed(struct crypto_rng *tfm, const u8 *seed, unsigned int slen);
-- 
2.49.0


