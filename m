Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF49CC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 03:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=880EogUQ7YhTtxOXOr4zFxC4yPI4QQKvoHhCveXLots=; b=axg99+ktllziJR1RiPPQPGJEzF
	I5rFegm9ut0RxhqR+UG9DBkANWhRFVfBuz1X5ufoYbmOXBiIt2RjNNpq2hv1khjEDCG8MNJLWLRBy
	ztIXncGpwjzTvqqIlKmj21Dj4hs6BEUT3R+WMCmU1TmeV/iNlqsej6AOICu1NJvLAOmNxALC2qL1M
	172EbeESVADWaSFg8kjGg8+S9Tfjeh3m/TaU1+EBY5mqBhCXXKvoL9xcweYOloe/v8EU0Ib2o4e1b
	BVxcu+tGyni50+0rrKs0jCSiDqCKWSeQBWt64RmNGquL5ZbjfX5zJ5gsBj1NGE8nLJMkQBtH1WAvT
	03FrchAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1timKZ-0000000DU4N-14WD;
	Fri, 14 Feb 2025 03:25:31 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tim1K-0000000DRPz-3oTq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 03:05:41 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-220e989edb6so15465285ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 19:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739502334; x=1740107134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=880EogUQ7YhTtxOXOr4zFxC4yPI4QQKvoHhCveXLots=;
        b=UtzfVDBR2zUVkEkw1p+YVrMyvBFzeSJzBFZwpjIMQty4lKyHMjn7hUTxLVGnbMCsju
         9T/38xiSCZE+c4u+Z4Y+oV3IXfde6+rdtRvY8q+QH9890UumhRy5e0q45T1bwetqbGNo
         ZJ0WA+dh1ohWSnA6y+fXI3133lp6aH4+QgKyK6TsLDhnZtsjBJhYIUCG6ZK4UTVmzA+F
         q/rNZs0NVR8aHqd5P3FXIZxdRK3/494mCYFaZcQzMJyuoeAUFlq9lnOFQK+Yy/uLf3Tl
         lDJIA/y8ziCoJiBky/dX84AHXWN/TEJnzl8r644LMeYB/EEU9dKYWfBMUk/Nv8/5Vsqm
         U1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739502334; x=1740107134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=880EogUQ7YhTtxOXOr4zFxC4yPI4QQKvoHhCveXLots=;
        b=PsXpkgC3VCAhE7j97e7We9onNPJMZxXdJdS23l0E1AnOlt8/W4KnHx+P/3S03txW+f
         l2WQk2RCRX5HfHz8mdpeZWEca8mad9/JJpmybB/FdeefUzyDbqVG7ktb9tCJaCPZRvP/
         6gOUVeEU/Qd+e+7Du5lCYqmheRD8FVA7KRob3VVPhzKLQoDWJN2kzxQmhfjgOrewj0Cb
         weSMjxcVuGVYyXOJ/y8LVsMb3KX2ELrYxLhmaj8/jLfSCMCWy+WPjhDn9Qw8tG/e7CKy
         9JDlxYffrSsZODck2fVwWIE2Mgx6gWLJP1nAxWKdutXo31eQvaPvu9Ei0nl/T5yfyxaN
         YF9A==
X-Gm-Message-State: AOJu0YyxNjE3PIg5gxubT3Yp93JCsaRONoueuTq6r2jOXRkQnSqyJq/z
	VmPKejl0Pn2fB0Zu2oy7tGTK3+NXDJu8mv/0XvKi44gzyi92Fyl+HqSV1sCba4I=
X-Gm-Gg: ASbGncuvPhpkoktGfUsph4d8etQVNVYhi6M1Gt/b6HWYxjK6mmoQNlRysszPlnB092y
	63ts5GHsHI4usaa7AmJ3YGr+1tU8qz8rAM02lgf0F7OtlCvaOXnSdUSRqvM+cWVfAuKLUIljRs2
	4shT8UH2t/cDMLaMCVE68FPSxOljx93dyEMrqehni1AdfQpLaGv95n7NtG5hNI7NflRRf4cdcRr
	MWhnSYth3yCGtk6ywk5qyJsqLA1a9JKG6pmc0sfXzJNQbyJVJUNpf3sCnAe/14sDWrgH+3vVafh
	hgjNpJApx8mWLEzm08jaTVg8RjPOKCC+sqVy6RLWLDu2a4935lzPRbmY
X-Google-Smtp-Source: AGHT+IE0j4ifNKT9H6YLxFTZoD5WzE6IGo9wOiQNtVXNtqnV2ixJQoeneDIT/l4UNMn6vQM3UgH1KQ==
X-Received: by 2002:a05:6a20:431b:b0:1ee:6032:b1e9 with SMTP id adf61e73a8af0-1ee6b360aa3mr9894032637.21.1739502334088;
        Thu, 13 Feb 2025 19:05:34 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242568a78sm2130486b3a.55.2025.02.13.19.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 19:05:33 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: linux@armlinux.org.uk,
	ezra@easyb.ch,
	david@redhat.com,
	hughd@google.com,
	ryan.roberts@arm.com,
	akpm@linux-foundation.org,
	muchun.song@linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] arm: pgtable: fix NULL pointer dereference issue
Date: Fri, 14 Feb 2025 11:03:49 +0800
Message-Id: <20250214030349.45524-1-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_190539_205795_67326002 
X-CRM114-Status: GOOD (  21.48  )
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

When update_mmu_cache_range() is called by update_mmu_cache(), the vmf
parameter is NULL, which will cause a NULL pointer dereference issue in
adjust_pte():

