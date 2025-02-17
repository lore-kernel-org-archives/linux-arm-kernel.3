Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0144BC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 14:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaLcawmwrUWcb66XB/Sg9CcZOpkFUpumQM1gp+Tb5Og=; b=zgVnNdhdjnmmmkeh0VgBVSdzVF
	LO1D6Eg04mHC/vM58OJn+G0TRxIKDcffNEHZTSYoblFoL3ZnnlZ6azZ90YJ/uVfG2xayDtDkuQQDJ
	8fnr+Vq3iSOonA5D+4Dm0YBKFIkyD506MBFznOcIlfHPylm6mb++PBEWfXUFqUUyERwFIbGvyvGGu
	VIiF8HY2b0EUGXBLhNnXI/ty0vREZ9EZszZUd3/Qj0Eeim4J32ElqtE5xWXvgu63J319TBD0fBmNb
	B8LFlaitahMjKa69s6xy4jyDQi+sxQWOxQQs4NsWlLGYBs2z5ETNBWNjzdeT2aL0rY3zyp1a3/VbS
	gL8sB+BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk22O-00000004pxr-0LTY;
	Mon, 17 Feb 2025 14:23:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1na-00000004mSK-2Eow
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:08:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A12A1A2D;
	Mon, 17 Feb 2025 06:08:57 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E02EF3F6A8;
	Mon, 17 Feb 2025 06:08:35 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/14] arm64/mm: Avoid barriers for invalid or userspace mappings
Date: Mon, 17 Feb 2025 14:07:59 +0000
Message-ID: <20250217140809.1702789-8-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217140809.1702789-1-ryan.roberts@arm.com>
References: <20250217140809.1702789-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_060838_676483_11A8373A 
X-CRM114-Status: GOOD (  22.19  )
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

__set_pte_complete(), set_pmd(), set_pud(), set_p4d() and set_pgd() are
used to write entries into pgtables. And they issue barriers (currently
dsb and isb) to ensure that the written values are observed by the table
walker prior to any program-order-future memory access to the mapped
location.

