Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698BFD75E25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 11:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWe5Mdglq6lpGdligyGuHt48Am1OpJsAxqpU83sYBew=; b=vdA6dxT9f1Kcie33UntXOxRZzc
	oZbWH0/1bLdiCaxpmmnXQZfTvdnNghKMjlXpBJBaVS2xBsfHWY1QQv9tL/YbzzM2vT4ZAZUQyCztj
	qSnwGrqp2UNYtGsLS5N7MDSpiWylrKx7p4Rct7W6NiQM8jQpZXllE1AOg1mNM7FG9y42Gb2sCAJqF
	0+YbMs5zpbNo7V8uMneiTUX6qr5Lp9UodKz5sY9TcfsObkJn7itODZ2evI5te/4YaC7yXx1KaURL6
	mfDXNx/+4fBjBl3JCQ5KUrW94ksuqkLotnJiQIUoOU7FUJgYLqbaPCprSgYl7b6CCywqiaxa/4GCc
	c+XkNRoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERei-00000002L8Z-2WZE;
	Fri, 22 Nov 2024 11:16:56 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tERUw-00000002JV3-1WN7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 11:06:51 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4315af466d9so13233605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 03:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732273608; x=1732878408; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XWe5Mdglq6lpGdligyGuHt48Am1OpJsAxqpU83sYBew=;
        b=Sj5ZqpNwGoLZT6sCmILLYNxxn09fGJQUhAfOt5Ujb9qqhqarE1w3KRrGNMwySukTJZ
         bK9+lladMHuyuuFzCg6s9CDhzJ3/PZDdovSuEBIbQlrMiWuBWpVzot1Q7HQszWUfbnds
         uS5aH1XLMlJeDIiwIJMATZnewYp9MJmAHn/W/hoFfKNqKU0HINLW1FTmy8z0IoBIwPVU
         p/mTjP6A6PCt/wuyjx3P+JdR+iZlZ3u/9wlHZY36W4fZFQfrSC3yTJZ+fLjAJ3e1ghGa
         BtnudpcmTm9A7Kr5AflNa3j/BbByS6O6LJ0BsMOCVx4cqpuXUU5Sfy4ncRm8wXsaJTn9
         dGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732273608; x=1732878408;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XWe5Mdglq6lpGdligyGuHt48Am1OpJsAxqpU83sYBew=;
        b=JXwXHu9URjzF+7T1iznexyplJhjFIqTYgk2hGP9kSGEyMY0f057dZmGiLwaPMEPzqW
         /uVEJUrzynIqz1TDM7Gle2NAjEMU5UxKOX3dYrlW7tRA9otrybMNDRJD9mL2RgA1UNhB
         Nc83U2BytinKs1rUkJ25nzV2Sqf+xOP0LkIYuRE3LL3koMdyTdJS7/hVBRja26U5vsn7
         FKFb3zTNRXAm/mqcvnre58MWijEqxG60rY/VwD2cZci+Rj+R+eKVNYBglvE2LwvXJEvz
         L9GxCo+No+KeyEzjcA4/YLuwHfV4zv0t8UxgtYihSb2fM6EtujD+sxH6PP6XAQkhBxjS
         ohXA==
X-Forwarded-Encrypted: i=1; AJvYcCUDCtwSHzn96GLzoVERY6X1kzy8UgdakGceXW2HZUY+ZAl84IFmWpfbZIXCbP9kO/C4vr/RoucJFvmZFki75Wn+@lists.infradead.org
X-Gm-Message-State: AOJu0YyEkHME35BH0yOhoahA9G7TXQKtbQnSfsg2R1Xi5pyv/Jbp4xAe
	MeMGuiWDqOwml4I+X0whvP4kl2SLo3tZHtr1lqt2YMdNmp57vPlQFQvM+PYlY879hPbHQEMcIQ=
	=
X-Google-Smtp-Source: AGHT+IEu7Wnz6mni8ialrdn5OeFZVWOYWzP7F/hTJWtX6rx9KrRnIH5sNRYNhvao8zhDmrIXrilxffaSrg==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a05:600c:6005:b0:42c:a8b5:c1b with SMTP id
 5b1f17b1804b1-433ce41bee9mr8665e9.2.1732273608174; Fri, 22 Nov 2024 03:06:48
 -0800 (PST)
Date: Fri, 22 Nov 2024 11:06:20 +0000
In-Reply-To: <20241122110622.3010118-1-tabba@google.com>
Mime-Version: 1.0
References: <20241122110622.3010118-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241122110622.3010118-11-tabba@google.com>
Subject: [PATCH v2 10/12] KVM: arm64: Calculate cptr_el2 traps on activating traps
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_030650_400087_460B5FE5 
X-CRM114-Status: GOOD (  16.44  )
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
2.47.0.371.ga323438b13-goog


