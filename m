Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7951C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Jun 2025 23:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfbKtZvV10LK5AgkFSeJ3qkCmuqnXUKfy3NxwTZXDdo=; b=i2PMRc7RWUh6h+I+jaJv3Fo9uO
	LmC5VpY19eK+jcrh3g+3EhjWmi9axgc5xReROQPFI7WqV4VpoXrayfVCoMUPW/7Nz+W6J+OgP3S9I
	OMmq1wWeC0GdCcWBttdfsz9g+7j+RLGKqJcFDJC1iVvJe/ljEPuyVUvCJO21xMxE3IwrMusqfFk3g
	pzGrgtvoRQFjoNIzTKRaiRxiEPiwAeDgd2weYI3pnQC+1qk3ynDE9+QpVPM2MRs3jsgA95YxExEOm
	MD3ZHtXIIwECf6SSRsOE1YdF9wOHGp7P0OFUmfRKa97tRnkPAXQk0UTmx8MdmepDcrpIY6Ll/XcSS
	iv3ggO1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLrnP-000000063pP-3RUB;
	Sun, 01 Jun 2025 23:08:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLrRF-000000060yc-3VOx;
	Sun, 01 Jun 2025 22:46:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 28C35A4EF26;
	Sun,  1 Jun 2025 22:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74559C4CEE7;
	Sun,  1 Jun 2025 22:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748817956;
	bh=yoI90iVlquVCitVGa7RjvDmSsdHmtg6em7U4Tn0qZw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X/+oa40fhs3WXlKJD4saBc72E23kv2NhgbcXplwEgCHTSx9q7IEqr1ccshOJ7tgnA
	 1wvSNnBXanAW0tzJBW0i77u5/lfiDGRSmDSaAEtDLDXaFSfcXR7uEipZlWltGULHKG
	 vmLfT92usKuxNR1te1C5Gj9xrmv8ttsPpoa7oOuSrgYSTO/zWghx+tMvMSyzzhyquP
	 8bQkBn5G93f6oPP7ZVPETOrTsXb9Nx6g01+InRcz1r/Zt6Z2giIRsqn2+I5unoCbmU
	 Vydkoc1ew8KwpGCw7V2LLbC2a6+CesUEmCU4a0ixOpuS42FGYNReQ3EqOsXAG3DoDU
	 Qol9Wooapbftw==
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
Subject: [PATCH 07/13] lib/crc/loongarch: migrate loongarch-optimized CRC code into lib/crc/
Date: Sun,  1 Jun 2025 15:44:35 -0700
Message-ID: <20250601224441.778374-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601224441.778374-1-ebiggers@kernel.org>
References: <20250601224441.778374-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_154558_036158_8E689930 
X-CRM114-Status: GOOD (  13.05  )
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

Move the loongarch-optimized CRC code from arch/loongarch/lib/crc* into
its new location in lib/crc/loongarch/, and wire it up in the new way.
For a detailed explanation of why this change is being made, see the
commit that introduced the new way of integrating arch-specific code
into lib/crc/.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/loongarch/Kconfig                        |  1 -
 arch/loongarch/lib/Makefile                   |  2 --
 lib/crc/Kconfig                               |  1 +
 .../crc/loongarch/crc32.h                     | 34 ++++---------------
 4 files changed, 8 insertions(+), 30 deletions(-)
 rename arch/loongarch/lib/crc32-loongarch.c => lib/crc/loongarch/crc32.h (71%)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 1a2cf012b8f2f..1b19893a6bdf0 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -13,11 +13,10 @@ config LOONGARCH
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
 	select ARCH_HAS_CPU_FINALIZE_INIT
-	select ARCH_HAS_CRC32
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KCOV
diff --git a/arch/loongarch/lib/Makefile b/arch/loongarch/lib/Makefile
index fae77809048b8..ccea3bbd43531 100644
--- a/arch/loongarch/lib/Makefile
+++ b/arch/loongarch/lib/Makefile
@@ -9,7 +9,5 @@ lib-y	+= delay.o memset.o memcpy.o memmove.o \
 obj-$(CONFIG_ARCH_SUPPORTS_INT128) += tishift.o
 
 obj-$(CONFIG_CPU_HAS_LSX) += xor_simd.o xor_simd_glue.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
