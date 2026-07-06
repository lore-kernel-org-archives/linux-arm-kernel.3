Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D804DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPgjdWe7n++lrje64ynUl06z7HSj5sqZ62BWf0c+AT8=; b=I7GszWnsuKsMm9Emx2VwmAm0tQ
	qzH9Pv2OYgiHSaA37xYeZKFvTSflwI1RxneMKaZVafVqWcz1e3SB0wC31kt/6Y60GkwfhpGSjRJe2
	oIbGJ8x0EfDCsWKuQCjPtzFm3g1D1eHT5ucHCyt/rg7c9Mi7PaXbPoeSv8n/Y9hVJ6yvn1azZrMg7
	OqLa03OrNNVUrr6pcdVqucJ5Q+BIDxJVNsy5Dt2V2MzDwc4aONTwPMoCOROVUkZLr+T7d+xVb6RGp
	l236dstAfTgFm2LS10UP7Sw96itZGUliRBYAM+kWer9cegzH6SRz6PaAM0qy1Y8bLsSupLGbTXI1q
	y13rZqug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgew4-0000000BsAw-3Lze;
	Mon, 06 Jul 2026 08:44:16 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgevz-0000000Bs7B-2n4M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 08:44:13 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso1967623a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 01:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327451; x=1783932251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPgjdWe7n++lrje64ynUl06z7HSj5sqZ62BWf0c+AT8=;
        b=IkfdGN23QqgEkb9uC+p4Ri75P4lIho/psZMh6Tmijon+cZEq42uNlnRPeWTXASuZub
         aiW8HtwG/AhMoKAu88N8kXbeChRa/RCYL/jVhZMAHTyPLkUF+PrYfbv/NZCxt7DUICv3
         Y3nlZtIuO9SDwQOqbCTo4ZqnJgDCr3Lz+pTR+oQlv8vu0zd3OphHqjP0aISc1vYbTTht
         HQkxc7cQJx6/y0CshhBUL175xpnCxXPUlpSAqRTJL6viRf06IXf7EV3tBumZgKpHXKIA
         vh1CfN6qfHfXcpy10rq4gS4pRyopH5FbPwoZSCpQcyAgVOB8BLug1Cs/k3anH6hkkJVF
         upOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327451; x=1783932251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PPgjdWe7n++lrje64ynUl06z7HSj5sqZ62BWf0c+AT8=;
        b=MFnHiCRLfSygrYk6k0sNLv02Q+6Qrd4Vk1yFpGPGQRfPwFJGWazVVeYDO1P96dzBCn
         LksUwWppU5GupgKNOaRD4V3Mwnaukc59zxirZCHNebzqs+XU7FrDHjYOytNXl/viGmM0
         JvwxUoXOi9jKl1n5PIZEzjbMHI+U6spdx/mZb0bv/fdCG5sXAhDP9WVGcFkegDMTx3V/
         l+Zx3+6RyInxMwo37YJ401GihIDpzqOh/H4sz362y9AE2GoegCRJ1a8HcOsSelaVRNuf
         9QWbWqSIaN7e5ZCk23CgglkIpyFqdDilrdrhgAd4Np8hzRlZvFk/5eB3DUHuQjiZOpxO
         etAA==
X-Forwarded-Encrypted: i=1; AHgh+RptBCjPnABCvrrabEEbQ2fISSNzecLT3nJhoYkLcx3j7IB0Erep+l/J7QAlwTgp6dO7uO8mqdtmO6eZspN4laLe@lists.infradead.org
X-Gm-Message-State: AOJu0YxxaNbRG76OsWexWQqqTkLraMuPtgvvOplQlfia09Ck2Tmr37Io
	h8NQDfXfb5oLV0OlzE9HPZsZvFghjNoRN5t6GdAMBxaFnnHxtF4d7Swb
