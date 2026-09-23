Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F448C98308
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 06:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+a2Rdy8KxrMJDsvufLYSYTpVzrgqa1a95U57Pa83CJI=; b=JWHilJzKnp2ihOE/id2/8djEFp
	Vgh3ZpzulR+3hB2kSd3Gu+NABoPLaR/CPsdmQ2I147+awmF+uAW3ZsEULUG6CwdLjcYrjSwHotzZX
	UaB9tNCfO8+YYq8XF3DRUs9mJ66qcX8W6mrcxBORXWuDqTfL2vGI2bvtDGKV9sy7FI2NnuBGtGunI
	OrtRHfOAJ3EY+zf2ejjP3kGRrsFbenfR/Rauc/XtarlOdSYgCIXqx8stgvOuUrQlMCfQ2co32r3aV
	pbM5Hf1/AoiimnYuYaSSKgN7I/dmIliKERdAMsi4PdhASt4NxYvk+YeeKiBDJ+ZNziQvnZst7KCaY
	Tegti6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GU4-00000007HeS-4Bj2;
	Wed, 23 Sep 2026 06:29:37 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GTp-00000007HTM-44Ly
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 06:29:23 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747eb79f6so2458535ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 23:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144961; x=1790749761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+a2Rdy8KxrMJDsvufLYSYTpVzrgqa1a95U57Pa83CJI=;
        b=BWdvJ9CT6u3cwU4m7/aIxuPzcjt8WnXDv89dB1LT+ehhllYFAdZp7vDXcwaJNQ/Jml
         hLDTG6MLPyQwT9FW6sohReQi2RBRz/FmpAnmpr8vxxD/YQEAaf5CZiuqYgdflcaz2kCW
         5GOQno5oNFjDKLw6Ol9A+WD46rBWcgUgYbkMX4UFCrJyC3wbJBUKw7QSWkAjAZFSnoi0
         jd8CIIqv7kX3UNFpg/dI598nBo0gb4zg87quuJYtfHHU9tBPGE4BJ9Nnnt8MEQ6SPzTD
         qFB3286HMBD3uukp2TKwoBBibSZ0+w7a7yuwGxJkEFLSe/Mt67QijIRvHGXFHxRBmlra
         2tfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144961; x=1790749761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+a2Rdy8KxrMJDsvufLYSYTpVzrgqa1a95U57Pa83CJI=;
        b=w4fsc7D+XG2S+XaweNvBmouOqzKbe2LORkJ73eXnTr7JIyBftKyg8RsDoL1ugzEbEr
         dnMRPo0mXwSiiG8ThKFsplOm6uhzuJZ8oP/ReK3ci2FKukf4rOCa30RZcxsNPMZvXU5p
         wrE4VWsZkjRcM+14NGussmt/xNdUbqcR2eEtCXgO2bhgeOm1oGKKtUQnBJLOwPD8LW5H
         Sn5yRBFiscf0Fr4JWnsN1DLhrFuz50lgXiG0uqPiV2qnRfAjoQ4UPG+JhNBI3Juh/NIp
         7h2vbM3OOJeOQY09+qAWw++p33zkpW7LpW7TZePoGchbW2LAnbfLftQwj5VrF4mmgUfj
         1TlA==
X-Forwarded-Encrypted: i=1; AKwUvBw4ILNWr7DwQZp7GROGSU4ii+GWTet8oAw915oLVrpFOJAwnoRmAqIfc8yE/AXlledTrtk5udtZyISHm/19LvMI@lists.infradead.org
X-Gm-Message-State: AFuF++ln+dhZERqqrm+LPZ8x8rNVOfYnktq/gPt/PO4GQDGIrbox1luQ
	1AwMJLGLu30AgbZ1g4KrLgWlvIS4PX5v/hcQgAfcQ4dPSRKPcUCL/n+M
X-Gm-Gg: AYBFou07r0vh9KykfgffeHRdc73t8X/tPcrJEwBObL7nPgyvgStv2s8MSArH8U6vodr
	7kuKpzVBEttsZNAfsodavfRvyVljQG3EwlQeS25o/wOSlgKQPoZQdajV5au7SpkOuSlbuIjQJO+
	XPvC/MUde79KTu1c0CE6sarwVXTxFgAzRyc2ZzapSkDyJPi9sV/g1fph0gMnOSLMLV2L7WxhI/M
	sIcOAELkkLGyZQsx/+mrW70qn0S1q+X6qU8+520oOb1uOVoHEPLi6JkRJwf0E1hXz+bpKl+qqLH
	qYSo+PdGkd6iyy9YZPcx40JPybpn/9aFUhdLeGoUOJ+L3C514NzdHPLCJKQ3dNltX09+xQjAev1
	ZJ1J02oFT/keZ2lELknmuLNySPOGMNjdaxjJR0ryjGKyVRiClmNN2XrMAqK7ElipNTV+APLB9WM
	CauxZYcQzoMr13ZhGAczyZ9zeYeNYMqpJjo1IQPbdz0QTV/QGXPz83qWK5WOp/x8US5346zjJZD
	jjk5VLjxd90lAkyO4TQzQ==
