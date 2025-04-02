Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880F5C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 07:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0mGb3opwhhZJQd4PF+IUTJMwu9jA7SEufHNbpsIO17s=; b=EkIThPkiu0grccTEK29ctl9KVO
	st2N3sKZjC9cp8tIRqpV5qcWxoUh7YlE6fSCvID2pZYM8UxquKGEUjpQwkvn1NHMY0vpJ7PXwVeRf
	5OXW6vr6zTmKEKF7QDm+JHbuMWQUJSmpi9iUPjcGqgUZfG6kDgT5UleQ1LfCHAwHBvrFmvXWlsn7I
	wb/kA0NI/2PZdtK3gluVvz6eFqSiwKxYQL4G7VkL5epx09op61y7OoQN0eIgNP+RehcYe9XCDLzFq
	M2afvHXY9adpEPXhL8LoeiK1445ZCiibnEVaf69C5C0Nk+KPbAbkJJq4go9PqrOhYsp3hvE2LsYfz
	Y1aaQyQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsAm-00000005JJK-0HsN;
	Wed, 02 Apr 2025 07:06:04 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzs7z-00000005J0c-0Kp4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 07:03:12 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d01024089so54546345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 00:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743577389; x=1744182189; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0mGb3opwhhZJQd4PF+IUTJMwu9jA7SEufHNbpsIO17s=;
        b=lxIThE5vwNq/bBSK/DGrDKCa4XxKUm07GNd2Zh6F6oBwOumlsXyoHB3Q9A9yfJcrIS
         qxODyux56cSZh4VI1CjghQ20uInV4tjXlxIZzgFus9we2QeT8btVdUN7mdeRDa2q3M5q
         u/jJrallDu6uSxBj6s3//7OcyTush7eAgZ+J+EE07UPeXP45FMbFpJiUnAZwNLUYxUeK
         MekyA5Zl+Ve1t6uLj3gXkbCsaiBcS/sK1l6NzuVJC12Tg1NeRR7tiiLoklajs8XO1KP9
         lQNc4zm2PeKBSbUvWaSiMMt056x+Ogg+t/VzE5LnUwPE831wdLqe3kBszQakFtXDasEn
         YjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577389; x=1744182189;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0mGb3opwhhZJQd4PF+IUTJMwu9jA7SEufHNbpsIO17s=;
        b=fq5PAgProvpY1G/Tk/GMiCQxP/41yZHV9wWudOOeD0fDEiHfqGZXIUQ3dub+QOpl7O
         jZCF85EjPYGlW3gQmWUv40CEFQdFtfkSOlS1hjJtbadf1wrak7v3Y1iiakUFWzsSsjwz
         TDycCIxHy9bMKnTsuHiafw7TesUdM8vnx7TM8XgD1xZccIdVYoTL24tuiHLON6ZmV51H
         7WBZDPGs80iNMTol7ZMTsjcDd0dgzk1qv0osZlLtQTVR1xpEf/ImZ7aOI11uw+MsFJch
         cDuKw3KHEUIPuypa5F/TcAmXjTf/vMXGaLrDYOSeRRCXF+il9Sfm+J2CEug7Q/JtNim/
         Y+Ow==
X-Gm-Message-State: AOJu0Yy7s4hZBCGx4Of+/GkAj9CDeaxPeCVbPNq829fDBtYO7Hfq1CAe
	o6npHHmmeGklztJ0nDbx6nKDSpN6eDHHNWlL2tBQof9dsgH5ECVBsLcNZWa0OjGCgg3vZw==
