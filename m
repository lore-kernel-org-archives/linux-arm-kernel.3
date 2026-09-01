Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C82C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 21:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7n93eEAZcqp/uvmqepwIrUhrufzf1uDi7N0bfkYuMM=; b=n84ruxr5nzmH1x4sbm1g4yZTOT
	YshD9n/5t8sLUQUICRR0tb5CrlmsFEYMK380tN4Mad2Cu1Ij4dkHI1Dp1zFut9pZkO7GF6kDAblY+
	ieRV3y/oPZ0Ds8teJJqENe5dNdOGgsZvJaQR4XA0hJdDzaWibk4D4JgnJ2USo6zggL2ylKkBb/JIz
	Vdvn5UAXKSN4XldPXcfYiWG0Rh2xeDzMHHE6LkHubbb/lSCzGzWZcmYkmaeN31Dbw6/2ou5vuEOuy
	YdQQ2MJhONc6di0aEyex0ciWsilEGzVDr9sskPM6LTOTPmserbQ2sMU0KDL4++Rgy4TR1JgFXF8ny
	Iw6eBHhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1WNo-0000000DQOo-0afW;
	Tue, 01 Sep 2026 21:51:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1WNm-0000000DQMo-18Cg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 21:51:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ADD6B6025A;
	Tue,  1 Sep 2026 21:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB9E1F000E9;
	Tue,  1 Sep 2026 21:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788299465;
	bh=d7n93eEAZcqp/uvmqepwIrUhrufzf1uDi7N0bfkYuMM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hCUDSupBguzYCJSzjIN8jCrAOnRGpWVOTC+sanb+LjjL3+NHLC6S/X5pkINtIwAg6
	 8zBjmcZg8T2CLfG7b+r5CGvSEWLG/QDm4xdMqtm5MeMHtomY0Kk+KlW3a3M9kgTjEc
	 UAaHkMtq5up6DWWDkMxFl2WiMnIQmf2VNIabN8tAutgOqJCfzeLVzwQ+PldmRjZURi
	 M3GksT4gOfQfw9IsbFURwPVRDK1woHem4PJ65YEfYo3swRQxFt/QgVs84hqkSunS28
	 JBmcnKY5YZOpFfdTmLfN2DC83UASDVjSje+36ev4BdmaNEhTn8MysQPaBtzxhuyb/t
	 0dN5NcAfikqYw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 22:47:06 +0100
Subject: [PATCH v20 08/14] KVM: arm64: Enforce EXLOCK for SPSR and ELR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-gcs-v20-8-f31750bdfadb@kernel.org>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
In-Reply-To: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
 Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3010; i=broonie@kernel.org;
 h=from:subject:message-id; bh=myX2r5YA1lyE6PF9X7vRwEe8NUR6TEzLmdONy7VX99g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBql0iivg1NgLATu5WNvTFVbJ7dugWm+35vKG3Qb
 NQBKJxFH0yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapdIogAKCRAk1otyXVSH
 0NfzB/9uir8kEpaV0c5Lfpwjc6r8ijRsibzD0J0REkxIG0i8cO38HIoEix85kGdmnKaObcKiprY
 9HoJ5z5ZQ5utr4kVqrPU13zPEGcmBDVgMOWt+uFNlxuGrmfyh5VjUxwbGJfd1iUPlhJs+QToEzN
 Fhy0AGKdJjX+79uhlNrmW0D2fzewV+OFXJdGHxTyl63CCsy2WARZZnu4Tn9402xE+cQrX+bRJut
 3RUba+1JExMN6oOVH9t2Ifv7x/gWV/z327McCpmjnwSjD1OB8Ti2dKhmdQ+nNChhvINfHX1mluF
 aIxqsdwgrqGjL/FiDEaMJKGksdiF+0IjdzQhK97jFtPPzgas
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

As per I_CFFNS and the pseudocode for the SPSR_ELx and ELR_ELx registers
a GCS exception with ExType 1 is generated for attempts to write to
those registers when both GCSCR_ELx.EXLOCKEN and PSTATE.EXLOCK are set.
Ensure that this is enforced for guests if access to these registers
from the guest is handled by the hypervisor.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h |  8 +++++++
 arch/arm64/kvm/sys_regs.c            | 42 ++++++++++++++++++++++++++++++++----
 2 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 0cd91b3d6c82..e47ab38327de 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -81,6 +81,14 @@ int kvm_inject_nested_irq(struct kvm_vcpu *vcpu);
 int kvm_inject_nested_sea(struct kvm_vcpu *vcpu, bool iabt, u64 addr);
 int kvm_inject_nested_serror(struct kvm_vcpu *vcpu, u64 esr);
 
+static inline void kvm_inject_exlock(struct kvm_vcpu *vcpu)
+{
+	u64 esr = FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_GCS) | ESR_ELx_IL |
+		  FIELD_PREP(ESR_ELx_ExType_MASK, ESR_ELx_ExType_EXLOCK);
+
+	kvm_inject_sync(vcpu, esr);
+}
+
 static inline void kvm_inject_nested_sve_trap(struct kvm_vcpu *vcpu)
 {
 	u64 esr = FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SVE) |
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index c5ce18b3f7d8..1f80c26a9839 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2866,14 +2866,42 @@ static bool access_sp_el1(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static inline bool sysregs_exlocked(struct kvm_vcpu *vcpu)
+{
+	u64 gcscr;
+
+	if (!kvm_has_gcs(vcpu->kvm))
+		return false;
+
+	if (!(vcpu->arch.ctxt.regs.pstate & PSR_EXLOCK_BIT))
+		return false;
+
+	/*
+	 * Note that the EXLOCKEN for the running EL is checked
+	 * regardless of the register written to.
+	 */
+	if (is_hyp_ctxt(vcpu))
+		gcscr = vcpu_read_sys_reg(vcpu, GCSCR_EL2);
+	else
+		gcscr = vcpu_read_sys_reg(vcpu, GCSCR_EL1);
+
+	return gcscr & GCSCR_ELx_EXLOCKEN;
+}
+
 static bool access_elr(struct kvm_vcpu *vcpu,
 		       struct sys_reg_params *p,
 		       const struct sys_reg_desc *r)
 {
-	if (p->is_write)
+	if (p->is_write) {
+		if (sysregs_exlocked(vcpu)) {
+			kvm_inject_exlock(vcpu);
+			return false;
+		}
+
 		vcpu_write_sys_reg(vcpu, p->regval, ELR_EL1);
-	else
+	} else {
 		p->regval = vcpu_read_sys_reg(vcpu, ELR_EL1);
+	}
 
 	return true;
 }
@@ -2882,10 +2910,16 @@ static bool access_spsr(struct kvm_vcpu *vcpu,
 			struct sys_reg_params *p,
 			const struct sys_reg_desc *r)
 {
-	if (p->is_write)
+	if (p->is_write) {
+		if (sysregs_exlocked(vcpu)) {
+			kvm_inject_exlock(vcpu);
+			return false;
+		}
+
 		__vcpu_assign_sys_reg(vcpu, SPSR_EL1, p->regval);
-	else
+	} else {
 		p->regval = __vcpu_sys_reg(vcpu, SPSR_EL1);
+	}
 
 	return true;
 }

-- 
2.47.3


