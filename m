Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99018C5B555
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Jun 2025 23:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KL5UzL2ZQ7szfAJe6QAjM2o69rUVoTqazgaXEd38KBo=; b=q4q6SEhPlWmk/6lyjuMwDtlHW/
	pq/GS4jrxytznIUSARrVJU5zA4LLYL+NA2osPApxNImOchO6rbYR2quOa0CdypW6f/9f82uQZA9DA
	scdxXghjbQx1hoAeLvbygnpJ+TD5RTFps7G2AHS17uRvfCujQDa9Dz/skQEJMruSkpu2jpOdk1PZR
	wRcssFrdd07U7DF5ZpW4mR5z8IKyCUv29LzTi0WzAoAR1GUuiMIFZ8orHnrpNDEruCoOCjVIVKySF
	nODdIX9xy8VxLuVbmQwj400xpggWMnJx1TlQ6P8lXAIpLDdwYAQ2BUSvp7fKcKp61Cj1d0A5Ua2UW
	XoyoWrhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLrh2-0000000639p-0dgA;
	Sun, 01 Jun 2025 23:02:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLrRG-000000060zn-3kuU;
	Sun, 01 Jun 2025 22:45:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5299A60EDF;
	Sun,  1 Jun 2025 22:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9758AC4CEF2;
	Sun,  1 Jun 2025 22:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748817958;
	bh=SXwip4eijDXULIBpid24Mjyf9ZlXG+23/x0n84S5DAk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SkcxPLiceM33E7E96La+Jj3NmG09ByoGJwAyDmGTHuuoMFKvExCxns2BraB9NC4px
	 edHT+i+zdVvE0NC6Kr+pxdYF/3AKCj71SQb0LFyU2SLf9Fmgn3MsDYx2+IfPzo9lJN
	 q+lXZVn5BZKTFwywGqXTm1Q5iWMP+MNAViCdl+DD0DngiCHV6W85iA7D9XT4B0bIwf
	 OatYgBTRIzW4ynuA09ap11PYHKXQ5ANged2/+MJzxs6ywXaAsmBdOivRxVBHtERHI/
	 aif6vRW8+rXKwFkn70nVDS76Q+7gxsvTiNEPMFoFuRydXmrbL2BTE16BcwhR7QAhiq
	 +aquta5JE/QNA==
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
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 09/13] lib/crc/powerpc: migrate powerpc-optimized CRC code into lib/crc/
Date: Sun,  1 Jun 2025 15:44:37 -0700
Message-ID: <20250601224441.778374-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601224441.778374-1-ebiggers@kernel.org>
References: <20250601224441.778374-1-ebiggers@kernel.org>
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

Move the powerpc-optimized CRC code from arch/powerpc/lib/crc* into its
new location in lib/crc/powerpc/, and wire it up in the new way.  For a
detailed explanation of why this change is being made, see the commit
that introduced the new way of integrating arch-specific code into
lib/crc/.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/Kconfig                          |  2 --
 arch/powerpc/lib/Makefile                     |  6 ----
 lib/crc/Kconfig                               |  2 ++
 lib/crc/Makefile                              |  2 ++
 .../crc/powerpc/crc-t10dif.h                  | 20 ++---------
 .../crc/powerpc}/crc-vpmsum-template.S        |  0
 .../lib/crc32.c => lib/crc/powerpc/crc32.h    | 36 +++----------------
 .../crc/powerpc}/crc32c-vpmsum_asm.S          |  0
 .../crc/powerpc}/crct10dif-vpmsum_asm.S       |  0
 9 files changed, 12 insertions(+), 56 deletions(-)
 rename arch/powerpc/lib/crc-t10dif.c => lib/crc/powerpc/crc-t10dif.h (75%)
 rename {arch/powerpc/lib => lib/crc/powerpc}/crc-vpmsum-template.S (100%)
 rename arch/powerpc/lib/crc32.c => lib/crc/powerpc/crc32.h (64%)
 rename {arch/powerpc/lib => lib/crc/powerpc}/crc32c-vpmsum_asm.S (100%)
 rename {arch/powerpc/lib => lib/crc/powerpc}/crct10dif-vpmsum_asm.S (100%)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c3e0cc83f1205..45b4fa7b9b02f 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -125,12 +125,10 @@ config PPC
 	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
 	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_HAS_COPY_MC			if PPC64
-	select ARCH_HAS_CRC32			if PPC64 && ALTIVEC
-	select ARCH_HAS_CRC_T10DIF		if PPC64 && ALTIVEC
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX		if STRICT_KERNEL_RWX
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 481f968e42c7b..59de2e2232df6 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -78,12 +78,6 @@ obj-$(CONFIG_FTR_FIXUP_SELFTEST) += feature-fixups-test.o
 obj-$(CONFIG_ALTIVEC)	+= xor_vmx.o xor_vmx_glue.o
 CFLAGS_xor_vmx.o += -mhard-float -maltivec $(call cc-option,-mabi=altivec)
 # Enable <altivec.h>
 CFLAGS_xor_vmx.o += -isystem $(shell $(CC) -print-file-name=include)
 
