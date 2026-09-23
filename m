Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428D1C98308
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 06:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFifGOrpSVWAs42j7AiNSWIOQBImLaH7pX+Uvfxk6V4=; b=lwRIl9fUlx9bmFmsJHcImL5vgL
	nZ9ak3x3TedDeNOVwaXTZu1F/68f76KnsdFGqOaRpw9Of4ZL9R/Doy9CrwbimKK/AtHQSPrklQQvq
	3o7JJqRCqKYVofLSltD872armYdKuIR30Dx0W72WwKk/RH2b9rontrJO0bvUNnhbL3PM0l72gf2HZ
	uy5RuxzZKmGzqmZPp3mEVi8/4ZBQAyA2o6ngc6BYvXAhZKtZtYeQkRZqVhhxsd18mNP9us49M14wO
	kIxQ9xL+/Re02X7dZCiglIVRpge8fNiXRlJiYAW15xpaT3/EcNVBXQvVCu2iXAKRIm0qil2/iktRC
	b+zqaibg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GTp-00000007HSz-2JLI;
	Wed, 23 Sep 2026 06:29:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GTi-00000007HMF-3wgA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 06:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aFifGOrpSVWAs42j7AiNSWIOQBImLaH7pX+Uvfxk6V4=; b=EqGw7GhU6bS1mn/79Bxd3ScMBc
	KawzIBTbhQuXFTIeK3mUDjus6GJQNF1GYQY3m4OAJvdlGNtjYgcG+eFZGwQMnccKHJT9fdGCXOk9t
	LSxS3h3xYr8fKe2zEZTlsgP1R5QI1a+geXeXfcZvxwDhWBXKceVRP0hso/S/MRwocHt2bmrJJUaHD
	puHM4RRxWbY6sIlKsvT64PLiklkQuosRkAW5D+cUutWttT7wHrYuQMMc+ZHWJ8XF1ollhuEMwZDUK
	3ojLQNJMNuePOW5ZUN8Qgj09GGNG1GEyKmJEjn+TlnbbJm6qf/Dyc5Bw3cyTKrn10HGyEgXSabBZg
	yuv/mMgQ==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9GTT-0000000EQCP-3LNY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 06:29:09 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747f0135fso3966435ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 23:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144937; x=1790749737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFifGOrpSVWAs42j7AiNSWIOQBImLaH7pX+Uvfxk6V4=;
        b=a6+x3rNDUe3jWJttPYeNEGWCf0WjJhe9y7p59n+FW3ju2Gba2nKl87qbCoS/dH6BpV
         CsFDOJ60FlKcnCWAIS+rZxkH2iuFH4Iz/7+VbZrjT0rM3T5uLACDSfitdN2gepLxSkQN
         2cDC0xB7uO6WUdGr4hwVjufvL+5v6RAjmC8lqdE0lnngWwYmQB/rRkqxyxirl8DDqJ4V
         DTaj7Eqw53TIOU5Gtb5n0g2/4/EMxS6JeDyjUGMKpxGmAioMzQdhI+fBY5+fi5NEeICV
         MCyglHgy8K6zH34RtAxpEWifyXMsCzEAkBB3A63Jjdo0oi+czm4DYpPkDlziWk2k4MTv
         9Ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144937; x=1790749737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aFifGOrpSVWAs42j7AiNSWIOQBImLaH7pX+Uvfxk6V4=;
        b=TlU/8PwtZs/56GShb0/erDDJ2Cuav2TZ8TUvLE90Kj93CWCvqCUpdvV+lR7QtwbBq/
         NsLJHGkhIi7ZbuXG1qar4jxhyy7nRbKKJwDbUvLobwpX/TAaYEhIqjatVvMbi9R+g0Pc
         QGejSwyFyMZFOEMhUVRQkpDy9fjUjfOYfdi5BfZubXVja93WBKi0kS5e5FK6T0bG0alk
         myRBA0ndmwCO6+XKJDOhrpvQ/GDgrabaRnfS+fRnJkTl+Up+3iZ+hW8LAYxYqxME3ggE
         9cSMb/b/mSDzKBDPGAtmf/4+cZfKlv+/A8qvQrSlMCpOYkxZws81So+pZOpFw3OqGQO1
         e1EA==
X-Forwarded-Encrypted: i=1; AKwUvBzI437LAThpmP9pIO/PImOF+jHk9qDzonGJdon9EfCzvhk4n0V/BGFk/if4hX5Lx8nPtbmQg8q0BkJig2SY+y/f@lists.infradead.org
X-Gm-Message-State: AFuF++nM2t1hLN0PO+S7xSNwJmxfiaacdAmQ4eubc5zzHkrgT+1eusHU
	yV2iMnUkzsMjP0aQ8trECgWaLJZMFO6sdSripet+UHPb5m42393xRgyU
X-Gm-Gg: AYBFou3cpU4+h0SIJsHvVicCw2Tf6LMK/mwFHCp+GH7O6tGLrzrwawbAefU7ldnz93a
	EkJ3K3fGK6851XeWgDANU1QKLSkM4Kbl0SqVX/eiMXHvxED5DDSet8oLFz/srWATxOD1nNNiyoK
	wqxPomh9XDViigTkE6kHn+NZMB+sBsNL1yAOVpr4DG7SGMxiDMaorsGowBjkOSp66LcAg28gtM6
	d56u7+2SyKCwN0XYAnBBw430qcBfjfDp/o4+PZIP71a70X6xSdLbUPZCJUwtZd3PjPWeZrEN9Gy
	lCde/u/BKyr3ynWkWfwrTdz+h4PpBCLlpU17CnaKScV02Xk8U2eUNV5UKD7pnM7kVidHHJZ2ioO
	5Hjsm+LLHgVCVcc6NNGmtCQU8nDRYwU0gkwtBn2x3zJtSlyB4mY7gORLn8951dcPy5QMCx6g76s
	nI/L6rEpWOO1dDeSDQ41arUFdOcA7wGWFlGrBThVyOFV5MT0CBRfppcjWHHKGFiJSTS5F6NF0kA
	oFG2m/iFPk318u2tXtq37KtRkkvPp0z
X-Received: by 2002:a17:903:3904:b0:2dd:c100:9435 with SMTP id d9443c01a7336-2df69e02500mr15989755ad.51.1790144936998;
        Tue, 22 Sep 2026 23:28:56 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:28:56 -0700 (PDT)
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
Subject: [PATCH v9 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge() for PTE-level block mappings
Date: Wed, 23 Sep 2026 14:28:25 +0800
Message-Id: <20260923062832.479455-4-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923062832.479455-1-jiangwen6@xiaomi.com>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_072900_473047_E671B5B5 
X-CRM114-Status: GOOD (  15.96  )
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


