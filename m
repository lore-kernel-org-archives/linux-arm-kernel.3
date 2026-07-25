Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C7FC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 13:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jxjNC91EAnowiVmfYJTspYInwCXVKZ/rQl6vdAco4wA=; b=G9OFzEiEuft2iN21SluCqaPExV
	MOb/vlU6dUUBQ80zJQMLCKa9But8vnMo12exKjTcfjIZM92lAxLZ4fNL4JdaeRW54lm+cYMh+IPYA
	5TnRse0xnX0vYyEXZryVGN+Fe3Mb+DEMUpI4GvleJ0n4wqo8es3PFmVK1EtYo2wblPL9I1AmXZ89K
	1dsvINgRzo0fJ+5gqAix+nsJd6D9lg8TWEf7i+JSuh+DxSELRVh1wrMsGLY31QFLaJrKNqAEm+bAQ
	s5F+/uKsOc98HRHLNOlXOHnaL//uqExGCE9oZfjUGQ5Xa5yrX70TLPWT116vKXiDOkwHhPiLv7MJ1
	dG8VLokA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncTZ-00000000NzA-3YKH;
	Sat, 25 Jul 2026 13:31:37 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncTW-00000000NyR-0gNi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 13:31:36 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4957eefd361so10019725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 06:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784986292; x=1785591092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jxjNC91EAnowiVmfYJTspYInwCXVKZ/rQl6vdAco4wA=;
        b=qFgA/Q8ItdePNMYbnOUfR8V/sk93ISmqvhcQfVH0cOKoj+nRAD5BCVx79sUwC/kjTB
         SYlxDzz4ad9Oze1qtfzY6Jiysnln6ReOJ3WFg5I862PpKU7pe3UL04uhIDPtIkPFpjUm
         d/cUjyWTCQoadchZy4h5ab+n5bwYGDSXNCwb8yMME5YBfbawYWOs+KMjDQ363zNJq19a
         UBGs7qHlLdpgoTwxSgWQFoRaooDNb7qEe2ymvBF+ARJ62MXpcdzwui9itJKT7ho734v8
         7R2RN+2vvkH3qs0Yubg2dY2bH1JI/M5VKM1vM6TBnQSDILpq6tLZ5t0lnBo0MdmmIyRt
         UGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784986292; x=1785591092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxjNC91EAnowiVmfYJTspYInwCXVKZ/rQl6vdAco4wA=;
        b=Zq2j+AtiLLKGbsAomVXNboJrgZIhtfOZkU+HE23nH2xFDvxrwYYeTqSYurOL8xlF4N
         C2SDCxTNbbuf8F4lRSFbGyWRqSqhKU2GqcvE8jlrK9KMeDQtMI/zTIhudbi3y2MWe+WT
         Pt7OaWPWShAUcaUQxAK2ooFXDyNNOl+ctioYSvk68xB+qyfa+6e14TaOESPeRl+00+TD
         fUSwAwTRz18fOQhGM63xa7wdXPWpWePdnPdVdAYyF8y3GQbbXBMtfi+G+xNLrqW1vBYd
         t5JFv6crFrf5uAoPyHRFuY66bgehKWlMb1fblHsfPoIoNrVstwAA6dUqFrGNqhnWw6x7
         T4rg==
X-Forwarded-Encrypted: i=1; AHgh+Rq8wEr3sNLYqjHsgrtSBo2sdecN6D84JFB0otpFSMdQePVsWMZbk96uskAjVdJijXOyLY3OExAqNwR+Tm7oK5YM@lists.infradead.org
X-Gm-Message-State: AOJu0YzRns133d7g/1rIIlR2dvnRLj48U5/Fj4AqdHTBPa8QybtBYX4k
	oeBfGprWrkvuie7Vmj+gIMmYV3aGjj3WiUFT2TIzctLT1RDP//H8XiVM
