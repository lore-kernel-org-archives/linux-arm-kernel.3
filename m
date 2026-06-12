Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C33CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 06:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q37dujmcv40LywWyg6EwCNTlgdLzHM44RSz9WVrB3kg=; b=pAbD1vT6Gvay8oSXMYeh0hh9Bl
	eS/nY2xtXEuNypnSbcLW3PgIb1F/gljMePpC/EelV6qJzbFjJXgGWBY9YWc0xHG6e6R5Gvp6fSCxL
	5yxIrKVrybrtSa8mE7wBP36TppiN10X720XbnjviLoy8kGkEFd8bYhe+4nFIeeaPf43DrVmBBlX/F
	ztjQ7oLclJ2vG9TMmOzrAxkh8I8LWdK9yXk7IIrgYa+mvn1BZ9PcqslOiauU//5xHq63YjlUJa4EI
	9afLdp9eCpIKDR4kbTprS2ciWcpjfdAOSubnR/4CH0jyNAWaxf0WhMerex7DrgM8CwbfVZHkwrP5m
	pyqEDiJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrk-0000000AR5s-0cSG;
	Fri, 12 Jun 2026 06:59:44 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrh-0000000AR10-0TCE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 06:59:42 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490d3f03883so4996345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 23:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781247579; x=1781852379; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q37dujmcv40LywWyg6EwCNTlgdLzHM44RSz9WVrB3kg=;
        b=EQmhw8LlXNeYW+ZDlXDkPBjoXVY/abfHxcD+JEXMJAnrSFH6m7j2bb+uRQ8/9o0OsX
         S/q4MI/XsAS+RRx5h5rJuA/cTrfEFSyGmpphRhUfl4zrkzag1vNV4JoBk+284YdIVeIG
         sNcacu2JQsb9Txvry3LSZWjorxmm1cqJYE4x7fskx1kfeWsE44mnjBma2XFbcuuOXyis
         gyo0v+XjFkO1u2f4za/jyCrOMxT6ySzk3/Eu0HcIzF5tP3R+tE0HF1R6zs+8IBZFixbI
         mWBR0/59AuW2eTtJYvoj0up5XfAIi794RuVYaQKXB7cqifQXQanMqMI5L/dCfOuF/zjs
         lSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247579; x=1781852379;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q37dujmcv40LywWyg6EwCNTlgdLzHM44RSz9WVrB3kg=;
        b=G0h/Hr1jP/OIy3TfxDprNpF7kDcMTbBP3yR6y63qWCroR8iPijmiRf8mu5zV4cjKd1
         xsOdPl2i2hQdO1WICjXUscbTHH8i+3b+Uz4s6mp60bfBx3IDYxeltcGq96VQTg7sSV30
         HSyHXh/xO7XWCq3Db/GBowYfgJzDROspmED1IemvWG/TvNhvUGnQ+DcIEiFowe0Zrr2D
         6fwTJ/AIuxcldRVw20Z21uYMtKMOnjEoOwn80srSzy+F2xE64csDF9R6L2AvDIP1KkZg
         W0Vejokrz9YNZ8yCtbALY9jNNhyi8s0lb12ld8nKEaz+0qfOjoQnn8HVnvHgTZE6Bu7P
         Trqw==
X-Forwarded-Encrypted: i=1; AFNElJ+7nWAEg6gYAJeI8JVz2n2YbylxAnv4w3ZLE29V0XFI81bJYfeAbPwMEc4z8AbKA7PYJDFLPE89Vy3Map+tYZo6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+x2JCuAZcWUHVLVfyQjSRQZ60Wh5UtCqXh0VMjrL+/YE1xEp1
	jUmRrN2Qo1HCmqQNMilGch2hvkg3N4JMUcGQ7A5kcKNdzSem6uLGS6TjEfV6TgSsYNDZGjIBO1o
	FpA==
X-Received: from wmom24.prod.google.com ([2002:a05:600c:4618:b0:490:addd:1d76])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:2d84:b0:490:c2a3:1781
 with SMTP id 5b1f17b1804b1-490ec50a93dmr8358995e9.34.1781247578382; Thu, 11
 Jun 2026 23:59:38 -0700 (PDT)
Date: Fri, 12 Jun 2026 07:59:25 +0100
In-Reply-To: <20260612065925.755562-1-tabba@google.com>
Mime-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612065925.755562-12-tabba@google.com>
Subject: [PATCH v1 11/11] KVM: arm64: Implement lazy vCPU state sync for
 non-protected guests
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Per Larsen <perlarsen@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_235941_200761_EB420312 
X-CRM114-Status: GOOD (  28.59  )
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

