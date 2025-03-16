Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D57C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 08:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M+0/h9aDFRntiTMtRd1I+pi0KOstzzZ2qm2E+XHDMy8=; b=Utofdo5cH6cYSBzOLBIxYUBv7E
	wEqvMnl1El6hFLrpxMDIRuQbJIMCO8dVnULx0D0grfb22xW4IEzxc+kZUcL/egQEfD7FK7UnFwjAq
	06EGFXfgTaN3os1bSDjLYEn66pnnv/HAlv1JM50w6ahoezOBBA+R3i3Aj9hmaxpoio7+RFgpmX+G3
	uhvE+jbGqXQBm3iqrTNyhLT7U3e2mhgB39PdWdAfK03xxdWLSrIl12sJx+tI0UFmhQvb+zveJXodh
	qriNOy0BSWieGGxufYHTTUynDwso8inQdhZlqRMY+Lfk9iWUgaaWIl5A3DLDIB4ZKVWezG0UHM1GE
	tP1gvM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttj0S-0000000HVVR-0Ne0;
	Sun, 16 Mar 2025 08:06:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttiyl-0000000HVFu-0ScO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 08:04:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 579BB5C4833;
	Sun, 16 Mar 2025 08:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE36C4CEDD;
	Sun, 16 Mar 2025 08:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742112253;
	bh=qVy5NOTwJcQ1MJ4GLjQJ2T48TMRnNvNf0Pndm6ouJK4=;
	h=Subject:To:Cc:From:Date:From;
	b=15eLF/bQpivx1P1HrDkdqK51Fud3/Bj+JbYTzT0c2727iqGQq1GgI3ZBwfv1rHPqR
	 2zaXZ9W0zPmfjglo0AjDK3l4krhtnlPNpIgboARPnotenzOSS/7OkUL9B5EcEJ/Szb
	 5DpyXz3LfFUTakLB8dwpgwRPKU7j0WL8LT/GJRek=
Subject: Patch "Fix mmu notifiers for range-based invalidates" has been added to the 6.12-stable tree
To: apopple@nvidia.com,catalin.marinas@arm.com,gregkh@linuxfoundation.org,iommu@lists.linux.dev,jgg@nvidia.com,jhubbard@nvidia.com,linux-arm-kernel@lists.infradead.org,linux-mm@kvack.org,nicolinc@nvidia.com,pjaroszynski@nvidia.com,rananta@google.com,robin.murphy@arm.com,sj@kernel.org,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 16 Mar 2025 09:02:06 +0100
Message-ID: <2025031606-duh-scanning-bea0@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_010415_268518_ED6CCE35 
X-CRM114-Status: GOOD (  19.07  )
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


This is a note to let you know that I've just added the patch titled

    Fix mmu notifiers for range-based invalidates

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fix-mmu-notifiers-for-range-based-invalidates.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From f7edb07ad7c66eab3dce57384f33b9799d579133 Mon Sep 17 00:00:00 2001
From: Piotr Jaroszynski <pjaroszynski@nvidia.com>
Date: Tue, 4 Mar 2025 00:51:27 -0800
Subject: Fix mmu notifiers for range-based invalidates

From: Piotr Jaroszynski <pjaroszynski@nvidia.com>

commit f7edb07ad7c66eab3dce57384f33b9799d579133 upstream.

Update the __flush_tlb_range_op macro not to modify its parameters as
these are unexepcted semantics. In practice, this fixes the call to
mmu_notifier_arch_invalidate_secondary_tlbs() in
__flush_tlb_range_nosync() to use the correct range instead of an empty
range with start=end. The empty range was (un)lucky as it results in
taking the invalidate-all path that doesn't cause correctness issues,
but can certainly result in suboptimal perf.

This has been broken since commit 6bbd42e2df8f ("mmu_notifiers: call
invalidate_range() when invalidating TLBs") when the call to the
notifiers was added to __flush_tlb_range(). It predates the addition of
the __flush_tlb_range_op() macro from commit 360839027a6e ("arm64: tlb:
Refactor the core flush algorithm of __flush_tlb_range") that made the
bug hard to spot.

Fixes: 6bbd42e2df8f ("mmu_notifiers: call invalidate_range() when invalidating TLBs")

Signed-off-by: Piotr Jaroszynski <pjaroszynski@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Raghavendra Rao Ananta <rananta@google.com>
Cc: SeongJae Park <sj@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: iommu@lists.linux.dev
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Link: https://lore.kernel.org/r/20250304085127.2238030-1-pjaroszynski@nvidia.com
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/include/asm/tlbflush.h |   22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -396,33 +396,35 @@ static inline void arch_tlbbatch_flush(s
 #define __flush_tlb_range_op(op, start, pages, stride,			\
 				asid, tlb_level, tlbi_user, lpa2)	\
 do {									\
+	typeof(start) __flush_start = start;				\
+	typeof(pages) __flush_pages = pages;				\
 	int num = 0;							\
 	int scale = 3;							\
 	int shift = lpa2 ? 16 : PAGE_SHIFT;				\
 	unsigned long addr;						\
 									\
-	while (pages > 0) {						\
+	while (__flush_pages > 0) {					\
 		if (!system_supports_tlb_range() ||			\
-		    pages == 1 ||					\
-		    (lpa2 && start != ALIGN(start, SZ_64K))) {		\
-			addr = __TLBI_VADDR(start, asid);		\
+		    __flush_pages == 1 ||				\
+		    (lpa2 && __flush_start != ALIGN(__flush_start, SZ_64K))) {	\
+			addr = __TLBI_VADDR(__flush_start, asid);	\
 			__tlbi_level(op, addr, tlb_level);		\
 			if (tlbi_user)					\
 				__tlbi_user_level(op, addr, tlb_level);	\
-			start += stride;				\
-			pages -= stride >> PAGE_SHIFT;			\
+			__flush_start += stride;			\
+			__flush_pages -= stride >> PAGE_SHIFT;		\
 			continue;					\
 		}							\
 									\
-		num = __TLBI_RANGE_NUM(pages, scale);			\
+		num = __TLBI_RANGE_NUM(__flush_pages, scale);		\
 		if (num >= 0) {						\
-			addr = __TLBI_VADDR_RANGE(start >> shift, asid, \
+			addr = __TLBI_VADDR_RANGE(__flush_start >> shift, asid, \
 						scale, num, tlb_level);	\
 			__tlbi(r##op, addr);				\
 			if (tlbi_user)					\
 				__tlbi_user(r##op, addr);		\
-			start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
-			pages -= __TLBI_RANGE_PAGES(num, scale);	\
+			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
+			__flush_pages -= __TLBI_RANGE_PAGES(num, scale);\
 		}							\
 		scale--;						\
 	}								\


Patches currently in stable-queue which might be from pjaroszynski@nvidia.com are

queue-6.12/fix-mmu-notifiers-for-range-based-invalidates.patch

