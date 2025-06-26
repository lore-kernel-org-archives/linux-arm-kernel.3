Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A25C83013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgIbzVPscBuyqUEBsClRFHHr0kmYa9s+xoX+40DNp18=; b=XkI8+qJOh3nezndKlWXBCsO585
	C2t90p6hHtI2uYrSwZdYUCD535dnTiXBprtIR/XmT2PQ4J4Z3kpj0wcCk2gf5zlewUqIbQgZ7lxFM
	Slv0FCFmxoTAwGQYev0vq0EWqVwYZKy2vcI4cwEoI+pb8DlZVNsxWx68Si3+z1HGS2UQ3r7J0mG7i
	e6D6e5VDn3Nl94t3Oth3wdxm3PK7D/SVRBg3G/wv+E//3NN8Qq2+haLNQokTDM6IgbZ53kVQK2mpy
	/Lx2FXwIsOX5fF70gFawP5LbfI8TU+oJ8g0cYLpxt5YCLCII1L1SFf+5PQ/ILsRayLiU5VpO0V1Oy
	N0QUixSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkh0-0000000BNyw-0U9p;
	Thu, 26 Jun 2025 11:22:58 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjO9-0000000BDtO-22Zz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 09:59:26 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ae0e0271d82so22462466b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 02:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931964; x=1751536764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgIbzVPscBuyqUEBsClRFHHr0kmYa9s+xoX+40DNp18=;
        b=ZXXHgMXaOGhmXEQBAzEFU0dUIxSSbJQLq+b1H7wcAM/Vj0yepGh92i0gxfsfJ8k0rn
         JCAYyezGi7hcIiYpelS1UaGap6qhNEBk8MasOjEY8hOJJih4VdIxOo4NGaAhy0yANEN7
         +cNeEf3bhwuspz1ild6HREyiY6k0izCCJU/vE0RbYQxIutENLiY17KgoyuyHKWc/45jW
         eZKGGiQG+g4/qiQpV/R91QNsOQs5ckuIdgbdpCzjqI+op09ab10wfxCImPAIGhBK44pt
         YB13zDCavnF+VRtCOEBXrX9UwKUTT25SeD7UbzFG9tleU7LNpmoBmglQXxaRwPatEIwv
         4rWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931964; x=1751536764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rgIbzVPscBuyqUEBsClRFHHr0kmYa9s+xoX+40DNp18=;
        b=ExL2+b+RaibVcWv8OxyWL858iiF4eSQxyfU2m3yI5qh9ItiCtPwhdT7/9FOM9hQ/OO
         bd2C0s7OZYcn6WveCXPOBTFC17pJPXl9UHEDqmpZLy1A9FO4hOTM1DRHKIKCV/6ZKlhs
         sKrhvfo7od12CkJpBodPQF8JbyX2uDfKJ521EdqtJrvlK+gZuvpyLtwajuOJXHvS99yo
         GwWVFgSRxXxNc6VWeNmegYOyt0vmZbIoeq3dOZ94marN3fd8K4vAQ2d1/0Nrat4pkVOz
         3m+HjI+HXewNhgQ4s9MySxOgqdCN8/miOpQ3N4jApRG0bIMmiFFsJuBGS9fPmHlkMSb5
         q2lg==
X-Forwarded-Encrypted: i=1; AJvYcCVrRcK3En8pcqkg7Y1DMxuEXwo1jpmpRKtGJ04KzjkG07Jv2aKN10a4qzj6xBTFq9KEdE57YhBAPR+l2/84Fsth@lists.infradead.org
X-Gm-Message-State: AOJu0YxHzNC8MXKxKu9o3Z90E5MkbbtTvz1beZyIQrEzBc8u2fetnnqF
	cR4Cz+xxoxbcMi+TTrij9uY3kR94GPYfcuRrasbQO+5rAzyZOGloXREi
X-Gm-Gg: ASbGncvt1V4U9XqZCLuOmvfy2OLy76LA4l+HeJtRIDcDE9FbrzheMm05pZLrOi5kdcB
	zkUF2hQJCcIUpatVmqI0HK0zbbtuJEYqjn3qkc1XPU0QK9R5iJanIT8jn5SlsKwUKbwfbzy/tMn
	ZpVprOnSJJRkjM/Qxts+Phe7wTXEXmzAXIGZbjl5yHd7NRHaCXZdLFthv8vpMqLVBXtHNxrnIhW
	eqxz+yFapWcyaRm5U2Y9KuBGuoE0ZaSJrNzmOew4xZwREGv3oE/gL2Nr1lHOLh47Fq8DgXNyjMt
	f5YJCgMstk+5hienadKSNJpG/6Wj+PtU4otKyHxFPjUBduASEMc591ceyu12qeDACZZ/tq5KxBd
	DLlCekkp7be35oQ==
