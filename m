Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6A2EA4E07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghjghG4jC8MOy/tgyF8iNA59KrdH++BJ81qBeiRGepM=; b=Nc1+3lK/ZSA3ZV7J4qpznvsQ+M
	uKsqZbJlHQselH920Lssd1Dzs9OOT+TLn18ZVx1uVWntJikFhvpKWYXPIjNK5MDLQW+3GGtmRXzAs
	zYlH4C3LsT/5X22bl0irkA+dHHU3Wf/l9ZnXxHJOR/0egFdLmzBldp/Fa16cWzdy5kJKe5Sf5YQgK
	CMj2XJ50fu/KMXKkPv20O9+6hAyKcuIFG2ZytNbE4vsD6+kS8R9oMylLK3SsIh91nVIh044Cc1pur
	3UFYVhNrwdxlkPonNdZuLyq0nRSjmqUU3Qu310YSyh2v+4ozLSPXod9ubSJJlFDMIKeT0mnZNKHN9
	io4Q9rwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3l7-0000000DAlm-2VDq;
	Mon, 02 Mar 2026 13:56:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3l5-0000000DAjx-2WjZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:56:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5167A165C;
	Mon,  2 Mar 2026 05:56:19 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A51953F73B;
	Mon,  2 Mar 2026 05:56:23 -0800 (PST)
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
Subject: [PATCH v3 04/13] arm64: mm: Push __TLBI_VADDR() into __tlbi_level()
Date: Mon,  2 Mar 2026 13:55:51 +0000
Message-ID: <20260302135602.3716920-5-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302135602.3716920-1-ryan.roberts@arm.com>
References: <20260302135602.3716920-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_055627_725004_01836DDF 
X-CRM114-Status: GOOD (  13.91  )
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
Reviewed-by: Linu Cherian <linu.cherian@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 14 ++++++++++----
 arch/arm64/kernel/sys_compat.c    |  2 +-
 arch/arm64/kvm/hyp/nvhe/mm.c      |  2 +-
 arch/arm64/kvm/hyp/nvhe/tlb.c     |  2 --
 arch/arm64/kvm/hyp/pgtable.c      |  4 ++--
 arch/arm64/kvm/hyp/vhe/tlb.c      |  2 --
 6 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index e586d9b71ea2d..2832305606b72 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -142,9 +142,10 @@ static __always_inline void ipas2e1is(u64 arg)
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
@@ -155,6 +156,11 @@ static __always_inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
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
@@ -511,8 +517,7 @@ do {									\
 		if (!system_supports_tlb_range() ||			\
 		    __flush_pages == 1 ||				\
 		    (lpa2 && __flush_start != ALIGN(__flush_start, SZ_64K))) {	\
-			addr = __TLBI_VADDR(__flush_start, asid);	\
-			__tlbi_level(op, addr, tlb_level);		\
+			__tlbi_level_asid(op, __flush_start, tlb_level, asid);	\
 			__flush_start += stride;			\
 			__flush_pages -= stride >> PAGE_SHIFT;		\
 			continue;					\
@@ -685,6 +690,7 @@ static inline bool huge_pmd_needs_flush(pmd_t oldpmd, pmd_t newpmd)
 #define huge_pmd_needs_flush huge_pmd_needs_flush
 
 #undef __tlbi_user
+#undef __TLBI_VADDR
 #endif
 
 #endif
diff --git a/arch/arm64/kernel/sys_compat.c b/arch/arm64/kernel/sys_compat.c
index b9d4998c97efa..7e9860143add8 100644
--- a/arch/arm64/kernel/sys_compat.c
+++ b/arch/arm64/kernel/sys_compat.c
@@ -36,7 +36,7 @@ __do_compat_cache_op(unsigned long start, unsigned long end)
 			 * The workaround requires an inner-shareable tlbi.
 			 * We pick the reserved-ASID to minimise the impact.
 			 */
-			__tlbi(aside1is, __TLBI_VADDR(0, 0));
+			__tlbi(aside1is, 0UL);
 			__tlbi_sync_s1ish();
 		}
 
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 218976287d3fe..4d8fcc7a3a41e 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -270,7 +270,7 @@ static void fixmap_clear_slot(struct hyp_fixmap_slot *slot)
 	 * https://lore.kernel.org/kvm/20221017115209.2099-1-will@kernel.org/T/#mf10dfbaf1eaef9274c581b81c53758918c1d0f03
 	 */
 	dsb(ishst);
-	__tlbi_level(vale2is, __TLBI_VADDR(addr, 0), level);
+	__tlbi_level(vale2is, addr, level);
 	__tlbi_sync_s1ish_hyp();
 	isb();
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/tlb.c b/arch/arm64/kvm/hyp/nvhe/tlb.c
index 3dc1ce0d27fe6..b29140995d484 100644
--- a/arch/arm64/kvm/hyp/nvhe/tlb.c
+++ b/arch/arm64/kvm/hyp/nvhe/tlb.c
@@ -158,7 +158,6 @@ void __kvm_tlb_flush_vmid_ipa(struct kvm_s2_mmu *mmu,
 	 * Instead, we invalidate Stage-2 for this IPA, and the
 	 * whole of Stage-1. Weep...
 	 */
-	ipa >>= 12;
 	__tlbi_level(ipas2e1is, ipa, level);
 
 	/*
@@ -188,7 +187,6 @@ void __kvm_tlb_flush_vmid_ipa_nsh(struct kvm_s2_mmu *mmu,
 	 * Instead, we invalidate Stage-2 for this IPA, and the
 	 * whole of Stage-1. Weep...
 	 */
-	ipa >>= 12;
 	__tlbi_level(ipas2e1, ipa, level);
 
 	/*
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 9b480f947da26..30226f2d5564a 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -490,14 +490,14 @@ static int hyp_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 
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
 
diff --git a/arch/arm64/kvm/hyp/vhe/tlb.c b/arch/arm64/kvm/hyp/vhe/tlb.c
index 35855dadfb1b3..f7b9dfe3f3a5a 100644
--- a/arch/arm64/kvm/hyp/vhe/tlb.c
+++ b/arch/arm64/kvm/hyp/vhe/tlb.c
@@ -104,7 +104,6 @@ void __kvm_tlb_flush_vmid_ipa(struct kvm_s2_mmu *mmu,
 	 * Instead, we invalidate Stage-2 for this IPA, and the
 	 * whole of Stage-1. Weep...
 	 */
-	ipa >>= 12;
 	__tlbi_level(ipas2e1is, ipa, level);
 
 	/*
@@ -136,7 +135,6 @@ void __kvm_tlb_flush_vmid_ipa_nsh(struct kvm_s2_mmu *mmu,
 	 * Instead, we invalidate Stage-2 for this IPA, and the
 	 * whole of Stage-1. Weep...
 	 */
-	ipa >>= 12;
 	__tlbi_level(ipas2e1, ipa, level);
 
 	/*
-- 
2.43.0


