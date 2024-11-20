Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835F7D63926
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 11:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JquR2uEtGIuvh8lVzjpHJvjKLaOnO/ZBqND0mi6cdw=; b=si8Xs8v5dOzriy6c3z6N2v+rHR
	Erm4Xu8OZdd4fcIwOefCPTziE5pBWNN5cUKCHwM05TFDvdQB65PkTjx/Md6F/18UV+kL3JF3EqhpR
	MEAwqLSXUVO4epgRQOdhBNpde4c60rj/pbnkq2MDoezDDeaybwhV6Tz6SpVYploKdAUJQoB7/EaIf
	zUOzPBlCeIWukxjbUOn7YB1o1oo6ETXRg/Rv/ZudREgJYZUvesex+ZUcXMdeLe0e4jggIsdjiO5SG
	8Tcv8HUDcdq0Txwpn72jNTkvPPW7TQGflBKOGXnppqpll0fd4hw2LJFsM2zveQfN88Hg7wJgw3pOv
	w0FbnzVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiUc-0000000F8aP-21nJ;
	Wed, 20 Nov 2024 11:03:30 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiKn-0000000F6Vk-23pO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 10:53:22 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6eec33c5c50so4052467b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 02:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732100000; x=1732704800; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6JquR2uEtGIuvh8lVzjpHJvjKLaOnO/ZBqND0mi6cdw=;
        b=wHiECHTqgZH+NlNhMwM/OonmUwu/zB9kOkSbiTXTsW48P6+eXdPg07NQwR4p5bezwc
         ch1SQP5uLuAhf+v12QLzvEvN0KZg2AbeCEEyXEO3LJAa4UMYmXFP5KRS48UsPX1E6ahS
         IIbORLUyedkEp3szHuyw1Y/9oTb4GXz9tEfEIkFBy7JAAayamZRZV2rSdADvMSWy8bHU
         I1JOF/J4WAtmMaJ2Q+O13KtPwRzKVD95RyOcar6qiEwqI6HkvfGYfDWS5d9Sdrwk2nKT
         oROlTJH8sjtDMxiB07ylSBemMudRi0QD6P7Jw+bYo5Nod86lvMWzNYm130QL2mVp9Afn
         GyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732100000; x=1732704800;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6JquR2uEtGIuvh8lVzjpHJvjKLaOnO/ZBqND0mi6cdw=;
        b=HfEqMjhFHGBVjlgin7ucGVQTyn/jihi/zjV26uDVeQHywaU7gakQ1vJXsZaEL0FStr
         2fQQoyNKbQc3HvVzXMP6sJFhqueQfLEMO38wwOFMe9VM3fI4CyU3AIIHeEgKAzEvJyk3
         CkU2FCeWCp0gAOyXTxcKhNyONzmVP6dr+u96FflgMuimf9VZrXwcPKn8O0xW/+/9scSj
         SwNxea3TkgsBwEFBjIESkeE5GlXyOZtdpCJmMm7CpeOsTmSH4PykH6/G2U/USzryTosq
         41/v28zBi2PbwQWahwze8l6RGsefWU9i741PoJ352i3YoSP/jhm2MHicJi8epWRznRD/
         h0GA==
X-Forwarded-Encrypted: i=1; AJvYcCW99lWzU3AZ/A/KxogaZKPw19dOG2VYZYKdpojpIGzzktFcSGsyq9Q2x6Bdmc9HsSyqNzNDzmYQmM+jVB13syJa@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9ZglyHt+1pFq9xQLGB9cd8kUZjb0ZaLwAxv3Pepg2b7U+Thio
	s1m4mY99zrsqX8z/udeQem8QadrwvJgSOqHzEue8WfR+/A8BDrDUixg5DDX73A8mENwgGRagBw=
	=
X-Google-Smtp-Source: AGHT+IGjTO1sOEXRqcz5cXGI1+8/omcfLZJdyTvwqzeuyUIxCa2tryhb/BBthy5hFyNh+HC+CU3EpfV4FA==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a05:690c:290c:b0:6ee:c34b:70ac with SMTP id
 00721157ae682-6eec34bae88mr7667b3.0.1732100000244; Wed, 20 Nov 2024 02:53:20
 -0800 (PST)
Date: Wed, 20 Nov 2024 10:52:52 +0000
In-Reply-To: <20241120105254.2842020-1-tabba@google.com>
Mime-Version: 1.0
References: <20241120105254.2842020-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241120105254.2842020-11-tabba@google.com>
Subject: [PATCH v1 10/12] KVM: arm64: Calculate cptr_el2 traps on activating traps
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_025321_528265_AC34325B 
X-CRM114-Status: GOOD (  15.79  )
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

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  1 -
 arch/arm64/kvm/arm.c              |  1 -
 arch/arm64/kvm/hyp/nvhe/pkvm.c    | 42 -------------------------------
 arch/arm64/kvm/hyp/nvhe/switch.c  | 30 +++++++++++++++++-----
 4 files changed, 24 insertions(+), 50 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index f333b189fb43..99660d040dda 100644
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
index 7786a83d0fa8..e95f1df86748 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -35,14 +35,10 @@ DEFINE_PER_CPU(unsigned long, kvm_hyp_vector);
 
 extern void kvm_nvhe_prepare_backtrace(unsigned long fp, unsigned long pc);
 
-static void __activate_traps(struct kvm_vcpu *vcpu)
+static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
 {
-	u64 val;
-
-	___activate_traps(vcpu, vcpu->arch.hcr_el2);
-	__activate_traps_common(vcpu);
+	u64 val = kvm_get_reset_cptr_el2(vcpu);
 
-	val = vcpu->arch.cptr_el2;
 	val |= CPTR_EL2_TAM;	/* Same bit irrespective of E2H */
 	val |= has_hvhe() ? CPACR_EL1_TTA : CPTR_EL2_TTA;
 	if (cpus_have_final_cap(ARM64_SME)) {
@@ -61,7 +57,29 @@ static void __activate_traps(struct kvm_vcpu *vcpu)
 		__activate_traps_fpsimd32(vcpu);
 	}
 
+	if (vcpu_is_protected(vcpu)) {
+		struct kvm *kvm = vcpu->kvm;
+
+		if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, AMU, IMP))
+			val |= CPTR_EL2_TAM;
+
+		if (!vcpu_has_sve(vcpu)) {
+			if (has_hvhe())
+				val &= ~CPACR_ELx_ZEN;
+			else
+				val |= CPTR_EL2_TZ;
+		}
+	}
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