-obj-$(CONFIG_CRC32_ARCH) += crc32-powerpc.o
-crc32-powerpc-y := crc32.o crc32c-vpmsum_asm.o
-
-obj-$(CONFIG_CRC_T10DIF_ARCH) += crc-t10dif-powerpc.o
-crc-t10dif-powerpc-y := crc-t10dif.o crct10dif-vpmsum_asm.o
-
 obj-$(CONFIG_PPC64) += $(obj64-y)
diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index 2d99aab4f838d..06611610e478f 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -50,10 +50,11 @@ config ARCH_HAS_CRC_T10DIF
 config CRC_T10DIF_ARCH
 	bool
 	depends on CRC_T10DIF && CRC_OPTIMIZATIONS
 	default y if ARM && KERNEL_MODE_NEON
 	default y if ARM64 && KERNEL_MODE_NEON
+	default y if PPC64 && ALTIVEC
 
 config CRC32
 	tristate
 	select BITREVERSE
 	help
@@ -65,10 +66,11 @@ config CRC32_ARCH
 	depends on CRC32 && CRC_OPTIMIZATIONS
 	default y if ARM && KERNEL_MODE_NEON
 	default y if ARM64
 	default y if LOONGARCH
 	default y if MIPS && CPU_MIPSR6
+	default y if PPC64 && ALTIVEC
 
 config CRC64
 	tristate
 	help
 	  The CRC64 library functions.  Select this if your module uses any of
diff --git a/lib/crc/Makefile b/lib/crc/Makefile
index 822d18b57b432..f9109b71c1264 100644
--- a/lib/crc/Makefile
+++ b/lib/crc/Makefile
@@ -14,17 +14,19 @@ obj-$(CONFIG_CRC_ITU_T) += crc-itu-t.o
 obj-$(CONFIG_CRC_T10DIF) += crc-t10dif.o
 crc-t10dif-y := crc-t10dif-main.o
 ifeq ($(CONFIG_CRC_T10DIF_ARCH),y)
 crc-t10dif-$(CONFIG_ARM) += arm/crc-t10dif-core.o
 crc-t10dif-$(CONFIG_ARM64) += arm64/crc-t10dif-core.o
+crc-t10dif-$(CONFIG_PPC) += powerpc/crct10dif-vpmsum_asm.o
 endif
 
 obj-$(CONFIG_CRC32) += crc32.o
 crc32-y := crc32-main.o
 ifeq ($(CONFIG_CRC32_ARCH),y)
 crc32-$(CONFIG_ARM) += arm/crc32-core.o
 crc32-$(CONFIG_ARM64) += arm64/crc32-core.o
+crc32-$(CONFIG_PPC) += powerpc/crc32c-vpmsum_asm.o
 endif
 
 obj-$(CONFIG_CRC64) += crc64.o
 crc64-y := crc64-main.o
 ifeq ($(CONFIG_CRC64_ARCH),y)
diff --git a/arch/powerpc/lib/crc-t10dif.c b/lib/crc/powerpc/crc-t10dif.h
similarity index 75%
rename from arch/powerpc/lib/crc-t10dif.c
rename to lib/crc/powerpc/crc-t10dif.h
index be23ded3a9df6..59e16804a6eae 100644
--- a/arch/powerpc/lib/crc-t10dif.c
+++ b/lib/crc/powerpc/crc-t10dif.h
@@ -7,14 +7,11 @@
  */
 
 #include <asm/switch_to.h>
 #include <crypto/internal/simd.h>
 #include <linux/cpufeature.h>
-#include <linux/crc-t10dif.h>
 #include <linux/jump_label.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
 #include <linux/preempt.h>
 #include <linux/uaccess.h>
 
 #define VMX_ALIGN		16
 #define VMX_ALIGN_MASK		(VMX_ALIGN-1)
@@ -23,11 +20,11 @@
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
 
 u32 __crct10dif_vpmsum(u32 crc, unsigned char const *p, size_t len);
 
-u16 crc_t10dif_arch(u16 crci, const u8 *p, size_t len)
+static inline u16 crc_t10dif_arch(u16 crci, const u8 *p, size_t len)
 {
 	unsigned int prealign;
 	unsigned int tail;
 	u32 crc = crci;
 
@@ -60,24 +57,13 @@ u16 crc_t10dif_arch(u16 crci, const u8 *p, size_t len)
 		crc = crc_t10dif_generic(crc, p, tail);
 	}
 
 	return crc & 0xffff;
 }
