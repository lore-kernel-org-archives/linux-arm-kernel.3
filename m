Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31814D78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnQzw7GXZoQZEyFGDmh2iP65GddGe2quAc7qCM8laWA=; b=KNUg0DeeP+txMkrKAhCc6yA04N
	h5Eg3pKpa9SQC5Uwqp9lrRPKQTwYrM07shoyZxWlkZzDQMCT3MRUdECP3poYKdKFO0zOIfMk7cxm5
	aQxyBYoqEb4OgSIaEEpZRyAAFt7ZvQHl9EK1mNUvw6v6q0wYrUdeNQtt1AALEtQvVNEFfSVSk0z4Z
	k2MH8/0WzIYZsN5RJ30kwQQeNfqP/3GX8O4B1eiO9mYMfsU34KouQGCHr4U5OJOEx3pH46KblDXLX
	aVdDWzedUUA0HF54r+KpS/OkY4u4x1TTyJNBd3u9mRDyPISmGSImF/LdWLd4M34vQcSDCf3eHjUvJ
	XFJA3ZiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8ym-00000006mmR-2aGf;
	Mon, 02 Dec 2024 16:08:56 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8ek-00000006ibh-0G3b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:48:15 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-385e2579507so990652f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733154492; x=1733759292; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lnQzw7GXZoQZEyFGDmh2iP65GddGe2quAc7qCM8laWA=;
        b=f6tFYO6nms53nTZZnEfbWXQa/wpEITUTLx5KgnqfTXMcecoSnAP4SLHfyldBJFr6P0
         qbzKduOiNfxMV1uOXu8DEHdkfqbLcanqaN9tUMDdNctbx3cb3dub0SjG6tESnE0bYrm5
         UK8JLtQlZKJFawGeOSuWJvKNySagYE8eWxKF4nu7OWiCDFSbh5C5XIOljepK+zoZONJk
         fUruGUHiCnlqzXWwC7h5HXaiiobnmBZskepHyRC9yyUfy5ZQSuatnXBKUTpxbfSz8G1Y
         d8WEPJbvhW79YSFYYr3Y7h0q3pS0FBg2dYje8HvanZFYYu/YAhd3Yq+pI6euylOcLJTa
         Eu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154492; x=1733759292;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lnQzw7GXZoQZEyFGDmh2iP65GddGe2quAc7qCM8laWA=;
        b=btgrHWhL9T6fZ9feuiwOKklKbG2VFdoZsKc+oy0sZpB3HC0sqUqr2au92jhuIKgc83
         CQgCc+j60srKoIYaDUZFsidLD9MHLqHpW9FL9KS6FC+60/gm0+Q4+mJRSUHz3FZ/nbh/
         UYM4GgMBs6P5ibVqfJs+GauZqZjLdHd+V/zHLFy5PX4b3V299E7IPCso/IMRKTYPh2nQ
         nVKE0VZ22rdkrci+ddmZ+4WxogxTeTfeaQyYCjQfZnL+zYgrXuMKgTcnq5JDe7bTheQZ
         9PPvilBu2xCLn6AKSk1fLMudanRtwVZMe4OjYDnIl4Q36FDxoThisnJyTZcQaLrzUSJ8
         gCAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPi1p0wmvrf1SXEgNP5zypF6snIzWaVpIckjNs6VfrThw2XwXYiGRSdaR+nuKCB5Gi2ipTUqfUm6ggOUJyNccP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7T6CCw6Jx0vxYN85OQ3DGJkPiy2xytmn/8QA2T7218c/J6ZI1
	ttoZ9MJm0WDuR5DBrg2PNbTePwWgSjO+J8Mynu1IX2OvBBDRxU1eNADigSKb4hnQCprrar06Sw=
	=
