Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF630C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 12:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0o6+zdI0AtRq1Xlwz5OA5c9uHll3v6Nadhh0JoXi15w=; b=414S1ug4by7lrKYecTJbb4WUt6
	yxm6stn/Hk0q5CdWHKB4iGqvgQhg5/TCmctlQeXG7EEGP+BdJZYHG4Khd8+s40qrMlHowrPIrL9b/
	lURx/FY0jZySX54DmOK1jWV4buA7efZIcXzsUpOkVQql0qCbBIVetaxkhr/LieSCSlZfN8ERFFumT
	HGpmaxWINdPQsJjzqFK41abueO0opzx6kapRbh3eGDKT3BM6Q/z2qoOCARY+Y4MYefPyYwbbogiJr
	sw968gD0yeouZ9tNJZDFvnEPA1NhbExDf+xTmS6TZmq591TxFJm/NvrEM3z+bfAWGGcsWBdgR32qq
	thIQgJJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lvY-00000000MBt-0dBm;
	Mon, 07 Apr 2025 12:50:12 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lj6-00000000IYj-39VG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 12:37:21 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3913d129c1aso2933777f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 05:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744029439; x=1744634239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0o6+zdI0AtRq1Xlwz5OA5c9uHll3v6Nadhh0JoXi15w=;
        b=CT4n2kn/x0oRedpPhSy9qpo98MPfVeVgJ5jm99czKVKqzCiRfwtIwgov+z/KN7MyTm
         5sQR1EPOJyvjA3pnIryu7KSVJQ77wzrfIKyQXtPaF/WFOi7RCsNrplVAHJFBJl6QrqhR
         OR2AYwigYlR+d/wMmSNxPQkUJdgZCOOx6OkH3/gx4yIh3AGreKX4X9M30i9JTO6jsbQI
         1Z8rinGzmm46dkvXZwk2DOSbmIOr04kUvINVjkue+urtMit3Tb6yp41fFwlG2fTIyu9F
         LPySw6kHQuNsswsRnFO+/P34KAiqdJVY/ZoY+rr4IRH399KSEbMerxY0dO7fF6efzStj
         rRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744029439; x=1744634239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0o6+zdI0AtRq1Xlwz5OA5c9uHll3v6Nadhh0JoXi15w=;
        b=nHUfNyfmoL92d4wfOXFyidCof/dqzjcJUVCFJ/gl65bfUvKrFlNRt6ML5CjozvXXSB
         Zgp+Czt6psBHRocz5IcgdkklyvoH/gsk1RJH21qWUA2hUJhkfPL62HOBQmSgyFcNNYgT
         bCz09zKWYn1Bo3utfyHRgz54dgPboLMGcWZ5zvLukssq8F+dokKq21jqEVJZEeiyTy1G
         UT6HZb/CmuWRLQzzjhx7unehoLWsNEmI6DI3NzkM3roWcMGvLUEbcKQQFmtwZqpZg0/T
         XueMbossaBvX8f7d5OJSCLz3SRX4tOD86L0cZlqFSXgNLkbDqO5mBo+fCsE6to2yivNi
         XEZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8ivaj1zm8rprtdXy6T7KP8SZYHuPfbeuudsuZ7O8QQiLo+L7mnZlBNC8oeWn6LJU82wWf786635CSW5YomZry@lists.infradead.org
X-Gm-Message-State: AOJu0Yx28QJBtqC5E1OqXL7cT+48AQGg8alcOwTyaYJ7uxqHtIwkm9Ez
	wDjLdFHJFRyKmymFvMDzJactO3kpR1S/W7dIUrA426QTYPv2xqATfjN7jg==
X-Gm-Gg: ASbGncuiKUdGo/MP8h3ZlL1dEY02sKGVge7C0v7lP/q7uJuekdxmso75SnPksLLmXRx
	M9SjngR+oMHRaPfvZCSBDL2Ogb3/20+P0iMI0WrIOHSkeuy32XQHhLi3iiXNr2o1cYniTJx6uyF
	Mprhs5tWZvUNK0FiM2MSiqF9CQCUjX/gpUQ1EZhimJocAu2n8VPfo2oAWOsRvkaacBdcAOhLz30
	zsDhlo5du6coqqpzSCeR5Kicx0tMcb5j1jmbp0PdhJoc14NZ96dNEV6lDQskRuKtVrBxFoGoTZz
	RntfHxakl2ZE3adVzcD3Z3BfyLhkGOkk7VMuQ+tRA7KVnk8SeorqmHvfsQ5uUbyqMnvJWBCY
