Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CDCC36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 18:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7t/OMNl9Xc0Nms/dEDcufS+fL8LNbYjemv37VgauOhQ=; b=yYW2U9d8n7QfMiQCpdI1bomk+F
	G0LSIf//6l16vqgAsEwJtnJ4NbHINFOWb7Q/yrTJWfgxqGo9gDIL8fWQB/hM/U8nCMopq0S8E9JnA
	Q3QYoynCwohc7axCHjigUxavOEHZNp+bUo8FhjMidsk35+Tf/zkqyyy44qgCVxeqW+kW0qDWycdgN
	lywYePrzZwmvIaKxaXBUt2aJZUly2m6BRgOwY2XssgoPSg0XTNE4HBci+1MxbmOXfTLdU3TDPBErJ
	9LNWEAnn0NmIZj3EGYdOgD8j7PgjpEyYNmOGPOu5NVJSuvoj2f7q5MGyYl0mQEkQ7PVSPmlgS9lgw
	vm/k5Wbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u18NX-0000000EMqF-28ms;
	Sat, 05 Apr 2025 18:36:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u18IB-0000000ELdg-2RCH;
	Sat, 05 Apr 2025 18:30:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0379261133;
	Sat,  5 Apr 2025 18:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5882FC4CEED;
	Sat,  5 Apr 2025 18:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877853;
	bh=WBt36oHsk6qIAHDqLsgQ+hsvoCHXobQ95GH0vd6H3pA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rpc6oA2hhNCxEH7EgEHKQfqT3LruJ7yeBjFiGW3p58r8oImLVacODUjFL/4bjxmnq
	 Y3NbfFVwYZwQ31OjbWF1nEn/fNxpmeUyJmNfPd0wVGJ4pIV1CIMSYJ/qjwM5x/ATRa
	 tSD+e8/14GU8aZUq6figLW/1yfqI+wEoR48Akgb87lImm/BaQi6YUzTsaPUCVkdg1L
	 gf9q6VwfBg1QRBnOsReWIsej+J8YzK96NNLy2hJJnLflgePQXelMiIJ0VMtUsxxD0K
	 9rASsfpXMB9TDD9+XoAzujC1vudxzNSg6D9WWj5phhCt8nDu1XQvPlJNkdn5KLPehL
	 sgnElFx59GLdg==
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
Subject: [PATCH 2/9] crypto: chacha - centralize the skcipher wrappers for arch code
Date: Sat,  5 Apr 2025 11:26:02 -0700
Message-ID: <20250405182609.404216-3-ebiggers@kernel.org>
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

Following the example of the crc32 and crc32c code, make the crypto
subsystem register both generic and architecture-optimized chacha20,
xchacha20, and xchacha12 skcipher algorithms, all implemented on top of
the appropriate library functions.  This eliminates the need for every
architecture to implement the same skcipher glue code.

To register the architecture-optimized skciphers only when
architecture-optimized code is actually being used, add a function
chacha_is_arch_optimized() and make each arch implement it.  Change each
architecture's ChaCha module_init function to arch_initcall so that the
CPU feature detection is guaranteed to run before
chacha_is_arch_optimized() gets called by crypto/chacha.c.  In the case
of s390, remove the CPU feature based module autoloading, which is no
longer needed since the module just gets pulled in via function linkage.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm/crypto/chacha-glue.c           |   9 +-
 arch/arm64/crypto/chacha-neon-glue.c    |   8 +-
 arch/mips/crypto/chacha-glue.c          |   8 +-
 arch/powerpc/crypto/chacha-p10-glue.c   |   8 +-
 arch/riscv/crypto/chacha-riscv64-glue.c |   8 +-
 arch/s390/crypto/chacha-glue.c          |   8 +-
 arch/x86/crypto/chacha_glue.c           |   8 +-
 crypto/Makefile                         |   3 +-
 crypto/chacha.c                         | 227 ++++++++++++++++++++++++
 crypto/chacha_generic.c                 | 139 ---------------
 include/crypto/chacha.h                 |   9 +
 11 files changed, 288 insertions(+), 147 deletions(-)
 create mode 100644 crypto/chacha.c
 delete mode 100644 crypto/chacha_generic.c

