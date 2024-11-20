Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAC7D63926
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 10:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHY9Vu/v9jt8ddodiBMVqHtuBE3iJsXdI0KJMy4Gh7I=; b=V1huEWtMkt329nWi5btYxY67/b
	h+GszNgDQQaVury/ecqklJiIaZ5z2KUv7P7rnLq0xiiKYR+h3hww+cm8HnKI1WubqfOcbzM91jw3E
	gE4358Ny9Kjh2/sSLyzRFoje1SSZfTtu9qRca9k0Uiulu1XipETnT5X7i56Ot4iZHnXQrLudtjYOW
	A5cdhh4JEQj0wVP1uK6kvlcP2GE6reiWQAVJz25UQFLSV8KGn62d+WN2XHNnZr6hIqgx7Bvz7gM6V
	ja7hX0f4UxjdC2821dqzG/PgsxqxkZDYKpuGKKkbBS1lV2Zanes4cTNiKjVh3bvMNPMm+27Ivbtht
	6yoZyk3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiQ1-0000000F7ZG-48Rk;
	Wed, 20 Nov 2024 10:58:45 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiKc-0000000F6Rw-2mVI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 10:53:11 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-382450d158fso2024527f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 02:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732099988; x=1732704788; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QHY9Vu/v9jt8ddodiBMVqHtuBE3iJsXdI0KJMy4Gh7I=;
        b=JjnBeCNBfS7wJBdM0TN//ExRDtMv8z7EnfXgQwMj+9nNCwgo7uHcwm+VnECxz48NeN
         WL96HOmi0DZKVWtIEEZcRwAGoNkseUu3OqZbVb5J1EmCsfF5iVI6noeio7HfCllnuy8U
         WBkE2iqrfudhMF2loRS9njPb98TpKqVGlC60U6X61pv/GURtE2lPb1slma4/Zy9SeIVR
         /n+51YDzbaV5YkzRVkPs87TgFJEHKr3BSuWVXBH+0pX+FWo8CIpXCQMLoJsVVhgtlV7Y
         7B4ahCpXqDmr183Ia80PsLNEcGFv4bEkZQgk4uKgltkpRpDzM58YZ24fhFA/UFOkvwV/
         TPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732099988; x=1732704788;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QHY9Vu/v9jt8ddodiBMVqHtuBE3iJsXdI0KJMy4Gh7I=;
        b=podgdHKz6W+ScGFqfwZWpjdMaXmFPqNLKEg2kmyN5eWOKCE+8xb1HpLQVNrASNKDgQ
         /vX4COHb69/hSdl5fLJnPgr5lKJApYtrhbMdzx4+p9ft7Ue1yxtiL0Vi1uf69IWGf4fG
         G1LXkTTthHN1ET/sKHVgrjpLUh6chS6E53RH6BcdAHD5u1VQjEmNzHbgiG9ncZCxfy5b
         UpFJgYgz+Xw26HULfSaO2QvwyyJJKIstV+BbItCM+l/njJ7IdgvNZ+QIex4GkRHvYtNz
         /klK/rr6zluB6VpVqTxJrrl+LtKCW1mClxmOOYpKI+PI3Nmr7z9n2fkJzQWjtO/xrGbf
         1j/A==
X-Forwarded-Encrypted: i=1; AJvYcCVWfSAu0GkIhG1N14gWqsvVjtZsA/O68zWmafhO3TlYUvZId4ww1leMsAGfd4y6dQCUQYf8X8dl15LteuDCECKN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrt06/DPrSytnA3VIQFWJXFHDr183cMRLD7JHMaLGwHHba6GRF
	rfZ4LUUD85j2fUk/b568zvb6KttoypQIBCPO37ctLdF+DTGSE6hb7mn5x/Lt0BXXaUO6REnDcQ=
	=
X-Google-Smtp-Source: AGHT+IEMk0vO8gq+mc70KsQSZzwvEYnnws8eHzciVbWjEdDjZE/bNjDj1WTwx+dXuNEtkZhkolH+TswqhQ==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a5d:4dcb:0:b0:37d:5299:c401 with SMTP id
 ffacd0b85a97d-38254b24bd4mr612f8f.7.1732099988221; Wed, 20 Nov 2024 02:53:08
 -0800 (PST)
Date: Wed, 20 Nov 2024 10:52:47 +0000
In-Reply-To: <20241120105254.2842020-1-tabba@google.com>
Mime-Version: 1.0
References: <20241120105254.2842020-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241120105254.2842020-6-tabba@google.com>
Subject: [PATCH v1 05/12] KVM: arm64: Initialize feature id registers for
 protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_025310_717267_94008ABA 
X-CRM114-Status: GOOD (  18.96  )
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
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            | 55 ++++++++++++++++++-
 3 files changed, 57 insertions(+), 3 deletions(-)

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
index 59fb2f056177..7e93850a426f 100644
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
+	if (reg >= sys_reg(3, 0, 0, 4, 0) && reg <= sys_reg(3, 0, 0, 7, 7))
+		return kvm->arch.id_regs[IDREG_IDX(reg)];
+
+	return 0;
 }
 
 /* Handler to RAZ/WI sysregs */
@@ -448,6 +462,41 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 	/* Performance Monitoring Registers are restricted. */
 };
 
+/*
+ * Initializes feature registers for protected vms.
+ */
+void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu)
+{
+	/* List of feature registers to reset for protected VMs. */
+	const u32 pvm_feat_id_regs[] = {
+		SYS_ID_AA64PFR0_EL1,
+		SYS_ID_AA64PFR1_EL1,
+		SYS_ID_AA64ISAR0_EL1,
+		SYS_ID_AA64ISAR1_EL1,
+		SYS_ID_AA64ISAR2_EL1,
+		SYS_ID_AA64ZFR0_EL1,
+		SYS_ID_AA64MMFR0_EL1,
+		SYS_ID_AA64MMFR1_EL1,
+		SYS_ID_AA64MMFR2_EL1,
+		SYS_ID_AA64MMFR4_EL1,
+		SYS_ID_AA64DFR0_EL1,
+	};
+	struct kvm *kvm = vcpu->kvm;
+	unsigned long i;
+
+	if (WARN_ON_ONCE(test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags)))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(pvm_feat_id_regs); i++) {
+		struct kvm_arch *ka = &kvm->arch;
+		u32 reg = pvm_feat_id_regs[i];
+
+		ka->id_regs[IDREG_IDX(reg)] = pvm_calc_id_reg(vcpu, reg);
+	}
+
+	set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags);
+}
+
 /*
  * Checks that the sysreg table is unique and in-order.
  *
-- 
2.47.0.338.g60cca15819-goog


