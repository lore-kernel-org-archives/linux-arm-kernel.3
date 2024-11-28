Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6679D69104
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 12:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/8DKR9VojN+CM/GyAHC15iuTbMv0usRa/8w1XuoQEo=; b=Up+vdMcE8my4wAPXUbnzOlGDTh
	CoLtUXWJtnShS7ZCM9tqf9cxrEJ5+W5D4M8G8LPNgtS8c88BEGOwwF6JF+mFQB/+SyFozqEYTuUmh
	DTV1yGMT8SJvHAh9yOTiXv1mVmH9EiBNjtpY2tqzJeYRlGAzvpqZh7SK0yyHrNlQ6PVCIflLICurZ
	9+eE8W5j7nvtSLvXnPoGx2engNlG9YIMlHqzgR3FRqSfl1dnEf7CuZbCVoHwdLjG9zraUk8kFTOGc
	E2DkN1OXYE6arlO4Dgaf17GKebzd8rXGgUdNGFcT+OhU/lXJ/HV6hi9Y8t1aIkKg3YQJbuqQ+H9F9
	lmTllkmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGduK-0000000FWpF-0lHU;
	Thu, 28 Nov 2024 12:46:08 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdkB-0000000FVPB-2HQC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 12:35:40 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-434a5ca6a67so5850005e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 04:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732797338; x=1733402138; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F/8DKR9VojN+CM/GyAHC15iuTbMv0usRa/8w1XuoQEo=;
        b=yPOzjhNxjMFfFIyByBLazEeyWYdXKo1mJ2DiuctixooCOtc7hxFEcVrunBJ2sGTieU
         9fNr4Q7C3Xq8KieK1ODXfo3gfaiUBggx3VOCoiW1ORPLUH0uR00femcJ3Zo++w/cTS0r
         OOlKYHvUkkpbu6UqCe5J118tHl0xW3miPOK6UsW7mxCYqQaxDtXZhiD5h8rEIw3Pfg8T
         LPScIC6FLMXLbIEr6DOyVnQ35CrmY+AJ006ACkSD1MiZZ7LU7i9u4bYn+M/laNizIiNZ
         vguHuJw9eXPExYWjTNWojBahMxSNZ70md0hVslmZaqRJaiqQEIbwAzMrhPWoBmRV1fEE
         iT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732797338; x=1733402138;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/8DKR9VojN+CM/GyAHC15iuTbMv0usRa/8w1XuoQEo=;
        b=h92BWjI4JKQjShBU6xu8MZJXkA/cISbncGYC6Sxyzpu5j3zUCCUxXeh+bYnOZy04Ac
         dT9S1YXmdY6kgLHByp1iCtHDK2ow0N/7/LdMNribB575Z9pk1uwMYgNXUwqoT9BU30sd
         SDehy25M2o6yWa9XU3UfE1sXGhCl/FD1U19G6VyRl8sdcPDI7oX9MsbjQomrerZOT7m3
         e3Td1maUsWChYPR6B5bUImWbXSDPwhKs0qiwdyuahTLbMOp674/cp62wNpQPTOEOLx6C
         YRMvs1iPeVzLt3YikNWCjDK1Fddf/yG2YKsMZGkgylWQFNi5nluC+dLzVeYI7X2AKMoO
         nJyg==
X-Forwarded-Encrypted: i=1; AJvYcCU7V7hye4SOEcM9edxdCScijWBWkeUtvqAGw56vu8CzETDeFcM4eqvgOXd0nO6ZRaUsl2ktaxk2qvfVtuX9MPg/@lists.infradead.org
X-Gm-Message-State: AOJu0YxwtaXZdUvFOczECfb/txu4a7MoKpuwqP65eUd+yuHseFVWbDsf
	+ChWRG7xUnIABKYkDqyiSX0uy5jBcomtoPhXVcgXpUl8pQhKnR3pdHqqq7Rlvq2JHoCpy9j7oQ=
	=
