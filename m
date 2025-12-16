Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F304D5E394
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 14:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmN5/5Yi68uLBPR28+CNLOl6VDpdUrD5u6xYtfa94jg=; b=i1LJA3LPHRgJk3aftlNuVDmanH
	7wmdVuE8PYTJZcvxA2oJTvLV//6BGsfGCwBEsjL0SEiO3ptZvnUAfCN/S3YgklstULxVO6dFAT9MH
	gjC2suVqQRgxN0Rwec+HZ2YpC+yVOFuJMBS5pEtXiATxeJ1YEUJJV5ArcxxzrJgkNbSt0EVYiSWoQ
	XpKHB6DhHoV6qnBw8WnnjJCqXj+NoUp38h7/xWFngd7gSiaT1sBIO83J7LiSdQ7XKQbZBOHzAo872
	ukBH31ewVm7pZ3Mhke0/kEf+aLjZJFf1KsKf6AM6P7iYTDrO78JAlLpcBB5aXCvr21kHQApwX5mUc
	N5aKc5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWJy-00000005Mss-0Iny;
	Tue, 16 Dec 2025 14:46:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWJl-00000005Mhk-3iZJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 14:46:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B55271691;
	Tue, 16 Dec 2025 06:46:17 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 612B13F73F;
	Tue, 16 Dec 2025 06:46:23 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Linu Cherian <Linu.Cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/13] arm64: mm: Simplify __flush_tlb_range_limit_excess()
Date: Tue, 16 Dec 2025 14:45:53 +0000
Message-ID: <20251216144601.2106412-9-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216144601.2106412-1-ryan.roberts@arm.com>
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_064627_589989_6ADEC446 
X-CRM114-Status: GOOD (  12.81  )
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

From: Will Deacon <will@kernel.org>

__flush_tlb_range_limit_excess() is unnecessarily complicated:

  - It takes a 'start', 'end' and 'pages' argument, whereas it only
    needs 'pages' (which the caller has computed from the other two
    arguments!).

  - It erroneously compares 'pages' with MAX_TLBI_RANGE_PAGES when
    the system doesn't support range-based invalidation but the range to
    be invalidated would result in fewer than MAX_DVM_OPS invalidations.

Simplify the function so that it no longer takes the 'start' and 'end'
arguments and only considers the MAX_TLBI_RANGE_PAGES threshold on
systems that implement range-based invalidation.

Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 0e1902f66e01..3b72a71feac0 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -527,21 +527,13 @@ static __always_inline void __flush_tlb_range_op(tlbi_op lop, tlbi_op rop,
 #define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
 	__flush_tlb_range_op(op, r##op, start, pages, stride, 0, tlb_level, kvm_lpa2_is_enabled())
 
-static inline bool __flush_tlb_range_limit_excess(unsigned long start,
-		unsigned long end, unsigned long pages, unsigned long stride)
+static inline bool __flush_tlb_range_limit_excess(unsigned long pages,
+						  unsigned long stride)
 {
-	/*
-	 * When the system does not support TLB range based flush
-	 * operation, (MAX_DVM_OPS - 1) pages can be handled. But
-	 * with TLB range based operation, MAX_TLBI_RANGE_PAGES
-	 * pages can be handled.
-	 */
-	if ((!system_supports_tlb_range() &&
-	     (end - start) >= (MAX_DVM_OPS * stride)) ||
-	    pages > MAX_TLBI_RANGE_PAGES)
+	if (system_supports_tlb_range() && pages > MAX_TLBI_RANGE_PAGES)
 		return true;
 
-	return false;
+	return pages >= (MAX_DVM_OPS * stride) >> PAGE_SHIFT;
 }
 
 static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
@@ -555,7 +547,7 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
 	end = round_up(end, stride);
 	pages = (end - start) >> PAGE_SHIFT;
 
-	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
+	if (__flush_tlb_range_limit_excess(pages, stride)) {
 		flush_tlb_mm(mm);
 		return;
 	}
@@ -619,7 +611,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 	end = round_up(end, stride);
 	pages = (end - start) >> PAGE_SHIFT;
 
-	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
+	if (__flush_tlb_range_limit_excess(pages, stride)) {
 		flush_tlb_all();
 		return;
 	}
-- 
2.43.0


