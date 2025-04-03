Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1543BC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 07:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2UnQ4G/+gHzGrXeVaDXpkuH48Bw4a/mXiFKlx5qVxo=; b=rOMfPMhhLb+E1NX4m06Pck0Co7
	5OSwp8xuj/JOJjp6Ej/Emc1Emtpl54jghlb0irGyBQiIziV+KJA9bIjjuDhX+9yVszORN0FGXvhM/
	rltADPuJYHv0HDn36N+w21yCDow/jDFIO2FFQ61cHfmY2tq9rLlOZdiewkI38/ZZV76nrb0kRav7u
	1HwpPPQdJUxQdWjKPYM4ezddQaeChI94KWIEqJs+T2clDiSy4+UIH2iXxpJOeNnZhT77V392CxkLD
	qNqBXZ3ONkwG8MAH2Fgi92Gt/eBO2k/t2nDTxhNC8sljEACxC35HC9+NM8IaV88yeYpdte3PoBpow
	q0MG364w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Eyg-000000086cz-43av;
	Thu, 03 Apr 2025 07:27:06 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Es0-000000085IE-11kC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 07:20:13 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so2905855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 00:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743664810; x=1744269610; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t2UnQ4G/+gHzGrXeVaDXpkuH48Bw4a/mXiFKlx5qVxo=;
        b=hy1JRLHqiLX0L433R0qZ1ts8YkTE9S0Y15zEqzPsZEo9Jt2A/cYOzx3TzjKUBZ+/xJ
         vYITQFYQEE9eR05mEBKNJ3OV4Dz1fT4goXzjJ6jQPcPl4bMhf07XKHJkidVZU41Tucpd
         4qUkykSTTE02BEoV59qEOTXn2yWbxPFFF6qpdY6cL/E7HNE1m+kF3XoTXxNPBvVWbEB+
         TtbZdHraDH1Rbuf6b9p793s9sZZeT/fJgUl3BNpqua9kbM4zSVVrXBfr+1OAAMmz42Ob
         3MGEY1oO28wr4XFRp0lE+QNrNlCS+l4OOdkAsIs8UXtmQU1IrSr5ZxZS/S2KNzD12NRq
         v+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743664810; x=1744269610;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2UnQ4G/+gHzGrXeVaDXpkuH48Bw4a/mXiFKlx5qVxo=;
        b=XmO6LRmJ/AJGpNaFZV/nMTGAAO4ki7rRdp219Tcuif+fv8mTZyHVm53riWcth5X0hg
         NZbi5Bv26OGq9kG7Z7nGWIoYmTHHMx8W9gGgFQo10DHbr5+aQdNXPGTLHyoH4slu5QGF
         mtqo5kggHaLDN+pE6VTHpeYsRVBcQ8RTBrX1JwBAVKnfEXfYEWw2y4atjhUoIqdtvoj3
         MxhorOp1Lx9gO6GLErQFt97yZsW4tZN1vCVRHjieTKMVIVewl50a0ncXjd7F9LB3KEb6
         OxbKIs01YgCY2UAAk9eZ1mii1VeeOxevoSqSpHycj8uiEdMZsrAytoXSMMJ5bz0X45S/
         dGCg==
X-Gm-Message-State: AOJu0YxdRoPSUhH3Adn6ZgIS3xqAFr/HFb9ZIP6nWl/a/u3DxCxcXyL3
	Hz4DXY3I5GfuwS324DQndRRPnfuXR8iFH1KdN/qR128FuxlL8rBpuYdhMnuUI6QsymW14g==
X-Google-Smtp-Source: AGHT+IFqW2eXKW5f/47sIYrkOzRPQpjoGIGrgHwL14ChBg+Q1Svb3rcjGXfzkypcL7MULwG7PjS2sAVh
X-Received: from wmby10.prod.google.com ([2002:a05:600c:c04a:b0:43d:522a:45e8])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a7b:c398:0:b0:43d:5264:3cf0
 with SMTP id 5b1f17b1804b1-43ebef8f615mr17183885e9.11.1743664810197; Thu, 03
 Apr 2025 00:20:10 -0700 (PDT)
