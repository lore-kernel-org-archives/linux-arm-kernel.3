Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E783C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 15:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zNv4YENHPmtSPb1F94zL2vQ71swaDzySWvLHzeXUzS4=; b=Au3VqhIQL/dHRRUy71SgWt7NCF
	Z+eIenrLolvzpl9SZUWZktMlsUHapglvXhqlIu2OmGMkJGOXhZSk0/46EE/Bs9r1nZYnL+nh0ivak
	A1sVNrSQM5ijKIfNc3JZLy2Vz9NuD7EaxH/YN+Z9fa83XnOJBGcxbmw8KEOTUORvWpmg2vYne+GwO
	YqeDr6HT/CJ5+7SihhqCRQbVACd2a+P7qnk6xkMgaQe8yp/xX2Y5G+vnVPwgMSI2ZzggZzh8Fz/7S
	gKYwst1oFCq/4tiBOUAbCFOt16/+GjTs8zJuW/P1dKAiigMAEX6VO2nRy6P3w+tAh2O4WumLciPqA
	MJD0IFfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuv7w-00000009LCS-0BRE;
	Wed, 19 Mar 2025 15:14:40 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuv0g-00000009JpQ-0VeA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 15:07:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cf848528aso38834785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hifiphile-com.20230601.gappssmtp.com; s=20230601; t=1742396828; x=1743001628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNv4YENHPmtSPb1F94zL2vQ71swaDzySWvLHzeXUzS4=;
        b=gcsbGeEUGdfcH3k6ykjeZoXT934rynHVguNvwnBMpAjqbM/aJ9u0sEjABiQK76ZCBw
         lSf4qDgv9OPDufKcLFYVmjdWbOlA5+1pwGRBRdIAjgsHWR+MguD0vScHMhd/5facO6N6
         yLufEN1p1wbwowsjFQaCpJ2K5wXTWEVObR5r5NR0GqP79XPk4XMZIuG/fvZQ3EbsTMJ4
         2xus0z9W8NVwageAy5qrC1p/l9S4J+E1C0TDhuxkXAyjYePHJlOz4HU0/ByxbPR+U0vU
         4sClsKAokm8TkzNw+gvNcb9kAxJTRs/N0q07c4vTbnUQovYf2Kw+6vbukbDOqlIosia1
         7apQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396828; x=1743001628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zNv4YENHPmtSPb1F94zL2vQ71swaDzySWvLHzeXUzS4=;
        b=iA8pMnaw4XCfwA1v2C/Ez1NsPj8zUcHiij8dosXWIMXVhagIMjOLmd3SqO3QaorzH8
         Z8X3Ks95LejVTzZqPnR04h7WnfXHisnLXSFG5CM78B4DlSW5d5MKqZNPw+ArYPMRCxBe
         qJDUuM9pHHpZHx/Kbkbm1ohVideRRQht3hnKOTfg7MXzJogjz4yax//UgMDJyyTEGZrw
         U1P9ypo40vIEf4wUAjXy+E4cI7KGi1U8fHR9i1nBXqgl3t0WNM+l1YL2i+TLBBlaXV/S
         aPsLQm62h0sVKM7WyLYSXuWFHLt0MNLGg6OvPg9vtxLLijmFuYr7eF3wwdi/VCxG8sgM
         QOdA==
X-Forwarded-Encrypted: i=1; AJvYcCWFYPRTYN92NN3ykOmQlXLmnvKFj7lFe58Trq6X/Sq8wSoOVKrZ346Rqj61J/otid0Hi9HjQLW3DP0fIoJ2ge2D@lists.infradead.org
X-Gm-Message-State: AOJu0YxJRm3El2HNdYf5RVqXi86E1mWF5zqTDDgQMA0hYJWg0Ad2kxUd
	gSYxzAtBag7n30OAXeYVFzVUBVn8urxmhq6vjuaiBDqd8Paxtry3XyBs3uRvjm0=
X-Gm-Gg: ASbGnct3jE7H25OEFFw7VH3I4fBbMklAaVfCUVPyI1++if4oGnH9T2VWZ0dINbiXrhA
	1XhMHixriVQIVuo12WIA/BcqGyym/A4VVx3/bquDweFYC4hh+EtlS82bhLVY+HbpQ0bAlZBrqWp
	oO5ruvE0Vat9OKt4Qdg7lPFnSLbyLv5fNcDHruFM1rzK6uwbZcCVql2cSKoqiS2cLJVFpWCk+On
	uKXaERRuv6Ly4Hqnq+E54yPc9UzEzQNxldvAGZ1P2aMVwtoCPBKqkxNTYBcQ5A/7GhjuQnrvPLc
	NXtJW7NXxz8LUE8rhwq6KD5ToV/07KLXLO77sD9OLWgtDw==
X-Google-Smtp-Source: AGHT+IG1T0wpdC2jhhxGsViaMerXWFKA7E61APRJ0hjnELjvuOcDSh7XS5SLOgX4CwPT1xf8fTb5ZQ==
X-Received: by 2002:a5d:47c9:0:b0:391:2a9a:478c with SMTP id ffacd0b85a97d-399739c81bfmr2840201f8f.23.1742396827667;
        Wed, 19 Mar 2025 08:07:07 -0700 (PDT)
