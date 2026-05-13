Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2067FCD484C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 04:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ILmpXtopRLPbAdJmkKRWdEfyEgQe48JK5xdWQ/oou1c=; b=sNReBb8jtq4007D9+by8uc7kv0
	FqwFdBqTaXvXcAufIz9nJ4zyUoXu4PprOpjB4px3xyq3ehYqHspmRfCvaZYTZEYc6eC1cv1DXpzTX
	CDBLMmvfbvpABLB8TLbkBkK1T3voYGvkxNgoIvlPtYVhgSqzJIYS+42k1JDYLaDGYcDFRJjxMXRXB
	FlDEVFA//MNJZnWJaR7eGaGYpIeouA3wCjJcgqQRiJ0NHZWmLarWXNth+qzBdrtd65+vFTxTSroRy
	u60Dr9vyx/xPB90uR8zIVw2iYJhzN0mFijFt/7qNVLfn/rtrlxvkMBkvOuoRb4VHNeuCET5CjAhMp
	z8g6baiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1VL-00000001F1Z-254g;
	Wed, 13 May 2026 04:47:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1VC-00000001Etu-2Co2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 04:47:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F3D4153B;
	Tue, 12 May 2026 21:47:16 -0700 (PDT)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.18.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C7183F7B4;
	Tue, 12 May 2026 21:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778647641; bh=nE2B6txq+G6J1DnWDY4MtjVn5yQsvc5RujCivGOJKhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LtmKpP9cKE1qV5sW3DA+rvF16uG8jRxLPJSmZsGdBfR0DQSryEZth4AszSlYSLkAS
	 gyIT8hchv4UYfL/Zy/kZxuIArk6BYD7ckkBAUz5Dr7p0sjHXGE/gZ/94wsfvY5tMVV
	 5wJ0qMK8B3ytnwb0TrnJcMT1EvJhM62KUM2v6DT4=
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
	Usama Arif <usama.arif@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC V2 10/14] arm64/mm: Abstract printing of pxd_val()
Date: Wed, 13 May 2026 10:15:43 +0530
Message-ID: <20260513044547.4128549-11-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513044547.4128549-1-anshuman.khandual@arm.com>
References: <20260513044547.4128549-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_214722_649393_F81A9919 
X-CRM114-Status: GOOD (  12.75  )
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
PTE values to use the new __PRIpxx format specifier and __PRIpxx_args()
macro to prepare the argument(s). When using D128 pgtables in future,
we can simply redefine __PRIpxx and __PTIpte_args().

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in RFC V2:

- Renamed __PRIpte as __PRIpxx per David

 arch/arm64/include/asm/pgtable-types.h |  3 +++
 arch/arm64/include/asm/pgtable.h       | 22 +++++++++++-----------
 arch/arm64/mm/fault.c                  | 10 +++++-----
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable-types.h b/arch/arm64/include/asm/pgtable-types.h
index 265e8301d7ba..920144ec64dc 100644
--- a/arch/arm64/include/asm/pgtable-types.h
+++ b/arch/arm64/include/asm/pgtable-types.h
@@ -11,6 +11,9 @@
 
 #include <asm/types.h>
 
+#define __PRIpxx		"016llx"
+#define __PRIpxx_args(val)	((u64)val)
+
 /*
  * Page Table Descriptor
  *
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index f876200d383e..4065b68e8d79 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -146,7 +146,7 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
 			  TLBF_NOBROADCAST | TLBF_NONOTIFY | TLBF_NOWALKCACHE)
 
 #define pte_ERROR(e)	\
-	pr_err("%s:%d: bad pte %016llx.\n", __FILE__, __LINE__, pte_val(e))
+	pr_err("%s:%d: bad pte %" __PRIpxx ".\n", __FILE__, __LINE__, __PRIpxx_args(pte_val(e)))
 
 #ifdef CONFIG_ARM64_PA_BITS_52
 static inline phys_addr_t __pte_to_phys(pte_t pte)
@@ -461,14 +461,14 @@ static inline void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep,
 	 * through an invalid entry).
 	 */
 	VM_WARN_ONCE(!pte_young(pte),
-		     "%s: racy access flag clearing: 0x%016llx -> 0x%016llx",
-		     __func__, pte_val(old_pte), pte_val(pte));
+		     "%s: racy access flag clearing: 0x%" __PRIpxx " -> 0x%" __PRIpxx,
+		     __func__, __PRIpxx_args(pte_val(old_pte)), __PRIpxx_args(pte_val(pte)));
 	VM_WARN_ONCE(pte_write(old_pte) && !pte_dirty(pte),
-		     "%s: racy dirty state clearing: 0x%016llx -> 0x%016llx",
-		     __func__, pte_val(old_pte), pte_val(pte));
+		     "%s: racy dirty state clearing: 0x%" __PRIpxx " -> 0x%" __PRIpxx,
+		     __func__, __PRIpxx_args(pte_val(old_pte)), __PRIpxx_args(pte_val(pte)));
 	VM_WARN_ONCE(!pgattr_change_is_safe(pte_val(old_pte), pte_val(pte)),
-		     "%s: unsafe attribute change: 0x%016llx -> 0x%016llx",
-		     __func__, pte_val(old_pte), pte_val(pte));
+		     "%s: unsafe attribute change: 0x%" __PRIpxx " -> 0x%" __PRIpxx,
+		     __func__, __PRIpxx_args(pte_val(old_pte)), __PRIpxx_args(pte_val(pte)));
 }
 
 static inline void __sync_cache_and_tags(pte_t pte, unsigned int nr_pages)
