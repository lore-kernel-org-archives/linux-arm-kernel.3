Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BE0EA4E04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOt7luWb9Dcy9HNX82r7MwLHKdCpe3ZUDek9jHGUD/U=; b=hpWFeDYTJb/r/7biykb80RC8cF
	3HHkDPlMT1H4CBBo1LCe1eQi5SnseU5MHKJtnf+68laA1FGR+oEGYzVEBHt5SK/x3hECWTxEkrKFT
	kTS0r1IlVc7Kcljx97ARPV6NLbT4d0vdDh/8xAW3oCcOotW5l/HsoLV6SEYJRDVS7I9xvMHGZEUT8
	yC0n4Q7T4MjSn3+2rYD6s+xlCpDcRTAlOucgY0iyfd7fN3Y6MJccRC2KyKKN0iACFXRlhx86MLDX8
	DbspKPlI4n7utirZWukThWdOhFuLQ8vK63ov+149JAIypGtWl/rK6yGt7eQwLzw+TxrYVbcPeueqD
	TsbTpt8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3lH-0000000DAwr-3KJy;
	Mon, 02 Mar 2026 13:56:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3lF-0000000DAu9-1uBS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:56:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FEBE1655;
	Mon,  2 Mar 2026 05:56:30 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B30913F73B;
	Mon,  2 Mar 2026 05:56:34 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Linu Cherian <linu.cherian@arm.com>
Subject: [PATCH v3 09/13] arm64: mm: Refactor flush_tlb_page() to use __tlbi_level_asid()
Date: Mon,  2 Mar 2026 13:55:56 +0000
Message-ID: <20260302135602.3716920-10-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302135602.3716920-1-ryan.roberts@arm.com>
References: <20260302135602.3716920-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_055637_528487_BA5BF6BA 
X-CRM114-Status: GOOD (  10.66  )
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

Now that we have __tlbi_level_asid(), let's refactor the
*flush_tlb_page*() variants to use it rather than open coding.

The emitted tlbi(s) is/are intended to be exactly the same as before; no
TTL hint is provided. Although the spec for flush_tlb_page() allows for
setting the TTL hint to 3, it turns out that
flush_tlb_fix_spurious_fault_pmd() depends on
local_flush_tlb_page_nonotify() to invalidate the level 2 entry. This
will be fixed separately.

Reviewed-by: Linu Cherian <linu.cherian@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index fd86647db24bb..0a49a25a4fdc8 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -346,12 +346,8 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
 static inline void __local_flush_tlb_page_nonotify_nosync(struct mm_struct *mm,
 							  unsigned long uaddr)
 {
-	unsigned long addr;
-
 	dsb(nshst);
-	addr = __TLBI_VADDR(uaddr, ASID(mm));
-	__tlbi(vale1, addr);
-	__tlbi_user(vale1, addr);
+	__tlbi_level_asid(vale1, uaddr, TLBI_TTL_UNKNOWN, ASID(mm));
 }
 
 static inline void local_flush_tlb_page_nonotify(struct vm_area_struct *vma,
@@ -373,12 +369,8 @@ static inline void local_flush_tlb_page(struct vm_area_struct *vma,
 static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
 					   unsigned long uaddr)
 {
-	unsigned long addr;
-
 	dsb(ishst);
-	addr = __TLBI_VADDR(uaddr, ASID(mm));
-	__tlbi(vale1is, addr);
-	__tlbi_user(vale1is, addr);
+	__tlbi_level_asid(vale1is, uaddr, TLBI_TTL_UNKNOWN, ASID(mm));
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, uaddr & PAGE_MASK,
 						(uaddr & PAGE_MASK) + PAGE_SIZE);
 }
-- 
2.43.0


