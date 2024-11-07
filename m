Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBDFD5D689
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 20:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oo5C9e0+cl8r7hE7UWmRxwqyWt2dE16i/xTv+Vqu/GQ=; b=auXtLy/s93FbCSAeME6bSsTpjY
	gSlA59bLV9nl2L1ZHBWGBieo8NXy+S9+NY/uS49uP9f32d+DsB/LmhxLUbS/N6AtI1SPMdeeawCSH
	zRrhftovlgzYbRmiEWAx+AI4bhajA0GBsUCgUp2l7Zx5M+xImDzbIVSp7HZO2UlDMytTwNGG/4Yh1
	vKz1wjamB/K+wR1RAaxltqodNZ1DfRT5Up7clJddzUGH9koLUFEJWVnQSUuMdw2YLcJRU2QSJrWL7
	+GXbrbD367CdT2rP3peNmA2wN3HN51nw13tPpZKSXJvaGcU/dMhkkMHu9C6XVZlLNoD8NZjVDDebq
	JLYH9H3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t994u-00000008EoX-3Yhz;
	Thu, 07 Nov 2024 20:26:04 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t98zk-00000008E3H-2tUf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 20:20:46 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6ea527764c3so24331677b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 12:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731010843; x=1731615643; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oo5C9e0+cl8r7hE7UWmRxwqyWt2dE16i/xTv+Vqu/GQ=;
        b=dVXgi5wL3+/yZhsfifJerY+kXuSSmQSnd1rWGbexeRB0BTWuBa0N+DnUkk/TaNmGqJ
         FlUByfNHPnL/OgsvEOuNrLccx3bDT9OqQyRg8aCGRDyzuVw1sIUYAOyv2MTo/D1PlTkj
         7VqavHOnRMTGVVTw5u0NGAN9J8GFNLPC4nGKSMYXNotm/OS6DxiPVMTfRiDxo/+dGjG3
         D4QkscChzaal2X0GG373tuxIz0wUiLzjwnr0pZ7ZM9UyNatde86UGsGNsz7VHnL3E4GR
         iucMlycad82rWUDHWadRcOCDkUxxp9pwHOQU1zs0cMvmvnUUkFyuIgU+4GijKGy94k1L
         8zOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731010843; x=1731615643;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oo5C9e0+cl8r7hE7UWmRxwqyWt2dE16i/xTv+Vqu/GQ=;
        b=KAVjfQvn5Xw4QChplD9p4hFEJxoe2zvp9afqzYLz34H9IFdenZ7wHHaqwhnB9EbzvS
         wHg7jZER9xtZsLWh3S+YV7dOcQord33GU3kHKoj5+V9vMe+FV9V465RDKVG1T/mRlBp4
         lukkDcUNxvQYqVQ/6zzIKfXLkk0QkVXQ0Y4THu+K/0tAfoOBhEgY/mwogqpx+3InlWZT
         O+ovZ/ofTonAUYGBqO/HVt7p+Op0FwvBPc2nfBCgDZRRa2dVvbbSPxeeDcu14w/ku+Fx
         8tUy+rfS1fWohCq36OWbJz+fCiONY2ixCKPq2L/mfGVmSkP4xSvvEl/iCKCmzVvN21nt
         qUOw==
X-Forwarded-Encrypted: i=1; AJvYcCVnp0iQxl5/+Hq7cnAlKjyT/N9sZWVvtmaOn5BEEkUpoQOuk/2BIzcQ06MmaX1QX4fXA0I/d2zogRJl+nYZuYGF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2z1WYWR7A8a/D8XcddlVNwQD+Oe+Ceuvq0So2SHm9eFgj0qhE
	fN3xOlmk0spvcQMHcvpV+UPMoR8Sh7ToOX3QigYxqWFVWVeU4yAmjYL+XHhO3Fcr8TCZulyDkNp
	YEw==
X-Google-Smtp-Source: AGHT+IFItECqZ2dxgSyANVkerUl0Fg/UFqJy0LSXkY8wHLj1uLzeJdS7jFKPfch4UM5ukL5EJb9In+OVPNo=
X-Received: from yuzhao2.bld.corp.google.com ([2a00:79e0:2e28:6:a4c0:c64f:6cdd:91f8])
 (user=yuzhao job=sendgmr) by 2002:a05:690c:4a13:b0:6e3:b93:3ae2 with SMTP id
 00721157ae682-6eaddd704d6mr14027b3.1.1731010842758; Thu, 07 Nov 2024 12:20:42
 -0800 (PST)
Date: Thu,  7 Nov 2024 13:20:29 -0700
In-Reply-To: <20241107202033.2721681-1-yuzhao@google.com>
Mime-Version: 1.0
References: <20241107202033.2721681-1-yuzhao@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107202033.2721681-3-yuzhao@google.com>
Subject: [PATCH v2 2/6] mm/hugetlb_vmemmap: add arch-independent helpers
From: Yu Zhao <yuzhao@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_122044_762207_28595036 
X-CRM114-Status: GOOD (  22.39  )
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