Date: Thu,  3 Apr 2025 09:19:56 +0200
In-Reply-To: <20250403071953.2296514-5-ardb+git@google.com>
Mime-Version: 1.0
References: <20250403071953.2296514-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=7307; i=ardb@kernel.org;
 h=from:subject; bh=GsLrQ5TXtyTFuOhOU+w0HAICvkykb8sb2tr8+zm5hMA=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf2d2fwshs+MtlVxM0wiJrGJm2mseRb+2tjb66lq6yLeg
 rn8DDM6SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwES+bWT4X6W3Nnun8v0otUM7
 NjNL/zJY7FYmse0Dh6HmkTeGlQrvLjP8M0xfqRY+4dZ5S+XrN5tb9n3w+Pgl8d7x5ww3rv7cmcS /hxMA
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250403071953.2296514-7-ardb+git@google.com>
Subject: [PATCH v2 2/3] crypto: arm/aes-neonbs - stop using the SIMD helper
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, herbert@gondor.apana.org.au, 
	ebiggers@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_002012_294883_18DD764F 
X-CRM114-Status: GOOD (  17.41  )
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
 arch/arm/crypto/Kconfig           |   1 -
 arch/arm/crypto/aes-neonbs-glue.c | 116 ++------------------
 2 files changed, 9 insertions(+), 108 deletions(-)

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 2e73200b930a..be9c2e19f976 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -172,7 +172,6 @@ config CRYPTO_AES_ARM_BS
 	select CRYPTO_AES_ARM
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_AES
-	select CRYPTO_SIMD
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
 	  with block cipher modes:
diff --git a/arch/arm/crypto/aes-neonbs-glue.c b/arch/arm/crypto/aes-neonbs-glue.c
index f6be80b5938b..95418df97fb4 100644
--- a/arch/arm/crypto/aes-neonbs-glue.c
+++ b/arch/arm/crypto/aes-neonbs-glue.c
@@ -8,8 +8,6 @@
 #include <asm/neon.h>
 #include <asm/simd.h>
 #include <crypto/aes.h>
-#include <crypto/ctr.h>
-#include <crypto/internal/simd.h>
 #include <crypto/internal/skcipher.h>
 #include <crypto/scatterwalk.h>
 #include <crypto/xts.h>
@@ -59,11 +57,6 @@ struct aesbs_xts_ctx {
 	struct crypto_aes_ctx	tweak_key;
 };
 
-struct aesbs_ctr_ctx {
-	struct aesbs_ctx	key;		/* must be first member */
-	struct crypto_aes_ctx	fallback;
-};
-
 static int aesbs_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 			unsigned int key_len)
 {
@@ -200,25 +193,6 @@ static int cbc_decrypt(struct skcipher_request *req)
 	return err;
 }
 
-static int aesbs_ctr_setkey_sync(struct crypto_skcipher *tfm, const u8 *in_key,
-				 unsigned int key_len)
-{
-	struct aesbs_ctr_ctx *ctx = crypto_skcipher_ctx(tfm);
-	int err;
-
-	err = aes_expandkey(&ctx->fallback, in_key, key_len);
-	if (err)
-		return err;
-
-	ctx->key.rounds = 6 + key_len / 4;
-
-	kernel_neon_begin();
-	aesbs_convert_key(ctx->key.rk, ctx->fallback.key_enc, ctx->key.rounds);
-	kernel_neon_end();
-
-	return 0;
-}
-
 static int ctr_encrypt(struct skcipher_request *req)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
@@ -254,21 +228,6 @@ static int ctr_encrypt(struct skcipher_request *req)
 	return err;
 }
 
