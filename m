Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAA1D5C0EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 14:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0muFH4rx5CX0Gcd17pP8LZDoVV08UEjFy/R8LT9Tzpg=; b=ipVFggKr/yYuqBq5eL1pDgzTq3
	gPtKzTTInkGPvg7Wh6045UxIZcFuvWg8Pktr5oEjwFpYrBXitUj7ZnViBolBNjFEa++syzEAi75aU
	39aggxoqQ8Y7E3hiLUBlUaMQNxV/Olg+B4r0oivON09JFt0yHtKOu35RiyBcL6ilg5CPLcoN6BFrH
	35f+AH4+vKKsCdu+tZF+SFC5wgcaZHtTP4Ef7IVY382k8erTdNVRz88Ib8Ma0zfJxTQYu9x0GP6vw
	zkn8IyQr7W9NiV/aYmJmh0f0tHarOkMshe22pM6xtjDkRxxoXyTN+cidRjI1Ys6xQyDSSQhSLjuUT
	QyG4H4yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWJq-00000005MlX-2WuD;
	Tue, 16 Dec 2025 14:46:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWJe-00000005Mfw-1biV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 14:46:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2434FEC;
	Tue, 16 Dec 2025 06:46:10 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71F473F73F;
	Tue, 16 Dec 2025 06:46:16 -0800 (PST)
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
Subject: [PATCH v1 04/13] arm64: mm: Push __TLBI_VADDR() into __tlbi_level()
Date: Tue, 16 Dec 2025 14:45:49 +0000
Message-ID: <20251216144601.2106412-5-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216144601.2106412-1-ryan.roberts@arm.com>
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_064620_649834_E81992FF 
X-CRM114-Status: GOOD (  13.10  )
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

The __TLBI_VADDR() macro takes an ASID and an address and converts them
into a single argument formatted correctly for a TLB invalidation
instruction.

Rather than have callers worry about this (especially in the case where
the ASID is zero), push the macro down into __tlbi_level() via a new
__tlbi_level_asid() helper.

Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 14 ++++++++++----
 arch/arm64/kernel/sys_compat.c    |  2 +-
 arch/arm64/kvm/hyp/nvhe/mm.c      |  2 +-
 arch/arm64/kvm/hyp/pgtable.c      |  4 ++--
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 31f43d953ce2..39717f98c31e 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -150,9 +150,10 @@ static __always_inline void ipas2e1is(u64 arg)
 	__tlbi(ipas2e1is, arg);
 }
 
-static __always_inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
+static __always_inline void __tlbi_level_asid(tlbi_op op, u64 addr, u32 level,
+					      u16 asid)
 {
-	u64 arg = addr;
+	u64 arg = __TLBI_VADDR(addr, asid);
 
 	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) && level <= 3) {
 		u64 ttl = level | (get_trans_granule() << 2);
@@ -164,6 +165,11 @@ static __always_inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
 	op(arg);
 }
 
+static inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
+{
+	__tlbi_level_asid(op, addr, level, 0);
+}
+
 /*
  * This macro creates a properly formatted VA operand for the TLB RANGE. The
  * value bit assignments are:
@@ -501,8 +507,7 @@ do {									\
 		if (!system_supports_tlb_range() ||			\
 		    __flush_pages == 1 ||				\
 		    (lpa2 && __flush_start != ALIGN(__flush_start, SZ_64K))) {	\
-			addr = __TLBI_VADDR(__flush_start, asid);	\
-			__tlbi_level(op, addr, tlb_level);		\
+			__tlbi_level_asid(op, __flush_start, tlb_level, asid);	\
 			__flush_start += stride;			\
 			__flush_pages -= stride >> PAGE_SHIFT;		\
 			continue;					\
@@ -675,5 +680,6 @@ static inline bool huge_pmd_needs_flush(pmd_t oldpmd, pmd_t newpmd)
 #define huge_pmd_needs_flush huge_pmd_needs_flush
 
 #undef __tlbi_user
+#undef __TLBI_VADDR
 #endif
 #endif
diff --git a/arch/arm64/kernel/sys_compat.c b/arch/arm64/kernel/sys_compat.c
index 4a609e9b65de..ad4857df4830 100644
--- a/arch/arm64/kernel/sys_compat.c
+++ b/arch/arm64/kernel/sys_compat.c
@@ -36,7 +36,7 @@ __do_compat_cache_op(unsigned long start, unsigned long end)
 			 * The workaround requires an inner-shareable tlbi.
 			 * We pick the reserved-ASID to minimise the impact.
 			 */
-			__tlbi(aside1is, __TLBI_VADDR(0, 0));
+			__tlbi(aside1is, 0UL);
 			dsb(ish);
 		}
 
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index ae8391baebc3..581385b21826 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -270,7 +270,7 @@ static void fixmap_clear_slot(struct hyp_fixmap_slot *slot)
 	 * https://lore.kernel.org/kvm/20221017115209.2099-1-will@kernel.org/T/#mf10dfbaf1eaef9274c581b81c53758918c1d0f03
 	 */
 	dsb(ishst);
-	__tlbi_level(vale2is, __TLBI_VADDR(addr, 0), level);
+	__tlbi_level(vale2is, addr, level);
 	dsb(ish);
 	isb();
 }
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 947ac1a951a5..9292c569afe6 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -472,14 +472,14 @@ static int hyp_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 
 		kvm_clear_pte(ctx->ptep);
 		dsb(ishst);
-		__tlbi_level(vae2is, __TLBI_VADDR(ctx->addr, 0), TLBI_TTL_UNKNOWN);
+		__tlbi_level(vae2is, ctx->addr, TLBI_TTL_UNKNOWN);
 	} else {
 		if (ctx->end - ctx->addr < granule)
 			return -EINVAL;
 
 		kvm_clear_pte(ctx->ptep);
 		dsb(ishst);
-		__tlbi_level(vale2is, __TLBI_VADDR(ctx->addr, 0), ctx->level);
+		__tlbi_level(vale2is, ctx->addr, ctx->level);
 		*unmapped += granule;
 	}
 
-- 
2.43.0