X-Google-Smtp-Source: AGHT+IEPI0/uAmG1j3NVe3lMMXToyTKqXz/tt6wVkSqKVKUWUxmvO7uD/TEvDrvrmVRLlqnGT6k+9g==
X-Received: by 2002:a05:6000:2489:b0:390:e9ee:f27a with SMTP id ffacd0b85a97d-39cba94dac8mr10539389f8f.28.1744029438981;
        Mon, 07 Apr 2025 05:37:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b76f2sm12065198f8f.53.2025.04.07.05.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:37:18 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: linux-crypto@vger.kernel.org,
	herbert@gondor.apana.org.au
Cc: davem@davemloft.net,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/4] crypto: sun8i-ss - use API helpers to setup fallback request
Date: Mon,  7 Apr 2025 15:36:03 +0300
Message-ID: <20250407123604.2109561-3-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407123604.2109561-1-ovidiu.panait.oss@gmail.com>
References: <20250407123604.2109561-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_053720_792089_8D4AE319 
X-CRM114-Status: GOOD (  12.43  )
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

Rather than setting up the fallback request by hand, use
ahash_request_set_callback() and ahash_request_set_crypt() API helpers
to properly setup the new request.

This also ensures that the completion callback is properly passed down
to the fallback algorithm, which avoids a crash with async fallbacks.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev

 .../crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 49 ++++++++++---------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index 753f67a36dc5..8bc08089f044 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -150,7 +150,9 @@ int sun8i_ss_hash_init(struct ahash_request *areq)
 	memset(rctx, 0, sizeof(struct sun8i_ss_hash_reqctx));
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
 
 	return crypto_ahash_init(&rctx->fallback_req);
 }
@@ -162,7 +164,9 @@ int sun8i_ss_hash_export(struct ahash_request *areq, void *out)
 	struct sun8i_ss_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
 
 	return crypto_ahash_export(&rctx->fallback_req, out);
 }
@@ -174,7 +178,9 @@ int sun8i_ss_hash_import(struct ahash_request *areq, const void *in)
 	struct sun8i_ss_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
 
 	return crypto_ahash_import(&rctx->fallback_req, in);
 }
@@ -186,9 +192,10 @@ int sun8i_ss_hash_final(struct ahash_request *areq)
 	struct sun8i_ss_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
-	rctx->fallback_req.result = areq->result;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
+	ahash_request_set_crypt(&rctx->fallback_req, NULL, areq->result, 0);
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_SS_DEBUG)) {
 		struct ahash_alg *alg = crypto_ahash_alg(tfm);
@@ -212,10 +219,10 @@ int sun8i_ss_hash_update(struct ahash_request *areq)
 	struct sun8i_ss_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
-	rctx->fallback_req.nbytes = areq->nbytes;
-	rctx->fallback_req.src = areq->src;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
+	ahash_request_set_crypt(&rctx->fallback_req, areq->src, NULL, areq->nbytes);
 
 	return crypto_ahash_update(&rctx->fallback_req);
 }
@@ -227,12 +234,11 @@ int sun8i_ss_hash_finup(struct ahash_request *areq)
 	struct sun8i_ss_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
-
-	rctx->fallback_req.nbytes = areq->nbytes;
-	rctx->fallback_req.src = areq->src;
-	rctx->fallback_req.result = areq->result;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
+	ahash_request_set_crypt(&rctx->fallback_req, areq->src, areq->result,
+				areq->nbytes);
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_SS_DEBUG)) {
 		struct ahash_alg *alg = crypto_ahash_alg(tfm);
@@ -256,12 +262,11 @@ static int sun8i_ss_hash_digest_fb(struct ahash_request *areq)
 	struct sun8i_ss_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
-
-	rctx->fallback_req.nbytes = areq->nbytes;
-	rctx->fallback_req.src = areq->src;
-	rctx->fallback_req.result = areq->result;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
+	ahash_request_set_crypt(&rctx->fallback_req, areq->src, areq->result,
+				areq->nbytes);
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_SS_DEBUG)) {
 		struct ahash_alg *alg = crypto_ahash_alg(tfm);
-- 
2.48.1


