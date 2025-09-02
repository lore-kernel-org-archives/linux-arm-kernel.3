Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BA7CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Brl2BLRMH8dw6ZRRE0AMqdemVZpKH9vXc+oBuQmErPs=; b=BAvQkNKc+9/1sMwDGFq/6Ak8pU
	fyTB//YU8LKD1Cox7UlV721lWHL70LYR6FwN4P/rGMtPYZy7UmJkyZaJeFScvxLHmcixGrO1Norhh
	YGlXI4nR2D0fupHxhZ3pRtYVrVzGo2gKmJJaTvYaM7k0kTn2WKefH6vR6V5poaYGZhSaQrY9GQv23
	KcjItYYT2AUxMy00I2etlUp8P2C0PcEue2UDt4smwitKZHSgkvWyr9JqdE2dABouqlunRu8NE60pD
	pPm7jiwv+aywzeDpjWhIe58axTEjdlgzhX3YYgroV3lQlhLzrI6FU9/GhMxpem+4v/gIDPk2OW3zk
	B3r42ClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWP6-00000001bYJ-3CI8;
	Tue, 02 Sep 2025 19:10:52 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQyZ-0000000012h-00RC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:23:08 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45b84367affso28833485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819385; x=1757424185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Brl2BLRMH8dw6ZRRE0AMqdemVZpKH9vXc+oBuQmErPs=;
        b=jFSokYumkNliKimVWh0V72WxrGfxKp5bbClf6vQj09Kn798zKcntGFZYjvbnwMDIyF
         tDgm7j6+VYUtuz2MbMlj5uE5KOekN/F0180X7fW81G8FWRQ/M0Jgu14IzspyqHPrASid
         lZ/lbGr0afh99eQcJNnsQGqXNjwIRmkHM1rGXHVU2KmIStn5lhwaqnWyJSn1bx4SSDYX
         rxo2MPWOkQHAQAe48A7JQYB+gVyRPmrmy/NFfR9bTBvVz0FM/XGQrJdnwX3OHfyAUj04
         1JHSt45lhXEwRteTSM1EOxoBBDv/CXcPpTeC/iMgaemMN3e8E7J1eKAtgNHfbBdMHB10
         trOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819385; x=1757424185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Brl2BLRMH8dw6ZRRE0AMqdemVZpKH9vXc+oBuQmErPs=;
        b=sL/CAhLEOkONM7YuCaki/jdju8BT/zqU/5jK/D6mMd6vSYDGcAKMCDQoo29U1OKewj
         mWX7GLYr3SmrhZt3Hmt1Wj+2CCDHEKGvxtJgGZcxX7/AzqOpQX6ztx5gqlNyGQdAZhG2
         UqiADY4IykerGlSOsx/EU3gMY+jHrg3CLw0zb+DYyJCNVnkSUeolK9Sqzkq2PHi1qmm1
         YmcCFerN3+qn74s2B7YbRLtKyVw+5W1OfTlvwXW65INcSYgmAnqmAFkVmf71OJeD69//
         YSAfBb/7yW2oBdbFcbvhWyv6DAsx1leIbCMH2t66r35bhjoYVLabo0UMhUWC+9KBGNDL
         fXOg==
X-Forwarded-Encrypted: i=1; AJvYcCUoRijN61pMxYXf1PGsRzhexiIq9gQ6+hiHD64y7K2KfbepC+LZJWMW3UImukPrSG3QQ/l9qFAjJXjSo2PhPct6@lists.infradead.org
X-Gm-Message-State: AOJu0YyVezmHmB64siCbtp4P+ALgi0jMtBxaCl/OfKn9/LLE6kvmqabg
	yBlbP9T6ZmmcyDKZm/8BI5dhBDKMxZaJeBgmEQdKuVDJkUBqGcgCt3Uq
