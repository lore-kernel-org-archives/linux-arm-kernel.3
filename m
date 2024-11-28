Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831A2D69104
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 12:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6oEF7Jaaiv1EnitfNF1OA2AYcUqORyrnF5e9l/8H8I=; b=keH6L+EWN54rsgRVaklXtOJwxe
	2wpTx+lyWmgY7U7FE46t8D5h5PdQsEqq11BuEtsom+Q++xVVTRrH53uUaTZfaXghs/NBSXLNMyyB6
	cF1XTVYinMEwutrfrkCesrnpbKsezihEEgCLcOiMDSoCaCKPd/R3kB8Ao6E6f9Px+oWFxi6oGmZ/T
	cX6BaWJgRFDRvp+GcoB3DlioA96m/Cmf6LXh2O3Gb+daq319K3rTmKM8aSY7jN5pvCbRAhLsPPoZo
	LuACwCltqEBq+tcZ3z0nuVKwr1orZlHfCFf0VCkKuSqTpRpbj2NG7fsifDrLyVntObbKjRA8gQ48o
	eJV6Ihug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdln-0000000FVYh-16cq;
	Thu, 28 Nov 2024 12:37:19 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdjs-0000000FVK5-3tu5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 12:35:22 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-434a5ca6a67so5848395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 04:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732797319; x=1733402119; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E6oEF7Jaaiv1EnitfNF1OA2AYcUqORyrnF5e9l/8H8I=;
        b=AeQMFNJoefGvTzpg5lb9syzCAIvznQhPG033aNpVRvjoEMRbhgjyAZ7MfpJ6pA6YAS
         mUdTswAKH8OWqED1GXxFZFCiCC551UBKMTd3CAaYzskjQ2Oobru1zO/DIIBEVx+W4SVt
         sJsXtYESA3/dg3CqbOZYyG8SDKYqIF2cRTTPjeFYwGUyHgsl1xblUYyN9vN3BYPvUYBS
         sIOgmqpl7TRarnDBzfZXZ28grg/EhWSFiqfy9TPoHUdPyRnrV0WFdhy/90Uahhm3a2J7
         yJbkiQ9VbiV0Ahd2ZKq8SHH1FyUqdqoo6iDweL486KaqEuxRZNDpD6yfbp+rGl/IjIIJ
         mB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732797319; x=1733402119;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6oEF7Jaaiv1EnitfNF1OA2AYcUqORyrnF5e9l/8H8I=;
        b=pKqg3IsSlTEEXPKwRdKjhkV63cEGMQD2hSc3ir1Fxn/dEdX0pclGXNJeF+SIuebKRZ
         F7qy449VLfv2UO/CZpqyT2J5wD9SZBOuIJ8WU72TqC81o00tmCOGVs5dIA86ztSoFzro
         RFOFYH8SaVnoynmdqOEBFx/0UaF1HjwFZRxcBLIy44IsmezgQJVHOS998C9dn4wYEjXQ
         ILzGahWwd0EFTA3HIY9yMocIqanKte6NriyPzeJm05PBnYGTKCxM3BRQGpnEfUqD/pkn
         X2o/vlNLIfnmkfeoE/YCT50mChWvzG3jcMisA4DbBZEDIXaJBq4lHbu8MLyH5JSyVQN9
         x5Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUF5fu0netnR5cIfWQtE8PRU11ksZMcvqG0R+ZYmU8DDAFixlZjpDEwb8h9nevb6heIydGRYvWxOzrgunkql9mp@lists.infradead.org
X-Gm-Message-State: AOJu0YyXJ55jwe7JWPdbsqvL2GFARyiATYfP4KEOwiLgjiNQ5HGAQCXJ
	w9nim3oEv0WwFpPNII4hwGAU1QiZnSFYoxyseYlz7COkNBNai+dPQ+haKrnBwY5roPhOOkViTQ=
	=
X-Google-Smtp-Source: AGHT+IHUQvWU3bYA6uf5b8VaWvAvPgXeeEHwKQhoHhRmSvtXwdarSI+MZXJMcp6PKQpdO+P5dkWP0NVYvg==
X-Received: from wmdi9.prod.google.com ([2002:a05:600c:2909:b0:431:1c66:db91])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5253:b0:434:9e1d:7629
 with SMTP id 5b1f17b1804b1-434a9e07911mr55108245e9.33.1732797319070; Thu, 28
 Nov 2024 04:35:19 -0800 (PST)
Date: Thu, 28 Nov 2024 12:35:01 +0000
In-Reply-To: <20241128123515.1709777-1-tabba@google.com>
Mime-Version: 1.0
References: <20241128123515.1709777-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128123515.1709777-2-tabba@google.com>
Subject: [PATCH v3 01/15] KVM: arm64: Consolidate allowed and restricted VM
 feature checks
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_043520_968301_A7D46E2A 
X-CRM114-Status: GOOD (  19.59  )
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