pKVM copies a non-protected guest's register context between the host
and the hypervisor on every world switch, even when the host never
inspects it. Defer the copy: on entry, flush the host context into the
hyp vCPU only when the host marked it dirty (PKVM_HOST_STATE_DIRTY); on
exit, leave it in the hyp vCPU and copy it back only when the host needs
it, via a __pkvm_vcpu_sync_state hypercall on trap handling or at vcpu
put. A protected guest's context is copied as before, since lazy sync
only helps where the host is trusted to see the guest's registers.

The PC is the exception: it is copied back on every exit so the
kvm_exit tracepoint reports the guest's real exit PC rather than the
value left by the previous sync.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_asm.h   |  1 +
 arch/arm64/include/asm/kvm_host.h  |  2 +
 arch/arm64/kvm/arm.c               |  7 +++
 arch/arm64/kvm/handle_exit.c       | 22 ++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 88 ++++++++++++++++++++++++++++--
 5 files changed, 115 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 043495f7fc78..6e1135b3ded4 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -113,6 +113,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_finalize_teardown_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
+	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_sync_state,
 	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_MAX)
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index a49042bfa801..1ef660774adc 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1113,6 +1113,8 @@ struct kvm_vcpu_arch {
 /* SError pending for nested guest */
 #define NESTED_SERROR_PENDING	__vcpu_single_flag(sflags, BIT(8))
 
+/* pKVM host vcpu state is dirty, needs resync (nVHE-only) */
+#define PKVM_HOST_STATE_DIRTY	__vcpu_single_flag(iflags, BIT(4))
 
 /* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
 #define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +	\
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index c9f36932c980..a5c54e37778b 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -734,6 +734,10 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	if (is_protected_kvm_enabled()) {
 		kvm_call_hyp(__vgic_v3_save_aprs, &vcpu->arch.vgic_cpu.vgic_v3);
 		kvm_call_hyp_nvhe(__pkvm_vcpu_put);
+
+		/* __pkvm_vcpu_put implies a sync of the state */
+		if (!kvm_vm_is_protected(vcpu->kvm))
+			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
 	}
 
 	kvm_vcpu_put_debug(vcpu);
