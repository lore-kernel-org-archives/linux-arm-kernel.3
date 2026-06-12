Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF69CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXGuzfNsHuVFTTiBdUfpVNe6SVwR2WJsAlgBZBabf/Q=; b=20SMpEDFdY7jjGrf0osvPfECvL
	upfnhyoXMvqGgf4od+2JRO8lbZBXIBCvR+r3wYJY18uIiQDWvhH9T0BbRPvrV7c0axKpes12IiCXU
	GcHA/vc2jofqaqCDjuiQClkGV+JFaCeBBtcBdYaNyTqI0Dwv0eQ/Te4A0SFiwnqU/c8ms3AjAZ2rL
	BkR7bCWLR4ThHZfTzfVCF7CNd2DJaOm85ntVkDbIUwRw2AGEfZqp5F4TM3/42qxsrWmdl69nY3Cyo
	BPGnz7yQ20CWcHjYUJ4a2MgasLFoKBHNWMKfHNuTZBdvVJ4Nu9ASXOsllwAnAgHr5F6c/an366B4F
	u0N3+09A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrj-0000000AR3v-20gx;
	Fri, 12 Jun 2026 06:59:43 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrb-0000000AQwP-3CTU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 06:59:37 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-45f3d008865so488919f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 23:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781247573; x=1781852373; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qXGuzfNsHuVFTTiBdUfpVNe6SVwR2WJsAlgBZBabf/Q=;
        b=E8Jv5w2nXvkxJu97bhMFAdimOaPTerIsVZCAWYEgFI6EoedlOUZ2WQTlm8FlUPOWc9
         x79bCGaTJFhCab0mdzzOnATa0wzFhPF4WmdGP/LLnLv8pZ6eVSbxevvbElHnvA+cSOvu
         plSqUKobg1Gv4BTXTF3tElB++ELDWMxRgAKaRPvCXbizstrDd4Nt8w9NuIwgFq8pWRxa
         dZfPaMI6vjtvGTSAvBWGUW04VFpGDQ604+LxZ3J3GHuIl9sx5Yrioz2hx9shokrb9Uc6
         jQWeMYeCqaAtuPf5Nr3uMi6H49tvaJm3TqJzRG3z/Sr70rLvgB9vzSQB4h9N6ZmfQ6d/
         EOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247573; x=1781852373;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXGuzfNsHuVFTTiBdUfpVNe6SVwR2WJsAlgBZBabf/Q=;
        b=QqqfRYIoBI+bqmx6RdO3b+2GpH/mg80Bcqn7qMi++674r/Xj9BCaTv72dvfokqKjfT
         2Pubhy+HmX3dsdiT6wTvZ1gA1d2YI+EAKF3tbn7SNrwX4qk3KpMv+dcCC1Znu9n0txv6
         qDMBlv4OFw3LbyZ/CtveLHCIx86iBvZrcD30+CP8QAotYO9O7fKAyTti8Ter0nWhM2C/
         njGLyxAiqN9dz0TgMbedKrU2I39A5woeFr2pWRgBhhmc6upB1sGwrJA3tJnL5Q/i7yGV
         3xyXVHXnVlrqt0JbwCZSx6rzyKy/reacRImMwUj/uWSF9PPH8DSlgXDUAW8Q/GhFmi5T
         mltw==
X-Forwarded-Encrypted: i=1; AFNElJ8slEDIT9jjrZtJvGiZxDtxyq9FSyfm6HPuic/Xv3xK7bfQzlWHdGwTylha8gMGWsD3y5EqfYFlNz9P1M3qfsKK@lists.infradead.org
X-Gm-Message-State: AOJu0YzlICFzHUw7p18wUswNAE5WghibLdKrowgPJbRdYsxNRvzqOqow
	IU53qILG07dw7DKtjhEilrHWSYxfVaLi+EPbUzUzn3sQQdrREWzchcJGYNgcyUoZmzTTR4hkcSb
	zAg==
X-Received: from wrmd12.prod.google.com ([2002:adf:e88c:0:b0:460:2d58:8588])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4709:b0:460:602f:85ac
 with SMTP id ffacd0b85a97d-4606cae532fmr1906945f8f.0.1781247572720; Thu, 11
 Jun 2026 23:59:32 -0700 (PDT)
