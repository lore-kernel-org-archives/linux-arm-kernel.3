Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B586CED606
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3DY/r7vs4MdPYVHCLsSRZJ7Jsv5MwDNd3VXG3UBq7M=; b=tAs+mK2jY0srMAtGdW/pgiKknd
	UYlgDGwpZevv7l8bba1A9scCDjC9Lzs3DTZTZLH0rsR6IjMYBT9985pPNqZmmJQfzsv00cNQjw0Sd
	/UNk/qf7tA1YikecvDc+JdPwi6yep5rsGjKrOZ507y40FNvHviF4vNA6uFWzdygfmS3e7CMMpZId9
	a/MyNZOyY5OCWckEwnGBKvjEQOVLe5GMde312HuCFPo4qACOqos4AcgJDUTR1YrjsuxFI5tq/4p0i
	O0lvtEFJbHNd+B6/LTtTMi4pQ7lLMQvM8WtEt+ai1MdmCgsFMZiXZl9k/K2smgIEG2c3QfzjwrpBT
	Lcsf0VuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6L-00000000Fm6-0RcU;
	Tue, 18 Nov 2025 10:38:21 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6E-00000000FhN-48nS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:38:16 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-42b570776a3so2523698f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763462292; x=1764067092; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3DY/r7vs4MdPYVHCLsSRZJ7Jsv5MwDNd3VXG3UBq7M=;
        b=qL9Iv0z/GcOMnkRBLxzsMJFD7gGD1jQsFOpmZ2Qa2LgoVyOf3CcYH2drRgizlsh9SZ
         OXXQhjT99wfsqfcD1qLeYalL1Ompwxo9kFzAoL0wzcCrlG/KfmkTJ2zYx2T/FOecFwd0
         JVrNEDPpKDUpJJY4Cduz+rB4UWetlP8dIdF6z7fNKQ3xs/nBMsEPggTlVOaX78afFRPC
         lG9WGRoNM3TJ/mglmvxhfB9jYsvRASG1Emf5cs8qLlMYJFYZ3Y0i2H884/UnNfQhUbr2
         mdF0ERKb32OVdLK9mUV4PD4yb4Rx6tb1QPg/nKdpp6ACkFXOgts2QjHlla6nqAoTbIUI
         CSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462292; x=1764067092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V3DY/r7vs4MdPYVHCLsSRZJ7Jsv5MwDNd3VXG3UBq7M=;
        b=XsL3h0cXARSfkhEB+uw5SEW6kBDCUWHTrum5KdAiInfejlDzYRMQWZ9egwYhg6Gc5A
         MCovPLRycENKspLNlGcx9tHTOt3MRV4drtOel9Ha8DI4d/GlBN3+SAFVHr6o6w7uQ8ZW
         HoOTGPcGq6jqZ5tk5rbYWRpCNx6N9VFtAHPMc7qOTMI2bABsOaJ7e0z+Ysnmdi7OHL8d
         clQ/jd0xYM51NyepV0q8fw7rAzJCmSU4+M1oQmA/LqmVzjNVBaZMLfoU2AZlP0oZrKz8
         Xq0YIg91ju09JBNRygqdbbnK4M2xvH6b6ihJodmqu4dyLWDcCMVuU5/3miGgOclWCCNE
         uryA==
X-Forwarded-Encrypted: i=1; AJvYcCX7PHHTaZZ2fEotj7VR2aNdbLeN3LkgAtFprmC5D8U+IcYLPT1jzUCMR/0ktDNWLaz+wqWfzc/IS6wgdhfaKomU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5IC6GEenj3foN5pjGRnU6PIgMRn0+ddPqm5UneZjSkvC3mWDW
	h1snpnJxOS669JZqeQkh4VRbWJxezp/ZkbM01ZxCcx6LC+pK61JPE8/OJPNoD6QtgqRenl8dslW
	D7A==
X-Google-Smtp-Source: AGHT+IEM0HDE+lvs9ScNzQ8shtoujqBquagXe3II1XZ7PNdFFLvsEYqm1nNc2hPRwGYPRVWpbIx2645UEQ==
X-Received: from wrxb9.prod.google.com ([2002:a05:6000:10c9:b0:42b:36e8:75b4])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2910:b0:42b:2b07:8630
 with SMTP id ffacd0b85a97d-42b59374207mr13697323f8f.31.1763462292547; Tue, 18
 Nov 2025 02:38:12 -0800 (PST)
Date: Tue, 18 Nov 2025 10:38:02 +0000
In-Reply-To: <20251118103807.707500-1-tabba@google.com>
Mime-Version: 1.0
References: <20251118103807.707500-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251118103807.707500-6-tabba@google.com>
Subject: [PATCH v5 5/9] KVM: arm64: Include VM type when checking VM
 capabilities in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_023815_043981_3C0A72C6 
X-CRM114-Status: GOOD (  16.24  )
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
index 16d7bf493c18..581dec4b8271 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -351,23 +351,23 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 		return;
 	}
 
-	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_MTE))
+	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_MTE))
 		kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_MTE_ENABLED);
 
 	bitmap_zero(allowed_features, KVM_VCPU_MAX_FEATURES);
 
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
-- 
2.52.0.rc1.455.g30608eb744-goog


