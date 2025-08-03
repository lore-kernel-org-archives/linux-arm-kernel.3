Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6552AC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 19:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XM9OSoT7EEhuPBZA6neX1BQbhTIUd6+o400NZdJKrYY=; b=BM5vbn0Tmm7RQYVr/sqOZjW8NN
	NVU0CV/Ij8krMt+lbicKauIYQJSjaWbi8RGvycmWONl50HuRcxwQ/paEa0VVSt2RZgsZ2is656Cya
	goCQHehg9Ir3cAEASERu5OSH9p2ev+mi0QEBTymXQdvRss/kIWpz/CCm75T/FQlvu4f7Gni9augTl
	7f07Mr1iJ/kWkwp+bLarDhggzAnCczyXrVbeKYs10hEzZS9QIzymAQDz4CBnXMAeHiUT/1qmPaWGB
	LojoRhNMQCqRK9GxDx8jqs0FArXcrQbeqaHe9OLNnu19oQHs5cJ67Z7jpDFaG4UNZKpR1mVAwlP9Y
	FJHZN1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uieR5-000000091Wf-0Hsp;
	Sun, 03 Aug 2025 19:31:59 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uie6y-00000008zYO-1HA5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 19:11:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4561514c7f0so31739335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Aug 2025 12:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248271; x=1754853071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XM9OSoT7EEhuPBZA6neX1BQbhTIUd6+o400NZdJKrYY=;
        b=UjqebE6AMfgDGhvR28khEyzDGF3bQ9h0fFzteicKGFO5ikFHiykad9RCkvSxrzYszE
         80dxn6GvaH1OB/5KOdeKdX26PJHAui2VfhED5A3AWovB9ph3ERLeCc+NrrDAOJHVlJXM
         mtt0JPpVZ01uh+Dl7H1MD3LYRjRpT7a/sjAOKci5P3xajjhDzFR+x12cnc0rYdERLE0P
         ohGbT9HkApx6B1N4/RxxAslSXv88KSnHkuw1lP519p7dbAOjydw5r37dCF2WpJjVAe6L
         2OM5b6JKQHfYnndgnir0w/KlUuKWlS0PqZA8Wyh7pCHGIzh+FLEZhteAZ/QT3/bzP2aS
         b5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248271; x=1754853071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XM9OSoT7EEhuPBZA6neX1BQbhTIUd6+o400NZdJKrYY=;
        b=Dq3htVebUtJjh1zMzlmvVJ8yf2IaNqXahyQGP8IYULmiWKXywsH29+gTnlk/3tMR3M
         gur3WnuaI2YHWDhbbiIi52JemnPeskpCECNVHyZ18Ndir2zyDMr6jDVlr1UrSYGpCymX
         bcP+U9myKb+iU84XawZpPfsAaL4z3vr5hZCkdST97UYrADgX2HAnS/JlQWaPOPLKl8P3
         kwlDI6eVyUF8Y8DaAwhgz/gX5FR4u2Lqd7p0E4fW/dsnrra46xiEHFnAu4tpFuAe/tSS
         X/uyZL9nWSnN2JSKOjaP31lUnENo3U7a1/GrQnrkj4hDnYNlv/InbqxAOC75fdHe9JAq
         4Mpw==
X-Forwarded-Encrypted: i=1; AJvYcCW1irambeuchxI0ZMVEhNfDkSS3K7kREfSlHMng1xi2hrefZBrgqTm/1KOFlf5Afzd2Fvx4EN5QZaTODOOOJbbl@lists.infradead.org
X-Gm-Message-State: AOJu0YzkhKxW9dVDz8QkJ/o5vQ6DkqjTrlRI50rRVv8XYKYfo/C+ISo/
	F3frcdKIXeZFeOlQrkcyEc4WJiSHQe9HkF4WdVnVU8JWwG6awFRyUMv4
X-Gm-Gg: ASbGncs1UYu+B6UNUXjgBPNng6+gBPBbi8ij5JerfVKoK5NtWmUOHs4367o91naxosH
	wgV3iiAadlOpo7IbD0mIf7w8SkcOBHKKYw69d39yMXywygoWDGBa3zSwJLLGIArTwBE4YD9GK7Q
	AMPIMq0jR7PY7xwk+cH9sdEUp93Qg5i6OTWKtOGlBeuNWM6+K0xyqTexJ9cgiHI35NLd9yahLY0
	EOyibwBDI14Q3CQtmhup4lVJ0SQ8I/wryriNkpRP1+6oM1PSep6Oq3O7eHiFJuq3u2KfjcVe3WA
	GZyzi3sus91K3AHkK1NQi2D6by9aek8JWLLu50wNNaWiFHYQ5eXYhXSmaYbx8z65lySQ2Vd6OGq
	iBLVg06wFKeURj375dZ2a3uYxVV3zDOIhQw==
X-Google-Smtp-Source: AGHT+IFrM0QM4YzPRURXac5BvBdFWZFGquBGzZldZ3BzPlquCbea+9B7z4XeK2D+7m4BeFHALnhLcg==
X-Received: by 2002:a05:600c:1c25:b0:456:27a4:50ac with SMTP id 5b1f17b1804b1-458b6b3d871mr47422325e9.23.1754248270728;
        Sun, 03 Aug 2025 12:11:10 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:10 -0700 (PDT)
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
Subject: [PATCH v2 7/9] crypto: sun8i-ce - pass task descriptor to cipher prepare/unprepare
Date: Sun,  3 Aug 2025 22:10:27 +0300
Message-ID: <20250803191029.3592987-8-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
References: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_121112_341248_79D35361 
X-CRM114-Status: GOOD (  13.58  )
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

To remove some duplicated code, directly pass 'struct skcipher_request' and
'struct ce_task' pointers to sun8i_ce_cipher_{prepare,unprepare}.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 33 +++++++------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index f63d21cd1e52..021614b65e39 100644
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
@@ -367,16 +353,19 @@ int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq)
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
 	struct sun8i_cipher_tfm_ctx *ctx = crypto_skcipher_ctx(tfm);
 	struct sun8i_ce_dev *ce = ctx->ce;
+	struct sun8i_ce_flow *chan;
 	int err;
 
-	err = sun8i_ce_cipher_prepare(engine, areq);
+	chan = &ce->chanlist[rctx->flow];
+
+	err = sun8i_ce_cipher_prepare(req, chan->tl);
 	if (err)
 		return err;
 
 	err = sun8i_ce_run_task(ce, rctx->flow,
 				crypto_tfm_alg_name(req->base.tfm));
 
-	sun8i_ce_cipher_unprepare(engine, areq);
+	sun8i_ce_cipher_unprepare(req, chan->tl);
 
 	local_bh_disable();
 	crypto_finalize_skcipher_request(engine, req, err);
-- 
2.50.0


