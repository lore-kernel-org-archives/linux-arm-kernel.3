Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD563C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 20:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1em6BVcirZy1DSHermFKAU6Bs3xrGNoy2q6ood2uwE=; b=Ohb8l2vHBXjt4fxCBhhZhwyZ9F
	coezQO74rQFU6CMi8frCZYbDGBFp526nE+sjlsWWkB5lP+KJj/7NqxX8FS7ZKLjcKr6JeZ4aqUr7U
	qXHJ3ORfwZniFLubapU3eOlXjhfW3waD+eqaONPxvLgEtJWYh0gEzmoIQz8EqkMnOcmpRT2zJ7/S1
	BTAlVFuSD6vIARdn7FxFhgkFOp1cnSdM01KyAsjrziTS2AODgoD91uXi8almIBP0NCj0rILZLK0hp
	s/BPjVjMg8RnNDjghOBFGkP2fI+Mz4EDj9LKrpYnFBTaPSOtNTsL4+9FMsBwtj0xhKNpFWA7bZwXx
	FUCW7BPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzxx-000000023E1-1tVm;
	Sat, 07 Jun 2025 20:16:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzpE-000000021VA-3BrM;
	Sat, 07 Jun 2025 20:07:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3305B61F1C;
	Sat,  7 Jun 2025 20:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79452C4CEE4;
	Sat,  7 Jun 2025 20:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749326851;
	bh=hXWT8G8Ba/3m7q18Loqe+RpZLh/rS7DlIty2E8Dsl/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OEO6mVXcE91YyKwFjzGXi6irTVUA1tBomwmunmGf1Du+jIfCHuAy5wElQKbGfewk2
	 cqt+/pVHofIk25s+7+z+vHs/AJUB6wf/SUlcpg28mmvvLHOLI/Nk6RBi4WgacHd+fI
	 8Ry8eQfLXJJXs+JuxPy8DSdiY9kmSJgWdEg7yVYwlzoS3PXBCzEJ0XTyC8wfCuAxf9
	 sReeyz+BcE2Ei41nTT3Qjcca+n2PV3KWkrOmwxJoIbv878RTzGgxk0mjxZHgmCWyPJ
	 xbZ71jtzvDPmm+Ri2cv1Z8To5NdLFIrrZL4k/5XirGm9T0oJLkVy3ZHhGj0PjAaVjb
	 G1L7OksnUwNSQ==
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
Subject: [PATCH v2 07/12] lib/crc/powerpc: migrate powerpc-optimized CRC code into lib/crc/
Date: Sat,  7 Jun 2025 13:04:49 -0700
Message-ID: <20250607200454.73587-8-ebiggers@kernel.org>
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

Move the powerpc-optimized CRC code from arch/powerpc/lib/crc* into its
new location in lib/crc/powerpc/, and wire it up in the new way.  This
new way of organizing the CRC code eliminates the need to artificially
split the code for each CRC variant into separate arch and generic
modules, enabling better inlining and dead code elimination.  For more
details, see "lib/crc: prepare for arch-optimized code in subdirs of
lib/crc/".

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/Kconfig                          |  2 -
 arch/powerpc/lib/Makefile                     |  6 ---
 lib/crc/Kconfig                               |  2 +
 lib/crc/Makefile                              |  2 +
 .../crc/powerpc/crc-t10dif.h                  | 20 ++--------
 .../crc/powerpc}/crc-vpmsum-template.S        |  0
 .../lib/crc32.c => lib/crc/powerpc/crc32.h    | 38 ++++---------------
 .../crc/powerpc}/crc32c-vpmsum_asm.S          |  0
 .../crc/powerpc}/crct10dif-vpmsum_asm.S       |  0
 9 files changed, 14 insertions(+), 56 deletions(-)
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
index 3f534fbfba951..c3f9091ee512e 100644
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
@@ -68,10 +69,11 @@ config CRC32_ARCH
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
index 8adff4ae1ba63..555fd3fb6d197 100644
--- a/lib/crc/Makefile
+++ b/lib/crc/Makefile
@@ -13,18 +13,20 @@ obj-$(CONFIG_CRC_T10DIF) += crc-t10dif.o
 crc-t10dif-y := crc-t10dif-main.o
 ifeq ($(CONFIG_CRC_T10DIF_ARCH),y)
 CFLAGS_crc-t10dif-main.o += -I$(src)/$(SRCARCH)
 crc-t10dif-$(CONFIG_ARM) += arm/crc-t10dif-core.o
 crc-t10dif-$(CONFIG_ARM64) += arm64/crc-t10dif-core.o
+crc-t10dif-$(CONFIG_PPC) += powerpc/crct10dif-vpmsum_asm.o
 endif
 
 obj-$(CONFIG_CRC32) += crc32.o
 crc32-y := crc32-main.o
 ifeq ($(CONFIG_CRC32_ARCH),y)
 CFLAGS_crc32-main.o += -I$(src)/$(SRCARCH)
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
index 0d9befb6e7b83..811cc2e6ed24d 100644
--- a/arch/powerpc/lib/crc32.c
+++ b/lib/crc/powerpc/crc32.h
@@ -1,32 +1,26 @@
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
 
 #define VECTOR_BREAKPOINT	512
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
 
-u32 __crc32c_vpmsum(u32 crc, const u8 *p, size_t len);
+#define crc32_le_arch crc32_le_base /* not implemented on this arch */
+#define crc32_be_arch crc32_be_base /* not implemented on this arch */
 
-u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
-{
-	return crc32_le_base(crc, p, len);
-}
-EXPORT_SYMBOL(crc32_le_arch);
+u32 __crc32c_vpmsum(u32 crc, const u8 *p, size_t len);
 
-u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
+static inline u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 {
 	unsigned int prealign;
 	unsigned int tail;
 
 	if (len < (VECTOR_BREAKPOINT + VMX_ALIGN) ||
@@ -56,38 +50,20 @@ u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
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
-}
-subsys_initcall(crc32_powerpc_init);
-
-static void __exit crc32_powerpc_exit(void)
-{
 }
-module_exit(crc32_powerpc_exit);
 
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


