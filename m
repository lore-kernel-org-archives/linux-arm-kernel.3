Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F137E77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 03:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3DoQzm517FFIjqDvouc3tzKgfaa0QgvxVLolob4ICo=; b=a/24sctYD1oPHpXXyPWqHvtq1p
	oSaQD+g1MvKxQLw68AMcCqfVsDR1ggAWo/NjNbPz45GFHUwh4pwcO26bzOhyKmm63S+aHLjg3BDzi
	VsGFcapPNlk9CAzr7Q/OSP2i4iuWKXX0AOBbG+9aOETeh0EMkNL8B9xAAZ7z8tBSioI+xZTSATvaD
	mCX4zyn8FR7bRzTuEXiyDPIQVn7Xduiwol894PaGWa88F6+raoz1zD0/uYxkvt9Qb7aY21Ob02aBo
	6zr1WqQOPonRL9Bx3Gzg/u1uAJrMxQty+GY/+IsOtQQ4yWF3oW539XW7Eq8nO4ez6A6NQl1zRxWEv
	FF4toY3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdfq-0000000081C-1CFn;
	Mon, 06 Jan 2025 03:21:02 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdcb-000000007du-3HDr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 03:17:42 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so20346015a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 19:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736133461; x=1736738261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3DoQzm517FFIjqDvouc3tzKgfaa0QgvxVLolob4ICo=;
        b=GL3KpTuCZtfdO+0TDPVbn+Bv+3T9A25lrHUEdKF6oD+URuqrB7DvsVdTIpiN3hV0lL
         kemE/IfRDwlh5W9JoG1mx7llEvXQ7CslXMf30XdCRqVkuD03WYY6jLeTnV2RtTyTZeW4
         C4/jak7I2qPbhyMmKfz8bih6pIl3gK608nho0AXcDr4SCr1yzTwd229JPLEPNMoUDVj6
         90FdGZcHCZSNTwH2D2ZkeOAB4BbM5cmRpCuKgj2lNM/NYcHI9ygkG/LiBYtfCXFhiAnv
         hrJxrm7haSNBEZ5o5iKo7ImoBeUfCl2vSHZLB+uxSfIZu+WAmZcTEF0DbHr8bHqU9ZaT
         M1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736133461; x=1736738261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3DoQzm517FFIjqDvouc3tzKgfaa0QgvxVLolob4ICo=;
        b=MxVWi0d6XjNupk5UWcNG07Ex5vIokd2kufwS/LxyKJPoYiTOZG95dgkhU2VJW5ajAm
         xdBITjRCoZzJv1058CUzWrjNLD/UhPeChsUmoCSb97fEKhYNV+xVHnMxsh5fjSDB767H
         gYEP4EYupN5S67Jxyy6f5xao0kCMbz3eCYsqtrk545nIz+m9MsF2aT6Mx8l1JS+LlNXX
         9OXYuwuBtYGNU/XjKCI7KDYpaNsL9j28NmR+kNswJnkBgS1b0Q6zGzxiKa0/xHuyRLsd
         NLHl3ydDGFLu341bSKfRqJUfeyCUuYcgR5sLNEbaJ2Vr+WVmw6Vz7rqDl0GWC8RUGYv2
         DyWg==
X-Gm-Message-State: AOJu0YyyOPpG6rn4v5RLP6ydYi7Q86Zziiqtj0Nozs+KHXHVKBSZ3scW
	ScfZamyJKHYfEDynltiD9ytYZ15sM3MWHSvkmr8di2jBpaHnhBwi
X-Gm-Gg: ASbGncvRrGrJcJ/a1JQZxw/3D5yUkeOMg6V4w4g7RNHenre9vSVeH8EH+dgjtybpTT8
	mwlV0W21TTbk/7YOabAyUiwqzQcFsKINqDubved9zzp86dMobftQsH76dnQ43wAmb1Awascds2E
	+94RwT9Bm5BoPp/4tTrccgpeXkS/gyqOMI9XJ5oLSQMtafdATJbVjbVzlivFnz6ySKQxxA89AlO
	C0mp69o6gm+n3+OnKNsWjzpDwOhAvCiYuRbpbjAsbE+zVU2QJHReE8e/qqQtewlkJDRITUmGJMm
	jhEICdYG
X-Google-Smtp-Source: AGHT+IFyfsnRq/TPlAXOEBq4tTLlzzCUGW+jGQSlThHUVYTr85agsMlhfIXWLMv/0CFjghXY79/T8g==
X-Received: by 2002:a17:90a:e18b:b0:2ee:fdf3:390d with SMTP id 98e67ed59e1d1-2f452edc2cfmr70372123a91.31.1736133460760;
        Sun, 05 Jan 2025 19:17:40 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:a54c:5ad3:ad27:edb7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed62cde6sm38471399a91.13.2025.01.05.19.17.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 05 Jan 2025 19:17:40 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	ioworker0@gmail.com,
	david@redhat.com,
	ryan.roberts@arm.com,
	zhengtangquan@oppo.com,
	ying.huang@intel.com,
	kasong@tencent.com,
	chrisl@kernel.org,
	baolin.wang@linux.alibaba.com,
	Barry Song <v-songbaohua@oppo.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Shaoqin Huang <shahuang@redhat.com>,
	Gavin Shan <gshan@redhat.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Yosry Ahmed <yosryahmed@google.com>
