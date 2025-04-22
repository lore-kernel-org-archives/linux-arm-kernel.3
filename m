Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EECC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 09:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krp44dJNkBDHUtvYOeduh45byx5d8HD4EHt5vDmtMkc=; b=rfFcVkcBHg21ptUsqi9oB4Yk5H
	M3xFbZsuQQKJ7QVbN/iM/Sz++/uX9KJaBxr04a3CrHpoyvOhRXjGOwslV0SJIiEQz7YXq5qLBBV5p
	SVrH2iYXD8bjQub5viATNZnApLccwpi6zPNq6WZSbAN/DreU2SCvuR6pvPBpE/yvZfG8aJYY8nTiQ
	emvZy2CH9JmOASj5xNC+svcBy1x/P+8rOZGmsYj7EnibfBHPGsWcIbXcPoxniOTbYc25+DoIKv5B1
	gKKFyixL7dr47qbVqLbM1oqIqKNay/ljbNy2hjxjmqaUNS9GVIY6p+dYcDeHIzRFbj2GQTCbQeAYt
	GJY1tXlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AIM-00000006dGo-2izm;
	Tue, 22 Apr 2025 09:52:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78q8-00000006GhR-1VXy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:18:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EC931EDB;
	Tue, 22 Apr 2025 01:18:43 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BB513F66E;
	Tue, 22 Apr 2025 01:18:45 -0700 (PDT)
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
Subject: [PATCH v4 03/11] mm/page_table_check: Batch-check pmds/puds just like ptes
Date: Tue, 22 Apr 2025 09:18:11 +0100
Message-ID: <20250422081822.1836315-4-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422081822.1836315-1-ryan.roberts@arm.com>
References: <20250422081822.1836315-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_011848_478798_32E303B1 
X-CRM114-Status: GOOD (  13.73  )
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

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
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
index 68109ee93841..4eeca782b888 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -218,33 +218,39 @@ static inline void page_table_check_pmd_flags(pmd_t pmd)
 		WARN_ON_ONCE(swap_cached_writable(pmd_to_swp_entry(pmd)));
 }
 
-void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd)
+void __page_table_check_pmds_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd,
+		unsigned int nr)
 {
+	unsigned long stride = PMD_SIZE >> PAGE_SHIFT;
+	unsigned int i;
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
+	unsigned long stride = PUD_SIZE >> PAGE_SHIFT;
+	unsigned int i;
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


