Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A483EFB7FB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 05:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvxlyZtgiqH5Fz5dg9B/zrxmBO2XFEwZx9yF3JTWM30=; b=lg1mbnPWupd9X7zx3m4ykG67D9
	odKk7uYAs2lzXTPBCXRYptUZDOwhyl+lqTRJZV8EJ6CZz1Xvw+XH0Am3k1jbjDB2s/+fBeeO99l95
	3M55dW/StGPPySUOJDjkCj2Heqkt+Qt59PzLniFEQNcHwlEX+qgLUL920RQAdOzCxXfSP5OWR26In
	TCXVv9mHTD5Uy2zo+jk/TtlhdWUftx2s03yJCrvKjsf9niD/Ihd3pbjUDDSQc1qlrFvBalTkYYzDB
	1bfs1D5iP+Qyeihm/n4hBfYlgJTOG8L1LssxLMGJbT7zgNZbXH4UplX5TtwQomhlQpqCre6ltRt91
	L0+Bjx3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vukjm-00000001T7r-1Lmu;
	Tue, 24 Feb 2026 05:13:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vukjd-00000001T0f-3ivH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 05:13:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B0F3497;
	Mon, 23 Feb 2026 21:13:19 -0800 (PST)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.18.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3838E3F7BD;
	Mon, 23 Feb 2026 21:13:20 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC V1 12/16] arm64/mm: Abstract printing of pxd_val()
Date: Tue, 24 Feb 2026 10:41:49 +0530
Message-ID: <20260224051153.3150613-13-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224051153.3150613-1-anshuman.khandual@arm.com>
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_211326_058102_648B7EAD 
X-CRM114-Status: GOOD (  13.29  )
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

Ahead of adding support for D128 pgtables, refactor places that print
PTE values to use the new __PRIpte format specifier and __PRIpte_args()
macro to prepare the argument(s). When using D128 pgtables in future,
we can simply redefine __PRIpte and __PTIpte_args().

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable-types.h |  3 +++
 arch/arm64/include/asm/pgtable.h       | 22 +++++++++++-----------
 arch/arm64/mm/fault.c                  | 10 +++++-----
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable-types.h b/arch/arm64/include/asm/pgtable-types.h
index 265e8301d7ba..dc3791dc9f14 100644
--- a/arch/arm64/include/asm/pgtable-types.h
+++ b/arch/arm64/include/asm/pgtable-types.h
@@ -11,6 +11,9 @@
 
 #include <asm/types.h>
 
+#define __PRIpte		"016llx"
+#define __PRIpte_args(val)	((u64)val)
+
 /*
  * Page Table Descriptor
  *
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index cf69ce68f951..c4142b734112 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -152,7 +152,7 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
 #define ZERO_PAGE(vaddr)	phys_to_page(__pa_symbol(empty_zero_page))
 
 #define pte_ERROR(e)	\
-	pr_err("%s:%d: bad pte %016llx.\n", __FILE__, __LINE__, pte_val(e))
+	pr_err("%s:%d: bad pte %" __PRIpte ".\n", __FILE__, __LINE__, __PRIpte_args(pte_val(e)))
 
 #ifdef CONFIG_ARM64_PA_BITS_52
 static inline phys_addr_t __pte_to_phys(pte_t pte)
@@ -465,14 +465,14 @@ static inline void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep,
 	 * through an invalid entry).
 	 */
 	VM_WARN_ONCE(!pte_young(pte),
-		     "%s: racy access flag clearing: 0x%016llx -> 0x%016llx",
-		     __func__, pte_val(old_pte), pte_val(pte));
+		     "%s: racy access flag clearing: 0x%" __PRIpte " -> 0x%" __PRIpte,
+		     __func__, __PRIpte_args(pte_val(old_pte)), __PRIpte_args(pte_val(pte)));
 	VM_WARN_ONCE(pte_write(old_pte) && !pte_dirty(pte),
-		     "%s: racy dirty state clearing: 0x%016llx -> 0x%016llx",
-		     __func__, pte_val(old_pte), pte_val(pte));
+		     "%s: racy dirty state clearing: 0x%" __PRIpte " -> 0x%" __PRIpte,
+		     __func__, __PRIpte_args(pte_val(old_pte)), __PRIpte_args(pte_val(pte)));
 	VM_WARN_ONCE(!pgattr_change_is_safe(pte_val(old_pte), pte_val(pte)),
-		     "%s: unsafe attribute change: 0x%016llx -> 0x%016llx",
-		     __func__, pte_val(old_pte), pte_val(pte));
+		     "%s: unsafe attribute change: 0x%" __PRIpte " -> 0x%" __PRIpte,
+		     __func__, __PRIpte_args(pte_val(old_pte)), __PRIpte_args(pte_val(pte)));
 }
 
 static inline void __sync_cache_and_tags(pte_t pte, unsigned int nr_pages)
