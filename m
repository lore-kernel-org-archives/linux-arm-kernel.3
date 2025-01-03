Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583C9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 18:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSoOMdn+/GfqJnDjyLF0mh7cPRiC2LKGG844rQUUfqE=; b=MCffHmtIN2QZMN5ZASQo0kFvbV
	snjdQmPGn5QPYxFGwtwWne0W/KBUUVGGpEvNY19DhjXS9XdZre12mzXnLHhKRKUW7T8bexMyJjNhG
	Hc7YZmGN/+36NSHy1E2XazoHXYS4TP/n7n/thFEUzLdN/D65ZwaKxWP470mep2CmwT6Kf/z+8dr9P
	4K14pLfTwMM8aTAA2Bulkdx3OLWpKUHQlaVZMer3/ImjrhwAhTWfmwbN3vVladtaGarFygQDQo7o8
	RVaPVOJwG+1+Dn1sgXc4J5VUWZkH3x875b1yannjvPRi9uPUV+qJ2GGx6e61bXZOklMltWlJ7SmgM
	6LtusIPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmhH-0000000DkGW-10wK;
	Fri, 03 Jan 2025 18:46:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmew-0000000DjJ1-00LC;
	Fri, 03 Jan 2025 18:44:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A16E7150C;
	Fri,  3 Jan 2025 10:45:01 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B3F53F673;
	Fri,  3 Jan 2025 10:44:29 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	loongarch@lists.linux.dev,
	x86@kernel.org
Subject: [PATCH v2 1/6] mm: Move common part of pagetable_*_ctor to helper
Date: Fri,  3 Jan 2025 18:44:10 +0000
Message-ID: <20250103184415.2744423-2-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250103184415.2744423-1-kevin.brodsky@arm.com>
References: <20250103184415.2744423-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_104434_141861_CD456650 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

pagetable_*_ctor all have the same basic implementation. Move the
common part to a helper to reduce duplication.

Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/mm.h | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1a11f9df5c2d..065fa9449d03 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3076,6 +3076,14 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* defined(CONFIG_SPLIT_PTE_PTLOCKS) */
 
+static inline void __pagetable_ctor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	__folio_set_pgtable(folio);
+	lruvec_stat_add_folio(folio, NR_PAGETABLE);
+}
+
 static inline void pagetable_dtor(struct ptdesc *ptdesc)
 {
 	struct folio *folio = ptdesc_folio(ptdesc);
@@ -3093,12 +3101,9 @@ static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
 
 static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 {
-	struct folio *folio = ptdesc_folio(ptdesc);
-
 	if (!ptlock_init(ptdesc))
 		return false;
-	__folio_set_pgtable(folio);
-	lruvec_stat_add_folio(folio, NR_PAGETABLE);
+	__pagetable_ctor(ptdesc);
 	return true;
 }
 
@@ -3202,13 +3207,10 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pagetable_pmd_ctor(struct ptdesc *ptdesc)
 {
-	struct folio *folio = ptdesc_folio(ptdesc);
-
 	if (!pmd_ptlock_init(ptdesc))
 		return false;
-	__folio_set_pgtable(folio);
 	ptdesc_pmd_pts_init(ptdesc);
-	lruvec_stat_add_folio(folio, NR_PAGETABLE);
+	__pagetable_ctor(ptdesc);
 	return true;
 }
 
@@ -3233,18 +3235,12 @@ static inline spinlock_t *pud_lock(struct mm_struct *mm, pud_t *pud)
 
 static inline void pagetable_pud_ctor(struct ptdesc *ptdesc)
 {
-	struct folio *folio = ptdesc_folio(ptdesc);
-
-	__folio_set_pgtable(folio);
-	lruvec_stat_add_folio(folio, NR_PAGETABLE);
+	__pagetable_ctor(ptdesc);
 }
 
 static inline void pagetable_p4d_ctor(struct ptdesc *ptdesc)
 {
-	struct folio *folio = ptdesc_folio(ptdesc);
-
-	__folio_set_pgtable(folio);
-	lruvec_stat_add_folio(folio, NR_PAGETABLE);
+	__pagetable_ctor(ptdesc);
 }
 
 extern void __init pagecache_init(void);
-- 
2.47.0


