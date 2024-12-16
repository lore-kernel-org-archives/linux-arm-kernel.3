Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D7BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 10:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLNB90HFwi4SHqmi2KVXCppej9by7Sd91qe87vHnQQY=; b=O3BvGdQnrC17m3nEct40dbTrDt
	9iHMZxENlJ92afAKllHmrk5FYNGE87jMKRkmE5Maaxd8PgbqxqdsOdhw1yGu3af8HBQqomQn9+ztK
	EaCH1V9d8Eg4/Ly8k8GcQT3W5OSOJqqdVXlT/0xsMINGAAuXsTok8CIn7ENJW46ZF8bYzrRx02x59
	tazAZfjVo1gyRznfoGPcVi86EFekKoy8XCBTk97K78joYFQKro4XyCyuwtrUcS+DhPMWw6kREOK8G
	5EReJR9ObZ08MelPxb0ZBHSWmECyjGmque8ZxdeGlgyN0SCBHdmZ6vat2d8Qmed1syJcaM8n0+hSl
	uul/2IVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8oD-00000009l23-1loM;
	Mon, 16 Dec 2024 10:58:41 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8gz-00000009jy7-0xND
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:51:14 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43626224274so15454445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 02:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734346271; x=1734951071; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RLNB90HFwi4SHqmi2KVXCppej9by7Sd91qe87vHnQQY=;
        b=frJSgEJdP0c3mTVOBR4n1yvTl/V36xaRNK4VVz0b3KZLbcSi51QzfD6Zlo6AUhIUWt
         PB/uib97nEGEjjQTaqGVO1W2RK8OgnVOkWDDQJUoDmnVOSNq7oS7jpwLwLDVUA+wrcWE
         muqp9HmUreUF9KkQxufwSk4TPX7wQfN5s07/DGaQy+SEvmvfEBmuMoGktYk6YAvtHkuf
         QQcv6Tc0BU3fwp9o9mj5PqJk6ktfhwQrdWIgQ3YwWf2HXblEutsSWaOoh//5x8LXC2wA
         U/IAfNnNP4iHdcZX1mdwWk7cegK6S+IvEDjBnJWRCuCqBtXokR5JiUBBmVzxCen8U2p1
         tHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346271; x=1734951071;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RLNB90HFwi4SHqmi2KVXCppej9by7Sd91qe87vHnQQY=;
        b=gNwi18ZuXbzoVMKkaW45lJyjiOOZpuIQZMVICHdZyT622KYCIVd81U62HLTCsi0r/6
         rWekVdt8Evm9aOJWLrNwjpyNAKEO64aK7bkMaGA6JMGRl2GbaqaEXUWdn+uFGx8Z+ybW
         fUgBdE4YHRUWOMseuq3orJoFyOsTJ2fMCyXnnGd/svSt6L9/R3WL1SzSITqj+95AMlWB
         5xYFFj+Xv3m2ogxoUPrNeRTxvAuSl3kZxxmtUgS0F7yw/VSG72HpQYb0NicQsw3s8UBL
         rccgZ4rG+fMe8BSHCUudlREnKMx8hJtkOETBP+hAoNMV9ED4Xmdfopu+KqOs+3c79D/u
         h29A==
X-Forwarded-Encrypted: i=1; AJvYcCWtuzFPcBufCNxw503DqOhRg2LuLfOedvX7fJV2juxfSqniYvy76GUaKRNgPq2qi3GZiGtRILDVQUAAg6RxkAV5@lists.infradead.org
X-Gm-Message-State: AOJu0YwmLHiHmMwDLEL1uTlF5TA7a5LvtwSqDqE2e2sbgHZ61ziZHkTE
	ymvyw4Rbxz6fBzu4M1+Y81AU65v8UOBsaLfaGIfuBPfacNub3mP7C/Qx6jk3kGWUd4mgFBFPJg=
	=
X-Google-Smtp-Source: AGHT+IG/KnLxBYGmhyms4gK4RJktxiZAprOlwrWk3fRnjJVEGCGWz+NgSli5dOU7sAR+DbTv+TAWqw5bCQ==
X-Received: from wmol7.prod.google.com ([2002:a05:600c:47c7:b0:434:a471:130f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5254:b0:434:a902:97cd
 with SMTP id 5b1f17b1804b1-4362aa3f7damr97104285e9.12.1734346271261; Mon, 16
 Dec 2024 02:51:11 -0800 (PST)
Date: Mon, 16 Dec 2024 10:50:46 +0000
In-Reply-To: <20241216105057.579031-1-tabba@google.com>
Mime-Version: 1.0
References: <20241216105057.579031-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216105057.579031-7-tabba@google.com>
Subject: [PATCH v5 06/17] KVM: arm64: Initialize feature id registers for
 protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_025113_266229_54FD55F7 
X-CRM114-Status: GOOD (  18.83  )
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

The hypervisor maintains the state of protected VMs. Initialize
the values for feature ID registers for protected VMs, to be used
when setting traps and when advertising features to protected
VMs.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 .../arm64/kvm/hyp/include/nvhe/fixed_config.h |  1 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  2 +
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 10 +++--
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            | 44 +++++++++++++++++--
 4 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h b/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h
index d1e59b88ff66..69e26d1a0ebe 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h
@@ -201,6 +201,7 @@
 u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id);
 bool kvm_handle_pvm_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code);
 bool kvm_handle_pvm_restricted(struct kvm_vcpu *vcpu, u64 *exit_code);