X-Google-Smtp-Source: AGHT+IFPcc2J2Eu7ZPevLU68alNQpF7RWG0tNeIALz4NQ3zYV/MYUDazB4YkSCQM3ycygfMGbH5rolouQg==
X-Received: from wmpk22.prod.google.com ([2002:a05:600c:816:b0:434:a1da:32c5])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5253:b0:434:9e1d:7629
 with SMTP id 5b1f17b1804b1-434a9e07911mr55116025e9.33.1732797337899; Thu, 28
 Nov 2024 04:35:37 -0800 (PST)
Date: Thu, 28 Nov 2024 12:35:10 +0000
In-Reply-To: <20241128123515.1709777-1-tabba@google.com>
Mime-Version: 1.0
References: <20241128123515.1709777-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128123515.1709777-11-tabba@google.com>
Subject: [PATCH v3 10/15] KVM: arm64: Calculate cptr_el2 traps on activating traps
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_043539_581572_327DF086 
X-CRM114-Status: GOOD (  16.19  )
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

Similar to VHE, calculate the value of cptr_el2 from scratch on
activate traps. This removes the need to store cptr_el2 in every
vcpu structure. Moreover, some traps, such as whether the guest
owns the fp registers, need to be set on every vcpu run.

Reported-by: James Clark <james.clark@linaro.org>
Fixes: 5294afdbf45a ("KVM: arm64: Exclude FP ownership from kvm_vcpu_arch")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  1 -
 arch/arm64/kvm/arm.c              |  1 -
 arch/arm64/kvm/hyp/nvhe/pkvm.c    | 42 -------------------------
 arch/arm64/kvm/hyp/nvhe/switch.c  | 51 +++++++++++++++++++------------
 4 files changed, 32 insertions(+), 63 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 230b0638f0c2..69cb88c9ce3e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -708,7 +708,6 @@ struct kvm_vcpu_arch {
 	u64 hcr_el2;
 	u64 hcrx_el2;
 	u64 mdcr_el2;
-	u64 cptr_el2;
 
 	/* Exception Information */
 	struct kvm_vcpu_fault_info fault;
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index b295218cdc24..8a3d02cf0a7a 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1546,7 +1546,6 @@ static int kvm_arch_vcpu_ioctl_vcpu_init(struct kvm_vcpu *vcpu,
 	}
 
 	vcpu_reset_hcr(vcpu);
-	vcpu->arch.cptr_el2 = kvm_get_reset_cptr_el2(vcpu);
 
 	/*
 	 * Handle the "start in power-off" case.
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index cede527a59d4..c8ab3e59f4b1 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -83,44 +83,6 @@ static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
 	vcpu->arch.hcr_el2 = val;
 }
 
-static void pvm_init_traps_cptr(struct kvm_vcpu *vcpu)
-{
-	struct kvm *kvm = vcpu->kvm;
-	u64 val = vcpu->arch.cptr_el2;
-
-	if (!has_hvhe()) {
-		val |= CPTR_NVHE_EL2_RES1;
-		val &= ~(CPTR_NVHE_EL2_RES0);
-	}
-
-	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, AMU, IMP))
-		val |= CPTR_EL2_TAM;
-
-	/* SVE can be disabled by userspace even if supported. */
-	if (!vcpu_has_sve(vcpu)) {
-		if (has_hvhe())
-			val &= ~(CPACR_ELx_ZEN);
-		else
-			val |= CPTR_EL2_TZ;
-	}
-
-	/* No SME support in KVM. */
-	BUG_ON(kvm_has_feat(kvm, ID_AA64PFR1_EL1, SME, IMP));
-	if (has_hvhe())
-		val &= ~(CPACR_ELx_SMEN);
-	else
-		val |= CPTR_EL2_TSM;
-
-	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceVer, IMP)) {
-		if (has_hvhe())
-			val |= CPACR_EL1_TTA;
-		else
-			val |= CPTR_EL2_TTA;
-	}
-
-	vcpu->arch.cptr_el2 = val;
-}
-
 static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