X-Gm-Gg: AR+sD11gSCj0CUlIMFyAOynf2gFHBpLIAnUJhPRAldN10tCVTqCjXemHc/An75BqakD
	y1Gd+zlqq+RVyEmrr022T8u1CI5pvLG42z3uX5DKQbiwZSR13uoVNxYf3GrEOng1FqmcLgqxdBR
	qJHjObFqXOH+Y6lyH5daJWD+rf9E7ZEcwsggWlAMWispVlfGc46YCu2w5T3ID80hryikUPkZyDa
	L9/8TOe8Jx3vuEgBZzKcJ2xQwpRiWCvjNn+ma8WdaYuEo4ydL4OnQAQOLdo+oA7WM9ExJ+uZTBr
	WIUYlmdlVHG4SX5Ta9D8kJzKXI18PJixNO7a/PwAvs3T9eEftaX9QwiHTVVI9JmX2q7Bsz0abqo
	6JsadyuKgK3cjU/VLZFUbR5ECANHdRJELLPIhk86FAXBMda6sF1KHbdd+y1tZxR24v7p/qT91FK
	aTrzKYYhz3lrBYh3+MJ8VRNOrOD8MHskqGuVE4RK6RbCC6bAS1jWYy5sCsg+eDMOCR7aKQSL5F1
	QAX3T053/lWu9R+wfJ4UXPSQpgHZx/fiPF0K882X8z+ohcE9izfWnMPhZdsWZEL0ttEO0p/We+P
	o/qM4hw2rw==
