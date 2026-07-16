Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A182C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNKb6kLr/7ftZXllrSyALai0ySExbjYkU3LL0V9fZEA=; b=GVbulEY+snsQhUXJ5VJ2Z+J+MP
	bv4v1ZJ4oJZaht23GtBiA4GE5of4Nm/5NxotKz7xgc3BID8lipeQd8WExcJg4vx65VHIDpVHl5k2k
	uAzwERbF7hwC9kjohlG/em3Q8ObdoomxpfZQyKDH2zzOSvylWUUKbLLV2xhH2bMSmL7jtWIPxSgqm
	5DnXSQJN0MfEmjCCJQWsAeQtAuqnItoCSEy3+oV1oNO1+NBVwBKPByHMsbubtrzFvCL4FVCtbQxru
	sJJ5rlJ+PiWAqSvMAPCJjOJz0voMEg+C7hvg2gg3iYhFb9XE5zN3wsYwafvUWrdcg9m3JJJFAunhn
	DWaACWpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLR6-0000000HISy-2MpY;
	Thu, 16 Jul 2026 12:43:32 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLR3-0000000HIPN-3BUn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:43:31 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8485b358552so7268758b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 05:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205809; x=1784810609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNKb6kLr/7ftZXllrSyALai0ySExbjYkU3LL0V9fZEA=;
        b=Dj5hGxwPLOwguym0vmbW5/LQoJ8xDrsZ/2Fzt5CnZdZ2esafQJp6YtjVCeeZiQjBns
         dordAAoRiBpJfFDiC7lmas79a+UpftQa8NBJdzy6Xatx2mRXKAVspTigZn1bt886xpwk
         ZI24svBQIcDXyf7gdQljKvg57J4wx7bACPXp6U0HXBI/6FjYwVQRDXzSKoMpSWQHIRWH
         RMMB3hiL88Vudn6tyfQzC6MP1v2NMcUG8TANQ0V3pW4FM14lo5GFfcK3n+JwGYTgMvwA
         FKCaumFO+f+7tXZs13dkyV/cgN0Y8qXNTruIjolNCeqCZh8ca2Ukl7nCA9/tIKgDXhcx
         keCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205809; x=1784810609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNKb6kLr/7ftZXllrSyALai0ySExbjYkU3LL0V9fZEA=;
        b=lgmE3sDaGDF6pLDy0Gmdnwj+X24IojNxOV4g97S/dPbXSzHU+5y5N+vEhNC37CVVBv
         GWifxxLjdaDOz1EJVKXC38j2804Ohrl0rJEeDk8tZrvv6k+vR0Qzp3UNVPaWnfo9AKNc
         FilO/x94KkWZUtesYXZ4eOkUXo821XJFSdX8MMu2O8Wu8bpX1Py6IllRq94IgufPEkvQ
         4+DGwdMRRymWbqJ4zSM5Tc46GeidPL/iSV++XpYaEISCDteutgE9QkgdmG+Ug9Z2xlkk
         co1nv0Fx6U8OO0jJVtQ2m5oqBCCsf9kvXox3rbikw70KtIFuZ/m4P8mlWD9sGHYwbhZY
         edkg==
X-Forwarded-Encrypted: i=1; AHgh+RqvxtArMtGNRUddriP5Veo9X6Sdc8D/W4TihnGYmxhBkr2wdTe70aI69pFT1NiFgzYpdL3kRtVCqy/c8NwIj9hO@lists.infradead.org
X-Gm-Message-State: AOJu0YyHMUJ5znoCPwLIL83S2z94QJmJ9qj5XqA1bqBW0HdgTdfmnh+/
	6EPqM5S4qneS+0oAJZolRqD+dj8krIAJFzgu7bEuRmgMYCMLQ1tbHcyJb1AbCY8NBX0=
