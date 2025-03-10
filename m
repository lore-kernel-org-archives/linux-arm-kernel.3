Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEECC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 10:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TOmyGb4N5DsWcqOF4+bRHUwmy4W9KYIvcth30kE9Pg=; b=oCILRNNXCiSBNXwooVgVX43m5M
	v9Jp0PuBw+Rub9SDqoG9b8aKpZzmWNjUoYYuvqlEwd7/RyTePDdJ9spI9f4UK/oBKIs5Bu6E4ODwp
	JBPtCJoiAj9/Ro5v/3FNGuMcFOlbrrUFV9T0H6sA+i14WohnWgdhBqqml9q3Zp5yT+Nb8CR/9+62h
	zCnkq+l2JhG7wwZtZQK9iSthTCPzEvuabXidVlA5xOVxCJnoRVp3qBeUwpBvc8PB0sniX71Yq3vWc
	oqEwn5wIGaPn+rLXHns7iemIsOc0wFsQfgDkxMDnNsn6Cy+ROe+2lUMEK22osfEmDq/jfj9gPv3tK
	GS/a22RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tra5i-00000002DBB-25eC;
	Mon, 10 Mar 2025 10:10:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZuw-00000002B7U-2i6W;
	Mon, 10 Mar 2025 09:59:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF12826BA;
	Mon, 10 Mar 2025 02:59:37 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.42.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CB0C43F673;
	Mon, 10 Mar 2025 02:59:19 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: [RFC 2/2] arm64/ptdump: Replace u64 with pteval_t
Date: Mon, 10 Mar 2025 15:29:02 +0530
Message-Id: <20250310095902.390664-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310095902.390664-1-anshuman.khandual@arm.com>
References: <20250310095902.390664-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_025926_813264_49993841 
X-CRM114-Status: GOOD (  13.80  )
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

Page table entry's value, mask and protection are represented with pteval_t
data type format not u64 that has been assumed while dumping the page table
entries. Replace all such u64 instances with pteval_t instead as required.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/ptdump.h | 12 ++++++------
 arch/arm64/mm/ptdump.c          |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
index 8baba0d1aa8f..8ade657547f9 100644
--- a/arch/arm64/include/asm/ptdump.h
+++ b/arch/arm64/include/asm/ptdump.h
@@ -24,8 +24,8 @@ struct ptdump_info {
 };
 
 struct ptdump_prot_bits {
-	u64		mask;
-	u64		val;
+	pteval_t	mask;
+	pteval_t	val;
 	const char	*set;
 	const char	*clear;
 };
@@ -34,7 +34,7 @@ struct ptdump_pg_level {
 	const struct ptdump_prot_bits *bits;
 	char name[4];
 	int num;
-	u64 mask;
+	pteval_t mask;
 };
 
 /*
@@ -51,7 +51,7 @@ struct ptdump_pg_state {
 	const struct mm_struct *mm;
 	unsigned long start_address;
 	int level;
-	u64 current_prot;
+	pteval_t current_prot;
 	bool check_wx;
 	unsigned long wx_pages;
 	unsigned long uxn_pages;
@@ -59,7 +59,7 @@ struct ptdump_pg_state {
 
 void ptdump_walk(struct seq_file *s, struct ptdump_info *info);
 void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
-	       u64 val);
+	       pteval_t val);
 void note_page_pte(struct ptdump_state *st, unsigned long addr, pte_t pte);
 void note_page_pmd(struct ptdump_state *st, unsigned long addr, pmd_t pmd);
 void note_page_pud(struct ptdump_state *st, unsigned long addr, pud_t pud);
@@ -74,7 +74,7 @@ static inline void ptdump_debugfs_register(struct ptdump_info *info,
 #endif /* CONFIG_PTDUMP_DEBUGFS */
 #else
 static inline void note_page(struct ptdump_state *pt_st, unsigned long addr,
-			     int level, u64 val) { }
+			     int level, pteval_t val) { }
 static inline void note_page_pte(struct ptdump_state *st, unsigned long addr, pte_t pte) { }
 static inline void note_page_pmd(struct ptdump_state *st, unsigned long addr, pmd_t pmd) { }
 static inline void note_page_pud(struct ptdump_state *st, unsigned long addr, pud_t pud) { }
diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index 0c66c8474a48..7950c0e9e89c 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -189,12 +189,12 @@ static void note_prot_wx(struct ptdump_pg_state *st, unsigned long addr)
 }
 
 void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
-	       u64 val)
+	       pteval_t val)
 {
 	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
 	struct ptdump_pg_level *pg_level = st->pg_level;
 	static const char units[] = "KMGTPE";
-	u64 prot = 0;
+	pteval_t prot = 0;
 
 	/* check if the current level has been folded dynamically */
 	if (st->mm && ((level == 1 && mm_p4d_folded(st->mm)) ||
-- 
2.25.1