X-Received: by 2002:a7b:cb4c:0:b0:495:779c:fbef with SMTP id 5b1f17b1804b1-496b57350ccmr18969515e9.37.1784986291871;
        Sat, 25 Jul 2026 06:31:31 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b344-be01-c902-8e3f-9491-60c2.310.pool.telefonica.de. [2a02:3100:b344:be01:c902:8e3f:9491:60c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957b842691sm119888725e9.1.2026.07.25.06.31.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 25 Jul 2026 06:31:30 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-efi@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-kernel@vger.kernel.org,
	Kevin Cernekee <cernekee@gmail.com>,
	Gregory Fong <gregory.0xf0@gmail.com>
Subject: [PATCH v3] ARM: set !LPAE MAX_PHYSMEM_BITS to 32 and remove supersection mappings
Date: Sat, 25 Jul 2026 15:31:22 +0200
Message-Id: <20260725133122.2723-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_063134_381749_F905F76F 
X-CRM114-Status: GOOD (  28.72  )
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

An ARM randconfig with CONFIG_GET_FREE_REGION=y and CONFIG_WERROR=y
fails to build:

  include/linux/minmax.h:86:37: error: conversion from 'long long
  unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes
  value from '68719476735' to '4294967295' [-Werror=overflow]

Commit 14b80582c43e ("resource: Introduce alloc_free_mem_region()")
made kernel/resource.c clamp against
(1ULL << MAX_PHYSMEM_BITS) - 1.  resource_size_t is 32-bit without
LPAE, but ARM's default MAX_PHYSMEM_BITS is 36.

That default was added by commit db57f88e4ccb ("ARM: 8411/1: Add
default SPARSEMEM settings") because several platforms needed at
least 36 physical address bits.  !LPAE could map addresses above
32 bits only through supersections.

CONFIG_IO_36, added by commit 23bdf86aa06e ("[ARM] 3377/2: add
support for intel xsc3 core"), enabled these for XSC3 I/O.  IXP23xx
placed static I/O mappings above 4GiB until its removal in 2012, and
IOP13xx ioremap()ed its PCIe windows there until its removal in 2019.
The only remaining XSC3 platform, PXA3xx, has nothing above 4GiB.

Supersection address bits overlap the descriptor domain field, so
IO_36 also renumbered the domains to make DOMAIN_IO zero.  Remove
IO_36, the alternate domain numbering, and ioremap()'s supersection
path.  Reject !LPAE ioremap ranges extending past 4GiB before
phys_addr_t truncation, drop the now-unneeded high static-mapping
exclusion, and reduce ioremap alignment from 16MiB to the 2MiB
covered by a PMD's pair of sections.

The other supersection user, create_36bit_mapping(), was added by
commit 0b7cd62ecdc1 ("[ARM] 3017/1: Add support for 36-bit addresses
to create_mapping()") for IXP2350 and carried IXP23xx's high static
mappings.  Before this change, its only remaining call path was
efi_create_mapping() -> create_mapping_late(), for an EFI runtime
region above 4GiB.

No real-world user of this !LPAE path is known.  AArch32 UEFI
requires RAM described by its memory map to be identity-mapped
during boot services, which a 32-bit virtual address space cannot
provide above 4GiB.  Systems needing wider physical addressing are
expected to use LPAE.

Remove create_36bit_mapping() and the supersection definitions.  If
firmware nevertheless advertises such a region on !LPAE,
efi_create_mapping() rejects it before __pfn_to_phys() truncates its
address to a low alias.  EFI runtime services remain disabled, but
the kernel continues to boot.  LPAE kernels are unaffected.

With no remaining !LPAE mappings above 4GiB, set MAX_PHYSMEM_BITS to
32 for !LPAE and retain 36 for LPAE, where phys_addr_t is 64-bit.

Link: https://lore.kernel.org/all/3c79d2dc-8fbd-40fc-8b2d-9d1b4f8ed34e@app.fastmail.com/
Link: https://lore.kernel.org/all/CAK8P3a2MCdUbN0QSb+M3g5_6HjPsaQwtKxFjADMZWomdry4-Ww@mail.gmail.com/
Fixes: 14b80582c43e ("resource: Introduce alloc_free_mem_region()")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v3: per Arnd's request, remove the remaining supersection code as
well: create_36bit_mapping() and the PMD_SECT_SUPER/SUPERSECTION_*
definitions.  efi_create_mapping() now rejects EFI runtime regions
extending beyond 4GiB on !LPAE with -ERANGE before __pfn_to_phys()
truncates their addresses, so efi_virtmap_init() keeps runtime
services disabled.  Corrected history: the 36-bit default came from
db57f88e4ccb, and create_36bit_mapping() served IXP23xx's static
mappings.  Retitled (was: "ARM: set !LPAE MAX_PHYSMEM_BITS to 32 and
remove IO_36").

Build-tested: multi_v7 + EFI (!LPAE and LPAE), pxa3xx_defconfig
(XSC3; build only - QEMU has no XSC3 emulation), versatile_defconfig,
and the originally failing GET_FREE_REGION + WERROR configuration.
Boot-tested on QEMU virt/Cortex-A15 with 32-bit EDK2, covering the
rejection boundaries: stock firmware keeps runtime services on
!LPAE; a runtime region ending exactly at 4GiB is accepted and
mapped; regions crossing 4GiB, starting exactly at 4GiB, and
entirely above it are each rejected on !LPAE with runtime services
cleanly disabled and the boot continuing; an LPAE kernel maps the
>4GiB region; efivars works in every enabled case.  versatilepb
(ARMv5, UP, !SMP ioremap path) boots to a shell.  Applies to v6.1
with a one-line include-context fixup in efi.c.

v2: https://lore.kernel.org/all/20260724174748.65958-1-kmehltretter@gmail.com/
    fold in the IO_36 removal and its ioremap path, as requested by
    Arnd; correct the history (IOP13xx was removed in 2019, not 2012).

v1: https://lore.kernel.org/all/20260724063048.12565-1-kmehltretter@gmail.com/

 arch/arm/include/asm/domain.h               | 17 -----
 arch/arm/include/asm/memory.h               |  4 +-
 arch/arm/include/asm/pgtable-2level-hwdef.h |  1 -
 arch/arm/include/asm/pgtable-2level.h       |  7 --
 arch/arm/include/asm/sparsemem.h            |  4 ++
 arch/arm/kernel/efi.c                       | 13 ++++
 arch/arm/mm/Kconfig                         |  7 --
 arch/arm/mm/ioremap.c                       | 53 ++------------
 arch/arm/mm/mmu.c                           | 76 +--------------------
 9 files changed, 27 insertions(+), 155 deletions(-)

diff --git a/arch/arm/include/asm/domain.h b/arch/arm/include/asm/domain.h
index d48859fdf32c..f91c2a72b9dc 100644
--- a/arch/arm/include/asm/domain.h
+++ b/arch/arm/include/asm/domain.h
@@ -18,27 +18,10 @@
  *  DOMAIN_IO     - domain 2 includes all IO only
  *  DOMAIN_USER   - domain 1 includes all user memory only
  *  DOMAIN_KERNEL - domain 0 includes all kernel memory only
- *
- * The domain numbering depends on whether we support 36 physical
- * address for I/O or not.  Addresses above the 32 bit boundary can
- * only be mapped using supersections and supersections can only
- * be set for domain 0.  We could just default to DOMAIN_IO as zero,
- * but there may be systems with supersection support and no 36-bit
- * addressing.  In such cases, we want to map system memory with
- * supersections to reduce TLB misses and footprint.
- *
- * 36-bit addressing and supersections are only available on
- * CPUs based on ARMv6+ or the Intel XSC3 core.
  */
-#ifndef CONFIG_IO_36
 #define DOMAIN_KERNEL	0
 #define DOMAIN_USER	1
 #define DOMAIN_IO	2
-#else
-#define DOMAIN_KERNEL	2
-#define DOMAIN_USER	1
-#define DOMAIN_IO	0
-#endif
 #define DOMAIN_VECTORS	3
 
 /*
diff --git a/arch/arm/include/asm/memory.h b/arch/arm/include/asm/memory.h
index 7c2fa7dcec6d..e25749bfbf90 100644
--- a/arch/arm/include/asm/memory.h
+++ b/arch/arm/include/asm/memory.h
@@ -89,9 +89,9 @@
 
 #if !defined(CONFIG_SMP) && !defined(CONFIG_ARM_LPAE)
 /*
- * Allow 16MB-aligned ioremap pages
+ * Allow 2MB-aligned ioremap pages
  */
-#define IOREMAP_MAX_ORDER	24
+#define IOREMAP_MAX_ORDER	21
 #endif
 
 #define VECTORS_BASE		UL(0xffff0000)
diff --git a/arch/arm/include/asm/pgtable-2level-hwdef.h b/arch/arm/include/asm/pgtable-2level-hwdef.h
index 556937e1790e..3fa254ac8a26 100644
--- a/arch/arm/include/asm/pgtable-2level-hwdef.h
+++ b/arch/arm/include/asm/pgtable-2level-hwdef.h
@@ -35,7 +35,6 @@
 #define PMD_SECT_APX		(_AT(pmdval_t, 1) << 15)	/* v6 */
 #define PMD_SECT_S		(_AT(pmdval_t, 1) << 16)	/* v6 */
 #define PMD_SECT_nG		(_AT(pmdval_t, 1) << 17)	/* v6 */
-#define PMD_SECT_SUPER		(_AT(pmdval_t, 1) << 18)	/* v6 */
 #define PMD_SECT_AF		(_AT(pmdval_t, 0))
 
 #define PMD_SECT_UNCACHED	(_AT(pmdval_t, 0))
diff --git a/arch/arm/include/asm/pgtable-2level.h b/arch/arm/include/asm/pgtable-2level.h
index 6b5392e20f41..7e1c08fdd029 100644
--- a/arch/arm/include/asm/pgtable-2level.h
+++ b/arch/arm/include/asm/pgtable-2level.h
@@ -96,13 +96,6 @@
 #define SECTION_SIZE		(1UL << SECTION_SHIFT)
 #define SECTION_MASK		(~(SECTION_SIZE-1))
 
-/*
- * ARMv6 supersection address mask and size definitions.
- */
-#define SUPERSECTION_SHIFT	24
-#define SUPERSECTION_SIZE	(1UL << SUPERSECTION_SHIFT)
-#define SUPERSECTION_MASK	(~(SUPERSECTION_SIZE-1))
-
 #define USER_PTRS_PER_PGD	(TASK_SIZE / PGDIR_SIZE)
 
 /*
diff --git a/arch/arm/include/asm/sparsemem.h b/arch/arm/include/asm/sparsemem.h
index 421e3415338a..6b512be3a34a 100644
--- a/arch/arm/include/asm/sparsemem.h
+++ b/arch/arm/include/asm/sparsemem.h
@@ -19,7 +19,11 @@
  * These can be overridden in your mach/memory.h.
  */
 #if !defined(MAX_PHYSMEM_BITS) || !defined(SECTION_SIZE_BITS)
+#ifdef CONFIG_ARM_LPAE
 #define MAX_PHYSMEM_BITS	36
+#else
+#define MAX_PHYSMEM_BITS	32
+#endif
 #define SECTION_SIZE_BITS	28
 #endif
 
diff --git a/arch/arm/kernel/efi.c b/arch/arm/kernel/efi.c
index 6f9ec7d28a71..c14275257a8a 100644
--- a/arch/arm/kernel/efi.c
+++ b/arch/arm/kernel/efi.c
@@ -6,6 +6,7 @@
 #include <linux/efi.h>
 #include <linux/memblock.h>
 #include <linux/screen_info.h>
+#include <linux/sizes.h>
 
 #include <asm/efi.h>
 #include <asm/mach/map.h>
@@ -54,6 +55,18 @@ int __init efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md)
 		.length		= md->num_pages * EFI_PAGE_SIZE,
 	};
 
+	/*
+	 * Non-LPAE page tables cannot map EFI runtime regions extending
+	 * beyond the 32-bit physical address space.
+	 */
+	if (!IS_ENABLED(CONFIG_ARM_LPAE) &&
+	    (md->phys_addr >= SZ_4G ||
+	     md->num_pages > (SZ_4G - md->phys_addr) / EFI_PAGE_SIZE)) {
+		pr_warn("EFI runtime region at 0x%llx exceeds 32-bit physical address space\n",
+			md->phys_addr);
+		return -ERANGE;
+	}
+
 	/*
 	 * Order is important here: memory regions may have all of the
 	 * bits below set (and usually do), so we check them in order of
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 871bd58d2ccc..07f1165ca794 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -328,7 +328,6 @@ config CPU_XSC3
 	select CPU_PABRT_LEGACY
 	select CPU_THUMB_CAPABLE
 	select CPU_TLB_V4WBI if MMU
-	select IO_36
 
 # Marvell PJ1 (Mohawk)
 config CPU_MOHAWK
@@ -652,12 +651,6 @@ config CPU_V7M_NUM_IRQ
 
 	  If unsure, keep default value.
 
-#
-# CPU supports 36-bit I/O
-#
-config IO_36
-	bool
-
 comment "Processor Features"
 
 config ARM_LPAE
diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
index 27e64f782cb3..539b6c2995af 100644
--- a/arch/arm/mm/ioremap.c
+++ b/arch/arm/mm/ioremap.c
@@ -30,8 +30,6 @@
 #include <linux/sizes.h>
 #include <linux/memblock.h>
 
-#include <asm/cp15.h>
-#include <asm/cputype.h>
 #include <asm/cacheflush.h>
 #include <asm/early_ioremap.h>
 #include <asm/mmu_context.h>
@@ -236,39 +234,6 @@ remap_area_sections(unsigned long virt, unsigned long pfn,
 	return 0;
 }
 
-static int
-remap_area_supersections(unsigned long virt, unsigned long pfn,
-			 size_t size, const struct mem_type *type)
-{
-	unsigned long addr = virt, end = virt + size;
-	pmd_t *pmd = pmd_off_k(addr);
-
-	/*
-	 * Remove and free any PTE-based mapping, and
-	 * sync the current kernel mapping.
-	 */
-	unmap_area_sections(virt, size);
-	do {
-		unsigned long super_pmd_val, i;
-
-		super_pmd_val = __pfn_to_phys(pfn) | type->prot_sect |
-				PMD_SECT_SUPER;
-		super_pmd_val |= ((pfn >> (32 - PAGE_SHIFT)) & 0xf) << 20;
-
-		for (i = 0; i < 8; i++) {
-			pmd[0] = __pmd(super_pmd_val);
-			pmd[1] = __pmd(super_pmd_val);
-			flush_pmd_entry(pmd);
-
-			addr += PMD_SIZE;
-			pmd += 2;
-		}
-
-		pfn += SUPERSECTION_SIZE >> PAGE_SHIFT;
-	} while (addr < end);
-
-	return 0;
-}
 #endif
 
 static void __iomem * __arm_ioremap_pfn_caller(unsigned long pfn,
@@ -278,15 +243,17 @@ static void __iomem * __arm_ioremap_pfn_caller(unsigned long pfn,
 	int err;
 	unsigned long addr;
 	struct vm_struct *area;
-	phys_addr_t paddr = __pfn_to_phys(pfn);
+	phys_addr_t paddr;
 
 #ifndef CONFIG_ARM_LPAE
 	/*
-	 * High mappings must be supersection aligned
+	 * The physical range must not extend beyond the 32-bit
+	 * phys_addr_t
 	 */
-	if (pfn >= 0x100000 && (paddr & ~SUPERSECTION_MASK))
+	if (((u64)pfn << PAGE_SHIFT) + offset + size > SZ_4G)
 		return NULL;
 #endif
+	paddr = __pfn_to_phys(pfn);
 
 	type = get_mem_type(mtype);
 	if (!type)
@@ -300,7 +267,7 @@ static void __iomem * __arm_ioremap_pfn_caller(unsigned long pfn,
 	/*
 	 * Try to reuse one of the static mapping whenever possible.
 	 */
-	if (size && !(sizeof(phys_addr_t) == 4 && pfn >= 0x100000)) {
+	if (size) {
 		struct static_vm *svm;
 
 		svm = find_static_vm_paddr(paddr, size, mtype);
@@ -326,13 +293,7 @@ static void __iomem * __arm_ioremap_pfn_caller(unsigned long pfn,
 	area->phys_addr = paddr;
 
 #if !defined(CONFIG_SMP) && !defined(CONFIG_ARM_LPAE)
-	if (DOMAIN_IO == 0 &&
-	    (((cpu_architecture() >= CPU_ARCH_ARMv6) && (get_cr() & CR_XP)) ||
-	       cpu_is_xsc3()) && pfn >= 0x100000 &&
-	       !((paddr | size | addr) & ~SUPERSECTION_MASK)) {
-		area->flags |= VM_ARM_SECTION_MAPPING;
-		err = remap_area_supersections(addr, pfn, size, type);
-	} else if (!((paddr | size | addr) & ~PMD_MASK)) {
+	if (!((paddr | size | addr) & ~PMD_MASK)) {
 		area->flags |= VM_ARM_SECTION_MAPPING;
 		err = remap_area_sections(addr, pfn, size, type);
 	} else
diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index 23b87b5ef7f1..5d0ae2529872 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -854,69 +854,6 @@ static void __init alloc_init_p4d(pgd_t *pgd, unsigned long addr,
 	} while (p4d++, addr = next, addr != end);
 }
 
-#ifndef CONFIG_ARM_LPAE
-static void __init create_36bit_mapping(struct mm_struct *mm,
-					struct map_desc *md,
-					const struct mem_type *type,
-					bool ng)
-{
-	unsigned long addr, length, end;
-	phys_addr_t phys;
-	pgd_t *pgd;
-
-	addr = md->virtual;
-	phys = __pfn_to_phys(md->pfn);
-	length = PAGE_ALIGN(md->length);
-
-	if (!(cpu_architecture() >= CPU_ARCH_ARMv6 || cpu_is_xsc3())) {
-		pr_err("MM: CPU does not support supersection mapping for 0x%08llx at 0x%08lx\n",
-		       (long long)__pfn_to_phys((u64)md->pfn), addr);
-		return;
-	}
-
-	/* N.B.	ARMv6 supersections are only defined to work with domain 0.
-	 *	Since domain assignments can in fact be arbitrary, the
-	 *	'domain == 0' check below is required to insure that ARMv6
-	 *	supersections are only allocated for domain 0 regardless
-	 *	of the actual domain assignments in use.
-	 */
-	if (type->domain) {
-		pr_err("MM: invalid domain in supersection mapping for 0x%08llx at 0x%08lx\n",
-		       (long long)__pfn_to_phys((u64)md->pfn), addr);
-		return;
-	}
-
-	if ((addr | length | __pfn_to_phys(md->pfn)) & ~SUPERSECTION_MASK) {
-		pr_err("MM: cannot create mapping for 0x%08llx at 0x%08lx invalid alignment\n",
-		       (long long)__pfn_to_phys((u64)md->pfn), addr);
-		return;
-	}
-
-	/*
-	 * Shift bits [35:32] of address into bits [23:20] of PMD
-	 * (See ARMv6 spec).
-	 */
-	phys |= (((md->pfn >> (32 - PAGE_SHIFT)) & 0xF) << 20);
-
-	pgd = pgd_offset(mm, addr);
-	end = addr + length;
-	do {
-		p4d_t *p4d = p4d_offset(pgd, addr);
-		pud_t *pud = pud_offset(p4d, addr);
-		pmd_t *pmd = pmd_offset(pud, addr);
-		int i;
-
-		for (i = 0; i < 16; i++)
-			*pmd++ = __pmd(phys | type->prot_sect | PMD_SECT_SUPER |
-				       (ng ? PMD_SECT_nG : 0));
-
-		addr += SUPERSECTION_SIZE;
-		phys += SUPERSECTION_SIZE;
-		pgd += SUPERSECTION_SIZE >> PGDIR_SHIFT;
-	} while (addr != end);
-}
-#endif	/* !CONFIG_ARM_LPAE */
-
 static void __init __create_mapping(struct mm_struct *mm, struct map_desc *md,
 				    void *(*alloc)(unsigned long sz),
 				    bool ng)
@@ -928,16 +865,6 @@ static void __init __create_mapping(struct mm_struct *mm, struct map_desc *md,
 
 	type = &mem_types[md->type];
 
-#ifndef CONFIG_ARM_LPAE
-	/*
-	 * Catch 36-bit addresses
-	 */
-	if (md->pfn >= 0x100000) {
-		create_36bit_mapping(mm, md, type, ng);
-		return;
-	}
-#endif
-
 	addr = md->virtual & PAGE_MASK;
 	phys = __pfn_to_phys(md->pfn);
 	length = PAGE_ALIGN(md->length + (md->virtual & ~PAGE_MASK));
@@ -964,8 +891,7 @@ static void __init __create_mapping(struct mm_struct *mm, struct map_desc *md,
  * Create the page directory entries and any necessary
  * page tables for the mapping specified by `md'.  We
  * are able to cope here with varying sizes and address
- * offsets, and we take full advantage of sections and
- * supersections.
+ * offsets, and we take full advantage of sections.
  */
 static void __init create_mapping(struct map_desc *md)
 {
-- 
2.53.0