-static void ctr_encrypt_one(struct crypto_skcipher *tfm, const u8 *src, u8 *dst)
-{
-	struct aesbs_ctr_ctx *ctx = crypto_skcipher_ctx(tfm);
-
-	__aes_arm_encrypt(ctx->fallback.key_enc, ctx->key.rounds, src, dst);
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
 static int aesbs_xts_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 			    unsigned int key_len)
 {
@@ -374,13 +333,12 @@ static int xts_decrypt(struct skcipher_request *req)
 }
 
 static struct skcipher_alg aes_algs[] = { {
-	.base.cra_name		= "__ecb(aes)",
-	.base.cra_driver_name	= "__ecb-aes-neonbs",
+	.base.cra_name		= "ecb(aes)",
+	.base.cra_driver_name	= "ecb-aes-neonbs",
 	.base.cra_priority	= 250,
 	.base.cra_blocksize	= AES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct aesbs_ctx),
 	.base.cra_module	= THIS_MODULE,
-	.base.cra_flags		= CRYPTO_ALG_INTERNAL,
 
 	.min_keysize		= AES_MIN_KEY_SIZE,
 	.max_keysize		= AES_MAX_KEY_SIZE,
@@ -389,13 +347,12 @@ static struct skcipher_alg aes_algs[] = { {
 	.encrypt		= ecb_encrypt,
 	.decrypt		= ecb_decrypt,
 }, {
-	.base.cra_name		= "__cbc(aes)",
-	.base.cra_driver_name	= "__cbc-aes-neonbs",
+	.base.cra_name		= "cbc(aes)",
+	.base.cra_driver_name	= "cbc-aes-neonbs",
 	.base.cra_priority	= 250,
 	.base.cra_blocksize	= AES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct aesbs_cbc_ctx),
 	.base.cra_module	= THIS_MODULE,
-	.base.cra_flags		= CRYPTO_ALG_INTERNAL,
 
 	.min_keysize		= AES_MIN_KEY_SIZE,
 	.max_keysize		= AES_MAX_KEY_SIZE,
@@ -405,13 +362,12 @@ static struct skcipher_alg aes_algs[] = { {
 	.encrypt		= cbc_encrypt,
 	.decrypt		= cbc_decrypt,
 }, {
-	.base.cra_name		= "__ctr(aes)",
-	.base.cra_driver_name	= "__ctr-aes-neonbs",
+	.base.cra_name		= "ctr(aes)",
+	.base.cra_driver_name	= "ctr-aes-neonbs",
 	.base.cra_priority	= 250,
 	.base.cra_blocksize	= 1,
 	.base.cra_ctxsize	= sizeof(struct aesbs_ctx),
 	.base.cra_module	= THIS_MODULE,
-	.base.cra_flags		= CRYPTO_ALG_INTERNAL,
 
 	.min_keysize		= AES_MIN_KEY_SIZE,
 	.max_keysize		= AES_MAX_KEY_SIZE,
@@ -422,29 +378,12 @@ static struct skcipher_alg aes_algs[] = { {
 	.encrypt		= ctr_encrypt,
 	.decrypt		= ctr_encrypt,
 }, {
-	.base.cra_name		= "ctr(aes)",
-	.base.cra_driver_name	= "ctr-aes-neonbs-sync",
-	.base.cra_priority	= 250 - 1,
-	.base.cra_blocksize	= 1,
-	.base.cra_ctxsize	= sizeof(struct aesbs_ctr_ctx),
-	.base.cra_module	= THIS_MODULE,
-
-	.min_keysize		= AES_MIN_KEY_SIZE,
-	.max_keysize		= AES_MAX_KEY_SIZE,
-	.chunksize		= AES_BLOCK_SIZE,
-	.walksize		= 8 * AES_BLOCK_SIZE,
-	.ivsize			= AES_BLOCK_SIZE,
-	.setkey			= aesbs_ctr_setkey_sync,
-	.encrypt		= ctr_encrypt_sync,
-	.decrypt		= ctr_encrypt_sync,
-}, {
-	.base.cra_name		= "__xts(aes)",
-	.base.cra_driver_name	= "__xts-aes-neonbs",
+	.base.cra_name		= "xts(aes)",
+	.base.cra_driver_name	= "xts-aes-neonbs",
 	.base.cra_priority	= 250,
 	.base.cra_blocksize	= AES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct aesbs_xts_ctx),
 	.base.cra_module	= THIS_MODULE,
-	.base.cra_flags		= CRYPTO_ALG_INTERNAL,
 
 	.min_keysize		= 2 * AES_MIN_KEY_SIZE,
 	.max_keysize		= 2 * AES_MAX_KEY_SIZE,
@@ -455,54 +394,17 @@ static struct skcipher_alg aes_algs[] = { {
 	.decrypt		= xts_decrypt,
 } };
 
-static struct simd_skcipher_alg *aes_simd_algs[ARRAY_SIZE(aes_algs)];
-
 static void aes_exit(void)
 {
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(aes_simd_algs); i++)
-		if (aes_simd_algs[i])
-			simd_skcipher_free(aes_simd_algs[i]);
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
 	if (!(elf_hwcap & HWCAP_NEON))
 		return -ENODEV;
 
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
-	return 0;
-
-unregister_simds:
-	aes_exit();
-	return err;
+	return crypto_register_skciphers(aes_algs, ARRAY_SIZE(aes_algs));
 }
 
 late_initcall(aes_init);
-- 
2.49.0.472.ge94155a9ec-goog


