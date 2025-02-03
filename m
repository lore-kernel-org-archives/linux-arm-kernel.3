Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CDEC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 10:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMHebzscLOUd5of8jcCqK/oKCbj1tqbVmE+gDk9lCiQ=; b=GMOMw6Fd0Sdx2zpLpoGpCrBSWt
	vZbKjzdzv2v0bjM+I9QM/T1hkWHDB1bCsyfe7ZAmJU10ugDz/Xq3mbwujgSUIm7w1jzpuKEf6S5AR
	HfSBhviAM5FMJQEV/SfjnMRVmf8d9yTbtCw3QHFqbDBHdhmgbAiKjrnZtmFtVEWGZURpvEsKSudHb
	amzapOv78qItO0i0hwprlGYsAS6n081Yi0D0y2o6WdPs662lsGI6TFxdRUak1Wbpl0hRoXGumcfRS
	GY6YlZVsBtBDR3E+X9HQMgZQs9nluYM+MEFG9B3MdehKEKE0V9zEEbYxXO49qKyUKKWTghvdGtC6+
	MriJx0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetk6-0000000F846-0BbD;
	Mon, 03 Feb 2025 10:31:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tetYu-0000000F65f-1vWM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 10:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hMHebzscLOUd5of8jcCqK/oKCbj1tqbVmE+gDk9lCiQ=; b=QrRFJxDQy9z00+LAbrl0ioYX0u
	IHiB288Sf2re+waI4dJw7WArAiu7qZIEJunmWNOIKHUvIvotNQnFl8vyIz/sJlU6qwMXKSVO/qqCx
	QHK8/yJ5Zk4x6xjS+fKjrB+rqjuEqqowjLpoWlSfnfWBboIX7AE6w/1IyIj28xYB8DvRux+MPhYM/
	0HdwW8nqWERxO7HCyDfUTXixPdBsIKTx81oC/hJfUuAMNT2629uVOAgSySbQi6qS/qRuMLh5zsrp6
	Nrru4K9Cg5XIxukeISoz/AehTSCPBXGvjtI3go1JA55xw9dFeMGFLL036Q2NOdQKqKbfcwOw8HN0R
	Wy3MbBBw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetYr-0000000G3VK-1IAU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:20:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F1A111FB;
	Mon,  3 Feb 2025 02:20:37 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D2BF3F63F;
	Mon,  3 Feb 2025 02:20:08 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [RFC PATCH v3 08/15] mm: Introduce kernel_pgtables_set_pkey()
Date: Mon,  3 Feb 2025 10:18:32 +0000
Message-ID: <20250203101839.1223008-9-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250203101839.1223008-1-kevin.brodsky@arm.com>
References: <20250203101839.1223008-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102013_797767_C7C832CF 
X-CRM114-Status: GOOD (  17.77  )
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

kernel_pgtables_set_pkey() allows setting the pkey of all page table
pages in swapper_pg_dir, recursively. This will be needed by
kpkeys_hardened_pgtables, as it relies on all PTPs being mapped with
a non-default pkey. Those initial kernel page tables cannot
practically be assigned a non-default pkey right when they are
allocated, so mutating them during (early) boot is required.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/mm.h |   2 +
 mm/memory.c        | 137 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 139 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7b1068ddcbb7..c3998b78f6a5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4155,4 +4155,6 @@ int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *st
 int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status);
 int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status);
 
+int kernel_pgtables_set_pkey(int pkey);
+
 #endif /* _LINUX_MM_H */
diff --git a/mm/memory.c b/mm/memory.c
index 539c0f7c6d54..1386b9cfb459 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -77,6 +77,8 @@
 #include <linux/vmalloc.h>
 #include <linux/sched/sysctl.h>
 #include <linux/fsnotify.h>
+#include <linux/kpkeys.h>
+#include <linux/set_memory.h>
 
 #include <trace/events/kmem.h>
 
@@ -7066,3 +7068,138 @@ void vma_pgtable_walk_end(struct vm_area_struct *vma)
 	if (is_vm_hugetlb_page(vma))
 		hugetlb_vma_unlock_read(vma);
 }
