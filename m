Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84C9E69E9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mj964gODKbD1zmug2lj/VjWmQYe+AokCkWiMCuawBn0=; b=4joX4wZQa81nfLL1jtQ5suEoPs
	SPyXaO2vTE4RBybjaCYby/SYYCr8/G9UX6XHmXpf4xS4bc+F4rjFBJL9d9ocHrGHWar3MkxxpszyO
	PQuy612zeRkhKmGyuO9Yixut+VRmg+G0mie2V8UsMvFRR+BsKzA09pRU7oYfCAiQa522tfIeOl8Ij
	FKrsXfOOvJp0YFFhZr4qbep5zC0gUtAmNa4raZYF/NjF7iVZ0omunyzq86EGA10Q+byjccBWoPXWG
	FoL6lGCfVu6A+dmrhA84OoFfyJB+Xqiz+fY+/p35cDaw752IYa0dKPLBkkOhJclYDuOzNJXetTX1z
	mNGwxL9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQRX-000000098K4-3dpe;
	Tue, 03 Dec 2024 10:47:47 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQI2-000000095eP-0x4J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:37:59 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5d035c8f3afso3481567a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733222276; x=1733827076; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mj964gODKbD1zmug2lj/VjWmQYe+AokCkWiMCuawBn0=;
        b=fYbE2Jeck6f9v9LVcP0r8r/Vb0KfIW3e3J6e1prYI0ryRvxVqZMlIMpwubbcsOAcWZ
         JIlO4fkAb2IEFlno2RBtY6f3CxhYx1OPuw2ihWwCrIrdjgqYJJhIHRqJn5O7n4W0eV7L
         n2q+dVHRvVzOeiwQZKo+OyGK8QryJ9UOQodwNIgypmdAIHONImXzNDr1TKSU232rNJuq
         F6MHWTlPrkxdG6lxG+PjtP6zkCAeI/lYCkCte5UxPZuwqJVIm0YX1kk7b3oUEeRGAOiP
         vN5ji/JVSoHYBcz22zRr69DnBwUHLzWswxX6XTlB0Hc9HLOu1rAK//c06UB00pkYKNrx
         tfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222276; x=1733827076;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mj964gODKbD1zmug2lj/VjWmQYe+AokCkWiMCuawBn0=;
        b=U28n77QVS61Ee4DrlI9HcNNDHRpOLWcIG+/agab0JzpiaOgda4qbP5dCA+1gT681YJ
         Xt3vIK08vTRcbjxMWJdpduHbDlA38pLgwAvwe8JBNnVkB27NMMsRywp+sUN2NcBwH3sr
         4XjQh4Gx4piT1TgQF2EOD1PqQx1TUigNTNj3bs3jHAcSHAlOCWQpdRU1f4JVTAe45hxh
         kIDEfbFnmQ8Q8BiHbMjxh4YP6g9XkA6DBcUNmvarxNCiiG1Mq6wLdnRJDNNK3j54VIOa
         Rkt1xjDN5+FOV1URL+c3KzljrRgERub+aE4pyJKH7L/2jfr+ioiihB0/K63+zEoUeNca
         MuZg==
X-Forwarded-Encrypted: i=1; AJvYcCUtSnRhqXZY0a8CYetaVqSvjvUCA67qi0TfUmetucuQsE8LWf7MrKL3FPRBmRVTYpVuoX+6KGDujT8HW1E6572d@lists.infradead.org
X-Gm-Message-State: AOJu0YydZkbQXdgYVvi9XYlLt3Go/dDOHawlHoasJKIyUS346Fxh03e9
	LZwkoHpNcVj5AW9C7p1W8bt8s5Y4PO7R+FXPCYnoZQpGEexIzW77Cw7cyH/0clmYjNV09/UU+nP
	IEjgQiw==
X-Google-Smtp-Source: AGHT+IHECbRMhTPqXhWhH0wYQw1eGtqOW5b56Fqo9wtWWLwVEFicyz6TFa+3iZqVf11rifTnBDtDiet5fpCW
X-Received: from edsd12.prod.google.com ([2002:aa7:d5cc:0:b0:5cf:dcd3:49a1])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:27c9:b0:5d0:b925:a8a
 with SMTP id 4fb4d7f45d1cf-5d10cb5b909mr1775921a12.16.1733222276629; Tue, 03
 Dec 2024 02:37:56 -0800 (PST)
Date: Tue,  3 Dec 2024 10:37:26 +0000
In-Reply-To: <20241203103735.2267589-1-qperret@google.com>
Mime-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203103735.2267589-10-qperret@google.com>
Subject: [PATCH v2 09/18] KVM: arm64: Introduce __pkvm_vcpu_{load,put}()
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_023758_271326_634F8D25 
X-CRM114-Status: GOOD (  20.97  )
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

