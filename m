Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6307D69104
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 12:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kRQ3NfjIG6Bs79ygogj1t8Kc3423PzxH4sJj7NjZHU=; b=wR2nRjAJXySy9jYEXqA8x2ToUt
	BI5pmahMEncQD1BT+/IMcXjtn2F63PlWst9SIhthyKZLOX0DzDgWF8g+kZwAXJ5qipXc946zNzo8e
	JjJL2Zcn2WuxrHHiIaW2WFQBWuJaoFTYbFevRXYemWlQbMsA6VzCONmXnydGu1gPIMmWQcbAXb9B/
	lcmNOxcKvSeYWjdwjbnGDfyPCFRxKs7n8OZy1Y04a+T7xNJcIEvM7eEQa9E0v7Cn/l2O5Angek4nb
	895HdWLFWsow4kwHNa+4Fc0QUd2i02LBuMVH21uIbhu9uOiMtFmZsMm2qmkD3UduIJO1oCSVqxTx4
	b2R9nyFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdod-0000000FW3Y-0Po5;
	Thu, 28 Nov 2024 12:40:15 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdjy-0000000FVLp-3Q71
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 12:35:27 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-434a37a57dfso5965775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 04:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732797325; x=1733402125; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+kRQ3NfjIG6Bs79ygogj1t8Kc3423PzxH4sJj7NjZHU=;
        b=QmfxcwS+bRb9CbKE0W1i/m1j6gH7OzdV/9NT7k2JqvfUsd6YP1kNWQV6Hb4LQfzNEX
         8oFJnueI/AF2lZ40EJLTc9UMrshy6coYExoSd1GpZFQHQGNmh0uSW29H6IOm38OSFbrn
         19xIDiaAGP3azUsTIJIA5uA1CR3z8X5RVClad4kCGuvVDi9rzarUrDulFtKtiB7oWgdQ
         JrPFeFibdwieNV8AgwujTYISIXoNTF7fXeoyJEZeeU53Mn/3fhwYanrrhucH++j/VQ7c
         akelYdK6vVh4soCaP3QokoZe/PEGDpwd+JLilpoC0kdG6ZFPp6IiSjXcC0EjkgIezsoM
         ch5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732797325; x=1733402125;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+kRQ3NfjIG6Bs79ygogj1t8Kc3423PzxH4sJj7NjZHU=;
        b=Ipm30txI4rtv/ftK19MIbtzJdKddCDDs/QR1g2xf5QKXm17Bc5G0Gvrsq/DMETylKc
         xBSmbYq7jwA09pF2htfFv+m2m5eqYzHUA02hQpfZCxwIFvzM+eHBAwolWeTm+BB3NI6t
         Rfgk2LF+pcpcbSxC926Jgr+D3H4AZcytD5k6TYhTnnii3GAzC4wYlSBKstvSkVPqwHOI
         eHxGYjXvthRNLyZD4XxF55evN1MBkhnyDL5JFO5E22UELXyHXLyOTZT1MGxrHIBooU6y
         X1x6xHHIhhkVMindWWgcww+j94jhtxClZlT1034tZV/0dg0ovgEuUZKAESKVfX15EIsa
         Kt1g==
X-Forwarded-Encrypted: i=1; AJvYcCXdzj2R8cVIYg18rquSSzsGQfvg52lj5w9FbiwrwGwzChLZO5ItR4WrFElr4bFy0aDFxi4lBSDIU+gCZuPUESAl@lists.infradead.org
X-Gm-Message-State: AOJu0YxcrCh7FoBzqQJHsJ9LJEfnu2jX7ZUFu0whNq8UhZW9fwtVOtnS
	MIgA1mTivqLL3XJHcPBMJg0Lnh98RxEUYOJ2fdoK888Pmo31l43NX2cs0VnXuCc/PV0A7X6zGQ=
	=