X-Gm-Gg: AfdE7ckescUBcfAd/0VndYkt93cO555bG+qa5L3ro9m468RQphD07s/VzGE6RXzOUsf
	16WjOtP6jtJ7VZq3mTM2VQaDVPZzyw4v4sNgIHqrL6IV1cqADopbcsZ7kyxUT2zJs0odsi3aoAO
	wkZrINhH2HLDodXtaQbXBrOATIb/FZYDTA9S+YUwHNOrIOGLT3Pqyn0mXwuLIm8cecl+zsGWCsc
	AtvjII1VRz18UaaPxaGDdYXgpRM/gkKzDpb1xJzqevQVrLuV1ZWoBzJh8ZyVP8FoGxPMF4sCUz/
	q1/2TTZ5Ay+RCX5FtBF/yfnyW/6I9DiD3iuxs2cJMpwjGHRjn0frid1nmAUlCvPk45yxbfStHSC
	MSJrTTEDAbOPlKVxybCYpqM26hxOoFfM2FeCkMtUDYh8zax4u6ktNouzVoz1n1bhjKKbciYpHM8
	7Je4a2ZopbGwHl//VzS9T4dQo=
X-Received: by 2002:a05:6a20:e615:b0:3c0:9c19:6590 with SMTP id adf61e73a8af0-3c3576c37f6mr12231332637.74.1784205808961;
        Thu, 16 Jul 2026 05:43:28 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.43.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:43:26 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 05/15] mm: extend pte batch and leaf-size helpers
Date: Thu, 16 Jul 2026 20:41:40 +0800
Message-Id: <e821b31e023ee0e5b1c54daed253034bd4da0398.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054329_829724_D08461C7 
X-CRM114-Status: GOOD (  22.12  )
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

Folded mappings such as RISC-V Svnapot need two extra pieces of generic
MM support.

First, architecture pte_batch_hint() implementations need access to the
same batch flags and normalization rules used by folio_pte_batch(), so
folded ranges can participate in batching with semantics consistent with
generic folio comparisons.

Second, leaf-size users may need the original PTE pointer instead of the
public ptep_get() view. For folded mappings, the public helper can return
a logical per-page sub-PTE, while the effective leaf size still depends
on the raw encoded entry in the page table.

Move the batch flag helpers into pgtable.h, extend pte_batch_hint() to
take the batch flags, add __ptep_leaf_size(), and update the generic
callers to use the new interfaces.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/arm64/include/asm/pgtable.h |  9 +++++-
 include/linux/pgtable.h          | 53 +++++++++++++++++++++++++++++++-
 kernel/events/core.c             |  2 +-
 mm/internal.h                    | 39 ++---------------------
 mm/mincore.c                     |  2 +-
 mm/mremap.c                      |  2 +-
 6 files changed, 65 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index a2681d7553584..018781a1fcbee 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -5,6 +5,13 @@
 #ifndef __ASM_PGTABLE_H
 #define __ASM_PGTABLE_H
 
+#ifndef __ASSEMBLY__
+#ifndef __LINUX_FPB_T
+#define __LINUX_FPB_T
+typedef int __bitwise fpb_t;
+#endif
+#endif
+
 #include <asm/bug.h>
 #include <asm/proc-fns.h>
 
@@ -1705,7 +1712,7 @@ static __always_inline void contpte_try_unfold(struct mm_struct *mm,
 }
 
 #define pte_batch_hint pte_batch_hint
