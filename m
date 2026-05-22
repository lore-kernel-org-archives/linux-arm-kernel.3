Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C28CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 05:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYmJyQ0ywc8EPBT7bjoKD+k2F/54dp54XhgQCkuTPK4=; b=MAlww20DoRnB8htQAnbedxvTdb
	2TY0EPMmTEjnzv0yVljSsiglMACKG6chHvqkCG6uKKqgjUZao5TNCnXjUc0V+VSNgbEmsv603Kmh9
	WNUm69i/Gcqt3d9e6JwhhU2u6j2adx8aHX1Pz1OcdyZoFQfXT33CmsLRx1ZI0LR6Ads42qly7bagH
	fTRLlIpB1xIat7YrkCA65ohhW71S+HtOckk6JL74z0pjTOoZ/tqDR1qs5ERsSi4nqLGtnynrCm0XW
	NgULCt2HNgGJJrniQRjXPmu8BpbYygAGhrySPNmSQEgS38IeFwfYXq+ElMIRnq2JGj/QWKcmhle8g
	srbOgs0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQIUc-00000009rg3-0nGG;
	Fri, 22 May 2026 05:32:18 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQIUW-00000009rbL-1vNK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 05:32:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ba6485d219so52148275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 22:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779427932; x=1780032732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYmJyQ0ywc8EPBT7bjoKD+k2F/54dp54XhgQCkuTPK4=;
        b=l3HURgRw4id/xdmyC6rL/aFjCxu9hQMBI2QGmRYEHAl/vFJ22liemxKD7PynvFJJHx
         S3JKbcJef06LJcFb0QHJHerXr1ks+M00w1XCl8pHTHemksBzg+dRho09QdyZqU/GZVNu
         jUN5NjI9jIQkHXdqwC6bLmOFyaOnOU/j1SgwkLuyoxDhheDL/ZOcMr/Je8ex5uCMNZes
         HihuAdp1ULhAow3iT6KsgekhmN6inJk2ZPXXs6VcP5ZSjDSl4YgqBVoEE/6kDp6HaevB
         7H5aadezP4gmeaW7dV0abAZtwQ8WrqED9lADkjz2vWFQ8yyJvDQsOBVDKP8+khcGJmw0
         uOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779427932; x=1780032732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nYmJyQ0ywc8EPBT7bjoKD+k2F/54dp54XhgQCkuTPK4=;
        b=Rp/K78XjaqOUNw0vuSh0D1Pl9EBspUj6mwiI7/lB5KAXVLFAsc1HA20QyReCwh3Fh0
         719kNkevcCBwDIwoo2wPDQsZ4HC6WwloZLAUxuArLBrSRcxT0pOC5qKg/r+F2OuRCRWW
         w5gofGsRhz3VB0E/r8j6K/K56tHoKDyogN09RUkj8FE6jmgEFR2PiKS5um/6232DQ8RV
         rqnXDdWxMK7dNYuH4mgFT780NcGF5NrQxWrYk7vHKb54pTREJ+vfd4P5F+yvC14pugGm
         se+dNwhu8cc5d1vAhnvm0P29ITlBhwoNpoqp6VldNfa1VMwzZrP+RNwsHmSvOzD5Iamy
         h7yg==
X-Forwarded-Encrypted: i=1; AFNElJ9uoHK+9LWE1/g6EM6iA8j1dzynfxwpyHUzXzaYX4uGiYA+DC8aSmeb9qBwSK9hRmrwS4HyMEhIYakdN4IJrxh5@lists.infradead.org
X-Gm-Message-State: AOJu0YyxGNvXEz1S5OegH2OboyFFtcCr2/pTfkqfdJqsOBxCBb6xD6B4
	cAKW9hsJlOPQhUAxlQdSVOlRt/3mQti1WMs4cVW6CXQ5aDMu9evRuihK
X-Gm-Gg: Acq92OHoVuNJmyM3Nu9lL9nG/yrsATknvtcqceH7l5mrj1G38RTfBByAsC1vuix4Yor
	jfHicg0ijvfVFN0qVrCNlLACGH3KFR2wVytLOsrHGsXNz9bjpIRflszz7SedYX7uYyLet3dYSAF
	g794rY9VuvUXNHqhawyJaTVRPTqrvqpZQWLtOF4+f8EK8lOrL4w6XlhUHvjmXx2oP4HJn63CI3g
	ah9yB+E3KnURNwOKbDlPQwlojWjoIIA4ciTVC+4po4Wcy7eLpTjy/fv3rRdREqjRxv880xhRY6N
	bdglPCFUe4Hk78aRpz+rQJAgsUGfXgeGXJijL4AhjkZ3SZJFOCbNgiPWxpaASO8VMCb5weUqotB
	1oJWslTXAr/PCBdyXLD5oo6OrdT5tNBO580oZsyUCKEeo9+Vlmf1AZgcnu6UQ6oUweHz/PvaZak
	QbjJMd0IZFWgdnsCR2XRYsN0v9PlExCnLqD7whI7gAm1dIb0CvGbI=
X-Received: by 2002:a17:902:f544:b0:2ba:6ed6:aa35 with SMTP id d9443c01a7336-2beb05e4133mr22071865ad.19.1779427931640;
        Thu, 21 May 2026 22:32:11 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56d68adsm4782665ad.32.2026.05.21.22.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:32:11 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
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
	jiangwen6@xiaomi.com
Subject: [PATCH v3 4/6] mm/vmalloc: Extend page table walk to support larger page_shift sizes and eliminate page table rewalk
Date: Fri, 22 May 2026 13:31:44 +0800
Message-Id: <20260522053146.83209-5-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_223212_509085_7394184B 
X-CRM114-Status: GOOD (  16.06  )
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
 mm/vmalloc.c | 71 +++++++++++++++++++++++++++++-----------------------
 1 file changed, 40 insertions(+), 31 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 53fd4ee460ea4..deb764abc0571 100644
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
@@ -597,7 +600,27 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = pmd_addr_end(addr, end);
-		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
+
+		if (shift == PMD_SHIFT) {
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
+				*nr += 1 << (shift - PAGE_SHIFT);
+				continue;
+			}
+		}
+
+		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift))
 			return -ENOMEM;
 	} while (pmd++, addr = next, addr != end);
 	return 0;
@@ -605,7 +628,7 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 
 static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pud_t *pud;
 	unsigned long next;
@@ -615,7 +638,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = pud_addr_end(addr, end);
-		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
+		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift))
 			return -ENOMEM;
 	} while (pud++, addr = next, addr != end);
 	return 0;
@@ -623,7 +646,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 
 static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	p4d_t *p4d;
 	unsigned long next;
@@ -633,14 +656,14 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
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
@@ -655,7 +678,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 		next = pgd_addr_end(addr, end);
 		if (pgd_bad(*pgd))
 			mask |= PGTBL_PGD_MODIFIED;
-		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
+		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
 		if (err)
 			break;
 	} while (pgd++, addr = next, addr != end);
@@ -678,27 +701,13 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
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
+	return vmap_pages_range_noflush_walk(addr, end, prot, pages,
+			min(page_shift, PMD_SHIFT));
 }
 
 int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
-- 
2.34.1


