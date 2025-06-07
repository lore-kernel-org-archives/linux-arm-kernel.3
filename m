Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291D9C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 20:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYbBHOFxQLhcQdIPU4Nym7UQAFg00c8t6GKZO10aBM0=; b=dUTwX/Nk0C4Mfbfp2ah/TMvAUO
	oL6fGfslc0gEeL/bgkvCYrWQ64DKwcT1FOScNN7jIUiugjAMVThZ50PVyWWYtNlFMQ7vUiCpZbGzF
	/ty7xHfCFgc0DjgVDg+UP0dvRpflrEwGTf74idTiZ2vwgvcu4EsNtZGX/3R+FW6Y+YOthO62VD+S2
	HSZLG6naQrfAu0/8RQBHZzFQXaJTpHCEjJpBOFNds0sRX0ue7EV6wavUrOnrMKLKzIeC3EgCuwNqF
	+a59G9lW9Oh2MC11Dy7bPQLdfbTOs+1oOUXTqerNlrJISCLT/oLT7sDtrbwl4KBNiIJcaPkD+hdIE
	WsgKY7ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzta-000000022mO-2yYG;
	Sat, 07 Jun 2025 20:12:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzpC-000000021UX-3QqS;
	Sat, 07 Jun 2025 20:07:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F006E6115D;
	Sat,  7 Jun 2025 20:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678B4C4CEF6;
	Sat,  7 Jun 2025 20:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749326849;
	bh=sDKX0MxyKMIL+HZ/mXu69f6T4IOkE11+BdTbwDYdB/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nTfXrhqpFlnkZTgQrji+Og+HrxqlZiXD94N/b4vQ4dcwfjOCpaHzuq+5nzA7kNFMw
	 OEkYSRG2dd58HHKjnA0EraCPfAMqk20IUxbiQ7x1g/INvmbiLTdkEDxU1m+ah+5Qto
	 egViG3MIi9m5LmMoD4YIIE3SdjKdp+ub+HsGVVbNB/B31RASYhvKw77kJYT7ef2cdN
	 yPF5nOTYwYDW6kfgpV+XLEM55tulrzlsOCOYqF/2lxDtF54k3ooNGvsw53az5iuumM
	 zQ0Ac4aUcCCpjyrpej4Rrb7nWEjEdvHdysCxxHsXX5R0pnjiJ+d2cMkS9WrvlmTlz5
	 tQ7NM6IqVseJA==
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
Subject: [PATCH v2 03/12] lib/crc/arm: migrate arm-optimized CRC code into lib/crc/
Date: Sat,  7 Jun 2025 13:04:45 -0700
Message-ID: <20250607200454.73587-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
References: <20250607200454.73587-1-ebiggers@kernel.org>
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

Move the arm-optimized CRC code from arch/arm/lib/crc* into its new
location in lib/crc/arm/, and wire it up in the new way.  This new way
of organizing the CRC code eliminates the need to artificially split the
code for each CRC variant into separate arch and generic modules,
enabling better inlining and dead code elimination.  For more details,
see "lib/crc: prepare for arch-optimized code in subdirs of lib/crc/".

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm/Kconfig                              |  2 -
 arch/arm/lib/Makefile                         |  6 ---
 lib/crc/Kconfig                               |  2 +
 lib/crc/Makefile                              |  2 +
 .../arm/lib => lib/crc/arm}/crc-t10dif-core.S |  0
 .../crc-t10dif.c => lib/crc/arm/crc-t10dif.h  | 23 ++---------
 {arch/arm/lib => lib/crc/arm}/crc32-core.S    |  0
 arch/arm/lib/crc32.c => lib/crc/arm/crc32.h   | 38 ++++---------------
 8 files changed, 15 insertions(+), 58 deletions(-)
 rename {arch/arm/lib => lib/crc/arm}/crc-t10dif-core.S (100%)
 rename arch/arm/lib/crc-t10dif.c => lib/crc/arm/crc-t10dif.h (70%)
 rename {arch/arm/lib => lib/crc/arm}/crc32-core.S (100%)
 rename arch/arm/lib/crc32.c => lib/crc/arm/crc32.h (69%)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 3072731fe09c5..c531b49aa98ea 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -6,12 +6,10 @@ config ARM
 	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE if HAVE_KRETPROBES && FRAME_POINTER && !ARM_UNWIND
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_CACHE_LINE_SIZE if OF
 	select ARCH_HAS_CPU_CACHE_ALIASING
 	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
-	select ARCH_HAS_CRC32 if KERNEL_MODE_NEON
-	select ARCH_HAS_CRC_T10DIF if KERNEL_MODE_NEON
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DMA_ALLOC if MMU
 	select ARCH_HAS_DMA_OPS
 	select ARCH_HAS_DMA_WRITE_COMBINE if !ARM_DMA_MEM_BUFFERABLE