-static inline unsigned int pte_batch_hint(pte_t *ptep, pte_t pte)
+static inline unsigned int pte_batch_hint(pte_t *ptep, pte_t pte, fpb_t flags)
 {
 	if (!pte_valid_cont(pte))
 		return 1;
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 8c093c119e5a8..da14328093a86 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -3,6 +3,35 @@
 #define _LINUX_PGTABLE_H
 
 #include <linux/pfn.h>
+
+#ifndef __ASSEMBLY__
+#ifndef __LINUX_FPB_T
+#define __LINUX_FPB_T
+typedef int __bitwise fpb_t;
+#endif
+
+/* Compare PTEs respecting the dirty bit. */
+#define FPB_RESPECT_DIRTY		((__force fpb_t)BIT(0))
+
+/* Compare PTEs respecting the soft-dirty bit. */
+#define FPB_RESPECT_SOFT_DIRTY		((__force fpb_t)BIT(1))
+
+/* Compare PTEs respecting the writable bit. */
+#define FPB_RESPECT_WRITE		((__force fpb_t)BIT(2))
+
+/*
+ * Merge PTE write bits: if any PTE in the batch is writable, modify the
+ * PTE at @ptentp to be writable.
+ */
+#define FPB_MERGE_WRITE			((__force fpb_t)BIT(3))
+
+/*
+ * Merge PTE young and dirty bits: if any PTE in the batch is young or dirty,
+ * modify the PTE at @ptentp to be young or dirty, respectively.
+ */
+#define FPB_MERGE_YOUNG_DIRTY		((__force fpb_t)BIT(4))
+#endif /* !__ASSEMBLY__ */
+
 #include <asm/pgtable.h>
 
 #define PMD_ORDER	(PMD_SHIFT - PAGE_SHIFT)
@@ -397,6 +426,7 @@ static inline void lazy_mmu_mode_resume(void) {}
  * pte_batch_hint - Number of pages that can be added to batch without scanning.
  * @ptep: Page table pointer for the entry.
  * @pte: Page table entry.
+ * @flags: Flags that control PTE normalization for batch comparisons.
  *
  * Some architectures know that a set of contiguous ptes all map the same
  * contiguous memory with the same permissions. In this case, it can provide a
@@ -407,7 +437,7 @@ static inline void lazy_mmu_mode_resume(void) {}
  *
  * May be overridden by the architecture, else pte_batch_hint is always 1.
  */
-static inline unsigned int pte_batch_hint(pte_t *ptep, pte_t pte)
+static inline unsigned int pte_batch_hint(pte_t *ptep, pte_t pte, fpb_t flags)
 {
 	return 1;
 }
@@ -1855,6 +1885,7 @@ static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
 	return pmd;
 }
 #endif
+
 #else /* !CONFIG_HAVE_ARCH_SOFT_DIRTY */
 static inline int pte_soft_dirty(pte_t pte)
 {
@@ -1917,6 +1948,17 @@ static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
 }
 #endif
 
+static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
+{
+	if (!(flags & FPB_RESPECT_DIRTY))
+		pte = pte_mkclean(pte);
+	if (likely(!(flags & FPB_RESPECT_SOFT_DIRTY)))
+		pte = pte_clear_soft_dirty(pte);
+	if (likely(!(flags & FPB_RESPECT_WRITE)))
+		pte = pte_wrprotect(pte);
+	return pte_mkold(pte);
+}
+
 #ifndef __HAVE_PFNMAP_TRACKING
 /*
  * Interfaces that can be used by architecture code to keep track of
@@ -2414,6 +2456,15 @@ static inline const char *pgtable_level_to_str(enum pgtable_level level)
 #define __pte_leaf_size(x,y) pte_leaf_size(y)
 #endif
 
+#ifndef __ptep_leaf_size
+#ifndef __ASSEMBLY__
+static inline unsigned long __ptep_leaf_size(pmd_t pmd, pte_t *ptep, pte_t pte)
+{
+	return __pte_leaf_size(pmd, pte);
+}
+#endif /* !__ASSEMBLY__ */
+#endif
+
 /*
  * We always define pmd_pfn for all archs as it's used in lots of generic
  * code.  Now it happens too for pud_pfn (and can happen for larger
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 51c1200ea3fdd..37b860abe9e61 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -8551,7 +8551,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
 
 	pte = ptep_get_lockless(ptep);
 	if (pte_present(pte))
-		size = __pte_leaf_size(pmd, pte);
+		size = __ptep_leaf_size(pmd, ptep, pte);
 	pte_unmap(ptep);
 #endif /* CONFIG_HAVE_GUP_FAST */
 