Add architecture-independent helpers to allow individual architectures
to work around their own limitations when updating vmemmap.

Specifically, the current remap workflow requires break-before-make
(BBM) on arm64. By overriding the default helpers later in this
series, arm64 will be able to support the current HVO implementation.

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 include/linux/mm_types.h |  7 +++
 mm/hugetlb_vmemmap.c     | 99 ++++++++++++++++++++++++++++++++++------
 2 files changed, 92 insertions(+), 14 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 6e3bdf8e38bc..0f3ae6e173f6 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1499,4 +1499,11 @@ enum {
 	/* See also internal only FOLL flags in mm/internal.h */
 };
 
+/* Skip the TLB flush when we split the PMD */
+#define VMEMMAP_SPLIT_NO_TLB_FLUSH	BIT(0)
+/* Skip the TLB flush when we remap the PTE */
+#define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(1)
+/* synchronize_rcu() to avoid writes from page_ref_add_unless() */
+#define VMEMMAP_SYNCHRONIZE_RCU		BIT(2)
+
 #endif /* _LINUX_MM_TYPES_H */
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 46befab48d41..e50a196399f5 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -38,16 +38,56 @@ struct vmemmap_remap_walk {
 	struct page		*reuse_page;
 	unsigned long		reuse_addr;
 	struct list_head	*vmemmap_pages;
-
-/* Skip the TLB flush when we split the PMD */
-#define VMEMMAP_SPLIT_NO_TLB_FLUSH	BIT(0)
-/* Skip the TLB flush when we remap the PTE */
-#define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(1)
-/* synchronize_rcu() to avoid writes from page_ref_add_unless() */
-#define VMEMMAP_SYNCHRONIZE_RCU		BIT(2)
 	unsigned long		flags;
 };
 
+#ifndef VMEMMAP_ARCH_TLB_FLUSH_FLAGS
+#define VMEMMAP_ARCH_TLB_FLUSH_FLAGS 0
+#endif
+
+#ifndef vmemmap_update_supported
+static bool vmemmap_update_supported(void)
+{
+	return true;
+}
+#endif
+
+#ifndef vmemmap_update_lock
+static void vmemmap_update_lock(void)
+{
+}
+#endif
+
+#ifndef vmemmap_update_unlock
+static void vmemmap_update_unlock(void)
+{
+}
+#endif
+
+#ifndef vmemmap_update_pte_range_start
+static void vmemmap_update_pte_range_start(pte_t *pte, unsigned long start, unsigned long end)
+{
+}
+#endif
+
+#ifndef vmemmap_update_pte_range_end
+static void vmemmap_update_pte_range_end(void)
+{
+}
+#endif
+
+#ifndef vmemmap_update_pmd_range_start
+static void vmemmap_update_pmd_range_start(pmd_t *pmd, unsigned long start, unsigned long end)
+{
+}
+#endif
+
+#ifndef vmemmap_update_pmd_range_end
+static void vmemmap_update_pmd_range_end(void)
+{
+}
+#endif
+
 static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 			     struct vmemmap_remap_walk *walk)
 {
@@ -83,7 +123,9 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 
 		/* Make pte visible before pmd. See comment in pmd_install(). */
 		smp_wmb();
+		vmemmap_update_pmd_range_start(pmd, start, start + PMD_SIZE);
 		pmd_populate_kernel(&init_mm, pmd, pgtable);
+		vmemmap_update_pmd_range_end();
 		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
 			flush_tlb_kernel_range(start, start + PMD_SIZE);
 	} else {
@@ -164,10 +206,12 @@ static int vmemmap_remap_range(unsigned long start, unsigned long end,
 
 	VM_BUG_ON(!PAGE_ALIGNED(start | end));
 
+	vmemmap_update_lock();
 	mmap_read_lock(&init_mm);
 	ret = walk_page_range_novma(&init_mm, start, end, &vmemmap_remap_ops,
 				    NULL, walk);
 	mmap_read_unlock(&init_mm);
+	vmemmap_update_unlock();
 	if (ret)
 		return ret;
 
@@ -228,6 +272,8 @@ static void vmemmap_remap_pte_range(pte_t *pte, unsigned long start, unsigned lo
 		smp_wmb();
 	}
 
+	vmemmap_update_pte_range_start(pte, start, end);
+
 	for (i = 0; i < nr_pages; i++) {
 		pte_t val;
 
@@ -242,6 +288,8 @@ static void vmemmap_remap_pte_range(pte_t *pte, unsigned long start, unsigned lo
 
 		set_pte_at(&init_mm, start + PAGE_SIZE * i, pte + i, val);
 	}
+
+	vmemmap_update_pte_range_end();
 }
 
 /*
@@ -287,6 +335,8 @@ static void vmemmap_restore_pte_range(pte_t *pte, unsigned long start, unsigned
 	 */
 	smp_wmb();
 
+	vmemmap_update_pte_range_start(pte, start, end);
+
 	for (i = 0; i < nr_pages; i++) {
 		pte_t val;
 
@@ -296,6 +346,8 @@ static void vmemmap_restore_pte_range(pte_t *pte, unsigned long start, unsigned
 		val = mk_pte(page, PAGE_KERNEL);
 		set_pte_at(&init_mm, start + PAGE_SIZE * i, pte + i, val);
 	}
+
+	vmemmap_update_pte_range_end();
 }
 
 /**
@@ -513,7 +565,8 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
  */
 int hugetlb_vmemmap_restore_folio(const struct hstate *h, struct folio *folio)
 {
-	return __hugetlb_vmemmap_restore_folio(h, folio, VMEMMAP_SYNCHRONIZE_RCU);
+	return __hugetlb_vmemmap_restore_folio(h, folio,
+			VMEMMAP_SYNCHRONIZE_RCU | VMEMMAP_ARCH_TLB_FLUSH_FLAGS);
 }
 
 /**
@@ -553,7 +606,7 @@ long hugetlb_vmemmap_restore_folios(const struct hstate *h,
 		list_move(&folio->lru, non_hvo_folios);
 	}
 
-	if (restored)
+	if (restored && !(VMEMMAP_ARCH_TLB_FLUSH_FLAGS & VMEMMAP_REMAP_NO_TLB_FLUSH))
 		flush_tlb_all();
 	if (!ret)
 		ret = restored;
@@ -641,7 +694,8 @@ void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio)
 {
 	LIST_HEAD(vmemmap_pages);
 
-	__hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages, VMEMMAP_SYNCHRONIZE_RCU);
+	__hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages,
+			VMEMMAP_SYNCHRONIZE_RCU | VMEMMAP_ARCH_TLB_FLUSH_FLAGS);
 	free_vmemmap_page_list(&vmemmap_pages);
 }
 
@@ -683,7 +737,8 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 			break;
 	}
 
-	flush_tlb_all();
+	if (!(VMEMMAP_ARCH_TLB_FLUSH_FLAGS & VMEMMAP_SPLIT_NO_TLB_FLUSH))
+		flush_tlb_all();
 
 	list_for_each_entry(folio, folio_list, lru) {
 		int ret;
@@ -701,24 +756,35 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 		 * allowing more vmemmap remaps to occur.
 		 */
 		if (ret == -ENOMEM && !list_empty(&vmemmap_pages)) {
-			flush_tlb_all();
+			if (!(VMEMMAP_ARCH_TLB_FLUSH_FLAGS & VMEMMAP_REMAP_NO_TLB_FLUSH))
+				flush_tlb_all();
 			free_vmemmap_page_list(&vmemmap_pages);
 			INIT_LIST_HEAD(&vmemmap_pages);
 			__hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages, flags);
 		}
 	}
 
