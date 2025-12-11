Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D075D41C1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 11:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHedRetF8JCExxbKNzQuXO4B6ElqC9WxHZJNQma7Zow=; b=iDrI+8LT7ngdergfVktAOx77UW
	nYPVy+sSs9rGVdxxtwYXVj1PTpgNFaAbFT+9HUTdAFDdvR/Qz2IWpMshaevjUAVe146wzvmDb1a7n
	BGxJyDbZKJQlDcRvzVnDepxHdgdc0nL4hgj6KcMHwZouN+urIK0GzGd40Uz+kIxiYu/hdw05TMDyo
	HUfIfKAuX6bVzvfGxdogFc7WBFx6NHN1dfCX+jxP+u8cawHqwrC089jvCmCQtxkFNiVPl4UGwsGaK
	RSqkLJlwdJ10mK7D6lbGvXF0616NwevD2kTwc+jU3hg6jy5LqykWBQNACN9WxxowbNllAAVEomUTD
	vrRtwZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTf0J-0000000GYBl-0RLS;
	Thu, 11 Dec 2025 11:38:39 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTf0E-0000000GY8Y-0hlD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 11:38:35 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-42b2c8fb84fso391788f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 03:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765453112; x=1766057912; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gHedRetF8JCExxbKNzQuXO4B6ElqC9WxHZJNQma7Zow=;
        b=BoglqvmpGLgtsswWLaW1YlFRfh5bgjVzpHkbIVMtRjd1PzF6CQOW62ax4DyKnAwxE1
         U6ElpK1hD/9bYGgKg+yFeDJaCDdzBq0r2E2ju1hYSiIMpdUeED3RIXGgAcWSMmdv44Ey
         PYhQUASd/pkXGSs0CO0AqXSfaD8QOTFMK24JMWh8z+y9RhIcty/rM9KGwoBM7jWWXMgU
         xKETfbARvxCnWh3O2Q+UBsqP57O6xzDcYZH0xT+XamjBFtcS/AK2bKFgg/RMYGc48igr
         JRUg2HqLwvIF08369aXVM1mF3/QGTAwfqC8UWmLmh6094yNyenJ16dPq2hfZqmDBUQ6a
         Knxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765453112; x=1766057912;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gHedRetF8JCExxbKNzQuXO4B6ElqC9WxHZJNQma7Zow=;
        b=QGTFgL3Z/02Gqa/VCVy1kQ0eZ7yWB/czX2PfULnT+VkH+N2FJ8j1lB8DO3D4+l6Fpi
         xGJNAer5AC3HjztRpuwVYebDSs9c4KTAkN1Ee79d8TYimfKfMfAmE6XavhSFZ2NyylgR
         LpxKM+4Fwl3S6l18P6ZumLUHRx8Op2sdCYk+nxUfT2MDM7WvXFtrSBtzuH0Y75Kvo1NG
         dQcajEXVou5MUAMIS697/3pcAS2xsEM950lP/eM4l19HYaXsWdx6MIul5J31n/iLxECs
         +bRmoyXKH9NIA6De8b5J0EcVu/n2shqv5DijRBdjB+QvthWNBrdZvvsGmYDMA/kiFiIr
         nzxA==
X-Forwarded-Encrypted: i=1; AJvYcCVIg8iT1kfmELMPbCRfdil4lSsd+jXKOIidRf6t9tcd88ryNDHYoS9DsGFM0/Bkxfv1AYWsy3lRthxQRuBOObyO@lists.infradead.org
X-Gm-Message-State: AOJu0YxvhfjMwrBrMI28kPcptRYgP14EISs+djNFszJxdkgALc4yJSl5
	jl++ungPrH23ScIlto9q9yOPR5U+UIquV4vUl4VeDFEmTQgs7mdrvW6W0BRy9tps1rhTgLPcUNU
	oaQ==
X-Google-Smtp-Source: AGHT+IHj8V7lfV5TT/EjlEumn+FTn7VW7DKux9btH2yvaecHOgsfDCdIPFZnSMgs4R5O36N6Zxfpsp7oew==
X-Received: from wrmq7.prod.google.com ([2002:adf:ea07:0:b0:42c:c2d6:2a1])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:adf:f243:0:b0:42f:a990:96a6
 with SMTP id ffacd0b85a97d-42fa9909750mr2267954f8f.40.1765453111808; Thu, 11
 Dec 2025 03:38:31 -0800 (PST)
Date: Thu, 11 Dec 2025 11:38:26 +0000
In-Reply-To: <20251211113828.370370-1-tabba@google.com>
Mime-Version: 1.0
References: <20251211113828.370370-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211113828.370370-4-tabba@google.com>
Subject: [PATCH v2 3/5] KVM: arm64: Refactor enter_exception64()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_033834_234204_45D50F6D 
X-CRM114-Status: GOOD (  17.75  )
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
2.52.0.223.gf5cc29aaa4-goog


