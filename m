Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D45C44536
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nokpUTK/BQEU2xPd8dil79b/pTUs86asyupxsitnFKA=; b=lbGU3LVfHbAXlJiFDER5BZp6mE
	AORJylzplmUkp9aJBUoN9Du3Fe2W/GaTkzJI5xkpsx0YPpHGFXETUbxMCymzhfwfdL2tIkD82NND0
	zx5tDZ/HwuS5HxCRVp2HsI71jsLcbjklgKSZZKxX0U1wpyBoaBSyL4pDgrRGj2pacSwLFKZpRqcw3
	oPBFsnLLHSdxEoSWItbGY/z6dP373MNDt5SuUU4cvqnQVzTlSEjfUA9AzHaMJwGwGjS/j3HTJqopL
	Lm8HwiQVR+n5PwqzlVWwV7jIEOD6Y3lO5J8GhoiJg+/ftMiU2MLAYTTAcK3mP5H7jKbDXXD/uevFW
	gadFNkYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDGv-00000009tn0-07vT;
	Tue, 21 Jul 2026 16:24:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDGt-00000009tll-3AS5;
	Tue, 21 Jul 2026 16:24:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F79F40E4F;
	Tue, 21 Jul 2026 16:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1032F1F00A3A;
	Tue, 21 Jul 2026 16:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651083;
	bh=nokpUTK/BQEU2xPd8dil79b/pTUs86asyupxsitnFKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mduyV/4oIfEViBoL6lriq5H4veut2axJNwNq2s8j+Qo/kcJQY2HEyGHhleoOmd1Ba
	 KqLtqTyZvyOcUE/AJKvW6Fvi+sOLhFoZYGyhft2SjmZUALxgwD5DGq9OsXZr8lT1+t
	 Z1NUg49kmKteh+uVkht2fdwI7NtwumvsJCfpA9k8YL5d/G4pidA3LDhwZQisFKj0WT
	 bJlJEAeJYy76RZjM+xZVDhcI3yxkOWWVkJLQMTUtiPeaY8q902iyg65RZ21W/j9hWZ
	 plSCPQAYE8Bab5QU90e8Xoo9DivS7xzxi6Pg0rG3OxFpbwABrQidREgO0VdToD8Had
	 qxbQhX+cRlHKQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:32 +0300
Subject: [PATCH RFC 09/18] x86/mm/pat: use a single locked lookup for PTE
 verification
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-9-2c1fc62306b3@kernel.org>
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

Currently both __should_split_large_page() and __split_large_page()
verify that the page table entry wasn't changed by another CPU while
pgd_lock was released.

pgd_lock must be released between __should_split_large_page() and
__split_large_page() because split of a large page requires allocation
of a new page table page.

Preallocating the page table page before checking if the large page
should be split allows running both __should_split_large_page() and
__split_large_page() inside the same critical section protected by
pgd_lock and allows dropping the duplicated lookup.