The definitions for features allowed and allowed with
restrictions for protected guests, which are based on feature
registers, were defined and checked for separately, even though
they are handled in the same way. This could result in missing
checks for certain features, e.g., pointer authentication,
causing traps for allowed features.

Consolidate the definitions into one. Use that new definition to
construct the guest view of the feature registers for
consistency.

Fixes: 6c30bfb18d0b ("KVM: arm64: Add handlers for protected VM System Registers")
Reported-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>

---

Note: This patch ends up being a no-op, since none of the changes
in it survive the series. It's included because it makes the rest
of the series flow more smoothly.
---
 .../arm64/kvm/hyp/include/nvhe/fixed_config.h | 55 +++++++------------
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  8 +--
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            |  6 +-
 3 files changed, 26 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h b/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h
index f957890c7e38..d1e59b88ff66 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h
@@ -14,11 +14,8 @@
  * guest virtual machines, depending on the mode KVM is running in and on the
  * type of guest that is running.
  *
- * The ALLOW masks represent a bitmask of feature fields that are allowed
- * without any restrictions as long as they are supported by the system.
- *
- * The RESTRICT_UNSIGNED masks, if present, represent unsigned fields for
- * features that are restricted to support at most the specified feature.
+ * Each field in the masks represents the highest supported *unsigned* value for
+ * the feature, if supported by the system.
  *
  * If a feature field is not present in either, than it is not supported.
  *
@@ -34,16 +31,7 @@
  * - Floating-point and Advanced SIMD
  * - Data Independent Timing
  * - Spectre/Meltdown Mitigation
- */
-#define PVM_ID_AA64PFR0_ALLOW (\
-	ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_FP) | \
-	ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_AdvSIMD) | \
-	ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_DIT) | \
-	ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_CSV2) | \
-	ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_CSV3) \
-	)
-
-/*
+ *
  * Restrict to the following *unsigned* features for protected VMs:
  * - AArch64 guests only (no support for AArch32 guests):
  *	AArch32 adds complexity in trap handling, emulation, condition codes,
@@ -51,7 +39,12 @@
  * - RAS (v1)
  *	Supported by KVM
  */
-#define PVM_ID_AA64PFR0_RESTRICT_UNSIGNED (\
+#define PVM_ID_AA64PFR0_ALLOW (\
+	ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_FP) | \
+	ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_AdvSIMD) | \
+	ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_DIT) | \
+	ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_CSV2) | \
+	ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_CSV3) | \
 	SYS_FIELD_PREP_ENUM(ID_AA64PFR0_EL1, EL0, IMP) | \
 	SYS_FIELD_PREP_ENUM(ID_AA64PFR0_EL1, EL1, IMP) | \
 	SYS_FIELD_PREP_ENUM(ID_AA64PFR0_EL1, EL2, IMP) | \
@@ -77,20 +70,16 @@
  * - Distinction between Secure and Non-secure Memory
  * - Mixed-endian at EL0 only
  * - Non-context synchronizing exception entry and exit
+ *
+ * Restrict to the following *unsigned* features for protected VMs:
+ * - 40-bit IPA
+ * - 16-bit ASID
  */
 #define PVM_ID_AA64MMFR0_ALLOW (\
 	ARM64_FEATURE_MASK(ID_AA64MMFR0_EL1_BIGEND) | \
 	ARM64_FEATURE_MASK(ID_AA64MMFR0_EL1_SNSMEM) | \
 	ARM64_FEATURE_MASK(ID_AA64MMFR0_EL1_BIGENDEL0) | \
-	ARM64_FEATURE_MASK(ID_AA64MMFR0_EL1_EXS) \
-	)
-
-/*
- * Restrict to the following *unsigned* features for protected VMs:
- * - 40-bit IPA
- * - 16-bit ASID
- */
-#define PVM_ID_AA64MMFR0_RESTRICT_UNSIGNED (\
+	ARM64_FEATURE_MASK(ID_AA64MMFR0_EL1_EXS) | \
 	FIELD_PREP(ARM64_FEATURE_MASK(ID_AA64MMFR0_EL1_PARANGE), ID_AA64MMFR0_EL1_PARANGE_40) | \
 	FIELD_PREP(ARM64_FEATURE_MASK(ID_AA64MMFR0_EL1_ASIDBITS), ID_AA64MMFR0_EL1_ASIDBITS_16) \
 	)
@@ -185,15 +174,6 @@
 	)
 
 /* Restrict pointer authentication to the basic version. */
-#define PVM_ID_AA64ISAR1_RESTRICT_UNSIGNED (\
-	FIELD_PREP(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_APA), ID_AA64ISAR1_EL1_APA_PAuth) | \
-	FIELD_PREP(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_API), ID_AA64ISAR1_EL1_API_PAuth) \
-	)
-
-#define PVM_ID_AA64ISAR2_RESTRICT_UNSIGNED (\
-	FIELD_PREP(ARM64_FEATURE_MASK(ID_AA64ISAR2_EL1_APA3), ID_AA64ISAR2_EL1_APA3_PAuth) \
-	)
-
 #define PVM_ID_AA64ISAR1_ALLOW (\
 	ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_DPB) | \
 	ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_JSCVT) | \
