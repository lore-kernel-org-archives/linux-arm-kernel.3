Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AC4E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 10:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59fciq8B+Agc81G/BRtnxHEnCmv7pc5HwbA3OuaCGvE=; b=YKpjwLIRSLVO2cBadQ6wR0eNQM
	bCc0CxpaNtsYpyes5prAwE8/qsmTy8J2SG2n9Ypl9F74SShMV9bC00n9x4XfCoPoi0+KULSTy3HZN
	viUkx3zDsuaRa91y9cVeaQlRdaqXYXQiZW4iNCXYNUqCn9C7YLQtyeaYTYg9yQnIDuBAZk7fVQhk/
	ELlvNWXEHfTB3kDUc+/bLD4gtseUanUOmM86Sb123dNgDfiISfJFv/bZCxpt3D6chmC0AUpWsKTtL
	qmHrKCiTRF2ydenufn7whehp3aCNP0mLvnSqAhVHEq4CsnzkL3irXORKpJoS96j4oEt1AeyguBVnY
	YG9PZPuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVTt-00000001GIY-1oTz;
	Fri, 06 Dec 2024 10:22:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVL8-00000001DJL-3OR8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 10:13:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D4CC15A1;
	Fri,  6 Dec 2024 02:14:06 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8400A3F71E;
	Fri,  6 Dec 2024 02:13:35 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	aruna.ramakrishna@oracle.com,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	jannh@google.com,
	jeffxu@chromium.org,
	joey.gouly@arm.com,
	kees@kernel.org,
	maz@kernel.org,
	pierre.langlois@arm.com,
	qperret@google.com,
	ryan.roberts@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [RFC PATCH 08/16] mm: Introduce kernel_pgtables_set_pkey()
Date: Fri,  6 Dec 2024 10:11:02 +0000
Message-ID: <20241206101110.1646108-9-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241206101110.1646108-1-kevin.brodsky@arm.com>
References: <20241206101110.1646108-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_021338_936991_20E86CBD 
X-CRM114-Status: GOOD (  16.78  )
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

It feels that some sort of locking is called for in
kernel_pgtables_set_pkey(), but I couldn't figure out what would be
appropriate.

---
 include/linux/mm.h |   2 +
 mm/memory.c        | 130 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c39c4945946c..683e883dae77 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4179,4 +4179,6 @@ int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *st
 int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status);
 int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status);
 
+int kernel_pgtables_set_pkey(int pkey);
+
 #endif /* _LINUX_MM_H */
diff --git a/mm/memory.c b/mm/memory.c
index 75c2dfd04f72..278ddf9f6249 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -76,6 +76,7 @@
 #include <linux/ptrace.h>
 #include <linux/vmalloc.h>
 #include <linux/sched/sysctl.h>
+#include <linux/kpkeys.h>
 
 #include <trace/events/kmem.h>
 
@@ -6974,3 +6975,132 @@ void vma_pgtable_walk_end(struct vm_area_struct *vma)
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
+	if (mm_p4d_folded(&init_mm))
+		return set_pkey_p4d(pgd, pkey);
+
+	for (i = 0; i < PTRS_PER_PGD; i++) {
+		if (pgd_none(pgd[i]) || pgd_bad(pgd[i]) || pgd_leaf(pgd[i]))
+			continue;
+		err = set_pkey_p4d(&pgd[i], pkey);
+		if (err)
+			break;
+	}
+
+	return err;
+}
-- 
2.47.0