Date: Fri, 12 Jun 2026 07:59:20 +0100
In-Reply-To: <20260612065925.755562-1-tabba@google.com>
Mime-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612065925.755562-7-tabba@google.com>
Subject: [PATCH v1 06/11] KVM: arm64: Factor out reusable vCPU reset helpers
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Per Larsen <perlarsen@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_235935_843391_8A61386D 
X-CRM114-Status: GOOD (  19.52  )
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

Pull the reusable pieces out of kvm_reset_vcpu(): expose the reset
PSTATE values in kvm_arm.h, and split the core register reset and the
PSCI-driven reset into kvm_reset_vcpu_core() and kvm_reset_vcpu_psci().
A follow-up series reuses these to reset protected vCPUs at EL2.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_arm.h     | 12 ++++++
 arch/arm64/include/asm/kvm_emulate.h | 58 +++++++++++++++++++++++++++
 arch/arm64/kvm/reset.c               | 60 ++--------------------------
 3 files changed, 73 insertions(+), 57 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 3f9233b5a130..aba4ec09acd2 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -348,4 +348,16 @@
 	{ PSR_AA32_MODE_UND,	"32-bit UND" },	\
 	{ PSR_AA32_MODE_SYS,	"32-bit SYS" }
 
+/*
+ * ARMv8 Reset Values
+ */
+#define VCPU_RESET_PSTATE_EL1	(PSR_MODE_EL1h | PSR_A_BIT | PSR_I_BIT | \
+				 PSR_F_BIT | PSR_D_BIT)
+
+#define VCPU_RESET_PSTATE_EL2	(PSR_MODE_EL2h | PSR_A_BIT | PSR_I_BIT | \
+				 PSR_F_BIT | PSR_D_BIT)
+
+#define VCPU_RESET_PSTATE_SVC	(PSR_AA32_MODE_SVC | PSR_AA32_A_BIT | \
+				 PSR_AA32_I_BIT | PSR_AA32_F_BIT)
+
 #endif /* __ARM64_KVM_ARM_H__ */
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index aed9fc0b717b..8436e71c402d 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -704,4 +704,62 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
 			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
 	}
 }
+
+/* Reset a vcpu's core registers. */
+static inline void kvm_reset_vcpu_core(struct kvm_vcpu *vcpu)
+{
+	u32 pstate;
+
+	if (vcpu_el1_is_32bit(vcpu)) {
+		pstate = VCPU_RESET_PSTATE_SVC;
+	} else if (vcpu_has_nv(vcpu)) {
+		pstate = VCPU_RESET_PSTATE_EL2;
+	} else {
+		pstate = VCPU_RESET_PSTATE_EL1;
+	}
+
+	/* Reset core registers */
+	memset(vcpu_gp_regs(vcpu), 0, sizeof(*vcpu_gp_regs(vcpu)));
+	memset(&vcpu->arch.ctxt.fp_regs, 0, sizeof(vcpu->arch.ctxt.fp_regs));
+	vcpu->arch.ctxt.spsr_abt = 0;
+	vcpu->arch.ctxt.spsr_und = 0;
+	vcpu->arch.ctxt.spsr_irq = 0;
+	vcpu->arch.ctxt.spsr_fiq = 0;
+	vcpu_gp_regs(vcpu)->pstate = pstate;
+}
+
+/* PSCI reset handling for a vcpu. */
+static inline void kvm_reset_vcpu_psci(struct kvm_vcpu *vcpu,
+				       struct vcpu_reset_state *reset_state)
+{
+	unsigned long target_pc = reset_state->pc;
+
+	/* Gracefully handle Thumb2 entry point */
+	if (vcpu_mode_is_32bit(vcpu) && (target_pc & 1)) {
+		target_pc &= ~1UL;
+		vcpu_set_thumb(vcpu);
+	}
+
+	/* Propagate caller endianness */
+	if (reset_state->be)
+		kvm_vcpu_set_be(vcpu);
+
+	*vcpu_pc(vcpu) = target_pc;
+
+	/*
+	 * We may come from a state where either a PC update was
+	 * pending (SMC call resulting in PC being increpented to
+	 * skip the SMC) or a pending exception. Make sure we get
+	 * rid of all that, as this cannot be valid out of reset.
+	 *
+	 * Note that clearing the exception mask also clears PC
+	 * updates, but that's an implementation detail, and we
+	 * really want to make it explicit.
+	 */
+	vcpu_clear_flag(vcpu, PENDING_EXCEPTION);
+	vcpu_clear_flag(vcpu, EXCEPT_MASK);
+	vcpu_clear_flag(vcpu, INCREMENT_PC);
+	vcpu_set_reg(vcpu, 0, reset_state->r0);
+}
+
 #endif /* __ARM64_KVM_EMULATE_H__ */
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 60969d90bdd3..e22d0be9e57c 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -34,18 +34,6 @@
 static u32 __ro_after_init kvm_ipa_limit;
 unsigned int __ro_after_init kvm_host_sve_max_vl;
 