From: Marc Zyngier <maz@kernel.org>

Rather than look-up the hyp vCPU on every run hypercall at EL2,
introduce a per-CPU 'loaded_hyp_vcpu' tracking variable which is updated
by a pair of load/put hypercalls called directly from
kvm_arch_vcpu_{load,put}() when pKVM is enabled.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_asm.h       |  2 ++
 arch/arm64/kvm/arm.c                   | 14 ++++++++
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  7 ++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c     | 47 ++++++++++++++++++++------
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 29 ++++++++++++++++
 arch/arm64/kvm/vgic/vgic-v3.c          |  6 ++--
 6 files changed, 93 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index ca2590344313..89c0fac69551 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -79,6 +79,8 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_init_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_init_vcpu,
 	__KVM_HOST_SMCCC_FUNC___pkvm_teardown_vm,
+	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
+	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
 };
 
 #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index a102c3aebdbc..55cc62b2f469 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -619,12 +619,26 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	kvm_arch_vcpu_load_debug_state_flags(vcpu);
 
+	if (is_protected_kvm_enabled()) {
+		kvm_call_hyp_nvhe(__pkvm_vcpu_load,
+				  vcpu->kvm->arch.pkvm.handle,
+				  vcpu->vcpu_idx, vcpu->arch.hcr_el2);
+		kvm_call_hyp(__vgic_v3_restore_vmcr_aprs,
+			     &vcpu->arch.vgic_cpu.vgic_v3);
+	}
+
 	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
 		vcpu_set_on_unsupported_cpu(vcpu);
 }
 
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 {
+	if (is_protected_kvm_enabled()) {
+		kvm_call_hyp(__vgic_v3_save_vmcr_aprs,
+			     &vcpu->arch.vgic_cpu.vgic_v3);
+		kvm_call_hyp_nvhe(__pkvm_vcpu_put);
+	}
+
 	kvm_arch_vcpu_put_debug_state_flags(vcpu);
 	kvm_arch_vcpu_put_fp(vcpu);
 	if (has_vhe())
diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index f361d8b91930..be52c5b15e21 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -20,6 +20,12 @@ struct pkvm_hyp_vcpu {
 
 	/* Backpointer to the host's (untrusted) vCPU instance. */
 	struct kvm_vcpu *host_vcpu;
+
+	/*
+	 * If this hyp vCPU is loaded, then this is a backpointer to the
+	 * per-cpu pointer tracking us. Otherwise, NULL if not loaded.
+	 */
+	struct pkvm_hyp_vcpu **loaded_hyp_vcpu;
 };
 
 /*
@@ -69,6 +75,7 @@ int __pkvm_teardown_vm(pkvm_handle_t handle);
 struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 					 unsigned int vcpu_idx);
 void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu);
+struct pkvm_hyp_vcpu *pkvm_get_loaded_hyp_vcpu(void);
 
 struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle);
 void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 6aa0b13d86e5..95d78db315b3 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -141,16 +141,46 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 		host_cpu_if->vgic_lr[i] = hyp_cpu_if->vgic_lr[i];
 }
 
+static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
+	DECLARE_REG(unsigned int, vcpu_idx, host_ctxt, 2);
+	DECLARE_REG(u64, hcr_el2, host_ctxt, 3);
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+
+	if (!is_protected_kvm_enabled())
+		return;
+
+	hyp_vcpu = pkvm_load_hyp_vcpu(handle, vcpu_idx);
+	if (!hyp_vcpu)
+		return;
+
+	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
+		/* Propagate WFx trapping flags */
+		hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWE | HCR_TWI);
+		hyp_vcpu->vcpu.arch.hcr_el2 |= hcr_el2 & (HCR_TWE | HCR_TWI);
+	}
+}
+
+static void handle___pkvm_vcpu_put(struct kvm_cpu_context *host_ctxt)
+{
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+
+	if (!is_protected_kvm_enabled())
+		return;
+
+	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+	if (hyp_vcpu)
+		pkvm_put_hyp_vcpu(hyp_vcpu);
+}
+
 static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, host_vcpu, host_ctxt, 1);
 	int ret;
 
-	host_vcpu = kern_hyp_va(host_vcpu);
-
 	if (unlikely(is_protected_kvm_enabled())) {
-		struct pkvm_hyp_vcpu *hyp_vcpu;
-		struct kvm *host_kvm;
+		struct pkvm_hyp_vcpu *hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
 
 		/*
 		 * KVM (and pKVM) doesn't support SME guests for now, and
@@ -163,9 +193,6 @@ static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
 			goto out;
 		}
 
-		host_kvm = kern_hyp_va(host_vcpu->kvm);
-		hyp_vcpu = pkvm_load_hyp_vcpu(host_kvm->arch.pkvm.handle,
-					      host_vcpu->vcpu_idx);
 		if (!hyp_vcpu) {
 			ret = -EINVAL;
 			goto out;
@@ -176,12 +203,10 @@ static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
 		ret = __kvm_vcpu_run(&hyp_vcpu->vcpu);
 
 		sync_hyp_vcpu(hyp_vcpu);
-		pkvm_put_hyp_vcpu(hyp_vcpu);
 	} else {
 		/* The host is fully trusted, run its vCPU directly. */
-		ret = __kvm_vcpu_run(host_vcpu);
+		ret = __kvm_vcpu_run(kern_hyp_va(host_vcpu));
 	}