Move allocation of the page table before the call to
should_split_large_page() and pull out race-checking lookup into
cpa_handle_large_page().

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c | 89 ++++++++++++++++++++------------------------
 1 file changed, 40 insertions(+), 49 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index c2a72cd8b832..ef206ba6e254 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -60,6 +60,9 @@ struct cpa_split_data {
 	unsigned long	address;
 	pte_t		*kpte;
 	struct ptdesc	*ptdesc;
+	enum pgtable_level level;
+	bool		nx;
+	bool		rw;
 };
 
 enum cpa_warn {
@@ -883,19 +886,12 @@ static int __should_split_large_page(struct cpa_data *cpa,
 {
 	unsigned long numpages, pmask, psize, lpaddr, pfn, old_pfn;
 	pgprot_t old_prot, new_prot, req_prot, chk_prot;
+	enum pgtable_level level = sd->level;
 	unsigned long address = sd->address;
-	enum pgtable_level level;
 	pte_t *kpte = sd->kpte;
-	pte_t new_pte, *tmp;
-	bool nx, rw;
-
-	/*
-	 * Check for races, another CPU might have split this page
-	 * up already:
-	 */
-	tmp = _lookup_address_cpa(cpa, address, &level, &nx, &rw);
-	if (tmp != kpte)
-		return 1;
+	bool nx = sd->nx;
+	bool rw = sd->rw;
+	pte_t new_pte;
 
 	switch (level) {
 	case PGTABLE_LEVEL_PMD:
@@ -1030,16 +1026,10 @@ static int __should_split_large_page(struct cpa_data *cpa,
 static int should_split_large_page(struct cpa_data *cpa,
 				   struct cpa_split_data *sd)
 {
-	int do_split;
-
 	if (cpa->force_split)
 		return 1;
 
-	spin_lock(&pgd_lock);
-	do_split = __should_split_large_page(cpa, sd);
-	spin_unlock(&pgd_lock);
-
-	return do_split;
+	return __should_split_large_page(cpa, sd);
 }
 
 static void split_set_pte(struct cpa_data *cpa, pte_t *pte, unsigned long pfn,
@@ -1084,23 +1074,11 @@ static int __split_large_page(struct cpa_data *cpa, struct cpa_split_data *sd)
 	struct ptdesc *ptdesc = sd->ptdesc;
 	struct page *base = ptdesc_page(ptdesc);
 	pte_t *pbase = (pte_t *)page_address(base);
+	enum pgtable_level level = sd->level;
 	unsigned long address = sd->address;
 	pte_t *kpte = sd->kpte;
-	unsigned int i, level;
+	unsigned int i;
 	pgprot_t ref_prot;
-	bool nx, rw;
-	pte_t *tmp;
-
-	spin_lock(&pgd_lock);
-	/*
-	 * Check for races, another CPU might have split this page
-	 * up for us already:
-	 */
-	tmp = _lookup_address_cpa(cpa, address, &level, &nx, &rw);
-	if (tmp != kpte) {
-		spin_unlock(&pgd_lock);
-		return 1;
-	}
 
 	paravirt_alloc_pte(&init_mm, page_to_pfn(base));
 
@@ -1133,7 +1111,6 @@ static int __split_large_page(struct cpa_data *cpa, struct cpa_split_data *sd)
 		break;
 
 	default:
-		spin_unlock(&pgd_lock);
 		return 1;
 	}
 
@@ -1181,23 +1158,13 @@ static int __split_large_page(struct cpa_data *cpa, struct cpa_split_data *sd)
 	 * just split large page entry.
 	 */
 	flush_tlb_all();
-	spin_unlock(&pgd_lock);
 
 	return 0;
 }
 
 static int split_large_page(struct cpa_data *cpa, struct cpa_split_data *sd)
 {
-	spin_unlock(&cpa_lock);
-	sd->ptdesc = pagetable_alloc(GFP_KERNEL, 0);
-	spin_lock(&cpa_lock);
-	if (!sd->ptdesc)
-		return -ENOMEM;
-
-	if (__split_large_page(cpa, sd))
-		pagetable_free(sd->ptdesc);
-
-	return 0;
+	return __split_large_page(cpa, sd);
 }
 
 static int cpa_handle_large_page(struct cpa_data *cpa, pte_t *kpte,
@@ -1207,13 +1174,31 @@ static int cpa_handle_large_page(struct cpa_data *cpa, pte_t *kpte,
 		.address = address,
 		.kpte = kpte,
 	};
-	int do_split, err;
+	int do_split, ret = 1;
+	pte_t *tmp;
+
+	spin_unlock(&cpa_lock);
+	sd.ptdesc = pagetable_alloc(GFP_KERNEL, 0);
+	spin_lock(&cpa_lock);
+	if (!sd.ptdesc)
+		return -ENOMEM;
+
+	spin_lock(&pgd_lock);
+
+	/*
+	 * Check for races, another CPU might have split this page
+	 * up already:
+	 */
+	tmp = _lookup_address_cpa(cpa, address, &sd.level, &sd.nx, &sd.rw);
+	if (tmp != kpte)
+		goto out_free_ptdesc;
 
 	/*
 	 * Check, whether we can keep the large page intact
 	 * and just change the pte:
 	 */
 	do_split = should_split_large_page(cpa, &sd);
+	ret = do_split;
 	/*
 	 * When the range fits into the existing large page, no split is
 	 * required.
@@ -1221,16 +1206,22 @@ static int cpa_handle_large_page(struct cpa_data *cpa, pte_t *kpte,
 	 * cpa->numpages and cpa->pfn.
 	 */
 	if (do_split <= 0)
-		return do_split;
+		goto out_free_ptdesc;
 
 	/*
 	 * We have to split the large page:
 	 */
-	err = split_large_page(cpa, &sd);
-	if (err)
-		return err;
+	ret = split_large_page(cpa, &sd);
+	if (ret)
+		goto out_free_ptdesc;
 
+	spin_unlock(&pgd_lock);
 	return do_split;
+
+out_free_ptdesc:
+	spin_unlock(&pgd_lock);
+	pagetable_free(sd.ptdesc);
+	return ret;
 }
 
 static int collapse_pmd_page(pmd_t *pmd, unsigned long addr,

-- 
2.53.0