@@ -206,13 +186,16 @@
 	ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_SPECRES) | \
 	ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_BF16) | \
 	ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_DGH) | \
-	ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_I8MM) \
+	ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_I8MM) | \
+	FIELD_PREP(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_APA), ID_AA64ISAR1_EL1_APA_PAuth) | \
+	FIELD_PREP(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_API), ID_AA64ISAR1_EL1_API_PAuth) \
 	)
 
 #define PVM_ID_AA64ISAR2_ALLOW (\
 	ARM64_FEATURE_MASK(ID_AA64ISAR2_EL1_ATS1A)| \
 	ARM64_FEATURE_MASK(ID_AA64ISAR2_EL1_GPA3) | \
-	ARM64_FEATURE_MASK(ID_AA64ISAR2_EL1_MOPS) \
+	ARM64_FEATURE_MASK(ID_AA64ISAR2_EL1_MOPS) | \
+	FIELD_PREP(ARM64_FEATURE_MASK(ID_AA64ISAR2_EL1_APA3), ID_AA64ISAR2_EL1_APA3_PAuth) \
 	)
 
 u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id);
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 01616c39a810..76a70fee7647 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -36,9 +36,9 @@ static void pvm_init_traps_aa64pfr0(struct kvm_vcpu *vcpu)
 
 	/* Protected KVM does not support AArch32 guests. */
 	BUILD_BUG_ON(FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_EL0),
-		PVM_ID_AA64PFR0_RESTRICT_UNSIGNED) != ID_AA64PFR0_EL1_EL0_IMP);
+		PVM_ID_AA64PFR0_ALLOW) != ID_AA64PFR0_EL1_EL0_IMP);
 	BUILD_BUG_ON(FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_EL1),
-		PVM_ID_AA64PFR0_RESTRICT_UNSIGNED) != ID_AA64PFR0_EL1_EL1_IMP);
+		PVM_ID_AA64PFR0_ALLOW) != ID_AA64PFR0_EL1_EL1_IMP);
 
 	/*
 	 * Linux guests assume support for floating-point and Advanced SIMD. Do
@@ -362,8 +362,8 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_SVE), PVM_ID_AA64PFR0_ALLOW))
 		set_bit(KVM_ARM_VCPU_SVE, allowed_features);
 
-	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_API), PVM_ID_AA64ISAR1_RESTRICT_UNSIGNED) &&
-	    FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_APA), PVM_ID_AA64ISAR1_RESTRICT_UNSIGNED))
+	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_API), PVM_ID_AA64ISAR1_ALLOW) &&
+	    FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_APA), PVM_ID_AA64ISAR1_ALLOW))
 		set_bit(KVM_ARM_VCPU_PTRAUTH_ADDRESS, allowed_features);
 
 	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_GPI), PVM_ID_AA64ISAR1_ALLOW) &&
diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 2860548d4250..59fb2f056177 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -89,7 +89,7 @@ static u64 get_pvm_id_aa64pfr0(const struct kvm_vcpu *vcpu)
 	u64 allow_mask = PVM_ID_AA64PFR0_ALLOW;
 
 	set_mask |= get_restricted_features_unsigned(id_aa64pfr0_el1_sys_val,
-		PVM_ID_AA64PFR0_RESTRICT_UNSIGNED);
+		PVM_ID_AA64PFR0_ALLOW);
 
 	return (id_aa64pfr0_el1_sys_val & allow_mask) | set_mask;
 }
@@ -189,7 +189,7 @@ static u64 get_pvm_id_aa64mmfr0(const struct kvm_vcpu *vcpu)
 	u64 set_mask;
 
 	set_mask = get_restricted_features_unsigned(id_aa64mmfr0_el1_sys_val,
-		PVM_ID_AA64MMFR0_RESTRICT_UNSIGNED);
+		PVM_ID_AA64MMFR0_ALLOW);
 
 	return (id_aa64mmfr0_el1_sys_val & PVM_ID_AA64MMFR0_ALLOW) | set_mask;
 }
@@ -276,7 +276,7 @@ static bool pvm_access_id_aarch32(struct kvm_vcpu *vcpu,
 	 * of AArch32 feature id registers.
 	 */
 	BUILD_BUG_ON(FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_EL1),
-		     PVM_ID_AA64PFR0_RESTRICT_UNSIGNED) > ID_AA64PFR0_EL1_EL1_IMP);
+		     PVM_ID_AA64PFR0_ALLOW) > ID_AA64PFR0_EL1_EL1_IMP);
 
 	return pvm_access_raz_wi(vcpu, p, r);
 }
-- 
2.47.0.338.g60cca15819-goog