X-Google-Smtp-Source: AGHT+IFy6a6TuSNKKxoPdUR7i+hSqxgXnZND2/jd1bnVIE+WVX9SFuEs9tUkydF9BdD5AikuWy+HqIBKag==
X-Received: from wmbjz10.prod.google.com ([2002:a05:600c:580a:b0:431:4bef:d181])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4915:b0:385:e8b4:aca2
 with SMTP id ffacd0b85a97d-385e8b4af8dmr7961023f8f.58.1733154492610; Mon, 02
 Dec 2024 07:48:12 -0800 (PST)
Date: Mon,  2 Dec 2024 15:47:41 +0000
In-Reply-To: <20241202154742.3611749-1-tabba@google.com>
Mime-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241202154742.3611749-15-tabba@google.com>
Subject: [PATCH v4 14/14] KVM: arm64: Convert the SVE guest vcpu flag to a vm flag
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074814_098226_C723CE1B 
X-CRM114-Status: GOOD (  18.61  )
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

The vcpu flag GUEST_HAS_SVE is per-vcpu, but it is based on what
is now a per-vm feature. Make the flag per-vm.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h | 12 +++++++++---
 arch/arm64/include/asm/kvm_host.h    | 18 ++++++++++++------
 arch/arm64/kvm/hyp/nvhe/pkvm.c       | 11 +++++++----
 arch/arm64/kvm/reset.c               |  2 +-
 4 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 406e99a452bf..2d91fb88298a 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -620,7 +620,7 @@ static __always_inline void kvm_write_cptr_el2(u64 val)
 }
 
 /* Resets the value of cptr_el2 when returning to the host. */
-static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
+static __always_inline void __kvm_reset_cptr_el2(struct kvm *kvm)
 {
 	u64 val;
 
@@ -631,14 +631,14 @@ static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
 	} else if (has_hvhe()) {
 		val = CPACR_ELx_FPEN;
 
-		if (!vcpu_has_sve(vcpu) || !guest_owns_fp_regs())
+		if (!kvm_has_sve(kvm) || !guest_owns_fp_regs())
 			val |= CPACR_ELx_ZEN;
 		if (cpus_have_final_cap(ARM64_SME))
 			val |= CPACR_ELx_SMEN;
 	} else {
 		val = CPTR_NVHE_EL2_RES1;
 
-		if (vcpu_has_sve(vcpu) && guest_owns_fp_regs())
+		if (kvm_has_sve(kvm) && guest_owns_fp_regs())
 			val |= CPTR_EL2_TZ;
 		if (!cpus_have_final_cap(ARM64_SME))
 			val |= CPTR_EL2_TSM;
@@ -647,6 +647,12 @@ static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
 	kvm_write_cptr_el2(val);
 }
 
+#ifdef __KVM_NVHE_HYPERVISOR__
+#define kvm_reset_cptr_el2(v)	__kvm_reset_cptr_el2(kern_hyp_va((v)->kvm))
+#else
+#define kvm_reset_cptr_el2(v)	__kvm_reset_cptr_el2((v)->kvm)
+#endif
+
 /*
  * Returns a 'sanitised' view of CPTR_EL2, translating from nVHE to the VHE
  * format if E2H isn't set.
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index e6be8fe6627a..c834b6768247 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -331,6 +331,8 @@ struct kvm_arch {
 #define KVM_ARCH_FLAG_ID_REGS_INITIALIZED		7
 	/* Fine-Grained UNDEF initialised */
 #define KVM_ARCH_FLAG_FGU_INITIALIZED			8
+	/* SVE exposed to guest */
+#define KVM_ARCH_FLAG_GUEST_HAS_SVE			9
 	unsigned long flags;
 
 	/* VM-wide vCPU feature set */
