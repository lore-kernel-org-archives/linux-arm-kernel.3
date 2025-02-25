Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6EFC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPEwNimXyuBwqn6lNkeQ1P2BZxpLSw8S7s4qRLN2dI4=; b=FoFved2QyPbZJBibaDwu/eEQM9
	JvzFX8SgjhzsT9eCBU9Ky+s3P3Y5krv615viBfRi5r03O5th3ySZlq0dJepzMlT/cnFW77kfttFW+
	DPbmyCFYDhxLnyMZAb1T/GDJgh5fkUjpVTXJu/4LVdwa5AztqACr7i1Xv2TKYn6heNjYtZq6rdaA4
	StMw5PO1AclIQZ3Ff8Mz0eZ+FzgjPbBdTFpIbgbhH78Je5fTknRiLEJ2+/4rhxSdrm1YEp4NNfth8
	NaSn4xvgDHLF7X533n76REVrhXGUoytgY1Y3sJVmOhYjkU3dVhDoUPCs0R7b5eNqTOVI2ccnUkw0+
	1lG984hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzX5-00000000tJj-03fs;
	Tue, 25 Feb 2025 18:19:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyke-00000000eA7-0CgN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:29:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB534612D5;
	Tue, 25 Feb 2025 17:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A785C4CEEB;
	Tue, 25 Feb 2025 17:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740504587;
	bh=Q9/hatBEdZNHyBSMGkAUQJN0V86qBIcAgfqfwdJE3dY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h4K4JfMpSIhXCctkK3M4TdHJJoIrciXH3KNrrFB+RCy4IK3BOTyaW3XS+jk2bIQ8t
	 LSUvflBFTKsF8U8w6Jc/Mo4ETOYag4XIf5PZE4v/UoDDFC5mee8gZuqBVoCWQetTUT
	 OWrwxPfs/OQ3XgpZeVOlL9a6AEtchNvz6HdVtaI/JZJTPk5MMpqWenrgE5IvY20/LP
	 SDjS7DCnQsRwdRjit86/IzijcwjmUq7UcRHWXa/i5xipUb0eMyFc/+WK75T7e8vlP0
	 3MiMaUmiQf9Q0CTm6qSvmSfOK6pD51FQP/Ln0FfDTXprzy504x04FdPQo7nugO9bW/
	 0hiSvKxtdcCqg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tmykb-007rKs-Nh;
	Tue, 25 Feb 2025 17:29:45 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v4 10/16] KVM: arm64: nv: Add Maintenance Interrupt emulation
Date: Tue, 25 Feb 2025 17:29:24 +0000
Message-Id: <20250225172930.1850838-11-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250225172930.1850838-1-maz@kernel.org>
References: <20250225172930.1850838-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
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

Emulating the vGIC means emulating the dreaded Maintenance Interrupt.

This is a two-pronged problem:

- while running L2, getting an MI translates into an MI injected
  in the L1 based on the state of the HW.

- while running L1, we must accurately reflect the state of the
  MI line, based on the in-memory state.

The MI INTID is added to the distributor, as expected on any
virtualisation-capable implementation, and further patches
will allow its configuration.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arm.c                 |  6 ++++
 arch/arm64/kvm/vgic/vgic-init.c      | 29 ++++++++++++++++++
 arch/arm64/kvm/vgic/vgic-v3-nested.c | 45 ++++++++++++++++++++++++++++
 arch/arm64/kvm/vgic/vgic.c           |  9 ++++++
 arch/arm64/kvm/vgic/vgic.h           |  2 ++
 include/kvm/arm_vgic.h               |  4 +++
 6 files changed, 95 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 697e8c6596a0f..dc27eb66d4e90 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -815,6 +815,12 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 	if (ret)
 		return ret;
 
+	if (vcpu_has_nv(vcpu)) {
+		ret = kvm_vgic_vcpu_nv_init(vcpu);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * This needs to happen after any restriction has been applied
 	 * to the feature set.
diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 775461cf2d2db..1f33e71c2a731 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -198,6 +198,27 @@ static int kvm_vgic_dist_init(struct kvm *kvm, unsigned int nr_spis)
 	return 0;
 }
 
+/* Default GICv3 Maintenance Interrupt INTID, as per SBSA */
+#define DEFAULT_MI_INTID	25
+
+int kvm_vgic_vcpu_nv_init(struct kvm_vcpu *vcpu)
+{
+	int ret;
+
+	guard(mutex)(&vcpu->kvm->arch.config_lock);
+
+	/*
+	 * Matching the tradition established with the timers, provide
+	 * a default PPI for the maintenance interrupt. It makes
+	 * things easier to reason about.
+	 */
+	if (vcpu->kvm->arch.vgic.mi_intid == 0)
+		vcpu->kvm->arch.vgic.mi_intid = DEFAULT_MI_INTID;
+	ret = kvm_vgic_set_owner(vcpu, vcpu->kvm->arch.vgic.mi_intid, vcpu);
+
+	return ret;
+}
+
 static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu, u32 type)
 {
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
@@ -588,12 +609,20 @@ void kvm_vgic_cpu_down(void)
 
 static irqreturn_t vgic_maintenance_handler(int irq, void *data)
 {
+	struct kvm_vcpu *vcpu = *(struct kvm_vcpu **)data;
+
 	/*
 	 * We cannot rely on the vgic maintenance interrupt to be
 	 * delivered synchronously. This means we can only use it to
 	 * exit the VM, and we perform the handling of EOIed
 	 * interrupts on the exit path (see vgic_fold_lr_state).
+	 *
+	 * Of course, NV throws a wrench in this plan, and needs
+	 * something special.
 	 */
+	if (vcpu && vgic_state_is_nested(vcpu))
+		vgic_v3_handle_nested_maint_irq(vcpu);
+
 	return IRQ_HANDLED;
 }
 
diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index 3d80bfb37de00..e72be14d99d55 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -73,6 +73,24 @@ static DEFINE_PER_CPU(struct shadow_if, shadow_if);
  *   interrupt. The L0 active state will be cleared by the HW if the L1
  *   interrupt was itself backed by a HW interrupt.
  *
+ * Maintenance Interrupt (MI) management:
+ *
+ * Since the L2 guest runs the vgic in its full glory, MIs get delivered and
+ * used as a handover point between L2 and L1.
+ *
+ * - on delivery of a MI to L0 while L2 is running: make the L1 MI pending,
+ *   and let it rip. This will initiate a vcpu_put() on L2, and allow L1 to
+ *   run and process the MI.
+ *
+ * - L1 MI is a fully virtual interrupt, not linked to the host's MI. Its
+ *   state must be computed at each entry/exit of the guest, much like we do
+ *   it for the PMU interrupt.
+ *
+ * - because most of the ICH_*_EL2 registers live in the VNCR page, the
+ *   quality of emulation is poor: L1 can setup the vgic so that an MI would
+ *   immediately fire, and not observe anything until the next exit. Trying
+ *   to read ICH_MISR_EL2 would do the trick, for example.
+ *
  * System register emulation:
  *
  * We get two classes of registers:
@@ -341,3 +359,30 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
 
 	shadow_if->lr_map = 0;
 }
