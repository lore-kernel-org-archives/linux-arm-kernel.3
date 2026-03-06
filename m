Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEB2F51411
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 06:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySLYC5/cF8hmf06ne/L2kgOPFMnQM58WLWXLfygl3cs=; b=vQx4FfmbwRGrSGSxdZUHQyYGpv
	9ovSfl5EJH2S9dEgZQ9Fheh+96O8T2mwwMmjIb7nSJF+fCDLFq7ThJQd/PxZ4IuYP7fIRxcCn4iGb
	AHQN6hnKYMPh86VAMcjad8Yj0GPeCBN/puWHz7oIppObny4iKgAqFCGoXqK+IrUykiPoqHCkgVOD5
	Ytn8dRwHaH9VXjudziBuenkcqCuJgALUFWcqz2H+Xobiot5UF7IXg9ccCOzzyl69NTV1z1/drhaxW
	Am/LN6Cs5qYWDmHwiUYbUAim5T776NtyR+/dqorYmznCdXaSntxh+1MhILPI5AbVxHv2M2HKsN40P
	Wt3G2LOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOv3-00000003626-246f;
	Fri, 06 Mar 2026 06:44:17 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOuw-000000035vu-3eQh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 06:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772779445; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=ySLYC5/cF8hmf06ne/L2kgOPFMnQM58WLWXLfygl3cs=;
	b=v49bVuO1fkFqiM6ScJNP13gRf2ev7Ccb9klhcYlXe0tYjbiXo3RqMpSIp1L3xn+Ohp/GyR1t+f1NZ8pHV44RD4p7FzMfXR0p1kkRg/Y3jmlmkKa8FCL4XVuCH/H2LsmmTbHJtn7EaZLPdWl/EOsmol52glplSnsiVIyIueoBzYQ=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X-MLoqO_1772779443 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Mar 2026 14:44:04 +0800
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
Subject: [PATCH v3 4/6] mm: add a batched helper to clear the young flag for large folios
Date: Fri,  6 Mar 2026 14:43:40 +0800
Message-ID: <23ec671bfcc06cd24ee0fbff8e329402742274a0.1772778858.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772778858.git.baolin.wang@linux.alibaba.com>
References: <cover.1772778858.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_224411_125058_9572C0FC 
X-CRM114-Status: GOOD (  14.71  )
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

Currently, MGLRU will call ptep_test_and_clear_young_notify() to check and
clear the young flag for each PTE sequentially, which is inefficient for
large folios reclamation.

Moreover, on Arm64 architecture, which supports contiguous PTEs, the Arm64-
specific ptep_test_and_clear_young() already implements an optimization to
clear the young flags for PTEs within a contiguous range. However, this is not
sufficient. Similar to the Arm64 specific clear_flush_young_ptes(), we can
extend this to perform batched operations for the entire large folio (which
might exceed the contiguous range: CONT_PTE_SIZE).

Thus, we can introduce a new batched helper: test_and_clear_young_ptes() and
its wrapper test_and_clear_young_ptes_notify() which are consistent with the
existing functions, to perform batched checking of the young flags for large
folios, which can help improve performance during large folio reclamation when
MGLRU is enabled. And it will be overridden by the architecture that implements
a more efficient batch operation in the following patches.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 include/linux/pgtable.h | 37 +++++++++++++++++++++++++++++++++++++
 mm/internal.h           | 16 +++++++++++-----
 2 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index d2767a4c027b..17d961c612fc 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1103,6 +1103,43 @@ static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
 }
 #endif
 
+#ifndef test_and_clear_young_ptes
+/**
+ * test_and_clear_young_ptes - Mark PTEs that map consecutive pages of the same
+ *			       folio as old
+ * @vma: The virtual memory area the pages are mapped into.
+ * @addr: Address the first page is mapped at.
+ * @ptep: Page table pointer for the first entry.
+ * @nr: Number of entries to clear access bit.
+ *
+ * May be overridden by the architecture; otherwise, implemented as a simple
+ * loop over ptep_test_and_clear_young().
+ *
+ * Note that PTE bits in the PTE range besides the PFN can differ. For example,
+ * some PTEs might be write-protected.
+ *
+ * Context: The caller holds the page table lock.  The PTEs map consecutive
+ * pages that belong to the same folio.  The PTEs are all in the same PMD.
+ *
+ * Returns: whether any PTE was young.
+ */
+static inline int test_and_clear_young_ptes(struct vm_area_struct *vma,
+		unsigned long addr, pte_t *ptep, unsigned int nr)
+{
+	int young = 0;
+
+	for (;;) {
+		young |= ptep_test_and_clear_young(vma, addr, ptep);
+		if (--nr == 0)
+			break;
+		ptep++;
+		addr += PAGE_SIZE;
+	}
+
+	return young;
+}
+#endif
+
 /*
  * On some architectures hardware does not set page access bit when accessing
  * memory page, it is responsibility of software setting this bit. It brings
diff --git a/mm/internal.h b/mm/internal.h
index f45f97df0d28..8cdd5d8e43fb 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1819,13 +1819,13 @@ static inline int pmdp_clear_flush_young_notify(struct vm_area_struct *vma,
 	return young;
 }
 
-static inline int ptep_test_and_clear_young_notify(struct vm_area_struct *vma,
-		unsigned long addr, pte_t *ptep)
+static inline int test_and_clear_young_ptes_notify(struct vm_area_struct *vma,
+		unsigned long addr, pte_t *ptep, unsigned int nr)
 {
 	int young;
 
-	young = ptep_test_and_clear_young(vma, addr, ptep);
-	young |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
+	young = test_and_clear_young_ptes(vma, addr, ptep, nr);
+	young |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + nr * PAGE_SIZE);
 	return young;
 }
 
@@ -1843,9 +1843,15 @@ static inline int pmdp_test_and_clear_young_notify(struct vm_area_struct *vma,
 
 #define clear_flush_young_ptes_notify	clear_flush_young_ptes
 #define pmdp_clear_flush_young_notify	pmdp_clear_flush_young
-#define ptep_test_and_clear_young_notify	ptep_test_and_clear_young
+#define test_and_clear_young_ptes_notify	test_and_clear_young_ptes
 #define pmdp_test_and_clear_young_notify	pmdp_test_and_clear_young
 
 #endif /* CONFIG_MMU_NOTIFIER */
 
+static inline int ptep_test_and_clear_young_notify(struct vm_area_struct *vma,
+		unsigned long addr, pte_t *ptep)
+{
+	return test_and_clear_young_ptes_notify(vma, addr, ptep, 1);
+}
+
 #endif	/* __MM_INTERNAL_H */
-- 
2.47.3


