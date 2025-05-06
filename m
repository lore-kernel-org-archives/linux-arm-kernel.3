Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ECAC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eo3p/hvnPted5Tf8rgtukJBd83mP5macSBoQtVIg0P8=; b=gvsiYpf8RKTU3p+iP05fir/7wB
	5jkhnJwR4emEyjkFrPwMoL/0DeRwnXwSVAV6usm7qoUlHPL4p0eUzdgsMiW/9JRTB4qmYxmc9EvAF
	qSj1mUJ+wJKkvTEcrSi/U2IeIjFVxWAAR5dbLEZjCj3EFlJGH4eYgRCaSLbOc/8/Ja6+FOtiCMgOc
	axb1cGua2jS9d8nyTly/tPCmL0Y+hNVNucVWAIiOp1SYFfwQf5Ie/iF/lhMdlqELDxHE7gSpkTGo2
	xmnHL7F/LH8R/QRzl3FKDJKwBEIihHnPq+qfVj3OihESMPEj2l1jGcbYjUSO10SoOGo5HFGq6eNVN
	VdIVkMyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQgo-0000000DWUw-0lnL;
	Tue, 06 May 2025 22:23:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOx-0000000CiOi-0u3Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65BB961165;
	Tue,  6 May 2025 16:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1843CC4CEF1;
	Tue,  6 May 2025 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549854;
	bh=ceQ5h51pgohC6eDTheM4F75C9biUzOEEkPGcwL/xiRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tYfljZ1KHDOy8Uq0SkDvg9+cCfthb4EVLF4GeuaBmY893DuwZJl5VHs+zHbgzmIHc
	 A8dg4w1TA0ANOg/cNucDo67gXaTmziq9qyz58y/vLdZuSDQoRmgZJZhk27RZScDv/s
	 N6wpVWaFHY+4j+09ODnluCJ+Vy0Rx22JHyl+atJoR/GhkBVn0CKLGWaUBuOzDFAgYc
	 S8cW7HaP2cf0VkO7VOM99T5dQl7aUDE4EwrkF67NxQCHqJcsLbg7wM40/jEeVrbgZr
	 tO31hqkVgtrtGqBu68z0Xc6RaCiIzyYgtoJyOAEYfZB/3k3JENyGXwbzAUS2scoZ4W
	 eaAiednFd4Swg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOu-00CJkN-Bb;
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
Subject: [PATCH v4 27/43] KVM: arm64: Use computed FGT masks to setup FGT registers
Date: Tue,  6 May 2025 17:43:32 +0100
Message-Id: <20250506164348.346001-28-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250506164348.346001-1-maz@kernel.org>
References: <20250506164348.346001-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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


