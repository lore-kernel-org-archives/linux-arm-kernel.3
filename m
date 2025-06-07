Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DB1C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 20:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvPDCJlAlkBU1j14qLER2YG530Z5A8spiezP/JewZVo=; b=PxXq6pNEJy6qFYx2EMplwBCLqV
	6a6UIbaf114I7APhqrn5vxW9gM4WepZypBmz7C9lYqFj8dEjcCHZKD7RymXaKOhzrK4PKRhBQuDP8
	7O1t5cmYSReYr82f7DxjTbyJVVxjxI//5piQcZiYJa4wpR7FJqpN/nvF2sBaRXQ4adRQlr9dwNziT
	86UxmEl3oRw5qmv/oYDt+G5iRZ062jwJAuGYGe3cMebNUxHlNKTV30/81hhcTkLhNhVgcdr+AoY2i
	//psKimXgG4/tZvyDekL5XJT+VUN3WjqccoamOqSZEN+Ed65u4lyMZWfhG9ebZ39nP03CKjCDnA0X
	B/yUWkoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO0B2-000000024ZH-2MGt;
	Sat, 07 Jun 2025 20:30:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzpF-000000021VO-2ygO;
	Sat, 07 Jun 2025 20:07:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A4614ABEE;
	Sat,  7 Jun 2025 20:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A05C4AF09;
	Sat,  7 Jun 2025 20:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749326852;
	bh=167zq5zi7wdD08Zx3i/mgZI+CHCjTsXkRCx5v5LY1DE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cK97FH/u1ZexrL4xPo108kbPSyiyqv5D8XHaqv+mjS2WIeFt3z02kKZQoPSDq/X9G
	 neVztBJCZmrBoT35lHT7/4k1mw3IU50u8eK2I8rCFsAO3s5eNyH+UgVyYXahnJYGwP
	 TiPrvKloWZbvdMpC4iYVrFLfzw9UqgZm3B60tJ2p04gkZ1fhmhjAqppFmzZj0+0I9k
	 fZrdwvK3bggFG+eTMFGHLb/guQtWXCbVKytVYD912FXa4Gfgsp4iP8TdQzvl2cNx9/
	 p7CAFgRZSOtmmJ1+fxlmzhOAzyN+XY2FyOZvJtvXu7z3ScuzRfpONDpwE/CuTrEy5Y
	 iwR5ANOjA/+Mw==
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
Subject: [PATCH v2 09/12] lib/crc/s390: migrate s390-optimized CRC code into lib/crc/
Date: Sat,  7 Jun 2025 13:04:51 -0700
Message-ID: <20250607200454.73587-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
References: <20250607200454.73587-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_130733_909553_3823E251 
X-CRM114-Status: GOOD (  14.23  )
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

Move the s390-optimized CRC code from arch/s390/lib/crc* into its new
location in lib/crc/s390/, and wire it up in the new way.  This new way
of organizing the CRC code eliminates the need to artificially split the
code for each CRC variant into separate arch and generic modules,
enabling better inlining and dead code elimination.  For more details,
see "lib/crc: prepare for arch-optimized code in subdirs of lib/crc/".

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/s390/Kconfig                             |  1 -
 arch/s390/lib/Makefile                        |  3 ---
 lib/crc/Kconfig                               |  1 +
 lib/crc/Makefile                              |  1 +
 {arch/s390/lib => lib/crc/s390}/crc32-vx.h    |  0
 arch/s390/lib/crc32.c => lib/crc/s390/crc32.h | 16 +++-------------
 {arch/s390/lib => lib/crc/s390}/crc32be-vx.c  |  0
 {arch/s390/lib => lib/crc/s390}/crc32le-vx.c  |  0
 8 files changed, 5 insertions(+), 17 deletions(-)
 rename {arch/s390/lib => lib/crc/s390}/crc32-vx.h (100%)
 rename arch/s390/lib/crc32.c => lib/crc/s390/crc32.h (81%)
 rename {arch/s390/lib => lib/crc/s390}/crc32be-vx.c (100%)
 rename {arch/s390/lib => lib/crc/s390}/crc32le-vx.c (100%)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 0c16dc443e2f6..22b90f6aa1a09 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -73,11 +73,10 @@ config S390
 	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
 	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_HAS_CPU_FINALIZE_INIT
-	select ARCH_HAS_CRC32
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
diff --git a/arch/s390/lib/Makefile b/arch/s390/lib/Makefile
index cd35cdbfa8713..7c8583d46eca1 100644
--- a/arch/s390/lib/Makefile
+++ b/arch/s390/lib/Makefile
@@ -23,8 +23,5 @@ obj-$(CONFIG_S390_MODULES_SANITY_TEST) += test_modules.o
 obj-$(CONFIG_S390_MODULES_SANITY_TEST_HELPERS) += test_modules_helpers.o
 
 lib-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_EXPOLINE_EXTERN) += expoline.o
-
-obj-$(CONFIG_CRC32_ARCH) += crc32-s390.o
-crc32-s390-y := crc32.o crc32le-vx.o crc32be-vx.o
diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index d0c293b1a4182..1b69a8bef4a85 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -72,10 +72,11 @@ config CRC32_ARCH
 	default y if ARM64
 	default y if LOONGARCH
 	default y if MIPS && CPU_MIPSR6
 	default y if PPC64 && ALTIVEC
 	default y if RISCV && RISCV_ISA_ZBC