Unable to handle kernel NULL pointer dereference at virtual address 00000030 when read
Hardware name: Atmel AT91SAM9
PC is at update_mmu_cache_range+0x1e0/0x278
LR is at pte_offset_map_rw_nolock+0x18/0x2c
Call trace:
 update_mmu_cache_range from remove_migration_pte+0x29c/0x2ec
 remove_migration_pte from rmap_walk_file+0xcc/0x130
 rmap_walk_file from remove_migration_ptes+0x90/0xa4
 remove_migration_ptes from migrate_pages_batch+0x6d4/0x858
 migrate_pages_batch from migrate_pages+0x188/0x488
 migrate_pages from compact_zone+0x56c/0x954
 compact_zone from compact_node+0x90/0xf0
 compact_node from kcompactd+0x1d4/0x204
 kcompactd from kthread+0x120/0x12c
 kthread from ret_from_fork+0x14/0x38
Exception stack(0xc0d8bfb0 to 0xc0d8bff8)

To fix it, do not rely on whether 'ptl' is equal to decide whether to hold
the pte lock, but decide it by whether CONFIG_SPLIT_PTE_PTLOCKS is
enabled. In addition, if two vmas map to the same PTE page, there is no
need to hold the pte lock again, otherwise a deadlock will occur. Just add
the need_lock parameter to let adjust_pte() know this information.

Reported-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Closes: https://lore.kernel.org/lkml/CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com/
Fixes: fc9c45b71f43 ("arm: adjust_pte() use pte_offset_map_rw_nolock()")
Cc: stable@vger.kernel.org
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
Changes in v2:
 - change Ezra's email address (Ezra Buehler)
 - some cleanups (David Hildenbrand)

 arch/arm/mm/fault-armv.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index 2bec87c3327d2..ea4c4e15f0d31 100644
--- a/arch/arm/mm/fault-armv.c
+++ b/arch/arm/mm/fault-armv.c
@@ -62,7 +62,7 @@ static int do_adjust_pte(struct vm_area_struct *vma, unsigned long address,
 }
 
 static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
-		      unsigned long pfn, struct vm_fault *vmf)
+		      unsigned long pfn, bool need_lock)
 {
 	spinlock_t *ptl;
 	pgd_t *pgd;
@@ -99,12 +99,11 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
 	if (!pte)
 		return 0;
 
-	/*
-	 * If we are using split PTE locks, then we need to take the page
-	 * lock here.  Otherwise we are using shared mm->page_table_lock
-	 * which is already locked, thus cannot take it.
-	 */
-	if (ptl != vmf->ptl) {
+	if (need_lock) {
+		/*
+		 * Use nested version here to indicate that we are already
+		 * holding one similar spinlock.
+		 */
 		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 		if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
 			pte_unmap_unlock(pte, ptl);
@@ -114,7 +113,7 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
 
 	ret = do_adjust_pte(vma, address, pfn, pte);
 
-	if (ptl != vmf->ptl)
+	if (need_lock)
 		spin_unlock(ptl);
 	pte_unmap(pte);
 
@@ -123,16 +122,18 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
 
 static void
 make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
-	      unsigned long addr, pte_t *ptep, unsigned long pfn,
-	      struct vm_fault *vmf)
+	      unsigned long addr, pte_t *ptep, unsigned long pfn)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	struct vm_area_struct *mpnt;
 	unsigned long offset;
+	unsigned long pmd_start_addr, pmd_end_addr;
 	pgoff_t pgoff;
 	int aliases = 0;
 
 	pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
+	pmd_start_addr = ALIGN_DOWN(addr, PMD_SIZE);
+	pmd_end_addr = pmd_start_addr + PMD_SIZE;
 
 	/*
 	 * If we have any shared mappings that are in the same mm
@@ -141,6 +142,14 @@ make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
 	 */
 	flush_dcache_mmap_lock(mapping);
 	vma_interval_tree_foreach(mpnt, &mapping->i_mmap, pgoff, pgoff) {
+		/*
+		 * If we are using split PTE locks, then we need to take the pte
+		 * lock. Otherwise we are using shared mm->page_table_lock which
+		 * is already locked, thus cannot take it.
+		 */
+		bool need_lock = IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS);
+		unsigned long mpnt_addr;
+
 		/*
 		 * If this VMA is not in our MM, we can ignore it.
 		 * Note that we intentionally mask out the VMA
@@ -151,7 +160,12 @@ make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
 		if (!(mpnt->vm_flags & VM_MAYSHARE))
 			continue;
 		offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
-		aliases += adjust_pte(mpnt, mpnt->vm_start + offset, pfn, vmf);
+		mpnt_addr = mpnt->vm_start + offset;
+
+		/* Avoid deadlocks by not grabbing the same PTE lock again. */
+		if (mpnt_addr >= pmd_start_addr && mpnt_addr < pmd_end_addr)
+			need_lock = false;
+		aliases += adjust_pte(mpnt, mpnt_addr, pfn, need_lock);
 	}
 	flush_dcache_mmap_unlock(mapping);
 	if (aliases)
@@ -194,7 +208,7 @@ void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
 		__flush_dcache_folio(mapping, folio);
 	if (mapping) {
 		if (cache_is_vivt())
-			make_coherent(mapping, vma, addr, ptep, pfn, vmf);
+			make_coherent(mapping, vma, addr, ptep, pfn);
 		else if (vma->vm_flags & VM_EXEC)
 			__flush_icache_all();
 	}
-- 
2.20.1


