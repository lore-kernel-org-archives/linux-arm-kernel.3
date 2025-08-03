Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C820AC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 19:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlcibDkuEhs59MfzxPNpL2Xe4LDD/D/d8iw52Y6RVVM=; b=wXctzfIERXAqgUS/KNpYC2A4Fb
	2XNrCTgJF5rhNW52r93+wcFo4ZTpm6jDXEEFLIXFYzYi32gaYY05Fn81+/vEBCNuCz2fG7NF83rPS
	m82UH0xB5jcSkMLif/uS7s9Fqm2KMpr9+A2uv8BAJ7OAz1m0HXBVjYvCXnfj6teCNbP6kbZY9S46I
	WDwnFm74gEU4GJt3nNKzCKqe0fkkB6cUc9XgJatwP3pq0SuWQt3ATUU6JoJzdT9M6tOrv/s+ukpLw
	4l++kaOSSa4iGLJFKrUmPty/6M6vKOVQWMciAxM4AJqFCY9ShUMVPHfHqNbpRVaTlEOfP5L57PdnQ
	9b8b/xig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uieOZ-000000091LX-1Ov2;
	Sun, 03 Aug 2025 19:29:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uie6w-00000008zY1-45FI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 19:11:12 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-459d7726ee6so2776565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Aug 2025 12:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248270; x=1754853070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlcibDkuEhs59MfzxPNpL2Xe4LDD/D/d8iw52Y6RVVM=;
        b=kj9hC/lr9I3YF8WIMmeujclLR33YMM+vmDgzQz3TpeWp3I53dTOdsH5ovj/F7NyksS
         JnV8Mo57JwnBGFZadMcqiK8Lrw3T20NGxRBUnqXkVZV9KVLHbALAd3lJWYRDDzSjv5Rr
         QlC2lPaWbmZct272Hfc9m1HA8LltFaM+icrMKqwQBj6GtvjAxkYWChjEnBemFCv0LBrG
         PH8XQsXO5BqClzI48A+mO+CFi7q4rwq+O9Q9gYVsZf1AJhLI0XYHHuR2g8ezrcVkaEeD
         nWG4GJdX1DS2AwT5ndw316eRbDTn7PsE4MV+eA2+NZbdZxSTgmySf2/27f1iUDOv6Jmy
         6/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248270; x=1754853070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlcibDkuEhs59MfzxPNpL2Xe4LDD/D/d8iw52Y6RVVM=;
        b=hNEM4BEWhniAUxN7rJwXUBWFAQzmE+vMxDESN2heQ22BGyenDC39ErA7qXMASTz6ln
         uXLjQP/hCOj/faked2x7Fji8mW1UgwcgYksQ9GRSEaGprq8nVNZUm2u449ATV6Byrxs+
         9nC8pavop5dFWulFVv7kCy6rwU9JOBuctR9X7QWimhvyoN2CFYqzNQ+HvDGIrdSjS76B
         o9BS+iyY6KXIQGrwCNhc9P/ait3129enLUgdxOvB6qgwaliPqHCvoK2y7bXJu8Gvpw7G
         u2hH6aQVsQ3L1XKoLyZyTZromOkzxOG9SBab6kDi3jUAHReXA5Q2M/dkgefEQHrkuZeu
         zwXg==
X-Forwarded-Encrypted: i=1; AJvYcCVBSf73kkpvE/6fN3Ere20GS1eWrcIK50Kf9efGjU+Ss/S5q5D9cdYP0TcABl+Gp2LaMisd0Ws3XUtOucwM4wqX@lists.infradead.org
X-Gm-Message-State: AOJu0YzWIfO8uoLSTh8o3+Ph9RrwSNby0jbFyR+MKhz3bXmVpvg0eFmL
	9FwiFQ6l/98AVD78DnrF57mUx/zxYlVEK7MC7Q7ZH4vttQ37OAvgHkSG