-
-obj-$(CONFIG_CRC32_ARCH) += crc32-loongarch.o
diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index 663f4dca2bda1..ee320ae19ca85 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -63,10 +63,11 @@ config CRC32
 config CRC32_ARCH
 	bool
 	depends on CRC32 && CRC_OPTIMIZATIONS
 	default y if ARM && KERNEL_MODE_NEON
 	default y if ARM64
+	default y if LOONGARCH
 
 config CRC64
 	tristate
 	help
 	  The CRC64 library functions.  Select this if your module uses any of
diff --git a/arch/loongarch/lib/crc32-loongarch.c b/lib/crc/loongarch/crc32.h
similarity index 71%
rename from arch/loongarch/lib/crc32-loongarch.c
rename to lib/crc/loongarch/crc32.h
index b37cd8537b459..d5aff7ca96ae9 100644
--- a/arch/loongarch/lib/crc32-loongarch.c
+++ b/lib/crc/loongarch/crc32.h
@@ -8,12 +8,10 @@
  * Copyright (C) 2018 MIPS Tech, LLC
  * Copyright (C) 2020-2023 Loongson Technology Corporation Limited
  */
 
 #include <asm/cpu-features.h>
-#include <linux/crc32.h>
-#include <linux/module.h>
 #include <linux/unaligned.h>
 
 #define _CRC32(crc, value, size, type)			\
 do {							\
 	__asm__ __volatile__(				\
@@ -26,11 +24,12 @@ do {							\
 #define CRC32(crc, value, size)		_CRC32(crc, value, size, crc)
 #define CRC32C(crc, value, size)	_CRC32(crc, value, size, crcc)
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
 
-u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
+#define crc32_le_arch crc32_le_arch
+static inline u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!static_branch_likely(&have_crc32))
 		return crc32_le_base(crc, p, len);
 
 	while (len >= sizeof(u64)) {
@@ -61,13 +60,13 @@ u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 		CRC32(crc, value, b);
 	}
 
 	return crc;
 }
-EXPORT_SYMBOL(crc32_le_arch);
 
-u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
+#define crc32c_arch crc32c_arch
+static inline u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!static_branch_likely(&have_crc32))
 		return crc32c_base(crc, p, len);
 
 	while (len >= sizeof(u64)) {
@@ -98,38 +97,19 @@ u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 		CRC32C(crc, value, b);
 	}
 
 	return crc;
 }
-EXPORT_SYMBOL(crc32c_arch);
 
-u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
-{
-	return crc32_be_base(crc, p, len);
-}
-EXPORT_SYMBOL(crc32_be_arch);
-
-static int __init crc32_loongarch_init(void)
+#define crc32_mod_init_arch crc32_mod_init_arch
+static inline void crc32_mod_init_arch(void)
 {
 	if (cpu_has_crc32)
 		static_branch_enable(&have_crc32);
-	return 0;
 }
-subsys_initcall(crc32_loongarch_init);
 
-static void __exit crc32_loongarch_exit(void)
-{
-}
-module_exit(crc32_loongarch_exit);
-
-u32 crc32_optimizations(void)
+static inline u32 crc32_optimizations_arch(void)
 {
 	if (static_key_enabled(&have_crc32))
 		return CRC32_LE_OPTIMIZATION | CRC32C_OPTIMIZATION;
 	return 0;
 }
-EXPORT_SYMBOL(crc32_optimizations);
-
-MODULE_AUTHOR("Min Zhou <zhoumin@loongson.cn>");
-MODULE_AUTHOR("Huacai Chen <chenhuacai@loongson.cn>");
-MODULE_DESCRIPTION("CRC32 and CRC32C using LoongArch crc* instructions");
-MODULE_LICENSE("GPL v2");
-- 
2.49.0


