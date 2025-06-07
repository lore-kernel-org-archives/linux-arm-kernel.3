Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3163AC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 20:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KvDcLLPuK1r2EX4dhm0dxERvANEXVqVTKAqA6SQ/Ak=; b=34jMd0VwPXGxtKUCw+uAH2rDAB
	Of41QRf6YI620F+gtMMWaZHRN+wvPNXwzQdHM2Yo2oCz4+4Tw2p98ycDgHCvJuTTi/aKXV4KiQZDh
	wSk5l2vm7VAkmYF6IfTXoBIqGLwAuHND8zZk4J+VmiWUnyt+yOYErA8v1DMeHFF1e7j4gy5IG2IBn
	pNczMMYuayjidT8MP643E5onAkCwH+Go/2vuJ/qGZNNr/9qE3na+oYEkOL8x+4Oc7Db8A/yTIhH2f
	B707RPGm6+1pPr3R2p/SNEzsVPPiiFBuoLZVtpY577EuzJtbQnpaY4JNPX+8kMvakDGlBWJRHaepC
	boyxGFmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO08r-000000024MM-0cER;
	Sat, 07 Jun 2025 20:27:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzpF-000000021VB-2Itb;
	Sat, 07 Jun 2025 20:07:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80CF24AB9B;
	Sat,  7 Jun 2025 20:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081C2C4CEFE;
	Sat,  7 Jun 2025 20:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749326852;
	bh=UhWtk6TkzpgWbad69ugt2GMpM8wI/AOjLVW/1+GRCZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pTj4CUvSbhajPr41bWro0qvHnYDm1wwoVE3HzOEhFvE9Wg8gJs54AypdZVwebNAc+
	 o7wZ6Rh7vv1xZwENmbDBbEl+75t8pskCZwchC38d1qwpq65rU2eHcmy72uzoZxLy/K
	 u3pUA71njZJv5rj6gFTaoiTE0XxXyBWHhpfGFFPBcVnl1WE7jhM8VphGM9/TB9mTEm
	 P2vg+92ZfulqYd8eoyrQZBgDFysfjDyS0Uzw0TTNvPjuEVdoBdqam0nhCguCyBifTk
	 wAMgc4MWzDADFR3rCo5N4HsYK7IcJ9evOG4lUyf1WV5NgsZl8U9B6EkO0nqsbLhjjq
	 YhCKW0G1L4U5g==
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
Subject: [PATCH v2 08/12] lib/crc/riscv: migrate riscv-optimized CRC code into lib/crc/
Date: Sat,  7 Jun 2025 13:04:50 -0700
Message-ID: <20250607200454.73587-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
References: <20250607200454.73587-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_130733_770205_353E4EA6 
X-CRM114-Status: GOOD (  12.17  )
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

