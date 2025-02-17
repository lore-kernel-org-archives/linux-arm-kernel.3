Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0E4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 02:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pyusY8LOZ2yGcku6OPIUO2n+8tkrExwGCuVjXg24M28=; b=qwYVYDzfm/gRsTpP5XcHAQeKpj
	cD6p5gaeJUt6REwddwBB5yiahe7ay6VVEnPrelhUZU607qbyCfoXaXD3HU1/LAprCmKO4zR/XpMXk
	wB9icXiyEYNSumlP0VhB4AwR+WjddJvkZNn4k+45ASrWxcp9GPvaMr6dU8240wNkiNKImwz9g8mIn
	++RqvuZxvFM5ADqnwiT6QzIybsXnGL2IRJ/CmrdeTOLguw6gojtDNLLY4DN8jLbhR5jWsFQtygvoN
	J9TXbV7YSSbpno/EIPnhsNbj0AjW06LbDDUgpKykoxrmkTbcjRFq3Fs1/0lgjkfOKPCVyNkW5Wlxr
	y5Dl9vcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjrE2-000000034yx-48id;
	Mon, 17 Feb 2025 02:51:14 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjrCa-000000034q4-1DUA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 02:49:45 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2211acda7f6so16988805ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 18:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739760579; x=1740365379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pyusY8LOZ2yGcku6OPIUO2n+8tkrExwGCuVjXg24M28=;
        b=h13u4rpyngENd3wX7QrBi3uWRnOy8+z1q6lYL0wDBzY3sah9J64ytpWeyK/+Gb78l7
         wXMgSMN0C9TD0nCK66eCPQ02LMgBnEp0Zs7PBpzraMl+NfO5bvDujUBiZXeeU5BD1e9i
         /UJcXqIXgIBFOxbUo4gH+P3LdC8tKWRnxhyvDQcrl/fLstccLEpYG3kSG9Base3VOfgd
         pRCkPlcng1bN5HW+CvM1qyrwyCNT7AZ4jHk1JNgAfB5Et4Ra1eHJ5GJ82WHUa6h2caVt
         sxVDFQG23skdlfLYtg3x9+BMhyKt1ONfYUC5+yNr7h0RsiuPh//ZgD454PiQoknO15R+
         RvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739760579; x=1740365379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyusY8LOZ2yGcku6OPIUO2n+8tkrExwGCuVjXg24M28=;
        b=T7kFbn8vERyeA9NP3KYXpuVK52LBV5gySKN+z2AgykjExIRqd14B8HvTLHEL+kwZT5
         dMjyi2SfgwQQcgDdHjEKpcxsaKOEkg0zlWWSPUA7dEZzYx1mIM4cUNtnhWXo45enGc/7
         a5d5nztjBZUOektxnG7lQIQuB3OAXj8pQB334h4SPenDui3poPK8wrNdW5Yr2dzBvm+s
         vXmKAHQP0VFIXFVMO2ANhdLlNAzAhEONnYPG4arM9qdoFuDJuWe66Lul3uY5v/xUZCUL
         QqUfXfy+rdzIZ5gJxhK80JcW0t0muydGYB8TRPE35KTy4XtaaebSVZ18mZS407ZtEVea
         UmbA==
X-Gm-Message-State: AOJu0YxTQkCPK1050g56u69/IQ6f+H1kTZM5b5auXBk5quuHY5FcmNxw
	VmN90bnVeRyQlELVHltn11CtShSOeodYwlrh7EqUjAzhmrOR9mIaRuuNr0m40gQ=
X-Gm-Gg: ASbGncs42uXWLf5JkXApI/uXEQQ0W368Ju4ABMunIJF8y3Z2FGJE14kDKNjLz50v5i9
	CjOiji5mrRH0+ApTP08Z5Q7n7m617TXrXrxGLfbNhOqnEEVw16l9//n6xQ66BLeVbBCl3J9sJlD
	0FIkunjey4kFOAFTuQJwcm0xzK3AlZAJsN3aJfvs3Jstgcr4xkXveTcnWC0cf4DAF/XXrRzp7Ks
	JkvQY5i+yJhFgBcS0Lhf5IA630l2atfIoutrdUgMyoZJRRsBG5iB2sp+E4KNgOh1Ar9KqJJVGF2
	1DuKTn/cjYwKFohHgdbXNe8OF7VDfJ/8SSsyDzYQL2aMTHa89NTfrZA=
X-Google-Smtp-Source: AGHT+IFciXt96/01ZBgsdmjwKLN9qYlNk8Q0caweyaAHGXTWtcDu/3P5N7kTsRChFbonsJzIjM6PrA==
X-Received: by 2002:a17:902:d58b:b0:21f:7821:55b0 with SMTP id d9443c01a7336-22103f064b5mr135755745ad.14.1739760578735;
        Sun, 16 Feb 2025 18:49:38 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d000sm61823135ad.111.2025.02.16.18.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 18:49:38 -0800 (PST)
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
Subject: [PATCH v3] arm: pgtable: fix NULL pointer dereference issue
Date: Mon, 17 Feb 2025 10:49:24 +0800
Message-Id: <20250217024924.57996-1-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_184944_510069_D8C5A792 
X-CRM114-Status: GOOD (  20.28  )
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
Acked-by: David Hildenbrand <david@redhat.com>
---
Changes in v3:
 - move pmd_start_addr and pmd_end_addr to the top and initialize directly
   (David Hildenbrand)
 - collect an Acked-by

Changes in v2:
 - change Ezra's email address (Ezra Buehler)
 - some cleanups (David Hildenbrand)

 arch/arm/mm/fault-armv.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index 2bec87c3327d2..39fd5df733178 100644
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
 
@@ -123,9 +122,10 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
 
 static void
 make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
-	      unsigned long addr, pte_t *ptep, unsigned long pfn,
-	      struct vm_fault *vmf)
+	      unsigned long addr, pte_t *ptep, unsigned long pfn)
 {
+	const unsigned long pmd_start_addr = ALIGN_DOWN(addr, PMD_SIZE);
+	const unsigned long pmd_end_addr = pmd_start_addr + PMD_SIZE;
 	struct mm_struct *mm = vma->vm_mm;
 	struct vm_area_struct *mpnt;
 	unsigned long offset;
@@ -141,6 +141,14 @@ make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
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
@@ -151,7 +159,12 @@ make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
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
@@ -194,7 +207,7 @@ void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
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