X-Gm-Gg: AfdE7cmgpg2m2UfoNLBGGSTZAwCfu3ZHnx8GFuHJ+uXoedS/ZxbhTYKEyAaP3Zit00I
	IvdmfKQ7CU6OxIQpfzUeZ/68isEZ0urQhKPM9uwThV1A57nxhfzmve55FXulIWS/XFJMI/G6sJa
	cLmDtWrGhqhVc7QTo+rSxcF9kCQhprU2B6P/0LO8E37q4BFI+PfcC5/4ZYqYCJNAjFQyTZUOg3y
	IDEXgue6aoI4Uj+PgAhtWvuNThNPSu4SMiEj2rVCwEq2+df5A4Lj6Q4COtV8lXkcjq3L+bZWA9j
	mmhqpNhOh/wz5Oh28IGhcslmoq4lCtDYwvLRUXeQRqw2E8wBdk5ITcIr+bL0YpPE4i8gQRthIt+
	hhhEAYRBqiLbmwXAr5BZnsaNmdPmFnFXaa/VdLdARsieDJtbsmEmMHdHrV9i9T4lPWFZYlTm6WO
	3WOjvPxjd0/iomlp8UJFatIIRTOGjsK9PG4lo=
X-Received: by 2002:a17:90b:48cf:b0:37f:caeb:69df with SMTP id 98e67ed59e1d1-3829eb213a1mr9254148a91.22.1783327450781;
        Mon, 06 Jul 2026 01:44:10 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3812815c10fsm4524635a91.13.2026.07.06.01.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:44:10 -0700 (PDT)
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
	shanghaoqiang@xiaomi.com,
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v5 4/6] mm/vmalloc: Extend page table walk to support larger page_shift sizes and eliminate page table rewalk
Date: Mon,  6 Jul 2026 16:42:30 +0800
Message-Id: <20260706084232.177786-5-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706084232.177786-1-jiangwen6@xiaomi.com>
References: <20260706084232.177786-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_014411_799750_52555EB6 
X-CRM114-Status: GOOD (  17.11  )
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
 mm/vmalloc.c | 81 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 47 insertions(+), 34 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index d7fef85b241c4..d2a4d649af549 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -125,7 +125,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	pte_t *pte;
 	u64 pfn;
 	struct page *page;
-	unsigned long size = PAGE_SIZE;
+	unsigned long size;
+	unsigned int steps;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -147,8 +148,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 		}
 
 		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
-		pfn += PFN_DOWN(size);
-	} while (pte += PFN_DOWN(size), addr += size, addr != end);
+		steps = PFN_DOWN(size);
+	} while (pte += steps, pfn += steps, addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
@@ -540,8 +541,10 @@ void vunmap_range(unsigned long addr, unsigned long end)
 
 static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
+	unsigned long pfn, size;
+	unsigned int steps;
 	int err = 0;
 	pte_t *pte;
 
@@ -572,9 +575,10 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
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
@@ -584,7 +588,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 
 static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pmd_t *pmd;
 	unsigned long next;
@@ -594,7 +598,27 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = pmd_addr_end(addr, end);
-		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
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
+		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift))
 			return -ENOMEM;
 	} while (pmd++, addr = next, addr != end);
 	return 0;
@@ -602,7 +626,7 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 
 static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pud_t *pud;
 	unsigned long next;
@@ -612,7 +636,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = pud_addr_end(addr, end);
-		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
+		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift))
 			return -ENOMEM;
 	} while (pud++, addr = next, addr != end);
 	return 0;
@@ -620,7 +644,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 
 static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	p4d_t *p4d;
 	unsigned long next;
@@ -630,14 +654,18 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
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
+/*
+ * It can take an array of pages which are not all contiguous, but it
+ * may have contiguous chunks, as hinted by @shift.
+ */
+static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages, unsigned int shift)
 {
 	unsigned long start = addr;
 	pgd_t *pgd;
@@ -652,7 +680,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 		next = pgd_addr_end(addr, end);
 		if (pgd_bad(*pgd))
 			mask |= PGTBL_PGD_MODIFIED;
-		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
+		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
 		if (err)
 			break;
 	} while (pgd++, addr = next, addr != end);
@@ -675,27 +703,12 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
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
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
+		page_shift = PAGE_SHIFT;
 
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


