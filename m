Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DDFC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xk984xOoqHMYWzEeWbOiQPapcatMtu1dDjm87+skU/Y=; b=N31/1mHzWDkkinmTMU2rdTiTcr
	KtB45FEfUrcXZI9UffSSI6tgvMT5rhuQDB+tqdlcLQq0xWD6bhNqquClS1V8nUyFxkZdg0zTF5Myx
	+p2UUEZLeavvMA7pFeouvJ/EB1zU6/UyVquhsvGqo3tlTysBi6H1dCoebOCww+tXtauXCd5GAodP+
	xy7bEjTW7oWq1P/Id1lpIzyLTyHIXKmlTvspCBqHJI0LPwuAgLWxMeIm/Knj6iSd0yiHZCMQFpD60
	XFgCCCBwoyJULOcsvIZuUeRTRtPO5/4nD+BSvTUi3QGRNxK5VDU2/t+lfc0l4AfHjRCzjB5rB+BqN
	Kb7dzO5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDGF-00000009t0Y-3Dtv;
	Tue, 21 Jul 2026 16:24:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDGE-00000009szT-2tU3;
	Tue, 21 Jul 2026 16:24:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EF2A42446;
	Tue, 21 Jul 2026 16:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAEA1F00A3E;
	Tue, 21 Jul 2026 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651042;
	bh=Xk984xOoqHMYWzEeWbOiQPapcatMtu1dDjm87+skU/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OagJFoho19cpqfub1YzwifiMSzRiR5VDkq3B6CG5fhiGVNucRrJC9v/boWxUZ4IKX
	 x3HDSiSIeHuFOOQy6XsOuSLjb9UH6xir61/MHkon9lam+5gE5Sa0nF8aMp4ZsPwak4
	 atvmfVNHOgmY3KUPbJeyndZjS3lC6/PcYuyQ2GAC3deN9e0i98UH77TfAmHZEZL6Mx
	 Kqhl+ymRDX0urq264d8/ZXaI6mTPLwEgo8pg2Qp98TupRP8jSaWlVxcbrt6po5lmcA
	 NII7NONcyf3G4BB3sg9MFdexEV9HpcRvLR2sqIWtQNghuQJzMdxTN/NulqmVQ4EnjI
	 R3jz6uliLQd7g==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:26 +0300
Subject: [PATCH RFC 03/18] x86/mm/pat: replace x86-speficic pg_level with
 generic pgtable_level
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-3-2c1fc62306b3@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
To: linux-mm@kvack.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Brendan Jackman <jackmanb@google.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16-dev
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

change_page_attr() implementation uses x86-specific enum pg_level to
track page table levels.

In preparation to moving core parts of change_page_attr() to common
code, replace usage of enum pg_level and it's values with the generic
enum pgtable_level and the values it defines.

Extend the generic enum pgtable_level with PGTABLE_LEVEL_NONE and
PGTABLE_LEVEL_NUM to match the numeric values from enum pg_level. This
is safe because nothing relies on the numeric values of PGTABLE_LEVEL_*
constants.

No functional change intended.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c | 56 ++++++++++++++++++++++----------------------
 include/linux/pgtable.h      |  6 ++++-
 2 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 9382f1d6194f..328805933d4d 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -80,7 +80,7 @@ static inline pgprot_t cachemode2pgprot(enum page_cache_mode pcm)
 }
 
 #ifdef CONFIG_PROC_FS
-static unsigned long direct_pages_count[PG_LEVEL_NUM];
+static unsigned long direct_pages_count[PGTABLE_LEVEL_NUM];
 
 void update_page_count(int level, unsigned long pages)
 {
@@ -97,9 +97,9 @@ static void split_page_count(int level)
 
 	direct_pages_count[level]--;
 	if (system_state == SYSTEM_RUNNING) {
-		if (level == PG_LEVEL_2M)
+		if (level == PGTABLE_LEVEL_PMD)
 			count_vm_event(DIRECT_MAP_LEVEL2_SPLIT);
-		else if (level == PG_LEVEL_1G)
+		else if (level == PGTABLE_LEVEL_PUD)
 			count_vm_event(DIRECT_MAP_LEVEL3_SPLIT);
 	}
 	direct_pages_count[level - 1] += PTRS_PER_PTE;
@@ -109,9 +109,9 @@ static void collapse_page_count(int level)
 {
 	direct_pages_count[level]++;
 	if (system_state == SYSTEM_RUNNING) {
-		if (level == PG_LEVEL_2M)
+		if (level == PGTABLE_LEVEL_PMD)
 			count_vm_event(DIRECT_MAP_LEVEL2_COLLAPSE);
-		else if (level == PG_LEVEL_1G)
+		else if (level == PGTABLE_LEVEL_PUD)
 			count_vm_event(DIRECT_MAP_LEVEL3_COLLAPSE);
 	}
 	direct_pages_count[level - 1] -= PTRS_PER_PTE;
@@ -120,17 +120,17 @@ static void collapse_page_count(int level)
 void arch_report_meminfo(struct seq_file *m)
 {
 	seq_printf(m, "DirectMap4k:    %8lu kB\n",
-			direct_pages_count[PG_LEVEL_4K] << 2);
+			direct_pages_count[PGTABLE_LEVEL_PTE] << 2);
 #if defined(CONFIG_X86_64) || defined(CONFIG_X86_PAE)
 	seq_printf(m, "DirectMap2M:    %8lu kB\n",
-			direct_pages_count[PG_LEVEL_2M] << 11);
+			direct_pages_count[PGTABLE_LEVEL_PMD] << 11);
 #else
 	seq_printf(m, "DirectMap4M:    %8lu kB\n",
-			direct_pages_count[PG_LEVEL_2M] << 12);
+			direct_pages_count[PGTABLE_LEVEL_PMD] << 12);
 #endif
 	if (direct_gbpages)
 		seq_printf(m, "DirectMap1G:    %8lu kB\n",
-			direct_pages_count[PG_LEVEL_1G] << 20);
+			direct_pages_count[PGTABLE_LEVEL_PUD] << 20);
 }
 #else
 static inline void split_page_count(int level) { }
