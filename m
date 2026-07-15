Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16B7C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6yq7ihIfejq4Lg+OKf3wnzi+aWZFQXVEshsSbOMWJY=; b=Cp2OiJtRumccJkVnY3kNghZCZG
	UVI6ewFl+z5LhtFOnDridcC4FGBULiSgxSN9lb9neu42319amoGHGttnlnU6qZkB4AryIwAN0x0c5
	vKjs60O9XKyxb/nBE5uBOLlehc9oNfR3QFxa1EZudosMaBz4+0EJa/jE/in0xZB9ByQ553zvLj8YX
	DFZfbXI8rFs3l+I7rvFrOtL8ex0cD9uyGAETT+fx+T8t1czJfFJmqqKYVF7Trvy0AZurPY8l5Ey68
	af5K1d4Vi5picIEQ208L9bKLq0ID3qdKp9GvBcKQ2zfsMHFYLn6J4bkBDBCM0891DvRhn76eU+Ej4
	MB70ysvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyPy-0000000EiXu-43gM;
	Wed, 15 Jul 2026 12:08:50 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyPu-0000000EiUR-0pNJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:08:47 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so61731895ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784117325; x=1784722125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6yq7ihIfejq4Lg+OKf3wnzi+aWZFQXVEshsSbOMWJY=;
        b=RBvTQPYaPnzIIEitQAGC4kIrhPj0cd4qMcQvjAD+UOUVBPXdPAtXxLviDhn8oSpMuH
         VRoJ/HGoaDZMFd3wGxxPDq4ZM9fZWZUbEcK09pSuE+8+1VZcTtAhyGgc/l2uKX7wEr35
         kz2hNPje3evx866+9uNWbdazVbC134RsKcSF4LHvtbXntnEz6ld2PZ4bgxcQmYganAuv
         6eElAEWZnVGG8qwtcPcT71DK1rPSmhV846+njjFxcY/hJxl5arkBimC8ToMpn/1igkb8
         /79KT1s1vVL81wIh2GMmVtz9T1VzJp7YC7SoYazic60IqF6NhiarK2Arw3zPMwIoxSsv
         tISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784117325; x=1784722125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q6yq7ihIfejq4Lg+OKf3wnzi+aWZFQXVEshsSbOMWJY=;
        b=bLG6Mi7DQ0UE5rDa7iUscapX4FmyUJhZPpbqgIbnI6dM9MGxPDGS0Vr4GaHNEhO/IZ
         6MD4M6JQVGYYqr/wsXBilomi1AzsQTvMKELsLQmbvHHr5cTn01U6/0GorhButCpcw5eI
         xbxo1TF6SezK0AypIQ8nsvP+24KWBgQ4/coSCQ3EtfEm7Q9571q0YXrWtSy4/HUTqy1+
         LRn7n2n1gXt8hIE5IEpO2WC6b9niBpwZ+Hq/k8s/EApHR3j/5+Rf0pbuOxg3Tv90LE2G
         Epi+2GOagxq/1cftQ5U+u5zckPxxuGyEaKy3L8UMdYalFRj972Ip0lnPdK8QT8i4Xkom
         F8Sg==
X-Forwarded-Encrypted: i=1; AHgh+RpEESZqeSkgVje0TragtSmfGHKl82jy/MWFulf2BJ5JP4x1HdRCabWzMfd6obnHjjWsGU5vnNF6NjN9qgru3iLg@lists.infradead.org
X-Gm-Message-State: AOJu0Yyus8giMuMirI2Vy80ObItgkB7edTmhaQ6Sl3DZYIVeXvN+81Wv
	4QfHAGw1kojzpZmfqF9virwDY+2y4mCXPn/UwvL93S+8s8jdSaXb0XQY
X-Gm-Gg: AfdE7cnoIP5A9S8EznpUa//Q64xdNR7OaTvMFYtot4reHlXEAyu7g7M5QxbWt56MRyL
	1sbWRtIMUj/LOSqMOqXt0otJXixeNKLugD17GpbrhEFwgh8974C2LcXIiA+kh8te6ULxxsdHbKd
	3A9m4RF+qlyi+05nX7dQqTKJQEQkq73JMt+RcfHTOV3nNiYbG7es4DO1kNWPb13I4umHVr6ARi7
	Gal1AMdoipmJMz/HL2Li+eMpj9ia0LjFfsqiX+OLntJTR5+qdmqCpj8cLpPCpvYFMZx3Hll4ijJ
	oO3bLDbeAGjELFTY5XVd/fJ64TWNkPqW7qEWpmSoqCuFF3oFo+oQThFxqkeetWumn+0K9tk8fJ+
	BsBnKwGH/SJAimpz2J27iryqdiFrrvQQXvi2k+uSW88HES9UXamJ+ptPkVCXaSWeprsQWfWyg0R
	wny6MD7ODLMVuU0+4XuCeE4krfzr6lzUQA36Q=
X-Received: by 2002:a17:903:1a45:b0:2c6:90ec:f601 with SMTP id d9443c01a7336-2cf03bd51b0mr23224295ad.8.1784117325413;
        Wed, 15 Jul 2026 05:08:45 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf105bc642sm1216325ad.63.2026.07.15.05.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:08:44 -0700 (PDT)
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
	david@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>,
	Leo Yan <leo.yan@arm.com>
Subject: [PATCH v7 4/7] mm/vmalloc: Extend page table walk to support larger page_shift sizes and eliminate page table rewalk
Date: Wed, 15 Jul 2026 20:08:10 +0800
Message-Id: <20260715120813.3609949-5-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_050846_249107_5C26B51A 
X-CRM114-Status: GOOD (  17.26  )
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
 mm/vmalloc.c | 86 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 52 insertions(+), 34 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index b9b29f7857bb2..afc695d5973e8 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -541,8 +541,10 @@ void vunmap_range(unsigned long addr, unsigned long end)

 static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
+	unsigned long pfn, size;
+	unsigned int steps;
 	int err = 0;
 	pte_t *pte;

@@ -573,9 +575,10 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
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
@@ -585,60 +588,90 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,

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
+			if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
+						shift)) {
+				*mask |= PGTBL_PMD_MODIFIED;
+				*nr += 1 << (PMD_SHIFT - PAGE_SHIFT);
+				continue;
+			}
+		}
+
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
@@ -653,7 +686,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 		next = pgd_addr_end(addr, end);
 		if (pgd_bad(*pgd))
 			mask |= PGTBL_PGD_MODIFIED;
-		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
+		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
 		if (err)
 			break;
 	} while (pgd++, addr = next, addr != end);
@@ -676,27 +709,12 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
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


