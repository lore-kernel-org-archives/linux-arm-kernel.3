Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44878C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 19:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPD+7okMltc/dAuqJI3eHLzfTcaBka9M3a4LKpm2uhg=; b=S5J4LKNJcappME0LxaUNwpBEp5
	bN1yGzSzDdmCGSfJJkfLndLsoamcdGxFqyl5NJsZK0YaY926AilKx0oyZbN9MRpyzGyW3R5K8b0hH
	ArNRXZm7Pq2aWt5beTlX+J1J0ZSNBbFOJVk3osYU0I2S71DuHFlI/9ZHQ9IZk63RJ5+C/aBN+aY9U
	LxHTaO5tcNBdAULX2Y3dpnJZDC/q+L7skezc4WWZ0dbkqMNmUOAYqDsAcCagL2Q1PTfvh3JPFX0+H
	oDuzErhLsYwUjw9Dl7uQzaVwIFP1IWSqDoGi6zWcEX1K3qrEUAGhboIziaIwVZspt2i1gRz8pXOhj
	grDgw9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhNy-00000004EUG-2BWX;
	Tue, 01 Apr 2025 19:34:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhDQ-00000004D6T-1w3q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 19:24:05 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39c2688619bso556761f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 12:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743535443; x=1744140243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPD+7okMltc/dAuqJI3eHLzfTcaBka9M3a4LKpm2uhg=;
        b=NHxui/Hjz8nFYYQ0H8+HKzNdEkc1hqM1+L2GNDLCqcBqJImOoNAAfjGBjOmmfGGSka
         jJcWle1AWp7SOwJc0uC5fCKwfrpLEtAQEl3FZyiDazx3yOUAyIrZbkm79OIowVBiRvv+
         hfpJjtqQ608p9n+YqrPh6C+mH95rKkIKuYYWywwjV22dmBK5a+llCHvJgy+o5lT29+/l
         1w5/GXnuZpsg9XHM9PnPbVw8cWsIfJObNpzsLvXPrejRe6W+VfB7tQYBP9OHsF1upWvz
         31gC2+VfCcUccWHEB2iGWm1vikoIwB8muxzbWPAMDol7fBfPBPNJieRNOjhSx0+mylbi
         iZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743535443; x=1744140243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPD+7okMltc/dAuqJI3eHLzfTcaBka9M3a4LKpm2uhg=;
        b=naR/NGVb0zK0b3vnHGM3h1GdE0JVqrjwoxBWBCD1NDEJ8bLEelJR8DfIfBxzsCjATb
         2ILTx444QO5mgFIx1dyswyJqB130tCNTBupaxp1/NpPJiqkCq4Hs+MafEWjTFAM3kzt9
         6TqNI3oHw3kTLKyBNUd+YXkSqso2ZmcYuE+hePRD4F9LP7QwACiEwnuDTjxwoftbdTYi
         12fId/YEwMTCR4svk4A4CnZjIFtXvkMbNmBHTbt2HqC/9lDKi/l6WJmPpXHwk9CRS2JI
         FCXnXUYQtC0+5x/HTbtcL9gCvNDR/vJ5xfTf52NeRURsKEJw8Ui3LadCFVsn8RgD5a2h
         R3Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVdCk6kmX2E/HRGiYWTyN7sPCmGyH8jHeTD2B+uwnzckZJkTe1ZmGoSDGtlw6+aH/q6MvkYQO63oCzceWh/lUyo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu6KCAaE6OaB8a40W8aiJw/PJ3ApEmR2TeXxt/Mh+qHsdYpV/H
	cJaTjBu9xcNQo2C7cohLF6xm3lDKBNVp2IIm7O6p64zGszcCvZ/1
X-Gm-Gg: ASbGnct9x75NWElrdgmp1qkybCsjLUYsNSsBBqPmGOYSF2odArJp/T8nM4iDB4+/wdE
	NFhuhR7MwySMDvX8z7HR1UKi7AMKLGQJGwRiALMnGBxXRwL1R5I1H9Qke1UydsONPUAN3JB25Oz
	7P2YPbWZCtgCfVonP7ldE6e4Bb7Bf0qkyedLWX63cT8LpQcq60ih3btzcEA8gCh1LUI/bH1XrKL
	78Mq57nlPRc7T7ewE9VZ+TFpf32PDjsV/o0v3tibdq0sAu2TOEVs5qnG8SVJt6dgEOujoLqkIC3
	U4kISVRAP6Twm8PkfB24EZljE1CBPcAshaSTaAspV7xTwVqDTiDOEApI/Ca8QDbsAvBdm2eT
X-Google-Smtp-Source: AGHT+IEaiKwLn7JsnD/3lJiU7PGrasf+3+s7Prm3UNAJkOHPWOkOwYJ5/33v9GOGEA2VI8+dpTqX0g==
X-Received: by 2002:a05:6000:1a8b:b0:39a:c9c1:5453 with SMTP id ffacd0b85a97d-39c2367439dmr3498181f8f.49.1743535442768;
        Tue, 01 Apr 2025 12:24:02 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66aa32sm15353438f8f.50.2025.04.01.12.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:24:02 -0700 (PDT)
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
Subject: [PATCH 6/6] crypto: sun8i-ce-hash - use API helpers to setup fallback request
Date: Tue,  1 Apr 2025 22:23:21 +0300
Message-ID: <20250401192321.3370188-6-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
References: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_122404_499179_D5DDE41A 
X-CRM114-Status: GOOD (  10.83  )
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

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 49 ++++++++++---------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index f2481e1585ba..ba13fb75c05d 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -92,7 +92,9 @@ int sun8i_ce_hash_init(struct ahash_request *areq)
 	memset(rctx, 0, sizeof(struct sun8i_ce_hash_reqctx));
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
 
 	return crypto_ahash_init(&rctx->fallback_req);
 }
@@ -104,7 +106,9 @@ int sun8i_ce_hash_export(struct ahash_request *areq, void *out)
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
 
 	return crypto_ahash_export(&rctx->fallback_req, out);
 }
@@ -116,7 +120,9 @@ int sun8i_ce_hash_import(struct ahash_request *areq, const void *in)
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
 
 	return crypto_ahash_import(&rctx->fallback_req, in);
 }
@@ -130,9 +136,10 @@ int sun8i_ce_hash_final(struct ahash_request *areq)
 	sun8i_ce_hash_stat_fb_inc(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
-	rctx->fallback_req.result = areq->result;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
+	ahash_request_set_crypt(&rctx->fallback_req, NULL, areq->result, 0);
 
 	return crypto_ahash_final(&rctx->fallback_req);
 }
@@ -144,10 +151,10 @@ int sun8i_ce_hash_update(struct ahash_request *areq)
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
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
@@ -161,12 +168,11 @@ int sun8i_ce_hash_finup(struct ahash_request *areq)
 	sun8i_ce_hash_stat_fb_inc(tfm);
 
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
 
 	return crypto_ahash_finup(&rctx->fallback_req);
 }
@@ -180,12 +186,11 @@ static int sun8i_ce_hash_digest_fb(struct ahash_request *areq)
 	sun8i_ce_hash_stat_fb_inc(tfm);
 
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
-- 
2.48.1


