Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB7AC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 05:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iHoeiOn8M1Js0lz6hY05jc0JjGSYBNXCmk3v6q8ZOE=; b=V+Ou83j9CG56ziB+vwBspgLHm1
	0V3yswuzBnORSJjkGUAOEcNONW2/LbAo3TCwRq4Ms8w9TqdWpl3xYt4sCZ/u8oNsKNMYicDISmh6+
	3W3+zBJDAiplbzzsj4BQzP8/Z4TAZxi0k5d42NpDK1qn0teqHtV+NVeobp1yNyZBboFmc5i5AkdYK
	9+ms3Kl0dSjkLg/I0nH0Buo4GWc4/Z2uBIT2lmVzAmwvPGb7l/bcYk9w4KrmllfHodIHe+AHbaTQN
	Eld6aDjNWzKuaeF/24nIVTSVNNaOHhYKanWePIopL0fngDDZdy9BY+oyCNvR2fWYtUgk/QD4iFTxo
	WY8VgAbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74hG-0000000Ab76-0nzC;
	Thu, 17 Sep 2026 05:30:10 +0000
Received: from mail-pj2-x14.google.com ([2607:f8b0:4864:39::14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74hB-0000000Ab4o-1Wxt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 05:30:06 +0000
Received: by mail-pj2-x14.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso146875a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 22:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789623004; x=1790227804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/iHoeiOn8M1Js0lz6hY05jc0JjGSYBNXCmk3v6q8ZOE=;
        b=rU7yV7/Zh2VaG+cTALXmY9rE5MJe83XGl+69cx0Z1HLn/xu3ctZocfq2oVgpwpCgsL
         TfDinOF3ns1SZKvCEgeicI4VysC6TQ6Oj4A/5/oHRNMwQMzcDOVB9hyYwv1S7FcuNKvd
         eW82Tc4xNlYcCOBFpfwKZcLGFOBVAcoszGVSeiHKgpER+mnAMW+XmHob1Bm/yHl+aHzt
         sdaWjSSHW0WOZ7Y8VP/S3JXqO0UVmAQKOG/sPGHCk2XUVj23N+8lA4hMXC31Pq3zqRKq
         l4Orvo4Jx2z642jP6ID7PecGKXMFHLNE89W5aHl7RltU3SZsaa5eG8nRPKSIB8yvdIfY
         9V+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623004; x=1790227804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/iHoeiOn8M1Js0lz6hY05jc0JjGSYBNXCmk3v6q8ZOE=;
        b=zMEGlW/O+MhYVLUg833Wjj0WqUR+E49TTQxij3to6H6XgxkCZZuEp53K7NXtR6LgPg
         z1EYutxZsWdkeMOEJ0646Z3XcGdCItgDuBxpri79avXr1AOSf/U/VBzxVeiEAwrT8szo
         1N65LmoZbalNu91vCDTo7DMTeRM9P5SzUzu0RDOClkN3xLPCkCMQtAaFCNbbM51XRBjI
         EqT/5eiur18tYqZcpY3hNfES4cwrYfewIgHv9Z18k4pJa9ep0S/1sPmTkVXYYVbgwYmt
         zBCqo1eiet9uwCcE1lVUZ5/9hJF8Ssh7T+pmCOpnKprshfOQ/f8+aFABkeg7VyvWe9Iz
         lTiQ==
X-Forwarded-Encrypted: i=1; AKwUvBypdzG1WP/DeAAn7kL7ooK/rpHd5GYSF2U5cFN8TwHBQrv595pU/mzN418Hoy3yAx04/9Q5yJIe6VfJDfWocO2d@lists.infradead.org
X-Gm-Message-State: AFuF++npgcfj/kP/6gYUUXqX4Bjn+BnF5HEoWsBdtsgehbR9knpfEHL3
	KsGzF2cs+TgePtiOIpZ9cEIVWCP1g1G0gbxMKFi8fZlsnjgcjG3FvTVu
X-Gm-Gg: AYBFou1HSHu/t+qYv2G2WiH2DriI/6w2OS2hvwrwUAF5TRnbdfKbWQjq71OCa/8N3Ft
	jLepydOVRJMoEs5GEl8npvrGQlGaRCTiGnXMgKMpitY4UTl5uR/kFNO/9zUG0bDq4mP70By4tXj
	d9dj0VpyP3WZFRPuNk3CWi7GCBOY3SKCYLMaM9oF1uHo/S5RKF7ofJ3qaESSNsYJL1Jzbl1GUag
	fYVLx0BdNW8FaqdU81xf5ZYHB9ocjmWTqLzYNf1fKSmqYcN9iVghbvWSXRBgW2fCdCYwcgxssNu
	1oJITZyQYlwTsXGR8uRaOzwOJxxH7s5JL5AvsTurBUyhrBTrB2BBI/3KYNRBIpvuQ5c2EQsRILE
	2SUyim2yb59dYrHL5Xi6oqNRHIKLwvzmjKpvBSxg6X/X9XviZLpC2dvuaVJNDc1cLkwZOxs2DIV
	dbL2CrCdndyMBMOqKWnO/+OAhgCYvj9NWo94o8+DhlTB5QHq2o1TJZSOqSVSHpTveJFJSQj1Tvf
	OSaUlvXZOCdXO68TJuaEgbAb24=
X-Received: by 2002:a17:90b:5484:b0:39d:b57e:b47d with SMTP id 98e67ed59e1d1-39e35f809c5mr2777472a91.8.1789623004300;
        Wed, 16 Sep 2026 22:30:04 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:30:03 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
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
Subject: [PATCH v8 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge() for PTE-level block mappings
Date: Thu, 17 Sep 2026 13:29:26 +0800
Message-Id: <20260917052933.188679-4-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_223005_611240_CF43591F 
X-CRM114-Status: GOOD (  15.64  )
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

From: Wen Jiang <jiangwen6@xiaomi.com>

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
which requires an arch implementation. WARN_ON_ONCE() makes that
explicit rather than silently doing nothing.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
---
 include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
 mm/vmalloc.c            | 19 ++++++-------------
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index cdd68ed3ae1a9..349ced999f959 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2134,6 +2134,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
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
+	WARN_ON_ONCE(1);
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
+	WARN_ON_ONCE(1);
+	return __pte(0);
+}
+#endif
+
 #ifndef __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 /*
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bb6ae08d18f58..025b3a848d564 100644
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
@@ -98,7 +97,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	pte_t *pte;
 	u64 pfn;
 	struct page *page;
-	unsigned long size = PAGE_SIZE;
+	unsigned long size;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -119,17 +118,12 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
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
@@ -368,25 +362,24 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
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


