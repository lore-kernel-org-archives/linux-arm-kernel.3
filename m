Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109D5D29C52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mI5C3YrIjS0yN0NcIUZ0qyLkr+SaZDSzIs0Rg1fjeKo=; b=tn4qZutWZow+xsuWo1turw/oKW
	St2dc+bJJh827GKL/e5F7THp+2xu3VaO8ldMvcmj8C+uVFyuhG52fVt6bfHps2LRzInvn+hK5dxli
	Sfr+cH7LvNacZXIAG5kyMkZ0qVhKXIMqqi8SIVRYRPBXHpd7m1wGvfADeaMVhzQc2pxCo9ly/T1En
	9Dja+iC5KvDxMwdIRAnjuuCgdBGYfb2n7JWpUbJHsDyXyhoBqM94x+tGT7hZj6HScQxEVj7MEHbtS
	pNN5wUmrOkC5unNN+ipDJYrOivCE1wJku0/nIyetAINX5oE4EFZ/YkhQ4TRctI/M9b0Gs0QwHZl7r
	Dymv0mpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsxc-00000002cmY-2EzU;
	Mon, 19 Jan 2026 17:22:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsxS-00000002ceA-1mti
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:22:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD4731476;
	Mon, 19 Jan 2026 09:22:22 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2CB23F632;
	Mon, 19 Jan 2026 09:22:27 -0800 (PST)
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
Subject: [PATCH v2 08/13] arm64: mm: Simplify __flush_tlb_range_limit_excess()
Date: Mon, 19 Jan 2026 17:21:55 +0000
Message-ID: <20260119172202.1681510-9-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119172202.1681510-1-ryan.roberts@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_092230_982064_AE218154 
X-CRM114-Status: GOOD (  14.50  )
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
 arch/arm64/include/asm/tlbflush.h | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index cac7768f3483..26e468d86afb 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -526,21 +526,19 @@ static __always_inline void __flush_tlb_range_op(tlbi_op lop, tlbi_op rop,
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
@@ -554,7 +552,7 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
 	end = round_up(end, stride);
 	pages = (end - start) >> PAGE_SHIFT;
 
-	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
+	if (__flush_tlb_range_limit_excess(pages, stride)) {
 		flush_tlb_mm(mm);
 		return;
 	}
@@ -618,7 +616,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 	end = round_up(end, stride);
 	pages = (end - start) >> PAGE_SHIFT;
 
-	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
+	if (__flush_tlb_range_limit_excess(pages, stride)) {
 		flush_tlb_all();
 		return;
 	}
-- 
2.43.0


