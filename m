Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E4FCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAa7S8+lmtacBoTWuk3/nEzfs1vLgSAXTfB0g6A9cN4=; b=hRhm2ZsbHs262A6w7JgetuDEiQ
	BZ6HRN0qnnn+aT+v79Ly/VoMpqsgEuIhZTlLDxTHh6Xv2ZdUFfmV4p92KRWbN9XUnfgljeid7TimY
	Q9pO4Lf+r1W+cTZHpOYSJZ1q6a8FL7Zz5YsbIy5EdMy6KzqJcB/sbeIKQmhd3T5iByhyucyw/Eds9
	5xDnNEJ6SQoKzMlh3y6Erb17yUPMN38ANFeZTrs8FxT5kZHyP93EutcSuEYFFxJVgk0QIrsGkKfPc
	vr90IupqEkKh2GCRtsmQJTpLfCv+Qi7eYDz2I9zlIpMSl7ISqBweDUtPnJpYWDYmTFN7B++3u2q3d
	MT16oMPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSZw-000000056Cb-24nU;
	Thu, 14 May 2026 09:42:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSZv-000000056Ae-0dvp
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 09:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XAa7S8+lmtacBoTWuk3/nEzfs1vLgSAXTfB0g6A9cN4=; b=lyVYgryA6jNDLsdB9rl1qvn7OP
	7CHwUFf0eRIKtoEm4G8iWHmu+hiCduePSVweu2NNw2h7akyRd7pTMwl2gV855GkZnmWciTlv5ZkF+
	YYNs8UkIIJ1IwrYhk1yvy8EK4HaMzHtKpieNmmxawSJnFA5Us50ScmYcZZvnlQ7WteR7xrh74+fQt
	G91m3geYbNs4dYPN9Gi3xzV1Pb5UKEMe2M7kBM4fZHlydOG3uf8u/PYuUiM6gunGgM5ciHJznhfcF
	QjaVlR71ppCWAbHAh9zAEK6bl2WpVY6PXbgzxAvlCC/j37kXlJ3xghoCpysfoF40qEsU44UCP/pL2
	1kmsaLYA==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSZr-00000002Znc-47Tr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:42:02 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-367c26471f5so4043589a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 02:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778751718; x=1779356518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAa7S8+lmtacBoTWuk3/nEzfs1vLgSAXTfB0g6A9cN4=;
        b=WR+CqMtusriVdXSVKM7ToFBEcBSY+kCOvbIzl7peWCFuOrEggKOZZGTy3AbLk4Juh5
         pFNv7M0rXXmXeWhYONVzDHzsC1uzC85VFG4v/Lyq/1b2dEdzNpHPgN4jwGCuXbQFfeEW
         EYNjM2GobxbFOXnB+SpEXQVt+7zyzfv/Ik2Ce2bCCvkGovrUpYA79pvoCvdxcIQUVwoV
         EMDoMqJPyVDv7HBhl3tQdNKtZ4JK7Qk8MYbliBrVAqvs7IeTY4MyMYU/Txla/SNszXJx
         BdEYQ9oQv9zgXbdXGboweo6KW9qvpA6s0YT4k7Nvd5riMUHyWK1bOoUqOGghjUVb1vOv
         C1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751718; x=1779356518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XAa7S8+lmtacBoTWuk3/nEzfs1vLgSAXTfB0g6A9cN4=;
        b=l6KGRnNAcsA/8ew3z8ZkwQEqaOllm9UbRdFMLovIaWnU9VPEFPFDikb3DwUd/66RhK
         6ys77VpJ47iDrBAdOtQfw4Oz3U0cfVXaGWHfHRkLJ9aPXEtcLVBR5UxvERot95Ptxy3Q
         lVIEv9GrSnfT2AYGfjtO6bHMvGZm5OBEknbOrAC5iRLyB/bAeLRMjtVINtZ+WOi5HIj7
         nP9+pF47JdsL1JhrJE+AnvvhzKr9F3mh6Gq1jr6sf55NdyYs3dPn92gd8s+9DAVamyYa
         YC2tC6nOI2C5WGDg5XhQ17imyQnyPvSjp4NhihGmg9Ey57SyyU3Oepv+QQn5Y8+MP2bL
         fv5w==
X-Forwarded-Encrypted: i=1; AFNElJ8k/UwzK37FIE5NO8EA/QP196MkeRR0JKodkHY/NCxqLzBPfxndeorAbhbtIIlbkCxHrwyXM1A0zDedZ21lLLP3@lists.infradead.org
X-Gm-Message-State: AOJu0YymNakaRmECuMALrNFCWgKEiW+S/NonWHEcELaHoHkdx4I5zYOn
	Se77sYJz4cb5Bf7gEZu1+1IhqnK4bZhDOFrQrjjq+Ok7y6dBDc5lm1o8
