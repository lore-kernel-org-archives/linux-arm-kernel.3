Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC278EFB7FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 05:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxiVFUuLeDkSxqT3ivdHS3XEaH5+5qZe/ROqDJWk8+A=; b=wLX3lB9HCMIKEztv5dJxgM/Z1W
	2Ks1McKEarc76TDDdBtwrGiRddYQnjoc8HR94HQigalw4KbWXjuoIL94Rzucj8LZ1sVH0Vp9vnxjd
	RWRKSapfmmZeWIRCaE7zrEgMJxmmbEY9Y7hH75HRztfb8GJAUN1eE7uXfuy0r7/HGltJm8aZwGaF+
	0L48sSUcJyCS9lTuV/5WwlUSO5E/q61sfkcbGU7ZHwUdZFlYDEzKg3aXtUV+sryjckt9N53sXXKi4
	pHTrkOkp0lxD0nV3cdaegPfD5yOOFiEQ2jlpF85Kknr4HQpaHBMYvdWNB+L47u9/mk3K4DPByyIdB
	pwmaVCaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vukjO-00000001Sl3-0cp7;
	Tue, 24 Feb 2026 05:13:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vukjK-00000001Si9-3JMw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 05:13:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDB95497;
	Mon, 23 Feb 2026 21:12:59 -0800 (PST)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.18.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C46A93F7BD;
	Mon, 23 Feb 2026 21:13:01 -0800 (PST)
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
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com
Subject: [RFC V1 08/16] arm64/mm: Convert READ_ONCE() as pgdp_get() while accessing PGD
Date: Tue, 24 Feb 2026 10:41:45 +0530
Message-ID: <20260224051153.3150613-9-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224051153.3150613-1-anshuman.khandual@arm.com>
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_211306_922743_DDB24C47 
X-CRM114-Status: GOOD (  12.90  )
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

Convert all READ_ONCE() based PGD accesses as pgdp_get() instead which will
support both D64 and D128 translation regime going forward.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: kasan-dev@googlegroups.com
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 12 ++----------
 arch/arm64/mm/fault.c            |  2 +-
 arch/arm64/mm/hugetlbpage.c      |  2 +-
 arch/arm64/mm/kasan_init.c       |  2 +-
 arch/arm64/mm/mmu.c              | 25 ++++++++++++++++++++++---
 arch/arm64/mm/pageattr.c         |  2 +-
 arch/arm64/mm/trans_pgd.c        |  4 ++--
 7 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 24ea4e04e9a1..257af1c3015d 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1119,12 +1119,7 @@ static inline p4d_t *pgd_to_folded_p4d(pgd_t *pgdp, unsigned long addr)
 	return (p4d_t *)PTR_ALIGN_DOWN(pgdp, PAGE_SIZE) + p4d_index(addr);
 }
 
-static inline phys_addr_t p4d_offset_phys(pgd_t *pgdp, unsigned long addr)
-{
-	BUG_ON(!pgtable_l5_enabled());
-
-	return pgd_page_paddr(READ_ONCE(*pgdp)) + p4d_index(addr) * sizeof(p4d_t);
-}
+phys_addr_t p4d_offset_phys(pgd_t *pgdp, unsigned long addr);
 
 static inline
 p4d_t *p4d_offset_lockless(pgd_t *pgdp, pgd_t pgd, unsigned long addr)
@@ -1135,10 +1130,7 @@ p4d_t *p4d_offset_lockless(pgd_t *pgdp, pgd_t pgd, unsigned long addr)
 }
 #define p4d_offset_lockless p4d_offset_lockless
 
-static inline p4d_t *p4d_offset(pgd_t *pgdp, unsigned long addr)
-{
-	return p4d_offset_lockless(pgdp, READ_ONCE(*pgdp), addr);
-}
+p4d_t *p4d_offset(pgd_t *pgdp, unsigned long addr);
 
 static inline p4d_t *p4d_set_fixmap(unsigned long addr)
 {
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index f41f4c628d22..7bb14765a98d 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -152,7 +152,7 @@ static void show_pte(unsigned long addr)
 		 mm == &init_mm ? "swapper" : "user", PAGE_SIZE / SZ_1K,
 		 vabits_actual, mm_to_pgd_phys(mm));
 	pgdp = pgd_offset(mm, addr);
