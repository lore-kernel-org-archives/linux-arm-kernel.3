Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7C0D63926
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 10:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kRQ3NfjIG6Bs79ygogj1t8Kc3423PzxH4sJj7NjZHU=; b=RLHV8DZc7Kr8FJIGH4SPk/nEbX
	lxXFiYcTmG1VSleZuHQpBKxwKYBUNQywZPGKLgG1Z0FvsXhKLiIaf5KHJv3Kzy1wkH+nFYpKb7xXs
	nhGjOHPhCsQDXfIwbvoqRLCXnNsW0rklUIQJgiLdfYyEArb1XqJnw0AQqJEzZtgBHPDctugGjZtPw
	meJoUFqnXa5l6m68RduzrYD4SqdalULJuAUkHTVbGKVRrRkbwD1DAPQaz9nBamXYbd+Jdvk4KaOZx
	c/LqmllUnfEKRtJSomy8E+z8/8TyC1Q9lneYWpu2NgNeBmimT9VNOqNL2y/85lY8iLb1aaG8erGZq
	bbFAxEPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiP7-0000000F7Ku-1Ayl;
	Wed, 20 Nov 2024 10:57:49 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiKZ-0000000F6Qz-40v9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 10:53:09 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e3826e5c0c0so3541024276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 02:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732099986; x=1732704786; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+kRQ3NfjIG6Bs79ygogj1t8Kc3423PzxH4sJj7NjZHU=;
        b=Wuk91CyAodJx5DO61jmP+NcZrPgl7jvhWOs8xsvZLUsN671DKsuFtptdD9ggZZBqMj
         0r3hM7ozgup2Nxf/YmgOsqnnKfHXublYD7ci9ltIMCE8sdrd04vxQaxS3sjPqTvJVQIJ
         hj77XA4SXJ8GDD4LRttb6KdIz23uGdZY1LXEeZ+kjrYWM03PAicdq2uhJXqKnAfWVRxZ
         od0pCMeGMJYZ5Szx2BzYI7WVNZHGy93wOTESW/9/4ads6rdzvV7Xsn7ZBAy/liqaTAZZ
         ko4yqY2/pRt033lt1GA9FctZi00Oe0MfFn65229LLJR+SSJddOFWszUKxf1qeoYvEGlJ
         IvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732099986; x=1732704786;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+kRQ3NfjIG6Bs79ygogj1t8Kc3423PzxH4sJj7NjZHU=;
        b=PVqnDD2revGdZtlL2x3oJnWzhxRkjWZjbnR22Pogerr8e0WzDvHYMVu7+4AwEzM/Es
         5vFwMqqbLCTDmYGi8TTDtLlbA8aQQBbD8+hbAHgFlOxe/Z+bnINqCYAfxW32ngxzWSZd
         bspw9MvU5R2W18XOi3Qx2bTfhiI39zx0hEB1g9nM9FzpU/U/hU1jJ9EAAohx+n5Db4X6
         hF1Gl/2ncvDEla2Ma35FbDreEUIgazLN3LADqh9sD7MIED4v7C/Rr0TNnpvh/WIFfcE2
         VBLhftlvsXuQYYOzETPzNQ30sMu6PeZovkgkPc5PFSU2/tEZFJUGYVA551ii7kDPJx+V
         cP7g==
X-Forwarded-Encrypted: i=1; AJvYcCX5FxSkHnZpdtjSM6nmwggZ9nRHilEQNdfXnrnM1nJmBTYTev5lfs6yG2XlruSvf4gOWBV/EkryCzxp87XzTt7n@lists.infradead.org
X-Gm-Message-State: AOJu0YwhXJ7juCGCc36UkDAIGV3KazodvMZrCIHSc7Tx5lH4rLs1+Ghb
	eJNsy2m1RHWHcXAKr2eBT5PDY02GTH1b8ykFjUK5JpldoODmrHxdqndzl2jUx3pa7BoQWOWAvw=
	=
X-Google-Smtp-Source: AGHT+IHapSdLMD1TCvxruDtKv7QaVyot+JGorzkSR7TVaRWZsbecXQby/LtTC8b5CQRmbtQvzTdmdWe/YA==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a25:b21e:0:b0:e2e:2cba:ac1f with SMTP id
 3f1490d57ef6-e38cb5fbce5mr1513276.6.1732099986055; Wed, 20 Nov 2024 02:53:06
 -0800 (PST)
Date: Wed, 20 Nov 2024 10:52:46 +0000
In-Reply-To: <20241120105254.2842020-1-tabba@google.com>
Mime-Version: 1.0
References: <20241120105254.2842020-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241120105254.2842020-5-tabba@google.com>
Subject: [PATCH v1 04/12] KVM: arm64: Use KVM extension checks for allowed
 protected VM capabilities
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_025307_994748_6C74335F 
X-CRM114-Status: GOOD (  14.74  )
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


