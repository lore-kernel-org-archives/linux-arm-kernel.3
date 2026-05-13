Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397E5CD484C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 04:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4W0ksk2N6Sxx4T5iD7tqAk5YQ1Y0ArLsN/Knf2DuCL8=; b=NHuvnr46a5DRmmR/+pwUhQnVeR
	COC5EmfmlZiqYbm5q/mZP8bl438ISVN3sy4/83CFQCP60Np2tRXfKamCUsrgm4s3PI4M0CYDIdykS
	rPbWO1zvbN37OWFijc/r455WrpXTUtsg9ixoQX+iTs7Hu4lR82o4BSlRBseeY/8mTeNUUx/m5xeJc
	Bev7JlzqgXXSrXvX+3VHWJc3REflrbTPXdAGKG69i2pqsn5ai6h2gegvW30d5NpRKkk3q04CtF4kx
	808DGezDfqxOaucdvHzhUKHQDvuD0djvDbG0C2sVmj3xtd2RPVygDMFC+3xsgBD+vyXviIPVDOMZ7
	YctK36Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1Uv-00000001Ehw-0sw1;
	Wed, 13 May 2026 04:47:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1Ur-00000001Efd-1naK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 04:47:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB10E1CE0;
	Tue, 12 May 2026 21:46:55 -0700 (PDT)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.18.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E9A343F7B4;
	Tue, 12 May 2026 21:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778647620; bh=/GMPc1AS+V+v7u9/Jk3AwDNanWjzLJC2yvA5U4is97w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=if20+fKxOp+HGZ9DVFqI3N11g3mzKyuHRrvDN8t0MQ3KFfdBdiiEO5bAf62FSaxDO
	 MPU02UKq4gLzH0A2mtyGLn/s3gOQOtU72EVcgUkL6r5TM+RbUegjq1KZ9myWHkkpWe
	 tQROjEgSz9oFAZXZOO3p8BRsy4a7HETbgrzlhqqU=
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
Subject: [RFC V2 07/14] arm64/mm: Route all pgtable reads via pxxval_get()
Date: Wed, 13 May 2026 10:15:40 +0530
Message-ID: <20260513044547.4128549-8-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513044547.4128549-1-anshuman.khandual@arm.com>
References: <20260513044547.4128549-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_214701_549173_B7CFBA1F 
X-CRM114-Status: GOOD (  12.85  )
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

Define arm64 platform specific implementations for new pXdp_get() helpers.
These resolve into READ_ONCE(), thus ensuring required single copy atomic
semantics for the page table entry reads.

In future this infrastructure can be used for D128 to maintain single copy
atomicity semantics with inline asm blocks.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in RFC V2:

- Renamed all ptdesc_ instances as pxxval_ instead
- Moved arm64 pgtable header READ_ONCE() replacements here in this patch

 arch/arm64/include/asm/pgtable.h | 38 +++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index cefe8ab86acd..72da582e8d12 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -84,6 +84,32 @@ static inline void arch_leave_lazy_mmu_mode(void)
 	arch_flush_lazy_mmu_mode();
 }
 
+#define pxxval_get(x)		READ_ONCE(x)
+
+#define pmdp_get pmdp_get
+static inline pmd_t pmdp_get(pmd_t *pmdp)
+{
+	return pxxval_get(*pmdp);
+}
+
+#define pudp_get pudp_get
+static inline pud_t pudp_get(pud_t *pudp)
+{
+	return pxxval_get(*pudp);
+}
+
+#define p4dp_get p4dp_get
+static inline p4d_t p4dp_get(p4d_t *p4dp)
+{
+	return pxxval_get(*p4dp);
+}
+
+#define pgdp_get pgdp_get
+static inline pgd_t pgdp_get(pgd_t *pgdp)
+{
+	return pxxval_get(*pgdp);
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 
@@ -380,7 +406,7 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
 
 static inline pte_t __ptep_get(pte_t *ptep)
 {
-	return READ_ONCE(*ptep);
+	return pxxval_get(*ptep);
 }
 
 extern void __sync_icache_dcache(pte_t pteval);
@@ -1011,7 +1037,7 @@ static inline phys_addr_t pud_offset_phys(p4d_t *p4dp, unsigned long addr)
 {
 	BUG_ON(!pgtable_l4_enabled());
 
-	return p4d_page_paddr(READ_ONCE(*p4dp)) + pud_index(addr) * sizeof(pud_t);
+	return p4d_page_paddr(p4dp_get(p4dp)) + pud_index(addr) * sizeof(pud_t);
 }
 
 static inline
@@ -1025,7 +1051,7 @@ pud_t *pud_offset_lockless(p4d_t *p4dp, p4d_t p4d, unsigned long addr)
 
 static inline pud_t *pud_offset(p4d_t *p4dp, unsigned long addr)
 {
-	return pud_offset_lockless(p4dp, READ_ONCE(*p4dp), addr);
+	return pud_offset_lockless(p4dp, p4dp_get(p4dp), addr);
 }
 #define pud_offset	pud_offset
 
@@ -1134,7 +1160,7 @@ static inline phys_addr_t p4d_offset_phys(pgd_t *pgdp, unsigned long addr)
 {
 	BUG_ON(!pgtable_l5_enabled());
 
-	return pgd_page_paddr(READ_ONCE(*pgdp)) + p4d_index(addr) * sizeof(p4d_t);
+	return pgd_page_paddr(pgdp_get(pgdp)) + p4d_index(addr) * sizeof(p4d_t);
 }
 
 static inline
@@ -1148,7 +1174,7 @@ p4d_t *p4d_offset_lockless(pgd_t *pgdp, pgd_t pgd, unsigned long addr)
 
 static inline p4d_t *p4d_offset(pgd_t *pgdp, unsigned long addr)
 {
-	return p4d_offset_lockless(pgdp, READ_ONCE(*pgdp), addr);
+	return p4d_offset_lockless(pgdp, pgdp_get(pgdp), addr);
 }
 
 static inline p4d_t *p4d_set_fixmap(unsigned long addr)
@@ -1346,7 +1372,7 @@ static inline bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp)
 {
 	/* Operation applies to PMD table entry only if FEAT_HAFT is enabled */
-	VM_WARN_ON(pmd_table(READ_ONCE(*pmdp)) && !system_supports_haft());
+	VM_WARN_ON(pmd_table(pmdp_get(pmdp)) && !system_supports_haft());
 	return __ptep_test_and_clear_young(vma, address, (pte_t *)pmdp);
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
-- 
2.43.0