X-Gm-Gg: ASbGncv7uNrcU4Y4l97sG9JVL4kAVCyo+G9cTa5+x5QhsaUKf+g1gRUk32RW4HlA4J3
	+LR7frs5Ao+X1FYRoLOhsJPCWEuxZh7ZQMRSsHDf98APZjfckawPJDfN+yIx8hHWbTGovWGFCeG
	+oIEItOZLR/UWMRAxweaAaug9jfGmrNzNHtCR6gCAUc/JZVpXJqNi9gZaM/H2UxcK34/j3+n5gQ
	kFKTlw9x2DuW++6IB6HHFAZZs/6haS+QzlcirsJ/DZsnNQBPTx6lHz75I+1GR9yc0MPdW8y2Wkh
	WbzD7OVUg2mRWTqOi/VLAvee+I32rbYoVVP1Y9VKyn5Bp+bE2wu5X2NxLOHljF28Mqiu5uL6INd
	ejWAQLmtob52wByliwxsxSEuAHNkgg33Wt1oYHjk2tU6P5xNEWdLNC6U=
X-Google-Smtp-Source: AGHT+IHVGvsGBQGQkvMvtDDfpFtA8mIByGRDIA1JCKyDlAWmlLEu0KLDhiMCrW7Q3CDU6nE/Q0y2eQ==
X-Received: by 2002:a05:600c:a41:b0:45b:627a:60cf with SMTP id 5b1f17b1804b1-45b8559b8edmr113456095e9.24.1756819385117;
        Tue, 02 Sep 2025 06:23:05 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:23:04 -0700 (PDT)
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
Subject: [PATCH v3 8/9] crypto: sun8i-ce - save hash buffers and dma info to request context
Date: Tue,  2 Sep 2025 16:21:33 +0300
Message-ID: <20250902132134.3287515-9-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
References: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_062307_045703_03AFA1AD 
X-CRM114-Status: GOOD (  22.12  )
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

Similar to sun8i-ce skcipher code, move all request-specific data to
request context. This simplifies sun8i_ce_hash_run() and it eliminates
the remaining kmalloc() calls from the digest path.

