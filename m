Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFC6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 18:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCFT+OavEDwKSejKm18+2bNMC+EBAb4QvMYroEM42f4=; b=a3KABbdHOdQsV79oSpyZmyjgE7
	4wkG9ESNENcsYesowgLqAEEAO8BLJVGaueZndJpS3WUoZqvvoR5C2rizyqS/ltWCYsZdIMz/GBMBq
	0zSDgtSW78AJU7CLwYoUMEAZeKNlpnXb2Jg5/ElnK5lNFYd2AaomfZwZm3D1Xg0olsZJfyYlcHLO6
	kLa0nFYDH0F5de3DlwA4J1YAhYHIO0uuywXp4eMiMts0JP4Krux1J24IvP+VOA7KoKJmWsWS6mT4d
	8paS0p4nJgFjrQ42lkdZILBKbPqpJ/x4NVtncDGKwhI0Zn3utmiLsG6PIi+SbEE/Aj0CeVFK7sg8G
	8wdCjGog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u18Ll-0000000EMVy-3DxP;
	Sat, 05 Apr 2025 18:34:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u18IB-0000000ELdy-2W2e;
	Sat, 05 Apr 2025 18:30:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C4CA61135;
	Sat,  5 Apr 2025 18:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EB2C4CEEB;
	Sat,  5 Apr 2025 18:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877854;
	bh=/YsQAqEWiFVgtY7NB130SUnvpny2qsjrrQSIe4BWHhI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vt1yl7LhoNBAre23bvVjNQQimbyoMqFuQeFMo/U+MgneXLvBOZdIQ3VzJVLNiCaUo
	 GsXFs93u7q+cyqywulR9bFvE7Ua1VmAEhrKVtimxgM6w2QktG1OdtG4HqaQvsfQA5S
	 39TBRSiLBNVzVyY+SyJOgdQ3U/smTyqSNW7tHwwdK2RwU9HrUdyIZk1Wa8xP+I3i1j
	 dao9ZIFX6i6tEHk+Dta1g3iUZwl45cY05XQXK4zU2qZPDQXSn+GbytrJrR/WUNY7LF
	 4T9ySj/RUuedagAt7Kn5YUbeEUD43AefnX1l1o+CCdvSkH+P9+oMLjEvt8lW3feOsE
	 XNGvQ5idyUpVg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 4/9] crypto: arm64/chacha - remove the skcipher algorithms
Date: Sat,  5 Apr 2025 11:26:04 -0700
Message-ID: <20250405182609.404216-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405182609.404216-1-ebiggers@kernel.org>
References: <20250405182609.404216-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Eric Biggers <ebiggers@google.com>

Since crypto/chacha.c now registers chacha20-$(ARCH), xchacha20-$(ARCH),
and xchacha12-$(ARCH) skcipher algorithms that use the architecture's
ChaCha and HChaCha library functions, individual architectures no longer
need to do the same.  Therefore, remove the redundant skcipher
algorithms and leave just the library functions.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/crypto/Kconfig            |   7 --
 arch/arm64/crypto/chacha-neon-core.S |   2 +-
 arch/arm64/crypto/chacha-neon-glue.c | 144 ++-------------------------
 3 files changed, 7 insertions(+), 146 deletions(-)

diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 3418c8d3c78d4..ce655da0fbeea 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -187,20 +187,13 @@ config CRYPTO_AES_ARM64_NEON_BLK
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_CHACHA20_NEON
 	tristate
 	depends on KERNEL_MODE_NEON
-	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_CHACHA_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
-	help
-	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
-	  stream cipher algorithms
-
-	  Architecture: arm64 using:
-	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_AES_ARM64_BS
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XCTR/XTS modes (bit-sliced NEON)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
diff --git a/arch/arm64/crypto/chacha-neon-core.S b/arch/arm64/crypto/chacha-neon-core.S
index b70ac76f2610c..80079586ecc7a 100644
--- a/arch/arm64/crypto/chacha-neon-core.S
+++ b/arch/arm64/crypto/chacha-neon-core.S
@@ -1,7 +1,7 @@
 /*
- * ChaCha/XChaCha NEON helper functions
+ * ChaCha/HChaCha NEON helper functions
  *
  * Copyright (C) 2016-2018 Linaro, Ltd. <ard.biesheuvel@linaro.org>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
diff --git a/arch/arm64/crypto/chacha-neon-glue.c b/arch/arm64/crypto/chacha-neon-glue.c
index bb9b52321bda7..a0c336b284027 100644
--- a/arch/arm64/crypto/chacha-neon-glue.c
+++ b/arch/arm64/crypto/chacha-neon-glue.c
@@ -1,8 +1,7 @@
 /*
- * ARM NEON and scalar accelerated ChaCha and XChaCha stream ciphers,
- * including ChaCha20 (RFC7539)
+ * ChaCha and HChaCha functions (ARM64 optimized)
  *
  * Copyright (C) 2016 - 2017 Linaro, Ltd. <ard.biesheuvel@linaro.org>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -17,14 +16,12 @@
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation; either version 2 of the License, or
  * (at your option) any later version.
  */
 