X-Google-Smtp-Source: AGHT+IFmAWS2GrdB0Yu8U27qZ5tPEaQxVLmiIK9XJfRe3GgNAOZOlsLj8EqQAxVljCRCfvCUYutyEUzc
X-Received: from wrpy3.prod.google.com ([2002:adf:f6c3:0:b0:39a:c9a1:ca5d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1ace:b0:391:47d8:de23
 with SMTP id ffacd0b85a97d-39c120e3ce1mr12840819f8f.31.1743577389102; Wed, 02
 Apr 2025 00:03:09 -0700 (PDT)
Date: Wed,  2 Apr 2025 09:02:52 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6346; i=ardb@kernel.org;
 h=from:subject; bh=OlkWsGOIIIBk8gLUx7h9D7s2W3yDh9dpKLgQtWRpnpo=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf3NQ+kn9dLq4k/zX4c82348butyxvwtjhMbnh66fb53z
 fGLu2uqOkpZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBE5JsYGf4/9Eqz6uR3bo2x
 2rNm9Uklg7LD7k6F9tb2ic2rJq7z1gWqEJrueYP1+OFd2zjWveHzya1gcyqdnTnH6vTFfZMk5y5 gBQA=
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402070251.1762692-3-ardb+git@google.com>
Subject: [PATCH 1/2] crypto: arm/aes-ce - stop using the SIMD helper
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, herbert@gondor.apana.org.au, 
	ebiggers@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_000311_174141_AD16B8EE 
X-CRM114-Status: GOOD (  17.06  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Now that ARM permits use of the NEON unit in softirq context as well as
task context, there is no longer a need to rely on the SIMD helper
module to construct async skciphers wrapping the sync ones, as the
latter can always be called directly.

So remove these wrappers and the dependency on the SIMD helper. This
permits the use of these algorithms by callers that only support
synchronous use.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm/crypto/Kconfig       |   1 -
 arch/arm/crypto/aes-ce-glue.c | 102 ++++------------------------------
 2 files changed, 11 insertions(+), 92 deletions(-)

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 32650c8431d9..2fa8aba8dc12 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -197,7 +197,6 @@ config CRYPTO_AES_ARM_CE
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_AES
-	select CRYPTO_SIMD
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
 	   with block cipher modes:
diff --git a/arch/arm/crypto/aes-ce-glue.c b/arch/arm/crypto/aes-ce-glue.c
index 21df5e7f51f9..c17d9e4ad8e6 100644
--- a/arch/arm/crypto/aes-ce-glue.c
+++ b/arch/arm/crypto/aes-ce-glue.c
@@ -418,29 +418,6 @@ static int ctr_encrypt(struct skcipher_request *req)
 	return err;
 }
 
-static void ctr_encrypt_one(struct crypto_skcipher *tfm, const u8 *src, u8 *dst)
-{
-	struct crypto_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
-	unsigned long flags;
-
-	/*
-	 * Temporarily disable interrupts to avoid races where
-	 * cachelines are evicted when the CPU is interrupted
-	 * to do something else.
-	 */
-	local_irq_save(flags);
-	aes_encrypt(ctx, dst, src);
-	local_irq_restore(flags);
-}
-
-static int ctr_encrypt_sync(struct skcipher_request *req)
-{
-	if (!crypto_simd_usable())
-		return crypto_ctr_encrypt_walk(req, ctr_encrypt_one);
-
-	return ctr_encrypt(req);
-}
-
 static int xts_encrypt(struct skcipher_request *req)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
@@ -586,10 +563,9 @@ static int xts_decrypt(struct skcipher_request *req)
 }
 
 static struct skcipher_alg aes_algs[] = { {
-	.base.cra_name		= "__ecb(aes)",
-	.base.cra_driver_name	= "__ecb-aes-ce",
+	.base.cra_name		= "ecb(aes)",
+	.base.cra_driver_name	= "ecb-aes-ce",
 	.base.cra_priority	= 300,
-	.base.cra_flags		= CRYPTO_ALG_INTERNAL,
 	.base.cra_blocksize	= AES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct crypto_aes_ctx),
 	.base.cra_module	= THIS_MODULE,
@@ -600,10 +576,9 @@ static struct skcipher_alg aes_algs[] = { {
 	.encrypt		= ecb_encrypt,
 	.decrypt		= ecb_decrypt,
 }, {
-	.base.cra_name		= "__cbc(aes)",
-	.base.cra_driver_name	= "__cbc-aes-ce",
+	.base.cra_name		= "cbc(aes)",
+	.base.cra_driver_name	= "cbc-aes-ce",
 	.base.cra_priority	= 300,
-	.base.cra_flags		= CRYPTO_ALG_INTERNAL,
 	.base.cra_blocksize	= AES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct crypto_aes_ctx),
 	.base.cra_module	= THIS_MODULE,
@@ -615,10 +590,9 @@ static struct skcipher_alg aes_algs[] = { {
 	.encrypt		= cbc_encrypt,
 	.decrypt		= cbc_decrypt,
 }, {
-	.base.cra_name		= "__cts(cbc(aes))",
-	.base.cra_driver_name	= "__cts-cbc-aes-ce",
+	.base.cra_name		= "cts(cbc(aes))",
+	.base.cra_driver_name	= "cts-cbc-aes-ce",
 	.base.cra_priority	= 300,
-	.base.cra_flags		= CRYPTO_ALG_INTERNAL,
 	.base.cra_blocksize	= AES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct crypto_aes_ctx),
 	.base.cra_module	= THIS_MODULE,
@@ -631,10 +605,9 @@ static struct skcipher_alg aes_algs[] = { {
 	.encrypt		= cts_cbc_encrypt,
 	.decrypt		= cts_cbc_decrypt,
 }, {
-	.base.cra_name		= "__ctr(aes)",
-	.base.cra_driver_name	= "__ctr-aes-ce",
+	.base.cra_name		= "ctr(aes)",
+	.base.cra_driver_name	= "ctr-aes-ce",
 	.base.cra_priority	= 300,
-	.base.cra_flags		= CRYPTO_ALG_INTERNAL,
 	.base.cra_blocksize	= 1,
 	.base.cra_ctxsize	= sizeof(struct crypto_aes_ctx),
 	.base.cra_module	= THIS_MODULE,
@@ -647,25 +620,9 @@ static struct skcipher_alg aes_algs[] = { {
 	.encrypt		= ctr_encrypt,
 	.decrypt		= ctr_encrypt,
 }, {
-	.base.cra_name		= "ctr(aes)",
-	.base.cra_driver_name	= "ctr-aes-ce-sync",
-	.base.cra_priority	= 300 - 1,
-	.base.cra_blocksize	= 1,
-	.base.cra_ctxsize	= sizeof(struct crypto_aes_ctx),
-	.base.cra_module	= THIS_MODULE,
-
-	.min_keysize		= AES_MIN_KEY_SIZE,
-	.max_keysize		= AES_MAX_KEY_SIZE,
-	.ivsize			= AES_BLOCK_SIZE,
-	.chunksize		= AES_BLOCK_SIZE,
-	.setkey			= ce_aes_setkey,
-	.encrypt		= ctr_encrypt_sync,
-	.decrypt		= ctr_encrypt_sync,
-}, {
-	.base.cra_name		= "__xts(aes)",
-	.base.cra_driver_name	= "__xts-aes-ce",
+	.base.cra_name		= "xts(aes)",
+	.base.cra_driver_name	= "xts-aes-ce",
 	.base.cra_priority	= 300,
-	.base.cra_flags		= CRYPTO_ALG_INTERNAL,
 	.base.cra_blocksize	= AES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct crypto_aes_xts_ctx),
 	.base.cra_module	= THIS_MODULE,
@@ -679,51 +636,14 @@ static struct skcipher_alg aes_algs[] = { {
 	.decrypt		= xts_decrypt,
 } };
 
-static struct simd_skcipher_alg *aes_simd_algs[ARRAY_SIZE(aes_algs)];
-
 static void aes_exit(void)
 {
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(aes_simd_algs) && aes_simd_algs[i]; i++)
-		simd_skcipher_free(aes_simd_algs[i]);
-
 	crypto_unregister_skciphers(aes_algs, ARRAY_SIZE(aes_algs));
 }
 
 static int __init aes_init(void)
 {
-	struct simd_skcipher_alg *simd;
-	const char *basename;
-	const char *algname;
-	const char *drvname;
-	int err;
-	int i;
-
-	err = crypto_register_skciphers(aes_algs, ARRAY_SIZE(aes_algs));
-	if (err)
-		return err;
-
-	for (i = 0; i < ARRAY_SIZE(aes_algs); i++) {
-		if (!(aes_algs[i].base.cra_flags & CRYPTO_ALG_INTERNAL))
-			continue;
-
-		algname = aes_algs[i].base.cra_name + 2;
-		drvname = aes_algs[i].base.cra_driver_name + 2;
-		basename = aes_algs[i].base.cra_driver_name;
-		simd = simd_skcipher_create_compat(aes_algs + i, algname, drvname, basename);
-		err = PTR_ERR(simd);
-		if (IS_ERR(simd))
-			goto unregister_simds;
-
-		aes_simd_algs[i] = simd;
-	}
-
-	return 0;
-
-unregister_simds:
-	aes_exit();
-	return err;
+	return crypto_register_skciphers(aes_algs, ARRAY_SIZE(aes_algs));
 }
 
 module_cpu_feature_match(AES, aes_init);
-- 
2.49.0.472.ge94155a9ec-goog


