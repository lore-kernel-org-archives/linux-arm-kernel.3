Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378E7C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgIbzVPscBuyqUEBsClRFHHr0kmYa9s+xoX+40DNp18=; b=PSAgxoi12OwnE7qwWpMtU8Zr2M
	2l2e/DREtoFkMsGgg2WWqwfr8a/EHi7MjEsm8jBBCuCLmdNi0BzzIOCNcfaas4wupGm3gZRj2VvTB
	q/zJcjS0l8uhToztrFOydvXjbOAoO2G1hD4i77rEtUf9WjKvgVlu2BS2eHswTRr0jC3ejm0us8qQF
	RdgBOX5XTk/yfJp+n7qxvYnKaPgS4ymPe5WBuDL5aJghdmcdP3e67lVvvJRs6bxF6VDY4iz/2CmQ7
	LUpuYnolVYg8VX5l4ghJXE6WB/lf7GgbeHAUZN4BA88yB8y0OUNukaP3uMdVQWTXNqeTAmPolWGXr
	iroQAtRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHUC-0000000DVkJ-04Tv;
	Thu, 19 Jun 2025 15:47:32 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEJW-0000000D2Yp-0Sak
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:24:19 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ade58ef47c0so151161566b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 05:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335856; x=1750940656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgIbzVPscBuyqUEBsClRFHHr0kmYa9s+xoX+40DNp18=;
        b=cQBWxk/JjXGxSDGaLCkXPT0OcyrLgh97zY1m3/BTdFge1VzHIBqGHRhvNy8+X6E8ED
         BzgwsSV0DkaenelKam7+c6oOXENQcKFd2L86PsAWE1W7xQl0Z9k2tXc7N84Zsgm+3Ujr
         QHNlRi0JMZOrY7US//CXJMbrFOGIeChAburRomAs5GykWgqYWBVGfFzSMk9QcrWiuwtw
         4j/MN0tVuP5DILgq3A4tyaAwYagDW5ah1vT1I+TssHNJozsvVx6/oV8sZOF4q9bboTaA
         4jiqQul66c7sql1kEhNsKsRSzEhPvflbtkTl1WsC5CS3VUA5dcnY8gSCDLjz7Y27gkRI
         RuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335856; x=1750940656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rgIbzVPscBuyqUEBsClRFHHr0kmYa9s+xoX+40DNp18=;
        b=dmi30DbpscSLXKK1m30DTpkikMqaGl4wTwvCdcWJhDDGGCyMhkrFDxSoK7k9GDPWTO
         /HpDrDiE8+TQwF+8vqGt+RbqN3nns7edNonCyXMt1snvew3vVJxHnUHg8a9/qgQ4hgxM
         TU1+jlL+/KRGdGfeZjGKk8q4XRJQEhMb47sOmnFSi+q1j8xMJ9WWmyQrBfyreXvdgpyz
         +5Flnkx1I1HaEfjraclyHkSU9Cj4G97odqD1WQTIwxU0kpXWvRxqn/2X9pBOJwb0ths9
         Lp0I1+G3xMV6fjqyqRJdJpNe9chzEJvKInz4tj5gie4fNnsf9Jhd7lXdOvuVwikh+2oC
         NxmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjAEc19G3zzyJZtWDo5TiSi9oWXVAQnd9hz8qou7p9I+9LcdpFM8KSd/7Pm9hqRfxnjd80LY2J9iX3vVTiDhF/@lists.infradead.org
X-Gm-Message-State: AOJu0YwdA2eyJlccyPjJ4FzK+YYaSSNQw85Eu9koGIy7aN8Oh9sN3mui
	oYiR8sd+mqyQ3al1/iZBDJjsEkDf+XNLurI1rOHV9OYOaRLfwDDt9FKg
X-Gm-Gg: ASbGncuKDohoyDy2q7J41eg3+g1QDaD4LXnyUXD1J47xmqyaY2d2lp2OR7In9qn+ekz
	3aNT2/LnyOmeZDpFQ/yoCjN2jJX5YoH8RbN4Lf0alGTlceiyX0uO20qni3ixSRrNghCETFSmP+u
	c90hT+GGoXi4iCmC+y4Tn7KZY0ujE4qQknS6Jx6jFCBw0b2dAjXFFVzUIpPts7L4Dcjs14/bGYE
	UtkPNZoaWEPp6/pmZwJGvuVMazYlx/rrIYWhs+dgR0XvnWoLM6tper1cgfYfdzaCanKw8ExzPzb
	XLumWVQLJs+1JWPu909sCdFz3BHdiA9280CiA/tlBAe7bUxE7IKOcYRHGDU7IEGCutsWlmbU63T
	n2XyVa/9tnn+BUg==
X-Google-Smtp-Source: AGHT+IGp2TBBgU3kBXSIIbngsVXxutaDLHe7ezjC9aFjh5AHU1t7NJo73l09wb2AvdA+UM11p80C2g==
X-Received: by 2002:a17:907:e897:b0:ade:31eb:66df with SMTP id a640c23a62f3a-ae035285491mr322808566b.11.1750335856287;
        Thu, 19 Jun 2025 05:24:16 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae000b02bd3sm504688066b.3.2025.06.19.05.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:24:16 -0700 (PDT)
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
Subject: [PATCH 05/10] crypto: sun8i-ce - factor out prepare/unprepare code from ahash do_one_request
Date: Thu, 19 Jun 2025 15:23:11 +0300
Message-ID: <20250619122316.2587236-6-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
References: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_052418_149340_3AC0A704 
X-CRM114-Status: GOOD (  13.62  )
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