X-Google-Smtp-Source: AGHT+IHMVReJErhhBo7053SStOHg6tt5oWLV5DgbbfQf1EpxKz1kiJMh0TSpRa+JHIfRw0tTmqmxL4KLIg==
X-Received: from wmlm9.prod.google.com ([2002:a7b:ca49:0:b0:434:a12e:328e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:6da8:0:b0:382:3210:4de0
 with SMTP id ffacd0b85a97d-385c6edd73amr5582769f8f.44.1732797325285; Thu, 28
 Nov 2024 04:35:25 -0800 (PST)
Date: Thu, 28 Nov 2024 12:35:04 +0000
In-Reply-To: <20241128123515.1709777-1-tabba@google.com>
Mime-Version: 1.0
References: <20241128123515.1709777-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128123515.1709777-5-tabba@google.com>
Subject: [PATCH v3 04/15] KVM: arm64: Use KVM extension checks for allowed
 protected VM capabilities
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_043526_855851_3CF443C9 
X-CRM114-Status: GOOD (  14.10  )
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

Use KVM extension checks as the source for determining which
capabilities are allowed for protected VMs. KVM extension checks
is the natural place for this, since it is also the interface
exposed to users.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_pkvm.h | 25 +++++++++++++++++++++++++
 arch/arm64/kvm/arm.c              | 29 ++---------------------------
 arch/arm64/kvm/hyp/nvhe/pkvm.c    | 26 ++++++--------------------
 3 files changed, 33 insertions(+), 47 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index cd56acd9a842..400f7cef1e81 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -20,6 +20,31 @@ int pkvm_init_host_vm(struct kvm *kvm);
 int pkvm_create_hyp_vm(struct kvm *kvm);
 void pkvm_destroy_hyp_vm(struct kvm *kvm);
 
+/*
+ * This functions as an allow-list of protected VM capabilities.
+ * Features not explicitly allowed by this function are denied.
+ */
+static inline bool kvm_pvm_ext_allowed(long ext)
+{
+	switch (ext) {
+	case KVM_CAP_IRQCHIP:
+	case KVM_CAP_ARM_PSCI:
+	case KVM_CAP_ARM_PSCI_0_2:
+	case KVM_CAP_NR_VCPUS:
+	case KVM_CAP_MAX_VCPUS:
+	case KVM_CAP_MAX_VCPU_ID:
+	case KVM_CAP_MSI_DEVID:
+	case KVM_CAP_ARM_VM_IPA_SIZE:
+	case KVM_CAP_ARM_PMU_V3:
+	case KVM_CAP_ARM_SVE:
+	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
+	case KVM_CAP_ARM_PTRAUTH_GENERIC:
+		return true;
+	default:
+		return false;
+	}
+}
+
 extern struct memblock_region kvm_nvhe_sym(hyp_memory)[];
 extern unsigned int kvm_nvhe_sym(hyp_memblock_nr);
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index a102c3aebdbc..b295218cdc24 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -80,31 +80,6 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
 }
 
-/*
- * This functions as an allow-list of protected VM capabilities.
- * Features not explicitly allowed by this function are denied.
- */
-static bool pkvm_ext_allowed(struct kvm *kvm, long ext)
-{
-	switch (ext) {
-	case KVM_CAP_IRQCHIP:
-	case KVM_CAP_ARM_PSCI:
-	case KVM_CAP_ARM_PSCI_0_2:
-	case KVM_CAP_NR_VCPUS:
-	case KVM_CAP_MAX_VCPUS:
-	case KVM_CAP_MAX_VCPU_ID:
-	case KVM_CAP_MSI_DEVID:
-	case KVM_CAP_ARM_VM_IPA_SIZE:
-	case KVM_CAP_ARM_PMU_V3:
-	case KVM_CAP_ARM_SVE:
-	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
-	case KVM_CAP_ARM_PTRAUTH_GENERIC:
-		return true;
-	default:
-		return false;
-	}
-}
-
 int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 			    struct kvm_enable_cap *cap)
 {
@@ -113,7 +88,7 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 	if (cap->flags)
 		return -EINVAL;
 
-	if (kvm_vm_is_protected(kvm) && !pkvm_ext_allowed(kvm, cap->cap))
+	if (kvm_vm_is_protected(kvm) && !kvm_pvm_ext_allowed(cap->cap))
 		return -EINVAL;
 
 	switch (cap->cap) {
@@ -311,7 +286,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 {
 	int r;
 
-	if (kvm && kvm_vm_is_protected(kvm) && !pkvm_ext_allowed(kvm, ext))
+	if (kvm && kvm_vm_is_protected(kvm) && !kvm_pvm_ext_allowed(ext))
 		return 0;
 
 	switch (ext) {
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index fb733b36c6c1..59ff6aac514c 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -329,34 +329,20 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 
 	bitmap_zero(allowed_features, KVM_VCPU_MAX_FEATURES);
 
-	/*
-	 * For protected VMs, always allow:
-	 * - CPU starting in poweroff state
-	 * - PSCI v0.2
-	 */
-	set_bit(KVM_ARM_VCPU_POWER_OFF, allowed_features);
 	set_bit(KVM_ARM_VCPU_PSCI_0_2, allowed_features);
 
-	/*
-	 * Check if remaining features are allowed:
-	 * - Performance Monitoring
-	 * - Scalable Vectors
-	 * - Pointer Authentication
-	 */
-	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_PMUVer), PVM_ID_AA64DFR0_ALLOW))
+	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_PMU_V3))
 		set_bit(KVM_ARM_VCPU_PMU_V3, allowed_features);
 
-	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_SVE), PVM_ID_AA64PFR0_ALLOW))
-		set_bit(KVM_ARM_VCPU_SVE, allowed_features);
-
-	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_API), PVM_ID_AA64ISAR1_ALLOW) &&
-	    FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_APA), PVM_ID_AA64ISAR1_ALLOW))
+	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_PTRAUTH_ADDRESS))
 		set_bit(KVM_ARM_VCPU_PTRAUTH_ADDRESS, allowed_features);
 
-	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_GPI), PVM_ID_AA64ISAR1_ALLOW) &&
-	    FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_GPA), PVM_ID_AA64ISAR1_ALLOW))
+	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_PTRAUTH_GENERIC))
 		set_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, allowed_features);
 
+	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_SVE))
+		set_bit(KVM_ARM_VCPU_SVE, allowed_features);
+
 	bitmap_and(kvm->arch.vcpu_features, host_kvm->arch.vcpu_features,
 		   allowed_features, KVM_VCPU_MAX_FEATURES);
 }
-- 
2.47.0.338.g60cca15819-goog


