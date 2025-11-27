Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94084CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NL3nohAUMm3Ry+4eJheW6l7zR4hZI9Xj0bkr+tmysoM=; b=o6uo9K2FxS/V9D0F78VvLICUBP
	gWbMk2wpzaRe3p3nwk/0zx8KQMWg9Md/FoTauS5TYJS3tmle+QC3r+JFHh6NVfmOtNil8I50zthNU
	kA8LXULnbPQKijnxuV5slAY5JzxPCHPuoHvu2v4jQ5TnAZuXrGscTn9/1GX6vto0bqLSpgns51wXs
	FFYZnK3l4npcdl27Vz5PttXOZhVGu7iILy8WNNlbe3+Sj7ENlr5MazKCYLYnd64sw6sTyxOAot3nZ
	F+MPAN7urO5BBI5rxAvyQf20P1CpZ88g0fJrisqt+qi93GObWi/jpOhxw5nP8o6e4kf0GUuzFpkpK
	rxP6JScw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb0w-0000000GXia-3RTN;
	Thu, 27 Nov 2025 12:22:22 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb0q-0000000GXf3-249N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:22:17 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-477bf8c1413so4838535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764246135; x=1764850935; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NL3nohAUMm3Ry+4eJheW6l7zR4hZI9Xj0bkr+tmysoM=;
        b=nWFQvscdC775k/S2V7M5yGohTIaxzYa/BW8Q4NHykGCRUhAD/3jyXluyenU5h5Zyfk
         mchDeMpvzIMOEPE/jdH+Ac63yY/7MEnTa9s5VyrNEnTN2j8G+5LrDJHWVFqV4WSmz/g8
         fSZXc5NQ31jfSNxLYZRz73SG1jP4SQK4bLe3QZ94zxFEzLkhPTSj1lEaGyNcev4hsgqw
         SKWHSHAzcfzcUdmGQY+r17Wa5O1vbtAzZ20R880yOtHBVD9dhH3TyKpydx3cDznLku3/
         2dn7tOmwDsa4hj2Sd9C1vEdcudaK6t8PAl3W7TT5sR2qVEWwrKMTLGQuYyZH7KQGDYiz
         H+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764246135; x=1764850935;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NL3nohAUMm3Ry+4eJheW6l7zR4hZI9Xj0bkr+tmysoM=;
        b=ofTnLAvRO/hievqHsTgquu0MDew2tX+9+y3zg/z2xTabn0y6xUwGkSr5TBJ5qgpjZ5
         cQspg5i9Km6oZv4oNoTrw4jkySUHq1L4TR8RCqvCrUsGDsDQKaSawImD8CyDWYAEJ30c
         /fFNrsCd40aWyeYZ4bFHEFp1A7IYYXSggLZjyNwF582yDbwCLffiKzWMvu4pHNo7cc2C
         Ai48MkDLLvY7JNOhYqYoggfBeTqNa+z+MwDk0Ir+RIi+rGm2MkJr29OKLOnpkFNkV/M/
         30otwFx0U5v9ZD9jThZBw6dLoE6ymjndVdY9Ragw0mZNfOXUdXCkns0IG9x2hT8UNm38
         xRsw==
X-Forwarded-Encrypted: i=1; AJvYcCWx4YcEkG2/cweOwZrbYqcehvQ3cz793G5hH12z4ppwXOSnG10Bng+MHx2LOGSJz2WDKhfN1qB5/BPIOvU/GFb7@lists.infradead.org
X-Gm-Message-State: AOJu0YwleVvG+u44jGxUr6vdRsAl8sj4Tyn4gNDT56bmACh+3tTe5HkZ
	8GC9oR63D9mCO63CxgUD0IOSYEV/qsyboP/cYLy2ErXVIWVzXAP8Zi2NehLllG//aHnWHEzloN6
	eRw==