X-Google-Smtp-Source: AGHT+IHJfX+7ivm4fdZr8aEC60S1v6KlfF4DtnJ6WAAHM60+ZeTeCtoGepFQRb/ZdyWtPXc8/FAGAQ==
X-Received: by 2002:a17:907:94c7:b0:ade:bf32:b05a with SMTP id a640c23a62f3a-ae0be53a92cmr665540566b.0.1750931963697;
        Thu, 26 Jun 2025 02:59:23 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae06aa5ff34sm1014106166b.40.2025.06.26.02.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:59:23 -0700 (PDT)
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
Subject: [PATCH v2 05/10] crytpo: sun8i-ce - factor out prepare/unprepare code from ahash do_one_request
Date: Thu, 26 Jun 2025 12:58:08 +0300
Message-ID: <20250626095813.83963-6-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_025925_523763_ADF5768C 
X-CRM114-Status: GOOD (  13.34  )
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

The crypto engine workflow for batching requests requires the driver to
chain the requests in do_one_request() and then send the batch for
processing in do_batch_requests().

Split the monolithic ahash do_one_request() callback into two parts,
prepare and unprepare, so they can be used in batch processing.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 64 ++++++++++++++-----
 1 file changed, 48 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 3ee0c65ef600..7811fa17388c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -312,18 +312,15 @@ static u64 hash_pad(__le32 *buf, unsigned int bufsize, u64 padi, u64 byte_count,
 	return j;
 }
 
-int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
+static int sun8i_ce_hash_prepare(struct ahash_request *areq, struct ce_task *cet)
 {
-	struct ahash_request *areq = container_of(breq, struct ahash_request, base);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct ahash_alg *alg = __crypto_ahash_alg(tfm->base.__crt_alg);
 	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
 	struct sun8i_ce_alg_template *algt;
 	struct sun8i_ce_dev *ce;
-	struct sun8i_ce_flow *chan;
-	struct ce_task *cet;
 	struct scatterlist *sg;
-	int nr_sgs, flow, err;
+	int nr_sgs, err;
 	unsigned int len;
 	u32 common;
 	u64 byte_count;
@@ -344,18 +341,14 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 
 	bf = (__le32 *)rctx->pad;
 
-	flow = rctx->flow;
-	chan = &ce->chanlist[flow];
-
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
 		algt->stat_req++;
 
 	dev_dbg(ce->dev, "%s %s len=%d\n", __func__, crypto_tfm_alg_name(areq->base.tfm), areq->nbytes);
 
-	cet = chan->tl;
 	memset(cet, 0, sizeof(struct ce_task));
 
-	cet->t_id = cpu_to_le32(flow);
+	cet->t_id = cpu_to_le32(rctx->flow);
 	common = ce->variant->alg_hash[algt->ce_algo_id];
 	common |= CE_COMM_INT;
 	cet->t_common_ctl = cpu_to_le32(common);
@@ -433,22 +426,61 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	else
 		cet->t_dlen = cpu_to_le32(areq->nbytes / 4 + j);
 
-	err = sun8i_ce_run_task(ce, flow, crypto_ahash_alg_name(tfm));
-
-	dma_unmap_single(ce->dev, rctx->addr_pad, rctx->pad_len, DMA_TO_DEVICE);
+	return 0;
 
 err_unmap_result:
 	dma_unmap_single(ce->dev, rctx->addr_res, rctx->result_len,
 			 DMA_FROM_DEVICE);
-	if (!err)
-		memcpy(areq->result, rctx->result, crypto_ahash_digestsize(tfm));
 
 err_unmap_src:
 	dma_unmap_sg(ce->dev, areq->src, rctx->nr_sgs, DMA_TO_DEVICE);
 
 err_out:
+	return err;
+}
+
+static void sun8i_ce_hash_unprepare(struct ahash_request *areq,
+				    struct ce_task *cet)
+{
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
+	struct sun8i_ce_hash_tfm_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct sun8i_ce_dev *ce = ctx->ce;
+
+	dma_unmap_single(ce->dev, rctx->addr_pad, rctx->pad_len, DMA_TO_DEVICE);
+	dma_unmap_single(ce->dev, rctx->addr_res, rctx->result_len,
+			 DMA_FROM_DEVICE);
+	dma_unmap_sg(ce->dev, areq->src, rctx->nr_sgs, DMA_TO_DEVICE);
+}
+
+int sun8i_ce_hash_run(struct crypto_engine *engine, void *async_req)
+{
+	struct ahash_request *areq = ahash_request_cast(async_req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
+	struct sun8i_ce_hash_tfm_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_dev *ce = ctx->ce;
+	struct sun8i_ce_flow *chan;
+	struct ce_task *cet;
+	int err;
+
+	chan = &ce->chanlist[rctx->flow];
+	cet = chan->tl;
+
+	err = sun8i_ce_hash_prepare(areq, cet);
+	if (err)
+		return err;
+
+	err = sun8i_ce_run_task(ce, rctx->flow, crypto_ahash_alg_name(tfm));
+
+	sun8i_ce_hash_unprepare(areq, cet);
+
+	if (!err)
+		memcpy(areq->result, rctx->result,
+		       crypto_ahash_digestsize(tfm));
+
 	local_bh_disable();
-	crypto_finalize_hash_request(engine, breq, err);
+	crypto_finalize_hash_request(engine, async_req, err);
 	local_bh_enable();
 
 	return 0;
-- 
2.49.0


