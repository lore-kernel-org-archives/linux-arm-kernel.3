Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694DEC83026
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4FE/m8CCQWWX6zEjUZSa1AuebcPVAo/kb1WN2hI258=; b=dXItbz1XezEKDxIw+GzUpbemWM
	m5d9V8iVBiko3GWOkAsCwrGf+klJQqttfN58HJqKSU0gUxXJ09/Q4qB1fCdhy17pMFnwGbJ1g4LSI
	uzIZb4Cspcy1Vnxl+yhTxy6ixTYufDH4NaZOpFv93oWZS6OT9cughe44YgXaqSJtjZzLJY6CLnx4a
	upak4FvyIhsBWxLPthf7yVte39f0HtE+GOWF8oL5wTIBpFZa0DcPEEmD+mIi4R9MI9AbaAvdEOZHd
	/qEbrFCF34+eomrEdZvECUcBxOxsqHlVmhBm015ry1terqBgz02PibpMnz96whbwvjEUk88lfnEGB
	OzPfa32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkgz-0000000BNyT-23O8;
	Thu, 26 Jun 2025 11:22:57 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjO7-0000000BDt3-43Jt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 09:59:25 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ae0de1c378fso35923466b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 02:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931963; x=1751536763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4FE/m8CCQWWX6zEjUZSa1AuebcPVAo/kb1WN2hI258=;
        b=WGL84sHBR8+L7wW6+esyVXivvhBUnajcAxtQzglYJvkaRGO8+RyJBkgX5vYo/ALsC3
         Njp7aEs1fLsoxFcD2Sn/fMawtXYFVcK8m1FSS2RwI6rDMqEUe8w4YIIdfKaZfi6oscNd
         THUagVD5OrsrAgBktGKXiz0gYpb3boxnwDp/ufh1lAzY95GAxTIUFwWaWlvl1eGK+qnL
         NAoJme2sUE3Ys7O1ifNUqgthPaHGlJMVhySy3P9JNvle1NIdfdlDDOGijMDUWIohLvSI
         r3oUsJzhmINibIO39k9aIhYJS5z7yeuK62GWXpghhZNVvQ3RzTCrtlCbZun2DoM4Vzv8
         hILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931963; x=1751536763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4FE/m8CCQWWX6zEjUZSa1AuebcPVAo/kb1WN2hI258=;
        b=nEUyGHpOmyrLdL5QqnxXhtrMs0kKujReK8QfLBMUvOkinFDPDdZofHSBoDT8IcuB6h
         84/sjWuaUdy3As284jPe2Md/JNPx28heiQDBGjvl83SaZp11ImPLE47b93Y8utL+MpFq
         BCm6liMnzihXH59pH8Z2rpbNE1dRlZGT3Dyg6Lyxooi9May4lfMzrjYnGlh6ej61HZIR
         zqAuHb8N4GPbcIe4j4aJk8cznWCl5QHqKswseVEj5jvM95FPgxVQl5JwfLevxc4R1IL9
         NjBF/8NDBMbsXX9zmBE1imi0nkhWQefkyBR0mS5Xb+g5YyWBy3ueyympafBcxhIpNQAO
         Jx1w==
X-Forwarded-Encrypted: i=1; AJvYcCXyR1q5phcfCjEvyaRaJALN1+oXUoR9gWNAFYbPQnE7v5eCQmdi/zgVRDXsoZI5jVCSzIkY8qxFh9u3hS27+MJI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4SWRFhLXI3lEERRizf8dM1Xn2A6spf7kHsHP/GG3l6qAAcWN1
	2DnvZkNY/YOFm6w6eQdnGI7CfuZHvHCYvhI2rd+CAJVkWXdO+9nTwtFN
X-Gm-Gg: ASbGnctV9wfC9nuTybys7g1c/9PHw0ytdLmY/YAF1dwR6TKl0sWcp7O6cP+G5WSwF64
	ETeEL6RGGU1ChoBmqUl1Uk7OfJ4ox/2T8HC3AoldoVMy2C135rr4glxJcyqsWWzUtTwmFqhbQ4M
	XA31qqZlu0Rl5t4B0PonyqRSYTzavP2axqYaVAd4CUz7B6A4+c5W47+3zXOrga4EhTovTs5AI2b
	mZ8D34JsW6Wqi37TEsI7RH9jlZWVPeKE6Ijn/yfMLgo9zk/vqygJtvrjrfwyTyFKRG5y9uebbKf
	woQpYzDHChuL7p/fK3H8On3zip9hH7m+BgPW0EufUf4wqr2NCBDPTEQINWDCk6bV4GXS2U1BlLv
	6etQB/yiXVI2P1v33kFdxQzDv
X-Google-Smtp-Source: AGHT+IFTZlskgagUQmsCBIaQcTzLFQ/L/bhoraExJkrhCa/vRJ39QMtLqAaw8cYJYMf4uvVB6AQrMw==
X-Received: by 2002:a17:907:d26:b0:ad8:9e80:6baf with SMTP id a640c23a62f3a-ae0be95d15amr719826166b.13.1750931962452;
        Thu, 26 Jun 2025 02:59:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae06aa5ff34sm1014106166b.40.2025.06.26.02.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:59:22 -0700 (PDT)
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
Subject: [PATCH v2 04/10] crypto: sun8i-ce - save hash buffers and dma info to request context
Date: Thu, 26 Jun 2025 12:58:07 +0300
Message-ID: <20250626095813.83963-5-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_025924_021414_B92ABCC4 
X-CRM114-Status: GOOD (  17.88  )
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

Currently, all hash processing (buffer allocation/deallocation, dma
mapping/unmapping) is done inside do_one_request() callback.

In order to implement request batching, the hash buffers and dma info
associated with each request need to be saved inside request context, for
later use (during do_batch_requests() callback).

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 56 +++++++------------
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  | 17 ++++++
 2 files changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 61e8d968fdcc..3ee0c65ef600 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -328,12 +328,9 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
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
@@ -345,19 +342,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
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
@@ -378,11 +363,12 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
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
@@ -397,10 +383,13 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
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
@@ -428,10 +417,12 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
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
@@ -444,21 +435,16 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 
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
index 0d46531c475c..90b955787d37 100644
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
+	u8 result[CE_MAX_HASH_DIGEST_SIZE] ____cacheline_aligned;
+	u8 pad[2 * CE_MAX_HASH_BLOCK_SIZE] ____cacheline_aligned;
 	struct ahash_request fallback_req; // keep at the end
 };
 
-- 
2.49.0


