Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D38E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWRlIiI31BxmGPjckPOwy0oDiGPfB3G4L1dgRWKrBVw=; b=neihVdMf3wLxlihK/tNWjxzA8x
	ZcI0TYohygfYyuF7ZJ5F0A4MaZnxmNE2Gj2h7j27oEVx8tk2EeHKtZARjxmk1mREP5TgBoM1Etdfi
	vg+A+W83spJF+6jWOYahq0Qfyi0iqNfs1ccDxQQ9IcUloNSxMVSv1h49nUF4nVtrYENmsasSu2SHH
	V/sjVCemjwwlkQf4sIaf9BQsNPe0I3kT4myWTMiV9On9tZlVk25QMqEqQj4RoPfgFoTMtd4ktRS0e
	RKipur8Z35KgCbr3WkWEPL/XGP7KSlYI7Hx6MakqEH1MZL5tIdUYIJ/ckjtDdoyeyvTACd8dpQBXt
	wQpJp2Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8ym-00000009miP-3DjL;
	Mon, 16 Dec 2024 11:09:36 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8hJ-00000009k2i-2Xgp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:51:34 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-385e9c698e7so2009041f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 02:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734346291; x=1734951091; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GWRlIiI31BxmGPjckPOwy0oDiGPfB3G4L1dgRWKrBVw=;
        b=wopC6RBypaQXoiqO+gvnECtSpmi+21T3zYOlH8q2L8ARA/8J2Il+9jclgSNJTZxaHb
         Qc80VWucp4kHnL4rai/Qhjd7xkXxhLBgscB5bNJjLj2Uw0eeLkb2S5fGz0XfPHCaEIpJ
         FA0Gk92lpNxYF+oY42ICvt0LEUob15UqGAt1yybdfJBFYLDoyXGG/g55Wsrkqg1oFRi+
         ph/omtMSEAwHm6dV5LZe52TcrGgENLmDL333Ef/UHUEqvnD0JxIL9esZipvWptH8xDo+
         rfR5xZcljaeVCH3sfjXddNYjqCS9yTrFhE1gwBMkv2j57+7nPQ3Md8icr9D3P06ESxt5
         2N6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346291; x=1734951091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWRlIiI31BxmGPjckPOwy0oDiGPfB3G4L1dgRWKrBVw=;
        b=AyfAMi3acXNajBwMrUmfx8Oa32/PRmvocPyrn5/DZlfbC4UQoSmrjK72Kvte0dEtS3
         KsrifCqI7z2dAISivgZouCHTDsE5UJ5CPG0K7F8nwNZLZBLrqIVpfHOpmcTlkdOnqNXr
         BasUEnBWCynGf564RjbmlPahcyKcHb+zCJ8d2WPWEj3hKBisqf/sAvcIH73m6i4SVrGq
         s5NKiMN9GqDYQpINTuEOwcxcEpihop8NvYON50mlmv2ekVoimzjCJIuiKah+8Al3W6HF
         dmIWn1gAgW5f/YiV2Hz0j4V19eTwvMDpAIB/EmpiU/elB5nTBQqiGBfEFmeDHLoxC3T6
         V1Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUVnSA5nSUiQG1lKvk5N6pitpn0laSyNzXaBI5Ec6cDG9owEqekD1SKqQOaLKQ0QOqLC4W1co6VSrfm79sX/0uu@lists.infradead.org
X-Gm-Message-State: AOJu0YzKhdIl8agyTrkLBGzNtBvLOo7DKIbh1cHGJVosYp2rut8P8UBP
	7eftNkHrsrwfZ756Baez8cEdQsHNONlodVIkm4wYWuZtCHhTyNK/koId9zHKQQMXhFekJkb6Xg=
	=
X-Google-Smtp-Source: AGHT+IEuNL+lWG9lMFyK20DSLRl1dnkflzDK3gJDdXF5BmkvWUPWorOkbhhkOY3ezU3DDXl2n09tnPFLlg==
X-Received: from wmqf13.prod.google.com ([2002:a05:600c:4e8d:b0:434:f21d:7e31])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2cf:b0:386:4332:cc99
 with SMTP id ffacd0b85a97d-387888069d8mr13864516f8f.17.1734346291723; Mon, 16
 Dec 2024 02:51:31 -0800 (PST)
Date: Mon, 16 Dec 2024 10:50:56 +0000
In-Reply-To: <20241216105057.579031-1-tabba@google.com>
Mime-Version: 1.0
References: <20241216105057.579031-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216105057.579031-17-tabba@google.com>
Subject: [PATCH v5 16/17] KVM: arm64: Convert the SVE guest vcpu flag to a vm flag
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_025133_641620_45A19E0B 
X-CRM114-Status: GOOD (  17.78  )
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
index b399d69b4b67..446a9114b0d3 100644
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
2.47.1.613.gc27f4b7a9f-goog


