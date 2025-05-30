Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C766BC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxfO6fmJe0IaN6KC8DCtNE+rdIsBFLUFJPNMt9WdCyU=; b=IQ8kMQixU2trqWI05k2K8B8wMR
	V7gPq3+Q74zHxR3SXcJRLP+Tz7LhElPiS0UIJ0ZqyYqVZjj8wNR576ReszveGhgtemvMHqz7Cl8uG
	7S0u59BDTG9dW3qsEShGm1K51sHgPNcbHtQ9uDRgjb0Mbppy9Z/PBEGCrpJXFDA+H4AqAGYJMsIGI
	aMNV/XeHjWl0TGZeJT7g+RLF+BMvHPOGxo2rzQT1Xy0XS7JNkSey531MyYdtxkBiR+Wj9HegvOD6r
	EGueKWXMpdIFuPYQxkSvi71HL98SxWEGor3L4r8/lS6TnBhncfEm/f9zgiAHy+WzHnMomWaf6L15z
	FlpiINzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvni-000000005Q3-3F8r;
	Fri, 30 May 2025 09:13:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvfU-000000004Ps-3JYs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 09:04:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBC9516F2;
	Fri, 30 May 2025 02:04:31 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (unknown [10.164.18.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A0CF3F5A1;
	Fri, 30 May 2025 02:04:43 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 3/3] mm/pagewalk: Add pre/post_pte_table callback for lazy MMU on arm64
Date: Fri, 30 May 2025 14:34:07 +0530
Message-Id: <20250530090407.19237-4-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250530090407.19237-1-dev.jain@arm.com>
References: <20250530090407.19237-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_020448_879602_C6584943 
X-CRM114-Status: GOOD (  11.31  )
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

arm64 implements lazy_mmu_mode to allow deferral and batching of barriers
when updating kernel PTEs, which provides a nice performance boost. arm64
currently uses apply_to_page_range() to modify kernel PTE permissions,
which runs inside lazy_mmu_mode. So to prevent a performance regression,
let's add hooks to walk_page_range_novma() to allow continued use of
lazy_mmu_mode.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
Credits to Ryan for the patch description.

 arch/arm64/mm/pageattr.c | 12 ++++++++++++
 include/linux/pagewalk.h |  2 ++
 mm/pagewalk.c            |  6 ++++++
 3 files changed, 20 insertions(+)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index a5c829c64969..9163324b12a0 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -75,11 +75,23 @@ static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
 	return 0;
 }
 
+static void pte_lazy_mmu_enter(void)
+{
+	arch_enter_lazy_mmu_mode();
+}
+
+static void pte_lazy_mmu_leave(void)
+{
+	arch_leave_lazy_mmu_mode();
+}
+
 static const struct mm_walk_ops pageattr_ops = {
 	.pud_entry	= pageattr_pud_entry,
 	.pmd_entry	= pageattr_pmd_entry,
 	.pte_entry	= pageattr_pte_entry,
 	.walk_lock	= PGWALK_NOLOCK,
+	.pre_pte_table	= pte_lazy_mmu_enter,
+	.post_pte_table	= pte_lazy_mmu_leave,
 };
 
 bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
index 9bc8853ed3de..2157d345974c 100644
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@ -88,6 +88,8 @@ struct mm_walk_ops {
 	int (*pre_vma)(unsigned long start, unsigned long end,
 		       struct mm_walk *walk);
 	void (*post_vma)(struct mm_walk *walk);
+	void (*pre_pte_table)(void);
+	void (*post_pte_table)(void);
 	int (*install_pte)(unsigned long addr, unsigned long next,
 			   pte_t *ptep, struct mm_walk *walk);
 	enum page_walk_lock walk_lock;
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index 9657cf4664b2..a441f5cbbc45 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -33,6 +33,9 @@ static int walk_pte_range_inner(pte_t *pte, unsigned long addr,
 	const struct mm_walk_ops *ops = walk->ops;
 	int err = 0;
 
+	if (walk->ops->pre_pte_table)
+		walk->ops->pre_pte_table();
+
 	for (;;) {
 		if (ops->install_pte && pte_none(ptep_get(pte))) {
 			pte_t new_pte;
@@ -56,6 +59,9 @@ static int walk_pte_range_inner(pte_t *pte, unsigned long addr,
 		addr += PAGE_SIZE;
 		pte++;
 	}
+
+	if (walk->ops->post_pte_table)
+		walk->ops->post_pte_table();
 	return err;
 }
 
-- 
2.30.2


