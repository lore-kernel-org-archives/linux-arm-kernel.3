Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFFCC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfOFmSReN1wX8YEf6gXPwdHyf/C+wiQacKthqWE/o4Y=; b=ug+Z43JanKB8VGFicVY+eLAkbW
	K728HsCzclkw0zo23k0ykja9b2BVUW8fYhyAbVX7q9KNp7P2V+xzJv11h3whlFUVh7IDH3wuD9rA3
	4jtkAs9Ph4KhV1nhfvQrZ+FBtcCRcz52bD0Xibu0/iNv9JaVAeuFM6EmaLPiwZOEtEGuIdApDUzZy
	qUHCej/g1TjsxFCBaqntWGnjzKuYy5Cu8lLdBg3TFdPagp6cNSHRxP9gGqkbsmYNJI5bGF+gjuUz/
	dZv7+eBcl0IoOzp33/yNFMoENJICvAt537DBFPZVIefKcQ8v4MgJBCaA6QvizfhDElmprPv6pqH5v
	bGVhbcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIeb-0000000Dekg-3Anp;
	Thu, 19 Jun 2025 17:02:21 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEJY-0000000D2Zr-1rmu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:24:21 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ad883afdf0cso146746466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 05:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335859; x=1750940659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfOFmSReN1wX8YEf6gXPwdHyf/C+wiQacKthqWE/o4Y=;
        b=ZFB7uVfOmKDd7zKzxss1jeCn8JZvCCaoSY6ujkUEieIvtZNsptQyiC/kPSIWcpNBi8
         bIC8fxz5Y8LTijoh2c2titV1dxHf7pDUEKkBpIPN4v1TD55Ebclm8ZK2t3ynPCg6Cq3f
         SHCZF/0PeLscSRB9qHv0tAUJsGYSMjCPYj9esqzVh6gy67Xv6pPFyhaX3a6mbCw6DJ0h
         kVfZLC/qC0nQVbdzxEf7e0KXjZHBpLU8u4on6VPlr+8ZC40VkGOMnlO+COd2KhLowc3C
         vNQQfgbTwlhVDHMmjLV9K2DqdlOwnlW02y1250LoH2FBlU88G8z1lPZgqbw6yqX+OT1t
         ZCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335859; x=1750940659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfOFmSReN1wX8YEf6gXPwdHyf/C+wiQacKthqWE/o4Y=;
        b=LCSt2JCPQbMwsSTQWzQg4lN/40sT3E0OrKHCU42ommIopPRCqaSGLvepAcx+Yi3Db6
         YPjHFn7l3endbnzyQp9KDV5qTymsDBoQT/9D+QZ9Y2cP3UmfUjktOo3Vnt7tyEgtAMQ+
         mWR5TNcq9x7Nes+Jx004NB9m3Gzb8ynXa7bq84FtdYdrocNUO59gDE8Sx4ckQFoNDcYJ
         jYENcMIkHvrDhq83oVazY6m8UtQ40XUOwI9tL9TZ5CHaazreQrT3+Q6ZaaAoXIopzr9z
         P9CaCxopwUErlmNX3m8yINNIOyFWZd4XMGGmXM8YCAxcokLqFtzfVRJ7sRyZAxCL2w5s
         JIuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUATWc01GPGNg9pUGKzj5mcfbqhS2T2T7+XxjxhotVaJ28WjiLJnYy06QFRzoDMf4FCnB7Q3KGkcAxmj+PJ6sID@lists.infradead.org
X-Gm-Message-State: AOJu0YwiVrfKlagMK8CYJ8NcXN1hXOaQVSWsh33PZ9dKy9eRmnEcCwyQ
	ZbD6GTtBlQvb+D7S7bMCrRTVR1f/otC7MhtL/kK7ECFxGZYIBqiEX0ryto2kyw==
X-Gm-Gg: ASbGncv8SHDaZeaUEDbS7J2nXYxzAxdQ8Lmcz5RWHVxYCaGMPFE6oS47UAqRnWrYBDn
	ygyuSbF2K3Uc5BeqHixaXw0/ELHW6Pt/qSh5lj4sXUtw5d+cPVa74guiYcf7ApxYtv1pRWahDhb
	A5Ra8tyVqtHFpZfIScts7KdAqINdDKtA8wA3Rfo8viXeUnU6VctJR/graK9mVaqgpk8gaf6I8rC
	5WN14PmDF5Cvsxcr5SbLVpBEc8cr1tlTF7foZxeeXeYsyzjEJ7QoEf9gmiloKyya/nXQItJ60do
	X1YwEFVepaS0UMj4PNZ2WGyPiYu+MwK10K00Q8K/5kjXJOyEIVs0+xgPDqlEbkuvtpVNdfxr3GQ
	IrOsIo+dVpx4wmA==