@@ -862,12 +864,10 @@ struct kvm_vcpu_arch {
 #define vcpu_set_flag(v, ...)	__vcpu_set_flag((v), __VA_ARGS__)
 #define vcpu_clear_flag(v, ...)	__vcpu_clear_flag((v), __VA_ARGS__)
 
-/* SVE exposed to guest */
-#define GUEST_HAS_SVE		__vcpu_single_flag(cflags, BIT(0))
+/* KVM_ARM_VCPU_INIT completed */
+#define VCPU_INITIALIZED	__vcpu_single_flag(cflags, BIT(0))
 /* SVE config completed */
 #define VCPU_SVE_FINALIZED	__vcpu_single_flag(cflags, BIT(1))
-/* KVM_ARM_VCPU_INIT completed */
-#define VCPU_INITIALIZED	__vcpu_single_flag(cflags, BIT(2))
 
 /* Exception pending */
 #define PENDING_EXCEPTION	__vcpu_single_flag(iflags, BIT(0))
@@ -956,8 +956,14 @@ struct kvm_vcpu_arch {
 				 KVM_GUESTDBG_USE_HW | \
 				 KVM_GUESTDBG_SINGLESTEP)
 
-#define vcpu_has_sve(vcpu) (system_supports_sve() &&			\
-			    vcpu_get_flag(vcpu, GUEST_HAS_SVE))
+#define kvm_has_sve(kvm)	(system_supports_sve() &&		\
+				 test_bit(KVM_ARCH_FLAG_GUEST_HAS_SVE, &(kvm)->arch.flags))
+
+#ifdef __KVM_NVHE_HYPERVISOR__
+#define vcpu_has_sve(vcpu)	kvm_has_sve(kern_hyp_va((vcpu)->kvm))
+#else
+#define vcpu_has_sve(vcpu)	kvm_has_sve((vcpu)->kvm)
+#endif
 
 #ifdef CONFIG_ARM64_PTR_AUTH
 #define vcpu_has_ptrauth(vcpu)						\
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index dfd031acde31..8a80e494f20c 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -248,10 +248,13 @@ void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struct kvm *host_kvm)
 {
 	struct kvm *kvm = &hyp_vm->kvm;
+	unsigned long host_arch_flags = READ_ONCE(host_kvm->arch.flags);
 	DECLARE_BITMAP(allowed_features, KVM_VCPU_MAX_FEATURES);
 
 	/* No restrictions for non-protected VMs. */
 	if (!kvm_vm_is_protected(kvm)) {
+		hyp_vm->kvm.arch.flags = host_arch_flags;
+
 		bitmap_copy(kvm->arch.vcpu_features,
 			    host_kvm->arch.vcpu_features,
 			    KVM_VCPU_MAX_FEATURES);
@@ -271,8 +274,10 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_PTRAUTH_GENERIC))
 		set_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, allowed_features);
 
-	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_SVE))
+	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_SVE)) {
 		set_bit(KVM_ARM_VCPU_SVE, allowed_features);
+		kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_GUEST_HAS_SVE);
+	}
 
 	bitmap_and(kvm->arch.vcpu_features, host_kvm->arch.vcpu_features,
 		   allowed_features, KVM_VCPU_MAX_FEATURES);
@@ -308,10 +313,8 @@ static void pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *
 {
 	struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
 
-	if (!vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE)) {
-		vcpu_clear_flag(vcpu, GUEST_HAS_SVE);
+	if (!vcpu_has_feature(vcpu, KVM_ARM_VCPU_SVE))
 		vcpu_clear_flag(vcpu, VCPU_SVE_FINALIZED);
-	}
 }
 
 static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 1cfab6a5d8a5..803e11b0dc8f 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -85,7 +85,7 @@ static void kvm_vcpu_enable_sve(struct kvm_vcpu *vcpu)
 	 * KVM_REG_ARM64_SVE_VLS.  Allocation is deferred until
 	 * kvm_arm_vcpu_finalize(), which freezes the configuration.
 	 */
-	vcpu_set_flag(vcpu, GUEST_HAS_SVE);
+	set_bit(KVM_ARCH_FLAG_GUEST_HAS_SVE, &vcpu->kvm->arch.flags);
 }
 
 /*
-- 
2.47.0.338.g60cca15819-goog