+
+/*
+ * If we exit a L2 VM with a pending maintenance interrupt from the GIC,
+ * then we need to forward this to L1 so that it can re-sync the appropriate
+ * LRs and sample level triggered interrupts again.
+ */
+void vgic_v3_handle_nested_maint_irq(struct kvm_vcpu *vcpu)
+{
+	bool state = read_sysreg_s(SYS_ICH_MISR_EL2);
+
+	/* This will force a switch back to L1 if the level is high */
+	kvm_vgic_inject_irq(vcpu->kvm, vcpu,
+			    vcpu->kvm->arch.vgic.mi_intid, state, vcpu);
+
+	sysreg_clear_set_s(SYS_ICH_HCR_EL2, ICH_HCR_EL2_En, 0);
+}
+
+void vgic_v3_nested_update_mi(struct kvm_vcpu *vcpu)
+{
+	bool level;
+
+	level  = __vcpu_sys_reg(vcpu, ICH_HCR_EL2) & ICH_HCR_EL2_En;
+	if (level)
+		level &= vgic_v3_get_misr(vcpu);
+	kvm_vgic_inject_irq(vcpu->kvm, vcpu,
+			    vcpu->kvm->arch.vgic.mi_intid, level, vcpu);
+}
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 9734a71b85611..8f8096d489252 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -878,6 +878,9 @@ void kvm_vgic_sync_hwstate(struct kvm_vcpu *vcpu)
 		return;
 	}
 
+	if (vcpu_has_nv(vcpu))
+		vgic_v3_nested_update_mi(vcpu);
+
 	/* An empty ap_list_head implies used_lrs == 0 */
 	if (list_empty(&vcpu->arch.vgic_cpu.ap_list_head))
 		return;
@@ -921,6 +924,9 @@ void kvm_vgic_flush_hwstate(struct kvm_vcpu *vcpu)
 	 *
 	 * - Otherwise, do exactly *NOTHING*. The guest state is
 	 *   already loaded, and we can carry on with running it.
+	 *
+	 * If we have NV, but are not in a nested state, compute the
+	 * maintenance interrupt state, as it may fire.
 	 */
 	if (vgic_state_is_nested(vcpu)) {
 		if (kvm_vgic_vcpu_pending_irq(vcpu))
@@ -929,6 +935,9 @@ void kvm_vgic_flush_hwstate(struct kvm_vcpu *vcpu)
 		return;
 	}
 
+	if (vcpu_has_nv(vcpu))
+		vgic_v3_nested_update_mi(vcpu);
+
 	/*
 	 * If there are no virtual interrupts active or pending for this
 	 * VCPU, then there is no work to do and we can bail out without
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index cf0c084e5d347..0c5a63712702b 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -356,5 +356,7 @@ static inline bool kvm_has_gicv3(struct kvm *kvm)
 void vgic_v3_sync_nested(struct kvm_vcpu *vcpu);
 void vgic_v3_load_nested(struct kvm_vcpu *vcpu);
 void vgic_v3_put_nested(struct kvm_vcpu *vcpu);
+void vgic_v3_handle_nested_maint_irq(struct kvm_vcpu *vcpu);
+void vgic_v3_nested_update_mi(struct kvm_vcpu *vcpu);
 
 #endif
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 1b373cb870fe4..714cef854c1c3 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -249,6 +249,9 @@ struct vgic_dist {
 
 	int			nr_spis;
 
+	/* The GIC maintenance IRQ for nested hypervisors. */
+	u32			mi_intid;
+
 	/* base addresses in guest physical address space: */
 	gpa_t			vgic_dist_base;		/* distributor */
 	union {
@@ -369,6 +372,7 @@ extern struct static_key_false vgic_v3_cpuif_trap;
 int kvm_set_legacy_vgic_v2_addr(struct kvm *kvm, struct kvm_arm_device_addr *dev_addr);
 void kvm_vgic_early_init(struct kvm *kvm);
 int kvm_vgic_vcpu_init(struct kvm_vcpu *vcpu);
+int kvm_vgic_vcpu_nv_init(struct kvm_vcpu *vcpu);
 int kvm_vgic_create(struct kvm *kvm, u32 type);
 void kvm_vgic_destroy(struct kvm *kvm);
 void kvm_vgic_vcpu_destroy(struct kvm_vcpu *vcpu);
-- 
2.39.2