-	pgd = READ_ONCE(*pgdp);
+	pgd = pgdp_get(pgdp);
 	pr_alert("[%016lx] pgd=%016llx", addr, pgd_val(pgd));
 
 	do {
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 15241307baec..ccf08ba06a48 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -284,7 +284,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 	pmd_t *pmdp, pmd;
 
 	pgdp = pgd_offset(mm, addr);
-	if (!pgd_present(READ_ONCE(*pgdp)))
+	if (!pgd_present(pgdp_get(pgdp)))
 		return NULL;
 
 	p4dp = p4d_offset(pgdp, addr);
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index e50c40162bce..d05c16cfa5aa 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -102,7 +102,7 @@ static pud_t *__init kasan_pud_offset(p4d_t *p4dp, unsigned long addr, int node,
 static p4d_t *__init kasan_p4d_offset(pgd_t *pgdp, unsigned long addr, int node,
 				      bool early)
 {
-	if (pgd_none(READ_ONCE(*pgdp))) {
+	if (pgd_none(pgdp_get(pgdp))) {
 		phys_addr_t p4d_phys = early ?
 				__pa_symbol(kasan_early_shadow_p4d)
 					: kasan_alloc_zeroed_page(node);
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 16ae11b29f66..bcf32d1a92de 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -420,7 +420,7 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 {
 	int ret;
 	unsigned long next;
-	pgd_t pgd = READ_ONCE(*pgdp);
+	pgd_t pgd = pgdp_get(pgdp);
 	p4d_t *p4dp;
 
 	if (pgd_none(pgd)) {
@@ -1567,7 +1567,7 @@ static void unmap_hotplug_range(unsigned long addr, unsigned long end,
 	do {
 		next = pgd_addr_end(addr, end);
 		pgdp = pgd_offset_k(addr);
-		pgd = READ_ONCE(*pgdp);
+		pgd = pgdp_get(pgdp);
 		if (pgd_none(pgd))
 			continue;
 
@@ -1742,7 +1742,7 @@ static void free_empty_tables(unsigned long addr, unsigned long end,
 	do {
 		next = pgd_addr_end(addr, end);
 		pgdp = pgd_offset_k(addr);
-		pgd = READ_ONCE(*pgdp);
+		pgd = pgdp_get(pgdp);
 		if (pgd_none(pgd))
 			continue;
 
@@ -2275,4 +2275,23 @@ pud_t *pud_offset(p4d_t *p4dp, unsigned long addr)
 	return pud_offset_lockless(p4dp, p4d, addr);
 }
 #endif
+
+#if CONFIG_PGTABLE_LEVELS > 4
+phys_addr_t p4d_offset_phys(pgd_t *pgdp, unsigned long addr)
+{
+	pgd_t pgd = pgdp_get(pgdp);
+
+	BUG_ON(!pgtable_l5_enabled());
+
+	return pgd_page_paddr(pgd) + p4d_index(addr) * sizeof(p4d_t);
+}
+
+p4d_t *p4d_offset(pgd_t *pgdp, unsigned long addr)
+{
+	pgd_t pgd = pgdp_get(pgdp);
+
+	return p4d_offset_lockless(pgdp, pgd, addr);
+}
+#endif
+
 #endif
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index b45190507e59..0928946a9b19 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -393,7 +393,7 @@ bool kernel_page_present(struct page *page)
 	unsigned long addr = (unsigned long)page_address(page);
 
 	pgdp = pgd_offset_k(addr);
-	if (pgd_none(READ_ONCE(*pgdp)))
+	if (pgd_none(pgdp_get(pgdp)))
 		return false;
 
 	p4dp = p4d_offset(pgdp, addr);
diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
index 75f0a6a5a43a..a3a48c88e05c 100644
--- a/arch/arm64/mm/trans_pgd.c
+++ b/arch/arm64/mm/trans_pgd.c
@@ -162,7 +162,7 @@ static int copy_p4d(struct trans_pgd_info *info, pgd_t *dst_pgdp,
 	unsigned long next;
 	unsigned long addr = start;
 
-	if (pgd_none(READ_ONCE(*dst_pgdp))) {
+	if (pgd_none(pgdp_get(dst_pgdp))) {
 		dst_p4dp = trans_alloc(info);
 		if (!dst_p4dp)
 			return -ENOMEM;
@@ -192,7 +192,7 @@ static int copy_page_tables(struct trans_pgd_info *info, pgd_t *dst_pgdp,
 	dst_pgdp = pgd_offset_pgd(dst_pgdp, start);
 	do {
 		next = pgd_addr_end(addr, end);
-		if (pgd_none(READ_ONCE(*src_pgdp)))
+		if (pgd_none(pgdp_get(src_pgdp)))
 			continue;
 		if (copy_p4d(info, dst_pgdp, src_pgdp, addr, next))
 			return -ENOMEM;
-- 
2.43.0


