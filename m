Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F011EA4E07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRwiBSbCGO7Lg89BPoqP7R798QA++ZdXlMRcMw8K3DU=; b=JPwgrFmsmAOOHy6oyNpfMx2sGu
	WTlcem/7UqldsqGHpFfR9gFzQ6MaSz6enZs8D3PXZEDvlYRwiQqPmD/e2gq4kFu9lpTU2OXXg8wkZ
	sBOZmmEiHqjzkscvVOviHmT/6jj7jA6vOSP/2HLaX1iViEdfKmp9QVByJBmqAgQcY/szvRBBxyhVl
	Xmt+K1Y8WfEua5CWDHpgT2RreOK5pATal9k5wG2kFtrRM0RVpTjWUNP2fjEtcV6DR1SA0uzIyMjVP
	nn3uQicx9HlTQJ0J7P+UnG17iWI4Hju9nAC7PVNtsmblTNY5ow9Q/TNa7ulFqUiQi0Bm9wzmP6uYs
	D7TinpQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3lJ-0000000DAyI-0RiS;
	Mon, 02 Mar 2026 13:56:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3lH-0000000DAvu-10yM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 13:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yRwiBSbCGO7Lg89BPoqP7R798QA++ZdXlMRcMw8K3DU=; b=mF2PbVCPDPPjtVTvmZLvLfylRv
	kffP0CrCHlQsPRz+G+fl7GminP6F0AdtWvk/2Y6EAfNIS1EM1GCK9uNPIzGa2T7o8Z2qIO4q/j2/p
	0necf5eOYwfYPEEgSQYkkybXgfilftVia/GcEO+AGznFf98DxpGjOW/NRQMIhcvGaoEZbpJGmNFEq
	0hzNLpvzBKJnbE5L6OPCRzeaidXUCRqNguzuJqMcgna7ZiHLCIGkEorfEbY4L/WYxT4ne+kK9zmfH
	Ro/ZQwz7ndhssOpMjzm447u4j6PrpLOor1j3OeiHhF2AopTe+eNvgJB9Aha21GPu1sV8B2hZO5bHm
	OlJa0zHg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3lE-00000000E2k-0VTX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:56:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 166FB1570;
	Mon,  2 Mar 2026 05:56:28 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BB6A3F73B;
	Mon,  2 Mar 2026 05:56:32 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Linu Cherian <Linu.Cherian@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/13] arm64: mm: Simplify __flush_tlb_range_limit_excess()
Date: Mon,  2 Mar 2026 13:55:55 +0000
Message-ID: <20260302135602.3716920-9-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302135602.3716920-1-ryan.roberts@arm.com>
References: <20260302135602.3716920-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_135636_628748_E9804D1A 
X-CRM114-Status: GOOD (  14.33  )
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index fb7e541cfdfd9..fd86647db24bb 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -537,21 +537,19 @@ static __always_inline void __flush_tlb_range_op(tlbi_op lop, tlbi_op rop,
 #define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
 	__flush_tlb_range_op(op, r##op, start, pages, stride, 0, tlb_level, kvm_lpa2_is_enabled())
 
-static inline bool __flush_tlb_range_limit_excess(unsigned long start,
-		unsigned long end, unsigned long pages, unsigned long stride)
+static inline bool __flush_tlb_range_limit_excess(unsigned long pages,
+						  unsigned long stride)
 {
 	/*
-	 * When the system does not support TLB range based flush
-	 * operation, (MAX_DVM_OPS - 1) pages can be handled. But
-	 * with TLB range based operation, MAX_TLBI_RANGE_PAGES
-	 * pages can be handled.
+	 * Assume that the worst case number of DVM ops required to flush a
+	 * given range on a system that supports tlb-range is 20 (4 scales, 1
+	 * final page, 15 for alignment on LPA2 systems), which is much smaller
+	 * than MAX_DVM_OPS.
 	 */
-	if ((!system_supports_tlb_range() &&
-	     (end - start) >= (MAX_DVM_OPS * stride)) ||
-	    pages > MAX_TLBI_RANGE_PAGES)
-		return true;
+	if (system_supports_tlb_range())
+		return pages > MAX_TLBI_RANGE_PAGES;
 
-	return false;
+	return pages >= (MAX_DVM_OPS * stride) >> PAGE_SHIFT;
 }
 
 static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
@@ -565,7 +563,7 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
 	end = round_up(end, stride);
 	pages = (end - start) >> PAGE_SHIFT;
 
-	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
+	if (__flush_tlb_range_limit_excess(pages, stride)) {
 		flush_tlb_mm(mm);
 		return;
 	}
@@ -629,7 +627,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 	end = round_up(end, stride);
 	pages = (end - start) >> PAGE_SHIFT;
 
-	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
+	if (__flush_tlb_range_limit_excess(pages, stride)) {
 		flush_tlb_all();
 		return;
 	}
-- 
2.43.0


