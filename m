Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CE4C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 20:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLqUt5ykU+NewpLqdF7LC2juceSoo6/VlXnuY6rAb5I=; b=W9Gzrwczkl9M4grTnhFmCfKUPe
	fw/izMPLnA0RyZOsXwie2pV7Zw9JaQhmjCYUWZ1yTjMTjS7PQj+IRg/wSP2RgY8K2jV9HtpISOMDb
	j2z/hNHefbwX9ZU24IgC90ePkM91MsSH6xz8a2qm4nnKN1lp/v2WJeQ88sJJOszi7uhZ1uoucORRF
	ar2xf/I0ha9VHupSI6Kt2WLi6/xxyWgNhR2lAvHmW7zX4wJHQhkLkIYunmZ2DmlOFWXTLb8lJqO/Y
	cp1zJJh5LUcl70KUm556yAG6Y0gV5cxxm3k9wirG1lyg1gOoKQLhjGPMS9PO5bfp5v2i46n5JZrtY
	YvNIbKeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO008-000000023TI-39qM;
	Sat, 07 Jun 2025 20:18:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzpF-000000021Ut-1viu;
	Sat, 07 Jun 2025 20:07:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E903D4ABE6;
	Sat,  7 Jun 2025 20:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718C0C4CEF0;
	Sat,  7 Jun 2025 20:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749326850;
	bh=zY3fvpUbE+/4lThsCnGfT2NxFkXv0wD4oYk8K5EmW5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Chu95TKqPmDS98OhYY5Ac8BbqnX5apkd7PAsCrFcuiOOi6LR+p0TFPzxMjsPY/PBq
	 p/1Jy8JRQ+XCj0wdcVjt+41xJP78UoKVawE5RR2SKK2RzkUBS0W0LJKy7KBBSJohLi
	 Q6faTyM18RMmPfHyck7zmT9eKoGB1seXkb7EhfyczxWRMffU50h4KIAf034eG732E4
	 34vYkNT6nw+3TipBEJ7+fzMGPWM2pbIgR5lSjvU4I5fW4tJV2csqi4G22VpKWVRauo
	 yaHESgRIaOrVsNKdbICEnpBylxlg1NhiNCVLjeKF48QN4yRNzdUD/eZrqQphdsTwTY
	 WpEFv90CsX4/g==
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
Subject: [PATCH v2 05/12] lib/crc/loongarch: migrate loongarch-optimized CRC code into lib/crc/
Date: Sat,  7 Jun 2025 13:04:47 -0700
Message-ID: <20250607200454.73587-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
References: <20250607200454.73587-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_130733_595166_ADC31F3D 
X-CRM114-Status: GOOD (  13.77  )
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
This new way of organizing the CRC code eliminates the need to
artificially split the code for each CRC variant into separate arch and
generic modules, enabling better inlining and dead code elimination.
For more details, see "lib/crc: prepare for arch-optimized code in
subdirs of lib/crc/".

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/loongarch/Kconfig                        |  1 -
 arch/loongarch/lib/Makefile                   |  2 --
 lib/crc/Kconfig                               |  1 +
 .../crc/loongarch/crc32.h                     | 32 ++++---------------
 4 files changed, 7 insertions(+), 29 deletions(-)
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
index 63edb487daff8..c1629f07768f9 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -66,10 +66,11 @@ config ARCH_HAS_CRC32
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
index b37cd8537b459..6de5c96594afc 100644
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
@@ -26,11 +24,11 @@ do {							\
 #define CRC32(crc, value, size)		_CRC32(crc, value, size, crc)
 #define CRC32C(crc, value, size)	_CRC32(crc, value, size, crcc)
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
 
-u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
+static inline u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!static_branch_likely(&have_crc32))
 		return crc32_le_base(crc, p, len);
 
 	while (len >= sizeof(u64)) {
@@ -61,13 +59,12 @@ u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 		CRC32(crc, value, b);
 	}
 
 	return crc;
 }
-EXPORT_SYMBOL(crc32_le_arch);
 
-u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
+static inline u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!static_branch_likely(&have_crc32))
 		return crc32c_base(crc, p, len);
 
 	while (len >= sizeof(u64)) {
@@ -98,38 +95,21 @@ u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
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
+#define crc32_be_arch crc32_be_base /* not implemented on this arch */
 
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


