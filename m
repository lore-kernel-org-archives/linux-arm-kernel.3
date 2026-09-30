Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F18CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zd/+Jyw6bZX7UUcetdB7IGFu9m8nLhB6L7sX9bIi7t8=; b=MH9MVCfE82LcebctePrP8c1NfZ
	svvkeB5g9FlidlfzZjGVqIGE28eBnI1v0zch1Z7Q9y1xyqf4D2IB5SFZM9gTbPvZiYE4dhnDpZTQo
	2mjsw+Jt0vku4td8tB4SUbOa1Rf+Ob2gpM+EumpAGVmApK5J+nt1cgs5YG/cC77iklMvLmRFnj4ya
	bAuWigWhrQgdEIEDd0Ag07t9ICo6DnfDNJUBzlmiP5O72hyHvzM/bsMKb+YZNWDRKljMcTmRiP2zt
	eHmGCkmZhm+6/VmCwdZ87bpNoS4mvURRL0tnRfFouvAlarSLZFUWLhnJBBNtLLOL1bZO0P4UFPEmk
	H+ryvuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2Bs-00000007J0f-2ZFk;
	Wed, 30 Sep 2026 21:50:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2B2-00000007IQA-1jbN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:49:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AF5D40F36;
	Wed, 30 Sep 2026 21:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70611F00898;
	Wed, 30 Sep 2026 21:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790804964;
	bh=Zd/+Jyw6bZX7UUcetdB7IGFu9m8nLhB6L7sX9bIi7t8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PoekURoQSMZiBIMi64huDTrJ8XyurMMyps4PwgX8Jhpg3Qox/1FqQldgWy/SBpDAy
	 w/bVQNh9+cQ4vXg9WaBkr0bguVRE0vfQB5UUsbfh8yHjFDDUnyFKo9Vmr8M4MDPyUA
	 anEC/wJx4K5PkR3bxoxobqenQV3dhJR58/TwMYrUony8jbyiVOBYm+psCYp+AIK2tX
	 K+lVvMqQa8jZNBDCEXiBZ/ih2nPLB2bE88W8zQtlbe3U0DoxP37ZSEv8jGNDIjZMph
	 BoDNpkcAYNLYclqMV6lWdYdWd/79chIw7twTJBXctKXCMyGv14EFnGD5Yhsgt+UK4U
	 ++dttQ7HbmyQQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Sep 2026 22:48:18 +0100
Subject: [PATCH v21 08/15] KVM: arm64: Enforce EXLOCK for SPSR and ELR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-arm64-gcs-v21-8-3556644cd927@kernel.org>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
In-Reply-To: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3057; i=broonie@kernel.org;
 h=from:subject:message-id; bh=p2SMLjfEfZRBygQRA7fMdB/WEVVEAeNCJ7sGMUq/zOk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqvYO52fYAk0djW5voyppA7cUSGG3uVSRxOiiRx
 JhEDbivJR2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCar2DuQAKCRAk1otyXVSH
 0A47B/9vXV2XCZ6uLeUIFTwXHKySyUmCeMIABlrqUbh0HBy2DSdhuNhtCUJKVT+x5TEVGqHJZGz
 L12rQ9zN7WuGhDxeCCCC9mRC6Dwwuf3tBCd0w8JACxqvsnWKlOW5fPlyHfDfFxBRgeydVOc5dN0
 aZcsRdyj1mmww5kjbPCXanopo0fgnvnEI1ktiHCJaa4HZvU74IfpUMP8PL4DhaO2R6/0kyT1D2s
 q29bZa69GL7Bya0uou1HKWKGm86gASDjo6aydBCBNLs26KAOnkO0uN1j4qtkfkm2EqsqYPn4IvU
 g9TD4cUe+5McxzCFL56ctMFXmnZYHub5lDZpCB+1oep2x4Je
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

Reviewed-by: Leonardo Bras <leo.bras@arm.com>
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
index 823460106de8..faecf4657ec5 100644
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


