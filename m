Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D17CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=try8WC1fF3BAE79rr/w67fgQlh2kGwhAnWrTJpFDLF4=; b=O/qlY5OZwr+82zVv6ObZQHEjy7
	XAQqqDu1P9uQSX0OjmgtD2guG4eMGur4XR0j1Ktu9jswFgxbIIVh8xqFffgXAO8jVGMsQWFvBgLWO
	qoKdhItqSSDsnmKQtlBVs2q2kcVXYXvitzU8eezrLhAYKh28YwL9xGoIN9aL8USVOBYtOW0AlkdyF
	TNyny8l+vQ8xyBFaRhFuuNkVVAEFnflaScRyG7mgNqrH1V+yc82wtpyyt3QqJPRZpoE8g+qFAfo4t
	gTqNt5XcevbHB3GHSLd7MavZn7Jk0tbcM2VPqeTuTuucHaTSG5wQ7EBLqPlUR+l8T0Hg85jAdLXcf
	CvU4LsnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISDE-00000005Vvs-23OU;
	Mon, 10 Nov 2025 13:45:40 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISD7-00000005Vpx-2i2s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:45:34 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477212937eeso15263645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 05:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762782331; x=1763387131; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=try8WC1fF3BAE79rr/w67fgQlh2kGwhAnWrTJpFDLF4=;
        b=jAUjVN1t1pXLRSuRVn1DpD/u7lO6X2qFGnslwpoQ1UoEDNjp9KgNxVW90EU3P4FF6o
         x6ETZMkVfQsbxKNtWqn23RdcZ0nISUrUjRr3dx9R2g2yTT1CLZEUm2bZeiHQTKfaM+7L
         XDbaZ1P5zy2p/u6PEOBLSR8JD7mb7L0xUe8SHKTcAjbWkMGbXse5fHzTHEGr9FJBiP8r
         J2jS8GAM0LYwIVNBkWeO7nYZO2jSFxqUPnoWzzK0SZQQ3sxiHlKf14Vl1a7li2HxliQh
         N1pReqzg2XLwR4rf36DPR4mxIhKJ6ZzBWTfiXvZwBX7KKQgvv8y0GX3+ks0DdOcBHTqK
         REgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762782331; x=1763387131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=try8WC1fF3BAE79rr/w67fgQlh2kGwhAnWrTJpFDLF4=;
        b=xDPXvLXSbj6Rd0zYN3ZKxzl3UVJrYCStgihs3AnCCGXUkltDR+OtsLn686fck0piS0
         87o4TowjwMlrGBrojjN7Glg8dlt4FShksJQ0B1wryGuKlArNlE8mLChUkG7c7sPuge0t
         /BRvNQvR71Z1OEqYUUMBXb2u1h7E1tVGNX8t+Xw2/RlWxuqAuu+GfaNF7KCzd/AaxWBA
         pclQ+dTsnKgi9tkwOVklJG94CNHPy1up/QdhgHU1D7flPdoKKWuxB0/DLK4cWNUVERuD
         EXzHqWG9f6Tst9pmc6SCakNYzf3XnYTpRaeqzH+vaIYocl/pWS+7saxvEMGiRBDhvpCH
         9MRg==
X-Forwarded-Encrypted: i=1; AJvYcCWFFzb9FTracX7AtIizGS2rpiRe+aj1bw6vRxp++hv4sUCgM3GZv/CaTUNLcrQ5+2wgz/RgPEntGJ8V0sfByAbs@lists.infradead.org
X-Gm-Message-State: AOJu0YyXTJFL+jxEA7Vps7yuuVbxNZ6tmz1mUhf9AJs7eEc5ysVfzfyq
	1FdHRuKR/I2WzTE+caLTkBZ3H/X8N2y3RlNI+wB9n91b0fdkl2pdWBn/s9VbiFKWClzGoPWgUbK
	JwQ==