+	default y if S390
 
 config CRC64
 	tristate
 	help
 	  The CRC64 library functions.  Select this if your module uses any of
diff --git a/lib/crc/Makefile b/lib/crc/Makefile
index 190f889adf556..bec58266251f8 100644
--- a/lib/crc/Makefile
+++ b/lib/crc/Makefile
@@ -25,10 +25,11 @@ ifeq ($(CONFIG_CRC32_ARCH),y)
 CFLAGS_crc32-main.o += -I$(src)/$(SRCARCH)
 crc32-$(CONFIG_ARM) += arm/crc32-core.o
 crc32-$(CONFIG_ARM64) += arm64/crc32-core.o
 crc32-$(CONFIG_PPC) += powerpc/crc32c-vpmsum_asm.o
 crc32-$(CONFIG_RISCV) += riscv/crc32_lsb.o riscv/crc32_msb.o
+crc32-$(CONFIG_S390) += s390/crc32le-vx.o s390/crc32be-vx.o
 endif
 
 obj-$(CONFIG_CRC64) += crc64.o
 crc64-y := crc64-main.o
 ifeq ($(CONFIG_CRC64_ARCH),y)
diff --git a/arch/s390/lib/crc32-vx.h b/lib/crc/s390/crc32-vx.h
similarity index 100%
rename from arch/s390/lib/crc32-vx.h
rename to lib/crc/s390/crc32-vx.h
diff --git a/arch/s390/lib/crc32.c b/lib/crc/s390/crc32.h
similarity index 81%
rename from arch/s390/lib/crc32.c
rename to lib/crc/s390/crc32.h
index 3c4b344417c11..59c8983d428be 100644
--- a/arch/s390/lib/crc32.c
+++ b/lib/crc/s390/crc32.h
@@ -3,16 +3,12 @@
  * CRC-32 implemented with the z/Architecture Vector Extension Facility.
  *
  * Copyright IBM Corp. 2015
  * Author(s): Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
  */
-#define KMSG_COMPONENT	"crc32-vx"
-#define pr_fmt(fmt)	KMSG_COMPONENT ": " fmt
 
-#include <linux/module.h>
 #include <linux/cpufeature.h>
-#include <linux/crc32.h>
 #include <asm/fpu.h>
 #include "crc32-vx.h"
 
 #define VX_MIN_LEN		64
 #define VX_ALIGNMENT		16L
@@ -25,11 +21,11 @@
  * on the message buffer, the hardware-accelerated or software implementation
  * is used.   Note that the message buffer is aligned to improve fetch
  * operations of VECTOR LOAD MULTIPLE instructions.
  */
 #define DEFINE_CRC32_VX(___fname, ___crc32_vx, ___crc32_sw)		    \
-	u32 ___fname(u32 crc, const u8 *data, size_t datalen)		    \
+	static inline u32 ___fname(u32 crc, const u8 *data, size_t datalen) \
 	{								    \
 		unsigned long prealign, aligned, remaining;		    \
 		DECLARE_KERNEL_FPU_ONSTACK16(vxstate);			    \
 									    \
 		if (datalen < VX_MIN_LEN + VX_ALIGN_MASK || !cpu_has_vx())  \
@@ -52,26 +48,20 @@
 									    \
 		if (remaining)						    \
 			crc = ___crc32_sw(crc, data + aligned, remaining);  \
 									    \
 		return crc;						    \
-	}								    \
-	EXPORT_SYMBOL(___fname);
+	}
 
 DEFINE_CRC32_VX(crc32_le_arch, crc32_le_vgfm_16, crc32_le_base)
 DEFINE_CRC32_VX(crc32_be_arch, crc32_be_vgfm_16, crc32_be_base)
 DEFINE_CRC32_VX(crc32c_arch, crc32c_le_vgfm_16, crc32c_base)
 
-u32 crc32_optimizations(void)
+static inline u32 crc32_optimizations_arch(void)
 {
 	if (cpu_has_vx()) {
 		return CRC32_LE_OPTIMIZATION |
 		       CRC32_BE_OPTIMIZATION |
 		       CRC32C_OPTIMIZATION;
 	}
 	return 0;
 }
-EXPORT_SYMBOL(crc32_optimizations);
-
-MODULE_AUTHOR("Hendrik Brueckner <brueckner@linux.vnet.ibm.com>");
-MODULE_DESCRIPTION("CRC-32 algorithms using z/Architecture Vector Extension Facility");
-MODULE_LICENSE("GPL");
diff --git a/arch/s390/lib/crc32be-vx.c b/lib/crc/s390/crc32be-vx.c
similarity index 100%
rename from arch/s390/lib/crc32be-vx.c
rename to lib/crc/s390/crc32be-vx.c
diff --git a/arch/s390/lib/crc32le-vx.c b/lib/crc/s390/crc32le-vx.c
similarity index 100%
rename from arch/s390/lib/crc32le-vx.c
rename to lib/crc/s390/crc32le-vx.c
-- 
2.49.0