diff --git a/arch/arm/lib/Makefile b/arch/arm/lib/Makefile
index 91ea0e29107af..d1b9ea2023648 100644
--- a/arch/arm/lib/Makefile
+++ b/arch/arm/lib/Makefile
@@ -45,11 +45,5 @@ ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
   CFLAGS_xor-neon.o		+= $(CC_FLAGS_FPU)
   obj-$(CONFIG_XOR_BLOCKS)	+= xor-neon.o
 endif
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
-
-obj-$(CONFIG_CRC32_ARCH) += crc32-arm.o
-crc32-arm-y := crc32.o crc32-core.o
-
-obj-$(CONFIG_CRC_T10DIF_ARCH) += crc-t10dif-arm.o
-crc-t10dif-arm-y := crc-t10dif.o crc-t10dif-core.o
diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index e049f01a4d2c8..edd1b99098003 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -48,10 +48,11 @@ config ARCH_HAS_CRC_T10DIF
 	bool
 
 config CRC_T10DIF_ARCH
 	bool
 	depends on CRC_T10DIF && CRC_OPTIMIZATIONS
+	default y if ARM && KERNEL_MODE_NEON
 
 config CRC32
 	tristate
 	select BITREVERSE
 	help
@@ -62,10 +63,11 @@ config ARCH_HAS_CRC32
 	bool
 
 config CRC32_ARCH
 	bool
 	depends on CRC32 && CRC_OPTIMIZATIONS
+	default y if ARM && KERNEL_MODE_NEON
 
 config CRC64
 	tristate
 	help
 	  The CRC64 library functions.  Select this if your module uses any of
diff --git a/lib/crc/Makefile b/lib/crc/Makefile
index 926edc3b035f6..c72d351be6cb8 100644
--- a/lib/crc/Makefile
+++ b/lib/crc/Makefile
@@ -11,16 +11,18 @@ obj-$(CONFIG_CRC_ITU_T) += crc-itu-t.o
 
 obj-$(CONFIG_CRC_T10DIF) += crc-t10dif.o
 crc-t10dif-y := crc-t10dif-main.o
 ifeq ($(CONFIG_CRC_T10DIF_ARCH),y)
 CFLAGS_crc-t10dif-main.o += -I$(src)/$(SRCARCH)
+crc-t10dif-$(CONFIG_ARM) += arm/crc-t10dif-core.o
 endif
 
 obj-$(CONFIG_CRC32) += crc32.o
 crc32-y := crc32-main.o
 ifeq ($(CONFIG_CRC32_ARCH),y)
 CFLAGS_crc32-main.o += -I$(src)/$(SRCARCH)
+crc32-$(CONFIG_ARM) += arm/crc32-core.o
 endif
 
 obj-$(CONFIG_CRC64) += crc64.o
 crc64-y := crc64-main.o
 ifeq ($(CONFIG_CRC64_ARCH),y)
diff --git a/arch/arm/lib/crc-t10dif-core.S b/lib/crc/arm/crc-t10dif-core.S
similarity index 100%
rename from arch/arm/lib/crc-t10dif-core.S
rename to lib/crc/arm/crc-t10dif-core.S
diff --git a/arch/arm/lib/crc-t10dif.c b/lib/crc/arm/crc-t10dif.h
similarity index 70%
rename from arch/arm/lib/crc-t10dif.c
rename to lib/crc/arm/crc-t10dif.h
index 1093f8ec13b0b..2edf7e9681d05 100644
--- a/arch/arm/lib/crc-t10dif.c
+++ b/lib/crc/arm/crc-t10dif.h
@@ -3,16 +3,10 @@
  * Accelerated CRC-T10DIF using ARM NEON and Crypto Extensions instructions
  *
  * Copyright (C) 2016 Linaro Ltd <ard.biesheuvel@linaro.org>
  */
 
-#include <linux/crc-t10dif.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/string.h>
-
 #include <crypto/internal/simd.h>
 
 #include <asm/neon.h>
 #include <asm/simd.h>
 
@@ -23,11 +17,11 @@ static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
 
 asmlinkage u16 crc_t10dif_pmull64(u16 init_crc, const u8 *buf, size_t len);
 asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
 				  u8 out[16]);
 
-u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
+static inline u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
 {
 	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE) {
 		if (static_branch_likely(&have_pmull)) {
 			if (crypto_simd_usable()) {
 				kernel_neon_begin();
@@ -47,26 +41,15 @@ u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
 			return crc_t10dif_generic(0, buf, sizeof(buf));
 		}
 	}
 	return crc_t10dif_generic(crc, data, length);
 }
-EXPORT_SYMBOL(crc_t10dif_arch);
 
-static int __init crc_t10dif_arm_init(void)
+#define crc_t10dif_mod_init_arch crc_t10dif_mod_init_arch
+static inline void crc_t10dif_mod_init_arch(void)
 {
 	if (elf_hwcap & HWCAP_NEON) {
 		static_branch_enable(&have_neon);
 		if (elf_hwcap2 & HWCAP2_PMULL)
 			static_branch_enable(&have_pmull);
 	}
-	return 0;
 }
