Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0D5C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mviyH7rHSk6iYIkq1X7ZbX03FM96OrvsNuV8flsuIpI=; b=B3XoPTdA2rFXhsMD1/FLiPZISL
	G7FrVa4lluzdCKcKaEodRIx9cM+1SaFjmKM5h+DcfhbJRluGh4p4oYQOHVJtxggB8odlqq+6am2jZ
	ZZ+Fw43jG/CxLjBOCy07PsUQ1eYu1fS5CHbDah7LLo+alactmnYJE9U8x8jfd+vfK672+xM7g0LY8
	52ZyV21WWx5cfxapDzhGFbDf25Pxws3NZEWSGA0COP/0APrWmN7XMyO3TIn0w7No1WttiHXmUZLFC
	f93bL1Q3/IzwqhYPGx8LiflRyi2Gj4kx+Hank/xA1VXliDcgwg7393qe46IidtIhK90ZXU3AFK2PF
	b+psy0Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZYb-000000016ha-0b9n;
	Mon, 10 Feb 2025 19:35:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYjK-00000000yua-40sj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:42:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4C115C5E14;
	Mon, 10 Feb 2025 18:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2812BC4CEE8;
	Mon, 10 Feb 2025 18:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739212922;
	bh=fRWfMKtymz9mDUni3zoNkIs0jFSkw9WeSwVj5WK/r38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L7ZvEJc5K6+OXlTWK5JEqXONEQR5nj8kJye1NWQx9/z/iXrRm35zJw/7og5jJE2Kw
	 23xiPQJ1aQg9++8D5Dn6eJaKGhSe5EoZH/EHlE/34b1W3YPIGCAyzdvgSeHGMrMm+5
	 Egj49MNenlhneDLc2hEStGbGrTj2ZnKpjSRUkY7AHbIm8gZmv17B7UYm/Oiexu0so4
	 Yjf3KkJR2H6kGabm7BNc9XoDgp0vi1ify3AcK7ihZPwAJk/+HPgZ0vAohOEFnoNM8J
	 RtVwdNv5Ab1MvNE3g768TskY6u+N+0U3zMYnUnMmdBpS8ib0akws9XAU/to4nwT73A
	 ANKHAH9jFm7Qw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1thYjI-002g2I-AB;
	Mon, 10 Feb 2025 18:42:00 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 13/18] KVM: arm64: Remove most hand-crafted masks for FGT registers
Date: Mon, 10 Feb 2025 18:41:44 +0000
Message-Id: <20250210184150.2145093-14-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250210184150.2145093-1-maz@kernel.org>
References: <20250210184150.2145093-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_104203_104195_9AB3B2DB 
X-CRM114-Status: GOOD (  14.92  )
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

These masks are now useless, and can be removed. One notable
exception is __HFGRTR_ONLY_MASK, as the sysreg file conflates
the HFGRTR_EL2 and HFGWTR_EL2 bits in a most unhelpful way.

To be fixed one day...

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_arm.h        | 42 +------------------------
 arch/arm64/kvm/hyp/include/hyp/switch.h | 19 -----------
 2 files changed, 1 insertion(+), 60 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index e424085f2aaca..af87afae6ca3d 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -314,56 +314,16 @@
 
 /*
  * FGT register definitions
- *
- * RES0 and polarity masks as of DDI0487J.a, to be updated as needed.
- * We're not using the generated masks as they are usually ahead of
- * the published ARM ARM, which we use as a reference.
- *
- * Once we get to a point where the two describe the same thing, we'll
- * merge the definitions. One day.
- */
-#define __HFGRTR_EL2_RES0	HFGxTR_EL2_RES0
-#define __HFGRTR_EL2_MASK	GENMASK(49, 0)
-#define __HFGRTR_EL2_nMASK	~(__HFGRTR_EL2_RES0 | __HFGRTR_EL2_MASK)
-
-/*
- * The HFGWTR bits are a subset of HFGRTR bits. To ensure we don't miss any
- * future additions, define __HFGWTR* macros relative to __HFGRTR* ones.
  */
 #define __HFGRTR_ONLY_MASK	(BIT(46) | BIT(42) | BIT(40) | BIT(28) | \
 				 GENMASK(26, 25) | BIT(21) | BIT(18) | \
 				 GENMASK(15, 14) | GENMASK(10, 9) | BIT(2))
