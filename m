Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F056C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 19:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzBkugdw4gdptdF8hF2WvHzloU2qygLTygvgXH5F5js=; b=esbq5p+uRTNclj/4eYK7E+w2s4
	85mj5ZZzBCwCutIBrYfmFW3wc8oOclG1NOtCj1nPiGHaB/Mu0Hyes34C9ck6Ox18XzTbenAedPTy3
	b+o2gm95ksre2Hmkln6T/uUu06tpsmO1tdnExnnKs3sEMe7zJbKbTH8xqmK95/Axakc4/1yVh6tyt
	1r2/Hnoi3CKjf1vwkt9prpisYCecHRmAoEhz8F+hV6lyZK/y7kALZKCImk0MOM0QGt+rXk2RtIOha
	U8vb2BMraBiAfLbHZ6iCJmQvL08wtBCWjezzI4x3yhnmRdOh/CfqDDceTIwKuozpsn0CYHQkF/MW4
	9vAVEr0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhIf-00000004Dp5-0y7U;
	Tue, 01 Apr 2025 19:29:29 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzhDM-00000004D4l-1Alc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 19:24:01 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3913b539aabso3487541f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 12:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743535439; x=1744140239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzBkugdw4gdptdF8hF2WvHzloU2qygLTygvgXH5F5js=;
        b=ZRKnKO0/ZEocPTZ/UX5JVTyDou9oafc1VoI2DGSNn2po57CsOT8vDe5rZJ/U1QatUz
         +efcPIj13dQeLBpo4Y4y32qIh5yQvOAbIScfmiBVlPcIXrFQxIPmrtnzShPYVYu25atR
         y0kQL4jjMPMimJfPOXXD34BHdgbFBQPypx9nLrUBQBMY6iZeQV7wdi73QFCHmItcArYG
         8/R1Y4efSpnmJAi6kQ4T2EeQF7Hl516+BphJYnt8jITHr0B0fk9iCP7q7RRlBrIfAnm8
         EpjTbOej9a+DoiObWFxYL7jQH87SiFTv2oI+ydelDrMzqVFS6Sr6b2YE6pK9q9vwglhr
         S3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743535439; x=1744140239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzBkugdw4gdptdF8hF2WvHzloU2qygLTygvgXH5F5js=;
        b=ca2zuXwBDzgsDLT5Dj2qBQmif7dRPVX6Fi9wuT40xY/cj6P+3SvNdKAayJxiWmi/rm
         6mNB2WYvp9x1c1BJPDfTUnb+LNwMMmyvvMA/h6yszqULhpHlHtggncFptLmKTpGuV+MM
         VHsj1roFxqsHu/JYGiEB2sCdtW5SHiH5aTY19PqqlZoCJJzG2Xwfq1lpg/65libLfraB
         9fsYGuaH78EmU8yDWXsjWk/4TKi7LqG9Ozwh7gxPI9MOHw0R59Lucvec2dj5UG0Dn2vu
         kZYg9JzuShjQQ+F+qtLn/Q/vYHM5yUbXcOYHLXDwOK4T/bt4ojRSfHwSQDMPJW7UhAA9
         fwFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrTQUStY39Qq6+Xmd448JTSTKQSGK2q7lwPNmC532ufBMHXV9x+htAZdmTgKFVrOLKH04oA+owUS2Rsrt+UtLU@lists.infradead.org
X-Gm-Message-State: AOJu0YybUH5NLQv/JJFyoRJWv+Fg2C7Xww/Zxf/ivo9uN4SehkhP/UhI
	LgmRIR15VZZmaPW3i/l0vvsfF1q7VCWbznpwnZmjUrFwM9Mg3vbh
X-Gm-Gg: ASbGncuyj2fWfr0g6liuFeAPIxbUuWE9oivPi3ANLfiYfeIKUiYHL74u2dhVOXXc0A5
	5ESaGPgruTwK2CdJS/qw/aZlgoJkUiJBDnInIQK7TsWBNAxa3zgQSrptXhq2J1bp7+AcU09x64a
	sKcBcbtTin6OCeTwG+4rRP7Uv5jILO6fA4PzqN55Yxnnt/+fQubmALPt8GSPuHMC0IPwkLT4XaG
	PMUCWwz0KlWVXQx8SByVB2zssZoabb8bH1vRerJt3ynwVZAy4GLKR51Xbwbx1lWoUSReBbNR1yZ
	dzpAwpWf5fBfg8pNuciM5MS+9BfoV97Oe7asaDqL1wP9XtLnqChr6FuMLGrIAMjR+zoQUigs