-subsys_initcall(crc_t10dif_arm_init);
-
-static void __exit crc_t10dif_arm_exit(void)
-{
-}
-module_exit(crc_t10dif_arm_exit);
-
-MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
-MODULE_DESCRIPTION("Accelerated CRC-T10DIF using ARM NEON and Crypto Extensions");
-MODULE_LICENSE("GPL v2");
diff --git a/arch/arm/lib/crc32-core.S b/lib/crc/arm/crc32-core.S
similarity index 100%
rename from arch/arm/lib/crc32-core.S
rename to lib/crc/arm/crc32-core.S
diff --git a/arch/arm/lib/crc32.c b/lib/crc/arm/crc32.h
similarity index 69%
rename from arch/arm/lib/crc32.c
rename to lib/crc/arm/crc32.h
index f2bef8849c7c3..018007e162a2b 100644
--- a/arch/arm/lib/crc32.c
+++ b/lib/crc/arm/crc32.h
@@ -4,15 +4,10 @@
  *
  * Copyright (C) 2016 Linaro Ltd <ard.biesheuvel@linaro.org>
  */
 
 #include <linux/cpufeature.h>
-#include <linux/crc32.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/string.h>
 
 #include <crypto/internal/simd.h>
 
 #include <asm/hwcap.h>
 #include <asm/neon.h>
@@ -27,18 +22,18 @@ asmlinkage u32 crc32_pmull_le(const u8 buf[], u32 len, u32 init_crc);
 asmlinkage u32 crc32_armv8_le(u32 init_crc, const u8 buf[], u32 len);
 
 asmlinkage u32 crc32c_pmull_le(const u8 buf[], u32 len, u32 init_crc);
 asmlinkage u32 crc32c_armv8_le(u32 init_crc, const u8 buf[], u32 len);
 
-static u32 crc32_le_scalar(u32 crc, const u8 *p, size_t len)
+static inline u32 crc32_le_scalar(u32 crc, const u8 *p, size_t len)
 {
 	if (static_branch_likely(&have_crc32))
 		return crc32_armv8_le(crc, p, len);
 	return crc32_le_base(crc, p, len);
 }
 
-u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
+static inline u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (len >= PMULL_MIN_LEN + 15 &&
 	    static_branch_likely(&have_pmull) && crypto_simd_usable()) {
 		size_t n = -(uintptr_t)p & 15;
 
@@ -55,20 +50,19 @@ u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 		p += n;
 		len -= n;
 	}
 	return crc32_le_scalar(crc, p, len);
 }
-EXPORT_SYMBOL(crc32_le_arch);
 
-static u32 crc32c_scalar(u32 crc, const u8 *p, size_t len)
+static inline u32 crc32c_scalar(u32 crc, const u8 *p, size_t len)
 {
 	if (static_branch_likely(&have_crc32))
 		return crc32c_armv8_le(crc, p, len);
 	return crc32c_base(crc, p, len);
 }
 
-u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
+static inline u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (len >= PMULL_MIN_LEN + 15 &&
 	    static_branch_likely(&have_pmull) && crypto_simd_usable()) {
 		size_t n = -(uintptr_t)p & 15;
 
@@ -85,39 +79,23 @@ u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 		p += n;
 		len -= n;
 	}
 	return crc32c_scalar(crc, p, len);
 }
-EXPORT_SYMBOL(crc32c_arch);
 
-u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
-{
-	return crc32_be_base(crc, p, len);
-}
-EXPORT_SYMBOL(crc32_be_arch);
+#define crc32_be_arch crc32_be_base /* not implemented on this arch */
 
-static int __init crc32_arm_init(void)
+#define crc32_mod_init_arch crc32_mod_init_arch
+static inline void crc32_mod_init_arch(void)
 {
 	if (elf_hwcap2 & HWCAP2_CRC32)
 		static_branch_enable(&have_crc32);
 	if (elf_hwcap2 & HWCAP2_PMULL)
 		static_branch_enable(&have_pmull);
-	return 0;
 }
-subsys_initcall(crc32_arm_init);
 
-static void __exit crc32_arm_exit(void)
-{
-}
-module_exit(crc32_arm_exit);
-
-u32 crc32_optimizations(void)
+static inline u32 crc32_optimizations_arch(void)
 {
 	if (elf_hwcap2 & (HWCAP2_CRC32 | HWCAP2_PMULL))
 		return CRC32_LE_OPTIMIZATION | CRC32C_OPTIMIZATION;
 	return 0;
 }
-EXPORT_SYMBOL(crc32_optimizations);
-
-MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
-MODULE_DESCRIPTION("Accelerated CRC32(C) using ARM CRC, NEON and Crypto Extensions");
-MODULE_LICENSE("GPL v2");
-- 
2.49.0


