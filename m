Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DE6C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 10:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L5jGr+pI3zOZTWXmjHZAncBL8qM4rtZILEfUKQGcw3Q=; b=fUymLjLU2yTzErhT7V2yAlnssM
	a+2UA6UvWtPUZWpIS2yORPZvtdKVRmyvo0Q7UEe4Co63hHvLrA4+4DkeNeDXvvuPn9DuUv+tSolLL
	DytANi0R2c+9wmAJyTErMEGF0mlO5Da85gSmYlXcPImM0Ksum3Ry+rKtOjtb5ea489mzYcs0HmeKt
	BAzy+cKYfiTg6uGdiZbaXRQOPUcgQzjK6nGM457TrHWJbp9Tg8ZdCxS2aqDV/95Lk1+vQhtgrAYtr
	f7kQJOilOi1WENp2GqU9e/VT5kH1/WpiCkDjzQqr1GbH25aaEYSQbvknfAseXcbtWoacsbGwpMCcX
	O+kAnn9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jd4-0000000HMVO-2GJ3;
	Mon, 07 Apr 2025 10:22:58 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jbG-0000000HLwr-1Lj5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 10:21:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39bf44be22fso2778468f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 03:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hifiphile-com.20230601.gappssmtp.com; s=20230601; t=1744021264; x=1744626064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L5jGr+pI3zOZTWXmjHZAncBL8qM4rtZILEfUKQGcw3Q=;
        b=Th8M7pjQnAWXerR7ulya4idrB2hloszx7Ja0JN4FlY1LIIBDC99BX4hTKVqyVgWD1K
         gY1RkP7HodGcP7gn2HrwAMD+ekNNYVWPb/L86afyZzizLhnrdhcoNojCwo4GDRkZHQhb
         z3f/RiyZC3Q3O45JuRkXLA3cCLplFv3jf1JGH7JiHZnq8jzG339QazACESs4r1H91Rr0
         SBovkJJy0hURJDWW+UYa+6rTv7bkzau2OpVROrLEOB7p9nRBDepsiXkJ3dt2Yezc+mcX
         TJWqhLoSyrdiEthipqrD3dhrtbCnC9y1utmZu0Y20nBfZ+1AOEOIRbPOrm3yisVjIk5i
         aCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744021264; x=1744626064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5jGr+pI3zOZTWXmjHZAncBL8qM4rtZILEfUKQGcw3Q=;
        b=gUDMmgYJJp9WxMGWBEmm6nj1NIk72xuyjT+6AtVE11rg657ISz8BSQmMzAU7No2440
         HcorP8CmdPMJtoyCiNIaFzksEIlIrEUUXcu0fMIckXqUMOag4bB3Upl4LxAebPCkk6Yj
         9xXPdD5BloyUgDTNLgBVEQfXBYdY7S/Iu02C1PVs3tbudqAoluDrqsPad6Rb0rx4/owX
         MIOLML3CzcaN8PthW5r1wIuburxS1bz6dvzngAHogECYlIJNZ7Y5dzNqJsaZFYqGC3H2
         YA0e/0c9P5AS/4HNFUPBgKXJo68ByXsWfYydOcm6dcp1NzogfeGHqQL8dlMT/+EGG8Xj
         OnEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE+nYse+VWwCe8BSXnrFTIc+sx/teZvp6OND4BDZdtih83YIsRZ767aAL5uiIO50PKubY8tfxk9M8L+HAiH9kW@lists.infradead.org
X-Gm-Message-State: AOJu0YwyZLnuZVGLGVwZ+l3CEc3RaE3SQOQD3WMM8Qx9a9yAE/BemV5k
	vbUfhLtW0krsRly6XOIFKdiixl7iT6HpFT0YqDivS+dZY8WeGPr/LlFHxVkUKcM=
X-Gm-Gg: ASbGncux7cJNS2r5XeKo5GD07u/no81dod71SjlgdmucPT7D8YRdwJfmjSa3x7MHkFk
	V9H79tWYRQz4S69YwVdGSFu06TJXk3amc0YFts55y4vCLYoFCfa07RFAXyQpvgN+opWBKWFlPhH
	+pym1hiHBshxZB4rGpFOY+AmATA+qWNftGqaL4ysNqIqdu0utJkFojyJwTFOHXJIBP+z/yxDVnC
	rgXyHnFSoN2gyWaNrAotD2XMoUSr3bhpt1yjqpxZQLaZvNKWL7WiejUgJXPMNh9BTSwbKzfATH3
	fYo+uiF9lMuxiEi9etOCdZJFHk6cR6PyUwD0sS4qq5wSZNZrSiJkNVQV