-	flush_tlb_all();
+	if (!(VMEMMAP_ARCH_TLB_FLUSH_FLAGS & VMEMMAP_REMAP_NO_TLB_FLUSH))
+		flush_tlb_all();
 	free_vmemmap_page_list(&vmemmap_pages);
 }
 
+static int hugetlb_vmemmap_sysctl(const struct ctl_table *ctl, int write,
+				  void *buffer, size_t *lenp, loff_t *ppos)
+{
+	if (!vmemmap_update_supported())
+		return -ENODEV;
+
+	return proc_dobool(ctl, write, buffer, lenp, ppos);
+}
+
 static struct ctl_table hugetlb_vmemmap_sysctls[] = {
 	{
 		.procname	= "hugetlb_optimize_vmemmap",
 		.data		= &vmemmap_optimize_enabled,
 		.maxlen		= sizeof(vmemmap_optimize_enabled),
 		.mode		= 0644,
-		.proc_handler	= proc_dobool,
+		.proc_handler	= hugetlb_vmemmap_sysctl,
 	},
 };
 
@@ -729,6 +795,11 @@ static int __init hugetlb_vmemmap_init(void)
 	/* HUGETLB_VMEMMAP_RESERVE_SIZE should cover all used struct pages */
 	BUILD_BUG_ON(__NR_USED_SUBPAGE > HUGETLB_VMEMMAP_RESERVE_PAGES);
 
+	if (READ_ONCE(vmemmap_optimize_enabled) && !vmemmap_update_supported()) {
+		pr_warn("HugeTLB: disabling HVO due to missing support.\n");
+		WRITE_ONCE(vmemmap_optimize_enabled, false);
+	}
+
 	for_each_hstate(h) {
 		if (hugetlb_vmemmap_optimizable(h)) {
 			register_sysctl_init("vm", hugetlb_vmemmap_sysctls);
-- 
2.47.0.277.g8800431eea-goog