+void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
 int kvm_check_pvm_sysreg_table(void);
 
 #endif /* __ARM64_KVM_FIXED_CONFIG_H__ */
diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index 24a9a8330d19..698bc20ab80b 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -47,6 +47,8 @@ struct pkvm_hyp_vm {
 	struct pkvm_hyp_vcpu *vcpus[];
 };
 
+extern hyp_spinlock_t vm_table_lock;
+
 static inline struct pkvm_hyp_vm *
 pkvm_hyp_vcpu_to_hyp_vm(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 59ff6aac514c..3014f3295d81 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -257,10 +257,10 @@ static pkvm_handle_t idx_to_vm_handle(unsigned int idx)
 
 /*
  * Spinlock for protecting state related to the VM table. Protects writes
- * to 'vm_table' and 'nr_table_entries' as well as reads and writes to
- * 'last_hyp_vcpu_lookup'.
+ * to 'vm_table', 'nr_table_entries', and other per-vm state on initialization.
+ * Also protects reads and writes to 'last_hyp_vcpu_lookup'.
  */
-static DEFINE_HYP_SPINLOCK(vm_table_lock);
+DEFINE_HYP_SPINLOCK(vm_table_lock);
 
 /*
  * The table of VM entries for protected VMs in hyp.
@@ -381,6 +381,7 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
 	hyp_vm->kvm.created_vcpus = nr_vcpus;
 	hyp_vm->kvm.arch.mmu.vtcr = host_mmu.arch.mmu.vtcr;
 	hyp_vm->kvm.arch.pkvm.enabled = READ_ONCE(host_kvm->arch.pkvm.enabled);
+	hyp_vm->kvm.arch.flags = 0;
 	pkvm_init_features_from_host(hyp_vm, host_kvm);
 }
 
@@ -419,6 +420,9 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
 	hyp_vcpu->vcpu.arch.cflags = READ_ONCE(host_vcpu->arch.cflags);
 	hyp_vcpu->vcpu.arch.mp_state.mp_state = KVM_MP_STATE_STOPPED;
 
+	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		kvm_init_pvm_id_regs(&hyp_vcpu->vcpu);
+
 	ret = pkvm_vcpu_init_traps(hyp_vcpu);
 	if (ret)
 		goto done;
diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 59fb2f056177..453a130b7a5d 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -204,8 +204,7 @@ static u64 get_pvm_id_aa64mmfr2(const struct kvm_vcpu *vcpu)
 	return id_aa64mmfr2_el1_sys_val & PVM_ID_AA64MMFR2_ALLOW;
 }
 
-/* Read a sanitized cpufeature ID register by its encoding */
-u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id)
+static u64 pvm_calc_id_reg(const struct kvm_vcpu *vcpu, u32 id)
 {
 	switch (id) {
 	case SYS_ID_AA64PFR0_EL1:
@@ -240,10 +239,25 @@ u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id)
 	}
 }
 
+/* Read a sanitized cpufeature ID register by its encoding */
+u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id)
+{
+	return pvm_calc_id_reg(vcpu, id);
+}
+
 static u64 read_id_reg(const struct kvm_vcpu *vcpu,
 		       struct sys_reg_desc const *r)
 {
-	return pvm_read_id_reg(vcpu, reg_to_encoding(r));
+	struct kvm *kvm = vcpu->kvm;
+	u32 reg = reg_to_encoding(r);
+
+	if (WARN_ON_ONCE(!test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags)))
+		return 0;
+
+	if (reg >= sys_reg(3, 0, 0, 1, 0) && reg <= sys_reg(3, 0, 0, 7, 7))
+		return kvm->arch.id_regs[IDREG_IDX(reg)];
+
+	return 0;
 }
 
 /* Handler to RAZ/WI sysregs */
@@ -448,6 +462,30 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 	/* Performance Monitoring Registers are restricted. */
 };
 
+/*
+ * Initializes feature registers for protected vms.
+ */
+void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_arch *ka = &kvm->arch;
+	u32 r;
+
+	hyp_assert_lock_held(&vm_table_lock);
+
+	if (test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags))
+		return;
+
+	/*
+	 * Initialize only AArch64 id registers since AArch32 isn't supported
+	 * for protected VMs.
+	 */
+	for (r = sys_reg(3, 0, 0, 4, 0); r <= sys_reg(3, 0, 0, 7, 7); r += sys_reg(0, 0, 0, 0, 1))
+		ka->id_regs[IDREG_IDX(r)] = pvm_calc_id_reg(vcpu, r);
+
+	set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags);
+}
+
 /*
  * Checks that the sysreg table is unique and in-order.
  *
-- 
2.47.1.613.gc27f4b7a9f-goog


