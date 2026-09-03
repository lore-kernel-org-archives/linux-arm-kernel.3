Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8ECC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6hGkVHmBP5jrFa99O+ZBFV6YfInTzBxEk0OnuB7Ai4=; b=pjntb/5FdTE2PeZkxAkPadOpKT
	ncANpl0B0CIS86/NkiWW5kygXGNOKes/8hozT/xjLcLl8U5W+eIP7Pn61LY1fmAGoi1zavjYuIP9g
	XJ9kzsK60mJ2L74Zz4kut8iLaQ1wYTXKADUTpm7kVtnO3wN/Yb5PsHQ1hP/KUm8wnWj/PBAh3qEkq
	zA8IGMM+YAu41hw0UAhtVP4Pl4IrRyRn4whfmViYZveShp/3AsrrNYXFklJrhyBMXR3LXwGQnxVYc
	V0Ud58Uo7CFhnEjLIPSLDdYBMPXXthgnFs/4JhQ8NhXA3uOcbw6bEgRtwpyGemkZN8qsgyFyxznJW
	fMzKphtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29yG-0000000064a-21Rv;
	Thu, 03 Sep 2026 16:07:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29yC-000000005vU-1ypV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:07:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 941241F37;
	Thu,  3 Sep 2026 09:07:15 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 883F03F673;
	Thu,  3 Sep 2026 09:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451639; bh=Ur0HRBHNXuNUsanyiNrydSRbekKoOYQHNtOMwGgNFz4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HJGebB6HVU+ZX7jhkjuTMR6wsOcq8IyI1/hxz4vP6Ap/8WIrHSmuwnhEEjpzl7/ka
	 gREb1pi7rtXKTh9qTw8fJgy22a69mlaImyCWtD32rDhaUpFqTNRMN4ltmV4V814GhB
	 /Ajyi8a1WQFDY6TzwVzTG9KfVjGauX/AMRHLZZUM=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: [RFC PATCH v7 21/28] KVM: arm64: Handle SPE maintenance interrupts
Date: Thu,  3 Sep 2026 17:06:16 +0100
Message-ID: <20260903160623.315525-22-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090720_614026_CFCBEC74 
X-CRM114-Status: GOOD (  19.81  )
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

Inject the maintenance interrupt when the guest writes 1 to PMBSR_EL1.S,
and deassert the interrupt when the service bit is cleared.

Re-inject all maintenance interrupts raised by the SPE hardware while
the guest was running.

Save the value of the hardware PMBSR_EL1 register in a separate
variable, instead of updating the VCPU sysreg directly. That's to allow
kvm_spe_sync_hwstate() to discern when the service bit was set by the
hardware, and not by the guest.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_spe.h | 13 ++++++++++
 arch/arm64/kvm/arm.c             |  2 ++
 arch/arm64/kvm/hyp/vhe/spe-sr.c  |  4 +--
 arch/arm64/kvm/spe.c             | 43 ++++++++++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c        |  7 +++++-
 5 files changed, 66 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
index 8a55ea0de4e5..385b1157e578 100644
--- a/arch/arm64/include/asm/kvm_spe.h
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -19,8 +19,10 @@ struct kvm_spe {
 };
 
 struct kvm_vcpu_spe {
+	u64 hw_pmbsr_el1;	/* Updated on hardware management event */
 	int irq_num;		/* Buffer management interrupt number */
 	bool initialized;	/* SPE initialized for the VCPU */
+	bool irq_level;		/* Virtual buffer management interrupt level */
 };
 
 bool kvm_supports_spe(void);
@@ -43,11 +45,15 @@ int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
 bool kvm_spe_pmu_set(struct kvm *kvm);
 u8 kvm_spe_get_pmsver(struct kvm *kvm);
 
+u64 kvm_spe_reset_sysreg(struct kvm_vcpu *vcpu, int reg);
+
 bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val);
 u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg);
 
 bool kvm_spe_has_feat_spe_fne(struct kvm *kvm);
 bool kvm_spe_has_feat_spe_fds(struct kvm *kvm);
+
+void kvm_spe_sync_hwstate(struct kvm_vcpu *vcpu);
 #else
 struct kvm_spe {
 };
@@ -99,6 +105,10 @@ static inline u8 kvm_spe_get_pmsver(struct kvm *kvm)
 {
 	return 0;
 }
