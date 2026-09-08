Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3270BC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZ3OTPrjCYjNrnxjUFWiWBPQ1NEKG2CkhkdYxU071hM=; b=D3vFy/K0MLYbdpBScb0nu2Y0Hz
	Cgcwbhnf0L1AGoXFQ9BqagyWn1KovcEfEfF6CtZZq6ik7WTwtnF3yo4xDiU9g+3HP2fZt3Usomopi
	2gQzdUaz4oVrxaX1wjbX1y7GsAiM7AzK4AUcQRUqmTrUlnNCqyOoulkTTIz19qMKhzdw43hB9qt6T
	gUwEty3flpIuWgl5qAZobPuctx/LFFTw7BOeJ47monZvUQavUVdONMxTVFR7V28c6Zs/0bn0A/s1i
	QTBolqerK6xx9mqSH2Orfr5n/fHwriuHWNSbuBjXmlovJLDckTMKEW8JJPV8mg1qc089Udih2pDtq
	c0Bndx7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ybG-00000009dCl-2TOn;
	Tue, 08 Sep 2026 16:23:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ybD-00000009dAM-433H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:23:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FCC91476;
	Tue,  8 Sep 2026 09:23:03 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6F7C03F7B4;
	Tue,  8 Sep 2026 09:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788884586; bh=mLztz2bBk7TLJ4RrXB4VtymPwt7FFyDvGQ4i4G6/fAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eaIQgo5hBEEoJPSXq8eOfnpVZ9hoy+eyEOWyvsMlm6F7y4OObvw3ThRmunGdVM/Tj
	 wubuJZuG9I8FjOsEvAO/j0UL+iyYle9ZohLPtEHu198+T0Y5FYGqPgBP6wYaf6VHJw
	 fD8KsXbUoum959SFUPhh0KM1aDbRqCytG7dNLHFI=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v17 05/20] KVM: arm64: Add vcpu load/put call backs for flavors
Date: Tue,  8 Sep 2026 17:22:08 +0100
Message-ID: <20260908162223.1683432-6-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908162223.1683432-1-suzuki.poulose@arm.com>
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_092308_110794_307A0FDD 
X-CRM114-Status: GOOD (  15.97  )
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

Add VM flavor specific handlers for VCPU load/put, in an effort to make it
easier to follow the code.

Based on a patch by Marc Zyngier

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/include/asm/kvm_host.h |   6 ++
 arch/arm64/kvm/arm.c              | 156 ++++++++++++++++++++++--------
 2 files changed, 123 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index d0dccc9ad6aa8..b2e99c5cb1cd3 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -150,6 +150,11 @@ struct kvm_vmid {
 	atomic64_t id;
 };
 
