Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475CDD5CC8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kg/kIHVTHiz8etJGdNS9GpgXHNuRCTwjnnrHRUXl/AA=; b=opxqX4xL2VEPZpc7cb8BCxNhIO
	U4ck/SXBEdrtOy9Khq1I0eyheUvL5aB4IlHEWKBjebDNH8t1ZbyfLsp3KpMgqXOKA1Jet0R3o2P9/
	QpKgLXqATbXlhdzrWUGdarQLW46/hZBfs3o2y/Y2+fbUIAUqW9Ig5kDXev1gZBqD7IVjFraz981Rl
	YUHlBnP+WDfsNRvLB0yVkAM/1BBJ0X6G3nU2XW14dEoC3PbD5p/rhtM+o0G//IuFhgnEaK1Peetd9
	srms2EPi/n7dGaWFZTQPGhYsEFSHpvQhiJJ9GXHlmOIPWXDRg82TUsvKfd4mqYLVj1M9U79ECqDP2
	Iw2t0iVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65zQ-0000000HYc1-0tVV;
	Wed, 30 Oct 2024 10:31:48 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65mn-0000000HWaC-3y5a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:18:47 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e30ba241e7eso3848743276.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 03:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730283524; x=1730888324; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kg/kIHVTHiz8etJGdNS9GpgXHNuRCTwjnnrHRUXl/AA=;
        b=JFUakK/kMDyXLLowgxGr00/eqGeBiqHBZ0/oOAxQri0QVKzTTzTg3od13hgTZXibJQ
         vxmlB4bVTuhWGqKExRIkVje5ZapVaQFvS3XimMz/b6H7f4J82jcVSz8jfD84K8OIIaqK
         q4UGGW4BtK7kz8GzwmIZq/CmzywZS/SC4lAgOg3ldEVGvGoHmIH58oVDO0Q9WlrTg0S6
         NZ4Ud+cSUxy32MZMCWtLBfusjUcGWYOMkAxp7nhFuwGi78piOUmhFecRGtsLBxQX+gqQ
         +oa/XsgPWVhlPV8W4wE8BrWa28zWNrEqmYZoEoOCIEuE9QYVQSdjnKGHCKOLKnRz7HfA
         h10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730283524; x=1730888324;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kg/kIHVTHiz8etJGdNS9GpgXHNuRCTwjnnrHRUXl/AA=;
        b=XMRXAgCIP77z3kn16RO38oxmRpySwSRavFTUOJOHWQe8nkjZRlED8GbVH1Otr1I/7p
         G6UPacw78HE/Oi6tnNEgpRCFcLpqgtcBa2m/Q3O4oCJwhzxzbdW1sOTC7iATtU0/oQ8L
         +z5Ne9lC0S6CdNNA850u8mb+J+0rZUeCiF7e9xSgCwoEJwPgj+PqQ+fEIswIKvGYX7EN
         IgYX70utI3xyd4AjQL91lyUzauEMoiqHjTQATs/kHgj5xRoXk6Va4TIggAzje7s+cbex
         b47PZN+rMIqyh6y41du1Ev7YIWchq7dob49hke/4nGELg/7i+msqXld5yvtQAzoXYXQu
         0ikw==
X-Gm-Message-State: AOJu0YzdRk4tXr/abG3iYYSRkWFkyaG6pZy5kpKHZRnnbUaihiRLegde
	SjIwenB6GbOlNFNTk/wB/vwi3eUB8ylBX8keTbLFgbc/pLNvjkLtvrcJLBVX4uy7cVR6k72b/VV
	I5WLRY19GOSZczLV5J1r77ObuMlGC29m2zTOOd6HxB3JR1vqgbxUOh8qjzeCb+P1tsr+lnwUZZ7
	iwzJaY0+7OpZDbtsfRAOEmNxSo1KBoea6UtiNRd5U5