+
+static int set_page_pkey(void *p, int pkey)
+{
+	unsigned long addr = (unsigned long)p;
+
+	/*
+	 * swapper_pg_dir itself will be made read-only by mark_rodata_ro()
+	 * so there is no point in changing its pkey.
+	 */
+	if (p == swapper_pg_dir)
+		return 0;
+
+	return set_memory_pkey(addr, 1, pkey);
+}
+
+static int set_pkey_pte(pmd_t *pmd, int pkey)
+{
+	pte_t *pte;
+	int err;
+
+	pte = pte_offset_kernel(pmd, 0);
+	err = set_page_pkey(pte, pkey);
+
+	return err;
+}
+
+static int set_pkey_pmd(pud_t *pud, int pkey)
+{
+	pmd_t *pmd;
+	int i, err = 0;
+
+	pmd = pmd_offset(pud, 0);
+
+	err = set_page_pkey(pmd, pkey);
+	if (err)
+		return err;
+
+	for (i = 0; i < PTRS_PER_PMD; i++) {
+		if (pmd_none(pmd[i]) || pmd_bad(pmd[i]) || pmd_leaf(pmd[i]))
+			continue;
+		err = set_pkey_pte(&pmd[i], pkey);
+		if (err)
+			break;
+	}
+
+	return err;
+}
+
+static int set_pkey_pud(p4d_t *p4d, int pkey)
+{
+	pud_t *pud;
+	int i, err = 0;
+
+	if (mm_pmd_folded(&init_mm))
+		return set_pkey_pmd((pud_t *)p4d, pkey);
+
+	pud = pud_offset(p4d, 0);
+
+	err = set_page_pkey(pud, pkey);
+	if (err)
+		return err;
+
+	for (i = 0; i < PTRS_PER_PUD; i++) {
+		if (pud_none(pud[i]) || pud_bad(pud[i]) || pud_leaf(pud[i]))
+			continue;
+		err = set_pkey_pmd(&pud[i], pkey);
+		if (err)
+			break;
+	}
+
+	return err;
+}
+
+static int set_pkey_p4d(pgd_t *pgd, int pkey)
+{
+	p4d_t *p4d;
+	int i, err = 0;
+
+	if (mm_pud_folded(&init_mm))
+		return set_pkey_pud((p4d_t *)pgd, pkey);
+
+	p4d = p4d_offset(pgd, 0);
+
+	err = set_page_pkey(p4d, pkey);
+	if (err)
+		return err;
+
+	for (i = 0; i < PTRS_PER_P4D; i++) {
+		if (p4d_none(p4d[i]) || p4d_bad(p4d[i]) || p4d_leaf(p4d[i]))
+			continue;
+		err = set_pkey_pud(&p4d[i], pkey);
+		if (err)
+			break;
+	}
+
+	return err;
+}
+
+/**
+ * kernel_pgtables_set_pkey - set pkey for all kernel page table pages
+ * @pkey: pkey to set the page table pages to
+ *
+ * Walks swapper_pg_dir setting the protection key of every page table page (at
+ * all levels) to @pkey. swapper_pg_dir itself is left untouched as it is
+ * expected to be mapped read-only by mark_rodata_ro().
+ *
+ * No-op if the architecture does not support kpkeys.
+ */
+int kernel_pgtables_set_pkey(int pkey)
+{
+	pgd_t *pgd = swapper_pg_dir;
+	int i, err = 0;
+
+	if (!arch_kpkeys_enabled())
+		return 0;
+
+	spin_lock(&init_mm.page_table_lock);
+
+	if (mm_p4d_folded(&init_mm)) {
+		err = set_pkey_p4d(pgd, pkey);
+		goto out;
+	}
+
+	for (i = 0; i < PTRS_PER_PGD; i++) {
+		if (pgd_none(pgd[i]) || pgd_bad(pgd[i]) || pgd_leaf(pgd[i]))
+			continue;
+		err = set_pkey_p4d(&pgd[i], pkey);
+		if (err)
+			break;
+	}
+
+out:
+	spin_unlock(&init_mm.page_table_lock);
+	return err;
+}
-- 
2.47.0


