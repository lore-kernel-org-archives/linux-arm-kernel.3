Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4FBC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 17:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnbQX61ol/JubNY/hK/jIj+g9ZOMyzdsK4utADcduf8=; b=OQ25WzZ5UIjgogVgL77l8vtU7l
	afuKgKiB9l9NH3plCU0dAmYHSlTreACEUZe4/R5g9Ta1jSnyMPUh0lhC4dWOk3t4/cqcTk27xgoxz
	4tflv0D6Sy03mGd/VS1Dp+dc1Lt7+jJlE5F7E9PrbzYPUfH0I+MsyVvFbyWyzlQYZg2e164bP967j
	vToch1MDfRpF2P1IptrumRWdn1ZZEok+dQxMGtcFsDe2kW09UlvYTKxeD81g2vNXXrsNcCIhkWPZi
	8biHyciN5geErCxlJXWeooxJFOwxDk2jxiZmA+VveGvfWDNVSWQYoVJQxhXzFZ6yFXiY3FMXC4/Az
	1KHyMNXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHR4-0000000FO9D-2x25;
	Fri, 11 Jul 2025 17:21:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGRj-0000000FGG6-0QWg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 16:17:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D8FF6144A;
	Fri, 11 Jul 2025 16:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA6CC4CEF5;
	Fri, 11 Jul 2025 16:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752250678;
	bh=LMvMiVr8imwSxfMPioAfx2yF722cKWt6LDwVcW9+tc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=irmQpPh0ukhYGhD3/z2Ca8EgS4PotewgF87LD8sxI5OTQ9i7FjNqoGmH0xDEqTQGg
	 DIzUYkrPh17m+lP1WCMHSt76s7ILKZUv0IgQ6M47f0A2AVrrEbBZJ6A/DmZTKexfT1
	 RM+Xvt656cmaKYDw+F+erL1lMiMn8X3TTatTk7sO0Mi7oFffUWyoSPkWS6WJYMRETk
	 qohSOsmIYEMuzfGEiHTp/n56JYCSEoWc3yQyxB9vPNPwqDY13DCLRc56lRmn/pmIpH
	 JWACO2zveIEBTiuUBLfM/pOdOt52/U9m+paPaXup0u/y77RgwQSO9K1QDWyhCsaJlo
	 6bt+Aw4Gn4ccg==
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
Subject: [PATCH 07/10] arm64: mm: Push __TLBI_VADDR() into __tlbi_level()
Date: Fri, 11 Jul 2025 17:17:29 +0100
Message-Id: <20250711161732.384-8-will@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250711161732.384-1-will@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
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

The __TLBI_VADDR() macro takes an ASID and an address and converts them
into a single argument formatted correctly for a TLB invalidation
instruction.

Rather than have callers worry about this (especially in the case where
the ASID is zero), push the macro down into __tlbi_level() via a new
__tlbi_level_asid() helper.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/tlbflush.h | 14 ++++++++++----
 arch/arm64/kernel/sys_compat.c    |  2 +-
 arch/arm64/kvm/hyp/nvhe/mm.c      |  2 +-
 arch/arm64/kvm/hyp/pgtable.c      |  4 ++--
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index a8d21e52ef3a..434b9fdb340a 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -128,9 +128,10 @@ enum tlbi_op {
 	___GEN_TLBI_OP_CASE(op);					\
 		break
 
-static __always_inline void __tlbi_level(const enum tlbi_op op, u64 addr, u32 level)
+static __always_inline void __tlbi_level_asid(const enum tlbi_op op, u64 addr,
+					      u32 level, u16 asid)
 {
-	u64 arg = addr;
+	u64 arg = __TLBI_VADDR(addr, asid);
 
 	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) && level <= 3) {
 		u64 ttl = level | (get_trans_granule() << 2);
@@ -154,6 +155,11 @@ static __always_inline void __tlbi_level(const enum tlbi_op op, u64 addr, u32 le
 #undef __GEN_TLBI_OP_ASID_CASE
 #undef ___GEN_TLBI_OP_CASE
 
+static inline void __tlbi_level(const enum tlbi_op op, u64 addr, u32 level)
+{
+	__tlbi_level_asid(op, addr, level, 0);
+}
+
 /*
  * This macro creates a properly formatted VA operand for the TLB RANGE. The
  * value bit assignments are:
@@ -449,8 +455,7 @@ do {									\
 		if (!system_supports_tlb_range() ||			\
 		    __flush_pages == 1 ||				\
 		    (lpa2 && __flush_start != ALIGN(__flush_start, SZ_64K))) {	\
-			addr = __TLBI_VADDR(__flush_start, asid);	\
-			__tlbi_level(op, addr, tlb_level);		\
+			__tlbi_level_asid(op, __flush_start, tlb_level, asid);	\
 			__flush_start += stride;			\
 			__flush_pages -= stride >> PAGE_SHIFT;		\
 			continue;					\
@@ -580,6 +585,7 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
 	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
 }
 
+#undef __TLBI_VADDR
 #undef __tlbi_user
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
index c351b4abd5db..540691987e13 100644
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
2.50.0.727.gbf7dc18ff4-goog