X-Google-Smtp-Source: AGHT+IHs9QWvufbOWXr5ECBWgcAR6C8EuNXNWeeS3nrHZJLBKoPbhzIuqfsM8OKvQ+nmRRRRdEtMEeLD
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a5b:91:0:b0:e28:f2a5:f1d with SMTP id
 3f1490d57ef6-e3087a4ed65mr49338276.4.1730283523057; Wed, 30 Oct 2024 03:18:43
 -0700 (PDT)
Date: Wed, 30 Oct 2024 11:18:11 +0100
In-Reply-To: <20241030101803.2037606-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20241030101803.2037606-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=11655; i=ardb@kernel.org;
 h=from:subject; bh=EsNyVRynRKFNOTFmisbkOFj6S81RcOlobIQYO8jCGKU=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV2J/VlU76I5Jgue2PF8CVvna5Xc0Pj2ixzvq0el4Ut7H
 vhmbNnUUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbyXoCR4dmsoy+3PVKvEVdm
 ilj+zV80c5LqTI3m9DY/80xT/oI7QowMVw1z2S5N2z0/ofdY0qFzLmZr/SsU/3zx6suKSJwWt5W NCQA=
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030101803.2037606-17-ardb+git@google.com>
Subject: [RFC PATCH 7/8] arm64/mm: Use reduced VA sizes (36/39/42 bits) only
 for user space
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_031846_033367_F886C2F9 
X-CRM114-Status: GOOD (  25.04  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The advantage of a reduced virtual address space size is its impact on
the number of translation levels, which affects TLB pressure. The
working set of translations covering the kernel side is negligible
compared to user space, where each process has its own set of page
tables, and so most of the same benefit can be obtained by reducing the
VA size only for user space.

As a preparatory step towards implementing this, drop all the reduced VA
space sizes in Kconfig, and replace it with a configurable userland VA
space size that is reflected in TASK_SIZE. This will be taken advantage
of in a subsequent patch to actually reduce the number of translations
used by the MMU for translating user space virtual addresses.

As a bonus, this will allow 36-bit virtual addressing for user space to
be used on SoCs whose physical address space layout is based on the
misguided 'Principles of ARM memory maps' document, which struggle with
this currently, given that a 35-bit linear map can only fit 2 GiB of RAM
(and on these designs, the rest of RAM comes after a 30 GiB hole in the
physical address space)

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/Kconfig                     | 56 +++++++++-----------
 arch/arm64/include/asm/assembler.h     |  2 +-
 arch/arm64/include/asm/memory.h        |  4 --
 arch/arm64/include/asm/pgtable-hwdef.h |  2 -
 arch/arm64/include/asm/processor.h     |  6 +--
 arch/arm64/kernel/cpufeature.c         |  2 -
 arch/arm64/kernel/head.S               |  4 --
 arch/arm64/mm/init.c                   |  4 +-
 arch/arm64/mm/proc.S                   |  2 -
 9 files changed, 31 insertions(+), 51 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 39d0d2eb5b7c..78e82383f8e2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -111,7 +111,7 @@ config ARM64
 	select ARCH_WANT_DEFAULT_BPF_JIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select ARCH_WANT_FRAME_POINTERS
-	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
+	select ARCH_WANT_HUGE_PMD_SHARE if !ARM64_64K_PAGES
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANTS_EXECMEM_LATE if EXECMEM
 	select ARCH_WANTS_NO_INSTR
@@ -321,9 +321,9 @@ config ARCH_MMAP_RND_BITS_MIN
 # max bits determined by the following formula:
 #  VA_BITS - PAGE_SHIFT - 3
 config ARCH_MMAP_RND_BITS_MAX
-	default 19 if ARM64_VA_BITS=36
-	default 24 if ARM64_VA_BITS=39
-	default 27 if ARM64_VA_BITS=42
+	default 19 if ARM64_USER_VA_BITS_36
+	default 24 if ARM64_USER_VA_BITS_39
+	default 27 if ARM64_USER_VA_BITS_42
 	default 29 if ARM64_64K_PAGES
 	default 30 if ARM64_16K_PAGES
 	default 33
@@ -377,9 +377,6 @@ config FIX_EARLYCON_MEM
 
 config PGTABLE_LEVELS
 	int
-	default 2 if ARM64_16K_PAGES && ARM64_VA_BITS_36
-	default 2 if ARM64_64K_PAGES && ARM64_VA_BITS_42
-	default 3 if ARM64_4K_PAGES && ARM64_VA_BITS_39
 	default 3 if ARM64_64K_PAGES
 	default 4 if ARM64_16K_PAGES
 	default 5 if ARM64_4K_PAGES
@@ -410,16 +407,10 @@ config BUILTIN_RETURN_ADDRESS_STRIPS_PAC
 config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN_GENERIC || KASAN_SW_TAGS
-	default 0xdfff800000000000 if ARM64_VA_BITS_52 && !ARM64_16K_PAGES && !KASAN_SW_TAGS
-	default 0xdfffc00000000000 if ARM64_VA_BITS_52 && ARM64_16K_PAGES && !KASAN_SW_TAGS
-	default 0xdffffe0000000000 if ARM64_VA_BITS_42 && !KASAN_SW_TAGS
-	default 0xdfffffc000000000 if ARM64_VA_BITS_39 && !KASAN_SW_TAGS
-	default 0xdffffff800000000 if ARM64_VA_BITS_36 && !KASAN_SW_TAGS
-	default 0xefff800000000000 if ARM64_VA_BITS_52 && !ARM64_16K_PAGES && KASAN_SW_TAGS
-	default 0xefffc00000000000 if ARM64_VA_BITS_52 && ARM64_16K_PAGES && KASAN_SW_TAGS
-	default 0xeffffe0000000000 if ARM64_VA_BITS_42 && KASAN_SW_TAGS
-	default 0xefffffc000000000 if ARM64_VA_BITS_39 && KASAN_SW_TAGS
-	default 0xeffffff800000000 if ARM64_VA_BITS_36 && KASAN_SW_TAGS
+	default 0xdfff800000000000 if !ARM64_16K_PAGES && !KASAN_SW_TAGS
+	default 0xdfffc00000000000 if ARM64_16K_PAGES && !KASAN_SW_TAGS
+	default 0xefff800000000000 if !ARM64_16K_PAGES && KASAN_SW_TAGS
+	default 0xefffc00000000000 if ARM64_16K_PAGES && KASAN_SW_TAGS
 	default 0xffffffffffffffff
 
 config UNWIND_TABLES
@@ -1334,26 +1325,26 @@ config ARM64_64K_PAGES
 endchoice
 
 choice
-	prompt "Virtual address space size"
-	default ARM64_VA_BITS_52
+	prompt "Virtual address space size for user space"
+	default ARM64_USER_VA_BITS_52
 	help
 	  Allows choosing one of multiple possible virtual address
 	  space sizes. The level of translation table is determined by
 	  a combination of page size and virtual address space size.
 
-config ARM64_VA_BITS_36
-	bool "36-bit" if EXPERT
+config ARM64_USER_VA_BITS_36
+	bool "36-bit"
 	depends on PAGE_SIZE_16KB
 
-config ARM64_VA_BITS_39
+config ARM64_USER_VA_BITS_39
 	bool "39-bit"
 	depends on PAGE_SIZE_4KB
 
-config ARM64_VA_BITS_42
+config ARM64_USER_VA_BITS_42
 	bool "42-bit"
 	depends on PAGE_SIZE_64KB
 
-config ARM64_VA_BITS_52
+config ARM64_USER_VA_BITS_52
 	bool "52-bit"
 	help
 	  Enable 52-bit virtual addressing for userspace when explicitly
@@ -1372,7 +1363,7 @@ endchoice
 
 config ARM64_FORCE_52BIT
 	bool "Force 52-bit virtual addresses for userspace"
-	depends on ARM64_VA_BITS_52 && EXPERT
+	depends on ARM64_USER_VA_BITS_52 && EXPERT
 	help
 	  For systems with 52-bit userspace VAs enabled, the kernel will attempt
 	  to maintain compatibility with older software by providing 48-bit VAs
@@ -1385,10 +1376,14 @@ config ARM64_FORCE_52BIT
 
 config ARM64_VA_BITS
 	int
-	default 36 if ARM64_VA_BITS_36
-	default 39 if ARM64_VA_BITS_39
-	default 42 if ARM64_VA_BITS_42
-	default 52 if ARM64_VA_BITS_52
+	default 52
+
+config TASK_SIZE_BITS
+	int
+	default 36 if ARM64_USER_VA_BITS_36
+	default 39 if ARM64_USER_VA_BITS_39
+	default 42 if ARM64_USER_VA_BITS_42
+	default 52
 
 choice
 	prompt "Physical address space size"
@@ -1399,11 +1394,10 @@ choice
 
 config ARM64_PA_BITS_48
 	bool "48-bit"
-	depends on ARM64_64K_PAGES || !ARM64_VA_BITS_52
+	depends on ARM64_64K_PAGES
 
 config ARM64_PA_BITS_52
 	bool "52-bit"
-	depends on ARM64_64K_PAGES || ARM64_VA_BITS_52
 	help
 	  Enable support for a 52-bit physical address space, introduced as
 	  part of the ARMv8.2-LPA extension.
diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 3d8d534a7a77..337ba98d0272 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -577,7 +577,7 @@ alternative_endif
  * 	ttbr: Value of ttbr to set, modified.
  */
 	.macro	offset_ttbr1, ttbr, tmp
-#if defined(CONFIG_ARM64_VA_BITS_52) && !defined(CONFIG_ARM64_LPA2)
+#ifndef CONFIG_ARM64_LPA2
 	mrs	\tmp, tcr_el1
 	and	\tmp, \tmp, #TCR_T1SZ_MASK
 	cmp	\tmp, #TCR_T1SZ(VA_BITS_MIN)
diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index 0480c61dbb4f..e138deb78bee 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -53,15 +53,11 @@
 #define PCI_IO_END		(PCI_IO_START + PCI_IO_SIZE)
 #define FIXADDR_TOP		(-UL(SZ_8M))
 
-#if VA_BITS > 48
 #ifdef CONFIG_ARM64_16K_PAGES
 #define VA_BITS_MIN		(47)
 #else
 #define VA_BITS_MIN		(48)
 #endif
-#else
-#define VA_BITS_MIN		(VA_BITS)
-#endif
 
 #define _PAGE_END(va)		(-(UL(1) << ((va) - 1)))
 
diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index fd330c1db289..a7e0c0f3c6c8 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -336,10 +336,8 @@
 #define TTBR_BADDR_MASK_52	GENMASK_ULL(47, 2)
 #endif
 
-#ifdef CONFIG_ARM64_VA_BITS_52
 /* Must be at least 64-byte aligned to prevent corruption of the TTBR */
 #define TTBR1_BADDR_4852_OFFSET	(((UL(1) << (52 - PGDIR_SHIFT)) - \
 				 (UL(1) << (48 - PGDIR_SHIFT))) * 8)