Move the riscv-optimized CRC code from arch/riscv/lib/crc* into its new
location in lib/crc/riscv/, and wire it up in the new way.  This new way
of organizing the CRC code eliminates the need to artificially split the
code for each CRC variant into separate arch and generic modules,
enabling better inlining and dead code elimination.  For more details,
see "lib/crc: prepare for arch-optimized code in subdirs of lib/crc/".

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/Kconfig                              |  3 ---
 arch/riscv/lib/Makefile                         |  6 ------
 lib/crc/Kconfig                                 |  3 +++
 lib/crc/Makefile                                |  3 +++
 .../lib => lib/crc/riscv}/crc-clmul-consts.h    |  0
 .../lib => lib/crc/riscv}/crc-clmul-template.h  |  0
 {arch/riscv/lib => lib/crc/riscv}/crc-clmul.h   |  0
 .../crc-t10dif.c => lib/crc/riscv/crc-t10dif.h  |  8 +-------
 {arch/riscv/lib => lib/crc/riscv}/crc16_msb.c   |  0
 arch/riscv/lib/crc32.c => lib/crc/riscv/crc32.h | 17 ++++-------------
 {arch/riscv/lib => lib/crc/riscv}/crc32_lsb.c   |  0
 {arch/riscv/lib => lib/crc/riscv}/crc32_msb.c   |  0
 arch/riscv/lib/crc64.c => lib/crc/riscv/crc64.h | 11 ++---------
 {arch/riscv/lib => lib/crc/riscv}/crc64_lsb.c   |  0
 {arch/riscv/lib => lib/crc/riscv}/crc64_msb.c   |  0
 15 files changed, 13 insertions(+), 38 deletions(-)
 rename {arch/riscv/lib => lib/crc/riscv}/crc-clmul-consts.h (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc-clmul-template.h (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc-clmul.h (100%)
 rename arch/riscv/lib/crc-t10dif.c => lib/crc/riscv/crc-t10dif.h (62%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc16_msb.c (100%)
 rename arch/riscv/lib/crc32.c => lib/crc/riscv/crc32.h (66%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc32_lsb.c (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc32_msb.c (100%)
 rename arch/riscv/lib/crc64.c => lib/crc/riscv/crc64.h (65%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc64_lsb.c (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc64_msb.c (100%)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 36061f4732b74..d963d8faf2aeb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -22,13 +22,10 @@ config RISCV
 	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM_VMEMMAP
 	select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_BINFMT_FLAT
-	select ARCH_HAS_CRC32 if RISCV_ISA_ZBC
-	select ARCH_HAS_CRC64 if 64BIT && RISCV_ISA_ZBC
-	select ARCH_HAS_CRC_T10DIF if RISCV_ISA_ZBC
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_FAST_MULTIPLIER
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 0baec92d2f55b..a4f4b48ed3a47 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -14,14 +14,8 @@ ifeq ($(CONFIG_MMU), y)
 lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
 endif
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
-obj-$(CONFIG_CRC32_ARCH)	+= crc32-riscv.o
-crc32-riscv-y := crc32.o crc32_msb.o crc32_lsb.o
-obj-$(CONFIG_CRC64_ARCH) += crc64-riscv.o
-crc64-riscv-y := crc64.o crc64_msb.o crc64_lsb.o
-obj-$(CONFIG_CRC_T10DIF_ARCH)	+= crc-t10dif-riscv.o
-crc-t10dif-riscv-y := crc-t10dif.o crc16_msb.o
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
 lib-$(CONFIG_RISCV_ISA_V)	+= riscv_v_helpers.o
diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index c3f9091ee512e..d0c293b1a4182 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -51,10 +51,11 @@ config CRC_T10DIF_ARCH
 	bool
 	depends on CRC_T10DIF && CRC_OPTIMIZATIONS
 	default y if ARM && KERNEL_MODE_NEON
 	default y if ARM64 && KERNEL_MODE_NEON
 	default y if PPC64 && ALTIVEC
+	default y if RISCV && RISCV_ISA_ZBC
 
 config CRC32
 	tristate
 	select BITREVERSE
 	help
@@ -70,10 +71,11 @@ config CRC32_ARCH
 	default y if ARM && KERNEL_MODE_NEON
 	default y if ARM64
 	default y if LOONGARCH
 	default y if MIPS && CPU_MIPSR6
 	default y if PPC64 && ALTIVEC
+	default y if RISCV && RISCV_ISA_ZBC
 
 config CRC64
 	tristate
 	help
 	  The CRC64 library functions.  Select this if your module uses any of
@@ -83,10 +85,11 @@ config ARCH_HAS_CRC64
 	bool
 
 config CRC64_ARCH
 	bool
 	depends on CRC64 && CRC_OPTIMIZATIONS
+	default y if RISCV && RISCV_ISA_ZBC && 64BIT
 
 config CRC_OPTIMIZATIONS
 	bool "Enable optimized CRC implementations" if EXPERT
 	default y
 	help
diff --git a/lib/crc/Makefile b/lib/crc/Makefile
index 555fd3fb6d197..190f889adf556 100644
--- a/lib/crc/Makefile
+++ b/lib/crc/Makefile
@@ -14,25 +14,28 @@ crc-t10dif-y := crc-t10dif-main.o
 ifeq ($(CONFIG_CRC_T10DIF_ARCH),y)
 CFLAGS_crc-t10dif-main.o += -I$(src)/$(SRCARCH)
 crc-t10dif-$(CONFIG_ARM) += arm/crc-t10dif-core.o
 crc-t10dif-$(CONFIG_ARM64) += arm64/crc-t10dif-core.o
 crc-t10dif-$(CONFIG_PPC) += powerpc/crct10dif-vpmsum_asm.o
+crc-t10dif-$(CONFIG_RISCV) += riscv/crc16_msb.o
 endif
 
 obj-$(CONFIG_CRC32) += crc32.o
 crc32-y := crc32-main.o
 ifeq ($(CONFIG_CRC32_ARCH),y)
 CFLAGS_crc32-main.o += -I$(src)/$(SRCARCH)
 crc32-$(CONFIG_ARM) += arm/crc32-core.o
 crc32-$(CONFIG_ARM64) += arm64/crc32-core.o
 crc32-$(CONFIG_PPC) += powerpc/crc32c-vpmsum_asm.o
+crc32-$(CONFIG_RISCV) += riscv/crc32_lsb.o riscv/crc32_msb.o
 endif
 
 obj-$(CONFIG_CRC64) += crc64.o
 crc64-y := crc64-main.o
 ifeq ($(CONFIG_CRC64_ARCH),y)
 CFLAGS_crc64-main.o += -I$(src)/$(SRCARCH)
+crc64-$(CONFIG_RISCV) += riscv/crc64_lsb.o riscv/crc64_msb.o
 endif
 
 obj-y += tests/
 
 hostprogs := gen_crc32table gen_crc64table
diff --git a/arch/riscv/lib/crc-clmul-consts.h b/lib/crc/riscv/crc-clmul-consts.h
similarity index 100%
rename from arch/riscv/lib/crc-clmul-consts.h
rename to lib/crc/riscv/crc-clmul-consts.h
diff --git a/arch/riscv/lib/crc-clmul-template.h b/lib/crc/riscv/crc-clmul-template.h
similarity index 100%
rename from arch/riscv/lib/crc-clmul-template.h
rename to lib/crc/riscv/crc-clmul-template.h
diff --git a/arch/riscv/lib/crc-clmul.h b/lib/crc/riscv/crc-clmul.h
similarity index 100%
rename from arch/riscv/lib/crc-clmul.h
rename to lib/crc/riscv/crc-clmul.h
diff --git a/arch/riscv/lib/crc-t10dif.c b/lib/crc/riscv/crc-t10dif.h
similarity index 62%
rename from arch/riscv/lib/crc-t10dif.c
rename to lib/crc/riscv/crc-t10dif.h
index e6b0051ccd86c..cd6136cbfda1c 100644
--- a/arch/riscv/lib/crc-t10dif.c
+++ b/lib/crc/riscv/crc-t10dif.h
@@ -5,20 +5,14 @@
  * Copyright 2025 Google LLC
  */
 
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
-#include <linux/crc-t10dif.h>
-#include <linux/module.h>
 
 #include "crc-clmul.h"
 
-u16 crc_t10dif_arch(u16 crc, const u8 *p, size_t len)
+static inline u16 crc_t10dif_arch(u16 crc, const u8 *p, size_t len)
 {
 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
 		return crc16_msb_clmul(crc, p, len, &crc16_msb_0x8bb7_consts);
 	return crc_t10dif_generic(crc, p, len);
 }
-EXPORT_SYMBOL(crc_t10dif_arch);
-
-MODULE_DESCRIPTION("RISC-V optimized CRC-T10DIF function");
-MODULE_LICENSE("GPL");
diff --git a/arch/riscv/lib/crc16_msb.c b/lib/crc/riscv/crc16_msb.c
similarity index 100%
rename from arch/riscv/lib/crc16_msb.c
rename to lib/crc/riscv/crc16_msb.c
diff --git a/arch/riscv/lib/crc32.c b/lib/crc/riscv/crc32.h
similarity index 66%
rename from arch/riscv/lib/crc32.c
rename to lib/crc/riscv/crc32.h
index a3188b7d9c403..3ec6eee98afa8 100644
--- a/arch/riscv/lib/crc32.c
+++ b/lib/crc/riscv/crc32.h
@@ -5,49 +5,40 @@
  * Copyright 2025 Google LLC
  */
 
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
-#include <linux/crc32.h>
-#include <linux/module.h>
 
 #include "crc-clmul.h"
 
-u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
+static inline u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
 		return crc32_lsb_clmul(crc, p, len,
 				       &crc32_lsb_0xedb88320_consts);
 	return crc32_le_base(crc, p, len);
 }
-EXPORT_SYMBOL(crc32_le_arch);
 
-u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
+static inline u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
 		return crc32_msb_clmul(crc, p, len,
 				       &crc32_msb_0x04c11db7_consts);
 	return crc32_be_base(crc, p, len);
 }
-EXPORT_SYMBOL(crc32_be_arch);
 
-u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
+static inline u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
 		return crc32_lsb_clmul(crc, p, len,
 				       &crc32_lsb_0x82f63b78_consts);
 	return crc32c_base(crc, p, len);
 }
-EXPORT_SYMBOL(crc32c_arch);
 
-u32 crc32_optimizations(void)
+static inline u32 crc32_optimizations_arch(void)
 {
 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
 		return CRC32_LE_OPTIMIZATION |
 		       CRC32_BE_OPTIMIZATION |
 		       CRC32C_OPTIMIZATION;
 	return 0;
 }
-EXPORT_SYMBOL(crc32_optimizations);
-
-MODULE_DESCRIPTION("RISC-V optimized CRC32 functions");
-MODULE_LICENSE("GPL");
diff --git a/arch/riscv/lib/crc32_lsb.c b/lib/crc/riscv/crc32_lsb.c
similarity index 100%
rename from arch/riscv/lib/crc32_lsb.c
rename to lib/crc/riscv/crc32_lsb.c
diff --git a/arch/riscv/lib/crc32_msb.c b/lib/crc/riscv/crc32_msb.c
similarity index 100%
rename from arch/riscv/lib/crc32_msb.c
rename to lib/crc/riscv/crc32_msb.c
diff --git a/arch/riscv/lib/crc64.c b/lib/crc/riscv/crc64.h
similarity index 65%
rename from arch/riscv/lib/crc64.c
rename to lib/crc/riscv/crc64.h
index f0015a27836a4..a1b7873fde579 100644
--- a/arch/riscv/lib/crc64.c
+++ b/lib/crc/riscv/crc64.h
@@ -5,30 +5,23 @@
  * Copyright 2025 Google LLC
  */
 
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
-#include <linux/crc64.h>
-#include <linux/module.h>
 
 #include "crc-clmul.h"
 
-u64 crc64_be_arch(u64 crc, const u8 *p, size_t len)
+static inline u64 crc64_be_arch(u64 crc, const u8 *p, size_t len)
 {
 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
 		return crc64_msb_clmul(crc, p, len,
 				       &crc64_msb_0x42f0e1eba9ea3693_consts);
 	return crc64_be_generic(crc, p, len);
 }
-EXPORT_SYMBOL(crc64_be_arch);
 
-u64 crc64_nvme_arch(u64 crc, const u8 *p, size_t len)
+static inline u64 crc64_nvme_arch(u64 crc, const u8 *p, size_t len)
 {
 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
 		return crc64_lsb_clmul(crc, p, len,
 				       &crc64_lsb_0x9a6c9329ac4bc9b5_consts);
 	return crc64_nvme_generic(crc, p, len);
 }
-EXPORT_SYMBOL(crc64_nvme_arch);
-
-MODULE_DESCRIPTION("RISC-V optimized CRC64 functions");
-MODULE_LICENSE("GPL");
diff --git a/arch/riscv/lib/crc64_lsb.c b/lib/crc/riscv/crc64_lsb.c
similarity index 100%
rename from arch/riscv/lib/crc64_lsb.c
rename to lib/crc/riscv/crc64_lsb.c
diff --git a/arch/riscv/lib/crc64_msb.c b/lib/crc/riscv/crc64_msb.c
similarity index 100%
rename from arch/riscv/lib/crc64_msb.c
rename to lib/crc/riscv/crc64_msb.c
-- 
2.49.0