Since the 'result' buffer in the request ctx struct is used for from-device
DMA, it needs to be properly aligned to CRYPTO_DMA_ALIGN. Therefore:
- increase reqsize by CRYPTO_DMA_PADDING
- add __aligned(CRYPTO_DMA_ALIGN) attribute for the 'result' buffer
- convert all ahash_request_ctx_dma() calls to ahash_request_ctx_dma()

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 77 ++++++++-----------
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  | 17 ++++
 2 files changed, 49 insertions(+), 45 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index df2acef9c679..6573c566bd0d 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -58,7 +58,8 @@ int sun8i_ce_hash_init_tfm(struct crypto_ahash *tfm)
 
 	crypto_ahash_set_reqsize(tfm,
 				 sizeof(struct sun8i_ce_hash_reqctx) +
-				 crypto_ahash_reqsize(op->fallback_tfm));
+				 crypto_ahash_reqsize(op->fallback_tfm) +
+				 CRYPTO_DMA_PADDING);
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
 		memcpy(algt->fbname,
@@ -84,7 +85,7 @@ void sun8i_ce_hash_exit_tfm(struct crypto_ahash *tfm)
 
 int sun8i_ce_hash_init(struct ahash_request *areq)
 {
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
@@ -100,7 +101,7 @@ int sun8i_ce_hash_init(struct ahash_request *areq)
 
 int sun8i_ce_hash_export(struct ahash_request *areq, void *out)
 {
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
@@ -114,7 +115,7 @@ int sun8i_ce_hash_export(struct ahash_request *areq, void *out)
 
 int sun8i_ce_hash_import(struct ahash_request *areq, const void *in)
 {
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
@@ -128,7 +129,7 @@ int sun8i_ce_hash_import(struct ahash_request *areq, const void *in)
 
 int sun8i_ce_hash_final(struct ahash_request *areq)
 {
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
@@ -145,7 +146,7 @@ int sun8i_ce_hash_final(struct ahash_request *areq)
 
 int sun8i_ce_hash_update(struct ahash_request *areq)
 {
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
@@ -160,7 +161,7 @@ int sun8i_ce_hash_update(struct ahash_request *areq)
 
 int sun8i_ce_hash_finup(struct ahash_request *areq)
 {
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
@@ -178,7 +179,7 @@ int sun8i_ce_hash_finup(struct ahash_request *areq)
 
 static int sun8i_ce_hash_digest_fb(struct ahash_request *areq)
 {
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
@@ -239,7 +240,7 @@ int sun8i_ce_hash_digest(struct ahash_request *areq)
 {
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *ctx = crypto_ahash_ctx(tfm);
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct sun8i_ce_dev *ce = ctx->ce;
 	struct crypto_engine *engine;
 	int e;
@@ -317,7 +318,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	struct ahash_request *areq = container_of(breq, struct ahash_request, base);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct ahash_alg *alg = __crypto_ahash_alg(tfm->base.__crt_alg);
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct sun8i_ce_alg_template *algt;
 	struct sun8i_ce_dev *ce;
 	struct sun8i_ce_flow *chan;
@@ -328,12 +329,9 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	u32 common;
 	u64 byte_count;
 	__le32 *bf;
-	void *buf, *result;
 	int j, i, todo;
 	u64 bs;
 	int digestsize;
-	dma_addr_t addr_res, addr_pad;
-	int ns = sg_nents_for_len(areq->src, areq->nbytes);
 
 	algt = container_of(alg, struct sun8i_ce_alg_template, alg.hash.base);
 	ce = algt->ce;
@@ -345,19 +343,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	if (digestsize == SHA384_DIGEST_SIZE)
 		digestsize = SHA512_DIGEST_SIZE;
 
-	/* the padding could be up to two block. */
-	buf = kcalloc(2, bs, GFP_KERNEL | GFP_DMA);
-	if (!buf) {
-		err = -ENOMEM;
-		goto err_out;
-	}
-	bf = (__le32 *)buf;
-
-	result = kzalloc(digestsize, GFP_KERNEL | GFP_DMA);
-	if (!result) {
-		err = -ENOMEM;
-		goto err_free_buf;
-	}
+	bf = (__le32 *)rctx->pad;
 
 	flow = rctx->flow;
 	chan = &ce->chanlist[flow];
@@ -378,11 +364,12 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	cet->t_sym_ctl = 0;
 	cet->t_asym_ctl = 0;
 
-	nr_sgs = dma_map_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
+	rctx->nr_sgs = sg_nents_for_len(areq->src, areq->nbytes);
+	nr_sgs = dma_map_sg(ce->dev, areq->src, rctx->nr_sgs, DMA_TO_DEVICE);
 	if (nr_sgs <= 0 || nr_sgs > MAX_SG) {
 		dev_err(ce->dev, "Invalid sg number %d\n", nr_sgs);
 		err = -EINVAL;
-		goto err_free_result;
+		goto err_out;
 	}
 
 	len = areq->nbytes;
@@ -397,10 +384,13 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 		err = -EINVAL;
 		goto err_unmap_src;
 	}
-	addr_res = dma_map_single(ce->dev, result, digestsize, DMA_FROM_DEVICE);
-	cet->t_dst[0].addr = desc_addr_val_le32(ce, addr_res);
-	cet->t_dst[0].len = cpu_to_le32(digestsize / 4);
-	if (dma_mapping_error(ce->dev, addr_res)) {
+
+	rctx->result_len = digestsize;
+	rctx->addr_res = dma_map_single(ce->dev, rctx->result, rctx->result_len,
+					DMA_FROM_DEVICE);
+	cet->t_dst[0].addr = desc_addr_val_le32(ce, rctx->addr_res);
+	cet->t_dst[0].len = cpu_to_le32(rctx->result_len / 4);
+	if (dma_mapping_error(ce->dev, rctx->addr_res)) {
 		dev_err(ce->dev, "DMA map dest\n");
 		err = -EINVAL;
 		goto err_unmap_src;
@@ -428,10 +418,12 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 		goto err_unmap_result;
 	}
 
-	addr_pad = dma_map_single(ce->dev, buf, j * 4, DMA_TO_DEVICE);
-	cet->t_src[i].addr = desc_addr_val_le32(ce, addr_pad);
+	rctx->pad_len = j * 4;
+	rctx->addr_pad = dma_map_single(ce->dev, rctx->pad, rctx->pad_len,
+					DMA_TO_DEVICE);
+	cet->t_src[i].addr = desc_addr_val_le32(ce, rctx->addr_pad);
 	cet->t_src[i].len = cpu_to_le32(j);
-	if (dma_mapping_error(ce->dev, addr_pad)) {
+	if (dma_mapping_error(ce->dev, rctx->addr_pad)) {
 		dev_err(ce->dev, "DMA error on padding SG\n");
 		err = -EINVAL;
 		goto err_unmap_result;
@@ -444,21 +436,16 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 
 	err = sun8i_ce_run_task(ce, flow, crypto_ahash_alg_name(tfm));
 
-	dma_unmap_single(ce->dev, addr_pad, j * 4, DMA_TO_DEVICE);
+	dma_unmap_single(ce->dev, rctx->addr_pad, rctx->pad_len, DMA_TO_DEVICE);
 
 err_unmap_result:
-	dma_unmap_single(ce->dev, addr_res, digestsize, DMA_FROM_DEVICE);
+	dma_unmap_single(ce->dev, rctx->addr_res, rctx->result_len,
+			 DMA_FROM_DEVICE);
 	if (!err)
-		memcpy(areq->result, result, crypto_ahash_digestsize(tfm));
+		memcpy(areq->result, rctx->result, crypto_ahash_digestsize(tfm));
 
 err_unmap_src:
-	dma_unmap_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
-
-err_free_result:
-	kfree(result);
-
-err_free_buf:
-	kfree(buf);
+	dma_unmap_sg(ce->dev, areq->src, rctx->nr_sgs, DMA_TO_DEVICE);
 
 err_out:
 	local_bh_disable();
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index de3a096c476c..71f5a0cd3d45 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -110,6 +110,9 @@
 
 #define MAXFLOW 4
 
+#define CE_MAX_HASH_DIGEST_SIZE		SHA512_DIGEST_SIZE
+#define CE_MAX_HASH_BLOCK_SIZE		SHA512_BLOCK_SIZE
+
 /*
  * struct ce_clock - Describe clocks used by sun8i-ce
  * @name:	Name of clock needed by this variant
@@ -304,9 +307,23 @@ struct sun8i_ce_hash_tfm_ctx {
  * struct sun8i_ce_hash_reqctx - context for an ahash request
  * @fallback_req:	pre-allocated fallback request
  * @flow:	the flow to use for this request
+ * @nr_sgs: number of entries in the source scatterlist
+ * @result_len: result length in bytes
+ * @pad_len: padding length in bytes
+ * @addr_res: DMA address of the result buffer, returned by dma_map_single()
+ * @addr_pad: DMA address of the padding buffer, returned by dma_map_single()
+ * @result: per-request result buffer
+ * @pad: per-request padding buffer (up to 2 blocks)
  */
 struct sun8i_ce_hash_reqctx {
 	int flow;
+	int nr_sgs;
+	size_t result_len;
+	size_t pad_len;
+	dma_addr_t addr_res;
+	dma_addr_t addr_pad;
+	u8 result[CE_MAX_HASH_DIGEST_SIZE] __aligned(CRYPTO_DMA_ALIGN);
+	u8 pad[2 * CE_MAX_HASH_BLOCK_SIZE];
 	struct ahash_request fallback_req; // keep at the end
 };
 
-- 
2.50.0


