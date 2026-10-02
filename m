Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41684CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACN8gkcsm61w/Jlh0ZvQ88AVu95ak6D5T7q+jQbcfkQ=; b=Pt4metZm4RlJuw09Pdw6JWiIQP
	YhrCszdlve5jtbC3PNZXk0XGxotNtJyt2aYrad5mnqPhAMjwEU5Gfrg/R4y8CoadG1ScWXJd45cy+
	t/poxS0wiYFRNua0lAiDzleRIPeNHjAXAPrKb0s7EHktX1TdVABaG259srSPig3+Bqx4MVcoZmuAk
	k5HWIn5R6npLksdB6qb0ays24G3tEsELpaIIufZE0S5NRLkJQwd6wYKj+1UDrg7pdfcSmkHJyyuiF
	6jmNW6iyEvKzXIBUiZLxwoCI7TDbG/xrWqwhaDcXICxaGFLW/Wpah0TxwyW5N7tVIdVIMv5aTL3KD
	yQ/q34Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHU-0000000B4bx-2Rvp;
	Fri, 02 Oct 2026 09:10:16 +0000
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHS-0000000B4aU-3mMP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:10:16 +0000
Received: by mail-pj2-x0c.google.com with SMTP id d9443c01a7336-2e494adf48dso5937215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932214; x=1791537014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACN8gkcsm61w/Jlh0ZvQ88AVu95ak6D5T7q+jQbcfkQ=;
        b=A7XEzqRpZkdLe59Ka/Txz+t8ZRh4ImRt+7MEYJ7f9DxFBKcUEGtjIsoXr6O6fGfhqa
         4coA/1jLrukQZ70m0Tqc4MS3NEkbbyJOmUUIksNbtTB0PCzWYJu9XRHHYzFz9+DbSYol
         Tn+aMzHVIx86ztwMnWyyUcqth3OlyNH9JWB49KAaaXW6fJ3LqewlIxPdrDqeO1bLSy6F
         U35SwEW8UBioVq+spCuozQDu6M5arl8NuEqDtTPgGXnVjSdT3/gDKcuWblwfGCkQOzqx
         lF6DNkVhkH5wfaTzMBaxIxlJdXdhxihUwM6iTXolL+OlNEBIiJMHvgGf8vQTMh+xah9A
         3k0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932214; x=1791537014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ACN8gkcsm61w/Jlh0ZvQ88AVu95ak6D5T7q+jQbcfkQ=;
        b=mEB3VM6gOcNJpUy6ymx0RUkYnZh1nh29ho3ZKJglADMxOlfZf+JmpX8q2gkaDfau9G
         q6ye0jJGQvHRIW3hwIH+rZU3pDGSWmx2dw0XFh9PVmijqGTICsqkN4xqLrQEgq/EA5GC
         Cw0Cv+4PJ2rzIDfPJu+5un990672R+8wMSWY2n+h6AmsseCsLLILTQUvub/l8SA1i/cm
         Hv/ON2mcLudC31mgr//eqt6Oe3lyR/tiXzH18mHFcjgbgtpGUxNohq5fgmBNh/aij3KQ
         N5eW9b2RW3uT59N/BDnifDWaK+LYcUA89udimkkDinsMQrMJRND7MRRNBH/K5OM1wn0R
         tfiw==
X-Forwarded-Encrypted: i=1; AKwUvBy0UsmpZLRGezf4WQn8+I0lB6Mb+sp4k6Wcww/88OJx/FLM1EJSeDDhzAzCf7lLlwWBTDYiLhdAcDIPfzHQu9al@lists.infradead.org
X-Gm-Message-State: AFq9FYL8au7t/SkhBi5Da88iaFzdZ7B/ILJD0Uym9z55DyflCtYUO5fp
	y7jOob12XhQU6HFmTBTqt0mJMZT2VVDvYT5WQ0n7Xydi6EDcw6Nnd66s
X-Gm-Gg: AYBFou0zydpqJEAh0+0ODhZ4DOIPkDRSPxkC/M8IDVNBPJVZ0eO1sJ+rL2gLU3DyBii
	BPl2x69ZPKwtqL7CvmFd2AefQ2rx0EpJ6uO30ORvD1tWU3xz/LHjfCBzcm9a0a5EjmKZheMcUr+
	8GdONn9X+A42ddEGtFOxWT6WtDPdqEo9/TIQnHCwUSRSzlo+50cWu4ll5g6QvYTpah0j1Jz3FdL
	gP32E+jRXKYI3rUaexLoNEzZB3xg36AYX1UffRPz0Lf5vdFaxmv9mrEg5+H7v5jTO4AgzDky4U/
	uSdJ5B+pgoAsRYDsnW97bWGCLAXJGL/SnF9z2hMhWzrhCBSJTo310zGozrVo19F96WqoHSZfUPi
	3dRWpz+++un8WKXy3xKlO+n38fOdZwlssqtohyaiPt9osd7xpzzUblP//Az1Ur839GvztXwiBCM
	NmNPdqo5AxKd6RyE9jKD5DH5hb+xq/gPX6egOP59Y/uDwvYsfb+nJHPsdnaPG7Pvth+uWgz51Dj
	v13wiAou2BLHaGOHzsMvA==