+static inline u64 kvm_spe_reset_sysreg(struct kvm_vcpu *vcpu, int reg)
+{
+	return 0;
+}
 static inline bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
 {
 	return true;
@@ -115,6 +125,9 @@ static inline bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
 {
 	return false;
 }
+static inline void kvm_spe_sync_hwstate(struct kvm_vcpu *vcpu)
+{
+}
 #endif /* CONFIG_KVM_ARM_SPE */
 
 #endif /* __ARM64_KVM_SPE_H__ */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 5992efc4f94b..689fa175f5f4 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1421,6 +1421,8 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		if (kvm_vcpu_has_pmu(vcpu))
 			kvm_pmu_sync_hwstate(vcpu);
 
+		kvm_spe_sync_hwstate(vcpu);
+
 		/*
 		 * Sync the vgic state before syncing the timer state because
 		 * the timer code needs to know if the virtual timer
diff --git a/arch/arm64/kvm/hyp/vhe/spe-sr.c b/arch/arm64/kvm/hyp/vhe/spe-sr.c
index 3c32a1338cc8..df35025db19a 100644
--- a/arch/arm64/kvm/hyp/vhe/spe-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/spe-sr.c
@@ -154,10 +154,10 @@ void __kvm_spe_save_guest_state_vhe(struct kvm_vcpu *vcpu, struct kvm_cpu_contex
 		psb_csync();
 		dsb(nsh);
 		write_sysreg_s(0, SYS_PMBLIMITR_EL1);
-		/* Advance PMBPTR_EL1. */
+		/* Advance PMBPTR_EL1 and PMBSR_EL1. */
 		isb();
 
-		/* Hardware updates to PMBSR_EL1 are not handled, yet. */
+		vcpu->arch.vcpu_spe.hw_pmbsr_el1 = read_sysreg_s(SYS_PMBSR_EL1);
 		ctxt_sys_reg(guest_ctxt, PMBPTR_EL1) = read_sysreg_s(SYS_PMBPTR_EL1);
 	}
 
diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index 68b751bdb384..89ebeef1c223 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -21,6 +21,8 @@ struct spe_pmu_entry {
 	struct arm_spe_pmu *spe_pmu;
 };
 
+static void kvm_spe_update_irq_level(struct kvm_vcpu *vcpu, bool level);
+
 void kvm_spe_add_instance(struct arm_spe_pmu *spe_pmu)
 {
 	struct spe_pmu_entry *entry;
@@ -152,6 +154,14 @@ bool kvm_spe_has_feat_spe_fne(struct kvm *kvm)
 	       FIELD_GET(PMSIDR_EL1_FnE, spe_pmu->pmsidr_el1);
 }
 
+u64 kvm_spe_reset_sysreg(struct kvm_vcpu *vcpu, int reg)
+{
+	if (reg == PMBSR_EL1 && kvm_vcpu_spe_initialized(vcpu))
+		kvm_spe_update_irq_level(vcpu, false);
+
+	return 0;
+}
+
 bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
 {
 	struct kvm_spe *kvm_spe = &vcpu->kvm->arch.kvm_spe;
@@ -168,6 +178,11 @@ bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
 		WARN_ON_ONCE("unexpected trap");
 	}
 
+	if (reg == PMBSR_EL1) {
+		val = __vcpu_sys_reg(vcpu, PMBSR_EL1);
+		kvm_spe_update_irq_level(vcpu, FIELD_GET(PMBSR_EL1_S, val));
+	}
+
 	return true;
 }
 
@@ -184,6 +199,34 @@ u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg)
 	}
 }
 
+static void kvm_spe_update_irq_level(struct kvm_vcpu *vcpu, bool level)
+{
+	struct kvm_vcpu_spe *vcpu_spe = &vcpu->arch.vcpu_spe;
+	int ret;
+
+	if (vcpu_spe->irq_level == level)
+		return;
+
+	ret = kvm_vgic_inject_irq(vcpu->kvm, vcpu, vcpu_spe->irq_num, level, vcpu_spe);
+	if (!WARN_ON_ONCE(ret))
+		vcpu_spe->irq_level = level;
+}
+
+void kvm_spe_sync_hwstate(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_spe *vcpu_spe = &vcpu->arch.vcpu_spe;
+
+	if (!vcpu_has_spe(vcpu))
+		return;
+
+	if (!FIELD_GET(PMBSR_EL1_S, vcpu_spe->hw_pmbsr_el1))
+		return;
+
+	__vcpu_assign_sys_reg(vcpu, PMBSR_EL1, vcpu_spe->hw_pmbsr_el1);
+	vcpu_spe->hw_pmbsr_el1 = 0;
+	kvm_spe_update_irq_level(vcpu, true);
+}
+
 bool kvm_spe_pmu_set(struct kvm *kvm)
 {
 	return !!kvm->arch.kvm_spe.spe_pmu;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 4c4bf88c9aa5..ebe1c933f8d5 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1595,6 +1595,11 @@ static int get_user_spe_sysreg(struct kvm_vcpu *vcpu, const struct sys_reg_desc
 	return 0;
 }
 
+static u64 reset_spe_sysreg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
+{
+	return kvm_spe_reset_sysreg(vcpu, r->reg);
+}
+
 static bool access_spe_reg(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			   const struct sys_reg_desc *r)
 {
@@ -1642,7 +1647,7 @@ static bool access_spe_reg(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 
 #define SPE_SYS_REG(name)						\
 	SYS_DESC(SYS_##name), .reg = name, .access = access_spe_reg,	\
-	.reset = reset_val, .val = 0, .visibility = spe_visibility,	\
+	.reset = reset_spe_sysreg, .visibility = spe_visibility,	\
 	.set_user = set_user_spe_sysreg, .get_user = get_user_spe_sysreg
 
 #define SPE_UNTRAPPED_REG(name)						\
-- 
2.43.0


