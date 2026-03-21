Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4CC1093170
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 04:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzjjYA6bvjLVGFNv4Cb4ITWFkePAME6jeVXu1eKv65k=; b=CC2MwG4t24TKO71nYMDdDjlpyj
	RF4TcEktJrs2SkyhnCYMQ50GgSctTMtgocJvZmXcg/DBkHS+Gn4/8WesRlO2Zb3M1qdfvpKwndObV
	QlH5HDXzLAWyaDtYcqAfR8CPZY4SQnzsECzuDaK1761Rx2k81xa6F152N7f9ibwfpuaJA8JFMQPp0
	h1k0V8q7f7FLcrNSeAQSHvpURKMBEg6xsaynVNgS8w0QCCtAE+9HZgCPY+F5H+mHxopC0nNQ1GTup
	bmEyy6J3Tm+kzWdMm1/yJPbMgQjgUJmMxG9S6vrFG05Yt4ymKpvRtPX5Apw02VgvZr9Fz8zITjmz+
	LYeQlFNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3nhe-0000000E026-34a8;
	Sat, 21 Mar 2026 04:12:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ngw-0000000DzQC-2tks;
	Sat, 21 Mar 2026 04:12:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 247944465F;
	Sat, 21 Mar 2026 04:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34E8C2BCB3;
	Sat, 21 Mar 2026 04:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774066322;
	bh=Z7X3CEAgl3dXN2F8cAlFv5bwr0TXDZ0BzcoXhcL/Vrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mLg2c8EbUZGZV7Eej4tzRai+I4sdo2DDkwL00k5pj7z+Jl6xHe281kSPAtTsbhN2X
	 AW8LVDq/ARj0QCu4t4SjYw3K7LI0tHiXbUtem7U6LcQnEQ7imxZXpEyrPHkKaGhZzS
	 u66jNXD30u1xUjboE1bjXDAj+HzhAolFEcjhj8xGXGwm0yanFN3xibRDb4fnoQsBL+
	 vnXWpN6aPHEn/48hjaokhu481ab3KrKEpynO6fdKjZef5gi0dsszYcZVOKpCxt3mi/
	 /z27r9OTCPVgyg7pw7x0uBMA//YZl9ro9uDNkxqzKxEcZIUEJ5nVsjGyKB5jYwyTrH
	 wLx0SjaNAhMkg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 09/12] lib/crypto: x86/sm3: Migrate optimized code into library
Date: Fri, 20 Mar 2026 21:09:32 -0700
Message-ID: <20260321040935.410034-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321040935.410034-1-ebiggers@kernel.org>
References: <20260321040935.410034-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_211202_830323_2895AC5A 
X-CRM114-Status: GOOD (  18.95  )
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

Instead of exposing the x86-optimized SM3 code via an x86-specific
crypto_shash algorithm, instead just implement the sm3_blocks() library
function.  This is much simpler, it makes the SM3 library functions be
x86-optimized, and it fixes the longstanding issue where the
x86-optimized SM3 code was disabled by default.  SM3 still remains
available through crypto_shash, but individual architectures no longer
need to handle it.

Tweak the prototype of sm3_transform_avx() to match what the library
expects, including changing the block count to size_t.  Note that the
assembly code actually already treated this argument as size_t.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/x86/crypto/Kconfig                       |  13 ---
 arch/x86/crypto/Makefile                      |   3 -
 arch/x86/crypto/sm3_avx_glue.c                | 100 ------------------
 lib/crypto/Kconfig                            |   1 +
 lib/crypto/Makefile                           |   1 +
 .../crypto/x86}/sm3-avx-asm_64.S              |  13 ++-
 lib/crypto/x86/sm3.h                          |  39 +++++++
 7 files changed, 47 insertions(+), 123 deletions(-)
 delete mode 100644 arch/x86/crypto/sm3_avx_glue.c
 rename {arch/x86/crypto => lib/crypto/x86}/sm3-avx-asm_64.S (98%)
 create mode 100644 lib/crypto/x86/sm3.h

diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index 7fb2319a0916..617494bd019f 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -329,23 +329,10 @@ config CRYPTO_AEGIS128_AESNI_SSE2
 
 	  Architecture: x86_64 using:
 	  - AES-NI (AES New Instructions)
 	  - SSE4.1 (Streaming SIMD Extensions 4.1)
 
-config CRYPTO_SM3_AVX_X86_64
-	tristate "Hash functions: SM3 (AVX)"
-	depends on 64BIT
-	select CRYPTO_HASH
-	select CRYPTO_LIB_SM3
-	help
-	  SM3 secure hash function as defined by OSCCA GM/T 0004-2012 SM3
-
-	  Architecture: x86_64 using:
-	  - AVX (Advanced Vector Extensions)
-
-	  If unsure, say N.
-
 config CRYPTO_GHASH_CLMUL_NI_INTEL
 	tristate "Hash functions: GHASH (CLMUL-NI)"
 	depends on 64BIT
 	select CRYPTO_CRYPTD
 	help
diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index b21ad0978c52..9420b9ff51da 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -51,13 +51,10 @@ aesni-intel-$(CONFIG_64BIT) += aes-ctr-avx-x86_64.o \
 			       aes-xts-avx-x86_64.o
 
 obj-$(CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL) += ghash-clmulni-intel.o
 ghash-clmulni-intel-y := ghash-clmulni-intel_asm.o ghash-clmulni-intel_glue.o
 
-obj-$(CONFIG_CRYPTO_SM3_AVX_X86_64) += sm3-avx-x86_64.o
-sm3-avx-x86_64-y := sm3-avx-asm_64.o sm3_avx_glue.o
-
 obj-$(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64) += sm4-aesni-avx-x86_64.o
 sm4-aesni-avx-x86_64-y := sm4-aesni-avx-asm_64.o sm4_aesni_avx_glue.o
 
 obj-$(CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64) += sm4-aesni-avx2-x86_64.o
 sm4-aesni-avx2-x86_64-y := sm4-aesni-avx2-asm_64.o sm4_aesni_avx2_glue.o
diff --git a/arch/x86/crypto/sm3_avx_glue.c b/arch/x86/crypto/sm3_avx_glue.c
deleted file mode 100644
index 6e8c42b9dc8e..000000000000
--- a/arch/x86/crypto/sm3_avx_glue.c
+++ /dev/null
@@ -1,100 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * SM3 Secure Hash Algorithm, AVX assembler accelerated.
- * specified in: https://datatracker.ietf.org/doc/html/draft-sca-cfrg-sm3-02
- *
- * Copyright (C) 2021 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
- */
-
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
-
-#include <crypto/internal/hash.h>
-#include <crypto/internal/simd.h>
-#include <crypto/sm3.h>
-#include <crypto/sm3_base.h>
-#include <linux/cpufeature.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-asmlinkage void sm3_transform_avx(struct sm3_state *state,
-			const u8 *data, int nblocks);
-
-static int sm3_avx_update(struct shash_desc *desc, const u8 *data,
-			 unsigned int len)
-{
-	int remain;
-
-	/*
-	 * Make sure struct sm3_state begins directly with the SM3
-	 * 256-bit internal state, as this is what the asm functions expect.
-	 */
-	BUILD_BUG_ON(offsetof(struct sm3_state, state) != 0);
-
-	kernel_fpu_begin();
-	remain = sm3_base_do_update_blocks(desc, data, len, sm3_transform_avx);
-	kernel_fpu_end();
-	return remain;
-}
-
-static int sm3_avx_finup(struct shash_desc *desc, const u8 *data,
-		      unsigned int len, u8 *out)
-{
-	kernel_fpu_begin();
-	sm3_base_do_finup(desc, data, len, sm3_transform_avx);
-	kernel_fpu_end();
-	return sm3_base_finish(desc, out);
-}
-
-static struct shash_alg sm3_avx_alg = {
-	.digestsize	=	SM3_DIGEST_SIZE,
-	.init		=	sm3_base_init,
-	.update		=	sm3_avx_update,
-	.finup		=	sm3_avx_finup,
-	.descsize	=	SM3_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sm3",
-		.cra_driver_name =	"sm3-avx",
-		.cra_priority	=	300,
-		.cra_flags	 =	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SM3_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static int __init sm3_avx_mod_init(void)
-{
-	const char *feature_name;
-
-	if (!boot_cpu_has(X86_FEATURE_AVX)) {
-		pr_info("AVX instruction are not detected.\n");
-		return -ENODEV;
-	}
-
-	if (!boot_cpu_has(X86_FEATURE_BMI2)) {
-		pr_info("BMI2 instruction are not detected.\n");
-		return -ENODEV;
-	}
-
-	if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
-				&feature_name)) {
-		pr_info("CPU feature '%s' is not supported.\n", feature_name);
-		return -ENODEV;
-	}
-
-	return crypto_register_shash(&sm3_avx_alg);
-}
-
-static void __exit sm3_avx_mod_exit(void)
-{
-	crypto_unregister_shash(&sm3_avx_alg);
-}
-
-module_init(sm3_avx_mod_init);
-module_exit(sm3_avx_mod_exit);
-
-MODULE_LICENSE("GPL v2");
-MODULE_AUTHOR("Tianjia Zhang <tianjia.zhang@linux.alibaba.com>");
-MODULE_DESCRIPTION("SM3 Secure Hash Algorithm, AVX assembler accelerated");
-MODULE_ALIAS_CRYPTO("sm3");
-MODULE_ALIAS_CRYPTO("sm3-avx");
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index b714f9cbd368..2824bfb0e30d 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -275,9 +275,10 @@ config CRYPTO_LIB_SM3_ARCH
 	bool
 	depends on CRYPTO_LIB_SM3 && !UML
 	default y if ARM64
 	default y if RISCV && 64BIT && TOOLCHAIN_HAS_VECTOR_CRYPTO && \
 		     RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