+struct kvm_vcpu_ops {
+	void (*vcpu_load)(struct kvm_vcpu *vcpu, int cpu);
+	void (*vcpu_put)(struct kvm_vcpu *vcpu);
+};
+
 struct kvm_s2_mmu {
 	struct kvm_vmid vmid;
 
@@ -854,6 +859,7 @@ struct vncr_tlb;
 
 struct kvm_vcpu_arch {
 	struct kvm_cpu_context ctxt;
+	const struct kvm_vcpu_ops *vcpu_ops;
 
 	/*
 	 * Guest floating point state
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 51fc651267157..9af3bbb2f8c24 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -74,6 +74,8 @@ struct kvm_ioctl_cap_map {
 	long ext;
 };
 
+static const struct kvm_vcpu_ops *arm64_vcpu_ops[VM_FLAVOR_MAX];
+
 /* Make KVM_CAP_NR_VCPUS the reference for features we always supported */
 #define KVM_CAP_ARM_BASIC	KVM_CAP_NR_VCPUS
 
@@ -569,6 +571,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	mutex_unlock(&vcpu->mutex);
 #endif
 
+	vcpu->arch.vcpu_ops = arm64_vcpu_ops[vcpu->kvm->arch.vm_flavor];
+
 	/* Force users to call KVM_ARM_VCPU_INIT */
 	vcpu_clear_flag(vcpu, VCPU_INITIALIZED);
 
@@ -738,36 +742,72 @@ static void vcpu_load_pvtime(struct kvm_vcpu *vcpu)
 		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
 }
 
+static void vhe_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+{
+	vcpu_prepare_mmu(vcpu);
+	/*
+	 * The timer must be loaded before the vgic to correctly set up physical
+	 * interrupt deactivation in nested state (e.g. timer interrupt).
+	 */
+	kvm_timer_vcpu_load(vcpu);
+	kvm_vgic_load(vcpu);
+	kvm_vcpu_load_debug(vcpu);
+	kvm_vcpu_load_fgt(vcpu);
+	kvm_vcpu_load_vhe(vcpu);
+	kvm_arch_vcpu_load_fp(vcpu);
+	kvm_vcpu_pmu_restore_guest(vcpu);
+
+	vcpu_load_pvtime(vcpu);
+	vcpu_set_wfx_traps(vcpu);
+	vcpu_set_pauth_traps(vcpu);
+}
+
+static void nvhe_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+{
+	vcpu_prepare_mmu(vcpu);
+	/*
+	 * The timer must be loaded before the vgic to correctly set up physical
+	 * interrupt deactivation in nested state (e.g. timer interrupt).
+	 */
+	kvm_timer_vcpu_load(vcpu);
+	kvm_vgic_load(vcpu);
+	kvm_vcpu_load_debug(vcpu);
+	kvm_vcpu_load_fgt(vcpu);
+	kvm_arch_vcpu_load_fp(vcpu);
+	kvm_vcpu_pmu_restore_guest(vcpu);
+
+	vcpu_load_pvtime(vcpu);
+	vcpu_set_wfx_traps(vcpu);
+	vcpu_set_pauth_traps(vcpu);
+}
+
+static void pkvm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+{
+	/*
+	 * The timer must be loaded before the vgic to correctly set up physical
+	 * interrupt deactivation in nested state (e.g. timer interrupt).
+	 */
+	kvm_timer_vcpu_load(vcpu);
+	kvm_vgic_load(vcpu);
+	kvm_vcpu_load_debug(vcpu);
+	kvm_vcpu_load_fgt(vcpu);
+	kvm_arch_vcpu_load_fp(vcpu);
+	kvm_vcpu_pmu_restore_guest(vcpu);
+
+	vcpu_load_pvtime(vcpu);
+	vcpu_set_wfx_traps(vcpu);
+
+	kvm_call_hyp_nvhe(__pkvm_vcpu_load,
+			  vcpu->kvm->arch.pkvm.handle,
+			  vcpu->vcpu_idx, vcpu->arch.hcr_el2);
+	kvm_call_hyp(__vgic_v3_restore_vmcr_aprs,
+		     &vcpu->arch.vgic_cpu.vgic_v3);
+}
+
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
-	if (!is_protected_kvm_enabled())
-		vcpu_prepare_mmu(vcpu);
-
 	vcpu->cpu = cpu;
-	/*
-	 * The timer must be loaded before the vgic to correctly set up physical
-	 * interrupt deactivation in nested state (e.g. timer interrupt).
-	 */
-	kvm_timer_vcpu_load(vcpu);
-	kvm_vgic_load(vcpu);
-	kvm_vcpu_load_debug(vcpu);
-	kvm_vcpu_load_fgt(vcpu);
-	if (has_vhe())
-		kvm_vcpu_load_vhe(vcpu);
-	kvm_arch_vcpu_load_fp(vcpu);
-	kvm_vcpu_pmu_restore_guest(vcpu);
-
-	vcpu_load_pvtime(vcpu);
-	vcpu_set_wfx_traps(vcpu);
-	vcpu_set_pauth_traps(vcpu);
-
-	if (is_protected_kvm_enabled()) {
-		kvm_call_hyp_nvhe(__pkvm_vcpu_load,
-				  vcpu->kvm->arch.pkvm.handle,
-				  vcpu->vcpu_idx, vcpu->arch.hcr_el2);
-		kvm_call_hyp(__vgic_v3_restore_vmcr_aprs,
-			     &vcpu->arch.vgic_cpu.vgic_v3);
-	}
+	vcpu->arch.vcpu_ops->vcpu_load(vcpu, cpu);
 
 	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
 		vcpu_set_on_unsupported_cpu(vcpu);
@@ -775,28 +815,44 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	vcpu->arch.pid = pid_nr(vcpu->pid);
 }
 