diff --git a/arch/arm/crypto/chacha-glue.c b/arch/arm/crypto/chacha-glue.c
index 50e635512046e..e1cb34d317712 100644
--- a/arch/arm/crypto/chacha-glue.c
+++ b/arch/arm/crypto/chacha-glue.c
@@ -285,10 +285,17 @@ static struct skcipher_alg neon_algs[] = {
 		.encrypt		= xchacha_neon,
 		.decrypt		= xchacha_neon,
 	}
 };
 
+bool chacha_is_arch_optimized(void)
+{
+	/* We always can use at least the ARM scalar implementation. */
+	return true;
+}
+EXPORT_SYMBOL(chacha_is_arch_optimized);
+
 static int __init chacha_simd_mod_init(void)
 {
 	int err = 0;
 
 	if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER)) {
@@ -331,11 +338,11 @@ static void __exit chacha_simd_mod_fini(void)
 		if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && (elf_hwcap & HWCAP_NEON))
 			crypto_unregister_skciphers(neon_algs, ARRAY_SIZE(neon_algs));
 	}
 }
 
-module_init(chacha_simd_mod_init);
+arch_initcall(chacha_simd_mod_init);
 module_exit(chacha_simd_mod_fini);
 
 MODULE_DESCRIPTION("ChaCha and XChaCha stream ciphers (scalar and NEON accelerated)");
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_LICENSE("GPL v2");
diff --git a/arch/arm64/crypto/chacha-neon-glue.c b/arch/arm64/crypto/chacha-neon-glue.c
index 229876acfc581..bb9b52321bda7 100644
--- a/arch/arm64/crypto/chacha-neon-glue.c
+++ b/arch/arm64/crypto/chacha-neon-glue.c
@@ -204,10 +204,16 @@ static struct skcipher_alg algs[] = {
 		.encrypt		= xchacha_neon,
 		.decrypt		= xchacha_neon,
 	}
 };
 
+bool chacha_is_arch_optimized(void)
+{
+	return static_key_enabled(&have_neon);
+}
+EXPORT_SYMBOL(chacha_is_arch_optimized);
+
 static int __init chacha_simd_mod_init(void)
 {
 	if (!cpu_have_named_feature(ASIMD))
 		return 0;
 
@@ -221,11 +227,11 @@ static void __exit chacha_simd_mod_fini(void)
 {
 	if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) && cpu_have_named_feature(ASIMD))
 		crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
 }
 
-module_init(chacha_simd_mod_init);
+arch_initcall(chacha_simd_mod_init);
 module_exit(chacha_simd_mod_fini);
 
 MODULE_DESCRIPTION("ChaCha and XChaCha stream ciphers (NEON accelerated)");
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_LICENSE("GPL v2");
diff --git a/arch/mips/crypto/chacha-glue.c b/arch/mips/crypto/chacha-glue.c
index f6fc2e1079a19..64ccaeaeaa1e1 100644
--- a/arch/mips/crypto/chacha-glue.c
+++ b/arch/mips/crypto/chacha-glue.c
@@ -118,10 +118,16 @@ static struct skcipher_alg algs[] = {
 		.encrypt		= xchacha_mips,
 		.decrypt		= xchacha_mips,
 	}
 };
 
+bool chacha_is_arch_optimized(void)
+{
+	return true;
+}
+EXPORT_SYMBOL(chacha_is_arch_optimized);
+
 static int __init chacha_simd_mod_init(void)
 {
 	return IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) ?
 		crypto_register_skciphers(algs, ARRAY_SIZE(algs)) : 0;
 }
@@ -130,11 +136,11 @@ static void __exit chacha_simd_mod_fini(void)
 {
 	if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER))
 		crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
 }
 