X-Google-Smtp-Source: AGHT+IHaE1Z60aMUWFE+E56EdAV7D3oDUPE/oBVYsqknsnsuq+E/Bv4NvcbiP0dfbKXnUdKyHt9/uc9ssw==
X-Received: from wmlc9.prod.google.com ([2002:a7b:c849:0:b0:477:76e1:9b4e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:548b:b0:477:6d96:b3c8
 with SMTP id 5b1f17b1804b1-477c01c4c03mr226021975e9.23.1764246134589; Thu, 27
 Nov 2025 04:22:14 -0800 (PST)
Date: Thu, 27 Nov 2025 12:22:08 +0000
In-Reply-To: <20251127122210.4111702-1-tabba@google.com>
Mime-Version: 1.0
References: <20251127122210.4111702-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
Message-ID: <20251127122210.4111702-4-tabba@google.com>
Subject: [PATCH v1 3/5] KVM: arm64: Refactor enter_exception64()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_042216_567129_F104670A 
X-CRM114-Status: GOOD (  17.62  )
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

From: Quentin Perret <qperret@google.com>

To simplify the injection of exceptions into the host in pKVM context,
refactor enter_exception64() to split out the logic for calculating the
exception vector offset and the target CPSR.

Extract two new helper functions:
 - get_except64_offset(): Calculates exception vector offset based on
   current/target exception levels and exception type
 - get_except64_cpsr(): Computes the new CPSR/PSTATE when taking an
   exception

A subsequent patch will use these helpers to inject UNDEF exceptions
into the host when MTE system registers are accessed with MTE disabled.
Extracting the helpers allows that code to reuse the exception entry
logic without duplicating the CPSR and vector offset calculations.

No functional change intended.

Signed-off-by: Quentin Perret <qperret@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h |   5 ++
 arch/arm64/kvm/hyp/exception.c       | 100 ++++++++++++++++-----------
 2 files changed, 63 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index c9eab316398e..c3f04bd5b2a5 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -71,6 +71,11 @@ static inline int kvm_inject_serror(struct kvm_vcpu *vcpu)
 	return kvm_inject_serror_esr(vcpu, ESR_ELx_ISV);
 }
 
+unsigned long get_except64_offset(unsigned long psr, unsigned long target_mode,
+				  enum exception_type type);
+unsigned long get_except64_cpsr(unsigned long old, bool has_mte,
+				unsigned long sctlr, unsigned long mode);
+
 void kvm_vcpu_wfi(struct kvm_vcpu *vcpu);
 
 void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
index bef40ddb16db..d3bcda665612 100644
--- a/arch/arm64/kvm/hyp/exception.c
+++ b/arch/arm64/kvm/hyp/exception.c
@@ -65,12 +65,25 @@ static void __vcpu_write_spsr_und(struct kvm_vcpu *vcpu, u64 val)
 		vcpu->arch.ctxt.spsr_und = val;
 }
 
+unsigned long get_except64_offset(unsigned long psr, unsigned long target_mode,
+				  enum exception_type type)
+{
+	u64 mode = psr & (PSR_MODE_MASK | PSR_MODE32_BIT);
+	u64 exc_offset;
+
+	if      (mode == target_mode)
+		exc_offset = CURRENT_EL_SP_ELx_VECTOR;
+	else if ((mode | PSR_MODE_THREAD_BIT) == target_mode)
+		exc_offset = CURRENT_EL_SP_EL0_VECTOR;
+	else if (!(mode & PSR_MODE32_BIT))
+		exc_offset = LOWER_EL_AArch64_VECTOR;
+	else
+		exc_offset = LOWER_EL_AArch32_VECTOR;
+
+	return exc_offset + type;
+}
+
 /*
- * This performs the exception entry at a given EL (@target_mode), stashing PC
- * and PSTATE into ELR and SPSR respectively, and compute the new PC/PSTATE.
- * The EL passed to this function *must* be a non-secure, privileged mode with
- * bit 0 being set (PSTATE.SP == 1).
- *
  * When an exception is taken, most PSTATE fields are left unchanged in the
  * handler. However, some are explicitly overridden (e.g. M[4:0]). Luckily all
  * of the inherited bits have the same position in the AArch64/AArch32 SPSR_ELx
@@ -82,50 +95,17 @@ static void __vcpu_write_spsr_und(struct kvm_vcpu *vcpu, u64 val)
  * Here we manipulate the fields in order of the AArch64 SPSR_ELx layout, from
  * MSB to LSB.
  */
