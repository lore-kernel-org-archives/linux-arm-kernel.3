Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C330CCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 09:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHIC92+7h1fiHoxXCfgvStA13HLz0Z6KTWisBidHWg8=; b=k2l8fErCWBn3QGK0+aZrb8xdCo
	02GfXonVLULZV3lPSSI5NkUuj72JZQCUSq+/1FZgW4R+x11TF/yHtF+axJCRSnLk84t+K1Kn2qZ3p
	8fJzihCW2YEtPZiTcKQSfbTjMXfO1U5HoF44zQDTFeoel/fAcFxbS2n1IuUDtJYTaOIQhTm8zYiHK
	Vc5vK6mtWz9W/ddFBAMT38a9s+FTW3E0mMBGQnNKnbC29fqNe4dC+bU6tpc74HujYWn2vNbSeILO7
	oik8n19H/v3bVe0iNSVw9I7ObSV95wTCXZsw4OTY/9oXypF6ra665Mzo171WFY9JTEpicd+rmobZp
	AoXAsY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ72M-00000008RwX-12XW;
	Wed, 12 Nov 2025 09:21:10 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ72A-00000008Roe-37bq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 09:20:59 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47754c0796cso4494495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 01:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762939256; x=1763544056; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aHIC92+7h1fiHoxXCfgvStA13HLz0Z6KTWisBidHWg8=;
        b=o2Ng8EcYAikkBKxokMQjC6GX7BUQpLqB53fl7ZdCpjCnQpuZFXMRYVK4rrnW4h1cmz
         A1yNLIz4sn2e6g26iP8SN7n/BqDbpMEqppkIE/vI2H0JSuK25bC5kdBw/3ba7caZr62b
         HbD20bjM74UrzSQj8G129xQvXRk0EVyCaEqEOnIEXvXCYU70cZjKXIE5k6fbNGeWc+pn
         Aw7d+QXzoMaGMKTGxPFH93gTS2fSODEjosbTvFuI+64P+T+T/sMw2KHfyQAcmfOy6Ui6
         5ItgSepdU3gZ5acl7m/tcixSJQ8K2OflxZXAnzTytZQUdiNEsg/yIVn1xPSVs5VeYXS8
         1mCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939256; x=1763544056;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aHIC92+7h1fiHoxXCfgvStA13HLz0Z6KTWisBidHWg8=;
        b=P9xEEFmgeF3ufcyDeJ8X9kIvfZvU2LuHmlpoD7Xjbgk63STOdD+nl07w8k634ADRTp
         kWX1dEqjCcxLAHraMJt+elks1ZKnUlK+RP+8CmNAxb5/sIpUcGn2p1ofb4Ho+x5Zp7ib
         NAe7kGLv9zpq1Uj4V1ahlGKhm/HCjBhAiRK0Wtx/KXIF6/pR7z9piTPCoqDcoSsnQgmj
         00aj0EtFnwtrDo1RGUJIhLugH6zPS1xdl7+LVRf4xr383m2Kaf/CRFJJTWA3DCZ1LV/5
         yvTkQMEQunkHwzntn8N0u/tfdcPIypzn4JKCTBDV42EyRM0jU/XJYhSRY2tx6NCcEe0Y
         rTJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0QAulJYLcbrFXoT8FuBVq4dLJV7NFfuV5FmdmzgTiS9kgQc8x0RlPiES2cZ6x4Y/4f3dYVhU+X4cTbX35ZBPf@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd6EX9k7sT5QCPv19All1yuDP+8brCLCCbPLxHiVbTycn0CVQ+
	2SnFup/t2M0y/EXw77E5lXafYkFBgq64d/IpHU0Sazt9u2DOzeBNDYIjLHSHdG9sB9Iz77eDbFq
	I8w==
X-Google-Smtp-Source: AGHT+IFki9EQn03MZJ4Y3nhV5qb6E34s520PEnpe57GRhND4Zk/Km1oPA5OjMIFLoxgwnt8/4Ps7KmzJfw==
X-Received: from wmdd6.prod.google.com ([2002:a05:600c:a206:b0:477:5559:88d6])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b37:b0:477:5c58:3d42
 with SMTP id 5b1f17b1804b1-4778707d687mr18254815e9.10.1762939256475; Wed, 12
 Nov 2025 01:20:56 -0800 (PST)
Date: Wed, 12 Nov 2025 09:20:48 +0000
In-Reply-To: <20251112092051.1376245-1-tabba@google.com>
Mime-Version: 1.0
References: <20251112092051.1376245-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112092051.1376245-6-tabba@google.com>
Subject: [PATCH v4 5/8] KVM: arm64: Include VM type when checking VM
 capabilities in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_012058_823671_B921C218 
X-CRM114-Status: GOOD (  16.59  )
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
2.51.2.1041.gc1ab5b90ca-goog