-#define __HFGWTR_EL2_RES0	(__HFGRTR_EL2_RES0 | __HFGRTR_ONLY_MASK)
-#define __HFGWTR_EL2_MASK	(__HFGRTR_EL2_MASK & ~__HFGRTR_ONLY_MASK)
-#define __HFGWTR_EL2_nMASK	~(__HFGWTR_EL2_RES0 | __HFGWTR_EL2_MASK)
-
-#define __HFGITR_EL2_RES0	HFGITR_EL2_RES0
-#define __HFGITR_EL2_MASK	(BIT(62) | BIT(60) | GENMASK(54, 0))
-#define __HFGITR_EL2_nMASK	~(__HFGITR_EL2_RES0 | __HFGITR_EL2_MASK)
-
-#define __HDFGRTR_EL2_RES0	HDFGRTR_EL2_RES0
-#define __HDFGRTR_EL2_MASK	(BIT(63) | GENMASK(58, 50) | GENMASK(48, 43) | \
-				 GENMASK(41, 40) | GENMASK(37, 22) | \
-				 GENMASK(19, 9) | GENMASK(7, 0))
-#define __HDFGRTR_EL2_nMASK	~(__HDFGRTR_EL2_RES0 | __HDFGRTR_EL2_MASK)
-
-#define __HDFGWTR_EL2_RES0	HDFGWTR_EL2_RES0
-#define __HDFGWTR_EL2_MASK	(GENMASK(57, 52) | GENMASK(50, 48) | \
-				 GENMASK(46, 44) | GENMASK(42, 41) | \
-				 GENMASK(37, 35) | GENMASK(33, 31) | \
-				 GENMASK(29, 23) | GENMASK(21, 10) | \
-				 GENMASK(8, 7) | GENMASK(5, 0))
-#define __HDFGWTR_EL2_nMASK	~(__HDFGWTR_EL2_RES0 | __HDFGWTR_EL2_MASK)
-
-#define __HAFGRTR_EL2_RES0	HAFGRTR_EL2_RES0
-#define __HAFGRTR_EL2_MASK	(GENMASK(49, 17) | GENMASK(4, 0))
-#define __HAFGRTR_EL2_nMASK	~(__HAFGRTR_EL2_RES0 | __HAFGRTR_EL2_MASK)
 
 /* Because the sysreg file mixes R and W... */
 #define HFGRTR_EL2_RES0		HFGxTR_EL2_RES0
 #define HFGWTR_EL2_RES0		(HFGRTR_EL2_RES0 | __HFGRTR_ONLY_MASK)
 
-/* Similar definitions for HCRX_EL2 */
+/* Polarity masks for HCRX_EL2 */
 #define __HCRX_EL2_RES0         HCRX_EL2_RES0
 #define __HCRX_EL2_MASK		(BIT(6))
 #define __HCRX_EL2_nMASK	~(__HCRX_EL2_RES0 | __HCRX_EL2_MASK)
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index f9cf5985561ab..a36bcf6ec0d32 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -156,17 +156,6 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 #define update_fgt_traps(hctxt, vcpu, kvm, reg)		\
 	update_fgt_traps_cs(hctxt, vcpu, kvm, reg, 0, 0)
 
-/*
- * Validate the fine grain trap masks.
- * Check that the masks do not overlap and that all bits are accounted for.
- */
-#define CHECK_FGT_MASKS(reg)							\
-	do {									\
-		BUILD_BUG_ON((__ ## reg ## _MASK) & (__ ## reg ## _nMASK));	\
-		BUILD_BUG_ON(~((__ ## reg ## _RES0) ^ (__ ## reg ## _MASK) ^	\
-			       (__ ## reg ## _nMASK)));				\
-	} while(0)
-
 static inline bool cpu_has_amu(void)
 {
        u64 pfr0 = read_sysreg_s(SYS_ID_AA64PFR0_EL1);
@@ -180,14 +169,6 @@ static inline void __activate_traps_hfgxtr(struct kvm_vcpu *vcpu)
 	struct kvm_cpu_context *hctxt = host_data_ptr(host_ctxt);
 	struct kvm *kvm = kern_hyp_va(vcpu->kvm);
 
-	CHECK_FGT_MASKS(HFGRTR_EL2);
-	CHECK_FGT_MASKS(HFGWTR_EL2);
-	CHECK_FGT_MASKS(HFGITR_EL2);
-	CHECK_FGT_MASKS(HDFGRTR_EL2);
-	CHECK_FGT_MASKS(HDFGWTR_EL2);
-	CHECK_FGT_MASKS(HAFGRTR_EL2);
-	CHECK_FGT_MASKS(HCRX_EL2);
-
 	if (!cpus_have_final_cap(ARM64_HAS_FGT))
 		return;
 
-- 
2.39.2