-module_init(chacha_simd_mod_init);
+arch_initcall(chacha_simd_mod_init);
 module_exit(chacha_simd_mod_fini);
 
 MODULE_DESCRIPTION("ChaCha and XChaCha stream ciphers (MIPS accelerated)");
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_LICENSE("GPL v2");
diff --git a/arch/powerpc/crypto/chacha-p10-glue.c b/arch/powerpc/crypto/chacha-p10-glue.c
index d8796decc1fb7..3355305b6c7f8 100644
--- a/arch/powerpc/crypto/chacha-p10-glue.c
+++ b/arch/powerpc/crypto/chacha-p10-glue.c
@@ -187,10 +187,16 @@ static struct skcipher_alg algs[] = {
 		.encrypt		= xchacha_p10,
 		.decrypt		= xchacha_p10,
 	}
 };
 
+bool chacha_is_arch_optimized(void)
+{
+	return static_key_enabled(&have_p10);
+}
+EXPORT_SYMBOL(chacha_is_arch_optimized);
+
 static int __init chacha_p10_init(void)
 {
 	if (!cpu_has_feature(CPU_FTR_ARCH_31))
 		return 0;
 
@@ -205,11 +211,11 @@ static void __exit chacha_p10_exit(void)
 		return;
 
 	crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
 }
 
-module_init(chacha_p10_init);
+arch_initcall(chacha_p10_init);
 module_exit(chacha_p10_exit);
 
 MODULE_DESCRIPTION("ChaCha and XChaCha stream ciphers (P10 accelerated)");
 MODULE_AUTHOR("Danny Tsen <dtsen@linux.ibm.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/arch/riscv/crypto/chacha-riscv64-glue.c b/arch/riscv/crypto/chacha-riscv64-glue.c
index 68caef7a3d50b..ccaab0dea383f 100644
--- a/arch/riscv/crypto/chacha-riscv64-glue.c
+++ b/arch/riscv/crypto/chacha-riscv64-glue.c
@@ -47,17 +47,23 @@ void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src, unsigned int bytes,
 	}
 	kernel_vector_end();
 }
 EXPORT_SYMBOL(chacha_crypt_arch);
 
+bool chacha_is_arch_optimized(void)
+{
+	return static_key_enabled(&use_zvkb);
+}
+EXPORT_SYMBOL(chacha_is_arch_optimized);
+
 static int __init riscv64_chacha_mod_init(void)
 {
 	if (riscv_isa_extension_available(NULL, ZVKB) &&
 	    riscv_vector_vlen() >= 128)
 		static_branch_enable(&use_zvkb);
 	return 0;
 }
-module_init(riscv64_chacha_mod_init);
+arch_initcall(riscv64_chacha_mod_init);
 
 MODULE_DESCRIPTION("ChaCha stream cipher (RISC-V optimized)");
 MODULE_AUTHOR("Jerry Shih <jerry.shih@sifive.com>");
 MODULE_LICENSE("GPL");
diff --git a/arch/s390/crypto/chacha-glue.c b/arch/s390/crypto/chacha-glue.c
index 920e9f0941e75..0c68191f2aa4c 100644
--- a/arch/s390/crypto/chacha-glue.c
+++ b/arch/s390/crypto/chacha-glue.c
@@ -101,10 +101,16 @@ static struct skcipher_alg chacha_algs[] = {
 		.encrypt		= chacha20_s390,
 		.decrypt		= chacha20_s390,
 	}
 };
 
+bool chacha_is_arch_optimized(void)
+{
+	return cpu_has_vx();
+}
+EXPORT_SYMBOL(chacha_is_arch_optimized);
+
 static int __init chacha_mod_init(void)
 {
 	return IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) ?
 		crypto_register_skciphers(chacha_algs, ARRAY_SIZE(chacha_algs)) : 0;
 }
@@ -113,11 +119,11 @@ static void __exit chacha_mod_fini(void)
 {
 	if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER))
 		crypto_unregister_skciphers(chacha_algs, ARRAY_SIZE(chacha_algs));
 }
 
-module_cpu_feature_match(S390_CPU_FEATURE_VXRS, chacha_mod_init);
+arch_initcall(chacha_mod_init);
 module_exit(chacha_mod_fini);
 
 MODULE_DESCRIPTION("ChaCha20 stream cipher");
 MODULE_LICENSE("GPL v2");
 
