Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD7CCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 10:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVwW9tmb5gTq+YlEpTle3BPj+uH7Ei3te9pgTf125wg=; b=thmjVa4LQ2Ll+ZGFEuqJGD03zd
	ydv6naTK1+p2ezXsvFHhxIOxUXG2wJg5f0DgX2Fc8MWvQrZuZeFK0bQAF6GaM4Y+lO//5vCrI7faY
	bQkVo1PD7k6Q66pABQTUZsSMMOS/XzFEDBUfFVj6Y8dem04zvwp2Y20TTNhVA+WHHNgb2aZbBuEya
	lMKVGHPkMZlUlk2b2q95CPqWLmlHZhNpzh8MUAVx5Q9QuwdjbIPfKAc9Iv8vG0Iz34BGrHqdRwTp6
	3/fYdjL6iCx1xZvb62gXQgQjAVqgqHSjZbhND8CCaZcdSSGOR/auAISEgIh0l1l6QJhV8LKyEMNsS
	Q7saWZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrxE-00000002FGs-0Mnt;
	Fri, 15 Aug 2025 10:46:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqEb-00000001w0Y-0tHB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 08:56:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 834CF497;
	Fri, 15 Aug 2025 01:56:16 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28E7A3F63F;
	Fri, 15 Aug 2025 01:56:20 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [RFC PATCH v5 12/18] mm: Allow __pagetable_ctor() to fail
Date: Fri, 15 Aug 2025 09:55:06 +0100
Message-ID: <20250815085512.2182322-13-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250815085512.2182322-1-kevin.brodsky@arm.com>
References: <20250815085512.2182322-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_015625_331908_C1D389B5 
X-CRM114-Status: GOOD (  12.58  )
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

In preparation for adding construction hooks (that may fail) to
__pagetable_ctor(), make __pagetable_ctor() return a bool,
propagate it to pagetable_*_ctor() and handle failure in
the generic {pud,p4d,pgd}_alloc.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/asm-generic/pgalloc.h | 15 ++++++++++++---
 include/linux/mm.h            | 21 ++++++++++-----------
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 3c8ec3bfea44..3e184f3ca37a 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -178,7 +178,10 @@ static inline pud_t *__pud_alloc_one_noprof(struct mm_struct *mm, unsigned long
 	if (!ptdesc)
 		return NULL;
 
-	pagetable_pud_ctor(ptdesc);
+	if (!pagetable_pud_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
+		return NULL;
+	}
 	return ptdesc_address(ptdesc);
 }
 #define __pud_alloc_one(...)	alloc_hooks(__pud_alloc_one_noprof(__VA_ARGS__))
@@ -232,7 +235,10 @@ static inline p4d_t *__p4d_alloc_one_noprof(struct mm_struct *mm, unsigned long
 	if (!ptdesc)
 		return NULL;
 
-	pagetable_p4d_ctor(ptdesc);
+	if (!pagetable_p4d_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
+		return NULL;
+	}
 	return ptdesc_address(ptdesc);
 }
 #define __p4d_alloc_one(...)	alloc_hooks(__p4d_alloc_one_noprof(__VA_ARGS__))
@@ -276,7 +282,10 @@ static inline pgd_t *__pgd_alloc_noprof(struct mm_struct *mm, unsigned int order
 	if (!ptdesc)
 		return NULL;
 
-	pagetable_pgd_ctor(ptdesc);
+	if (!pagetable_pgd_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
+		return NULL;
+	}
 	return ptdesc_address(ptdesc);
 }
 #define __pgd_alloc(...)	alloc_hooks(__pgd_alloc_noprof(__VA_ARGS__))
diff --git a/include/linux/mm.h b/include/linux/mm.h
index f4dd96f3db91..d9371d992033 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2973,12 +2973,13 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* defined(CONFIG_SPLIT_PTE_PTLOCKS) */
 
-static inline void __pagetable_ctor(struct ptdesc *ptdesc)
+static inline bool __pagetable_ctor(struct ptdesc *ptdesc)
 {
 	struct folio *folio = ptdesc_folio(ptdesc);
 
 	__folio_set_pgtable(folio);
 	lruvec_stat_add_folio(folio, NR_PAGETABLE);
+	return true;
 }
 
 static inline void pagetable_dtor(struct ptdesc *ptdesc)
@@ -3001,8 +3002,7 @@ static inline bool pagetable_pte_ctor(struct mm_struct *mm,
 {
 	if (mm != &init_mm && !ptlock_init(ptdesc))
 		return false;
-	__pagetable_ctor(ptdesc);
-	return true;
+	return __pagetable_ctor(ptdesc);
 }
 
 pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp);
@@ -3109,8 +3109,7 @@ static inline bool pagetable_pmd_ctor(struct mm_struct *mm,
 	if (mm != &init_mm && !pmd_ptlock_init(ptdesc))
 		return false;
 	ptdesc_pmd_pts_init(ptdesc);
-	__pagetable_ctor(ptdesc);
-	return true;
+	return __pagetable_ctor(ptdesc);
 }
 
 /*
@@ -3132,19 +3131,19 @@ static inline spinlock_t *pud_lock(struct mm_struct *mm, pud_t *pud)
 	return ptl;
 }
 
-static inline void pagetable_pud_ctor(struct ptdesc *ptdesc)
+static inline bool pagetable_pud_ctor(struct ptdesc *ptdesc)
 {
-	__pagetable_ctor(ptdesc);
+	return __pagetable_ctor(ptdesc);
 }
 
-static inline void pagetable_p4d_ctor(struct ptdesc *ptdesc)
+static inline bool pagetable_p4d_ctor(struct ptdesc *ptdesc)
 {
-	__pagetable_ctor(ptdesc);
+	return __pagetable_ctor(ptdesc);
 }
 
-static inline void pagetable_pgd_ctor(struct ptdesc *ptdesc)
+static inline bool pagetable_pgd_ctor(struct ptdesc *ptdesc)
 {
-	__pagetable_ctor(ptdesc);
+	return __pagetable_ctor(ptdesc);
 }
 
 extern void __init pagecache_init(void);
-- 
2.47.0


