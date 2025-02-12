Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8165BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 06:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wBYRdWhtA3egwicLkCU/PTXlbgsejMuWm2eNpqSb/0=; b=Sj8tzv0yajYXW23K60Xvn2dAlN
	D8QRc42k/UmvLaxxofpGzmLojffpyWzPeGomZYB8COahgZBkuue0TlC8+qx9cr7NpnpjoshBNY2FP
	bOJqVSp1KmDCrAZ0Q8KZikv3XOzGhSR3domdKL6/gVA5qHdrKbs8KnvPGVz2fU6YJ9x7aFb1FYfw1
	FqZ87SXpgxOwG+AjHEy6d/xjfRNaPh8uf25kOGXg/FXjPbh5vTFEtWjIun4hRryGMeo8j+aKFteyL
	XN0TJkj+qFm3O7LQvT26elU5WtE14ht90mRM+etXUCIl0uQnv+oT12uwqUqJPVhZPwGR/c7GGpd6E
	7dMXhOoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti6Sy-00000006ORZ-10Ul;
	Wed, 12 Feb 2025 06:43:24 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti6RX-00000006O6u-2Nga
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 06:41:57 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21f55fbb72bso83491185ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 22:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739342514; x=1739947314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wBYRdWhtA3egwicLkCU/PTXlbgsejMuWm2eNpqSb/0=;
        b=dkrKvc4bje9dZNQ4dDZexUQFyCroykB5KquTL2bLWHaK3t72m+t7mn0+SVAp+J70Dk
         ryUwIxPcIJBYCX8bM6NYt3v5Mru7t8CwI6LK5mZ5K7YOCDVA7UrhbaoHLBOnoVNVS3FH
         EC0gXKOhaXZifYY+d6vjYgD4HUjrAyonThSlDTgg3gU5Ln4AWd8IVI6PjwyN9XdQlbAf
         QT3kHQY5ZuH9spb7BqCnQ9DTtNLFmjd7d7xuVAyDiVxenYNYgkAprVnuqDYoKS8wy/aA
         HoxmbkylQWtXyMkcsXuvgnlH11GxWKjDYCRjonwYy800XE6cuACCwePyluXXhZXpDUO+
         G68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739342514; x=1739947314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wBYRdWhtA3egwicLkCU/PTXlbgsejMuWm2eNpqSb/0=;
        b=HNrNd3zk8c9WjE9U0Bgp8jhJjOxynMf1TyQIv+z5hb9fHgN746cWcNzXSq0BlcacvF
         ubxV0p4n4zRbQVcQkChcS/EdOegd/I9YNup0MPXSJHJw+MyzxfbWUctV8uFaEH44Wvn0
         Sr5iDWcqRhseMZLmxRnkn4+oX9FwM8io3Qk+48unRRaV7dIvpMtlmIYI7oNmS/f9UGZA
         7Z5CnYB3oaAuWpfVQPJRPl2JHulrGn1H67xvgvBtxfFVV9ndRKrO7o2iYdm/ZDJFsHWx
         4HPY+/TvqTJAjJQ9V+M3PYkqL5mJLIQL6cIOSkZ9VmXI4V2K1mfePrJaXx4N0b9Uuw3B
         n6FQ==
X-Gm-Message-State: AOJu0YxhPZkFzzkh0Vp8hSm4o1oPl/QhzWy7Quafel+GgeHXRyCO4+we
	Bg8HpmvlSzYvOclBqYFqkVtKLlWDM65dsKeGYitGg10glJOIwe5U00OqRGDGMMI=
