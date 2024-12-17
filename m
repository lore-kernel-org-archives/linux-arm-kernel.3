Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65A2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOs7+Q0zdF8n+6FnyiF3eKh30ej9wEFZ/zF75+5jZrg=; b=3j1LiAC14y4uYQz4/n2mMfzG5g
	nRFtkN9eGiymylVtP0XWOFm4eq/R5Yu0XrNx+nrsd8Bg6D1+hyqN3cf2ZkrtZ+/F830VkebHp8LK7
	ufn6f01hMRgtjUv7nM3FJio/VZv4c9eEOl+kenODyyvPfGZMhM5+2RXN/hmhngG51Wj/t/V5AHVj1
	kqircBA4+T7IR2un4KAMgDh3tjQ2RTo5V48UzrpO7O1aTT2+SQRFGNNz/eW4pMH/g8895uROriC62
	fk8zfHae9FKhlZY8fi0AyJnrTNili5mDdJjfyMwZA6InY+698IJE71x5P2OILyRJ8GPjrDGhtGr45
	e9NNYHNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZa0-0000000DyLZ-1jg9;
	Tue, 17 Dec 2024 15:33:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZH7-0000000Duat-3ZPm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Dec 2024 15:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rOs7+Q0zdF8n+6FnyiF3eKh30ej9wEFZ/zF75+5jZrg=; b=YGd0syug0oT/rjZQKXVt2x2IIN
	DeTTR8AeQrCdhiXByqmxg916T+wXNPBf+DP4KIiQETMVUu7pZh3CHH6YwyZr9UbHjKvTvukw8xCvH
	Jpu5hIjT4r6iTfLMSJiYpPdOuJ8tRmU1ZRy5Fy5TdXXe9JOKJdSGQ6Jchq2cz+nntg9Lw5PHZv5Io
	I/8UgVlj1ruZZ9jmAQQqkne7MWdHSF5x1kRPSVM01zl6sXOEL3VIRoFvG2/JJFs+cw/9RDhRilb78
	UzCw/U7EH5GXY6cLupNsCBbwP20dy+QU4fJU8cE67wOmDIJA0naFo83z56XAre1WFOFxVCvEEvPYG
	WJKWcRTQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZH4-000000055rT-262V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 15:14:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 28EF4A41A1E;
	Tue, 17 Dec 2024 15:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6763AC4CEE1;
	Tue, 17 Dec 2024 15:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734448446;
	bh=dzdwNdYOOfhG4zCdAXdFzoWhsAldYa2ec5ajJWF3IkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HaHQlXSF2Lr75mwtqMDtiOh7McWBNB0woNqiXRIKRFRD7JbdgCoJiA20oUeBD6Wjr
	 Dz92bHfrgsgWNzHcpGfrWFmG/34LRXOdte2rcbnWpUtyiobY3Tdbtb6htsU+JNN4/q
	 7LyiJDRHdAIz14Vwchbm38RT0JQosQFTIYVhiPnrzuERJSXdtoImaREDWDHRX9CEBB
	 7/plno1k7WbA8OQN/IkgzhBK7NN7wv1QGiSYeNjuKwKnzsddAe4AcnmQzgUhJu+aX9
	 0oWZzPMMcvW/yep5S86n2DBUBrFPCf0p5+C6h/7X6H4Gm9cxXKt5kwzl+v47i3fpPm
	 oUPkGGzzT+aFg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNZGu-004bWV-MJ;
	Tue, 17 Dec 2024 15:14:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eauger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH 11/16] KVM: arm64: nv: Add Maintenance Interrupt emulation
Date: Tue, 17 Dec 2024 15:13:26 +0000
Message-Id: <20241217151331.934077-12-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217151331.934077-1-maz@kernel.org>
References: <20241217151331.934077-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eauger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_151414_867330_CF2863EF 
X-CRM114-Status: GOOD (  25.03  )
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
 arch/arm64/kvm/vgic/vgic-init.c      | 22 ++++++++++++++
 arch/arm64/kvm/vgic/vgic-v3-nested.c | 45 ++++++++++++++++++++++++++++
 arch/arm64/kvm/vgic/vgic.c           |  9 ++++++
 arch/arm64/kvm/vgic/vgic.h           |  2 ++
 include/kvm/arm_vgic.h               |  4 +++
 6 files changed, 88 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 5e353b2c225b4..756cc4e74e10f 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -824,6 +824,12 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
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
index bc7e22ab5d812..d2724315a70e9 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -180,6 +180,20 @@ static int kvm_vgic_dist_init(struct kvm *kvm, unsigned int nr_spis)
 	return 0;
 }
 
+int kvm_vgic_vcpu_nv_init(struct kvm_vcpu *vcpu)
+{
+	int ret;
+
+	guard(mutex)(&vcpu->kvm->arch.config_lock);
+
+	/* Cope with vintage userspace. Maybe we should fail instead */
+	if (vcpu->kvm->arch.vgic.maint_irq == 0)
+		vcpu->kvm->arch.vgic.maint_irq = kvm_vgic_global_state.maint_irq;
+	ret = kvm_vgic_set_owner(vcpu, vcpu->kvm->arch.vgic.maint_irq, vcpu);
+
+	return ret;
+}
+
 static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu)
 {
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
@@ -588,12 +602,20 @@ void kvm_vgic_cpu_down(void)
 
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
index 3d80bfb37de00..fba499a20aec8 100644
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
+			    vcpu->kvm->arch.vgic.maint_irq, state, vcpu);
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
+			    vcpu->kvm->arch.vgic.maint_irq, level, vcpu);
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
index 1b373cb870fe4..b33166f05124c 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -249,6 +249,9 @@ struct vgic_dist {
 
 	int			nr_spis;
 
+	/* The GIC maintenance IRQ for nested hypervisors. */
+	u32			maint_irq;
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


