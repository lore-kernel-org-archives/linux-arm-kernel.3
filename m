Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B506C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 07:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OquH3bzsfHd+3HPbbgh3jCNSZfVC5bnpDs/2otunY4=; b=t3JSUqFriPbtArBeo1eG4lExop
	hfekCcOeDoSglizMh8W1z4/VuOnMJoRSoblS4vWc71IhM0mcF99jwrsGSXIzwpZZJskf+RPd4YoPw
	nfYTKxi6Lv9dw/6jKacsIAE32ldSnHgIvvLy+2aO/pyYWmiS2CG6n1faqjHjFt0/7B+eSGEY8EFIG
	pbbMq00q5u6lp3eSQ7cnF+LVnuzl0au4nXMk2QkKQygVQdLCS5XxKz4QyzzV0PX1AGanlwDWI9AsJ
	X/it9lGU8L+fcVWrQd8hD/wcHruoumJe4zikK9GlYKDJ1fNx81fL7v0GMMhtcu8/dbvwHVKZxH1aR
	bqkg4EuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHsO-0000000Doiz-107B;
	Mon, 28 Jul 2025 07:02:24 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugH1r-0000000DjKN-1xsy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 06:08:08 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a4f379662cso2817823f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 23:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682886; x=1754287686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OquH3bzsfHd+3HPbbgh3jCNSZfVC5bnpDs/2otunY4=;
        b=Ze5/8A7yVmgiQQnHFQOi7wkLRglK34TT5NN4ED/r+/vP88z5MkcbcCMNBVCEey0s8i
         6L7l84lNb3bYIZtbG8TmYgUC+bFI93SrDZTtHmTDOZjsLe5sROEPcF2Fg/+o67uyavBe
         CLlZwII682GBw+/hmz66jUXW03EBJX0E7KHEd2lyKKdGzIqIE40EY9eB4rI7SLOCciA4
         OqIgPNhNVL/83IuKckkb8rL+Nsz9JcKabnDubRp0tiRk1HFxjiwxqStzincK0AZiWCRg
         yOog2pqaE5qXHP4u1n3WhdZQgFd1873z24aBVWzx/GS1PbF7kFdJJwMS2oQK5vMet+wt
         xxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682886; x=1754287686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OquH3bzsfHd+3HPbbgh3jCNSZfVC5bnpDs/2otunY4=;
        b=dLj+l5Qm1EVkaFnkAATSWIGG6SWMkpMF2WkM0KomJi0D/nc9Swm3TtUaoRKtku4S+9
         a3P1t57nUiFqcsy5sIwGW9UQxtJ5pk/bghWtP28pnoAvdc4ciWxt8/2Ypb42b46e4hnL
         jZi2ew15aCX/GAzAf9G7425hcKG+vpzbAjxPj5LFnD6grjz3FvZl8hkNfU+P9fwmkMEM
         mOb9fzqCGS+OHznL66OB+b53BIajtVrBvN2moLWw0gAIbIXcc5+bbjljKofVTeI6vNHF
         qyyGrgdlaBZOtV8Ch3DhX+W0W/g1L7fVLnfwYVtfboqVQuRUUekZPV47hLv/Yx1tHLp4
         EHNA==
X-Forwarded-Encrypted: i=1; AJvYcCUlTY1rnX6nPb+3ID3EbhgnM6N34Wc+QWrgTYBjmQ5BZ8eVoNXnUhAQKyy00rrKFVr/l/RZCDSTIpXZJ+WUl1IF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9TUWNuBU6omG+EO3LroIlyqVeb1uCsY9u7YlX9lGGTQP6Tji9
	dNyQazBCxIn4Pgvr+j0f+zUmHc7n12m5+TixCpp1gsKQpCPPHf678lcV
X-Gm-Gg: ASbGncuZomFDz/EaIqrYd8HW36EsAgr8PO/Ht/13naS9CJpHLz6HfsMagJzdsxb4X/q
	7KHVpF0qv5c5ylz73CAYwFtn0YjJIGG8YCNuB4YVEchYdrKcDPYm+SdcBFx3Nhk6RJyIBWVdTxT
	lwE2lqUgBfZwkBCVnTFtwvv3m+6tZ2U056VtsRd00VgJP2yhivfxlJkxt+eVfJOeq9mOCGfBeYZ
	otMrM7F1tdCQ/eiB0bLzVFUyvDJqP7F40LbYlsnemn8KkyycftHLVM6oxEzR0JrnWn8HGVPk312
	sI0aLYh4WzWxHrt0hX/7NqLOrwlVST0sapVdu1PY7CkpNaS/BMLkFFYn/LrD7z93/AkHcuwyihP
	YreRZHwIzSAkJraHsDi3N4ThK13+yjrgRmg==
X-Google-Smtp-Source: AGHT+IGmdqX9IZttVYna5BJ5xmHOnuGw9/sYW7r7das3xWFHBQfvmW7jivr0ZkUOFKLeiH33vIEMqw==
X-Received: by 2002:a05:6000:2011:b0:3b7:88a1:19f4 with SMTP id ffacd0b85a97d-3b788a11e12mr1371642f8f.27.1753682885748;
        Sun, 27 Jul 2025 23:08:05 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:08:05 -0700 (PDT)
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
Subject: [PATCH 9/9] crytpo: sun8i-ce - factor out prepare/unprepare from sun8i_ce_hash_run()
Date: Mon, 28 Jul 2025 09:07:01 +0300
Message-ID: <20250728060701.1787607-10-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
References: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_230807_510943_EA80213D 
X-CRM114-Status: GOOD (  13.10  )
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

In order to make the ahash code more clear and modular, split the
monolithic sun8i_ce_hash_run() callback into two parts, prepare and
unprepare (therefore aligning it with the sun8i-ce skcipher code).

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 62 ++++++++++++++-----
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index e28100c07b86..70c761baf847 100644
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
@@ -433,22 +426,59 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
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
+	int err;
+
+	chan = &ce->chanlist[rctx->flow];
+
+	err = sun8i_ce_hash_prepare(areq, chan->tl);
+	if (err)
+		return err;
+
+	err = sun8i_ce_run_task(ce, rctx->flow, crypto_ahash_alg_name(tfm));
+
+	sun8i_ce_hash_unprepare(areq, chan->tl);
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
2.50.0