X-Google-Smtp-Source: AGHT+IF/YlnQrYhy/rtnE5rg4ZuxaDgVfodztUXFrMxQxA2Qx6YAdDGeqcGNEKNfr+Q2rDleE2o41q/Iag==
X-Received: from wmby11-n2.prod.google.com ([2002:a05:600c:c04b:20b0:475:df4b:95a9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e93:b0:471:7a:791a
 with SMTP id 5b1f17b1804b1-47773236f02mr76725015e9.7.1762782331578; Mon, 10
 Nov 2025 05:45:31 -0800 (PST)
Date: Mon, 10 Nov 2025 13:45:22 +0000
In-Reply-To: <20251110134525.3768197-1-tabba@google.com>
Mime-Version: 1.0
References: <20251110134525.3768197-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251110134525.3768197-6-tabba@google.com>
Subject: [PATCH v3 5/8] KVM: arm64: Include VM type when checking VM
 capabilities in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_054533_700302_B525947F 
X-CRM114-Status: GOOD (  16.88  )
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

Certian features and capabilities are restricted in protected mode. Most
of these features are restricted only for protected VMs, but some
are restricted for ALL VMs in protected mode.

Extend the pKVM capability check to pass the VM (kvm), and use that when
determining supported features. Moreover, extend the check to disallow
MTE for all VM types in protected mode.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_pkvm.h | 10 ++++++----
 arch/arm64/kvm/arm.c              |  4 ++--
 arch/arm64/kvm/hyp/nvhe/pkvm.c    | 10 +++++-----
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 08be89c95466..7195be508d99 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -23,10 +23,12 @@ void pkvm_destroy_hyp_vm(struct kvm *kvm);
 int pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu);
 
 /*
- * This functions as an allow-list of protected VM capabilities.
- * Features not explicitly allowed by this function are denied.
+ * Check whether the specific capability is allowed in pKVM.
+ *
+ * Certain features are allowed only for non-protected VMs in pKVM, which is why
+ * this takes the VM (kvm) as a parameter.
  */
-static inline bool kvm_pvm_ext_allowed(long ext)
+static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 {
 	switch (ext) {
 	case KVM_CAP_IRQCHIP:
@@ -43,7 +45,7 @@ static inline bool kvm_pvm_ext_allowed(long ext)
 	case KVM_CAP_ARM_PTRAUTH_GENERIC:
 		return true;
 	default:
-		return false;
+		return !kvm || !kvm_vm_is_protected(kvm);
 	}
 }
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 870953b4a8a7..10d853f2722e 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -87,7 +87,7 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 	if (cap->flags)
 		return -EINVAL;
 
-	if (kvm_vm_is_protected(kvm) && !kvm_pvm_ext_allowed(cap->cap))
+	if (is_protected_kvm_enabled() && !kvm_pkvm_ext_allowed(kvm, cap->cap))
 		return -EINVAL;
 
 	switch (cap->cap) {
@@ -299,7 +299,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 {
 	int r;
 
-	if (kvm && kvm_vm_is_protected(kvm) && !kvm_pvm_ext_allowed(ext))
+	if (is_protected_kvm_enabled() && !kvm_pkvm_ext_allowed(kvm, ext))
 		return 0;
 
 	switch (ext) {
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 7e370e31260d..290e4b46cd32 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -355,21 +355,21 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 
 	set_bit(KVM_ARM_VCPU_PSCI_0_2, allowed_features);
 
-	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_PMU_V3))
+	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PMU_V3))
 		set_bit(KVM_ARM_VCPU_PMU_V3, allowed_features);
 
-	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_PTRAUTH_ADDRESS))
+	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PTRAUTH_ADDRESS))
 		set_bit(KVM_ARM_VCPU_PTRAUTH_ADDRESS, allowed_features);
 
-	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_PTRAUTH_GENERIC))
+	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PTRAUTH_GENERIC))
 		set_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, allowed_features);
 
-	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_SVE)) {
+	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_SVE)) {
 		set_bit(KVM_ARM_VCPU_SVE, allowed_features);
 		kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_GUEST_HAS_SVE);
 	}
 
-	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_MTE)) {
+	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_MTE)) {
 		set_bit(KVM_CAP_ARM_MTE, allowed_features);
 		kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_MTE_ENABLED);
 	}
-- 
2.51.2.1041.gc1ab5b90ca-goog


