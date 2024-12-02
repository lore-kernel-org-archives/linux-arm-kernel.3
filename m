Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADC8D78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6oEF7Jaaiv1EnitfNF1OA2AYcUqORyrnF5e9l/8H8I=; b=GaLlkkjAvFPHdte4iXDXv7LIcP
	pNslHwiATHtyDwnStaEx7UZR89se+ZeA8vM5iLFgNqsEsSGWnwM2NaLKf79wlMOTTjCcnwtvvCeWP
	ymPWkA2UYDIaSZE1vYXorcIGlAUkumZCGo0qw5lK1IVi6erF5QMsnQv9dWIZvHdjTo7VMgLWvtq/y
	x+v3XgqNtA+QVqUE4diUMort0LptgHVoifr0sCyu/zr6tjIf5CimvhZ/qYrEGRPvrlYNtD3PNgiQS
	SLGfsAmCl8+6Za5ePHWQpDCRpyjMNF67CqsMDne/rK24T4NCTQmkvAr4gN06zURlSL7o75mW06Nan
	ELbm16KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8mE-00000006kEs-3OcN;
	Mon, 02 Dec 2024 15:55:58 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8eK-00000006iQP-0vKj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:47:49 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-434941aa9c2so24901185e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733154466; x=1733759266; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E6oEF7Jaaiv1EnitfNF1OA2AYcUqORyrnF5e9l/8H8I=;
        b=fuJt3S3phS6jbS8QTsEKZrhcjE/Ts83eWpz7OfLSb3denSzabahki9SKI//x3TWxqF
         vggXXnFDxUZYogFSGBvq9704VWBSem4lyYudm6VB55mbDMHPLhALXl5xzUcXzrWc4Mrh
         EZsEaajhrvE+RXM/pX4mkYoZPAxEQX0kEeE5ZEGgEMYLvo9LE+cGSzzxDpeMfbcNMD+e
         V8cAUsnGXYiG21yiO+NkWjgPHiXqnvCXPKa+CyV5nCd8wlpn+JsE6GWP/tWxgDsSYOHw
         sU9/3pJhWSObLyU80muoZH/l8KABC/q4ZVN5+kXENgc+nCieNkGDnIyebZmcdhODbk/I
         OxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154466; x=1733759266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6oEF7Jaaiv1EnitfNF1OA2AYcUqORyrnF5e9l/8H8I=;
        b=V4RyVKv5Ygd6zJ4nHkQ6QwsXosfOqSHWvZzrsR1DQFBhJOWN8Q9jR8Z7JqPplPGfQ+
         hlguvXfF4nhnOrYO2nGdRozAEs6tiJTLHY6coLSAhjzWlr5iIVE+JUjLqEKtGt5jWuXs
         BFrZaVKjHHFR1LGW3SunlNoCSMqwPj7NBGHj+Dcf+rFNDsI7zfyy0BvCrwSCLnSfhvYY
         4JOjDtn5FGdm/UvXWMo+y8wk0PzE+p1MImtuvNBNWv5khvtnBAE5VWSOLtzn1+ahsg4S
         yBXgMCY5yL9LEOcodCnzfpzgPJEeNSHYG4tFTMM2ZXO8JZ8I5kgKVzPqiByBpdYdbS7Y
         DHfA==
X-Forwarded-Encrypted: i=1; AJvYcCWi7sIM5FrnMXW1NQfgZyGZv7zGxthakhHajKHLtx1UyZ0tWlSrK23yudS0FR2lg4/6tqFzM+BmofNMia6zNrny@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8FsqsCtiApP4gb9ONkKzLn5ofZl9UX0S7Fv+Env3WMKNmrGIv
	fnBre/vzShke+kNZohhnJMFnn5fkFlSRgip6bcune+qOh1sqOkgOQWhqIBLcULyIGp0VoPFFlg=
	=
X-Google-Smtp-Source: AGHT+IGx1Gm1TGibmbGetWLRqPiLavb66ky1HG079CGxxvpUIJc/PcWo4Ryn5pwU+NSezOHgFqPttHZURQ==
X-Received: from wmz16.prod.google.com ([2002:a05:600c:6b70:b0:434:a0f9:be9e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c18:b0:431:6153:a258
 with SMTP id 5b1f17b1804b1-434a9dc3dc3mr226840565e9.13.1733154466043; Mon, 02
 Dec 2024 07:47:46 -0800 (PST)
Date: Mon,  2 Dec 2024 15:47:28 +0000
In-Reply-To: <20241202154742.3611749-1-tabba@google.com>
Mime-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241202154742.3611749-2-tabba@google.com>
Subject: [PATCH v4 01/14] KVM: arm64: Consolidate allowed and restricted VM
 feature checks
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074748_261133_8F32241B 
X-CRM114-Status: GOOD (  20.26  )
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