X-Gm-Gg: Acq92OFLfKp+f4+IqjnGA79wm+LeKSl+IQBz+ndTqUf/moK6mscstox9ZeF6WYjsUuR
	gESUtJy4z29JDp/3Yrp5GESyOfPYU7W/pUHL5AK7YUssfux3BSBFXSy8+C4ylen/MuFJn4RcAlx
	TNTmb11diAHJzRf1YvnxI6FK+Vn3/foS//QtZCN1GYU/niAPdsQ9QID6grTJAfsYin/TEDZNM+g
	ZQjJ/yeNBpGxR6L7g04CdqHwAwnqj3DPsLIris7YAP+MOetKVv5fT3tOAF+wWCYIxGIH3MhuYe+
	j2caXbAhaRI+zbef+O2deTmWTBsB77LWA74nkbbSgZCaM4IV7iKcdgb1SxJYaVpUMu5Z7fRhbru
	3TN6Cl8zzWbshmBYkfaZcfIJpevllWocWeck4DvcZXMKBKHQOGQQkaoeX3vIb7j2o64VY7VkTUG
	objAi9MQilM5cW31iCvrLoouc+9aem7A9gAC9dk/kkCNFAcQ==
X-Received: by 2002:a17:90a:1c97:b0:368:ddd7:abcd with SMTP id 98e67ed59e1d1-368fb7992e1mr3845479a91.27.1778751718260;
        Thu, 14 May 2026 02:41:58 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb114a70sm2351244a12.22.2026.05.14.02.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:41:57 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: baohua@kernel.org,
	Xueyuan.chen21@gmail.com,
	dev.jain@arm.com,
	rppt@kernel.org,
	david@kernel.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org,
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v2 4/7] mm/vmalloc: Extend page table walk to support larger page_shift sizes and eliminate page table rewalk
Date: Thu, 14 May 2026 17:41:05 +0800
Message-Id: <20260514094108.2016201-5-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_104200_464492_3FE5251A 
X-CRM114-Status: GOOD (  16.26  )
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
contiguous-PTE mappings as well. Rename it to vmap_pages_range_noflush_walk()
since it now handles more than just small pages.

For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer need to
iterate over pages one by one via vmap_range_noflush(), which would
otherwise lead to page table rewalk. The code is now unified with the
PAGE_SHIFT case by simply calling vmap_pages_range_noflush_walk().

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 mm/vmalloc.c | 64 +++++++++++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 9bfd0aa34..516d40650 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -543,8 +543,10 @@ void vunmap_range(unsigned long addr, unsigned long end)
 
 static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
+	unsigned long pfn, size;
+	unsigned int steps;
 	int err = 0;
 	pte_t *pte;
 
@@ -575,9 +577,10 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
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
@@ -587,7 +590,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 
 static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pmd_t *pmd;
 	unsigned long next;
@@ -597,7 +600,20 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = pmd_addr_end(addr, end);
-		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
+
+		if (shift == PMD_SHIFT) {
+			struct page *page = pages[*nr];
+			phys_addr_t phys_addr = page_to_phys(page);
+
+			if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
+						shift)) {
+				*mask |= PGTBL_PMD_MODIFIED;
+				*nr += 1 << (shift - PAGE_SHIFT);
+				continue;
+			}
+		}
+
+		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift))
 			return -ENOMEM;
 	} while (pmd++, addr = next, addr != end);
 	return 0;
@@ -605,7 +621,7 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 
 static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pud_t *pud;
 	unsigned long next;
@@ -615,7 +631,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = pud_addr_end(addr, end);
-		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
+		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift))
 			return -ENOMEM;
 	} while (pud++, addr = next, addr != end);
 	return 0;
@@ -623,7 +639,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 
 static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	p4d_t *p4d;
 	unsigned long next;
@@ -633,14 +649,14 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = p4d_addr_end(addr, end);
-		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
+		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask, shift))
 			return -ENOMEM;
 	} while (p4d++, addr = next, addr != end);
 	return 0;
 }
 
-static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
-		pgprot_t prot, struct page **pages)
+static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages, unsigned int shift)
 {
 	unsigned long start = addr;
 	pgd_t *pgd;
@@ -655,7 +671,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 		next = pgd_addr_end(addr, end);
 		if (pgd_bad(*pgd))
 			mask |= PGTBL_PGD_MODIFIED;
-		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
+		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
 		if (err)
 			break;
 	} while (pgd++, addr = next, addr != end);
@@ -678,27 +694,13 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages, unsigned int page_shift)
 {
-	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
-
 	WARN_ON(page_shift < PAGE_SHIFT);
 
-	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
-			page_shift == PAGE_SHIFT)
-		return vmap_small_pages_range_noflush(addr, end, prot, pages);
-
-	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
-		int err;
-
-		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
-					page_to_phys(pages[i]), prot,
-					page_shift);
-		if (err)
-			return err;
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
+		page_shift = PAGE_SHIFT;
 
-		addr += 1UL << page_shift;
-	}
-
-	return 0;
+	return vmap_pages_range_noflush_walk(addr, end, prot, pages,
+			min(page_shift, PMD_SHIFT));
 }
 
 int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
-- 
2.34.1


