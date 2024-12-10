Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6651AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEaLWxrsLvUBImDPPCjQjM6hrDnQv/U2XSRBkJAcOi4=; b=YDhytgO00XmI8D8QSXB8x5KXPv
	WD7vbAEtXRvTreqTPgiIAYK+soFixMlA92mRjAU37iygbLGM6N5Z44hBVHRpUdEqC/aXHM80InhwG
	BDJne8vptbcqVqFIotpJS+i9SJc+B2TpLN/EGFVV/AbxQtpA5+AwU53VT7N0/jakGZKduT9cs12Pj
	fGcUemP7/9gD4qYeOE/Z1eMl4mVcTQhVjc2zrj9ibzaA28dkuA6xPgQttLW/3fNTz3r3sMD7++Zqf
	211Hh1eftX6rg+nxCjvDtpvPZgeM4ZBdxAh0R5aVTxawOD+iVtr14wLHeiCeeYef5TscJm02l2JgX
	ldVsiTgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2qR-0000000C2us-18U4;
	Tue, 10 Dec 2024 16:12:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2lD-0000000C1xq-0Hac
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:06:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E0442A419BD;
	Tue, 10 Dec 2024 16:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931B6C4CEE5;
	Tue, 10 Dec 2024 16:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733846814;
	bh=au+G63Alb5GCF/A9SMKFt0ffiADn8Kv5aULRnynJplQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DEjxcxD8oTx/TOiQj0A2f+JJWdp/WTkV38+nqMqbKqE7+bF6LG9S+6FdFjp6oYQtq
	 rW1mfkcfhys/Emrwns6joq2JUc53T52CS463Zf/K5eFYzyYk7YjDEIVC4mkWw39m9j
	 S6Z6Oqr/P1VJwWZx+FKYRsDQ6xsQzrgLqFnD+wTb1DLUo4Rj1JRdck87rev7uW6xSX
	 mfsaWuEGPNNqdlX046i345AyLRdM8upKoU4Y31jGz7ADYX6irfh+RsIJEiaUdtPhbV
	 0Lh1SwNgDuIqEQjYvdRqYWOg3GV79ubzX6l4VsAKF47MKqP0JVWTeXepIEOL0Y7J6Q
	 sQebOtMZyj6vg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 4/4] mm: drop HIGHPTE support altogether
Date: Tue, 10 Dec 2024 17:05:56 +0100
Message-Id: <20241210160556.2341497-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210160556.2341497-1-arnd@kernel.org>
References: <20241210160556.2341497-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_080655_221261_5DC3D23F 
X-CRM114-Status: GOOD (  15.15  )
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

From: Arnd Bergmann <arnd@arndb.de>

With both x86 and arm having dropped CONFIG_HIGHPTE support, no
architecture is left using it, so remove the remnants in common code.

It is likely that further cleanups are possible in the page table
code but those are not obvious from the config options.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/hugetlb.h | 5 +----
 include/linux/mm.h      | 1 -
 include/linux/pgtable.h | 9 ---------
 3 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index ae4fe8615bb6..5369a269dd39 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -176,7 +176,6 @@ extern struct list_head huge_boot_pages[MAX_NUMNODES];
 
 /* arch callbacks */
 
-#ifndef CONFIG_HIGHPTE
 /*
  * pte_offset_huge() and pte_alloc_huge() are helpers for those architectures
  * which may go down to the lowest PTE level in their huge_pte_offset() and
@@ -191,7 +190,6 @@ static inline pte_t *pte_alloc_huge(struct mm_struct *mm, pmd_t *pmd,
 {
 	return pte_alloc(mm, pmd) ? NULL : pte_offset_huge(pmd, address);
 }
-#endif
 
 pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 			unsigned long addr, unsigned long sz);
@@ -966,9 +964,8 @@ static inline spinlock_t *huge_pte_lockptr(struct hstate *h,
 	 */
 	if (size >= PUD_SIZE)
 		return pud_lockptr(mm, (pud_t *) pte);
-	else if (size >= PMD_SIZE || IS_ENABLED(CONFIG_HIGHPTE))
+	else if (size >= PMD_SIZE)
 		return pmd_lockptr(mm, (pmd_t *) pte);
-	/* pte_alloc_huge() only applies with !CONFIG_HIGHPTE */
 	return ptep_lockptr(mm, pte);
 }
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index f56f81d5e244..6353fd939702 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2954,7 +2954,6 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 
 static inline spinlock_t *ptep_lockptr(struct mm_struct *mm, pte_t *pte)
 {
-	BUILD_BUG_ON(IS_ENABLED(CONFIG_HIGHPTE));
 	BUILD_BUG_ON(MAX_PTRS_PER_PTE * sizeof(pte_t) > PAGE_SIZE);
 	return ptlock_ptr(virt_to_ptdesc(pte));
 }
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index adef9d6e9b1b..23be8776bd5e 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -119,14 +119,6 @@ static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
 #define pte_offset_kernel pte_offset_kernel
 #endif
 
-#ifdef CONFIG_HIGHPTE
-#define __pte_map(pmd, address) \
-	((pte_t *)kmap_local_page(pmd_page(*(pmd))) + pte_index((address)))
-#define pte_unmap(pte)	do {	\
-	kunmap_local((pte));	\
-	rcu_read_unlock();	\
-} while (0)
-#else
 static inline pte_t *__pte_map(pmd_t *pmd, unsigned long address)
 {
 	return pte_offset_kernel(pmd, address);
@@ -135,7 +127,6 @@ static inline void pte_unmap(pte_t *pte)
 {
 	rcu_read_unlock();
 }
-#endif
 
 void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
 
-- 
2.39.5


