Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3190D41C20
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 10:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7g9tc9pp77WlckYZf2FBlXkDOOJvDIiD4XWZ7msWSEM=; b=GPlEeBWx6KLCT0OAMPP2G7kN1p
	TZ8DcbMSqlMhH7HzuvkMq+jczECNM7oDA0ygywjkuldwG1MhSZbrSujV51vuNCwt3ktve078qvk47
	NjGV2i0HLa+VB6Me9cEqyxHtKh4OFjN10nvAMj/amALP79+bXTvuRkH/brZSjijrsAZ1JRsPcQ8Sl
	saPdiL4bihnFNe4N5d4zGVaoBOmdkYlBGNbCypMQByHUynbT3pNrdzJuPhVIGDNsEMNuMwQd5JIRT
	4veF17ZdtrW39TuPY7NL6oFz4Q2to26xQX04250gSeqC3IrRUCtHFl2PJF3jmrYx338XUEpQe53K6
	nOSuLg1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCe-0000000GUtN-46An;
	Thu, 11 Dec 2025 10:47:20 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeCa-0000000GUp8-3ni2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 10:47:17 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-42e2d6d13d1so385408f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 02:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765450035; x=1766054835; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7g9tc9pp77WlckYZf2FBlXkDOOJvDIiD4XWZ7msWSEM=;
        b=Rs46JMpI20zKmlqvd7ycRONFn79t2ww+GJRRzgN3w0QkL6/K547Z1d5WKgTx+Fk6Vu
         3EQXGyLzep+lJSimqYNxtuBC4SC2Cmz5WUFzW79MRgbiKisivkO2Em8AC6dvtdeLNgaF
         ZF+yehSJhOk6P0FmaeY2GwYMAhALeifQxqkUbUb5F7fWO3T6B5vETRovfEqVXB8mAS4z
         vz6Xv8IJd4Y8rOiECpKNfH1bh9gOuFbaIXmCisrHdq/DIcAVQQUU2gkGalUddZm5Gf0l
         Q2N5Bx0sgNmeaIcBUvJXmFyJoJFgdBDd7JC1HGr+ziq5bk5QXkR+YsvC90IXu308S/PI
         HQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765450035; x=1766054835;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7g9tc9pp77WlckYZf2FBlXkDOOJvDIiD4XWZ7msWSEM=;
        b=qeHD9rU2MHt82SK12HGG7M9FezBVOb9MfycqxP5njIC+77tgeFEz/POVOX6EtZ5qig
         ds1S8eqhRYKjgHXlQs5M41gv17a61FBsRzKIhAY1EZqPXQf7fpPtU2ZuEovB1ocgKeYN
         INQ4QqiQy6IbTCruTfDBnhQTb2N4znRYSIoi8PVxzh/n0YSqhT07o+uKaku2g/dwgSIr
         YY6g++G7XUKSInv8mg5oy0R5jh4Pz7aOxw/0ys9fZRmn7x9xIPggbHvaTwcjxhFWTUH4
         PnNc9comCb1kL87pKv5Rqk7D+Mi+F2kv1hyTKRmheRnczI7YXmMeqTIEC319RdKWk7RR
         bG4g==
X-Forwarded-Encrypted: i=1; AJvYcCUTaGF/G4PPPFCeyvegiePnx3z6xvRJddqoohXNxX/3r6e5OELv+tm/mjuwX+MmBTXHBvwJzcXx0MweIZKEiYSO@lists.infradead.org
X-Gm-Message-State: AOJu0YzN1tYc9SBgCmQQQKQNCWqVqRxH5R2+3cXxWbfO+GYHZNSQAf3O
	1s2+AqSR0YtIjiJwkTU2ljLhA+yRhfNZO2M4/EPxdUUm+Mej9JytdaEWsMr0rPWeXwrJbk/dxbX
	tYQ==
X-Google-Smtp-Source: AGHT+IG703o4qZLb6Vo8SzMBijudOudloOFbOISpm/Ryn8VPTSIuNK95aLbzFzJErHYHZF6cYYR3o3Jr6Q==
X-Received: from wrsz6.prod.google.com ([2002:a5d:4c86:0:b0:42b:5eaf:191d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2503:b0:42b:4081:ccea
 with SMTP id ffacd0b85a97d-42fa3b0fbc0mr6051865f8f.35.1765450035041; Thu, 11
 Dec 2025 02:47:15 -0800 (PST)
Date: Thu, 11 Dec 2025 10:47:05 +0000
In-Reply-To: <20251211104710.151771-1-tabba@google.com>
Mime-Version: 1.0
References: <20251211104710.151771-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211104710.151771-6-tabba@google.com>
Subject: [PATCH v6 5/9] KVM: arm64: Include VM type when checking VM
 capabilities in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_024716_957962_76C1C5C7 
X-CRM114-Status: GOOD (  16.06  )
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

Certain features and capabilities are restricted in protected mode. Most
of these features are restricted only for protected VMs, but some
are restricted for ALL VMs in protected mode.

Extend the pKVM capability check to pass the VM (kvm), and use that when
determining supported features.

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
index 052bf0d4d0b0..e4936cb9c8c3 100644
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
2.52.0.223.gf5cc29aaa4-goog


