Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9FCC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 05:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmj4Hc3yqg0X1p4niapwdjvDbElR2NYLcMUUNz8Td74=; b=nA3o+rSSq0i09wGl9v3i7nKwMW
	or/eNb0m676s1/TUNfahTGixBc5Bz0wqG85mKowzLLs7p84ZfxrZ2bXq6usceKulxlpN5+c1b++kH
	L1yQ0Es4rpg1NoWKcVuSP811+ll6JOv+U6RNWIHe0Uyd4i1XiB72O085C5+BKKoDL5Hb4910UCmS2
	0dy1qi6vv8jVOms4hcV/HaExJV1hvswOezjXrjJBm8fzEYMWBspgXqozf840yXtUtr7Wi6w9MyQDR
	L88/jC6yMiQVbkbz6XSPbkWIf1z4csG35RgsIdqzbn0ZeR+6ifuIfXnfFrZWsH75D/wzDXE3rLGlT
	fZXZ6eVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1fD1-0000000GTkM-20uE;
	Mon, 07 Apr 2025 05:39:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1f5B-0000000GSan-1iQ8;
	Mon, 07 Apr 2025 05:31:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C73871BB0;
	Sun,  6 Apr 2025 22:31:41 -0700 (PDT)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.42.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA4633F6A8;
	Sun,  6 Apr 2025 22:31:33 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: mark.rutland@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH V2 2/3] mm/ptdump: Split effective_prot() into level specific callbacks
Date: Mon,  7 Apr 2025 11:01:12 +0530
Message-Id: <20250407053113.746295-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407053113.746295-1-anshuman.khandual@arm.com>
References: <20250407053113.746295-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_223141_530596_B5A40772 
X-CRM114-Status: GOOD (  14.03  )
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

Last argument in effective_prot() is u64 assuming pxd_val() returned value
(all page table levels) is 64 bit. pxd_val() is very platform specific and
its type should not be assumed in generic MM.

Split effective_prot() into individual page table level specific callbacks
which accepts corresponding pxd_t argument instead and then the subscribing
platform (only x86) just derive pxd_val() from the entries as required and
proceed as earlier.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-mm@kvack.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/x86/mm/dump_pagetables.c | 32 +++++++++++++++++++++++++++++++-
 include/linux/ptdump.h        |  6 +++++-
 mm/ptdump.c                   | 20 ++++++++++----------
 3 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
index 2e1c2d006ace..a4700ef6eb64 100644
--- a/arch/x86/mm/dump_pagetables.c
+++ b/arch/x86/mm/dump_pagetables.c
@@ -266,6 +266,32 @@ static void effective_prot(struct ptdump_state *pt_st, int level, u64 val)
 	st->prot_levels[level] = effective;
 }
 
