Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0810FF51411
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 06:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ecy1vzScZYswnEb3G5QPIiR13hJr9V0CgwG6PHTVyyM=; b=vJeFpsmNT/w8TgKUDLUdPfVx/X
	horbCUdMdw+IkjAuB7dLmVKMmvPFXSQEcgaoxa/1qtoUompJ+HDJz+ptxcjR5UYqnvqsGyAWkYanj
	B4arWnwHW+Xw786jHmcI2sQFJaVqBXX94jjh8ZoVJ4nVs2OtDOw/jdStWvGr3RFo9vhr0zWjmR6hm
	c5nAAheWMWyYuCNN1TIcdmJPnpVGF+q6K1zxlHZrLYbLAe7/6P8RO6WZEOA6ddSjJ7ilXtyHJcFv2
	QISjquDNfvbXlhs9g02Pe1sf4i5wdOrqI1LXNVsWnwVDXDzUIg19kY5Gnny31V0+59cVd7zJRyhOH
	L2cIGWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOv1-0000000360X-47kC;
	Fri, 06 Mar 2026 06:44:15 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOuu-000000035wN-3G6U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 06:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772779446; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Ecy1vzScZYswnEb3G5QPIiR13hJr9V0CgwG6PHTVyyM=;
	b=HDD4O6PKFlwoKr8HguoB7Q9Pn+I5ZIKdQ+eea532LESwG/X++ADUEA1pODXmdW4upRSA9PCx6oE/m12rE5tpakKqaQqJ5RHNSJjLuf/6u5wMm2cpCFM6Pw4PbeTSOtp65mGRQyc+XtxiAVB7/e4pf7fkuJVRy4xzpvmyfriATRw=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X-MLooA_1772779438 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Mar 2026 14:43:59 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	riel@surriel.com,
	harry.yoo@oracle.com,
	jannh@google.com,
	willy@infradead.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	hannes@cmpxchg.org,
	zhengqi.arch@bytedance.com,
	shakeel.butt@linux.dev,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] mm: use inline helper functions instead of ugly macros
Date: Fri,  6 Mar 2026 14:43:37 +0800
Message-ID: <ea14af84e7967ccebb25082c28a8669d6da8fe57.1772778858.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772778858.git.baolin.wang@linux.alibaba.com>
References: <cover.1772778858.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_224409_177194_9BBC7E30 
X-CRM114-Status: GOOD (  12.81  )
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

People have already complained that these *_clear_young_notify() related
macros are very ugly, so let's use inline helpers to make them more readable.

In addition, we cannot implement these inline helper functions in the
mmu_notifier.h file, because some arch-specific files will include the
mmu_notifier.h, which introduces header compilation dependencies and causes
build errors (e.g., arch/arm64/include/asm/tlbflush.h). Moreover, since
these functions are only used in the mm, implementing these inline helpers
in the mm/internal.h header seems reasonable.

Reviewed-by: Rik van Riel <riel@surriel.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 include/linux/mmu_notifier.h | 54 ------------------------------------
 mm/internal.h                | 52 ++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 54 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 8450e18a87c2..3705d350c863 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -516,55 +516,6 @@ static inline void mmu_notifier_range_init_owner(
 	range->owner = owner;
 }
 