@@ -164,7 +164,7 @@ static inline void cpa_inc_4k_install(void)
 
 static inline void cpa_inc_lp_sameprot(int level)
 {
-	if (level == PG_LEVEL_1G)
+	if (level == PGTABLE_LEVEL_PUD)
 		cpa_1g_sameprot++;
 	else
 		cpa_2m_sameprot++;
@@ -172,7 +172,7 @@ static inline void cpa_inc_lp_sameprot(int level)
 
 static inline void cpa_inc_lp_preserved(int level)
 {
-	if (level == PG_LEVEL_1G)
+	if (level == PGTABLE_LEVEL_PUD)
 		cpa_1g_preserved++;
 	else
 		cpa_2m_preserved++;
@@ -577,7 +577,7 @@ static pgprotval_t protect_kernel_text_ro(unsigned long start,
 	 * so the protections for kernel text and identity mappings have to
 	 * be the same.
 	 */
-	if (lookup_address(start, &level) && (level != PG_LEVEL_4K))
+	if (lookup_address(start, &level) && (level != PGTABLE_LEVEL_PTE))
 		return _PAGE_RW;
 	return 0;
 }
@@ -721,14 +721,14 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
 	pud_t *pud;
 	pmd_t *pmd;
 
-	*level = PG_LEVEL_256T;
+	*level = PGTABLE_LEVEL_PGD;
 	*nx = false;
 	*rw = true;
 
 	if (pgd_none(*pgd))
 		return NULL;
 
-	*level = PG_LEVEL_512G;
+	*level = PGTABLE_LEVEL_P4D;
 	*nx |= pgd_flags(*pgd) & _PAGE_NX;
 	*rw &= !!(pgd_flags(*pgd) & _PAGE_RW);
 
@@ -739,7 +739,7 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
 	if (p4d_leaf(*p4d) || !p4d_present(*p4d))
 		return (pte_t *)p4d;
 
-	*level = PG_LEVEL_1G;
+	*level = PGTABLE_LEVEL_PUD;
 	*nx |= p4d_flags(*p4d) & _PAGE_NX;
 	*rw &= !!(p4d_flags(*p4d) & _PAGE_RW);
 
@@ -750,7 +750,7 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
 	if (pud_leaf(*pud) || !pud_present(*pud))
 		return (pte_t *)pud;
 
-	*level = PG_LEVEL_2M;
+	*level = PGTABLE_LEVEL_PMD;
 	*nx |= pud_flags(*pud) & _PAGE_NX;
 	*rw &= !!(pud_flags(*pud) & _PAGE_RW);
 
@@ -761,7 +761,7 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
 	if (pmd_leaf(*pmd) || !pmd_present(*pmd))
 		return (pte_t *)pmd;
 
-	*level = PG_LEVEL_4K;
+	*level = PGTABLE_LEVEL_PTE;
 	*nx |= pmd_flags(*pmd) & _PAGE_NX;
 	*rw &= !!(pmd_flags(*pmd) & _PAGE_RW);
 
@@ -849,9 +849,9 @@ pmd_t *lookup_pmd_address(unsigned long address)
 phys_addr_t slow_virt_to_phys(void *__virt_addr)
 {
 	unsigned long virt_addr = (unsigned long)__virt_addr;
+	enum pgtable_level level;
 	phys_addr_t phys_addr;
 	unsigned long offset;
-	enum pg_level level;
 	pte_t *pte;
 
 	pte = lookup_address(virt_addr, &level);
@@ -863,11 +863,11 @@ phys_addr_t slow_virt_to_phys(void *__virt_addr)
 	 * make 32-PAE kernel work correctly.
 	 */
 	switch (level) {
-	case PG_LEVEL_1G:
+	case PGTABLE_LEVEL_PUD:
 		phys_addr = (phys_addr_t)pud_pfn(*(pud_t *)pte) << PAGE_SHIFT;
 		offset = virt_addr & ~PUD_MASK;
 		break;
-	case PG_LEVEL_2M:
+	case PGTABLE_LEVEL_PMD:
 		phys_addr = (phys_addr_t)pmd_pfn(*(pmd_t *)pte) << PAGE_SHIFT;
 		offset = virt_addr & ~PMD_MASK;
 		break;
@@ -929,8 +929,8 @@ static int __should_split_large_page(pte_t *kpte, unsigned long address,
 {
 	unsigned long numpages, pmask, psize, lpaddr, pfn, old_pfn;
 	pgprot_t old_prot, new_prot, req_prot, chk_prot;
+	enum pgtable_level level;
 	pte_t new_pte, *tmp;
-	enum pg_level level;
 	bool nx, rw;
 
 	/*
@@ -942,12 +942,12 @@ static int __should_split_large_page(pte_t *kpte, unsigned long address,
 		return 1;
 
 	switch (level) {
-	case PG_LEVEL_2M:
+	case PGTABLE_LEVEL_PMD:
 		old_prot = pmd_pgprot(*(pmd_t *)kpte);
 		old_pfn = pmd_pfn(*(pmd_t *)kpte);
 		cpa_inc_2m_checked();
 		break;
-	case PG_LEVEL_1G:
+	case PGTABLE_LEVEL_PUD:
 		old_prot = pud_pgprot(*(pud_t *)kpte);
 		old_pfn = pud_pfn(*(pud_t *)kpte);
 		cpa_inc_1g_checked();
@@ -1148,7 +1148,7 @@ __split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
 	paravirt_alloc_pte(&init_mm, page_to_pfn(base));
 
 	switch (level) {
-	case PG_LEVEL_2M:
+	case PGTABLE_LEVEL_PMD:
 		ref_prot = pmd_pgprot(*(pmd_t *)kpte);
 		/*
 		 * Clear PSE (aka _PAGE_PAT) and move
@@ -1160,7 +1160,7 @@ __split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
 		lpinc = PAGE_SIZE;
 		break;
 
-	case PG_LEVEL_1G:
+	case PGTABLE_LEVEL_PUD:
 		ref_prot = pud_pgprot(*(pud_t *)kpte);
 		ref_pfn = pud_pfn(*(pud_t *)kpte);
 		pfninc = PMD_SIZE >> PAGE_SHIFT;
@@ -1311,7 +1311,7 @@ static int collapse_pmd_page(pmd_t *pmd, unsigned long addr,
 	}
 
 	if (virt_addr_valid(addr) && pfn_range_is_mapped(pfn, pfn + 1))
-		collapse_page_count(PG_LEVEL_2M);
+		collapse_page_count(PGTABLE_LEVEL_PMD);
 
 	return 1;
 }
@@ -1358,7 +1358,7 @@ static int collapse_pud_page(pud_t *pud, unsigned long addr,
 	set_pud(pud, pfn_pud(pfn, pmd_pgprot(first)));
 
 	if (virt_addr_valid(addr) && pfn_range_is_mapped(pfn, pfn + 1))
-		collapse_page_count(PG_LEVEL_1G);
+		collapse_page_count(PGTABLE_LEVEL_PUD);
 
 	return 1;
 }
@@ -1860,7 +1860,7 @@ static int __change_page_attr(struct cpa_data *cpa, int primary)
 	if (pte_none(old_pte))
 		return __cpa_process_fault(cpa, address, primary);
 
-	if (level == PG_LEVEL_4K) {
+	if (level == PGTABLE_LEVEL_PTE) {
 		pte_t new_pte;
 		pgprot_t old_prot = pte_pgprot(old_pte);
 		pgprot_t new_prot = pte_pgprot(old_pte);
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 2981e386da7b..3889bc2a1f76 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2295,16 +2295,20 @@ static inline bool arch_has_pfn_modify_check(void)
 typedef unsigned int pgtbl_mod_mask;
 
 enum pgtable_level {
-	PGTABLE_LEVEL_PTE = 0,
+	PGTABLE_LEVEL_NONE = 0,
+	PGTABLE_LEVEL_PTE,
 	PGTABLE_LEVEL_PMD,
 	PGTABLE_LEVEL_PUD,
 	PGTABLE_LEVEL_P4D,
 	PGTABLE_LEVEL_PGD,
+	PGTABLE_LEVEL_NUM,
 };
 
 static inline const char *pgtable_level_to_str(enum pgtable_level level)
 {
 	switch (level) {
+	case PGTABLE_LEVEL_NONE:
+		return "none";
 	case PGTABLE_LEVEL_PTE:
 		return "pte";
 	case PGTABLE_LEVEL_PMD:

-- 
2.53.0


