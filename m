Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7554D78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kRQ3NfjIG6Bs79ygogj1t8Kc3423PzxH4sJj7NjZHU=; b=EGzqKIqorNNwjKmtdjDxFijNOO
	M5JaXqve4HmAr3tUwc6XSRUIWfNqGeqM0RNTueTihBBoKWcsv6VKRv1Iwdkp+8XCKzJQ/0mXm4RBF
	hP4JQ1cfuWx9Vki8Sqsu9Aljxu7FOx5nzqntNCdPWN0b/lkmHJvLKt2UplnJ+M63qy7FJrAFSWhPi
	FY8SIrafIog3uPe4wrnM6BbTmrTjy+J8eQBkMio8J89B04nCmJni83PU/3qVEFp6bKg+IlwmmnoK7
	RIMs+Cdm9bLgmVc8mEN4o+vO50u8vVlrtZF+5kS7kejLzw/Rg4pxzvTIu83+3sI1OkIVJEK/JRuD1
	2PRnlYtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8p7-00000006kny-3BxS;
	Mon, 02 Dec 2024 15:58:57 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8eP-00000006iSX-3hDT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:47:54 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-385d52591a6so1889671f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733154472; x=1733759272; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+kRQ3NfjIG6Bs79ygogj1t8Kc3423PzxH4sJj7NjZHU=;
        b=U7mD1W+S/YUE72QXalgU+A4kE620tU3jXCmfkGqNCUxdt3qKMMKhPNuhTyZLa+HaTb
         m4wIRmKG9h4ouHWXv4Ekahj4RhdxYkZ2yg8PLKBoe0LkblcYKB68w3o6uOLLdmByKsdd
         dxY9FZ1ugz7aJmI0Qh5vfCFbroCpxzb7pb20dFLcKqmMcyUPhws8SkzSUTtdYMdZwH81
         gIkMeNHwvqmSHMDSCY4TcQH1NaWowdb/2yDcpkTBDij2UYt5gKhzYLAuh6/39Jmr8Jf0
         1f3Eul9aRBLSGE1QusDSoZmtO5aNTTb3ty/CKO0IoF4o52QgFPuACEtP7dOFA9rZHjHP
         gpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154472; x=1733759272;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+kRQ3NfjIG6Bs79ygogj1t8Kc3423PzxH4sJj7NjZHU=;
        b=FSgw8zKZk6v1qzkYaO9ncr8IBpc9O5CCOf9MlTEZHfsBH2FbjK8YMgF1Qx529eSID9
         spU3YwJNAC7hCYz5KeNUI6ez32PKxIQkMZeb+GZiMGz+3FbErgg3btJMnx1RYhH5Wjib
         zzAF7JvfZtfjgw0SRMlXAd+cJE5vZ0EpJS45Q4NF0179x7pDkiHPUQnaApRdiZT+bt+I
         BWb+FtP6CP4ZV/W20HESkBlkZYfT7V/Uu7bpQ+VLkR9Kk8CyYPYBL/xYK6Z6rLGp69rl
         TZXpsNDVn/cEkP342OUMgrse9oY2JjAbIkznJvunds+8LpnAT2yk+bWuuDQQYH/4fDKd
         EWXw==
X-Forwarded-Encrypted: i=1; AJvYcCUmCvRnCwFVA5niJEKS5WW/GL4cnqcR0L7sXcB8tmfUftp3pFXQXFQhaERknpiXmCQGlS/OzFzI9aKW0I4oBKQZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxBDFQAudsrAQiCaDF1Wk0sz8A63p427jN6Kyxf9fMEj+/j3k3d
	GLEzGJHMIKFSLfwsfVPAyjaUhpntH2peI0L6epVnaSKt1Tz3RXb7aXn6pXTBAs2U9QM+VHNQUA=
	=
X-Google-Smtp-Source: AGHT+IGIbBiGROzZxhfhrgzxly8aL5HG7mv2gVUKDTXAI4mdZ3DqmJA+jiufZDnf34MfuCMPaai4NjpH5A==
X-Received: from wmfu3.prod.google.com ([2002:a05:600c:1383:b0:434:b9be:c3e9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1f89:b0:385:dc45:ea26
 with SMTP id ffacd0b85a97d-385dc45f392mr13854189f8f.12.1733154472024; Mon, 02
 Dec 2024 07:47:52 -0800 (PST)
Date: Mon,  2 Dec 2024 15:47:31 +0000
In-Reply-To: <20241202154742.3611749-1-tabba@google.com>
Mime-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241202154742.3611749-5-tabba@google.com>
Subject: [PATCH v4 04/14] KVM: arm64: Use KVM extension checks for allowed
 protected VM capabilities
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074753_919039_C69D1979 
X-CRM114-Status: GOOD (  14.88  )
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


