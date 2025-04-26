Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF12EC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 13:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eo3p/hvnPted5Tf8rgtukJBd83mP5macSBoQtVIg0P8=; b=pqWefl6Zs4cWoka+rIRSm6AChU
	koXJ2G++Q6TT63EiTa8kMJxmbS+fPWVrav5FhqAyVp0PwEMjtbsFhh2O6LeUJzEm0itQHU0QD/mmR
	KgJGLOWetsuCoFlMplcn3cZmUFZ6U+pHwe1IUzcZ7SK8+FIELrHPBdcRWbjtvImVlOIaKAlMCS3Ah
	H9zqn59O905zOV1OqFMpZkCtWVw3XetmeflvBG0uQH9olsLicelgvCl7Hx8858rwIzFx/BdN1J9tO
	iTp6ql6OV9kAgvGT50UsAQbUO9BkQYv4QVq3YblTSf9qhX8HuLdxBdU2cqAX7j2fqf5+4FmelINBT
	dPUEadqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8fOQ-0000000248M-1eLW;
	Sat, 26 Apr 2025 13:16:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeP-00000001z1L-3z7N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:28:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 149DE4A6DB;
	Sat, 26 Apr 2025 12:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB10FC4CEEB;
	Sat, 26 Apr 2025 12:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670537;
	bh=ceQ5h51pgohC6eDTheM4F75C9biUzOEEkPGcwL/xiRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RVF0CWvLBr6ofPFH8ZceljTto1OiGJ6Dwixl7zMglA+NP0e29eYJ5f6VExVO0r7/o
	 APNB/v8ouJxQGU2GJ5gN5Vv6zwaFbngElgewCU6h9Aj84vhJN8xCz+hI7xsTh4ut6O
	 8qtaKd5ZIuGie1Hv0uxq8GaLZXYF0nMfD+psRLA1BTuJbCArueyG2Uk5huSxyJUg6m
	 lTOQoy7f9/n0m8sO2WJKxEQL3+7YZLId2PC2HlFiSba/VLr0QYG19ApJTVpydVuVNp
	 SHY8KggtA649i6HWXM/gBHPnwjgQguUd5r3IrTN3sNEX1yBm+UXYTirOeQ72ZGn7ty
	 jfba1gCguslUg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeN-0092VH-VF;
	Sat, 26 Apr 2025 13:28:56 +0100
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
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 26/42] KVM: arm64: Use computed FGT masks to setup FGT registers
Date: Sat, 26 Apr 2025 13:28:20 +0100
Message-Id: <20250426122836.3341523-27-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_052858_027257_E66612BC 
X-CRM114-Status: GOOD (  11.52  )
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

Flip the hyervisor FGT configuration over to the computed FGT
masks.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 45 +++++++++++++++++++++----
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 925a3288bd5be..e8645375499df 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -65,12 +65,41 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 	}
 }
 
+#define reg_to_fgt_masks(reg)						\
+	({								\
+		struct fgt_masks *m;					\
+		switch(reg) {						\
+		case HFGRTR_EL2:					\
+			m = &hfgrtr_masks;				\
+			break;						\
+		case HFGWTR_EL2:					\
+			m = &hfgwtr_masks;				\
+			break;						\
+		case HFGITR_EL2:					\
+			m = &hfgitr_masks;				\
+			break;						\
+		case HDFGRTR_EL2:					\
+			m = &hdfgrtr_masks;				\
+			break;						\
+		case HDFGWTR_EL2:					\
+			m = &hdfgwtr_masks;				\
+			break;						\
+		case HAFGRTR_EL2:					\
+			m = &hafgrtr_masks;				\
+			break;						\
+		default:						\
+			BUILD_BUG_ON(1);				\
+		}							\
+									\
+		m;							\
+	})
+
 #define compute_clr_set(vcpu, reg, clr, set)				\
 	do {								\
-		u64 hfg;						\
-		hfg = __vcpu_sys_reg(vcpu, reg) & ~__ ## reg ## _RES0;	\
-		set |= hfg & __ ## reg ## _MASK; 			\
-		clr |= ~hfg & __ ## reg ## _nMASK; 			\
+		u64 hfg = __vcpu_sys_reg(vcpu, reg);			\
+		struct fgt_masks *m = reg_to_fgt_masks(reg);		\
+		set |= hfg & m->mask;					\
+		clr |= ~hfg & m->nmask;					\
 	} while(0)
 
 #define reg_to_fgt_group_id(reg)					\
@@ -101,12 +130,14 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 #define compute_undef_clr_set(vcpu, kvm, reg, clr, set)			\
 	do {								\
 		u64 hfg = kvm->arch.fgu[reg_to_fgt_group_id(reg)];	\
-		set |= hfg & __ ## reg ## _MASK;			\
-		clr |= hfg & __ ## reg ## _nMASK; 			\
+		struct fgt_masks *m = reg_to_fgt_masks(reg);		\
+		set |= hfg & m->mask;					\
+		clr |= hfg & m->nmask;					\
 	} while(0)
 
 #define update_fgt_traps_cs(hctxt, vcpu, kvm, reg, clr, set)		\
 	do {								\
+		struct fgt_masks *m = reg_to_fgt_masks(reg);		\
 		u64 c = clr, s = set;					\
 		u64 val;						\
 									\
@@ -116,7 +147,7 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 									\
 		compute_undef_clr_set(vcpu, kvm, reg, c, s);		\
 									\
-		val = __ ## reg ## _nMASK;				\
+		val = m->nmask;						\
 		val |= s;						\
 		val &= ~c;						\
 		write_sysreg_s(val, SYS_ ## reg);			\
-- 
2.39.2


