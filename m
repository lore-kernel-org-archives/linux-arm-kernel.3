Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51F0C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 20:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmoXJOnLMJ3rG7ZMuVMC33DtFfTsvO34Ibg94W2IscU=; b=yb+KqHMxhDdojCicx/D4Sk0wfu
	lUtZCyDvNnLKS28Nj7xcCNJoyBo+SCn0trzSp7HLtVVjetLS9IfaG9GS4KBF8jWV51+yW/E/X5quY
	FWK5sSQ4gDKe7QSVZhHBkrZ1v4KJFy2xiXjzjaLLuK8zdQOFETZb9zzpJ22/L5p9+vixjVJ2VCGle
	5fC9lbWWWF7kBLgGvcIgKD37wc0YWkE3uqFBnseyCHj/IRfOwSB+9SgwNAjEjQnQ2Kmov4H8fUpN2
	mGyIyzVyZ/YBoCoFQOGAhVMEoYqy7N+Ujvh+DRSyxG2MzHcanOHXqSoG4le2vqjvMM6U+Aow0mKwQ
	N4QhBmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO04U-000000023zK-1xko;
	Sat, 07 Jun 2025 20:23:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzpF-000000021Ub-1qTS;
	Sat, 07 Jun 2025 20:07:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B9F815C5AF8;
	Sat,  7 Jun 2025 20:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E608CC4CEF3;
	Sat,  7 Jun 2025 20:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749326850;
	bh=WdPZKPTFqdPtFVY3vxcYLn4JpXpcQFxK5xoZxw4oN6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rYwbw18nEbKgn50Q7dJjhLaOiApwovsGIwvol4hlE3ERmUUlQJY+VNQ/CnX2+rGSM
	 c0YqjT0Th4xYfjnGQHFz/Sw5Z/ikWRamSc3unwHRfBVwFIjAhxW3i0m6tSQxaDEnvp
	 xHg6+or6mz0ts6zU8NMMPKf7RzLSPbJyLmi0l614IUJ6MicSw9Gk14Y0i5HWuP/W93
	 x70mCt46NarWsMV8FOFk6YVKK1eOo5CxPH15DKrwBazQXQw1ckbrMhaNtdI9VZxxvX
	 SHiVYR/cJZROszwFVf64VoMxta5X2NJsNqIhT7u7ipAeU4j0/7fkWcqESF/PWSm+3L
	 SdKejv+mALrJg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 04/12] lib/crc/arm64: migrate arm64-optimized CRC code into lib/crc/
Date: Sat,  7 Jun 2025 13:04:46 -0700
Message-ID: <20250607200454.73587-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
References: <20250607200454.73587-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_130733_658409_89719383 
X-CRM114-Status: GOOD (  13.41  )
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

Move the arm64-optimized CRC code from arch/arm64/lib/crc* into its new
location in lib/crc/arm64/, and wire it up in the new way.  This new way
of organizing the CRC code eliminates the need to artificially split the
code for each CRC variant into separate arch and generic modules,
enabling better inlining and dead code elimination.  For more details,
see "lib/crc: prepare for arch-optimized code in subdirs of lib/crc/".

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/Kconfig                            |  2 --
 arch/arm64/lib/Makefile                       |  6 -----
 lib/crc/Kconfig                               |  2 ++
 lib/crc/Makefile                              |  2 ++
 .../lib => lib/crc/arm64}/crc-t10dif-core.S   |  0
 .../crc/arm64/crc-t10dif.h                    | 22 +++----------------
 .../arm64/lib => lib/crc/arm64}/crc32-core.S  |  0
 .../lib/crc32.c => lib/crc/arm64/crc32.h      | 19 ++++------------
 8 files changed, 11 insertions(+), 42 deletions(-)
 rename {arch/arm64/lib => lib/crc/arm64}/crc-t10dif-core.S (100%)
 rename arch/arm64/lib/crc-t10dif.c => lib/crc/arm64/crc-t10dif.h (70%)
 rename {arch/arm64/lib => lib/crc/arm64}/crc32-core.S (100%)
 rename arch/arm64/lib/crc32.c => lib/crc/arm64/crc32.h (81%)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 55fc331af3371..cbeac225903f7 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -19,12 +19,10 @@ config ARM64
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_CC_PLATFORM
-	select ARCH_HAS_CRC32
-	select ARCH_HAS_CRC_T10DIF if KERNEL_MODE_NEON
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DMA_OPS if XEN
 	select ARCH_HAS_DMA_PREP_COHERENT
diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 027bfa9689c6a..9b255d9332479 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -14,16 +14,10 @@ CFLAGS_xor-neon.o		+= $(CC_FLAGS_FPU)
 CFLAGS_REMOVE_xor-neon.o	+= $(CC_FLAGS_NO_FPU)
 endif
 
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
 
-obj-$(CONFIG_CRC32_ARCH) += crc32-arm64.o
-crc32-arm64-y := crc32.o crc32-core.o
-
-obj-$(CONFIG_CRC_T10DIF_ARCH) += crc-t10dif-arm64.o
-crc-t10dif-arm64-y := crc-t10dif.o crc-t10dif-core.o
-
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_ARM64_MTE) += mte.o
 
 obj-$(CONFIG_KASAN_SW_TAGS) += kasan_sw_tags.o
diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index edd1b99098003..63edb487daff8 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -49,10 +49,11 @@ config ARCH_HAS_CRC_T10DIF
 
 config CRC_T10DIF_ARCH
 	bool
 	depends on CRC_T10DIF && CRC_OPTIMIZATIONS
 	default y if ARM && KERNEL_MODE_NEON
+	default y if ARM64 && KERNEL_MODE_NEON
 
 config CRC32
 	tristate
 	select BITREVERSE
 	help
@@ -64,10 +65,11 @@ config ARCH_HAS_CRC32
 
 config CRC32_ARCH
 	bool
 	depends on CRC32 && CRC_OPTIMIZATIONS
 	default y if ARM && KERNEL_MODE_NEON
+	default y if ARM64
 
 config CRC64
 	tristate
 	help
 	  The CRC64 library functions.  Select this if your module uses any of
diff --git a/lib/crc/Makefile b/lib/crc/Makefile
index c72d351be6cb8..8adff4ae1ba63 100644
--- a/lib/crc/Makefile
+++ b/lib/crc/Makefile
@@ -12,17 +12,19 @@ obj-$(CONFIG_CRC_ITU_T) += crc-itu-t.o
 obj-$(CONFIG_CRC_T10DIF) += crc-t10dif.o
 crc-t10dif-y := crc-t10dif-main.o
 ifeq ($(CONFIG_CRC_T10DIF_ARCH),y)
 CFLAGS_crc-t10dif-main.o += -I$(src)/$(SRCARCH)
 crc-t10dif-$(CONFIG_ARM) += arm/crc-t10dif-core.o
+crc-t10dif-$(CONFIG_ARM64) += arm64/crc-t10dif-core.o
 endif
 
 obj-$(CONFIG_CRC32) += crc32.o
 crc32-y := crc32-main.o
 ifeq ($(CONFIG_CRC32_ARCH),y)
 CFLAGS_crc32-main.o += -I$(src)/$(SRCARCH)
 crc32-$(CONFIG_ARM) += arm/crc32-core.o
+crc32-$(CONFIG_ARM64) += arm64/crc32-core.o
 endif
 
 obj-$(CONFIG_CRC64) += crc64.o
 crc64-y := crc64-main.o
 ifeq ($(CONFIG_CRC64_ARCH),y)
diff --git a/arch/arm64/lib/crc-t10dif-core.S b/lib/crc/arm64/crc-t10dif-core.S
similarity index 100%
rename from arch/arm64/lib/crc-t10dif-core.S
rename to lib/crc/arm64/crc-t10dif-core.S
diff --git a/arch/arm64/lib/crc-t10dif.c b/lib/crc/arm64/crc-t10dif.h
similarity index 70%
rename from arch/arm64/lib/crc-t10dif.c
rename to lib/crc/arm64/crc-t10dif.h
index c2ffe4fdb59d1..c4521a7f1ee9b 100644
--- a/arch/arm64/lib/crc-t10dif.c
+++ b/lib/crc/arm64/crc-t10dif.h
@@ -4,15 +4,10 @@
  *
  * Copyright (C) 2016 - 2017 Linaro Ltd <ard.biesheuvel@linaro.org>
  */
 
 #include <linux/cpufeature.h>
-#include <linux/crc-t10dif.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/string.h>
 
 #include <crypto/internal/simd.h>
 
 #include <asm/neon.h>
 #include <asm/simd.h>