X-Google-Smtp-Source: AGHT+IGEPeo5IOklcxib13+gmY/mAxR132u//d0bSaTarIv0yq4bk3Wfepb86FCqZ57HZAhqV1/TKw==
X-Received: by 2002:a17:906:c10f:b0:adb:3345:7594 with SMTP id a640c23a62f3a-adfad31e10cmr1852773366b.9.1750335858569;
        Thu, 19 Jun 2025 05:24:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae000b02bd3sm504688066b.3.2025.06.19.05.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:24:18 -0700 (PDT)
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
Subject: [PATCH 07/10] crypto: sun8i-ce - pass task descriptor to cipher prepare/unprepare
Date: Thu, 19 Jun 2025 15:23:13 +0300
Message-ID: <20250619122316.2587236-8-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
References: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_052420_492100_BCEA9FAC 
X-CRM114-Status: GOOD (  14.19  )
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

Rework sun8i_ce_cipher_prepare() and sun8i_ce_cipher_unprepare() to take a
task descriptor pointer as a parameter. Move common flow setup code to
sun8i_ce_cipher_do_one() and also remove the crypto_engine parameter, as it
was not used anyway.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 37 +++++++------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 5fdb6a986b1f..d206b4fb5084 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -131,21 +131,19 @@ static int sun8i_ce_cipher_fallback(struct skcipher_request *areq)
 	return err;
 }
 
-static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req)
+static int sun8i_ce_cipher_prepare(struct skcipher_request *areq,
+				   struct ce_task *cet)
 {
-	struct skcipher_request *areq = container_of(async_req, struct skcipher_request, base);
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
 	struct sun8i_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
 	struct sun8i_ce_dev *ce = op->ce;
 	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
 	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
 	struct sun8i_ce_alg_template *algt;
-	struct sun8i_ce_flow *chan;
-	struct ce_task *cet;
 	struct scatterlist *sg;
 	unsigned int todo, len, offset, ivsize;
 	u32 common, sym;
-	int flow, i;
+	int i;
 	int nr_sgs = 0;
 	int nr_sgd = 0;
 	int err = 0;
@@ -163,14 +161,9 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
 		algt->stat_req++;
 
-	flow = rctx->flow;
-
-	chan = &ce->chanlist[flow];
-
-	cet = chan->tl;
 	memset(cet, 0, sizeof(struct ce_task));
 
-	cet->t_id = cpu_to_le32(flow);
+	cet->t_id = cpu_to_le32(rctx->flow);
 	common = ce->variant->alg_cipher[algt->ce_algo_id];
 	common |= rctx->op_dir | CE_COMM_INT;
 	cet->t_common_ctl = cpu_to_le32(common);
@@ -314,24 +307,17 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 	return err;
 }
 
-static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
-				      void *async_req)
+static void sun8i_ce_cipher_unprepare(struct skcipher_request *areq,
+				      struct ce_task *cet)
 {
-	struct skcipher_request *areq = container_of(async_req, struct skcipher_request, base);
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
 	struct sun8i_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
 	struct sun8i_ce_dev *ce = op->ce;
 	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
-	struct sun8i_ce_flow *chan;
-	struct ce_task *cet;
 	unsigned int ivsize, offset;
 	int nr_sgs = rctx->nr_sgs;
 	int nr_sgd = rctx->nr_sgd;
-	int flow;
 
-	flow = rctx->flow;
-	chan = &ce->chanlist[flow];
-	cet = chan->tl;
 	ivsize = crypto_skcipher_ivsize(tfm);
 
 	if (areq->src == areq->dst) {
@@ -362,20 +348,25 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
 
 int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq)
 {
-	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
 	struct skcipher_request *req = skcipher_request_cast(areq);
+	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(req);
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
 	struct sun8i_cipher_tfm_ctx *ctx = crypto_skcipher_ctx(tfm);
 	struct sun8i_ce_dev *ce = ctx->ce;
+	struct sun8i_ce_flow *chan;
+	struct ce_task *cet;
 	int err;
 
-	err = sun8i_ce_cipher_prepare(engine, areq);
+	chan = &ce->chanlist[rctx->flow];
+	cet = chan->tl;
+
+	err = sun8i_ce_cipher_prepare(req, cet);
 	if (err)
 		return err;
 
 	err = sun8i_ce_run_task(ce, rctx->flow,
 				crypto_tfm_alg_name(req->base.tfm));
-	sun8i_ce_cipher_unprepare(engine, areq);
+	sun8i_ce_cipher_unprepare(req, cet);
 
 	local_bh_disable();
 	crypto_finalize_skcipher_request(engine, req, err);
-- 
2.49.0