diff --git a/arch/x86/crypto/chacha_glue.c b/arch/x86/crypto/chacha_glue.c
index 8bb74a2728798..83a07b31cdd3a 100644
--- a/arch/x86/crypto/chacha_glue.c
+++ b/arch/x86/crypto/chacha_glue.c
@@ -268,10 +268,16 @@ static struct skcipher_alg algs[] = {
 		.encrypt		= xchacha_simd,
 		.decrypt		= xchacha_simd,
 	},
 };
 
+bool chacha_is_arch_optimized(void)
+{
+	return static_key_enabled(&chacha_use_simd);
+}
+EXPORT_SYMBOL(chacha_is_arch_optimized);
+
 static int __init chacha_simd_mod_init(void)
 {
 	if (!boot_cpu_has(X86_FEATURE_SSSE3))
 		return 0;
 
@@ -295,11 +301,11 @@ static void __exit chacha_simd_mod_fini(void)
 {
 	if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) && boot_cpu_has(X86_FEATURE_SSSE3))
 		crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
 }
 
-module_init(chacha_simd_mod_init);
+arch_initcall(chacha_simd_mod_init);
 module_exit(chacha_simd_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Martin Willi <martin@strongswan.org>");
 MODULE_DESCRIPTION("ChaCha and XChaCha stream ciphers (x64 SIMD accelerated)");
diff --git a/crypto/Makefile b/crypto/Makefile
index 0e6ab5ffd3f77..98510a2aa0b1e 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -146,11 +146,12 @@ obj-$(CONFIG_CRYPTO_ARC4) += arc4.o
 obj-$(CONFIG_CRYPTO_TEA) += tea.o
 obj-$(CONFIG_CRYPTO_KHAZAD) += khazad.o
 obj-$(CONFIG_CRYPTO_ANUBIS) += anubis.o
 obj-$(CONFIG_CRYPTO_SEED) += seed.o
 obj-$(CONFIG_CRYPTO_ARIA) += aria_generic.o
-obj-$(CONFIG_CRYPTO_CHACHA20) += chacha_generic.o
+obj-$(CONFIG_CRYPTO_CHACHA20) += chacha.o
+CFLAGS_chacha.o += -DARCH=$(ARCH)
 obj-$(CONFIG_CRYPTO_POLY1305) += poly1305_generic.o
 obj-$(CONFIG_CRYPTO_DEFLATE) += deflate.o
 obj-$(CONFIG_CRYPTO_MICHAEL_MIC) += michael_mic.o
 obj-$(CONFIG_CRYPTO_CRC32C) += crc32c_generic.o
 obj-$(CONFIG_CRYPTO_CRC32) += crc32_generic.o
diff --git a/crypto/chacha.c b/crypto/chacha.c
new file mode 100644
index 0000000000000..2009038c5e56c
--- /dev/null
+++ b/crypto/chacha.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Crypto API wrappers for the ChaCha20, XChaCha20, and XChaCha12 stream ciphers
+ *
+ * Copyright (C) 2015 Martin Willi
+ * Copyright (C) 2018 Google LLC
+ */
+
+#include <linux/unaligned.h>
+#include <crypto/algapi.h>
+#include <crypto/internal/chacha.h>
+#include <crypto/internal/skcipher.h>
+#include <linux/module.h>
+
+static int chacha_stream_xor(struct skcipher_request *req,
+			     const struct chacha_ctx *ctx, const u8 *iv,
+			     bool arch)
+{
+	struct skcipher_walk walk;
+	u32 state[16];
+	int err;
+
+	err = skcipher_walk_virt(&walk, req, false);
+
+	chacha_init(state, ctx->key, iv);
+
+	while (walk.nbytes > 0) {
+		unsigned int nbytes = walk.nbytes;
+
+		if (nbytes < walk.total)
+			nbytes = round_down(nbytes, CHACHA_BLOCK_SIZE);
+
+		if (arch)
+			chacha_crypt(state, walk.dst.virt.addr,
+				     walk.src.virt.addr, nbytes, ctx->nrounds);
+		else
+			chacha_crypt_generic(state, walk.dst.virt.addr,
+					     walk.src.virt.addr, nbytes,
+					     ctx->nrounds);
+		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
+	}
+
+	return err;
+}
+
+static int crypto_chacha_crypt_generic(struct skcipher_request *req)
+{
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	const struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
+
+	return chacha_stream_xor(req, ctx, req->iv, false);
+}
+
+static int crypto_chacha_crypt_arch(struct skcipher_request *req)
+{
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	const struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
+
+	return chacha_stream_xor(req, ctx, req->iv, true);
+}
+
+static int crypto_xchacha_crypt(struct skcipher_request *req, bool arch)
+{
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	const struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
+	struct chacha_ctx subctx;
+	u32 state[16];
+	u8 real_iv[16];
+
+	/* Compute the subkey given the original key and first 128 nonce bits */
+	chacha_init(state, ctx->key, req->iv);
+	if (arch)
+		hchacha_block(state, subctx.key, ctx->nrounds);
+	else
+		hchacha_block_generic(state, subctx.key, ctx->nrounds);
+	subctx.nrounds = ctx->nrounds;
+
+	/* Build the real IV */
+	memcpy(&real_iv[0], req->iv + 24, 8); /* stream position */
+	memcpy(&real_iv[8], req->iv + 16, 8); /* remaining 64 nonce bits */
+
+	/* Generate the stream and XOR it with the data */
+	return chacha_stream_xor(req, &subctx, real_iv, arch);
+}
+
+static int crypto_xchacha_crypt_generic(struct skcipher_request *req)
+{
+	return crypto_xchacha_crypt(req, false);
+}
+
+static int crypto_xchacha_crypt_arch(struct skcipher_request *req)
+{
+	return crypto_xchacha_crypt(req, true);
+}
+
+static struct skcipher_alg algs[] = {
+	{
+		.base.cra_name		= "chacha20",
+		.base.cra_driver_name	= "chacha20-generic",
+		.base.cra_priority	= 100,
+		.base.cra_blocksize	= 1,
+		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
+		.base.cra_module	= THIS_MODULE,
+
+		.min_keysize		= CHACHA_KEY_SIZE,
+		.max_keysize		= CHACHA_KEY_SIZE,
+		.ivsize			= CHACHA_IV_SIZE,
+		.chunksize		= CHACHA_BLOCK_SIZE,
+		.setkey			= chacha20_setkey,
+		.encrypt		= crypto_chacha_crypt_generic,
+		.decrypt		= crypto_chacha_crypt_generic,
+	},
+	{
+		.base.cra_name		= "xchacha20",
+		.base.cra_driver_name	= "xchacha20-generic",
+		.base.cra_priority	= 100,
+		.base.cra_blocksize	= 1,
+		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
+		.base.cra_module	= THIS_MODULE,
+
+		.min_keysize		= CHACHA_KEY_SIZE,
+		.max_keysize		= CHACHA_KEY_SIZE,
+		.ivsize			= XCHACHA_IV_SIZE,
+		.chunksize		= CHACHA_BLOCK_SIZE,
+		.setkey			= chacha20_setkey,
+		.encrypt		= crypto_xchacha_crypt_generic,
+		.decrypt		= crypto_xchacha_crypt_generic,
+	},
+	{
+		.base.cra_name		= "xchacha12",
+		.base.cra_driver_name	= "xchacha12-generic",
+		.base.cra_priority	= 100,
+		.base.cra_blocksize	= 1,
+		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
+		.base.cra_module	= THIS_MODULE,
+
+		.min_keysize		= CHACHA_KEY_SIZE,
+		.max_keysize		= CHACHA_KEY_SIZE,
+		.ivsize			= XCHACHA_IV_SIZE,
+		.chunksize		= CHACHA_BLOCK_SIZE,
+		.setkey			= chacha12_setkey,
+		.encrypt		= crypto_xchacha_crypt_generic,
+		.decrypt		= crypto_xchacha_crypt_generic,
+	},
+	{
+		.base.cra_name		= "chacha20",
+		.base.cra_driver_name	= "chacha20-" __stringify(ARCH),
+		.base.cra_priority	= 300,
+		.base.cra_blocksize	= 1,
+		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
+		.base.cra_module	= THIS_MODULE,
+
+		.min_keysize		= CHACHA_KEY_SIZE,
+		.max_keysize		= CHACHA_KEY_SIZE,
+		.ivsize			= CHACHA_IV_SIZE,
+		.chunksize		= CHACHA_BLOCK_SIZE,
+		.setkey			= chacha20_setkey,
+		.encrypt		= crypto_chacha_crypt_arch,
+		.decrypt		= crypto_chacha_crypt_arch,
+	},
+	{
+		.base.cra_name		= "xchacha20",
+		.base.cra_driver_name	= "xchacha20-" __stringify(ARCH),
+		.base.cra_priority	= 300,
+		.base.cra_blocksize	= 1,
+		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
+		.base.cra_module	= THIS_MODULE,
+
+		.min_keysize		= CHACHA_KEY_SIZE,
+		.max_keysize		= CHACHA_KEY_SIZE,
+		.ivsize			= XCHACHA_IV_SIZE,
+		.chunksize		= CHACHA_BLOCK_SIZE,
+		.setkey			= chacha20_setkey,
+		.encrypt		= crypto_xchacha_crypt_arch,
+		.decrypt		= crypto_xchacha_crypt_arch,
+	},
+	{
+		.base.cra_name		= "xchacha12",
+		.base.cra_driver_name	= "xchacha12-" __stringify(ARCH),
+		.base.cra_priority	= 300,
+		.base.cra_blocksize	= 1,
+		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
+		.base.cra_module	= THIS_MODULE,
+
+		.min_keysize		= CHACHA_KEY_SIZE,
+		.max_keysize		= CHACHA_KEY_SIZE,
+		.ivsize			= XCHACHA_IV_SIZE,
+		.chunksize		= CHACHA_BLOCK_SIZE,
+		.setkey			= chacha12_setkey,
+		.encrypt		= crypto_xchacha_crypt_arch,
+		.decrypt		= crypto_xchacha_crypt_arch,
+	}
+};
+
+static unsigned int num_algs;
+
+static int __init crypto_chacha_mod_init(void)
+{
+	/* register the arch flavours only if they differ from generic */
+	num_algs = ARRAY_SIZE(algs);
+	BUILD_BUG_ON(ARRAY_SIZE(algs) % 2 != 0);
+	if (!chacha_is_arch_optimized())
+		num_algs /= 2;
+
+	return crypto_register_skciphers(algs, num_algs);
+}
+
+static void __exit crypto_chacha_mod_fini(void)
+{
+	crypto_unregister_skciphers(algs, num_algs);
+}
+
+subsys_initcall(crypto_chacha_mod_init);
+module_exit(crypto_chacha_mod_fini);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Martin Willi <martin@strongswan.org>");
+MODULE_DESCRIPTION("Crypto API wrappers for the ChaCha20, XChaCha20, and XChaCha12 stream ciphers");
+MODULE_ALIAS_CRYPTO("chacha20");
+MODULE_ALIAS_CRYPTO("chacha20-generic");
+MODULE_ALIAS_CRYPTO("chacha20-"  __stringify(ARCH));
+MODULE_ALIAS_CRYPTO("xchacha20");
+MODULE_ALIAS_CRYPTO("xchacha20-generic");
+MODULE_ALIAS_CRYPTO("xchacha20-"  __stringify(ARCH));
+MODULE_ALIAS_CRYPTO("xchacha12");
+MODULE_ALIAS_CRYPTO("xchacha12-generic");
+MODULE_ALIAS_CRYPTO("xchacha12-"  __stringify(ARCH));
diff --git a/crypto/chacha_generic.c b/crypto/chacha_generic.c
deleted file mode 100644
index 1fb9fbd302c6f..0000000000000
--- a/crypto/chacha_generic.c
+++ /dev/null
@@ -1,139 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * ChaCha and XChaCha stream ciphers, including ChaCha20 (RFC7539)
- *
- * Copyright (C) 2015 Martin Willi
- * Copyright (C) 2018 Google LLC
- */
-
-#include <linux/unaligned.h>
-#include <crypto/algapi.h>
-#include <crypto/internal/chacha.h>
-#include <crypto/internal/skcipher.h>
-#include <linux/module.h>
-
-static int chacha_stream_xor(struct skcipher_request *req,
-			     const struct chacha_ctx *ctx, const u8 *iv)
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
-			nbytes = round_down(nbytes, CHACHA_BLOCK_SIZE);
-
-		chacha_crypt_generic(state, walk.dst.virt.addr,
-				     walk.src.virt.addr, nbytes, ctx->nrounds);
-		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
-	}
-
-	return err;
-}
-
-static int crypto_chacha_crypt(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-
-	return chacha_stream_xor(req, ctx, req->iv);
-}
-
-static int crypto_xchacha_crypt(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct chacha_ctx subctx;
-	u32 state[16];
-	u8 real_iv[16];
-
-	/* Compute the subkey given the original key and first 128 nonce bits */
-	chacha_init(state, ctx->key, req->iv);
-	hchacha_block_generic(state, subctx.key, ctx->nrounds);
-	subctx.nrounds = ctx->nrounds;
-
-	/* Build the real IV */
-	memcpy(&real_iv[0], req->iv + 24, 8); /* stream position */
-	memcpy(&real_iv[8], req->iv + 16, 8); /* remaining 64 nonce bits */
-
-	/* Generate the stream and XOR it with the data */
-	return chacha_stream_xor(req, &subctx, real_iv);
-}
-
-static struct skcipher_alg algs[] = {
-	{
-		.base.cra_name		= "chacha20",
-		.base.cra_driver_name	= "chacha20-generic",
-		.base.cra_priority	= 100,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= CHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= crypto_chacha_crypt,
-		.decrypt		= crypto_chacha_crypt,
-	}, {
-		.base.cra_name		= "xchacha20",
-		.base.cra_driver_name	= "xchacha20-generic",
-		.base.cra_priority	= 100,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= crypto_xchacha_crypt,
-		.decrypt		= crypto_xchacha_crypt,
-	}, {
-		.base.cra_name		= "xchacha12",
-		.base.cra_driver_name	= "xchacha12-generic",
-		.base.cra_priority	= 100,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha12_setkey,
-		.encrypt		= crypto_xchacha_crypt,
-		.decrypt		= crypto_xchacha_crypt,
-	}
-};
-
-static int __init chacha_generic_mod_init(void)
-{
-	return crypto_register_skciphers(algs, ARRAY_SIZE(algs));
-}
-
-static void __exit chacha_generic_mod_fini(void)
-{
-	crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
-}
-
-subsys_initcall(chacha_generic_mod_init);
-module_exit(chacha_generic_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Martin Willi <martin@strongswan.org>");
-MODULE_DESCRIPTION("ChaCha and XChaCha stream ciphers (generic)");
-MODULE_ALIAS_CRYPTO("chacha20");
-MODULE_ALIAS_CRYPTO("chacha20-generic");
-MODULE_ALIAS_CRYPTO("xchacha20");
-MODULE_ALIAS_CRYPTO("xchacha20-generic");
-MODULE_ALIAS_CRYPTO("xchacha12");
-MODULE_ALIAS_CRYPTO("xchacha12-generic");
diff --git a/include/crypto/chacha.h b/include/crypto/chacha.h
index f8cc073bba41b..58129e18cc31d 100644
--- a/include/crypto/chacha.h
+++ b/include/crypto/chacha.h
@@ -97,6 +97,15 @@ static inline void chacha20_crypt(u32 *state, u8 *dst, const u8 *src,
 				  unsigned int bytes)
 {
 	chacha_crypt(state, dst, src, bytes, 20);
 }
 
+#if IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA)
+bool chacha_is_arch_optimized(void);
+#else
+static inline bool chacha_is_arch_optimized(void)
+{
+	return false;
+}
+#endif
+
 #endif /* _CRYPTO_CHACHA_H */
-- 
2.49.0


