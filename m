Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB8AD29C4F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/tkyGvyHLBTkeSWxLkYYhiYld1gWR0fDEz4rW5QdDA=; b=ghNeYDTZKWOXQbfqCmr7RvhsnM
	dVTL74cAYqRSwe3yLoaZcbh+Us3tEmNW3833w996mr7Lh4K+Rw+IzlZLkn9zRR+qh0/8YcqNDPnwT
	4MZSgKGK9l1oGbm3rIl20rZNG0gWTlYyZiUpleUlT+bc3ivNlL6nQ9c659jNfB63Vnf3g8xWTf/28
	rhMSljl6aAvmB5tmJusvri9qdqDDLzDTijbpoeLJGG1UljoMaFEMF2wi5X3gPxKvtTGED0ocY/OMv
	KPdFpTXLVwr+RD+xjELa6bQwuVSSluHUgfXiDALMJQwuGigjuk6f0e7PeGxsD2l9XnZlYhLyBTUDb
	G/Lk/5zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsyE-00000002dMn-3qZt;
	Mon, 19 Jan 2026 17:23:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsxb-00000002ckc-2f2R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:22:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C950FEC;
	Mon, 19 Jan 2026 09:22:32 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 658FB3F632;
	Mon, 19 Jan 2026 09:22:37 -0800 (PST)
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
Subject: [PATCH v2 13/13] arm64: mm: Provide level hint for flush_tlb_page()
Date: Mon, 19 Jan 2026 17:22:00 +0000
Message-ID: <20260119172202.1681510-14-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119172202.1681510-1-ryan.roberts@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_092239_715330_52549FF8 
X-CRM114-Status: GOOD (  13.46  )
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

Previously tlb invalidations issued by __flush_tlb_page() did not
contain a level hint. But the function is clearly only ever targeting
level 3 tlb entries and its documentation agrees:

  | this operation only invalidates a single, last-level page-table
  | entry and therefore does not affect any walk-caches

However, it turns out that the function was actually being used to
invalidate a level 2 mapping via flush_tlb_fix_spurious_fault_pmd(). The
bug was benign because the level hint was not set so the HW would still
invalidate the PMD mapping, and also because the TLBF_NONOTIFY flag was
set, the bounds of the mapping were never used for anything else.

Now that we have the new and improved range-invalidation API, it is
trival to fix flush_tlb_fix_spurious_fault_pmd() to explicitly flush the
whole range (locally, without notification and last level only). So
let's do that, and then update __flush_tlb_page() to hint level 3.

Reviewed-by: Linu Cherian <linu.cherian@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h  | 5 +++--
 arch/arm64/include/asm/tlbflush.h | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index b96a7ca465a1..61f57647361a 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -138,8 +138,9 @@ static inline void arch_leave_lazy_mmu_mode(void)
 #define flush_tlb_fix_spurious_fault(vma, address, ptep)	\
 	__flush_tlb_page(vma, address, TLBF_NOBROADCAST | TLBF_NONOTIFY)
 
-#define flush_tlb_fix_spurious_fault_pmd(vma, address, pmdp)	\
-	__flush_tlb_page(vma, address, TLBF_NOBROADCAST | TLBF_NONOTIFY)
+#define flush_tlb_fix_spurious_fault_pmd(vma, address, pmdp)			\
+	__flush_tlb_range(vma, address, address + PMD_SIZE, PMD_SIZE, 2,	\
+			  TLBF_NOBROADCAST | TLBF_NONOTIFY | TLBF_NOWALKCACHE)
 
 /*
  * ZERO_PAGE is a global shared page that is always zero: used
diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 88f46760e2c2..550908631f97 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -592,7 +592,7 @@ static inline void __flush_tlb_page(struct vm_area_struct *vma,
 	unsigned long start = round_down(uaddr, PAGE_SIZE);
 	unsigned long end = start + PAGE_SIZE;
 
-	___flush_tlb_range(vma, start, end, PAGE_SIZE, TLBI_TTL_UNKNOWN,
+	___flush_tlb_range(vma, start, end, PAGE_SIZE, 3,
 			   TLBF_NOWALKCACHE | flags);
 }
 
-- 
2.43.0


