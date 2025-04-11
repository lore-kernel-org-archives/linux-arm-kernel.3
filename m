Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1FDC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 17:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7PisXZx8Xm0HiPcHJWMpCOtSYpEXoHPpQf705JcExTk=; b=28h5PwzQYC1YMpy+aQMyrxuiJU
	LBmLi8//k2p/CRCH6f1YIn37saqj8f5ojPKqzSMvO6YJMzLSe8rAeM8TGJCK5qZBb+RGCdJEqrE0R
	GdrFh9hLe71dino1cEzTLojTwoqlAnvYTwGd++eMLlglWC2SxeP4BksmiZ+Xk80hT1I3wTiVEAYeQ
	JcNJq/geIKpS2+yk4hNt/ROEMlJge8whFwg2IGvBG+H5+AR5WSvR6dOihcNYhrefsu6CnsrcmXmgQ
	MfeeqooEkMv+Rz8LOhoZ00fJWsTm81HKcNmusBd/IYWw8nrVVjFBL/R8Qf7mhK15Q7bJvaWk2nC0U
	2dEoe+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IGx-0000000EXkj-24Gy;
	Fri, 11 Apr 2025 17:34:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IAm-0000000EWTl-2FRD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 17:28:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4699A68471;
	Fri, 11 Apr 2025 17:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB82C4CEE2;
	Fri, 11 Apr 2025 17:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744392491;
	bh=WC3u1ImMrIwQcuUwS71L4kjKo8LAJfFX0pYiJWHDjs0=;
	h=From:To:Cc:Subject:Date:From;
	b=MymUixhS6j31bXwFvi6mFMde2JMsbqVN+cM5XbJ2n0Fw/uSA4PPjbKbuOl03Ljm65
	 c1+UhbEjQan/xoAt0c9NIRR65zLecEmEUJF3NyMD8/ejDRa/Iz2ZsBE1iTpENqhIEh
	 00Q1T95PWm9ASE3S+nTEm0EsKYpVUZ+dzRrCeswWM17+kYaykbNZ6y4Jk9j4RyONDx
	 PRqI4GNN8WIB62+cER8is5rrKbYsvr+yCpfBLHLU935pl+Q+ogeLrdmontI6Z8IjM4
	 WUh4/SyHAdwJKiNNgXyLGRr9hKTCDLc/M0r4VONW5ZFiceGjNAin/RD/b2MBZ2AJPq
	 wRe0JosummXAg==
From: Will Deacon <will@kernel.org>
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	Piotr Jaroszynski <pjaroszynski@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Alistair Popple <apopple@nvidia.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	SeongJae Park <sj@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [BACKPORT PATCH 6.6.y] Fix mmu notifiers for range-based invalidates
Date: Fri, 11 Apr 2025 18:28:04 +0100
Message-Id: <20250411172804.6014-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Piotr Jaroszynski <pjaroszynski@nvidia.com>

[ Upstream commit f7edb07ad7c66eab3dce57384f33b9799d579133 ]

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
Cc: stable@vger.kernel.org # Backport for 6.6.y only
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Link: https://lore.kernel.org/r/20250304085127.2238030-1-pjaroszynski@nvidia.com
[will: Resolve conflicts due to lack of LPA2 support]
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/tlbflush.h | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index b73baaf8ae47..d37db2f7a54c 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -369,31 +369,33 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 #define __flush_tlb_range_op(op, start, pages, stride,			\
 				asid, tlb_level, tlbi_user)		\
 do {									\
+	typeof(start) __flush_start = start;				\
+	typeof(pages) __flush_pages = pages;				\
 	int num = 0;							\
 	int scale = 3;							\
 	unsigned long addr;						\
 									\
-	while (pages > 0) {						\
+	while (__flush_pages > 0) {					\
 		if (!system_supports_tlb_range() ||			\
-		    pages == 1) {					\
-			addr = __TLBI_VADDR(start, asid);		\
+		    __flush_pages == 1) {				\
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
-			addr = __TLBI_VADDR_RANGE(start, asid, scale,	\
-						  num, tlb_level);	\
+			addr = __TLBI_VADDR_RANGE(__flush_start, asid,	\
+						scale, num, tlb_level);	\
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
-- 
2.49.0.604.gff1f9ca942-goog