X-Gm-Gg: ASbGncv9cwf13yFUGKDgDH48J6DIc3Yn/Kzgol9K/Lf8HrAIAXY5sdnDqQYWdkeSwz0
	zZLhTRzEhsRxO/roHMIJaXM4rT6h5pwsN0fRsCgETciyU2OSymzUJ13se2cihfC6qPiwy8IEKUN
	V+e/3fklLXnwAm9aAuAbvPoeEhb+Xl7nM8Xre8ONjolsXoE5Qa0PzhtZyzPHRwgsxPTGYS3XPpH
	lOXDodFyQFqWWyHmfKz1DLvFT6aoCrrM3RrE/WjQZzYWhVwvmo/eO5/QekIC0C9txskSCbx7vbh
	rNl1XKPzy1zEVdyQWfiZXBkmvbgnHx8GErJ4XkKHJOb1Di4N2XeI3nfC
X-Google-Smtp-Source: AGHT+IH74x3a61arrF/gqeUXfZpntwfiArJQu0CFKJ9o5bTtZZmrBTsZbUPqFZNfhNpXHrSNNu3gxw==
X-Received: by 2002:a17:902:e811:b0:21f:45d:21fb with SMTP id d9443c01a7336-220bbac3250mr30288095ad.3.1739342513657;
        Tue, 11 Feb 2025 22:41:53 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf9ab0233sm683131a91.44.2025.02.11.22.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 22:41:53 -0800 (PST)
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
	stable@vger.kernel.org
Subject: [PATCH] arm: pgtable: fix NULL pointer dereference issue
Date: Wed, 12 Feb 2025 14:40:02 +0800
Message-Id: <20250212064002.55598-1-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <be323425-2465-423a-a6f4-affbaa1efe09@bytedance.com>
References: <be323425-2465-423a-a6f4-affbaa1efe09@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_224155_761985_C596C1FB 
X-CRM114-Status: GOOD (  21.58  )
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

Reported-by: Ezra Buehler <ezra@easyb.ch>
Closes: https://lore.kernel.org/lkml/CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com/
Fixes: fc9c45b71f43 ("arm: adjust_pte() use pte_offset_map_rw_nolock()")
Cc: stable@vger.kernel.org
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/arm/mm/fault-armv.c | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index 2bec87c3327d2..3627bf0957c75 100644
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
 
@@ -123,16 +122,17 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
 
 static void
 make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
-	      unsigned long addr, pte_t *ptep, unsigned long pfn,
-	      struct vm_fault *vmf)
+	      unsigned long addr, pte_t *ptep, unsigned long pfn)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	struct vm_area_struct *mpnt;
 	unsigned long offset;
+	unsigned long start;
 	pgoff_t pgoff;
 	int aliases = 0;
 
 	pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
+	start = ALIGN_DOWN(addr, PMD_SIZE);
 
 	/*
 	 * If we have any shared mappings that are in the same mm
@@ -141,6 +141,14 @@ make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
 	 */
 	flush_dcache_mmap_lock(mapping);
 	vma_interval_tree_foreach(mpnt, &mapping->i_mmap, pgoff, pgoff) {
+		unsigned long mpnt_addr;
+		/*
+		 * If we are using split PTE locks, then we need to take the pte
+		 * lock. Otherwise we are using shared mm->page_table_lock which
+		 * is already locked, thus cannot take it.
+		 */
+		bool need_lock = IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS);
+
 		/*
 		 * If this VMA is not in our MM, we can ignore it.
 		 * Note that we intentionally mask out the VMA
@@ -151,7 +159,15 @@ make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
 		if (!(mpnt->vm_flags & VM_MAYSHARE))
 			continue;
 		offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
-		aliases += adjust_pte(mpnt, mpnt->vm_start + offset, pfn, vmf);
+		mpnt_addr = mpnt->vm_start + offset;
+		/*
+		 * If mpnt_addr and addr are mapped to the same PTE page, there
+		 * is no need to hold the pte lock again, otherwise a deadlock
+		 * will occur.
+		 */
+		if (mpnt_addr >= start && mpnt_addr - start < PMD_SIZE)
+			need_lock = false;
+		aliases += adjust_pte(mpnt, mpnt_addr, pfn, need_lock);
 	}
 	flush_dcache_mmap_unlock(mapping);
 	if (aliases)
@@ -194,7 +210,7 @@ void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
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