@@ -961,6 +965,9 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 		return ret;
 
 	if (is_protected_kvm_enabled()) {
+		/* Start with the vcpu in a dirty state */
+		if (!kvm_vm_is_protected(vcpu->kvm))
+			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
 		ret = pkvm_create_hyp_vm(kvm);
 		if (ret)
 			return ret;
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 54aedf93c78b..dccc3786548b 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -422,6 +422,21 @@ static int handle_trap_exceptions(struct kvm_vcpu *vcpu)
 {
 	int handled;
 
+	/*
+	 * If we run a non-protected VM when protection is enabled
+	 * system-wide, resync the state from the hypervisor and mark
+	 * it as dirty on the host side if it wasn't dirty already
+	 * (which could happen if preemption has taken place).
+	 */
+	if (is_protected_kvm_enabled() && !kvm_vm_is_protected(vcpu->kvm)) {
+		preempt_disable();
+		if (!(vcpu_get_flag(vcpu, PKVM_HOST_STATE_DIRTY))) {
+			kvm_call_hyp_nvhe(__pkvm_vcpu_sync_state);
+			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
+		}
+		preempt_enable();
+	}
+
 	/*
 	 * See ARM ARM B1.14.1: "Hyp traps on instructions
 	 * that fail their condition code check"
@@ -489,6 +504,13 @@ int handle_exit(struct kvm_vcpu *vcpu, int exception_index)
 /* For exit types that need handling before we can be preempted */
 void handle_exit_early(struct kvm_vcpu *vcpu, int exception_index)
 {
+	/*
+	 * We just exited, so the state is clean from a hypervisor
+	 * perspective.
+	 */
+	if (is_protected_kvm_enabled())
+		vcpu_clear_flag(vcpu, PKVM_HOST_STATE_DIRTY);
+
 	if (ARM_SERROR_PENDING(exception_index)) {
 		if (this_cpu_has_cap(ARM64_HAS_RAS_EXTN)) {
 			u64 disr = kvm_vcpu_get_disr(vcpu);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 23e644c24a03..02383b372258 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -139,6 +139,49 @@ static void sync_hyp_vgic_state(struct pkvm_hyp_vcpu *hyp_vcpu)
 		host_cpu_if->vgic_lr[i] = hyp_cpu_if->vgic_lr[i];
 }
 
+
+static void __copy_vcpu_state(const struct kvm_vcpu *from_vcpu,
+			      struct kvm_vcpu *to_vcpu)
+{
+	int i;
+
+	to_vcpu->arch.ctxt.regs		= from_vcpu->arch.ctxt.regs;
+	to_vcpu->arch.ctxt.spsr_abt	= from_vcpu->arch.ctxt.spsr_abt;
+	to_vcpu->arch.ctxt.spsr_und	= from_vcpu->arch.ctxt.spsr_und;
+	to_vcpu->arch.ctxt.spsr_irq	= from_vcpu->arch.ctxt.spsr_irq;
+	to_vcpu->arch.ctxt.spsr_fiq	= from_vcpu->arch.ctxt.spsr_fiq;
+	to_vcpu->arch.ctxt.fp_regs	= from_vcpu->arch.ctxt.fp_regs;
+
+	/*
+	 * Copy the sysregs, but don't mess with the timer state which
+	 * is directly handled by EL1 and is expected to be preserved.
+	 * enum vcpu_sysreg is sparse: VNCR-mapped registers take values
+	 * derived from their VNCR page offset, so the timer registers do
+	 * not form a contiguous numeric range and must be skipped by name.
+	 */
+	for (i = 1; i < NR_SYS_REGS; i++) {
+		switch (i) {
+		case CNTVOFF_EL2:
+		case CNTV_CVAL_EL0:
+		case CNTV_CTL_EL0:
+		case CNTP_CVAL_EL0:
+		case CNTP_CTL_EL0:
+			continue;
+		}
+		to_vcpu->arch.ctxt.sys_regs[i] = from_vcpu->arch.ctxt.sys_regs[i];
+	}
+}
+
+static void __sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	__copy_vcpu_state(&hyp_vcpu->vcpu, hyp_vcpu->host_vcpu);
+}
+
+static void __flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	__copy_vcpu_state(hyp_vcpu->host_vcpu, &hyp_vcpu->vcpu);
+}
+
 static void flush_debug_state(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
@@ -168,7 +211,17 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	fpsimd_sve_flush();
 	flush_debug_state(hyp_vcpu);
 
-	hyp_vcpu->vcpu.arch.ctxt	= host_vcpu->arch.ctxt;
+	/*
+	 * If we deal with a non-protected guest and the state is potentially
+	 * dirty (from a host perspective), copy the state back into the hyp
+	 * vcpu.
+	 */
+	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
+		if (vcpu_get_flag(host_vcpu, PKVM_HOST_STATE_DIRTY))
+			__flush_hyp_vcpu(hyp_vcpu);
+	} else {
+		hyp_vcpu->vcpu.arch.ctxt = host_vcpu->arch.ctxt;
+	}
 
 	hyp_vcpu->vcpu.arch.mdcr_el2	= host_vcpu->arch.mdcr_el2;
 	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
@@ -191,9 +244,11 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	fpsimd_sve_sync(&hyp_vcpu->vcpu);
 	sync_debug_state(hyp_vcpu);
 
-	host_vcpu->arch.ctxt		= hyp_vcpu->vcpu.arch.ctxt;
-
-	host_vcpu->arch.hcr_el2		= hyp_vcpu->vcpu.arch.hcr_el2;
+	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		host_vcpu->arch.ctxt = hyp_vcpu->vcpu.arch.ctxt;
+	else
+		/* Keep the PC current for the kvm_exit tracepoint (lazy ctxt sync). */
+		host_vcpu->arch.ctxt.regs.pc = hyp_vcpu->vcpu.arch.ctxt.regs.pc;
 
 	host_vcpu->arch.fault		= hyp_vcpu->vcpu.arch.fault;
 
@@ -227,8 +282,30 @@ static void handle___pkvm_vcpu_put(struct kvm_cpu_context *host_ctxt)
 {
 	struct pkvm_hyp_vcpu *hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
 
-	if (hyp_vcpu)
+	if (hyp_vcpu) {
+		struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
+
+		if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu) &&
+		    !vcpu_get_flag(host_vcpu, PKVM_HOST_STATE_DIRTY)) {
+			__sync_hyp_vcpu(hyp_vcpu);
+		}
+
 		pkvm_put_hyp_vcpu(hyp_vcpu);
+	}
+}
+
+static void handle___pkvm_vcpu_sync_state(struct kvm_cpu_context *host_ctxt)
+{
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+
+	if (!is_protected_kvm_enabled())
+		return;
+
+	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+	if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		return;
+
+	__sync_hyp_vcpu(hyp_vcpu);
 }
 
 static struct kvm_vcpu *__get_host_hyp_vcpus(struct kvm_vcpu *arg,
@@ -859,6 +936,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_finalize_teardown_vm),
 	HANDLE_FUNC(__pkvm_vcpu_load),
 	HANDLE_FUNC(__pkvm_vcpu_put),
+	HANDLE_FUNC(__pkvm_vcpu_sync_state),
 	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
 };
 
-- 
2.54.0.1136.gdb2ca164c4-goog