@@ -905,7 +905,7 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 #if CONFIG_PGTABLE_LEVELS > 2
 
 #define pmd_ERROR(e)	\
-	pr_err("%s:%d: bad pmd %016llx.\n", __FILE__, __LINE__, pmd_val(e))
+	pr_err("%s:%d: bad pmd %" __PRIpxx ".\n", __FILE__, __LINE__, __PRIpxx_args(pmd_val(e)))
 
 #define pud_none(pud)		(!pud_val(pud))
 #define pud_bad(pud)		((pud_val(pud) & PUD_TYPE_MASK) != \
@@ -1000,7 +1000,7 @@ static inline bool mm_pud_folded(const struct mm_struct *mm)
 #define mm_pud_folded  mm_pud_folded
 
 #define pud_ERROR(e)	\
-	pr_err("%s:%d: bad pud %016llx.\n", __FILE__, __LINE__, pud_val(e))
+	pr_err("%s:%d: bad pud %" __PRIpxx ".\n", __FILE__, __LINE__, __PRIpxx_args(pud_val(e)))
 
 #define p4d_none(p4d)		(pgtable_l4_enabled() && !p4d_val(p4d))
 #define p4d_bad(p4d)		(pgtable_l4_enabled() && \
@@ -1128,7 +1128,7 @@ static inline bool mm_p4d_folded(const struct mm_struct *mm)
 #define mm_p4d_folded  mm_p4d_folded
 
 #define p4d_ERROR(e)	\
-	pr_err("%s:%d: bad p4d %016llx.\n", __FILE__, __LINE__, p4d_val(e))
+	pr_err("%s:%d: bad p4d %" __PRIpxx ".\n", __FILE__, __LINE__, __PRIpxx_args(p4d_val(e)))
 
 #define pgd_none(pgd)		(pgtable_l5_enabled() && !pgd_val(pgd))
 #define pgd_bad(pgd)		(pgtable_l5_enabled() && \
@@ -1257,7 +1257,7 @@ p4d_t *p4d_offset_lockless_folded(pgd_t *pgdp, pgd_t pgd, unsigned long addr)
 #endif  /* CONFIG_PGTABLE_LEVELS > 4 */
 
 #define pgd_ERROR(e)	\
-	pr_err("%s:%d: bad pgd %016llx.\n", __FILE__, __LINE__, pgd_val(e))
+	pr_err("%s:%d: bad pgd %" __PRIpxx ".\n", __FILE__, __LINE__, __PRIpxx_args(pgd_val(e)))
 
 #define pgd_set_fixmap(addr)	((pgd_t *)set_fixmap_offset(FIX_PGD, addr))
 #define pgd_clear_fixmap()	clear_fixmap(FIX_PGD)
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index bce191d16090..58d0670b6a43 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -154,7 +154,7 @@ static void show_pte(unsigned long addr)
 		 vabits_actual, mm_to_pgd_phys(mm));
 	pgdp = pgd_offset(mm, addr);
 	pgd = pgdp_get(pgdp);
-	pr_alert("[%016lx] pgd=%016llx", addr, pgd_val(pgd));
+	pr_alert("[%016lx] pgd=%" __PRIpxx, addr, __PRIpxx_args(pgd_val(pgd)));
 
 	do {
 		p4d_t *p4dp, p4d;
@@ -167,19 +167,19 @@ static void show_pte(unsigned long addr)
 
 		p4dp = p4d_offset(pgdp, addr);
 		p4d = p4dp_get(p4dp);
-		pr_cont(", p4d=%016llx", p4d_val(p4d));
+		pr_cont(", p4d=%" __PRIpxx, __PRIpxx_args(p4d_val(p4d)));
 		if (p4d_none(p4d) || p4d_bad(p4d))
 			break;
 
 		pudp = pud_offset(p4dp, addr);
 		pud = pudp_get(pudp);
-		pr_cont(", pud=%016llx", pud_val(pud));
+		pr_cont(", pud=%" __PRIpxx, __PRIpxx_args(pud_val(pud)));
 		if (pud_none(pud) || pud_bad(pud))
 			break;
 
 		pmdp = pmd_offset(pudp, addr);
 		pmd = pmdp_get(pmdp);
-		pr_cont(", pmd=%016llx", pmd_val(pmd));
+		pr_cont(", pmd=%" __PRIpxx, __PRIpxx_args(pmd_val(pmd)));
 		if (pmd_none(pmd) || pmd_bad(pmd))
 			break;
 
@@ -188,7 +188,7 @@ static void show_pte(unsigned long addr)
 			break;
 
 		pte = __ptep_get(ptep);
-		pr_cont(", pte=%016llx", pte_val(pte));
+		pr_cont(", pte=%" __PRIpxx, __PRIpxx_args(pte_val(pte)));
 		pte_unmap(ptep);
 	} while(0);
 
-- 
2.43.0


