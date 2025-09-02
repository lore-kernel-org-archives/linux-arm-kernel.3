Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2377CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+zU65F7Gerz/ADwaQ8W/yEAgtxRKhLtaag+pELJ150=; b=jrMfh21nGx4eN2jVFjaiFxG4jB
	XfbAuSGSoAY0KMzyI819FRINtwwY4FG8znZHj6905vIv+XKn78lYlnOD58QFZNMH5Li7TDRY9LfnX
	PhLrXQV8LWyATU5pTmkYRAjRn19psSpRa6+Lz7/ZDLZ5MFZskDTG6oW62SK/RENFc/d41U8YXMf7M
	eOMQRewr5FhT9Ga081UuBSIBiofSgGPUpaKuv0L4uewJl3soO37quFUm54ZzwHphy63W/unjkiGps
	HpH2qGbqInb4kw0x1Jtg5aq578IZ/6v9qLgI9ujK8W4OquvZQkb3aYBOjHaICk7WRvpZCFfFYNRux
	sXch6WWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWPC-00000001bh9-3b8m;
	Tue, 02 Sep 2025 19:10:58 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQya-0000000013O-0tT1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:23:09 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3d1bf79d6afso2250339f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 06:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819386; x=1757424186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+zU65F7Gerz/ADwaQ8W/yEAgtxRKhLtaag+pELJ150=;
        b=f+Fw6iNoLhxOFxhFdeTPaY4OBB+8tpwhYTB1moY1iGtGBmlom2H0vrfOY0Gxtml6sf
         +ZOReZs6HLOLRmc1r+nwcu/YDUSNKSPeNEsEHTsgkCTjccHr6SeF0d5qzRFJPqJOtHr7
         o5/7JDeFAGToUupT0j3reRLI+FG8/1hYHcyIQn33MPkoEV/rqV5TIcanjDPIUKNmJPi5
         hsFsHLnTo1+NuNWfN9o4cMFk15OemTGh8zSVbRL0Zeha7hf3e1KE1usGCyQl/9qEo3Q2
         HWSugKDnjy8NyRAFEi5kIo9kbdE+4c6DNcyn8hUSi0/fGPBQsbIziQmrqTEvitSK3dFA
         NXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819386; x=1757424186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+zU65F7Gerz/ADwaQ8W/yEAgtxRKhLtaag+pELJ150=;
        b=AyIYygCsncPyp0RWFz847jhFM2wElZOAKz1S4CBrJG8RsaxuVSA/NtNBU6Pr0lPj6W
         Glq/hrd5b2ZXvkTo7jqWtVl6FYy/9NZloa6n0KNHXxRwUXXmDFlBRJFeRp38r2GFSmwc
         YGX5GZ70uUyZUI5BDnqL775tG/MZxG5BaRXk742r9eW9m9ZpJ2nHhPhy7lpI5gtZIqLQ
         pQ15fucS3x7AjcrtTD1BIZRob6U9HIpkgQmKSum0/hyZYnMe4y8BtfodiALLh4OwOrMp
         C89Z9WdZGbDnqiGl259l2+S4uo3QvYCnduEGjRuj/3liK8gkMmoJVKib45BdV3S2d/p/
         9cPA==
X-Forwarded-Encrypted: i=1; AJvYcCVH2WaDZhULp27wwv/QL4rKWmOSY5dExuzs4SCGJXuz6PoUEwsTa1zasXJ8cQGkhA6+7jkW6TvdkjTnL89rUkzv@lists.infradead.org
X-Gm-Message-State: AOJu0YzcGRZ1ojFLVi/iWhkknFriEod5aBZRWA/BK3A7FiaBzTlor1dd
	bEu1FL/pao6a9uX9IpiHYALwkqFK5D93NLKUM/DJumLIlXOdashZJ/JO
X-Gm-Gg: ASbGncucSlIRQVIUk9Yb8MX8xhuzv4wd+/Ktif6xcIODhFkSt3WJ3QZkhWpGRccpOyd
	2FpVwKI+Mp4VxMn8jLVVZWEeb86CWGQy1N0J7wqU3e/7UVg+r0OFohbEIeqd7tk5cnFdsLc9mhz
	f2Fwz+wOkaDBZQnvfm5AkhhpCUhB+ZFM1vmaLHPlyKeYHr86QiyY1Ys0+kRSoydTYuE3TYCbyKn
	Vsidf29pk/Lj34IYlz9De5qBhD6eJZj5FHkbkWdMYRrVAHBjAV5vl5+gHFh1RgHBO3r/9M1mqjG
	ZfVp3vt/CPwMJ0x2QmoWU1n33CyaIm6zlBdlVKDN3mewsTncYaRi2xr78U1bEpQYYrEpy59HVWC
	wjnkB/Uq8o6dC2nWaMCpWC7uqN2G5SZ+kZ6Lz9pmcsgof
X-Google-Smtp-Source: AGHT+IGEIroq02nSpRHx0vFtxRxr9TNdfsRxwLjDOb7ndAqqFPycS5qCf/jnA7MepquM0G+zsISS8Q==
X-Received: by 2002:a05:6000:2281:b0:3ca:83e2:6339 with SMTP id ffacd0b85a97d-3d1e02cb35fmr8305578f8f.49.1756819386400;
        Tue, 02 Sep 2025 06:23:06 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:23:06 -0700 (PDT)
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
Subject: [PATCH v3 9/9] crytpo: sun8i-ce - factor out prepare/unprepare from sun8i_ce_hash_run()
Date: Tue,  2 Sep 2025 16:21:34 +0300
Message-ID: <20250902132134.3287515-10-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
References: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_062308_251054_99AF6215 
X-CRM114-Status: GOOD (  14.03  )
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
index 6573c566bd0d..d01594353d9a 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -313,18 +313,15 @@ static u64 hash_pad(__le32 *buf, unsigned int bufsize, u64 padi, u64 byte_count,
 	return j;
 }
 
-int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
+static int sun8i_ce_hash_prepare(struct ahash_request *areq, struct ce_task *cet)
 {
-	struct ahash_request *areq = container_of(breq, struct ahash_request, base);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct ahash_alg *alg = __crypto_ahash_alg(tfm->base.__crt_alg);
 	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
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
@@ -345,18 +342,14 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 
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
@@ -434,22 +427,59 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
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
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
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
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
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