-/*
- * ARMv8 Reset Values
- */
-#define VCPU_RESET_PSTATE_EL1	(PSR_MODE_EL1h | PSR_A_BIT | PSR_I_BIT | \
-				 PSR_F_BIT | PSR_D_BIT)
-
-#define VCPU_RESET_PSTATE_EL2	(PSR_MODE_EL2h | PSR_A_BIT | PSR_I_BIT | \
-				 PSR_F_BIT | PSR_D_BIT)
-
-#define VCPU_RESET_PSTATE_SVC	(PSR_AA32_MODE_SVC | PSR_AA32_A_BIT | \
-				 PSR_AA32_I_BIT | PSR_AA32_F_BIT)
-
 unsigned int __ro_after_init kvm_sve_max_vl;
 
 int __init kvm_arm_init_sve(void)
@@ -191,7 +179,6 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_reset_state reset_state;
 	bool loaded;
-	u32 pstate;
 
 	scoped_guard(spinlock, &vcpu->arch.mp_state_lock) {
 		reset_state = vcpu->arch.reset_state;
@@ -210,21 +197,8 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 		kvm_vcpu_reset_sve(vcpu);
 	}
 
-	if (vcpu_el1_is_32bit(vcpu))
-		pstate = VCPU_RESET_PSTATE_SVC;
-	else if (vcpu_has_nv(vcpu))
-		pstate = VCPU_RESET_PSTATE_EL2;
-	else
-		pstate = VCPU_RESET_PSTATE_EL1;
-
 	/* Reset core registers */
-	memset(vcpu_gp_regs(vcpu), 0, sizeof(*vcpu_gp_regs(vcpu)));
-	memset(&vcpu->arch.ctxt.fp_regs, 0, sizeof(vcpu->arch.ctxt.fp_regs));
-	vcpu->arch.ctxt.spsr_abt = 0;
-	vcpu->arch.ctxt.spsr_und = 0;
-	vcpu->arch.ctxt.spsr_irq = 0;
-	vcpu->arch.ctxt.spsr_fiq = 0;
-	vcpu_gp_regs(vcpu)->pstate = pstate;
+	kvm_reset_vcpu_core(vcpu);
 
 	/* Reset system registers */
 	kvm_reset_sys_regs(vcpu);
@@ -233,36 +207,8 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 	 * Additional reset state handling that PSCI may have imposed on us.
 	 * Must be done after all the sys_reg reset.
 	 */
-	if (reset_state.reset) {
-		unsigned long target_pc = reset_state.pc;
-
-		/* Gracefully handle Thumb2 entry point */
-		if (vcpu_mode_is_32bit(vcpu) && (target_pc & 1)) {
-			target_pc &= ~1UL;
-			vcpu_set_thumb(vcpu);
-		}
-
-		/* Propagate caller endianness */
-		if (reset_state.be)
-			kvm_vcpu_set_be(vcpu);
-
-		*vcpu_pc(vcpu) = target_pc;
-
-		/*
-		 * We may come from a state where either a PC update was
-		 * pending (SMC call resulting in PC being increpented to
-		 * skip the SMC) or a pending exception. Make sure we get
-		 * rid of all that, as this cannot be valid out of reset.
-		 *
-		 * Note that clearing the exception mask also clears PC
-		 * updates, but that's an implementation detail, and we
-		 * really want to make it explicit.
-		 */
-		vcpu_clear_flag(vcpu, PENDING_EXCEPTION);
-		vcpu_clear_flag(vcpu, EXCEPT_MASK);
-		vcpu_clear_flag(vcpu, INCREMENT_PC);
-		vcpu_set_reg(vcpu, 0, reset_state.r0);
-	}
+	if (reset_state.reset)
+		kvm_reset_vcpu_psci(vcpu, &reset_state);
 
 	/* Reset timer */
 	kvm_timer_vcpu_reset(vcpu);
-- 
2.54.0.1136.gdb2ca164c4-goog