-#define clear_flush_young_ptes_notify(__vma, __address, __ptep, __nr)	\
-({									\
-	int __young;							\
-	struct vm_area_struct *___vma = __vma;				\
-	unsigned long ___address = __address;				\
-	unsigned int ___nr = __nr;					\
-	__young = clear_flush_young_ptes(___vma, ___address, __ptep, ___nr);	\
-	__young |= mmu_notifier_clear_flush_young(___vma->vm_mm,	\
-						  ___address,		\
-						  ___address +		\
-						  ___nr * PAGE_SIZE);	\
-	__young;							\
-})
-
-#define pmdp_clear_flush_young_notify(__vma, __address, __pmdp)		\
-({									\
-	int __young;							\
-	struct vm_area_struct *___vma = __vma;				\
-	unsigned long ___address = __address;				\
-	__young = pmdp_clear_flush_young(___vma, ___address, __pmdp);	\
-	__young |= mmu_notifier_clear_flush_young(___vma->vm_mm,	\
-						  ___address,		\
-						  ___address +		\
-							PMD_SIZE);	\
-	__young;							\
-})
-
-#define ptep_clear_young_notify(__vma, __address, __ptep)		\
-({									\
-	int __young;							\
-	struct vm_area_struct *___vma = __vma;				\
-	unsigned long ___address = __address;				\
-	__young = ptep_test_and_clear_young(___vma, ___address, __ptep);\
-	__young |= mmu_notifier_clear_young(___vma->vm_mm, ___address,	\
-					    ___address + PAGE_SIZE);	\
-	__young;							\
-})
-
-#define pmdp_clear_young_notify(__vma, __address, __pmdp)		\
-({									\
-	int __young;							\
-	struct vm_area_struct *___vma = __vma;				\
-	unsigned long ___address = __address;				\
-	__young = pmdp_test_and_clear_young(___vma, ___address, __pmdp);\
-	__young |= mmu_notifier_clear_young(___vma->vm_mm, ___address,	\
-					    ___address + PMD_SIZE);	\
-	__young;							\
-})
-
 #else /* CONFIG_MMU_NOTIFIER */
 
 struct mmu_notifier_range {
@@ -652,11 +603,6 @@ static inline void mmu_notifier_subscriptions_destroy(struct mm_struct *mm)
 
 #define mmu_notifier_range_update_to_read_only(r) false
 
-#define clear_flush_young_ptes_notify clear_flush_young_ptes
-#define pmdp_clear_flush_young_notify pmdp_clear_flush_young
-#define ptep_clear_young_notify ptep_test_and_clear_young
-#define pmdp_clear_young_notify pmdp_test_and_clear_young
-
 static inline void mmu_notifier_synchronize(void)
 {
 }
diff --git a/mm/internal.h b/mm/internal.h
index 0d5208101762..05eb0303f277 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -11,6 +11,7 @@
 #include <linux/khugepaged.h>
 #include <linux/mm.h>
 #include <linux/mm_inline.h>
+#include <linux/mmu_notifier.h>
 #include <linux/pagemap.h>
 #include <linux/pagewalk.h>
 #include <linux/rmap.h>
@@ -1796,4 +1797,55 @@ static inline int io_remap_pfn_range_complete(struct vm_area_struct *vma,
 	return remap_pfn_range_complete(vma, addr, pfn, size, prot);
 }
 
+#ifdef CONFIG_MMU_NOTIFIER
+static inline int clear_flush_young_ptes_notify(struct vm_area_struct *vma,
+		unsigned long addr, pte_t *ptep, unsigned int nr)
+{
+	int young;
+
+	young = clear_flush_young_ptes(vma, addr, ptep, nr);
+	young |= mmu_notifier_clear_flush_young(vma->vm_mm, addr,
+						addr + nr * PAGE_SIZE);
+	return young;
+}
+
+static inline int pmdp_clear_flush_young_notify(struct vm_area_struct *vma,
+		unsigned long addr, pmd_t *pmdp)
+{
+	int young;
+
+	young = pmdp_clear_flush_young(vma, addr, pmdp);
+	young |= mmu_notifier_clear_flush_young(vma->vm_mm, addr, addr + PMD_SIZE);
+	return young;
+}
+
+static inline int ptep_clear_young_notify(struct vm_area_struct *vma,
+		unsigned long addr, pte_t *ptep)
+{
+	int young;
+
+	young = ptep_test_and_clear_young(vma, addr, ptep);
+	young |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
+	return young;
+}
+
+static inline int pmdp_clear_young_notify(struct vm_area_struct *vma,
+		unsigned long addr, pmd_t *pmdp)
+{
+	int young;
+
+	young = pmdp_test_and_clear_young(vma, addr, pmdp);
+	young |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PMD_SIZE);
+	return young;
+}
+
+#else /* CONFIG_MMU_NOTIFIER */
+
+#define clear_flush_young_ptes_notify	clear_flush_young_ptes
+#define pmdp_clear_flush_young_notify	pmdp_clear_flush_young
+#define ptep_clear_young_notify	ptep_test_and_clear_young
+#define pmdp_clear_young_notify	pmdp_test_and_clear_young
+
+#endif /* CONFIG_MMU_NOTIFIER */
+
 #endif	/* __MM_INTERNAL_H */
-- 
2.47.3


