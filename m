Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5969C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HyZwzcl1l3wXXnLjmKyA8teE6RPWgXPIsHmBGKpZy4=; b=da7S+I196ihp2NC0+9wHA3wc6f
	SwSpScGU3GJAsx798UYH+51t6MNDL46x+PDuQClz3VO8SHnoMen+1Yjwm7T603AchzUI4pSgdxjaF
	sGM1PdEb6+zVQKQXh16Ve+qKSw/hVL7yiawt4arjj/+pkZarHEN9qd9PCcBJe977x2vaVmheRD1YA
	ppMQxgwMyILCSSAFOqQ/cLRyxSacPCxTr7YseT5QHK5OY1QWrByKTwPP86PtG3eAz4rbRjF2jYoxA
	d1ac0PeDRMmJ3xm29z+UYCORf/Ai43bcc5YcmDAmXUkyYvPXSjxJjOS0olHt8iftkXq4F8nMrrsAl
	Cz/5+cgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQgu-0000000DWeO-33j0;
	Tue, 06 May 2025 22:23:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOx-0000000CiOl-01Ps
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 429D55C5900;
	Tue,  6 May 2025 16:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D5FC4CEE4;
	Tue,  6 May 2025 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549854;
	bh=Km4EjVUT40EFJbHRra7EMmpseWaDO7Z/XE3tgQGPtck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vtvd41gyoDoOxGp1bPP4OIIAITq7r5b98+AtDm0PuM79jYCnZEjFJuNbcFtNZVju6
	 rdH2K16rTym3/V8FRVEMyjJVRciB9er2l/NoD7blt4an034y780pp082iKfCp07Aui
	 Dw6UFDVXX62rwvMFm4l0LDX0V4tFOxfh1ET9GnRbe+a/VC8SsRBv60zBbGg4cS2kQq
	 BieFB1Vw97/e1P+66gLPF439Eblj/wAMIHLw/ng3+M3DpzqmxAmq9q7MZA8ed5jJsH
	 IZ9dGsBAAMuig2qi+BQlWUkWj7EKCMj2uYoAp5TTi3GZrhu/jS7V7BXpx/BV94l020
	 hmZbfSr0ZGwuA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOu-00CJkN-Ij;
	Tue, 06 May 2025 17:44:12 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v4 28/43] KVM: arm64: Remove hand-crafted masks for FGT registers
Date: Tue,  6 May 2025 17:43:33 +0100
Message-Id: <20250506164348.346001-29-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250506164348.346001-1-maz@kernel.org>
References: <20250506164348.346001-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094415_359152_9D42C8DF 
X-CRM114-Status: GOOD (  14.86  )
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

These masks are now useless, and can be removed.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_arm.h        | 49 +------------------------
 arch/arm64/kvm/hyp/include/hyp/switch.h | 19 ----------
 2 files changed, 1 insertion(+), 67 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 43a630b940bfb..e7c73d16cd451 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -315,54 +315,7 @@
 				 GENMASK(19, 18) |	\
 				 GENMASK(15, 0))
 
-/*
- * FGT register definitions
- *
- * RES0 and polarity masks as of DDI0487J.a, to be updated as needed.
- * We're not using the generated masks as they are usually ahead of
- * the published ARM ARM, which we use as a reference.
- *
- * Once we get to a point where the two describe the same thing, we'll
- * merge the definitions. One day.
- */
-#define __HFGRTR_EL2_RES0	HFGRTR_EL2_RES0
-#define __HFGRTR_EL2_MASK	GENMASK(49, 0)
-#define __HFGRTR_EL2_nMASK	~(__HFGRTR_EL2_RES0 | __HFGRTR_EL2_MASK)
-
-/*
- * The HFGWTR bits are a subset of HFGRTR bits. To ensure we don't miss any
- * future additions, define __HFGWTR* macros relative to __HFGRTR* ones.
- */
-#define __HFGRTR_ONLY_MASK	(BIT(46) | BIT(42) | BIT(40) | BIT(28) | \
-				 GENMASK(26, 25) | BIT(21) | BIT(18) | \
-				 GENMASK(15, 14) | GENMASK(10, 9) | BIT(2))
-#define __HFGWTR_EL2_RES0	HFGWTR_EL2_RES0
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
-
-/* Similar definitions for HCRX_EL2 */
+/* Polarity masks for HCRX_EL2 */
 #define __HCRX_EL2_RES0         HCRX_EL2_RES0
 #define __HCRX_EL2_MASK		(BIT(6))
 #define __HCRX_EL2_nMASK	~(__HCRX_EL2_RES0 | __HCRX_EL2_MASK)
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index e8645375499df..0d61ec3e907d4 100644
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


