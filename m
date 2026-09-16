Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4892CC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RUOBa122ZNJj5/X0WINzcWwj/ntpZyO5WrRr2TxrBE=; b=CSNy+psCS4utLvHCRF7QX2pRLV
	iu+x3PVnYNy/s3O4YLcIJDtaeTSzFYaqgX6MuE++tNXpu1sMsmYzG4F+IZgrGMcM2w6WmzhSp0iqc
	QjLI5xaxYoBWQbqIzs80/4iDQKdGHsuvGGi4fMo47xHEjsGA+WsY3KxvZXEwD6ACGEl2XNVvOTxKN
	bWJy/baPYTmNmsJYfocGtYSKLPrzV+x4Qic2lHR/sRMZXjgVl8nEsuO+b5amDedd0jLmnvvEElsPH
	4SFNkBttTFsFwqvjp6mZv7WKRO7KT9ZkLxQyFS/Aig+60mdGkQR7GQdk/i+Q7vkpNPjc3pS3evu0i
	noxEhQrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hag-00000008KJk-0Ja4;
	Wed, 16 Sep 2026 04:49:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6haY-00000008KHn-3stl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 04:49:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5423D152B;
	Tue, 15 Sep 2026 21:49:38 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33D933F86F;
	Tue, 15 Sep 2026 21:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789534181; bh=/pynzF0A3gZILFAu4wuFpsBCz7QyOd1/gAxCI9UIRGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gcpjFB6EgLvQQVAFiWJc8GHNZZgIW6kwwYhOxBKre7nN2mtyeWpyRg+BCImi50PGh
	 HfHu0/cnEG81lfmENos4pw2ekoatxNvdJtd035uvXlaYXjm2xhWLAYVijOMiyv38ZT
	 RyFeLq/DuiBES1nv+O5LXQOwfxWnF+hNe4FK8FzU=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V3 1/2] arm64/mm: Move __check_safe_pte_update()
Date: Wed, 16 Sep 2026 10:19:32 +0530
Message-ID: <20260916044933.2689426-2-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916044933.2689426-1-anshuman.khandual@arm.com>
References: <20260916044933.2689426-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_214943_046358_AABFABAA 
X-CRM114-Status: GOOD (  17.15  )
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

The page table entry print helpers and related macros which are defined in
<linux/pgtable.h> will not be accessible in platform <asm/pgtable.h> which
is basically caused by cycling dependency.

Move __check_safe_pte_update() inside arch/arm64/mm/mmu.c as a preparation
for subsequent usage of the afore mentioned generic MM helpers. While here
drop IS_ENABLED(CONFIG_DEBUG_VM), although wrap __check_safe_pte_update()
inside #ifdef CONFIG_DEBUG_VM that preserves the current code optimization
which is achieved via the static inline functions.

This does not cause any functional change.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 49 ++++----------------------------
 arch/arm64/mm/mmu.c              | 44 ++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index e89ec5f4787b..763c5a411d64 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -387,52 +387,13 @@ static inline pte_t __ptep_get(pte_t *ptep)
 extern void __sync_icache_dcache(pte_t pteval);
 bool pgattr_change_is_safe(pteval_t old, pteval_t new);
 
-/*
- * PTE bits configuration in the presence of hardware Dirty Bit Management
- * (PTE_WRITE == PTE_DBM):
- *
- * Dirty  Writable | PTE_RDONLY  PTE_WRITE  PTE_DIRTY (sw)
- *   0      0      |   1           0          0
- *   0      1      |   1           1          0
- *   1      0      |   1           0          1
- *   1      1      |   0           1          x
- *
- * When hardware DBM is not present, the software PTE_DIRTY bit is updated via
- * the page fault mechanism. Checking the dirty status of a pte becomes:
- *
- *   PTE_DIRTY || (PTE_WRITE && !PTE_RDONLY)
- */
-
-static inline void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep,
-					   pte_t pte)
+#ifdef CONFIG_DEBUG_VM
+void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte);
+#else
+static inline void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
 {
-	pte_t old_pte;
-
-	if (!IS_ENABLED(CONFIG_DEBUG_VM))
-		return;
-
-	old_pte = __ptep_get(ptep);
-
-	if (!pte_valid(old_pte) || !pte_valid(pte))
-		return;
-	if (mm != current->active_mm && atomic_read(&mm->mm_users) <= 1)
-		return;
-
-	/*
-	 * Check for potential race with hardware updates of the pte
-	 * (__ptep_set_access_flags safely changes valid ptes without going
-	 * through an invalid entry).
-	 */
-	VM_WARN_ONCE(!pte_young(pte),
-		     "%s: racy access flag clearing: 0x%016llx -> 0x%016llx",
-		     __func__, pte_val(old_pte), pte_val(pte));
-	VM_WARN_ONCE(pte_write(old_pte) && !pte_dirty(pte),
-		     "%s: racy dirty state clearing: 0x%016llx -> 0x%016llx",
-		     __func__, pte_val(old_pte), pte_val(pte));
-	VM_WARN_ONCE(!pgattr_change_is_safe(pte_val(old_pte), pte_val(pte)),
-		     "%s: unsafe attribute change: 0x%016llx -> 0x%016llx",
-		     __func__, pte_val(old_pte), pte_val(pte));
 }
+#endif /* CONFIG_DEBUG_VM */
 
 static inline void __sync_cache_and_tags(pte_t pte, unsigned int nr_pages)
 {
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5d..cb49469707a8 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2392,4 +2392,48 @@ int arch_set_user_pkey_access(int pkey, unsigned long init_val)
 
 	return 0;
 }
+
+/*
+ * PTE bits configuration in the presence of hardware Dirty Bit Management
+ * (PTE_WRITE == PTE_DBM):
+ *
+ * Dirty  Writable | PTE_RDONLY  PTE_WRITE  PTE_DIRTY (sw)
+ *   0      0      |   1           0          0
+ *   0      1      |   1           1          0
+ *   1      0      |   1           0          1
+ *   1      1      |   0           1          x
+ *
+ * When hardware DBM is not present, the software PTE_DIRTY bit is updated via
+ * the page fault mechanism. Checking the dirty status of a pte becomes:
+ *
+ *   PTE_DIRTY || (PTE_WRITE && !PTE_RDONLY)
+ */
+#ifdef CONFIG_DEBUG_VM
+void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
+{
+	pte_t old_pte;
+
+	old_pte = __ptep_get(ptep);
+
+	if (!pte_valid(old_pte) || !pte_valid(pte))
+		return;
+	if (mm != current->active_mm && atomic_read(&mm->mm_users) <= 1)
+		return;
+
+	/*
+	 * Check for potential race with hardware updates of the pte
+	 * (__ptep_set_access_flags safely changes valid ptes without going
+	 * through an invalid entry).
+	 */
+	VM_WARN_ONCE(!pte_young(pte),
+		     "%s: racy access flag clearing: 0x%016llx -> 0x%016llx",
+		     __func__, pte_val(old_pte), pte_val(pte));
+	VM_WARN_ONCE(pte_write(old_pte) && !pte_dirty(pte),
+		     "%s: racy dirty state clearing: 0x%016llx -> 0x%016llx",
+		     __func__, pte_val(old_pte), pte_val(pte));
+	VM_WARN_ONCE(!pgattr_change_is_safe(pte_val(old_pte), pte_val(pte)),
+		     "%s: unsafe attribute change: 0x%016llx -> 0x%016llx",
+		     __func__, pte_val(old_pte), pte_val(pte));
+}
+#endif /* CONFIG_DEBUG_VM */
 #endif
-- 
2.43.0


