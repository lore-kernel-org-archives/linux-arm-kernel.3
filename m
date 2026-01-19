Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4E4CCF2F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9v0aIjYUZSWriwNvwtAMomsinlBy+vZYBHHTAR4gPAs=; b=4V4GYBDc5YjRxrNmQl3FnhO8+h
	+A64VxTwjGHP+bewk9V6dyy1oJXn3UQava+sNCMH12zm5/BVc7ziBN+zQ3m5DQosYWAQHAh8lIuty
	dPScimhUiWIQ9ICnPWsT3eE35dnJbF1+yBgNkOcAxFBlD20U/ek9o7Q7BkzB36Ra0oBG0g5JJW1Fm
	FID5jFYAv1K9WSH0m12LAnENcZSktgBhFBbYiKb+HxW9mgcV9KFLoucdOKebrP+CpN8NFXU7L+kFu
	3GFg5brENaqF3aKh3P0XEm6LRu2jXU2oEeG4ZB0lPziI1rWt40yqjKJW0szmLmCSZ1Hf7cr5b7xWt
	40rSgQpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhofv-000000023nv-1uOo;
	Mon, 19 Jan 2026 12:48:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhofa-000000023WN-0W0e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:47:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9F3B406D3;
	Mon, 19 Jan 2026 12:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186A7C116C6;
	Mon, 19 Jan 2026 12:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768826865;
	bh=umcMSNG2edaaSfpRnVchmI2hRul9gbhl9khburpn7S8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i5hhrlYkPu3oNUTJGuJGrRSYe2RvjUYsTNDKVnZSDBHkHKQ73pgArpT1Fa548cSwN
	 3yAG5pKVssKOaa85u2ekYM8oMK54DqEPUtqfR/krkm0bcLVaN9vF6ih6JggYaMLYAT
	 byudHNN8BhXnCvSYUIRNXOg46qieMwyO2tun6aNYTsP/IG8SEQXiIBZOPv9Nujh+te
	 5rsYXFAHZzgMw1knqQ80cMRNlZNmiBNBzYd2s7L2mkquDLmhyk5z/39Te6VrcTC9CP
	 B2SqINJZ/BoQpBmZuaA8OaP+X+4biNgKr7YtgkoHNvynYVkKsIqLZe/lELdvSSccLf
	 XYg9/hYNaJ0kQ==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 17/35] KVM: arm64: Refactor enter_exception64()
Date: Mon, 19 Jan 2026 12:46:10 +0000
Message-ID: <20260119124629.2563-18-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119124629.2563-1-will@kernel.org>
References: <20260119124629.2563-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_044746_778073_9C669292 
X-CRM114-Status: GOOD (  17.18  )
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

In order to simplify the injection of exceptions in the host in pkvm
context, refactor enter_exception64() to separate the code calculating
the exception offset from VBAR_EL1 and the cpsr.

No functional change intended.

Signed-off-by: Quentin Perret <qperret@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
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
2.52.0.457.g6b5491de43-goog