X-Received: by 2002:a17:903:390d:b0:2d6:df31:5bd0 with SMTP id d9443c01a7336-2df69d22254mr17039015ad.10.1790144961284;
        Tue, 22 Sep 2026 23:29:21 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:29:20 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Subject: [PATCH v9 07/10] mm/vmalloc: extend page table walk to support larger page_shift sizes and eliminate page table rewalk
Date: Wed, 23 Sep 2026 14:28:29 +0800
Message-Id: <20260923062832.479455-8-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923062832.479455-1-jiangwen6@xiaomi.com>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_232922_060152_14F0CFC2 
X-CRM114-Status: GOOD (  17.42  )
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

vmap_pages_range_noflush_walk() (formerly vmap_small_pages_range_noflush())
provides a clean interface by taking struct page **pages and mapping them
via direct PTE iteration. This avoids the page table rewalk seen when
using vmap_range_noflush() for page_shift values other than PAGE_SHIFT.

Extend it to support larger page_shift values, and add PMD- and
contiguous-PTE mappings as well.

Rename it to vmap_pages_range_noflush_walk() since it now handles
more than just small pages.

For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer need to
iterate over pages one by one via vmap_range_noflush(), which would
otherwise lead to page table rewalk. The code is now unified with the
PAGE_SHIFT case by simply calling vmap_pages_range_noflush_walk().

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 mm/vmalloc.c | 84 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 34 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index d475e52110e4a..6e0dec73107a7 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -558,8 +558,10 @@ void vunmap_range(unsigned long addr, unsigned long end)
 
 static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
+	unsigned long pfn, size;
+	unsigned int steps;
 	int err = 0;
 	pte_t *pte;
 
@@ -590,9 +592,10 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 			break;
 		}
 
-		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
-		(*nr)++;
-	} while (pte++, addr += PAGE_SIZE, addr != end);
+		pfn = page_to_pfn(page);
+		size = vmap_set_ptes(pte, addr, end, pfn, prot, shift);
+		steps = PFN_DOWN(size);
+	} while (pte += steps, *nr += steps, addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
@@ -602,60 +605,88 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 
 static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pmd_t *pmd;
 	unsigned long next;
+	int err;
 
 	pmd = pmd_alloc_track(&init_mm, pud, addr, mask);
 	if (!pmd)
 		return -ENOMEM;
 	do {
 		next = pmd_addr_end(addr, end);
-		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
-			return -ENOMEM;
+
+		if (shift >= PMD_SHIFT) {
+			struct page *page = pages[*nr];
+			phys_addr_t phys_addr;
+
+			if (WARN_ON(!page))
+				return -ENOMEM;
+			if (WARN_ON(!pfn_valid(page_to_pfn(page))))
+				return -EINVAL;
+
+			phys_addr = page_to_phys(page);
+
+			if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot, shift)) {
+				*mask |= PGTBL_PMD_MODIFIED;
+				*nr += 1 << (PMD_SHIFT - PAGE_SHIFT);
+				continue;
+			}
+		}
+		err = vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift);
+		if (err)
+			return err;
 	} while (pmd++, addr = next, addr != end);
 	return 0;
 }
 
 static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pud_t *pud;
 	unsigned long next;
+	int err;
 
 	pud = pud_alloc_track(&init_mm, p4d, addr, mask);
 	if (!pud)
 		return -ENOMEM;
 	do {
 		next = pud_addr_end(addr, end);
-		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
-			return -ENOMEM;
+		err = vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift);
+		if (err)
+			return err;
 	} while (pud++, addr = next, addr != end);
 	return 0;
 }
 
 static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	p4d_t *p4d;
 	unsigned long next;
+	int err;
 
 	p4d = p4d_alloc_track(&init_mm, pgd, addr, mask);
 	if (!p4d)
 		return -ENOMEM;
 	do {
 		next = p4d_addr_end(addr, end);
-		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
-			return -ENOMEM;
+		err = vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask, shift);
+		if (err)
+			return err;
 	} while (p4d++, addr = next, addr != end);
 	return 0;
 }
 
-static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
-		pgprot_t prot, struct page **pages)
+/*
+ * It can take an array of pages which are not all contiguous, but it
+ * may have contiguous chunks, as hinted by @shift.
+ */
+static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages, unsigned int shift)
 {
 	unsigned long start = addr;
 	pgd_t *pgd;
@@ -670,7 +701,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 		next = pgd_addr_end(addr, end);
 		if (pgd_bad(*pgd))
 			mask |= PGTBL_PGD_MODIFIED;
-		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
+		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
 		if (err)
 			break;
 	} while (pgd++, addr = next, addr != end);
@@ -693,27 +724,12 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages, unsigned int page_shift)
 {
-	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
-
 	WARN_ON(page_shift < PAGE_SHIFT);
 
-	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
-			page_shift == PAGE_SHIFT)
-		return vmap_small_pages_range_noflush(addr, end, prot, pages);
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
+		page_shift = PAGE_SHIFT;
 
-	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
-		int err;
-
-		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
-					page_to_phys(pages[i]), prot,
-					page_shift);
-		if (err)
-			return err;
-
-		addr += 1UL << page_shift;
-	}
-
-	return 0;
+	return vmap_pages_range_noflush_walk(addr, end, prot, pages, page_shift);
 }
 
 int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
-- 
2.34.1