-#endif
 
 #endif
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 1bf1a3b16e88..62f30d8f9738 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -50,9 +50,9 @@
  * TASK_UNMAPPED_BASE - the lower boundary of the mmap VM area.
  */
 
-#define DEFAULT_MAP_WINDOW_64	(UL(1) << VA_BITS_MIN)
-#define TASK_SIZE_64		(UL(1) << vabits_actual)
-#define TASK_SIZE_MAX		(UL(1) << VA_BITS)
+#define DEFAULT_MAP_WINDOW_64	(UL(1) << MIN(VA_BITS_MIN, CONFIG_TASK_SIZE_BITS))
+#define TASK_SIZE_64		(UL(1) << MIN(vabits_actual, CONFIG_TASK_SIZE_BITS))
+#define TASK_SIZE_MAX		(UL(1) << CONFIG_TASK_SIZE_BITS)
 
 #ifdef CONFIG_COMPAT
 #if defined(CONFIG_ARM64_64K_PAGES) && defined(CONFIG_KUSER_HELPERS)
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 37e4c02e0272..c36c66562c0a 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2866,7 +2866,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.cpu_enable = cpu_enable_fpmr,
 		ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, FPMR, IMP)
 	},
-#ifdef CONFIG_ARM64_VA_BITS_52
 	{
 		.capability = ARM64_HAS_VA52,
 		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
@@ -2883,7 +2882,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 #endif
 #endif
 	},