-void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
+static void vhe_vcpu_put(struct kvm_vcpu *vcpu)
 {
-	if (is_protected_kvm_enabled()) {
-		kvm_call_hyp(__vgic_v3_save_aprs, &vcpu->arch.vgic_cpu.vgic_v3);
-		kvm_call_hyp_nvhe(__pkvm_vcpu_put);
-
-		/* __pkvm_vcpu_put implies a sync of the state */
-		if (!kvm_vm_is_protected(vcpu->kvm))
-			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
-	}
-
 	kvm_vcpu_put_debug(vcpu);
 	kvm_arch_vcpu_put_fp(vcpu);
-	if (has_vhe())
-		kvm_vcpu_put_vhe(vcpu);
+	kvm_vcpu_put_vhe(vcpu);
 	kvm_timer_vcpu_put(vcpu);
 	kvm_vgic_put(vcpu);
 	kvm_vcpu_pmu_restore_host(vcpu);
 	if (vcpu_has_nv(vcpu))
 		kvm_vcpu_put_hw_mmu(vcpu);
 	kvm_arm_vmid_clear_active();
+}
 
+static void nvhe_vcpu_put(struct kvm_vcpu *vcpu)
+{
+	kvm_vcpu_put_debug(vcpu);
+	kvm_arch_vcpu_put_fp(vcpu);
+	kvm_timer_vcpu_put(vcpu);
+	kvm_vgic_put(vcpu);
+	kvm_vcpu_pmu_restore_host(vcpu);
+	kvm_arm_vmid_clear_active();
+}
+
+static void pkvm_vcpu_put(struct kvm_vcpu *vcpu)
+{
+	kvm_call_hyp(__vgic_v3_save_aprs, &vcpu->arch.vgic_cpu.vgic_v3);
+	kvm_call_hyp_nvhe(__pkvm_vcpu_put);
+
+	/* __pkvm_vcpu_put implies a sync of the state */
+	if (!kvm_vm_is_protected(vcpu->kvm))
+		vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
+
+	nvhe_vcpu_put(vcpu);
+}
+
+void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
+{
+	vcpu->arch.vcpu_ops->vcpu_put(vcpu);
 	vcpu_clear_on_unsupported_cpu(vcpu);
 	vcpu->cpu = -1;
 }
@@ -2136,6 +2192,28 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 	}
 }
 
+static const struct kvm_vcpu_ops vhe_vcpu_ops = {
+	.vcpu_load = vhe_vcpu_load,
+	.vcpu_put = vhe_vcpu_put,
+};
+
+static const struct kvm_vcpu_ops nvhe_vcpu_ops = {
+	.vcpu_load = nvhe_vcpu_load,
+	.vcpu_put = nvhe_vcpu_put,
+};
+
+static const struct kvm_vcpu_ops pkvm_vcpu_ops = {
+	.vcpu_load = pkvm_vcpu_load,
+	.vcpu_put = pkvm_vcpu_put,
+};
+
+static const struct kvm_vcpu_ops *arm64_vcpu_ops[] = {
+	[VM_VHE] = &vhe_vcpu_ops,
+	[VM_NVHE] = &nvhe_vcpu_ops,
+	[VM_PKVM] = &pkvm_vcpu_ops,
+	[VM_PROTECTED_PKVM] = &pkvm_vcpu_ops,
+};
+
 static unsigned long nvhe_percpu_size(void)
 {
 	return (unsigned long)CHOOSE_NVHE_SYM(__per_cpu_end) -
-- 
2.43.0


