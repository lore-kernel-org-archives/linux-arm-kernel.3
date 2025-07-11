Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF16C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 17:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+GN+xk5ecE+74iR0f8S+C/LgNLyyTXILdhej9El2aA=; b=L1LhlVxPrGhM7sGgzF717xYdYv
	afrDVaPQpAz+v/SpvUjYKMEqGVQD2E289eCsOdiZ2oAP4Mcp8O1e9svANeF++x2sI1QFZ/r58ZZnQ
	NsvedHL/Tp5skiDdwy/AdbL8+J/c32B2KnVpziKC81J5g0s3XjSSPUpc1bSK/8fgz3yN4rrMjZukZ
	LCUYkmPytTL1FvcCWSDM48k8FC3jyWcBKKfDPnv/GWJjxjDUs+zz1oYEL4B8R63t2MFEG1bWgAXTT
	1Ja80moOt51BVnnmldfu3lnARwo2c+gtxoOmUKbjGwxlBwbVsb5NXzQaE1URDtXG+70cERBpzUSC7
	NZ0VaFpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHBm-0000000FMQe-0jP6;
	Fri, 11 Jul 2025 17:05:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGRb-0000000FGDa-26lI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 16:17:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BD8B47118;
	Fri, 11 Jul 2025 16:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12AAEC4CEED;
	Fri, 11 Jul 2025 16:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752250671;
	bh=srwRxatt1MHTQ063/JWIF6OtD3mvYAP76oIaQp4djOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d1HVFDmh76WvWr0qWzacxcWvB9yIcL9py/Z4Fag1+P39XUrlCCOzRyMV7xXrLy6df
	 IuAnt3WLFD1KalgCwcK1DtlOozoV2AuCeikXbjWHxRh3GnylKq1xQsLj/Sl3hXEOI8
	 L4MUswDDY/RcH3zKr0DvP+v7XuVFSpBLi3Z5oG7n4sZtaNcHzQ8diTIR0VymqoUzji
	 p8QM6RSpd08sopjO9aLJbPT+kHzZWi3hjA+09eJCX8+mIVomFNlFXGnTVXVZINoeQg
	 nMR64LxIIsAQfM4HKr3lQlJhOyhR0KrQdBxwbqaeYSA51kEvJVhsqYYkcTkLH2W1Gr
	 GuGjYR7ccqjbw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 04/10] arm64: mm: Remove unused 'tlbi_user' argument from __flush_tlb_range_op()
Date: Fri, 11 Jul 2025 17:17:26 +0100
Message-Id: <20250711161732.384-5-will@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250711161732.384-1-will@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_091751_586559_C8C0A243 
X-CRM114-Status: GOOD (  11.29  )
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

The 'tlbi_user' argument to __flush_tlb_range_op() is unused. Drop it.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/tlbflush.h | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 08e509f37b28..728b00f3e1f4 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -398,8 +398,6 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
  * @stride:	Flush granularity
  * @asid:	The ASID of the task (0 for IPA instructions)
  * @tlb_level:	Translation Table level hint, if known
- * @tlbi_user:	If 'true', call an additional __tlbi_user()
- *              (typically for user ASIDs). 'flase' for IPA instructions
  * @lpa2:	If 'true', the lpa2 scheme is used as set out below
  *
  * When the CPU does not support TLB range operations, flush the TLB
@@ -447,7 +445,7 @@ static __always_inline void __tlbi_range(const enum tlbi_op op, u64 arg)
 #undef __GEN_TLBI_OP_CASE
 
 #define __flush_tlb_range_op(op, start, pages, stride,			\
-				asid, tlb_level, tlbi_user, lpa2)	\
+				asid, tlb_level, lpa2)			\
 do {									\
 	typeof(start) __flush_start = start;				\
 	typeof(pages) __flush_pages = pages;				\
@@ -480,7 +478,7 @@ do {									\
 } while (0)
 
 #define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
-	__flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, false, kvm_lpa2_is_enabled());
+	__flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, kvm_lpa2_is_enabled());
 
 static inline bool __flush_tlb_range_limit_excess(unsigned long start,
 		unsigned long end, unsigned long pages, unsigned long stride)
@@ -520,10 +518,10 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
 
 	if (last_level)
 		__flush_tlb_range_op(vale1is, start, pages, stride, asid,
-				     tlb_level, true, lpa2_is_enabled());
+				     tlb_level, lpa2_is_enabled());
 	else
 		__flush_tlb_range_op(vae1is, start, pages, stride, asid,
-				     tlb_level, true, lpa2_is_enabled());
+				     tlb_level, lpa2_is_enabled());
 
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
 }
@@ -566,7 +564,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 
 	dsb(ishst);
 	__flush_tlb_range_op(vaale1is, start, pages, stride, 0,
-			     TLBI_TTL_UNKNOWN, false, lpa2_is_enabled());
+			     TLBI_TTL_UNKNOWN, lpa2_is_enabled());
 	dsb(ish);
 	isb();
 }
-- 
2.50.0.727.gbf7dc18ff4-goog