+static void effective_prot_pte(struct ptdump_state *st, pte_t pte)
+{
+	effective_prot(st, 4, pte_val(pte));
+}
+
+static void effective_prot_pmd(struct ptdump_state *st, pmd_t pmd)
+{
+	effective_prot(st, 3, pmd_val(pmd));
+}
+
+static void effective_prot_pud(struct ptdump_state *st, pud_t pud)
+{
+	effective_prot(st, 2, pud_val(pud));
+}
+
+static void effective_prot_p4d(struct ptdump_state *st, p4d_t p4d)
+{
+	effective_prot(st, 1, p4d_val(p4d));
+}
+
+static void effective_prot_pgd(struct ptdump_state *st, pgd_t pgd)
+{
+	effective_prot(st, 0, pgd_val(pgd));
+}
+
+
 /*
  * This function gets called on a break in a continuous series
  * of PTE entries; the next one is different so we need to
@@ -416,7 +442,11 @@ bool ptdump_walk_pgd_level_core(struct seq_file *m,
 			.note_page_p4d = note_page_p4d,
 			.note_page_pgd = note_page_pgd,
 			.note_page_flush = note_page_flush,
-			.effective_prot = effective_prot,
+			.effective_prot_pte = effective_prot_pte,
+			.effective_prot_pmd = effective_prot_pmd,
+			.effective_prot_pud = effective_prot_pud,
+			.effective_prot_p4d = effective_prot_p4d,
+			.effective_prot_pgd = effective_prot_pgd,
 			.range		= ptdump_ranges
 		},
 		.level = -1,
diff --git a/include/linux/ptdump.h b/include/linux/ptdump.h
index 1c1eb1fae199..240bd3bff18d 100644
--- a/include/linux/ptdump.h
+++ b/include/linux/ptdump.h
@@ -17,7 +17,11 @@ struct ptdump_state {
 	void (*note_page_p4d)(struct ptdump_state *st, unsigned long addr, p4d_t p4d);
 	void (*note_page_pgd)(struct ptdump_state *st, unsigned long addr, pgd_t pgd);
 	void (*note_page_flush)(struct ptdump_state *st);
-	void (*effective_prot)(struct ptdump_state *st, int level, u64 val);
+	void (*effective_prot_pte)(struct ptdump_state *st, pte_t pte);
+	void (*effective_prot_pmd)(struct ptdump_state *st, pmd_t pmd);
+	void (*effective_prot_pud)(struct ptdump_state *st, pud_t pud);
+	void (*effective_prot_p4d)(struct ptdump_state *st, p4d_t p4d);
+	void (*effective_prot_pgd)(struct ptdump_state *st, pgd_t pgd);
 	const struct ptdump_range *range;
 };
 
diff --git a/mm/ptdump.c b/mm/ptdump.c
index 706cfc19439b..9374f29cdc6f 100644
--- a/mm/ptdump.c
+++ b/mm/ptdump.c
@@ -38,8 +38,8 @@ static int ptdump_pgd_entry(pgd_t *pgd, unsigned long addr,
 		return note_kasan_page_table(walk, addr);
 #endif
 
-	if (st->effective_prot)
-		st->effective_prot(st, 0, pgd_val(val));
+	if (st->effective_prot_pgd)
+		st->effective_prot_pgd(st, val);
 
 	if (pgd_leaf(val)) {
 		st->note_page_pgd(st, addr, val);
@@ -61,8 +61,8 @@ static int ptdump_p4d_entry(p4d_t *p4d, unsigned long addr,
 		return note_kasan_page_table(walk, addr);
 #endif
 
-	if (st->effective_prot)
-		st->effective_prot(st, 1, p4d_val(val));
+	if (st->effective_prot_p4d)
+		st->effective_prot_p4d(st, val);
 
 	if (p4d_leaf(val)) {
 		st->note_page_p4d(st, addr, val);
@@ -84,8 +84,8 @@ static int ptdump_pud_entry(pud_t *pud, unsigned long addr,
 		return note_kasan_page_table(walk, addr);
 #endif
 
-	if (st->effective_prot)
-		st->effective_prot(st, 2, pud_val(val));
+	if (st->effective_prot_pud)
+		st->effective_prot_pud(st, val);
 
 	if (pud_leaf(val)) {
 		st->note_page_pud(st, addr, val);
@@ -106,8 +106,8 @@ static int ptdump_pmd_entry(pmd_t *pmd, unsigned long addr,
 		return note_kasan_page_table(walk, addr);
 #endif
 
-	if (st->effective_prot)
-		st->effective_prot(st, 3, pmd_val(val));
+	if (st->effective_prot_pmd)
+		st->effective_prot_pmd(st, val);
 	if (pmd_leaf(val)) {
 		st->note_page_pmd(st, addr, val);
 		walk->action = ACTION_CONTINUE;
@@ -122,8 +122,8 @@ static int ptdump_pte_entry(pte_t *pte, unsigned long addr,
 	struct ptdump_state *st = walk->private;
 	pte_t val = ptep_get_lockless(pte);
 
-	if (st->effective_prot)
-		st->effective_prot(st, 4, pte_val(val));
+	if (st->effective_prot_pte)
+		st->effective_prot_pte(st, val);
 
 	st->note_page_pte(st, addr, val);
 
-- 
2.25.1