Subject: [PATCH 2/3] mm: Support tlbbatch flush for a range of PTEs
Date: Mon,  6 Jan 2025 16:17:10 +1300
Message-Id: <20250106031711.82855-3-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250106031711.82855-1-21cnbao@gmail.com>
References: <20250106031711.82855-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_191741_831404_23F1CC0C 
X-CRM114-Status: GOOD (  17.94  )
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

From: Barry Song <v-songbaohua@oppo.com>

This is a preparatory patch to support batch PTE unmapping in
`try_to_unmap_one`. It first introduces range handling for
`tlbbatch` flush. Currently, the range is always set to the size of
PAGE_SIZE.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Shaoqin Huang <shahuang@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <ioworker0@gmail.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Yosry Ahmed <yosryahmed@google.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 arch/arm64/include/asm/tlbflush.h | 26 ++++++++++++++------------
 arch/arm64/mm/contpte.c           |  2 +-
 arch/x86/include/asm/tlbflush.h   |  3 ++-
 mm/rmap.c                         | 12 +++++++-----
 4 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index bc94e036a26b..f34e4fab5aa2 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -322,13 +322,6 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
 	return true;
 }
 
-static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
-					     struct mm_struct *mm,
-					     unsigned long uaddr)
-{
-	__flush_tlb_page_nosync(mm, uaddr);
-}
-
 /*
  * If mprotect/munmap/etc occurs during TLB batched flushing, we need to
  * synchronise all the TLBI issued with a DSB to avoid the race mentioned in
@@ -448,7 +441,7 @@ static inline bool __flush_tlb_range_limit_excess(unsigned long start,
 	return false;
 }
 
-static inline void __flush_tlb_range_nosync(struct vm_area_struct *vma,
+static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
 				     unsigned long start, unsigned long end,
 				     unsigned long stride, bool last_level,
 				     int tlb_level)
@@ -460,12 +453,12 @@ static inline void __flush_tlb_range_nosync(struct vm_area_struct *vma,
 	pages = (end - start) >> PAGE_SHIFT;
 
 	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
-		flush_tlb_mm(vma->vm_mm);
+		flush_tlb_mm(mm);
 		return;
 	}
 
 	dsb(ishst);
-	asid = ASID(vma->vm_mm);
+	asid = ASID(mm);
 
 	if (last_level)
 		__flush_tlb_range_op(vale1is, start, pages, stride, asid,
@@ -474,7 +467,7 @@ static inline void __flush_tlb_range_nosync(struct vm_area_struct *vma,
 		__flush_tlb_range_op(vae1is, start, pages, stride, asid,
 				     tlb_level, true, lpa2_is_enabled());
 
-	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, start, end);
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
 }
 
 static inline void __flush_tlb_range(struct vm_area_struct *vma,
@@ -482,7 +475,7 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
 				     unsigned long stride, bool last_level,
 				     int tlb_level)
 {
-	__flush_tlb_range_nosync(vma, start, end, stride,
+	__flush_tlb_range_nosync(vma->vm_mm, start, end, stride,
 				 last_level, tlb_level);
 	dsb(ish);
 }
@@ -533,6 +526,15 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
 	dsb(ish);
 	isb();
 }
+
+static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
+					     struct mm_struct *mm,
+					     unsigned long uaddr,
+					     unsigned long size)
+{
+	__flush_tlb_range_nosync(mm, uaddr, uaddr + size,
+				 PAGE_SIZE, true, 3);
+}
 #endif
 
 #endif
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index 55107d27d3f8..bcac4f55f9c1 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -335,7 +335,7 @@ int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
 		 * eliding the trailing DSB applies here.
 		 */
 		addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
-		__flush_tlb_range_nosync(vma, addr, addr + CONT_PTE_SIZE,
+		__flush_tlb_range_nosync(vma->vm_mm, addr, addr + CONT_PTE_SIZE,
 					 PAGE_SIZE, true, 3);
 	}
 
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 69e79fff41b8..cda35f53f544 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -279,7 +279,8 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
 
 static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 					     struct mm_struct *mm,
-					     unsigned long uaddr)
+					     unsigned long uaddr,
+					     unsignd long size)
 {
 	inc_mm_tlb_gen(mm);
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
diff --git a/mm/rmap.c b/mm/rmap.c
index de6b8c34e98c..365112af5291 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -672,7 +672,8 @@ void try_to_unmap_flush_dirty(void)
 	(TLB_FLUSH_BATCH_PENDING_MASK / 2)
 
 static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
-				      unsigned long uaddr)
+				      unsigned long uaddr,
+				      unsigned long size)
 {
 	struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
 	int batch;
@@ -681,7 +682,7 @@ static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
 	if (!pte_accessible(mm, pteval))
 		return;
 
-	arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr);
+	arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr, size);
 	tlb_ubc->flush_required = true;
 
 	/*
@@ -757,7 +758,8 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
 }
 #else
 static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
-				      unsigned long uaddr)
+				      unsigned long uaddr,
+				      unsigned long size)
 {
 }
 
@@ -1792,7 +1794,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
 
-				set_tlb_ubc_flush_pending(mm, pteval, address);
+				set_tlb_ubc_flush_pending(mm, pteval, address, PAGE_SIZE);
 			} else {
 				pteval = ptep_clear_flush(vma, address, pvmw.pte);
 			}
@@ -2164,7 +2166,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
 
-				set_tlb_ubc_flush_pending(mm, pteval, address);
+				set_tlb_ubc_flush_pending(mm, pteval, address, PAGE_SIZE);
 			} else {
 				pteval = ptep_clear_flush(vma, address, pvmw.pte);
 			}
-- 
2.39.3 (Apple Git-146)