X-Received: by 2002:a17:902:d98c:b0:2dd:ad73:c987 with SMTP id d9443c01a7336-2e49b609901mr19907135ad.31.1790932213843;
        Fri, 02 Oct 2026 02:10:13 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:13 -0700 (PDT)
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
Subject: [PATCH v10 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge() for PTE-level block mappings
Date: Fri,  2 Oct 2026 17:09:40 +0800
Message-Id: <20261002090947.869220-4-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002090947.869220-1-jiangwen6@xiaomi.com>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_021014_964754_A9DCFC54 
X-CRM114-Status: GOOD (  15.57  )
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

vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
the feature silently unavailable on CONFIG_HUGETLB_PAGE=n kernels and
couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.

Now that arm64 and powerpc/8xx provide pte_set_huge() and
pte_clear_huge(), add the generic fallbacks next to the existing
pmd/pud_set_huge() family and convert vmap_pte_range() and
vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
around the block-mapping paths are dropped, so PTE-level block mappings
now also work on CONFIG_HUGETLB_PAGE=n kernels, and mm/vmalloc.c no
longer includes <linux/hugetlb.h>.

The fallbacks exist only to keep the build working on architectures
without PTE-level block mapping support. They are unreachable there:
the callers only run when arch_vmap_pte_range_map_size() or
arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
which requires an arch implementation. BUILD_BUG() makes that
explicit rather than silently doing nothing.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Barry Song <baohua@kernel.org>
---
 include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
 mm/vmalloc.c            | 19 ++++++-------------
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 8c093c119e5a8..a7fd51fec8a17 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2204,6 +2204,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 }
 #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
 
+/*
+ * PTE-level block mappings for vmap.
+ *
+ * pte_set_huge() only has to be implemented by architectures whose
+ * arch_vmap_pte_range_map_size() can return a size other than PAGE_SIZE.
+ */
+#ifndef __HAVE_ARCH_PTE_SET_HUGE
+static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
+				phys_addr_t phys, pgprot_t prot,
+				unsigned long size)
+{
+	BUILD_BUG();
+}
+#endif
+
+/*
+ * Likewise, pte_clear_huge() only has to be implemented by architectures
+ * whose arch_vmap_pte_range_unmap_size() can return a size other than
+ * PAGE_SIZE.
+ */
+#ifndef __HAVE_ARCH_PTE_CLEAR_HUGE
+static inline pte_t pte_clear_huge(pte_t *ptep, unsigned long addr,
+				   unsigned long size)
+{
+	BUILD_BUG();
+	return __pte(0);
+}
+#endif
+
 #ifndef __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 /*
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bea9f76ed7e74..fb757d95bde25 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -38,7 +38,6 @@
 #include <linux/rbtree_augmented.h>
 #include <linux/overflow.h>
 #include <linux/pgtable.h>
-#include <linux/hugetlb.h>
 #include <linux/sched/mm.h>
 #include <asm/tlbflush.h>
 #include <asm/shmparam.h>
@@ -100,7 +99,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	pte_t *pte;
 	u64 pfn;
 	struct page *page;
-	unsigned long size = PAGE_SIZE;
+	unsigned long size;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -121,17 +120,12 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			BUG();
 		}
 
-#ifdef CONFIG_HUGETLB_PAGE
 		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
 		if (size != PAGE_SIZE) {
-			pte_t entry = pfn_pte(pfn, prot);
-
-			entry = arch_make_huge_pte(entry, ilog2(size), 0);
-			set_huge_pte_at(&init_mm, addr, pte, entry, size);
+			pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
 			pfn += PFN_DOWN(size);
 			continue;
 		}
-#endif
 		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
 		pfn++;
 	} while (pte += PFN_DOWN(size), addr += size, addr != end);
@@ -391,25 +385,24 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 {
 	pte_t *pte;
 	pte_t ptent;
-	unsigned long size = PAGE_SIZE;
+	unsigned long size;
 
 	pte = pte_offset_kernel(pmd, addr);
 	lazy_mmu_mode_enable();
 
 	do {
-#ifdef CONFIG_HUGETLB_PAGE
 		size = arch_vmap_pte_range_unmap_size(addr, pte);
 		if (size != PAGE_SIZE) {
 			if (WARN_ON(!IS_ALIGNED(addr, size))) {
 				addr = ALIGN_DOWN(addr, size);
 				pte = PTR_ALIGN_DOWN(pte, sizeof(*pte) * (size >> PAGE_SHIFT));
 			}
-			ptent = huge_ptep_get_and_clear(&init_mm, addr, pte, size);
+			ptent = pte_clear_huge(pte, addr, size);
 			if (WARN_ON(end - addr < size))
 				size = end - addr;
-		} else
-#endif
+		} else {
 			ptent = ptep_get_and_clear(&init_mm, addr, pte);
+		}
 		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
 	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
 
-- 
2.34.1


