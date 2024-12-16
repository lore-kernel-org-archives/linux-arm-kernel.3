Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4CBE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 10:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9GBryxahmGmSZEhXWCHZRH/qGlu6UtN6W9voNHcA3Y=; b=Kx6vc0GS7+EhJkAAVl4YAsOeo2
	e9mjlWFksFjcXk6elCDFxC1r8b/Co5zWIJJ3nealortNKsM1DGYXLH8EJGFuZTa3+gDvGM9k3s9Ja
	Ln+tDQFCKc47Dvjv9ho0neSiGWMhbJFR9C1NoNqcKegFK1w9Y8HPw7YHy6nvnXHAlrvAGfeoGg1B0
	18XNH31D4KoWYd9tfT4z8p4LSOd+tjy+M7bSvUy8DcCAsa4ucpbBAx6SoKrFDp18uJH+p0mPRM+Jt
	ooMV9GZHKS8fJUDTz6ZrQfasrKjQowR0GxfPQo74nNqkHspOsoPxVGH1qiiuXF0eTCGE8HUYSAWH9
	PjgVnZkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8nA-00000009kvV-3Pog;
	Mon, 16 Dec 2024 10:57:36 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8gx-00000009jxJ-1bfs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:51:12 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43631d8d9c7so13791955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 02:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734346269; x=1734951069; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C9GBryxahmGmSZEhXWCHZRH/qGlu6UtN6W9voNHcA3Y=;
        b=EPsaP9HodLEEEdAg5Abyno7HZXVaF+vAKU0dBhJ3hLK6+GzKt56Caw8mcUDbtauUS2
         5EaR88gk4xUNjxHPD+QqCv4PdEXpOX5hW+8TAJn79KXpZ04ks6bf7OxiuanFhtl/t1EB
         BVx/3FbhVKYE+fdYBbsZNmsAf9gAlvRwlQVNc3VnzRPGTtaGd6kem/ptYEo6Vvomq8c/
         CerhKehIa29G9y6GC6+W8GigYewlcA+o181bLglH3Y4GaxH+8KPHvPQud13Qe6igLVA/
         ptZjV2/amOgvtyNkxZVhjgsE2UpaFlEnXTYrUaJ2hycWcLDgHkQyJdGNURpFX1tO/MVu
         Y7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346269; x=1734951069;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C9GBryxahmGmSZEhXWCHZRH/qGlu6UtN6W9voNHcA3Y=;
        b=YS1oePLP7a03FMoiBPuiDZPnduKCs0nov8FF3lKXLTB/U14pdXuHoB6+kv8ub5pgsT
         a6v7WJJMgpiYRZJ5/Zs73UOlpol2Xl17KWx1GdFCsGbYklklUKX/lmwo5G4xd4wEJOvS
         vH40vOwIkZdMOa7xD+3mUngxwWXImx+B7KWSRVlZ6LSgPd4Y3q5iO6PjlDnqZOs7TXQd
         P2DOZb8Q4bKQePWV5fiwwpC6zR9DZ7ss84oBDHNFoVf1pd20kSnmn3dVJmE8AB0FcVZu
         6E+xu1lAQwEX6DZhFeEcDVSM51lxuQNP7rLggrKX4AqV81y52Q9AIwIPk+LN3RRg7SK/
         k5kg==
X-Forwarded-Encrypted: i=1; AJvYcCXIqRyCqJ2lKw41vEwKh8RkB1Vw5hUjpul2cNjLdnUkiudHHxliJgwnBQ46y+xBmVZGVSKXZWdrp3ha0C5x6Sn/@lists.infradead.org
X-Gm-Message-State: AOJu0YzCH2I5JtDCFN7K+N6iLAIAONcCrRbHluh6VmS/i7HjZAwEjafO
	4jDE4B2dKBA2QAcZpcWVYthz7A/bN3ckzud2kqomQcPboE2G0twFrIxrM58YDlepRLmvjrk0zg=
	=
X-Google-Smtp-Source: AGHT+IHPZL8XVDqNOwgL7tTd/K+CfTsG1V6K4q53OJuErIEaHTfWnYIPmNKRWoQw/rWlX6rTWd9jy0e+5w==
X-Received: from wmph6.prod.google.com ([2002:a05:600c:4986:b0:434:a2c3:d51b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:524c:b0:434:ffb2:f9cf
 with SMTP id 5b1f17b1804b1-4362b16b28bmr98987585e9.14.1734346269330; Mon, 16
 Dec 2024 02:51:09 -0800 (PST)
Date: Mon, 16 Dec 2024 10:50:45 +0000
In-Reply-To: <20241216105057.579031-1-tabba@google.com>
Mime-Version: 1.0
References: <20241216105057.579031-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216105057.579031-6-tabba@google.com>
Subject: [PATCH v5 05/17] KVM: arm64: Use KVM extension checks for allowed
 protected VM capabilities
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_025111_419825_3E773A5D 
X-CRM114-Status: GOOD (  14.35  )
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
 arch/arm64/kvm/hyp/nvhe/pkvm.c    | 24 ++++++------------------
 3 files changed, 33 insertions(+), 45 deletions(-)

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
index d3f67189497d..59ff6aac514c 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -329,32 +329,20 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 
 	bitmap_zero(allowed_features, KVM_VCPU_MAX_FEATURES);
 
-	/*
-	 * For protected VMs, always allow:
-	 * - PSCI v0.2
-	 */
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
2.47.1.613.gc27f4b7a9f-goog