diff --git a/mm/internal.h b/mm/internal.h
index 874be94cf2570..aff00a3fdff50 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -343,41 +343,6 @@ static inline int anon_vma_prepare(struct vm_area_struct *vma)
 	return __anon_vma_prepare(vma);
 }
 
-/* Flags for folio_pte_batch(). */
-typedef int __bitwise fpb_t;
-
-/* Compare PTEs respecting the dirty bit. */
-#define FPB_RESPECT_DIRTY		((__force fpb_t)BIT(0))
-
-/* Compare PTEs respecting the soft-dirty bit. */
-#define FPB_RESPECT_SOFT_DIRTY		((__force fpb_t)BIT(1))
-
-/* Compare PTEs respecting the writable bit. */
-#define FPB_RESPECT_WRITE		((__force fpb_t)BIT(2))
-
-/*
- * Merge PTE write bits: if any PTE in the batch is writable, modify the
- * PTE at @ptentp to be writable.
- */
-#define FPB_MERGE_WRITE			((__force fpb_t)BIT(3))
-
-/*
- * Merge PTE young and dirty bits: if any PTE in the batch is young or dirty,
- * modify the PTE at @ptentp to be young or dirty, respectively.
- */
-#define FPB_MERGE_YOUNG_DIRTY		((__force fpb_t)BIT(4))
-
-static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
-{
-	if (!(flags & FPB_RESPECT_DIRTY))
-		pte = pte_mkclean(pte);
-	if (likely(!(flags & FPB_RESPECT_SOFT_DIRTY)))
-		pte = pte_clear_soft_dirty(pte);
-	if (likely(!(flags & FPB_RESPECT_WRITE)))
-		pte = pte_wrprotect(pte);
-	return pte_mkold(pte);
-}
-
 /**
  * folio_pte_batch_flags - detect a PTE batch for a large folio
  * @folio: The large folio to detect a PTE batch for.
@@ -430,7 +395,7 @@ static inline unsigned int folio_pte_batch_flags(struct folio *folio,
 	max_nr = min_t(unsigned long, max_nr,
 		       folio_pfn(folio) + folio_nr_pages(folio) - pte_pfn(pte));
 
-	nr = pte_batch_hint(ptep, pte);
+	nr = pte_batch_hint(ptep, pte, flags);
 	expected_pte = __pte_batch_clear_ignored(pte_advance_pfn(pte, nr), flags);
 	ptep = ptep + nr;
 
@@ -447,7 +412,7 @@ static inline unsigned int folio_pte_batch_flags(struct folio *folio,
 			any_dirty |= pte_dirty(pte);
 		}
 
-		cur_nr = pte_batch_hint(ptep, pte);
+		cur_nr = pte_batch_hint(ptep, pte, flags);
 		expected_pte = pte_advance_pfn(expected_pte, cur_nr);
 		ptep += cur_nr;
 		nr += cur_nr;
diff --git a/mm/mincore.c b/mm/mincore.c
index 53b9828037713..e23ef3f270db6 100644
--- a/mm/mincore.c
+++ b/mm/mincore.c
@@ -191,7 +191,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			__mincore_unmapped_range(addr, addr + PAGE_SIZE,
 						 vma, vec);
 		else if (pte_present(pte)) {
-			unsigned int batch = pte_batch_hint(ptep, pte);
+			unsigned int batch = pte_batch_hint(ptep, pte, 0);
 
 			if (batch > 1) {
 				unsigned int max_nr = (end - addr) >> PAGE_SHIFT;
diff --git a/mm/mremap.c b/mm/mremap.c
index 384ef4cc2195b..f8b585e59771d 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -184,7 +184,7 @@ static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr
 		return 1;
 
 	/* Avoid expensive folio lookup if we stand no chance of benefit. */
-	if (pte_batch_hint(ptep, pte) == 1)
+	if (pte_batch_hint(ptep, pte, 0) == 1)
 		return 1;
 
 	folio = vm_normal_folio(vma, addr, pte);
-- 
2.39.5


