Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF140C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 12:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJwN15SFuWFw+J8LbQ3OEgp3ncmtC3qYGCS05leh5Dk=; b=OLFyE7gtGqrYED4XxQ/XfgUXWG
	McWCK4fildRMiPWiy3pfb+FXczV0MmK5uUAIGY5cbJmwTrDDs+HudOWrTDnf8SnFGh2tzYuInl3fc
	1+a6x2g8RWsQIdrEWMqCRzrCMNlwLz4yoj0lIm2a7o4sIlDEPfNVa0v9KH9mM5ExcQYbJNj6o5lbj
	UUXRaFvCvMOEF/MwqMAFN6ePGb9ucjnloSC/54MplMnE5wcMwaGN3ib1zIi4c8UhQRgTm3KQf5+dP
	EfE1Mj/ENyfK3ZtC+bOAN+8HqHn6ooRyToHGxyZPFm1K+XUslUhIw8TCcyzAySmjVStl4AWMmAWJE
	mUsGLLDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ltp-00000000Lo2-0fsJ;
	Mon, 07 Apr 2025 12:48:25 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lj5-00000000IY2-1TXo;
	Mon, 07 Apr 2025 12:37:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39c2688619bso2558890f8f.1;
        Mon, 07 Apr 2025 05:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744029438; x=1744634238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJwN15SFuWFw+J8LbQ3OEgp3ncmtC3qYGCS05leh5Dk=;
        b=fEZH28Gva0EbtyBFrj1SENkUordVNPB2wa7mIeJiT0tvHOUeOyBtb5lfBZfBpPgRG1
         jmzpQkCK6pjm/QdidQzQptuQ8zzxOvojZNRPdxDDZddodByKndGSd/Gf5Ibxj1/OzF5Y
         +AUdrWs3BjvK4xbsQjdLYDq7KkWtInbSI6QFKIj0f06/CPhr59u/XNghv1t7JWhxzl65
         703/wN0LN5hQpcUIeRD6mdT3llXqq6/DcHdEnIMS1+QnMyqinc/YtZ9nbK/JtR+WmWyt
         jar9s5dU5B4Yj/0GpSg5+SgSVXrl+5JtLzlErMZD/hK9QEwbEn0u5gibyNGSXvLubi3m
         G4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744029438; x=1744634238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJwN15SFuWFw+J8LbQ3OEgp3ncmtC3qYGCS05leh5Dk=;
        b=RkBT+gxPIQqEMdHMQmcj4q6Ji2YUUz+7tYP4MXrdNEuSD5g62LM4Pmv+0f9MvUJwMc
         IbMK8guDU58xQOwUF4sBgdYTu55vNBg51nnkCQJGNir7Xmyw6sSfe0T3bP0sZU0yUD6r
         Fv7x7XB0boUVURGZ13JBCJ5FZOVawaW5DTHa0WnVd7EPNWazyMi0tr0GeuUEdKK5x/Js
         rNqfoQvoACyTPpP5XzkT8qYdX+7CiovPAl7Yhhdp8rOtFsVVXGf6WgWmN1XQ4z9lqFQk
         iVeS5WZx73/sBUvxJ6elNNTPX1epPovJvr2y7Vje4p7LBBoBAIIB2FjmNIMKoTA/bX0H
         lvnA==
X-Forwarded-Encrypted: i=1; AJvYcCUVZzh9pHYLkzJ8TLACIVc5jWvW1yQ+cQkgh44xzK/DUlR+t+Hx/wGnFLzWnH2Z8TQQimnthC/mhvVNNhJXLQ0=@lists.infradead.org, AJvYcCX/x6fazst9ZNo/bb7OBXZYXSto0jlHAspG8mkbwYr/wxWd+r7HpNjt8Jjw+bvQrXvpzQ2gNAbXVMef+uWcrZ7C@lists.infradead.org
X-Gm-Message-State: AOJu0YxSN24129svsEOoa7pWobHEn8fhC0Vp70ZBGaD80Bn2zIy/mN1x
	bxUYWK1d2+BiJ28x/vkdkbSOMxqmAhUNa/CyOcz0QZccXXWUz4Xo
X-Gm-Gg: ASbGncv4CuqgOxyEF78SkNu191DKEemBytMBLpP4b8a71XRlaHtXnA5cfIV071/RABl
	bwSCOdse1n1fBbQfSQy5kbCrN/phc2qPcuRBRVdjiBtK9fRFlFi5t/hV37lKMvGmRdfwgRF4zr+
	nL8qDdpS8mvGIcP53XW33t07QMRBT56H7C3Q3o6TapcoqgitzPYrb9hrwhMya1JNKm1tLGesd5M
	En5qNEip/zw8H76iAcPdCpNhetj0/OvHN0gStEOhY49gfwxZQCur9wtpFgy+4+HqFXSVuoeMs1Y
	NviJj2jJDfeHGDH2elTdMrtfx4O0DsbfkWeSdmx/d6SjUjPhqYmsNxLp8u5o7pY8lt2TC9mu
