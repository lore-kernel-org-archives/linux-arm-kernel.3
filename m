Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73598CFA442
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atMmLdkWSDQKQ+EaQfZu6/c8pHXHBI9F+m7JswswBDs=; b=2vC0APyeqJeLL5wBRiQvJBxCeI
	Jr44F6GVlUiMJckayR0Ljx9/vvDEtDGmb35+gbRxjja5G8AmDizBNRnHV0nZl2EsVz9Ruh70ccrTA
	6qykgGAfWAw2jN6xg8HRShH9Meg2MKF7f/6rscgBe/JTm1XVyoqmm6m0dW+XWpWt5YBzk9ijkTYmz
	rvPsJnkeWUG3sl31FgACJcQkbiIaM1+lBRgTnN8dLRd+lor1D3mC0n+zvDN14yfI/m65stHyz63yd
	BBmk4Ef0YXox5DUqLGlhfWHs0hXMa0tfhdwxzd8kNMSA8u2Rz7tfTLcR5EhgUdHvf1vZRJbVOVAEe
	R9X+4RXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dQT-0000000EzI8-0pkF;
	Wed, 23 Oct 2024 15:37:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckP-0000000EpR5-34bU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 14:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=atMmLdkWSDQKQ+EaQfZu6/c8pHXHBI9F+m7JswswBDs=; b=R4TR98xqJMaEi3+bPuXuGyzYX1
	/Xe+INZ4pzuzwUvA6GQfSHDtcB9zUeAg8j9jIhz0S/faTKAHsQ3zeU3mgDNYW3CgZcZXkcJwaBsjy
	ZARxHakAdHOauw/x0/qG/5NZ80pRMH2iyhFVXyPjBQbPD/i6gS98xcoio4LjwkrnPNMMMCsUwLgmV
	9NkW6sZy40otCpi0T6uvc4yMRj9Kz/epnFXviURWA1WB6EHJ7C5Gq0RITBwWED6kS0q7brq4S3dXE
	gdT5b/QTzXW2kcA3hGfRecmm2ANxIZLp/h1SSs5aWaUNrAumE8M3IB9GrS1Rry5YJbVxKfoovDo4+
	bC3IT3bA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckM-00000008Qbi-1hHb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9332EA4504A;
	Wed, 23 Oct 2024 14:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7369CC4CEE6;
	Wed, 23 Oct 2024 14:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695237;
	bh=DU3dgMf4tNeWjgG0Nf5jlTQ88fuhiFgtrah3HTYYgiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dwzu1iiO0ANew1vizSSs9G3Ijh6Qos4m5/AdEqkvpl5CTxjaT0KF/s+27obe0BIos
	 cgeC08BrktDqn8HPwFPbZWrJq8SuFdRoqOfzbAJfdvfy/6UusOhk2IAqJr07OeDWCQ
	 c9095/8BxJ8C/UBJU/qBIHzKVag7aL9BKOVoTpJTSrITUSAkrcf19elsjQQmUvp5JD
	 UBJUzGMt9MKpZHyYBxAT5MYDq7HTJKEeODBMdMo6Pc8IZPW9pXrC5uErftFosUoo8i
	 JZGytgHCE5xnvFxpZLAINDvmh5klkpNOx1KyMl/lYtz6BItVftwTYTNmFSEax3JEQq
	 SMq/NJBBQMj7Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckF-0068vz-O3;
	Wed, 23 Oct 2024 15:53:55 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 30/37] KVM: arm64: Add kvm_has_s1poe() helper
Date: Wed, 23 Oct 2024 15:53:38 +0100
Message-Id: <20241023145345.1613824-31-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_155402_871809_B457B13D 
X-CRM114-Status: GOOD (  13.64  )
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

Just like we have kvm_has_s1pie(), add its S1POE counterpart,
making the code slightly more readable.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h          | 3 +++
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 2 +-
 arch/arm64/kvm/nested.c                    | 4 ++--
 arch/arm64/kvm/sys_regs.c                  | 4 ++--
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 9a6997827ad49..3c435e88d74b8 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1517,4 +1517,7 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 #define kvm_has_s1pie(k)				\
 	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1PIE, IMP))
 
+#define kvm_has_s1poe(k)				\
+	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1POE, IMP))
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index a306ea70502c4..a651c43ad679f 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -80,7 +80,7 @@ static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt)
 		return false;
 
 	vcpu = ctxt_to_vcpu(ctxt);
-	return kvm_has_feat(kern_hyp_va(vcpu->kvm), ID_AA64MMFR3_EL1, S1POE, IMP);
+	return kvm_has_s1poe(kern_hyp_va(vcpu->kvm));
 }
 
 static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 47be71279c304..ff047a84d15dc 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1082,7 +1082,7 @@ int kvm_init_nv_sysregs(struct kvm *kvm)
 		res0 |= HFGxTR_EL2_nRCWMASK_EL1;
 	if (!kvm_has_s1pie(kvm))
 		res0 |= (HFGxTR_EL2_nPIRE0_EL1 | HFGxTR_EL2_nPIR_EL1);
-	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, S1POE, IMP))
+	if (!kvm_has_s1poe(kvm))
 		res0 |= (HFGxTR_EL2_nPOR_EL0 | HFGxTR_EL2_nPOR_EL1);
 	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, S2POE, IMP))
 		res0 |= HFGxTR_EL2_nS2POR_EL1;
@@ -1192,7 +1192,7 @@ int kvm_init_nv_sysregs(struct kvm *kvm)
 		res0 |= TCR2_EL2_PTTWI | TCR2_EL2_PnCH;
 	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, AIE, IMP))
 		res0 |= TCR2_EL2_AIE;
-	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, S1POE, IMP))
+	if (!kvm_has_s1poe(kvm))
 		res0 |= TCR2_EL2_POE | TCR2_EL2_E0POE;
 	if (!kvm_has_s1pie(kvm))
 		res0 |= TCR2_EL2_PIE;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 6c20de8607b2d..c89a165408498 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2316,7 +2316,7 @@ static bool access_zcr_el2(struct kvm_vcpu *vcpu,
 static unsigned int s1poe_visibility(const struct kvm_vcpu *vcpu,
 				     const struct sys_reg_desc *rd)
 {
-	if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S1POE, IMP))
+	if (kvm_has_s1poe(vcpu->kvm))
 		return 0;
 
 	return REG_HIDDEN;
@@ -4802,7 +4802,7 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 		kvm->arch.fgu[HFGxTR_GROUP] |= (HFGxTR_EL2_nPIRE0_EL1 |
 						HFGxTR_EL2_nPIR_EL1);
 
-	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, S1POE, IMP))
+	if (!kvm_has_s1poe(kvm))
 		kvm->arch.fgu[HFGxTR_GROUP] |= (HFGxTR_EL2_nPOR_EL1 |
 						HFGxTR_EL2_nPOR_EL0);
 
-- 
2.39.2