-EXPORT_SYMBOL(crc_t10dif_arch);
 
-static int __init crc_t10dif_powerpc_init(void)
+#define crc_t10dif_mod_init_arch crc_t10dif_mod_init_arch
+static inline void crc_t10dif_mod_init_arch(void)
 {
 	if (cpu_has_feature(CPU_FTR_ARCH_207S) &&
 	    (cur_cpu_spec->cpu_user_features2 & PPC_FEATURE2_VEC_CRYPTO))
 		static_branch_enable(&have_vec_crypto);
-	return 0;
 }
-subsys_initcall(crc_t10dif_powerpc_init);
-
-static void __exit crc_t10dif_powerpc_exit(void)
-{
-}
-module_exit(crc_t10dif_powerpc_exit);
-
-MODULE_AUTHOR("Daniel Axtens <dja@axtens.net>");
-MODULE_DESCRIPTION("CRCT10DIF using vector polynomial multiply-sum instructions");
-MODULE_LICENSE("GPL");
diff --git a/arch/powerpc/lib/crc-vpmsum-template.S b/lib/crc/powerpc/crc-vpmsum-template.S
similarity index 100%
rename from arch/powerpc/lib/crc-vpmsum-template.S
rename to lib/crc/powerpc/crc-vpmsum-template.S
diff --git a/arch/powerpc/lib/crc32.c b/lib/crc/powerpc/crc32.h
similarity index 64%
rename from arch/powerpc/lib/crc32.c
rename to lib/crc/powerpc/crc32.h
index 0d9befb6e7b83..0dceb04d0ee94 100644
--- a/arch/powerpc/lib/crc32.c
+++ b/lib/crc/powerpc/crc32.h
@@ -1,13 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <asm/switch_to.h>
 #include <crypto/internal/simd.h>
 #include <linux/cpufeature.h>
-#include <linux/crc32.h>
 #include <linux/jump_label.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
 #include <linux/preempt.h>
 #include <linux/uaccess.h>
 
 #define VMX_ALIGN		16
 #define VMX_ALIGN_MASK		(VMX_ALIGN-1)
@@ -16,17 +13,12 @@
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
 
 u32 __crc32c_vpmsum(u32 crc, const u8 *p, size_t len);
 
-u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
-{
-	return crc32_le_base(crc, p, len);
-}
-EXPORT_SYMBOL(crc32_le_arch);
-
-u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
+#define crc32c_arch crc32c_arch
+static inline u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 {
 	unsigned int prealign;
 	unsigned int tail;
 
 	if (len < (VECTOR_BREAKPOINT + VMX_ALIGN) ||
@@ -56,38 +48,20 @@ u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 		crc = crc32c_base(crc, p, tail);
 	}
 
 	return crc;
 }
-EXPORT_SYMBOL(crc32c_arch);
-
-u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
-{
-	return crc32_be_base(crc, p, len);
-}
-EXPORT_SYMBOL(crc32_be_arch);
 
-static int __init crc32_powerpc_init(void)
+#define crc32_mod_init_arch crc32_mod_init_arch
+static inline void crc32_mod_init_arch(void)
 {
 	if (cpu_has_feature(CPU_FTR_ARCH_207S) &&
 	    (cur_cpu_spec->cpu_user_features2 & PPC_FEATURE2_VEC_CRYPTO))
 		static_branch_enable(&have_vec_crypto);
-	return 0;
 }
-subsys_initcall(crc32_powerpc_init);
 
-static void __exit crc32_powerpc_exit(void)
-{
-}
-module_exit(crc32_powerpc_exit);
-
-u32 crc32_optimizations(void)
+static inline u32 crc32_optimizations_arch(void)
 {
 	if (static_key_enabled(&have_vec_crypto))
 		return CRC32C_OPTIMIZATION;
 	return 0;
 }
-EXPORT_SYMBOL(crc32_optimizations);
-
-MODULE_AUTHOR("Anton Blanchard <anton@samba.org>");
-MODULE_DESCRIPTION("CRC32C using vector polynomial multiply-sum instructions");
-MODULE_LICENSE("GPL");
diff --git a/arch/powerpc/lib/crc32c-vpmsum_asm.S b/lib/crc/powerpc/crc32c-vpmsum_asm.S
similarity index 100%
rename from arch/powerpc/lib/crc32c-vpmsum_asm.S
rename to lib/crc/powerpc/crc32c-vpmsum_asm.S
diff --git a/arch/powerpc/lib/crct10dif-vpmsum_asm.S b/lib/crc/powerpc/crct10dif-vpmsum_asm.S
similarity index 100%
rename from arch/powerpc/lib/crct10dif-vpmsum_asm.S
rename to lib/crc/powerpc/crct10dif-vpmsum_asm.S
-- 
2.49.0


