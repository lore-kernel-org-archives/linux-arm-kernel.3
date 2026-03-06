Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9276FCB624
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 23:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdvaJB1LXFNDY6a15oc69M98GTl99EifvhmpoI/28Eg=; b=PN9jJIOJ/n1CG/M0OczxKIdRGB
	d0mO9dZch7hdUmh2K2W8zGafyITOEjQash13fWfr2zspLcxyy4keNtWiCZFLyhXveTGjpswBrK7kq
	NGXRUQ9SALq8j+nihEBf7v33D/E0G0If4gaHb5NHHW78IqaQe9V/MdlQjFcWwKSCFneYDh/w9fXdC
	Hr9PxlLJqwSJaOqV/Yv4X7SwjZtjGaYqB8DuWs5WYx5N4bTUomq2q3VknWQplwxb5ScMpYHMc4W7B
	ddN+0tF2YoYNRDIy8YI+hA1OI65hPO0NxRyRd6NcM5UIYpZFqz/gY4UvETJlgSNf1bPcV7rcsRKsz
	aUQaM/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeTQ-00000004dDB-2Rw9;
	Fri, 06 Mar 2026 23:20:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeTO-00000004dCY-09qO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 23:20:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D945560053;
	Fri,  6 Mar 2026 23:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC82C4CEF7;
	Fri,  6 Mar 2026 23:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1772839244;
	bh=ax1SAYo+iTD471lZ8SZC4G6BL2Js8nhv7iBqCbhvGm0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IgOnLcroN+Cq4+uoc9rtF5U2JdkUFn/isXguriJYr4aQzvF25A5VeON8B+f31ceaY
	 sxF4gZK9IF/xbEJi8UmLT5YkJqdECPNh7wKqzOYAy+udOV+IQEhKFAet4DKkkeRx9X
	 X106S6MIa49lZe6PUl6PJ2LzW+cudcfxt3A1T4Xk=
Date: Fri, 6 Mar 2026 15:20:42 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: david@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, dev.jain@arm.com,
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
 hannes@cmpxchg.org, zhengqi.arch@bytedance.com, shakeel.butt@linux.dev,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] support batched checking of the young flag for
 MGLRU
Message-Id: <20260306152042.8516ec644e95e9a23df30e5f@linux-foundation.org>
In-Reply-To: <cover.1772778858.git.baolin.wang@linux.alibaba.com>
References: <cover.1772778858.git.baolin.wang@linux.alibaba.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri,  6 Mar 2026 14:43:36 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:

> This is a follow-up to the previous work [1], to support batched checking
> of the young flag for MGLRU.
> 
> Similarly, batched checking of young flag for large folios can improve
> performance during large-folio reclamation when MGLRU is enabled. I
> observed noticeable performance improvements (see patch 5) on an Arm64
> machine that supports contiguous PTEs. All mm-selftests are passed.

Thanks, I updated mm-new with this.

> Changes from v2:
> v2: https://lore.kernel.org/all/cover.1772185080.git.baolin.wang@linux.alibaba.com/
>  - Update the commit message of patch 5 (per David).
>  - Fix some coding style issues (per David).
>  - Remove 'cur_pte' variable in lru_gen_look_around() (per David).
>  - Move 'ptes += nr;' to the suitable place in folio_referenced_one() (per David).
>  - Add acked tag from David. Thanks.
> 

Here's how v3 altered mm.git:


 include/linux/pgtable.h |    3 +--
 mm/rmap.c               |    2 +-
 mm/vmscan.c             |   11 +++++------
 3 files changed, 7 insertions(+), 9 deletions(-)

--- a/include/linux/pgtable.h~b
+++ a/include/linux/pgtable.h
@@ -1124,8 +1124,7 @@ static inline int clear_flush_young_ptes
  * Returns: whether any PTE was young.
  */
 static inline int test_and_clear_young_ptes(struct vm_area_struct *vma,
-					    unsigned long addr, pte_t *ptep,
-					    unsigned int nr)
+		unsigned long addr, pte_t *ptep, unsigned int nr)
 {
 	int young = 0;
 
--- a/mm/rmap.c~b
+++ a/mm/rmap.c
@@ -964,7 +964,6 @@ static bool folio_referenced_one(struct
 			pte_t pteval = ptep_get(pvmw.pte);
 
 			nr = folio_pte_batch(folio, pvmw.pte, pteval, max_nr);
-			ptes += nr;
 		}
 
 		if (lru_gen_enabled() && pvmw.pte) {
@@ -982,6 +981,7 @@ static bool folio_referenced_one(struct
 			WARN_ON_ONCE(1);
 		}
 
+		ptes += nr;
 		pra->mapcount -= nr;
 		/*
 		 * If we are sure that we batched the entire folio,
--- a/mm/vmscan.c~b
+++ a/mm/vmscan.c
@@ -4201,7 +4201,6 @@ bool lru_gen_look_around(struct page_vma
 	struct lruvec *lruvec;
 	struct lru_gen_mm_state *mm_state;
 	unsigned long max_seq;
-	pte_t *cur_pte;
 	int gen;
 
 	lockdep_assert_held(pvmw->ptl);
@@ -4247,10 +4246,10 @@ bool lru_gen_look_around(struct page_vma
 
 	pte -= (addr - start) / PAGE_SIZE;
 
-	for (i = 0, addr = start, cur_pte = pte; addr != end;
-	     i += nr, cur_pte += nr, addr += nr * PAGE_SIZE) {
+	for (i = 0, addr = start; addr != end;
+	     i += nr, pte += nr, addr += nr * PAGE_SIZE) {
 		unsigned long pfn;
-		pte_t ptent = ptep_get(cur_pte);
+		pte_t ptent = ptep_get(pte);
 
 		nr = 1;
 		pfn = get_pte_pfn(ptent, vma, addr, pgdat);
@@ -4264,11 +4263,11 @@ bool lru_gen_look_around(struct page_vma
 		if (folio_test_large(folio)) {
 			const unsigned int max_nr = (end - addr) >> PAGE_SHIFT;
 
-			nr = folio_pte_batch_flags(folio, NULL, cur_pte, &ptent,
+			nr = folio_pte_batch_flags(folio, NULL, pte, &ptent,
 						   max_nr, FPB_MERGE_YOUNG_DIRTY);
 		}
 
-		if (!test_and_clear_young_ptes_notify(vma, addr, cur_pte, nr))
+		if (!test_and_clear_young_ptes_notify(vma, addr, pte, nr))
 			continue;
 
 		if (last != folio) {
_