+	default y if X86_64
 
 source "lib/crypto/tests/Kconfig"
 
 endmenu
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 3019e6cbb10d..308ec3e93b54 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -354,10 +354,11 @@ libsm3-y := sm3.o
 ifeq ($(CONFIG_CRYPTO_LIB_SM3_ARCH),y)
 CFLAGS_sm3.o += -I$(src)/$(SRCARCH)
 libsm3-$(CONFIG_ARM64) += arm64/sm3-ce-core.o \
 			  arm64/sm3-neon-core.o
 libsm3-$(CONFIG_RISCV) += riscv/sm3-riscv64-zvksh-zvkb.o
+libsm3-$(CONFIG_X86) += x86/sm3-avx-asm_64.o
 endif # CONFIG_CRYPTO_LIB_SM3_ARCH
 
 ################################################################################
 
 obj-$(CONFIG_MPILIB) += mpi/
diff --git a/arch/x86/crypto/sm3-avx-asm_64.S b/lib/crypto/x86/sm3-avx-asm_64.S
similarity index 98%
rename from arch/x86/crypto/sm3-avx-asm_64.S
rename to lib/crypto/x86/sm3-avx-asm_64.S
index 503bab450a91..a1925b136010 100644
--- a/arch/x86/crypto/sm3-avx-asm_64.S
+++ b/lib/crypto/x86/sm3-avx-asm_64.S
@@ -10,14 +10,13 @@
 /* Based on SM3 AES/BMI2 accelerated work by libgcrypt at:
  *  https://gnupg.org/software/libgcrypt/index.html
  */
 
 #include <linux/linkage.h>
-#include <linux/cfi_types.h>
 #include <asm/frame.h>
 
-/* Context structure */
+/* State structure */
 
 #define state_h0 0
 #define state_h1 4
 #define state_h2 8
 #define state_h3 12
@@ -323,17 +322,17 @@
 .text
 
 /*
  * Transform nblocks*64 bytes (nblocks*16 32-bit words) at DATA.
  *
- * void sm3_transform_avx(struct sm3_state *state,
- *                        const u8 *data, int nblocks);
+ * void sm3_transform_avx(struct sm3_block_state *state,
+ *                        const u8 *data, size_t nblocks);
  */
-SYM_TYPED_FUNC_START(sm3_transform_avx)
+SYM_FUNC_START(sm3_transform_avx)
 	/* input:
-	 *	%rdi: ctx, CTX
-	 *	%rsi: data (64*nblks bytes)
+	 *	%rdi: state
+	 *	%rsi: data
 	 *	%rdx: nblocks
 	 */
 	vzeroupper;
 
 	pushq %rbp;
diff --git a/lib/crypto/x86/sm3.h b/lib/crypto/x86/sm3.h
new file mode 100644
index 000000000000..3834780f2f6a
--- /dev/null
+++ b/lib/crypto/x86/sm3.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * SM3 optimized for x86_64
+ *
+ * Copyright 2026 Google LLC
+ */
+#include <asm/fpu/api.h>
+#include <linux/static_call.h>
+
+asmlinkage void sm3_transform_avx(struct sm3_block_state *state,
+				  const u8 *data, size_t nblocks);
+
+static void sm3_blocks_avx(struct sm3_block_state *state,
+			   const u8 *data, size_t nblocks)
+{
+	if (likely(irq_fpu_usable())) {
+		kernel_fpu_begin();
+		sm3_transform_avx(state, data, nblocks);
+		kernel_fpu_end();
+	} else {
+		sm3_blocks_generic(state, data, nblocks);
+	}
+}
+
+DEFINE_STATIC_CALL(sm3_blocks_x86, sm3_blocks_generic);
+
+static void sm3_blocks(struct sm3_block_state *state,
+		       const u8 *data, size_t nblocks)
+{
+	static_call(sm3_blocks_x86)(state, data, nblocks);
+}
+
+#define sm3_mod_init_arch sm3_mod_init_arch
+static void sm3_mod_init_arch(void)
+{
+	if (boot_cpu_has(X86_FEATURE_AVX) && boot_cpu_has(X86_FEATURE_BMI2) &&
+	    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, NULL))
+		static_call_update(sm3_blocks_x86, sm3_blocks_avx);
+}
-- 
2.53.0