@@ -905,7 +905,7 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 #if CONFIG_PGTABLE_LEVELS > 2
 
 #define pmd_ERROR(e)	\
-	pr_err("%s:%d: bad pmd %016llx.\n", __FILE__, __LINE__, pmd_val(e))
+	pr_err("%s:%d: bad pmd %" __PRIpte ".\n", __FILE__, __LINE__, __PRIpte_args(pmd_val(e)))
 
 #define pud_none(pud)		(!pud_val(pud))
 #define pud_bad(pud)		((pud_val(pud) & PUD_TYPE_MASK) != \
@@ -996,7 +996,7 @@ static inline bool mm_pud_folded(const struct mm_struct *mm)
 #define mm_pud_folded  mm_pud_folded
 
 #define pud_ERROR(e)	\
-	pr_err("%s:%d: bad pud %016llx.\n", __FILE__, __LINE__, pud_val(e))
+	pr_err("%s:%d: bad pud %" __PRIpte ".\n", __FILE__, __LINE__, __PRIpte_args(pud_val(e)))
 
 #define p4d_none(p4d)		(pgtable_l4_enabled() && !p4d_val(p4d))
 #define p4d_bad(p4d)		(pgtable_l4_enabled() && \
@@ -1117,7 +1117,7 @@ static inline bool mm_p4d_folded(const struct mm_struct *mm)
 #define mm_p4d_folded  mm_p4d_folded
 
 #define p4d_ERROR(e)	\
-	pr_err("%s:%d: bad p4d %016llx.\n", __FILE__, __LINE__, p4d_val(e))
+	pr_err("%s:%d: bad p4d %" __PRIpte ".\n", __FILE__, __LINE__, __PRIpte_args(p4d_val(e)))
 
 #define pgd_none(pgd)		(pgtable_l5_enabled() && !pgd_val(pgd))
 #define pgd_bad(pgd)		(pgtable_l5_enabled() && \
@@ -1238,7 +1238,7 @@ p4d_t *p4d_offset_lockless_folded(pgd_t *pgdp, pgd_t pgd, unsigned long addr)
 #endif  /* CONFIG_PGTABLE_LEVELS > 4 */
 
 #define pgd_ERROR(e)	\
-	pr_err("%s:%d: bad pgd %016llx.\n", __FILE__, __LINE__, pgd_val(e))
+	pr_err("%s:%d: bad pgd %" __PRIpte ".\n", __FILE__, __LINE__, __PRIpte_args(pgd_val(e)))
 
 #define pgd_set_fixmap(addr)	((pgd_t *)set_fixmap_offset(FIX_PGD, addr))
 #define pgd_clear_fixmap()	clear_fixmap(FIX_PGD)
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 21964a387bf8..9e44c84734f1 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -153,7 +153,7 @@ static void show_pte(unsigned long addr)
 		 vabits_actual, mm_to_pgd_phys(mm));
 	pgdp = pgd_offset(mm, addr);
 	pgd = pgdp_get(pgdp);
-	pr_alert("[%016lx] pgd=%016llx", addr, pgd_val(pgd));
+	pr_alert("[%016lx] pgd=%" __PRIpte, addr, __PRIpte_args(pgd_val(pgd)));
 
 	do {
 		p4d_t *p4dp, p4d;
@@ -166,19 +166,19 @@ static void show_pte(unsigned long addr)
 
 		p4dp = p4d_offset(pgdp, addr);
 		p4d = p4dp_get(p4dp);
-		pr_cont(", p4d=%016llx", p4d_val(p4d));
+		pr_cont(", p4d=%" __PRIpte, __PRIpte_args(p4d_val(p4d)));
 		if (p4d_none(p4d) || p4d_bad(p4d))
 			break;
 
 		pudp = pud_offset(p4dp, addr);
 		pud = pudp_get(pudp);
-		pr_cont(", pud=%016llx", pud_val(pud));
+		pr_cont(", pud=%" __PRIpte, __PRIpte_args(pud_val(pud)));
 		if (pud_none(pud) || pud_bad(pud))
 			break;
 
 		pmdp = pmd_offset(pudp, addr);
 		pmd = pmdp_get(pmdp);
-		pr_cont(", pmd=%016llx", pmd_val(pmd));
+		pr_cont(", pmd=%" __PRIpte, __PRIpte_args(pmd_val(pmd)));
 		if (pmd_none(pmd) || pmd_bad(pmd))
 			break;
 
@@ -187,7 +187,7 @@ static void show_pte(unsigned long addr)
 			break;
 
 		pte = __ptep_get(ptep);
-		pr_cont(", pte=%016llx", pte_val(pte));
+		pr_cont(", pte=%" __PRIpte, __PRIpte_args(pte_val(pte)));
 		pte_unmap(ptep);
 	} while(0);
 
-- 
2.43.0


