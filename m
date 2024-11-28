Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D891D69105
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 12:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57d11+Vl+NAgbTWF6Laovcj658EA1KvcaSswzHFN5Sc=; b=Oo11+bRBCPBeY0APYVpvoFzOz9
	w+Kq7p4+CLLGPI8Tumwnp6ylV1uFeinyXZo/sJ475HNEafOfQtM4KhKXn2SJ4j81Lz6XFREjEcpQp
	zPWJWckptnDWdIURfvgai6ZFihZIOciVwmwAtvKrmLZdIxP5/4Woeba5a+fMMNbKkpvXcFtVPBFi7
	HxOnqThgTzd7LPtgVX5f3pJM2qXyEQAlqklPqKoty096eEMV1QePa2pX7QrOLh6A/zITBtoGE7zLZ
	I/GTCrHpRzo549Y4r7g3VLnsInCyqTJEhINNL214JJTOlvQBDXKmQHlaUxrANW4Om0mF9jzX+JV9u
	wLBUn1dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdpa-0000000FWCM-0gFT;
	Thu, 28 Nov 2024 12:41:14 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdk1-0000000FVMV-0iMx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 12:35:30 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-382428c257eso410352f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 04:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732797327; x=1733402127; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=57d11+Vl+NAgbTWF6Laovcj658EA1KvcaSswzHFN5Sc=;
        b=tLftpAIq4oEjq6d57vpIzk7liF+zYuYfKF3C9OwPZ/OyO4R1xm0Ii80+6y+eJV1cGt
         mpa4xAZu4cHygEcLxUCrog90pBLrDyAURjn3KfitFA0p5WfInAtYHDPq7xmP+FGS7RF3
         itJJe7WYY7ajgncJ/fsbKF4bq1BuQ8s38ITDDSSVqiKpvFIpkb4DyeJt3azQOMhOPzrg
         aAEd1U3mdu5G5V+zdG4rXBM1xswq77PSm98Pal6p1BaykG7eHWSqc8wnsHO5HbI1/zBJ
         mZOLyxthBZMjQg9ZueGgUjkkMkTGwdIVkSp50Kj7SD7jAcM/KdHIUVFz3g00wxBjbKp+
         KseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732797327; x=1733402127;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=57d11+Vl+NAgbTWF6Laovcj658EA1KvcaSswzHFN5Sc=;
        b=dTfaHyiwNRf12j2lt/PUUEhsXgMuXP6BwO4jdpCvtLustiOSBb60Ceh9NimtHN6IRz
         fNYR0kA1Z4Sx+urpXmaOQAlGGmuPt0kXuOxyXAizK1PHXp2dvQ/YPqnhZb0Fmw4miVQK
         O8ZbbLO1fWx2XB+Yz6Sn0CoYjMOdf9VqJ1y/mxEsk8WQTgxiUiJI84X3O+CIV8DKj2TY
         icqnui6k00aXxc1FxfPw/4pMkhLz6RvKj4ISnLsrNXKCXBgmcFnAHzP5+g0YUr68Q9lK
         LpSlHkT6g8obH+S01+7NvNXz9niC5zMTwsVsHQRW0rrdpZWJPjsptaNrlyd5fsn0AHz9
         WkLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrCgDCaiZ+lAx9kxYiDJqKnvPEDWi0rA5Bv18GZnW4o3qdg6PBXLoBQChnnCarlIzOd/a611L5TkaJyIkQM3Vg@lists.infradead.org
X-Gm-Message-State: AOJu0YxSkyqVByPcAZzQnmOLqMG2FGwSObSqiiAASxMafyj/tVTCTwqu
	v19GBoOo6/+YpljVgGkFWJd56xba7pIHC3SZYgRJpsw6vmZMBogFf4/01aw1aNJONAnA9zPemw=
	=
X-Google-Smtp-Source: AGHT+IEr1xoBQ+AMfwaUDJbCQnvJc4u7kobWRqIBNJlAJlmGhT7c9r52bu+D34t0Rhg1fv/1GFQbpCtGCA==
X-Received: from wmsn30.prod.google.com ([2002:a05:600c:3b9e:b0:434:9ed7:8b97])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c07:b0:434:a4fe:cd71
 with SMTP id 5b1f17b1804b1-434a9dc50f1mr64327545e9.12.1732797327270; Thu, 28
 Nov 2024 04:35:27 -0800 (PST)
Date: Thu, 28 Nov 2024 12:35:05 +0000
In-Reply-To: <20241128123515.1709777-1-tabba@google.com>
Mime-Version: 1.0
References: <20241128123515.1709777-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128123515.1709777-6-tabba@google.com>
Subject: [PATCH v3 05/15] KVM: arm64: Initialize feature id registers for
 protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_043529_206690_B336DC6B 
X-CRM114-Status: GOOD (  16.50  )
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
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  4 ++
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            | 42 +++++++++++++++++--
 3 files changed, 44 insertions(+), 3 deletions(-)

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
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 59ff6aac514c..4ef03294b2b4 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
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
index 59fb2f056177..1261da6a2861 100644
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
@@ -448,6 +462,28 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
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
2.47.0.338.g60cca15819-goog