X-Google-Smtp-Source: AGHT+IGOiYeoMEwHC9hRn8culHx4Ww1nJheukDZ53zBULfafTN1LFvaJ8yuDLqKUZnP9wmJYz7FCzQ==
X-Received: by 2002:a05:6000:2405:b0:391:4999:776c with SMTP id ffacd0b85a97d-39cba975d5dmr10077751f8f.40.1744029437773;
        Mon, 07 Apr 2025 05:37:17 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b76f2sm12065198f8f.53.2025.04.07.05.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:37:17 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: linux-crypto@vger.kernel.org,
	herbert@gondor.apana.org.au
Cc: davem@davemloft.net,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 2/4] crypto: rk3288 - use API helpers to setup fallback request
Date: Mon,  7 Apr 2025 15:36:02 +0300
Message-ID: <20250407123604.2109561-2-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407123604.2109561-1-ovidiu.panait.oss@gmail.com>
References: <20250407123604.2109561-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_053719_392216_D25209F5 
X-CRM114-Status: GOOD (  11.07  )
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
Cc: Corentin Labbe <clabbe@baylibre.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org

 drivers/crypto/rockchip/rk3288_crypto_ahash.c | 52 ++++++++++---------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/crypto/rockchip/rk3288_crypto_ahash.c b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
index 69d6019d8abc..d6928ebe9526 100644
--- a/drivers/crypto/rockchip/rk3288_crypto_ahash.c
+++ b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
@@ -52,12 +52,11 @@ static int rk_ahash_digest_fb(struct ahash_request *areq)
 	algt->stat_fb++;
 
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
 
 	return crypto_ahash_digest(&rctx->fallback_req);
 }
@@ -124,8 +123,9 @@ static int rk_ahash_init(struct ahash_request *req)
 	struct rk_ahash_ctx *ctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, ctx->fallback_tfm);
-	rctx->fallback_req.base.flags = req->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   req->base.complete, req->base.data);
 
 	return crypto_ahash_init(&rctx->fallback_req);
 }
@@ -137,10 +137,10 @@ static int rk_ahash_update(struct ahash_request *req)
 	struct rk_ahash_ctx *ctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, ctx->fallback_tfm);
-	rctx->fallback_req.base.flags = req->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
-	rctx->fallback_req.nbytes = req->nbytes;
-	rctx->fallback_req.src = req->src;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   req->base.complete, req->base.data);
+	ahash_request_set_crypt(&rctx->fallback_req, req->src, NULL, req->nbytes);
 
 	return crypto_ahash_update(&rctx->fallback_req);
 }
@@ -152,9 +152,10 @@ static int rk_ahash_final(struct ahash_request *req)
 	struct rk_ahash_ctx *ctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, ctx->fallback_tfm);
-	rctx->fallback_req.base.flags = req->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
-	rctx->fallback_req.result = req->result;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   req->base.complete, req->base.data);
+	ahash_request_set_crypt(&rctx->fallback_req, NULL, req->result, 0);
 
 	return crypto_ahash_final(&rctx->fallback_req);
 }
@@ -166,12 +167,11 @@ static int rk_ahash_finup(struct ahash_request *req)
 	struct rk_ahash_ctx *ctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, ctx->fallback_tfm);
-	rctx->fallback_req.base.flags = req->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
-
-	rctx->fallback_req.nbytes = req->nbytes;
-	rctx->fallback_req.src = req->src;
-	rctx->fallback_req.result = req->result;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   req->base.complete, req->base.data);
+	ahash_request_set_crypt(&rctx->fallback_req, req->src, req->result,
+				req->nbytes);
 
 	return crypto_ahash_finup(&rctx->fallback_req);
 }
@@ -183,8 +183,9 @@ static int rk_ahash_import(struct ahash_request *req, const void *in)
 	struct rk_ahash_ctx *ctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, ctx->fallback_tfm);
-	rctx->fallback_req.base.flags = req->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   req->base.complete, req->base.data);
 
 	return crypto_ahash_import(&rctx->fallback_req, in);
 }
@@ -196,8 +197,9 @@ static int rk_ahash_export(struct ahash_request *req, void *out)
 	struct rk_ahash_ctx *ctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, ctx->fallback_tfm);
-	rctx->fallback_req.base.flags = req->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   req->base.complete, req->base.data);
 
 	return crypto_ahash_export(&rctx->fallback_req, out);
 }
-- 
2.48.1