X-Google-Smtp-Source: AGHT+IHdVEsoyIGdrpYCryCmSoxbMMM8oYYvuj+OQEED1lz5k318eW2R/hcBuIk9AkMR8eZjNXUkHQ==
X-Received: by 2002:a05:6000:381:b0:39c:1f0a:ee0 with SMTP id ffacd0b85a97d-39c1f0a0f69mr5763858f8f.2.1743535438907;
        Tue, 01 Apr 2025 12:23:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66aa32sm15353438f8f.50.2025.04.01.12.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:23:58 -0700 (PDT)
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
Subject: [PATCH 3/6] crypto: sun8i-ce-hash - factor out debugfs fallback statistics
Date: Tue,  1 Apr 2025 22:23:18 +0300
Message-ID: <20250401192321.3370188-3-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
References: <20250401192321.3370188-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_122400_329528_D4863D1E 
X-CRM114-Status: GOOD (  12.94  )
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

In order to reduce code duplication, factor out to a separate function
the codepath that increments debugfs fallback stats.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 53 +++++++------------
 1 file changed, 20 insertions(+), 33 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 2c2d285de154..b0959d8218cb 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -23,6 +23,20 @@
 #include <linux/string.h>
 #include "sun8i-ce.h"
 
+static void sun8i_ce_hash_stat_fb_inc(struct crypto_ahash *tfm)
+{
+	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
+		struct sun8i_ce_alg_template *algt __maybe_unused;
+		struct ahash_alg *alg = crypto_ahash_alg(tfm);
+
+		algt = container_of(alg, struct sun8i_ce_alg_template,
+				    alg.hash.base);
+#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
+		algt->stat_fb++;
+#endif
+	}
+}
+
 int sun8i_ce_hash_init_tfm(struct crypto_ahash *tfm)
 {
 	struct sun8i_ce_hash_tfm_ctx *op = crypto_ahash_ctx(tfm);
@@ -113,22 +127,13 @@ int sun8i_ce_hash_final(struct ahash_request *areq)
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
+	sun8i_ce_hash_stat_fb_inc(tfm);
+
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
 	rctx->fallback_req.base.flags = areq->base.flags &
 					CRYPTO_TFM_REQ_MAY_SLEEP;
 	rctx->fallback_req.result = areq->result;
 
-	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
-		struct sun8i_ce_alg_template *algt __maybe_unused;
-		struct ahash_alg *alg = crypto_ahash_alg(tfm);
-
-		algt = container_of(alg, struct sun8i_ce_alg_template,
-				    alg.hash.base);
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
-		algt->stat_fb++;
-#endif
-	}
-
 	return crypto_ahash_final(&rctx->fallback_req);
 }
 
@@ -153,6 +158,8 @@ int sun8i_ce_hash_finup(struct ahash_request *areq)
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
+	sun8i_ce_hash_stat_fb_inc(tfm);
+
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
 	rctx->fallback_req.base.flags = areq->base.flags &
 					CRYPTO_TFM_REQ_MAY_SLEEP;
@@ -161,17 +168,6 @@ int sun8i_ce_hash_finup(struct ahash_request *areq)
 	rctx->fallback_req.src = areq->src;
 	rctx->fallback_req.result = areq->result;
 
-	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
-		struct sun8i_ce_alg_template *algt __maybe_unused;
-		struct ahash_alg *alg = crypto_ahash_alg(tfm);
-
-		algt = container_of(alg, struct sun8i_ce_alg_template,
-				    alg.hash.base);
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
-		algt->stat_fb++;
-#endif
-	}
-
 	return crypto_ahash_finup(&rctx->fallback_req);
 }
 
@@ -181,6 +177,8 @@ static int sun8i_ce_hash_digest_fb(struct ahash_request *areq)
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
+	sun8i_ce_hash_stat_fb_inc(tfm);
+
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
 	rctx->fallback_req.base.flags = areq->base.flags &
 					CRYPTO_TFM_REQ_MAY_SLEEP;
@@ -189,17 +187,6 @@ static int sun8i_ce_hash_digest_fb(struct ahash_request *areq)
 	rctx->fallback_req.src = areq->src;
 	rctx->fallback_req.result = areq->result;
 
-	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
-		struct sun8i_ce_alg_template *algt __maybe_unused;
-		struct ahash_alg *alg = crypto_ahash_alg(tfm);
-
-		algt = container_of(alg, struct sun8i_ce_alg_template,
-				    alg.hash.base);
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
-		algt->stat_fb++;
-#endif
-	}
-
 	return crypto_ahash_digest(&rctx->fallback_req);
 }
 
-- 
2.48.1