-#include <crypto/algapi.h>
-#include <crypto/internal/chacha.h>
+#include <crypto/chacha.h>
 #include <crypto/internal/simd.h>
-#include <crypto/internal/skcipher.h>
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
 #include <asm/hwcap.h>
@@ -93,151 +90,22 @@ void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src, unsigned int bytes,
 		dst += todo;
 	} while (bytes);
 }
 EXPORT_SYMBOL(chacha_crypt_arch);
 
-static int chacha_neon_stream_xor(struct skcipher_request *req,
-				  const struct chacha_ctx *ctx, const u8 *iv)
-{
-	struct skcipher_walk walk;
-	u32 state[16];
-	int err;
-
-	err = skcipher_walk_virt(&walk, req, false);
-
-	chacha_init(state, ctx->key, iv);
-
-	while (walk.nbytes > 0) {
-		unsigned int nbytes = walk.nbytes;
-
-		if (nbytes < walk.total)
-			nbytes = rounddown(nbytes, walk.stride);
-
-		if (!static_branch_likely(&have_neon) ||
-		    !crypto_simd_usable()) {
-			chacha_crypt_generic(state, walk.dst.virt.addr,
-					     walk.src.virt.addr, nbytes,
-					     ctx->nrounds);
-		} else {
-			kernel_neon_begin();
-			chacha_doneon(state, walk.dst.virt.addr,
-				      walk.src.virt.addr, nbytes, ctx->nrounds);
-			kernel_neon_end();
-		}
-		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
-	}
-
-	return err;
-}
-
-static int chacha_neon(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-
-	return chacha_neon_stream_xor(req, ctx, req->iv);
-}
-
-static int xchacha_neon(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct chacha_ctx subctx;
-	u32 state[16];
-	u8 real_iv[16];
-
-	chacha_init(state, ctx->key, req->iv);
-	hchacha_block_arch(state, subctx.key, ctx->nrounds);
-	subctx.nrounds = ctx->nrounds;
-
-	memcpy(&real_iv[0], req->iv + 24, 8);
-	memcpy(&real_iv[8], req->iv + 16, 8);
-	return chacha_neon_stream_xor(req, &subctx, real_iv);
-}
-
-static struct skcipher_alg algs[] = {
-	{
-		.base.cra_name		= "chacha20",
-		.base.cra_driver_name	= "chacha20-neon",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= CHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.walksize		= 5 * CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= chacha_neon,
-		.decrypt		= chacha_neon,
-	}, {
-		.base.cra_name		= "xchacha20",
-		.base.cra_driver_name	= "xchacha20-neon",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.walksize		= 5 * CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= xchacha_neon,
-		.decrypt		= xchacha_neon,
-	}, {
-		.base.cra_name		= "xchacha12",
-		.base.cra_driver_name	= "xchacha12-neon",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.walksize		= 5 * CHACHA_BLOCK_SIZE,
-		.setkey			= chacha12_setkey,
-		.encrypt		= xchacha_neon,
-		.decrypt		= xchacha_neon,
-	}
-};
-
 bool chacha_is_arch_optimized(void)
 {
 	return static_key_enabled(&have_neon);
 }
 EXPORT_SYMBOL(chacha_is_arch_optimized);
 
 static int __init chacha_simd_mod_init(void)
 {
-	if (!cpu_have_named_feature(ASIMD))
-		return 0;
-
-	static_branch_enable(&have_neon);
-
-	return IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) ?
-		crypto_register_skciphers(algs, ARRAY_SIZE(algs)) : 0;
+	if (cpu_have_named_feature(ASIMD))
+		static_branch_enable(&have_neon);
+	return 0;
 }
-
-static void __exit chacha_simd_mod_fini(void)
-{
-	if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) && cpu_have_named_feature(ASIMD))
-		crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
-}
-
 arch_initcall(chacha_simd_mod_init);
-module_exit(chacha_simd_mod_fini);
 
-MODULE_DESCRIPTION("ChaCha and XChaCha stream ciphers (NEON accelerated)");
+MODULE_DESCRIPTION("ChaCha and HChaCha functions (ARM64 optimized)");
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("chacha20");
-MODULE_ALIAS_CRYPTO("chacha20-neon");
-MODULE_ALIAS_CRYPTO("xchacha20");
-MODULE_ALIAS_CRYPTO("xchacha20-neon");
-MODULE_ALIAS_CRYPTO("xchacha12");
-MODULE_ALIAS_CRYPTO("xchacha12-neon");
-- 
2.49.0


