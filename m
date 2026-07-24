Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368F8C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 17:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7MQ8nFxcR+3QarTfdyhCyqtM12F9k/xO6jaJVaes4DU=; b=kpxLD2ETzTA5kUrcPi6iu+r6QG
	w2pUpYCrxRYc48uA0RSpeSbq5m3HGSaJCvkpRaVvLUDl+Xo/gR3qLhPXvipAsJZsfmakgb4DrzgKv
	EAGklLMvw7LCFVbg3Jm7EfTivS6AUAaEr2bt7p9ZMG46gnvQ4XKgMnQUhVhaC12ehpFMVRcH9eMhT
	YCPW9HhR0JwOgG0HzCRKd4Dla3fL7ONNmk+7dsSkEh5QLB7YPAByeZN6npbWK0BbkwQ/+GIWFya67
	3wMC8Bg5bxQW4ShdlwgZp4el6qrW8kNP7O/ytHtgNwMqfbfwrPbNUWqHsaNa9uF+WZ57HUli189Xy
	n1Nj2z6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnK0A-0000000Gyya-000B;
	Fri, 24 Jul 2026 17:48:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnK07-0000000Gyy4-0qFl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 17:48:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so5260755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 10:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784915277; x=1785520077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7MQ8nFxcR+3QarTfdyhCyqtM12F9k/xO6jaJVaes4DU=;
        b=hkrY1ag9skV2SPKYsHmjvDcZuIRLQbXVQk9zoY2MdaXg6WrMrqSzpRYk0N6nZJG/KX
         EJYpqUfgI1r6E8u7DrKdD2QzG5dRSyagcuCosBTq6VfQAX4XJpgVvxbCNqDvruo50APq
         BASqToQV/B5LvqCn/zT+U0XQZtk992ZiKvbW3vaSlrrc2h9t/GT9nvFbtR0m2QlJ2LRH
         gA4O6PqJl3FHiAJchvlpg8rzynqKn9J6aJ8FU3MqEpBPZHSxgG+ZLQsva645AIcrc6a4
         sJQaxndKuBoX/oWW67I8D6VAbdQQNasG3GBjSj9s3AEebBnXsrfPYN4MZ7AX+ZLZVzGi
         AMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784915277; x=1785520077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MQ8nFxcR+3QarTfdyhCyqtM12F9k/xO6jaJVaes4DU=;
        b=jA2y2IsCETjZ7qR1fTEDoy0TR7qyQ2/cZqhgLrzKEI8oJjfIstPAm8yC19cULmbMLq
         FMr+01HkwCRF9zZMe04LCtNGjyLKHs63qowraI50vRYnFs7nzD+X3WicZo8HT2qJGJAJ
         fz2/2XNDBPmu14ZfEIYfNNuBg2NdygcELNl212DCenwxidJDTarmk2ZO6jXFmkqzH+NP
         fleu9eq5vLa5SuCD/wSaAR7LwnFYkgQxSlXCDSVoQ2eM/v5Rue8GxZEWQD2aFcumGREV
         49SjfZgkK4QKWqhUSJ1h3X3y+dBq0QaBUD/s6UbSIw/jA5oTcxge2n09Y2rrFCRIKypS
         sdEA==
X-Forwarded-Encrypted: i=1; AHgh+RpEiLMYaG/TE4NTUbZVPi2Lf//MPs+1r4VX13sz9isxl4kthVrOAawu21W6Cp+NvQrfvxXnzfDUjdbUblCZwyDJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2GoQ/oAnBEwS7n+4qbwPqmX1qwKKr1330KuhFV+97gfGFJy+g
	j5StjW3Wuevot7nA2eCM1AEiIHtpNf3iSxF67fb3Kt0qKRsw9dZN25EI9idC2dB/
X-Gm-Gg: AR+sD1121c4i+HoSoOczqtAaBU8a4WNJE0gQ/rXiUxnElLraEjLMfkTa+fEC+khX4bX
	X3BenQxYQwdQbFzrosKcnaK0aztVIrh7oT4hQAgd3jPlZWskiQKtetqLmX4tDbZlmCnBRTgfs0n
	jQa0TOp5PFvScn0jC8vcpB2cJR0DLzDC0UHIAUKkjRRsB3K13LCDLtzqOUkmMmCG+8rhank5gmc
	iiSunA3XfLimSaSx26h6m8bEC50Nh9HFjQuPaOlTXgS3ouymfe/fpo9o65yiAshiNzCefYBq5ms
	3UnURzsje7AaQlEYyPX0/qj1EBhthabDGQ4fkqdK8uTQVOHlhVISG74OX/eGa8Qp+pNBQX4insg
	63Rw3/5VrtF8R7Zpf044Hs/g+sspuEaFAh8Ec2YQ6PY2QhvWASeTcc4Nbwfw/hfgRxoefv1bqd9
	yDy+v6CN7cpGA9SJro7K2er+3Nb/gBJ8Pc4ux0m3gzBLzTlNswyucYVwtnWiihwHS9Q+H8kJu7B
	P5YpYXpmHTY+0KHl8WRIBw2aGx9bI7hPhhKHkUy/YmLt/C85l7kr7cMHD6mWgo76IeezxryQNLP
	XhaIK7m51TBMYIXDXFo=