X-Google-Smtp-Source: AGHT+IHIVQFFxQYUM9c9p5jCB+KaT/H7u/LzBHBry2a7T1ZwTP6sqndz9DYPvtVDPTHqnOcrzzxy+w==
X-Received: by 2002:a05:6000:2907:b0:39c:1258:2dc8 with SMTP id ffacd0b85a97d-39d6fd0756emr5600592f8f.57.1744021264047;
        Mon, 07 Apr 2025 03:21:04 -0700 (PDT)
Received: from localhost.localdomain ([78.199.60.143])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c30096896sm11740533f8f.19.2025.04.07.03.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 03:21:03 -0700 (PDT)
From: Zixun LI <admin@hifiphile.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Zixun LI <admin@hifiphile.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] crypto: atmel - add CRYPTO_ALG_KERN_DRIVER_ONLY flag to atmel-aes, atmel-sha, atmel-tdes drivers
Date: Mon,  7 Apr 2025 12:20:49 +0200
Message-ID: <20250407102050.1747860-1-admin@hifiphile.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_032106_557355_4772A834 
X-CRM114-Status: GOOD (  15.34  )
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

This patch introduces the CRYPTO_ALG_KERN_DRIVER_ONLY flag to the
atmel-aes, atmel-sha, and atmel-tdes drivers. This flag is set for
hardware accelerated ciphers accessible through a kernel driver only,
which is the case of these drivers.

Signed-off-by: Zixun LI <admin@hifiphile.com>
---

v2: fix indentaion
---
 drivers/crypto/atmel-aes.c  | 5 +++--
 drivers/crypto/atmel-sha.c  | 6 ++++--
 drivers/crypto/atmel-tdes.c | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/atmel-aes.c b/drivers/crypto/atmel-aes.c
index f3cb73df941e..266e1d0aca3c 100644
--- a/drivers/crypto/atmel-aes.c
+++ b/drivers/crypto/atmel-aes.c
@@ -1948,7 +1948,8 @@ static struct skcipher_alg aes_xts_alg = {
 	.base.cra_driver_name	= "atmel-xts-aes",
 	.base.cra_blocksize	= AES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct atmel_aes_xts_ctx),
-	.base.cra_flags		= CRYPTO_ALG_NEED_FALLBACK,
+	.base.cra_flags		= CRYPTO_ALG_NEED_FALLBACK |
+				  CRYPTO_ALG_KERN_DRIVER_ONLY,

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
index 095ba254a25c..b4e917a8465e 100644
--- a/drivers/crypto/atmel-sha.c
+++ b/drivers/crypto/atmel-sha.c
@@ -1254,7 +1254,8 @@ static int atmel_sha_cra_init(struct crypto_tfm *tfm)
 static void atmel_sha_alg_init(struct ahash_alg *alg)
 {
 	alg->halg.base.cra_priority = ATMEL_SHA_PRIORITY;
-	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC;
+	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC |
+				   CRYPTO_ALG_KERN_DRIVER_ONLY;
 	alg->halg.base.cra_ctxsize = sizeof(struct atmel_sha_ctx);
 	alg->halg.base.cra_module = THIS_MODULE;
 	alg->halg.base.cra_init = atmel_sha_cra_init;
@@ -2043,7 +2044,8 @@ static void atmel_sha_hmac_cra_exit(struct crypto_tfm *tfm)
 static void atmel_sha_hmac_alg_init(struct ahash_alg *alg)
 {
 	alg->halg.base.cra_priority = ATMEL_SHA_PRIORITY;
-	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC;
+	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC |
+				   CRYPTO_ALG_KERN_DRIVER_ONLY;
 	alg->halg.base.cra_ctxsize = sizeof(struct atmel_sha_hmac_ctx);
 	alg->halg.base.cra_module = THIS_MODULE;
 	alg->halg.base.cra_init	= atmel_sha_hmac_cra_init;
diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index 099b32a10dd7..96fc19cd62a2 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -898,7 +898,7 @@ static int atmel_tdes_init_tfm(struct crypto_skcipher *tfm)
 static void atmel_tdes_skcipher_alg_init(struct skcipher_alg *alg)
 {
 	alg->base.cra_priority = ATMEL_TDES_PRIORITY;
-	alg->base.cra_flags = CRYPTO_ALG_ASYNC;
+	alg->base.cra_flags = CRYPTO_ALG_ASYNC | CRYPTO_ALG_KERN_DRIVER_ONLY;
 	alg->base.cra_ctxsize = sizeof(struct atmel_tdes_ctx);
 	alg->base.cra_module = THIS_MODULE;

--
2.49.0