Over the years some of these functions have received optimizations: In
particular, commit 7f0b1bf04511 ("arm64: Fix barriers used for page
table modifications") made it so that the barriers were only emitted for
valid-kernel mappings for set_pte() (now __set_pte_complete()). And
commit 0795edaf3f1f ("arm64: pgtable: Implement p[mu]d_valid() and check
in set_p[mu]d()") made it so that set_pmd()/set_pud() only emitted the
barriers for valid mappings. set_p4d()/set_pgd() continue to emit the
barriers unconditionally.

This is all very confusing to the casual observer; surely the rules
should be invariant to the level? Let's change this so that every level
consistently emits the barriers only when setting valid, non-user
entries (both table and leaf).

It seems obvious that if it is ok to elide barriers all but valid kernel
mappings at pte level, it must also be ok to do this for leaf entries at
other levels: If setting an entry to invalid, a tlb maintenance
operation must surely follow to synchronise the TLB and this contains
the required barriers. If setting a valid user mapping, the previous
mapping must have been invalid and there must have been a TLB
maintenance operation (complete with barriers) to honour
break-before-make. So the worst that can happen is we take an extra
fault (which will imply the DSB + ISB) and conclude that there is
nothing to do. These are the arguments for doing this optimization at
pte level and they also apply to leaf mappings at other levels.

For table entries, the same arguments hold: If unsetting a table entry,
a TLB is required and this will emit the required barriers. If setting a
table entry, the previous value must have been invalid and the table
walker must already be able to observe that. Additionally the contents
of the pgtable being pointed to in the newly set entry must be visible
before the entry is written and this is enforced via smp_wmb() (dmb) in
the pgtable allocation functions and in __split_huge_pmd_locked(). But
this last part could never have been enforced by the barriers in
set_pXd() because they occur after updating the entry. So ultimately,
the wost that can happen by eliding these barriers for user table
entries is an extra fault.

I observe roughly the same number of page faults (107M) with and without
this change when compiling the kernel on Apple M2.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 34 ++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index e4b1946b261f..51128c2956f8 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -767,6 +767,19 @@ static inline bool in_swapper_pgdir(void *addr)
 	        ((unsigned long)swapper_pg_dir & PAGE_MASK);
 }
 
+static inline bool pmd_valid_not_user(pmd_t pmd)
+{
+	/*
+	 * User-space table entries always have (PXN && !UXN). All other
+	 * combinations indicate it's a table entry for kernel space.
+	 * Valid-not-user leaf entries follow the same rules as
+	 * pte_valid_not_user().
+	 */
+	if (pmd_table(pmd))
+		return !((pmd_val(pmd) & (PMD_TABLE_PXN | PMD_TABLE_UXN)) == PMD_TABLE_PXN);
+	return pte_valid_not_user(pmd_pte(pmd));
+}
+
 static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 {
 #ifdef __PAGETABLE_PMD_FOLDED
@@ -778,7 +791,7 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 
 	WRITE_ONCE(*pmdp, pmd);
 
-	if (pmd_valid(pmd)) {
+	if (pmd_valid_not_user(pmd)) {
 		dsb(ishst);
 		isb();
 	}
@@ -833,6 +846,7 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 #define pud_valid(pud)		pte_valid(pud_pte(pud))
 #define pud_user(pud)		pte_user(pud_pte(pud))
 #define pud_user_exec(pud)	pte_user_exec(pud_pte(pud))
+#define pud_valid_not_user(pud)	pmd_valid_not_user(pte_pmd(pud_pte(pud)))
 
 static inline bool pgtable_l4_enabled(void);
 
@@ -845,7 +859,7 @@ static inline void set_pud(pud_t *pudp, pud_t pud)
 
 	WRITE_ONCE(*pudp, pud);
 
-	if (pud_valid(pud)) {
+	if (pud_valid_not_user(pud)) {
 		dsb(ishst);
 		isb();
 	}
@@ -916,6 +930,7 @@ static inline bool mm_pud_folded(const struct mm_struct *mm)
 #define p4d_none(p4d)		(pgtable_l4_enabled() && !p4d_val(p4d))
 #define p4d_bad(p4d)		(pgtable_l4_enabled() && !(p4d_val(p4d) & P4D_TABLE_BIT))
 #define p4d_present(p4d)	(!p4d_none(p4d))
+#define p4d_valid_not_user(p4d)	pmd_valid_not_user(pte_pmd(p4d_pte(p4d)))
 
 static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 {
@@ -925,8 +940,11 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 	}
 
 	WRITE_ONCE(*p4dp, p4d);
-	dsb(ishst);
-	isb();
+
+	if (p4d_valid_not_user(p4d)) {
+		dsb(ishst);
+		isb();
+	}
 }
 
 static inline void p4d_clear(p4d_t *p4dp)
@@ -1043,6 +1061,7 @@ static inline bool mm_p4d_folded(const struct mm_struct *mm)
 #define pgd_none(pgd)		(pgtable_l5_enabled() && !pgd_val(pgd))
 #define pgd_bad(pgd)		(pgtable_l5_enabled() && !(pgd_val(pgd) & PGD_TABLE_BIT))
 #define pgd_present(pgd)	(!pgd_none(pgd))
+#define pgd_valid_not_user(pgd)	pmd_valid_not_user(pte_pmd(pgd_pte(pgd)))
 
 static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 {
@@ -1052,8 +1071,11 @@ static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 	}
 
 	WRITE_ONCE(*pgdp, pgd);
-	dsb(ishst);
-	isb();
+
+	if (pgd_valid_not_user(pgd)) {
+		dsb(ishst);
+		isb();
+	}
 }
 
 static inline void pgd_clear(pgd_t *pgdp)
-- 
2.43.0


