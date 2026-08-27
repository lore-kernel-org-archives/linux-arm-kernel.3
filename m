Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E31C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CyCUbo8ckePbD8MMp0AVVWrvzOSsuGmEZvYz1btlf4=; b=Rnlbqsj0/N/L042Zh+g7HEdzwk
	4nJuqsQ7dzE/g8DOkDOjtuAla1zssjx+LY+SmcAZRS1UdmrmWP+8KNTE2KogtYSAE5+KkbA0wQBSA
	CJLLGdaZ9La0lR5d2bypbgELecEABApOLjNQO3t0BJjVjt69dLteFo9eYJ8mF2CwrM8yX4vIRid19
	JjPmmuJ3+ChfdDSx464QymNgw0QL2w4TmZVGH4P9C19Rk62gDGFuHZYn9rimVCWItLnLQaYsQ/1yQ
	s6rmBYVYmaJ5UybodjHeORmdrd0Fnr+62LxqIxXOpCXiNFCI8zQyfHaIpMM/YMKzU591UtY0fv4xC
	CyZnvhKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdDQ-00000004OTn-38Wh;
	Thu, 27 Aug 2026 16:44:36 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdDO-00000004OSo-13Vz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:44:35 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-47f81362fb1so16439f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787849072; x=1788453872; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CyCUbo8ckePbD8MMp0AVVWrvzOSsuGmEZvYz1btlf4=;
        b=GrTN7GLmCToSnE7DEmQqm/xoyAF35Eyjj9fkkQ29YuNjdisM55PfATsNhizFAjqwwJ
         pwMG2WD437RdvITngViBicu4beG+QdmrSj21ChcEn5ZFkWjnZrBUmw9p1X2TDd7qDvxQ
         fxllI6mYN6XWc8ySu5KdLJ4SotBxHXD2q9OBJRpGr4cXmweN2b1z+IbRDqH72IcUH9WQ
         GVq+QWq63Qz08JzazcqkXxDWpaS1GBgiyEHc8dUXGL3CErsfIyG0pjWvglxkoZEjdi/X
         ynx6gccrA9NlMrNqaxpBfZPlUTg4eSU/gRix+b1NxIkOY+9gzuWME+W9IVbAXuv9uR2Z
         uBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849072; x=1788453872;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CyCUbo8ckePbD8MMp0AVVWrvzOSsuGmEZvYz1btlf4=;
        b=RgfL3RL23Hx+Ra69nzU/4C63e5AhlWtFAhrhaPnKIxsfyf68hr2gqlRRKLpCL3z/Rl
         uJ3M7pGZ176FNEjJADNM8DK5le6Kv78/QS2ZaFZUhDixk0lhMjQCBUh+Xe2VSD+Akb1E
         My3dhnHlgyOZ47S1lKoVJRBCVBlkufzzP0QUckHcLVyn7Lwv6IQPtSWduDScHyKpjiAp
         r+r4ZvXCfESciQZBAwYMxu0IomEpUt1jYwIlikygOaGmuxAzrehfzM6pzStHoc35uvM5
         v/LSvD/CAmL0ctdSzZ/2oa93Q4w5tW/m1Hpzslq7dIezs3wucsuKtSmUU9mU3mdVEDhR
         eP+w==
X-Gm-Message-State: AFuF++nDYVWqQKPJKxuLF6QiE+bWIbnhKdudStgWGHm+Fhm6fZqHdxeQ
	YVXQoPof7AORubtC9xE10H+RNDU5SIVDB19LjZPTzijTbeYFSRy6jqJwTajK9zYJzKlb0jPHSA=
	=
X-Received: from wmbjq10.prod.google.com ([2002:a05:600c:55ca:b0:499:c422:dc65])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4445:b0:493:e451:a9e1
 with SMTP id 5b1f17b1804b1-49b91c2e150mr4552335e9.2.1787849071663; Thu, 27
 Aug 2026 09:44:31 -0700 (PDT)
Date: Thu, 27 Aug 2026 18:44:11 +0200
In-Reply-To: <20260827164409.3421848-6-ardb+git@google.com>
Mime-Version: 1.0
References: <20260827164409.3421848-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4080; i=ardb@kernel.org;
 h=from:subject; bh=Ad7xQcsBExdRIPTIoeDmAPV3aD58c+p2kqv58VFSn9Q=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWtCZnTXg8WttnEv102d8l2FK3Rr/9F9MrOac9mmRRbMN
 zh05synjlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCR3R8ZGV4HN6r+1Xnn9vzl
 15/TlX6wzE6bVrRp4+Z9YhOcTDXmOQoyMhyK2fL8PvNT05AXrElL6hwOTl8j+v/Lg3WbrnpmpMh ttOEFAA==
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827164409.3421848-7-ardb+git@google.com>
Subject: [RFC PATCH v2 1/4] arm64: mm: Map fixmap PTE tables r/o in the linear map
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_094434_327130_9283FCB4 
X-CRM114-Status: GOOD (  18.50  )
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