@@ -191,7 +153,6 @@ static int pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
 	struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
 	int ret;
 
-	vcpu->arch.cptr_el2 = kvm_get_reset_cptr_el2(vcpu);
 	vcpu->arch.mdcr_el2 = 0;
 
 	pkvm_vcpu_reset_hcr(vcpu);
@@ -204,7 +165,6 @@ static int pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
 		return ret;
 
 	pvm_init_traps_hcr(vcpu);
-	pvm_init_traps_cptr(vcpu);
 	pvm_init_traps_mdcr(vcpu);
 
 	return 0;
@@ -644,8 +604,6 @@ int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
 		return ret;
 	}
 
-	hyp_vcpu->vcpu.arch.cptr_el2 = kvm_get_reset_cptr_el2(&hyp_vcpu->vcpu);
-
 	return 0;
 }
 
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 7786a83d0fa8..0ebf84a9f9e2 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -35,33 +35,46 @@ DEFINE_PER_CPU(unsigned long, kvm_hyp_vector);
 
 extern void kvm_nvhe_prepare_backtrace(unsigned long fp, unsigned long pc);
 
-static void __activate_traps(struct kvm_vcpu *vcpu)
+static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
 {
-	u64 val;
+	u64 val = CPTR_EL2_TAM;	/* Same bit irrespective of E2H */
 
-	___activate_traps(vcpu, vcpu->arch.hcr_el2);
-	__activate_traps_common(vcpu);
+	if (has_hvhe()) {
+		val |= CPACR_ELx_TTA;
 
-	val = vcpu->arch.cptr_el2;
-	val |= CPTR_EL2_TAM;	/* Same bit irrespective of E2H */
-	val |= has_hvhe() ? CPACR_EL1_TTA : CPTR_EL2_TTA;
-	if (cpus_have_final_cap(ARM64_SME)) {
-		if (has_hvhe())
-			val &= ~CPACR_ELx_SMEN;
-		else
-			val |= CPTR_EL2_TSM;
-	}
+		if (guest_owns_fp_regs()) {
+			val |= CPACR_ELx_FPEN;
+			if (vcpu_has_sve(vcpu))
+				val |= CPACR_ELx_ZEN;
+		}
+	} else {
+		val |= CPTR_EL2_TTA | CPTR_NVHE_EL2_RES1;
 
-	if (!guest_owns_fp_regs()) {
-		if (has_hvhe())
-			val &= ~(CPACR_ELx_FPEN | CPACR_ELx_ZEN);
-		else
-			val |= CPTR_EL2_TFP | CPTR_EL2_TZ;
+		/*
+		 * Always trap SME since it's not supported in KVM.
+		 * TSM is RES1 if SME isn't implemented.
+		 */
+		val |= CPTR_EL2_TSM;
 
-		__activate_traps_fpsimd32(vcpu);
+		if (!vcpu_has_sve(vcpu) || !guest_owns_fp_regs())
+			val |= CPTR_EL2_TZ;
+
+		if (!guest_owns_fp_regs())
+			val |= CPTR_EL2_TFP;
 	}
 
+	if (!guest_owns_fp_regs())
+		__activate_traps_fpsimd32(vcpu);
+
 	kvm_write_cptr_el2(val);
+}
+
+static void __activate_traps(struct kvm_vcpu *vcpu)
+{
+	___activate_traps(vcpu, vcpu->arch.hcr_el2);
+	__activate_traps_common(vcpu);
+	__activate_cptr_traps(vcpu);
+
 	write_sysreg(__this_cpu_read(kvm_hyp_vector), vbar_el2);
 
 	if (cpus_have_final_cap(ARM64_WORKAROUND_SPECULATIVE_AT)) {
-- 
2.47.0.338.g60cca15819-goog