-#endif
 	{
 		.desc = "NV1",
 		.capability = ARM64_HAS_HCR_NV1,
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 5ab1970ee543..15e9c1c5547d 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -380,11 +380,9 @@ SYM_FUNC_START_LOCAL(secondary_startup)
 	 */
 	mov	x20, x0				// preserve boot mode
 
-#ifdef CONFIG_ARM64_VA_BITS_52
 alternative_if ARM64_HAS_VA52
 	bl	__cpu_secondary_check52bitva
 alternative_else_nop_endif
-#endif
 
 	bl	__cpu_setup			// initialise processor
 	adrp	x1, swapper_pg_dir
@@ -488,7 +486,6 @@ SYM_FUNC_START(__enable_mmu)
 	ret
 SYM_FUNC_END(__enable_mmu)
 
-#ifdef CONFIG_ARM64_VA_BITS_52
 SYM_FUNC_START(__cpu_secondary_check52bitva)
 #ifndef CONFIG_ARM64_LPA2
 	mrs_s	x0, SYS_ID_AA64MMFR2_EL1
@@ -509,7 +506,6 @@ SYM_FUNC_START(__cpu_secondary_check52bitva)
 
 2:	ret
 SYM_FUNC_END(__cpu_secondary_check52bitva)
-#endif
 
 SYM_FUNC_START_LOCAL(__no_granule_support)
 	/* Indicate that this CPU can't boot and is stuck in the kernel */
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index d21f67d67cf5..c4349852846f 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -236,8 +236,8 @@ void __init arm64_memblock_init(void)
 	 * we have to move it upward. Since memstart_addr represents the
 	 * physical address of PAGE_OFFSET, we have to *subtract* from it.
 	 */
-	if (IS_ENABLED(CONFIG_ARM64_VA_BITS_52) && (vabits_actual != 52))
-		memstart_addr -= _PAGE_OFFSET(vabits_actual) - _PAGE_OFFSET(52);
+	if (vabits_actual != VA_BITS)
+		memstart_addr -= _PAGE_OFFSET(vabits_actual) - _PAGE_OFFSET(VA_BITS);
 
 	/*
 	 * Apply the memory limit if it was set. Since the kernel may be loaded
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 8abdc7fed321..779f589f947c 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -472,7 +472,6 @@ SYM_FUNC_START(__cpu_setup)
 
 	tcr_clear_errata_bits tcr, x9, x5
 
-#ifdef CONFIG_ARM64_VA_BITS_52
 	mov		x9, #64 - VA_BITS
 alternative_if ARM64_HAS_VA52
 	tcr_set_t1sz	tcr, x9
@@ -480,7 +479,6 @@ alternative_if ARM64_HAS_VA52
 	orr		tcr, tcr, #TCR_DS
 #endif
 alternative_else_nop_endif
-#endif
 
 	/*
 	 * Set the IPS bits in TCR_EL1.
-- 
2.47.0.163.g1226f6d8fa-goog