Without physical KASLR, the fixmap page tables will appear at an a
priori known offset in the physical address space, and due to the lack
of randomization, the linear map carries a writeable alias of the fixmap
PTE pages, which appears at an offset in the kernel VA space that is
also predictable.

Given that the placement of the fixmap area is never randomized either,
a single store to this linear alias region is sufficient to map any
physical page with any permissions at a known offset in the kernel VA
space, including on top of the PTI trampoline.

Avoid this, by remapping the fixmap PTE pages read-only in the linear
map. This is possible because all updates to bm_pte[] occur via the
mapping of the kernel image in the vmap area. A read-only mapping is
still needed for things like ptdump that walk the page tables.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/fixmap.h | 3 +++
 arch/arm64/mm/fixmap.c          | 8 +++++---
 arch/arm64/mm/mmu.c             | 8 ++++++++
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
index 170c3502d723..9191125738e9 100644
--- a/arch/arm64/include/asm/fixmap.h
+++ b/arch/arm64/include/asm/fixmap.h
@@ -112,6 +112,9 @@ enum fixed_addresses {
 
 void __init early_fixmap_init(void);
 
+extern pte_t fixmap_bm_pte[][PTRS_PER_PTE];
+extern const size_t fixmap_bm_pte_size;
+
 #define __early_set_fixmap __set_fixmap
 
 extern void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot);
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index f66a0016dd02..3a8cf6de6a7d 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -31,13 +31,15 @@ static_assert(NR_BM_PMD_TABLES == 1);
 
 #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
 
-static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __bss_pgtbl;
+pte_t fixmap_bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __bss_pgtbl;
 static pmd_t bm_pmd[PTRS_PER_PMD] __bss_pgtbl __maybe_unused;
 static pud_t bm_pud[PTRS_PER_PUD] __bss_pgtbl __maybe_unused;
 
+const size_t fixmap_bm_pte_size = sizeof(fixmap_bm_pte);
+
 static inline pte_t *fixmap_pte(unsigned long addr)
 {
-	return &bm_pte[BM_PTE_TABLE_IDX(addr)][pte_index(addr)];
+	return &fixmap_bm_pte[BM_PTE_TABLE_IDX(addr)][pte_index(addr)];
 }
 
 static void __init early_fixmap_init_pte(pmd_t *pmdp, unsigned long addr)
@@ -46,7 +48,7 @@ static void __init early_fixmap_init_pte(pmd_t *pmdp, unsigned long addr)
 	pte_t *ptep;
 
 	if (pmd_none(pmd)) {
-		ptep = bm_pte[BM_PTE_TABLE_IDX(addr)];
+		ptep = fixmap_bm_pte[BM_PTE_TABLE_IDX(addr)];
 		__pmd_populate(pmdp, __pa_symbol(ptep),
 			       PMD_TYPE_TABLE | PMD_TABLE_AF);
 	}
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5d..9c1aa838e9d5 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1184,6 +1184,7 @@ static void __init map_mem(void)
 	phys_addr_t init_begin = __pa_symbol(__init_begin);
 	phys_addr_t init_end = __pa_symbol(__init_end);
 	phys_addr_t kernel_end = __pa_symbol(__bss_stop);
+	phys_addr_t fixmap_pte_base = __pa_symbol(fixmap_bm_pte);
 	phys_addr_t start, end;
 	int flags = NO_EXEC_MAPPINGS;
 	u64 i;
@@ -1225,6 +1226,9 @@ static void __init map_mem(void)
 	__map_memblock(init_end, kernel_end, pgprot_tagged(PAGE_KERNEL),
 		       flags);
 
+	__map_memblock(fixmap_pte_base, fixmap_pte_base + fixmap_bm_pte_size,
+		       pgprot_tagged(PAGE_KERNEL), flags);
+
 	/* map all the memory banks */
 	for_each_mem_range(i, &start, &end) {
 		/*
@@ -1268,6 +1272,10 @@ void mark_rodata_ro(void)
 			    (unsigned long)_stext - (unsigned long)_text,
 			    PAGE_KERNEL_RO);
 
+	update_mapping_prot(__pa_symbol(fixmap_bm_pte),
+			    (unsigned long)lm_alias(fixmap_bm_pte),
+			    fixmap_bm_pte_size, PAGE_KERNEL_RO);
+
 	/* Map the kernel data/bss as invalid in the linear map */
 	mark_linear_data_alias_valid(false);
 }
-- 
2.55.0.887.g758fc8c411-goog


