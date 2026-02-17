Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B01EF99F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPLoCEcGGx8jcV18gWflCZoqkwA1p5Zz3iE0WBWNV5s=; b=ENgzgyvDi5h1MMLdV8TZ68qiHz
	bImH8UCVT3NAKTc1ALOGy/drxz7Yn1ExvEZtk5zYAEzJpHUA8LJHd3P4DkskUtzyJEdxX+K9vnW+b
	WmWVHoJWdlycUC84H+vnoVwF6bwnvIrcmlxedacHYjBuM4cgo3zBGAWDdqzmHtgeGT0rc+8wy9Z73
	HqVjz9A+ymVWb8qjaK+jmSJWdaevvRoy3ChczHIbvnq42S/JREEgN11YLUR/RrH0euougtjJveBZJ
	LLiqdV0dU/MlOuJqgL4Knf2WEBBjFGt5FJCemA52jcUU621GKqdOUSgGYJ404if6hVCmwRlCWDoZz
	mtDxOn+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLDn-00000008KDm-3xIY;
	Tue, 17 Feb 2026 13:34:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLDf-00000008KBK-4584
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:34:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F3EF14BF;
	Tue, 17 Feb 2026 05:34:18 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BE5E3F632;
	Tue, 17 Feb 2026 05:34:23 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: stable@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jack Aboutboul <jaboutboul@microsoft.com>,
	Sharath George John <sgeorgejohn@microsoft.com>,
	Noah Meyerhans <nmeyerhans@microsoft.com>,
	Jim Perrin <Jim.Perrin@microsoft.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Eric Chanudet <echanude@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 6.6 1/3] arm64: mm: Don't remap pgtables per-cont(pte|pmd) block
Date: Tue, 17 Feb 2026 13:34:06 +0000
Message-ID: <20260217133411.2881311-2-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260217133411.2881311-1-ryan.roberts@arm.com>
References: <20260217133411.2881311-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_053428_117155_5F6EA8E0 
X-CRM114-Status: GOOD (  13.93  )
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

[ Upstream commit 5c63db59c5f89925add57642be4f789d0d671ccd ]

A large part of the kernel boot time is creating the kernel linear map
page tables. When rodata=full, all memory is mapped by pte. And when
there is lots of physical ram, there are lots of pte tables to populate.
The primary cost associated with this is mapping and unmapping the pte
table memory in the fixmap; at unmap time, the TLB entry must be
invalidated and this is expensive.

Previously, each pmd and pte table was fixmapped/fixunmapped for each
cont(pte|pmd) block of mappings (16 entries with 4K granule). This means
we ended up issuing 32 TLBIs per (pmd|pte) table during the population
phase.

Let's fix that, and fixmap/fixunmap each page once per population, for a
saving of 31 TLBIs per (pmd|pte) table. This gives a significant boot
speedup.

Execution time of map_mem(), which creates the kernel linear map page
tables, was measured on different machines with different RAM configs:

               | Apple M2 VM | Ampere Altra| Ampere Altra| Ampere Altra
               | VM, 16G     | VM, 64G     | VM, 256G    | Metal, 512G
---------------|-------------|-------------|-------------|-------------
               |   ms    (%) |   ms    (%) |   ms    (%) |    ms    (%)
---------------|-------------|-------------|-------------|-------------
before         |  168   (0%) | 2198   (0%) | 8644   (0%) | 17447   (0%)
after          |   78 (-53%) |  435 (-80%) | 1723 (-80%) |  3779 (-78%)

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Tested-by: Eric Chanudet <echanude@redhat.com>
Reviewed-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Link: https://lore.kernel.org/r/20240412131908.433043-2-ryan.roberts@arm.com
Signed-off-by: Will Deacon <will@kernel.org>
[ Ryan: Trivial backport ]
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/mm/mmu.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index c8e83fe1cd5a7..130e915a3845e 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -169,12 +169,9 @@ bool pgattr_change_is_safe(u64 old, u64 new)
 	return ((old ^ new) & ~mask) == 0;
 }

-static void init_pte(pmd_t *pmdp, unsigned long addr, unsigned long end,
+static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 		     phys_addr_t phys, pgprot_t prot)
 {
-	pte_t *ptep;
-
-	ptep = pte_set_fixmap_offset(pmdp, addr);
 	do {
 		pte_t old_pte = READ_ONCE(*ptep);

@@ -189,8 +186,6 @@ static void init_pte(pmd_t *pmdp, unsigned long addr, unsigned long end,

 		phys += PAGE_SIZE;
 	} while (ptep++, addr += PAGE_SIZE, addr != end);
-
-	pte_clear_fixmap();
 }

 static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
@@ -201,6 +196,7 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 {
 	unsigned long next;
 	pmd_t pmd = READ_ONCE(*pmdp);
+	pte_t *ptep;

 	BUG_ON(pmd_sect(pmd));
 	if (pmd_none(pmd)) {
@@ -216,6 +212,7 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 	}
 	BUG_ON(pmd_bad(pmd));

+	ptep = pte_set_fixmap_offset(pmdp, addr);
 	do {
 		pgprot_t __prot = prot;

@@ -226,20 +223,21 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 		    (flags & NO_CONT_MAPPINGS) == 0)
 			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);

-		init_pte(pmdp, addr, next, phys, __prot);
+		init_pte(ptep, addr, next, phys, __prot);

+		ptep += pte_index(next) - pte_index(addr);
 		phys += next - addr;
 	} while (addr = next, addr != end);
+
+	pte_clear_fixmap();
 }

-static void init_pmd(pud_t *pudp, unsigned long addr, unsigned long end,
+static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 		     phys_addr_t phys, pgprot_t prot,
 		     phys_addr_t (*pgtable_alloc)(int), int flags)
 {
 	unsigned long next;
-	pmd_t *pmdp;

-	pmdp = pmd_set_fixmap_offset(pudp, addr);
 	do {
 		pmd_t old_pmd = READ_ONCE(*pmdp);

@@ -265,8 +263,6 @@ static void init_pmd(pud_t *pudp, unsigned long addr, unsigned long end,
 		}
 		phys += next - addr;
 	} while (pmdp++, addr = next, addr != end);
-
-	pmd_clear_fixmap();
 }

 static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
@@ -276,6 +272,7 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 {
 	unsigned long next;
 	pud_t pud = READ_ONCE(*pudp);
+	pmd_t *pmdp;

 	/*
 	 * Check for initial section mappings in the pgd/pud.
@@ -294,6 +291,7 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 	}
 	BUG_ON(pud_bad(pud));

+	pmdp = pmd_set_fixmap_offset(pudp, addr);
 	do {
 		pgprot_t __prot = prot;

@@ -304,10 +302,13 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 		    (flags & NO_CONT_MAPPINGS) == 0)
 			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);

-		init_pmd(pudp, addr, next, phys, __prot, pgtable_alloc, flags);
+		init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);

+		pmdp += pmd_index(next) - pmd_index(addr);
 		phys += next - addr;
 	} while (addr = next, addr != end);
+
+	pmd_clear_fixmap();
 }

 static void alloc_init_pud(pgd_t *pgdp, unsigned long addr, unsigned long end,
--
2.43.0