X-Received: by 2002:a05:600c:6b6a:b0:495:3f0f:d515 with SMTP id 5b1f17b1804b1-49573cf4d25mr70952705e9.36.1784915277056;
        Fri, 24 Jul 2026 10:47:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae93-f301-cdd9-d5ea-080d-9131.310.pool.telefonica.de. [2a02:3100:ae93:f301:cdd9:d5ea:80d:9131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f395aasm325645e9.15.2026.07.24.10.47.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 24 Jul 2026 10:47:56 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Kevin Cernekee <cernekee@gmail.com>,
	Gregory Fong <gregory.0xf0@gmail.com>
Subject: [PATCH v2] ARM: set !LPAE MAX_PHYSMEM_BITS to 32 and remove IO_36
Date: Fri, 24 Jul 2026 19:47:48 +0200
Message-Id: <20260724174748.65958-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_104759_324597_C2577946 
X-CRM114-Status: GOOD (  26.59  )
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

An arm randconfig with CONFIG_GET_FREE_REGION=y (selected by
RESOURCE_KUNIT_TEST, DEVICE_PRIVATE, CXL_REGION or DRM_XE) and the
default CONFIG_WERROR=y fails to build:

  kernel/resource.c: In function 'gfr_start':
  include/linux/minmax.h:86:37: error: conversion from 'long long
  unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes
  value from '68719476735' to '4294967295' [-Werror=overflow]

since commit 14b80582c43e ("resource: Introduce
alloc_free_mem_region()") clamps against (1ULL << MAX_PHYSMEM_BITS) - 1
in resource_size_t arithmetic, which is 32-bit without LPAE while
arm's default MAX_PHYSMEM_BITS is 36.

The 36-bit default exists for CONFIG_IO_36, added in commit
23bdf86aa06e ("[ARM] 3377/2: add support for intel xsc3 core") to let
IXP23xx ioremap() I/O above 4GiB using supersections.  IXP23xx was
removed in 2012, IOP13xx, the last user of addresses above 4GiB, in
2019 with v5.4, and PXA3xx as the only remaining XSC3 platform has
nothing above 4GiB.

Supersection descriptors have no domain field, as those bits hold
extended physical address bits.  36-bit I/O therefore required
renumbering the protection domains to make DOMAIN_IO zero, and
ioremap()'s supersection path is only compiled in that case.

Remove IO_36, the alternate domain numbering, and the ioremap()
supersection path.  Reject non-LPAE physical ranges beyond the
32-bit phys_addr_t limit before truncation, preventing faults from
ranges crossing 4GiB.  Since high non-LPAE ranges are rejected
before truncation, remove the corresponding static-mapping
exclusion as well.  Reduce ioremap alignment from 16MiB to the
2MiB covered by a PMD's pair of sections.

With that, LPAE is the only way to address more than 32 bits of
physical memory, so use the 36-bit MAX_PHYSMEM_BITS default only
there, matching phys_addr_t.

Link: https://lore.kernel.org/all/3c79d2dc-8fbd-40fc-8b2d-9d1b4f8ed34e@app.fastmail.com/
Link: https://lore.kernel.org/all/CAK8P3a2MCdUbN0QSb+M3g5_6HjPsaQwtKxFjADMZWomdry4-Ww@mail.gmail.com/
Fixes: 14b80582c43e ("resource: Introduce alloc_free_mem_region()")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2: fold in the IO_36 removal and its ioremap path, as requested by
Arnd; correct the history (IOP13xx was removed in 2019, not 2012).

Build-tested: the failing randconfig, PXA3xx/XSC3 UP, LPAE (keeps
36 bits); boot-tested on QEMU versatilepb (!LPAE) and virt/Cortex-A15
(LPAE); applies cleanly to v6.1.

Deliberately left in place: create_36bit_mapping() and the
PMD_SECT_SUPER/SUPERSECTION_* definitions, now unreachable for
device mappings.  A follow-up patch can remove them.

v1: https://lore.kernel.org/all/20260724063048.12565-1-kmehltretter@gmail.com/

 arch/arm/include/asm/domain.h    | 17 ----------
 arch/arm/include/asm/memory.h    |  4 +--
 arch/arm/include/asm/sparsemem.h |  4 +++
 arch/arm/mm/Kconfig              |  7 -----
 arch/arm/mm/ioremap.c            | 53 +++++---------------------------
 5 files changed, 13 insertions(+), 72 deletions(-)

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
-- 
2.53.0