-
 out:
 	cpu_reg(host_ctxt, 1) =  ret;
 }
@@ -409,6 +434,8 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_init_vm),
 	HANDLE_FUNC(__pkvm_init_vcpu),
 	HANDLE_FUNC(__pkvm_teardown_vm),
+	HANDLE_FUNC(__pkvm_vcpu_load),
+	HANDLE_FUNC(__pkvm_vcpu_put),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 4db88bedf8d5..d5c23449a64c 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -23,6 +23,12 @@ unsigned int kvm_arm_vmid_bits;
 
 unsigned int kvm_host_sve_max_vl;
 
+/*
+ * The currently loaded hyp vCPU for each physical CPU. Used only when
+ * protected KVM is enabled, but for both protected and non-protected VMs.
+ */
+static DEFINE_PER_CPU(struct pkvm_hyp_vcpu *, loaded_hyp_vcpu);
+
 /*
  * Set trap register values based on features in ID_AA64PFR0.
  */
@@ -306,15 +312,30 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 	struct pkvm_hyp_vcpu *hyp_vcpu = NULL;
 	struct pkvm_hyp_vm *hyp_vm;
 
+	/* Cannot load a new vcpu without putting the old one first. */
+	if (__this_cpu_read(loaded_hyp_vcpu))
+		return NULL;
+
 	hyp_spin_lock(&vm_table_lock);
 	hyp_vm = get_vm_by_handle(handle);
 	if (!hyp_vm || hyp_vm->nr_vcpus <= vcpu_idx)
 		goto unlock;
 
 	hyp_vcpu = hyp_vm->vcpus[vcpu_idx];
+
+	/* Ensure vcpu isn't loaded on more than one cpu simultaneously. */
+	if (unlikely(hyp_vcpu->loaded_hyp_vcpu)) {
+		hyp_vcpu = NULL;
+		goto unlock;
+	}
+
+	hyp_vcpu->loaded_hyp_vcpu = this_cpu_ptr(&loaded_hyp_vcpu);
 	hyp_page_ref_inc(hyp_virt_to_page(hyp_vm));
 unlock:
 	hyp_spin_unlock(&vm_table_lock);
+
+	if (hyp_vcpu)
+		__this_cpu_write(loaded_hyp_vcpu, hyp_vcpu);
 	return hyp_vcpu;
 }
 
@@ -323,10 +344,18 @@ void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	struct pkvm_hyp_vm *hyp_vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
 
 	hyp_spin_lock(&vm_table_lock);
+	hyp_vcpu->loaded_hyp_vcpu = NULL;
+	__this_cpu_write(loaded_hyp_vcpu, NULL);
 	hyp_page_ref_dec(hyp_virt_to_page(hyp_vm));
 	hyp_spin_unlock(&vm_table_lock);
 }
 
+struct pkvm_hyp_vcpu *pkvm_get_loaded_hyp_vcpu(void)
+{
+	return __this_cpu_read(loaded_hyp_vcpu);
+
+}
+
 struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
 {
 	struct pkvm_hyp_vm *hyp_vm;
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index f267bc2486a1..c2ef41fff079 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -734,7 +734,8 @@ void vgic_v3_load(struct kvm_vcpu *vcpu)
 {
 	struct vgic_v3_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v3;
 
-	kvm_call_hyp(__vgic_v3_restore_vmcr_aprs, cpu_if);
+	if (likely(!is_protected_kvm_enabled()))
+		kvm_call_hyp(__vgic_v3_restore_vmcr_aprs, cpu_if);
 
 	if (has_vhe())
 		__vgic_v3_activate_traps(cpu_if);
@@ -746,7 +747,8 @@ void vgic_v3_put(struct kvm_vcpu *vcpu)
 {
 	struct vgic_v3_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v3;
 
-	kvm_call_hyp(__vgic_v3_save_vmcr_aprs, cpu_if);
+	if (likely(!is_protected_kvm_enabled()))
+		kvm_call_hyp(__vgic_v3_save_vmcr_aprs, cpu_if);
 	WARN_ON(vgic_v4_put(vcpu));
 
 	if (has_vhe())
-- 
2.47.0.338.g60cca15819-goog