X-Gm-Gg: ASbGncsyAd89bZTG259V71LQ5KubgLfUDe93gRecF1VGl0fN42yYSnE/CqlDrBBmE29
	ip0Ay5iMRLlj6XsU5gUgrNWeCMJt3yMdlY4l9j+I8c84tRIR7OG+zG1XXfWDhqLHXClrEV5Hn7p
	2J08QoCSP23BbMjTEHZQgQKZwsd+NR2stoPeXAJbB3gqDjBgaJJ6/yxBYQz48PmHAm+Fn3V0lt5
	4yBhyGFsRp1xNONeuOb6rGAPno+ZfLB5RNSM77NxvL/j425X81XBv+WXNaZUY8lyJzkCYWk4PrZ
	4Fcxez+2cTyL80YrAPugKjimFfSZ6M/pcdl0vENpgBaQff+iYbDk/kHxzCt10vJgk1CQLEJJaMm
	+6ewYVylrSyodHvNN8DK6xSgywfraiCkoGcwyF/cexvM5
X-Google-Smtp-Source: AGHT+IHtfKq4zUbwXfC6aQHk7cG+DjOfnqmfBGllrsesIhnmsE+kULjZ44WqEg9ZZudwAxTaMk52SA==
X-Received: by 2002:a05:600c:19c9:b0:459:d494:faf9 with SMTP id 5b1f17b1804b1-459d494fd04mr22075015e9.10.1754248269489;
        Sun, 03 Aug 2025 12:11:09 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:09 -0700 (PDT)
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
Subject: [PATCH v2 6/9] crypto: sun8i-ce - fold sun8i_ce_cipher_run() into sun8i_ce_cipher_do_one()
Date: Sun,  3 Aug 2025 22:10:26 +0300
Message-ID: <20250803191029.3592987-7-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
References: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_121111_012355_DA74224C 
X-CRM114-Status: GOOD (  12.56  )
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

Fold sun8i_ce_cipher_run() into it's only caller, sun8i_ce_cipher_do_one(),
to eliminate a bit of boilerplate.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 35 +++++++++----------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 69ba8236cf2d..f63d21cd1e52 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -360,31 +360,28 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
 	dma_unmap_single(ce->dev, rctx->addr_key, op->keylen, DMA_TO_DEVICE);
 }
 
-static void sun8i_ce_cipher_run(struct crypto_engine *engine, void *areq)
-{
-	struct skcipher_request *breq = container_of(areq, struct skcipher_request, base);
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(breq);
-	struct sun8i_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
-	struct sun8i_ce_dev *ce = op->ce;
-	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(breq);
-	int flow, err;
-
-	flow = rctx->flow;
-	err = sun8i_ce_run_task(ce, flow, crypto_tfm_alg_name(breq->base.tfm));
-	sun8i_ce_cipher_unprepare(engine, areq);
-	local_bh_disable();
-	crypto_finalize_skcipher_request(engine, breq, err);
-	local_bh_enable();
-}
-
 int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq)
 {
-	int err = sun8i_ce_cipher_prepare(engine, areq);
+	struct skcipher_request *req = skcipher_request_cast(areq);
+	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(req);
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	struct sun8i_cipher_tfm_ctx *ctx = crypto_skcipher_ctx(tfm);
+	struct sun8i_ce_dev *ce = ctx->ce;
+	int err;
 
+	err = sun8i_ce_cipher_prepare(engine, areq);
 	if (err)
 		return err;
 
-	sun8i_ce_cipher_run(engine, areq);
+	err = sun8i_ce_run_task(ce, rctx->flow,
+				crypto_tfm_alg_name(req->base.tfm));
+
+	sun8i_ce_cipher_unprepare(engine, areq);
+
+	local_bh_disable();
+	crypto_finalize_skcipher_request(engine, req, err);
+	local_bh_enable();
+
 	return 0;
 }
 
-- 
2.50.0


