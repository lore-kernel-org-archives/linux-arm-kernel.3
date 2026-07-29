Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7490DC54F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXfKR0nPRowkqfwng0/JqAKBUWBP6k7mh7YMBMoDUa4=; b=FwKBwJO8foriH26N5bm263zsTv
	d0Nj30XwC5lR930PrTc3MPhObBtxO12HZIPGrqxjNOCpZSBUgHZiL0N1d+k3NMK7aWvgqwGa+bKqU
	Sro6bAV6gTRv/5iHgk2sKnhIa2UiY1Cqqg2ssHvX4nkUdu8JTfo6MToEIb9bCZrD9OQP1uLkTVWQm
	22L9ga0eg+DhocVAF18sKeBq97lEuf0IuCHWKykZNhN5d8LI/SoYg3zi5DRw1jjPWVxCBaKxHhB4G
	pmp7XKnR4F713d94MufLPdJKDxPnf+mxbQcPxrDKyWu7LAer1GkzUY+aXnFaUd7Dgo63vmzhC7SIg
	652e1MBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3MD-00000007tWL-0252;
	Wed, 29 Jul 2026 12:25:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3M0-00000007tN6-0JWI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:25:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B0FC1688;
	Wed, 29 Jul 2026 05:25:38 -0700 (PDT)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B7CA03F66F;
	Wed, 29 Jul 2026 05:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785327942; bh=D8njUR+w2v+ndiG5KM/iOINKA++RZQNA50z7qf0KbP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q69ENXoqiIBHn6/l0E0y3VJVTEIxcaEzGpXLTpzhhxWEKiil8Yl0wkGY729L3ibAE
	 sTDaFsU7xMGX3Dm+zHJOAIH7WcqYS+s+vXMCmS28R43/go9/2y2fkWdkIKAmC5s7KO
	 Y4yezjZos5Gr+KnmpMA+33p7DaNp9fDrFTbev4xc=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/17] arm64/mm: Route all pgtable atomics to central helpers
Date: Wed, 29 Jul 2026 17:54:43 +0530
Message-ID: <20260729122452.3797443-9-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729122452.3797443-1-anshuman.khandual@arm.com>
References: <20260729122452.3797443-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_052544_207012_DE23AB2E 
X-CRM114-Status: GOOD (  13.76  )
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

Route all cmpxchg() operations performed on various page table entries to a
new ptval_cmpxchg_relaxed() helper. Similarly route all xchg() operations
performed on page table entries to a new ptval_xchg_relaxed() helper.

Currently these helpers just forward to the same APIs that were previously
called direct, but in future we will change the routing for D128 which is
too long to use the standard APIs.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 26 +++++++++++++++++++-------
 arch/arm64/mm/fault.c            |  2 +-
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 1106977e0ef0..4efcacec6f01 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -87,6 +87,17 @@ static inline void arch_leave_lazy_mmu_mode(void)
 #define ptval_get(x)		READ_ONCE(x)
 #define ptval_set(x, val)	WRITE_ONCE(x, val)
 
+static inline ptval_t ptval_cmpxchg_relaxed(ptval_t *ptep, ptval_t old,
+					      ptval_t new)
+{
+	return cmpxchg_relaxed(ptep, old, new);
+}
+
+static inline ptval_t ptval_xchg_relaxed(ptval_t *ptep, ptval_t new)
+{
+	return xchg_relaxed(ptep, new);
+}
+
 #define pmdp_get pmdp_get
 static inline pmd_t pmdp_get(pmd_t *pmdp)
 {
@@ -1340,8 +1351,8 @@ static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
 	do {
 		old_pte = pte;
 		pte = pte_mkold(pte);
-		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
-					       pte_val(old_pte), pte_val(pte));
+		pte_val(pte) = ptval_cmpxchg_relaxed(&pte_val(*ptep),
+						      pte_val(old_pte), pte_val(pte));
 	} while (pte_val(pte) != pte_val(old_pte));
 
 	return pte_young(pte);
@@ -1383,7 +1394,7 @@ static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
 					       pte_t *ptep,
 					       unsigned long pgsize)
 {
-	pte_t pte = __pte(xchg_relaxed(&pte_val(*ptep), 0));
+	pte_t pte = __pte(ptval_xchg_relaxed(&pte_val(*ptep), 0));
 
 	switch (pgsize) {
 	case PAGE_SIZE:
@@ -1459,7 +1470,7 @@ static inline void ___ptep_set_wrprotect(struct mm_struct *mm,
 	do {
 		old_pte = pte;
 		pte = pte_wrprotect(pte);
-		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
+		pte_val(pte) = ptval_cmpxchg_relaxed(&pte_val(*ptep),
 					       pte_val(old_pte), pte_val(pte));
 	} while (pte_val(pte) != pte_val(old_pte));
 }
@@ -1497,7 +1508,7 @@ static inline void __clear_young_dirty_pte(struct vm_area_struct *vma,
 		if (flags & CYDP_CLEAR_DIRTY)
 			pte = pte_mkclean(pte);
 
-		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
+		pte_val(pte) = ptval_cmpxchg_relaxed(&pte_val(*ptep),
 					       pte_val(old_pte), pte_val(pte));
 	} while (pte_val(pte) != pte_val(old_pte));
 }
@@ -1536,7 +1547,7 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp, pmd_t pmd)
 {
 	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
-	return __pmd(xchg_relaxed(&pmd_val(*pmdp), pmd_val(pmd)));
+	return __pmd(ptval_xchg_relaxed(&pmd_val(*pmdp), pmd_val(pmd)));
 }
 #endif
 
@@ -1863,7 +1874,8 @@ static inline bool ptep_try_set(pte_t *ptep, pte_t new_pte)
 {
 	pteval_t old = 0;
 
-	if (!try_cmpxchg(&pte_val(*ptep), &old, pte_val(new_pte)))
+	old = ptval_cmpxchg_relaxed(&pte_val(*ptep), old, pte_val(new_pte));
+	if (old != 0)
 		return false;
 
 	/*
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index fca716ed4513..7aff70c5479e 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -234,7 +234,7 @@ int __ptep_set_access_flags_anysz(struct vm_area_struct *vma,
 		pteval ^= PTE_RDONLY;
 		pteval |= pte_val(entry);
 		pteval ^= PTE_RDONLY;
-		pteval = cmpxchg_relaxed(&pte_val(*ptep), old_pteval, pteval);
+		pteval = ptval_cmpxchg_relaxed(&pte_val(*ptep), old_pteval, pteval);
 	} while (pteval != old_pteval);
 
 	/*
-- 
2.43.0


