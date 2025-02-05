Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D844C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdIdCqL/U5NG8r9FvUNmuvz1Dz0ucLmsjWNXeD3dOug=; b=mJK4bl30QzegZ10VdV6IwV3m9T
	4Tb+r6Iq3D+HNnMYLN7r6KB7ZlMklr4Gb0LTaw3ctgySekVjNusvNqupAjGmJ3x5PV+oBTstQSaGO
	oDn7QfKCY8mfn5BQ3tHeX85xoOQC6gDH6EhMlgqCspL++1qWuiRzods4Pd5zHcW+/HttGo9Z0t3y7
	iXCymaOjpm+/R7YPiEJehUSD196jngra06MBfjcSgkAV6MrzzTcLvDVWA+CUmjQf8fcqHU0RR5tkl
	Cq8UTeVq/xgWFPxOH869/p/fZsWeRXzE9AtFBPxMLDALKZpLoGD8D1JrT/oIQPgHRIMqF3rOn49hb
	IYP4KW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhAx-00000003jgT-0oq1;
	Wed, 05 Feb 2025 15:18:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfh33-00000003iB3-2si4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 15:10:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F04381063;
	Wed,  5 Feb 2025 07:11:04 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D46F73F5A1;
	Wed,  5 Feb 2025 07:10:38 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Steve Capper <steve.capper@linaro.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 05/16] mm/page_table_check: Batch-check pmds/puds just like ptes
Date: Wed,  5 Feb 2025 15:09:45 +0000
Message-ID: <20250205151003.88959-6-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205151003.88959-1-ryan.roberts@arm.com>
References: <20250205151003.88959-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_071041_821231_B35A8D8A 
X-CRM114-Status: GOOD (  13.43  )
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

Convert page_table_check_p[mu]d_set(...) to
page_table_check_p[mu]ds_set(..., nr) to allow checking a contiguous set
of pmds/puds in single batch. We retain page_table_check_p[mu]d_set(...)
as macros that call new batch functions with nr=1 for compatibility.

arm64 is about to reorganise its pte/pmd/pud helpers to reuse more code
and to allow the implementation for huge_pte to more efficiently set
ptes/pmds/puds in batches. We need these batch-helpers to make the
refactoring possible.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/linux/page_table_check.h | 30 +++++++++++++++++-----------
 mm/page_table_check.c            | 34 +++++++++++++++++++-------------
 2 files changed, 38 insertions(+), 26 deletions(-)

diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index 6722941c7cb8..289620d4aad3 100644
--- a/include/linux/page_table_check.h
+++ b/include/linux/page_table_check.h
@@ -19,8 +19,10 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
 void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
 void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
 		unsigned int nr);
-void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd);
-void __page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp, pud_t pud);
+void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
+		unsigned int nr);
+void __page_table_check_puds_set(struct mm_struct *mm, pud_t *pudp, pud_t pud,
+		unsigned int nr);
 void __page_table_check_pte_clear_range(struct mm_struct *mm,
 					unsigned long addr,
 					pmd_t pmd);
@@ -74,22 +76,22 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
 	__page_table_check_ptes_set(mm, ptep, pte, nr);
 }
 
-static inline void page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp,
-					    pmd_t pmd)
+static inline void page_table_check_pmds_set(struct mm_struct *mm,
+		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
 {
 	if (static_branch_likely(&page_table_check_disabled))
 		return;
 
-	__page_table_check_pmd_set(mm, pmdp, pmd);
+	__page_table_check_pmds_set(mm, pmdp, pmd, nr);
 }
 
-static inline void page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp,
-					    pud_t pud)
+static inline void page_table_check_puds_set(struct mm_struct *mm,
+		pud_t *pudp, pud_t pud, unsigned int nr)
 {
 	if (static_branch_likely(&page_table_check_disabled))
 		return;
 
-	__page_table_check_pud_set(mm, pudp, pud);
+	__page_table_check_puds_set(mm, pudp, pud, nr);
 }
 
 static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
@@ -129,13 +131,13 @@ static inline void page_table_check_ptes_set(struct mm_struct *mm,
 {
 }
 
-static inline void page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp,
-					    pmd_t pmd)
+static inline void page_table_check_pmds_set(struct mm_struct *mm,
+		pmd_t *pmdp, pmd_t pmd, unsigned int nr)
 {
 }
 
-static inline void page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp,
-					    pud_t pud)
+static inline void page_table_check_puds_set(struct mm_struct *mm,
+		pud_t *pudp, pud_t pud, unsigned int nr)
 {
 }
 
@@ -146,4 +148,8 @@ static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
 }
 
 #endif /* CONFIG_PAGE_TABLE_CHECK */
+
+#define page_table_check_pmd_set(mm, pmdp, pmd)	page_table_check_pmds_set(mm, pmdp, pmd, 1)
+#define page_table_check_pud_set(mm, pudp, pud)	page_table_check_puds_set(mm, pudp, pud, 1)
+
 #endif /* __LINUX_PAGE_TABLE_CHECK_H */
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 509c6ef8de40..dae4a7d776b3 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -234,33 +234,39 @@ static inline void page_table_check_pmd_flags(pmd_t pmd)
 		WARN_ON_ONCE(swap_cached_writable(pmd_to_swp_entry(pmd)));
 }
 
-void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd)
+void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
+		unsigned int nr)
 {
+	unsigned int i;
+	unsigned long stride = PMD_SIZE >> PAGE_SHIFT;
+
 	if (&init_mm == mm)
 		return;
 
 	page_table_check_pmd_flags(pmd);
 
-	__page_table_check_pmd_clear(mm, *pmdp);
-	if (pmd_user_accessible_page(pmd)) {
-		page_table_check_set(pmd_pfn(pmd), PMD_SIZE >> PAGE_SHIFT,
-				     pmd_write(pmd));
-	}
+	for (i = 0; i < nr; i++)
+		__page_table_check_pmd_clear(mm, *(pmdp + i));
+	if (pmd_user_accessible_page(pmd))
+		page_table_check_set(pmd_pfn(pmd), stride * nr, pmd_write(pmd));
 }
-EXPORT_SYMBOL(__page_table_check_pmd_set);
+EXPORT_SYMBOL(__page_table_check_pmds_set);
 
-void __page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp, pud_t pud)
+void __page_table_check_puds_set(struct mm_struct *mm, pud_t *pudp, pud_t pud,
+		unsigned int nr)
 {
+	unsigned int i;
+	unsigned long stride = PUD_SIZE >> PAGE_SHIFT;
+
 	if (&init_mm == mm)
 		return;
 
-	__page_table_check_pud_clear(mm, *pudp);
-	if (pud_user_accessible_page(pud)) {
-		page_table_check_set(pud_pfn(pud), PUD_SIZE >> PAGE_SHIFT,
-				     pud_write(pud));
-	}
+	for (i = 0; i < nr; i++)
+		__page_table_check_pud_clear(mm, *(pudp + i));
+	if (pud_user_accessible_page(pud))
+		page_table_check_set(pud_pfn(pud), stride * nr, pud_write(pud));
 }
-EXPORT_SYMBOL(__page_table_check_pud_set);
+EXPORT_SYMBOL(__page_table_check_puds_set);
 
 void __page_table_check_pte_clear_range(struct mm_struct *mm,
 					unsigned long addr,
-- 
2.43.0