Received: from localhost.localdomain ([78.199.60.143])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-395c7df33aasm20875247f8f.2.2025.03.19.08.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 08:07:07 -0700 (PDT)
From: Zixun LI <admin@hifiphile.com>
X-Google-Original-From: Zixun LI <zli@ogga.fr>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Zixun LI <admin@hifiphile.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel - add CRYPTO_ALG_KERN_DRIVER_ONLY flag to atmel-aes, atmel-sha, atmel-tdes drivers
Date: Wed, 19 Mar 2025 16:06:56 +0100
Message-ID: <20250319150657.2698916-1-zli@ogga.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_080710_359879_094B0B92 
X-CRM114-Status: GOOD (  15.43  )
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

From: Zixun LI <admin@hifiphile.com>

This patch introduces the CRYPTO_ALG_KERN_DRIVER_ONLY flag to the
atmel-aes, atmel-sha, and atmel-tdes drivers. This flag is set for
hardware accelerated ciphers accessible through a kernel driver only,
which is the case of these drivers.

Signed-off-by: Zixun LI <admin@hifiphile.com>
---
 drivers/crypto/atmel-aes.c  | 5 +++--
 drivers/crypto/atmel-sha.c  | 6 ++++--
 drivers/crypto/atmel-tdes.c | 3 ++-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/atmel-aes.c b/drivers/crypto/atmel-aes.c
index 90dcae7049b7..8a6ee5ac9956 100644
--- a/drivers/crypto/atmel-aes.c
+++ b/drivers/crypto/atmel-aes.c
@@ -1948,7 +1948,8 @@ static struct skcipher_alg aes_xts_alg = {
 	.base.cra_driver_name	= "atmel-xts-aes",
 	.base.cra_blocksize	= AES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct atmel_aes_xts_ctx),
-	.base.cra_flags		= CRYPTO_ALG_NEED_FALLBACK,
+	.base.cra_flags		= CRYPTO_ALG_NEED_FALLBACK |
+						  CRYPTO_ALG_KERN_DRIVER_ONLY,
 
 	.min_keysize		= 2 * AES_MIN_KEY_SIZE,
 	.max_keysize		= 2 * AES_MAX_KEY_SIZE,
@@ -2471,7 +2472,7 @@ static void atmel_aes_unregister_algs(struct atmel_aes_dev *dd)
 
 static void atmel_aes_crypto_alg_init(struct crypto_alg *alg)
 {
-	alg->cra_flags |= CRYPTO_ALG_ASYNC;
+	alg->cra_flags |= CRYPTO_ALG_ASYNC | CRYPTO_ALG_KERN_DRIVER_ONLY;
 	alg->cra_alignmask = 0xf;
 	alg->cra_priority = ATMEL_AES_PRIORITY;
 	alg->cra_module = THIS_MODULE;
diff --git a/drivers/crypto/atmel-sha.c b/drivers/crypto/atmel-sha.c
index 3622120add62..40f6ed5b20ee 100644
--- a/drivers/crypto/atmel-sha.c
+++ b/drivers/crypto/atmel-sha.c
@@ -1254,7 +1254,8 @@ static int atmel_sha_cra_init(struct crypto_tfm *tfm)
 static void atmel_sha_alg_init(struct ahash_alg *alg)
 {
 	alg->halg.base.cra_priority = ATMEL_SHA_PRIORITY;
-	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC;
+	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC |
+							   CRYPTO_ALG_KERN_DRIVER_ONLY;
 	alg->halg.base.cra_ctxsize = sizeof(struct atmel_sha_ctx);
 	alg->halg.base.cra_module = THIS_MODULE;
 	alg->halg.base.cra_init = atmel_sha_cra_init;
@@ -2043,7 +2044,8 @@ static void atmel_sha_hmac_cra_exit(struct crypto_tfm *tfm)
 static void atmel_sha_hmac_alg_init(struct ahash_alg *alg)
 {
 	alg->halg.base.cra_priority = ATMEL_SHA_PRIORITY;
-	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC;
+	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC |
+							   CRYPTO_ALG_KERN_DRIVER_ONLY;
 	alg->halg.base.cra_ctxsize = sizeof(struct atmel_sha_hmac_ctx);
 	alg->halg.base.cra_module = THIS_MODULE;
 	alg->halg.base.cra_init	= atmel_sha_hmac_cra_init;
diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index 099b32a10dd7..3a6a890172cd 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -898,7 +898,8 @@ static int atmel_tdes_init_tfm(struct crypto_skcipher *tfm)
 static void atmel_tdes_skcipher_alg_init(struct skcipher_alg *alg)
 {
 	alg->base.cra_priority = ATMEL_TDES_PRIORITY;
-	alg->base.cra_flags = CRYPTO_ALG_ASYNC;
+	alg->base.cra_flags = CRYPTO_ALG_ASYNC |
+						  CRYPTO_ALG_KERN_DRIVER_ONLY;
 	alg->base.cra_ctxsize = sizeof(struct atmel_tdes_ctx);
 	alg->base.cra_module = THIS_MODULE;
 
-- 
2.48.1