-static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
-			      enum exception_type type)
+unsigned long get_except64_cpsr(unsigned long old, bool has_mte,
+				unsigned long sctlr, unsigned long target_mode)
 {
-	unsigned long sctlr, vbar, old, new, mode;
-	u64 exc_offset;
-
-	mode = *vcpu_cpsr(vcpu) & (PSR_MODE_MASK | PSR_MODE32_BIT);
-
-	if      (mode == target_mode)
-		exc_offset = CURRENT_EL_SP_ELx_VECTOR;
-	else if ((mode | PSR_MODE_THREAD_BIT) == target_mode)
-		exc_offset = CURRENT_EL_SP_EL0_VECTOR;
-	else if (!(mode & PSR_MODE32_BIT))
-		exc_offset = LOWER_EL_AArch64_VECTOR;
-	else
-		exc_offset = LOWER_EL_AArch32_VECTOR;
-
-	switch (target_mode) {
-	case PSR_MODE_EL1h:
-		vbar = __vcpu_read_sys_reg(vcpu, VBAR_EL1);
-		sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
-		__vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL1);
-		break;
-	case PSR_MODE_EL2h:
-		vbar = __vcpu_read_sys_reg(vcpu, VBAR_EL2);
-		sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL2);
-		__vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL2);
-		break;
-	default:
-		/* Don't do that */
-		BUG();
-	}
-
-	*vcpu_pc(vcpu) = vbar + exc_offset + type;
-
-	old = *vcpu_cpsr(vcpu);
-	new = 0;
+	u64 new = 0;
 
 	new |= (old & PSR_N_BIT);
 	new |= (old & PSR_Z_BIT);
 	new |= (old & PSR_C_BIT);
 	new |= (old & PSR_V_BIT);
 
-	if (kvm_has_mte(kern_hyp_va(vcpu->kvm)))
+	if (has_mte)
 		new |= PSR_TCO_BIT;
 
 	new |= (old & PSR_DIT_BIT);
@@ -161,6 +141,42 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
 
 	new |= target_mode;
 
+	return new;
+}
+
+/*
+ * This performs the exception entry at a given EL (@target_mode), stashing PC
+ * and PSTATE into ELR and SPSR respectively, and compute the new PC/PSTATE.
+ * The EL passed to this function *must* be a non-secure, privileged mode with
+ * bit 0 being set (PSTATE.SP == 1).
+ */
+static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
+			      enum exception_type type)
+{
+	u64 offset = get_except64_offset(*vcpu_cpsr(vcpu), target_mode, type);
+	unsigned long sctlr, vbar, old, new;
+
+	switch (target_mode) {
+	case PSR_MODE_EL1h:
+		vbar = __vcpu_read_sys_reg(vcpu, VBAR_EL1);
+		sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
+		__vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL1);
+		break;
+	case PSR_MODE_EL2h:
+		vbar = __vcpu_read_sys_reg(vcpu, VBAR_EL2);
+		sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL2);
+		__vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL2);
+		break;
+	default:
+		/* Don't do that */
+		BUG();
+	}
+
+	*vcpu_pc(vcpu) = vbar + offset;
+
+	old = *vcpu_cpsr(vcpu);
+	new = get_except64_cpsr(old, kvm_has_mte(kern_hyp_va(vcpu->kvm)), sctlr,
+				target_mode);
 	*vcpu_cpsr(vcpu) = new;
 	__vcpu_write_spsr(vcpu, target_mode, old);
 }
-- 
2.52.0.487.g5c8c507ade-goog