@@ -24,11 +19,11 @@ static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
 
 asmlinkage void crc_t10dif_pmull_p8(u16 init_crc, const u8 *buf, size_t len,
 				    u8 out[16]);
 asmlinkage u16 crc_t10dif_pmull_p64(u16 init_crc, const u8 *buf, size_t len);
 
-u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
+static inline u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
 {
 	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE) {
 		if (static_branch_likely(&have_pmull)) {
 			if (crypto_simd_usable()) {
 				kernel_neon_begin();
@@ -48,26 +43,15 @@ u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
 			return crc_t10dif_generic(0, buf, sizeof(buf));
 		}
 	}
 	return crc_t10dif_generic(crc, data, length);
 }
-EXPORT_SYMBOL(crc_t10dif_arch);
 
-static int __init crc_t10dif_arm64_init(void)
+#define crc_t10dif_mod_init_arch crc_t10dif_mod_init_arch
+static inline void crc_t10dif_mod_init_arch(void)
 {
 	if (cpu_have_named_feature(ASIMD)) {
 		static_branch_enable(&have_asimd);
 		if (cpu_have_named_feature(PMULL))
 			static_branch_enable(&have_pmull);
 	}
-	return 0;
 }
-subsys_initcall(crc_t10dif_arm64_init);
-
-static void __exit crc_t10dif_arm64_exit(void)
-{
-}
-module_exit(crc_t10dif_arm64_exit);
-
-MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
-MODULE_DESCRIPTION("CRC-T10DIF using arm64 NEON and Crypto Extensions");
-MODULE_LICENSE("GPL v2");
diff --git a/arch/arm64/lib/crc32-core.S b/lib/crc/arm64/crc32-core.S
similarity index 100%
rename from arch/arm64/lib/crc32-core.S
rename to lib/crc/arm64/crc32-core.S
diff --git a/arch/arm64/lib/crc32.c b/lib/crc/arm64/crc32.h
similarity index 81%
rename from arch/arm64/lib/crc32.c
rename to lib/crc/arm64/crc32.h
index ed3acd71178f8..6e5dec45f05d2 100644
--- a/arch/arm64/lib/crc32.c
+++ b/lib/crc/arm64/crc32.h
@@ -1,11 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-#include <linux/crc32.h>
-#include <linux/linkage.h>
-#include <linux/module.h>
-
 #include <asm/alternative.h>
 #include <asm/cpufeature.h>
 #include <asm/neon.h>
 #include <asm/simd.h>
 
@@ -20,11 +16,11 @@ asmlinkage u32 crc32_be_arm64(u32 crc, unsigned char const *p, size_t len);
 
 asmlinkage u32 crc32_le_arm64_4way(u32 crc, unsigned char const *p, size_t len);
 asmlinkage u32 crc32c_le_arm64_4way(u32 crc, unsigned char const *p, size_t len);
 asmlinkage u32 crc32_be_arm64_4way(u32 crc, unsigned char const *p, size_t len);
 
-u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
+static inline u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!alternative_has_cap_likely(ARM64_HAS_CRC32))
 		return crc32_le_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
@@ -39,13 +35,12 @@ u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 			return crc;
 	}
 
 	return crc32_le_arm64(crc, p, len);
 }
-EXPORT_SYMBOL(crc32_le_arch);
 
-u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
+static inline u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!alternative_has_cap_likely(ARM64_HAS_CRC32))
 		return crc32c_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
@@ -60,13 +55,12 @@ u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 			return crc;
 	}
 
 	return crc32c_le_arm64(crc, p, len);
 }
-EXPORT_SYMBOL(crc32c_arch);
 
-u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
+static inline u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!alternative_has_cap_likely(ARM64_HAS_CRC32))
 		return crc32_be_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
@@ -81,19 +75,14 @@ u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
 			return crc;
 	}
 
 	return crc32_be_arm64(crc, p, len);
 }
-EXPORT_SYMBOL(crc32_be_arch);
 
-u32 crc32_optimizations(void)
+static inline u32 crc32_optimizations_arch(void)
 {
 	if (alternative_has_cap_likely(ARM64_HAS_CRC32))
 		return CRC32_LE_OPTIMIZATION |
 		       CRC32_BE_OPTIMIZATION |
 		       CRC32C_OPTIMIZATION;
 	return 0;
 }
-EXPORT_SYMBOL(crc32_optimizations);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("arm64-optimized CRC32 functions");
-- 
2.49.0


