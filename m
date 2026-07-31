Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069BEC55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 12:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3e2rBRtLDRgrOIaI1elxNnJ/2QhoA9om1fNfFAW7Yo=; b=dyx9Q1iKSoa6o/pWmat870g6fh
	hShnWoBgnhjMX+aIJVfsLweNHrJzieztlo1c+d+eCxJiV2o7+rUJdbdKUlNBjndelx633KeEOxSd4
	7pT/R316NpCCHDaHPBB9QfUvjHEEmi/Aa+zoxfAG0Dx2J597cwHxkfWEZeeUF86Ysw5Kl33ntCIkP
	U/Jh5hv+11BKwkyes6CkOoWbTdh3nRJe3MLcCAs5lgJpHd1gdTOGom22wGUhlCNl5WH+gcSEYYbFU
	yuTwGjBRAxIqxG7dgRLlC8GxhToerCTEAaN3Y1sj8QEv5KDjB1H4l8BJizcdvGAi1Coc5SsL/zJVM
	NkVqqtiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmVM-0000000CUwR-26Ja;
	Fri, 31 Jul 2026 12:38:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmUv-0000000CUj1-0TtS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 12:37:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AE9860A6B;
	Fri, 31 Jul 2026 12:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECB71F00A3D;
	Fri, 31 Jul 2026 12:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785501476;
	bh=P3e2rBRtLDRgrOIaI1elxNnJ/2QhoA9om1fNfFAW7Yo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=biHSZU6kYX5v/wvxBwgrqds94+SRUsdrs9cFYmKK2XfdaaWDUHcf0EmH/451Xh9Qy
	 0gmqeXJQ3gaxq/yhEniHylXGmwSruAxDjLnNZdyLAvMj7L7Qn2Oq9iv2uHKCAp/8YI
	 hLqIgCOAEo/E6WbmdYvHntzLnxUJc0Axhxf5a/RaauEKTRmODjOu4Eu4BxCccQiS4d
	 JDg0BcjawbsF0LCKcQ7756qpooTFVYLgJ9Py+mEYwxue00ctkomE6fFiF0B9P5AyYq
	 +Z/MeYLVKUs67p7UpkvgxiaIxeI9b6FR2pckj9k8oYQfdJnbTIMGzdYIjOdf1dnNWX
	 gmsRmrbgJkAog==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 31 Jul 2026 13:25:46 +0100
Subject: [PATCH v17 08/14] KVM: arm64: Enforce EXLOCK for SPSR and ELR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-arm64-gcs-v17-8-5e39ca01b14e@kernel.org>
References: <20260731-arm64-gcs-v17-0-5e39ca01b14e@kernel.org>
In-Reply-To: <20260731-arm64-gcs-v17-0-5e39ca01b14e@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3010; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oWZdUmuK4nAtItYIMoZ1Nyc4/gTFqii47mmxgcveKIQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbJcCLPFgrfQ8svgEbiadv+hYFS4UMRXY1yBSB
 f+PnSAFLfqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamyXAgAKCRAk1otyXVSH
 0HZbCACFJ9H+iuLy41JSKNoCVsfPYquTy02+GfUpVMKkTTYKxB+OUMC6X49vOrXNHgw4pyQuch2
 gKjY9JNWIpqojyCMFmUKeHMcSHLxFf8X+6MQAn6r1V4wTT4I31KiLHYdlbkTjGMaE/NFldVmh7m
 IaTG9IgcDwxmgBQmID8dHquSjsKnMOeiGwemb/kQvFcnCMd5SMR9XvhhG3+Il/YHNqL0E+NRFTy
 323bnRPy4jEhNj+/z71mFsC/r27M5NbLph+tMxF2IQ1AY+Y6Uor0MXouDBZaWrPu44LXgQE9M0J
 lOL+cqn/eRLorIGFfCzxhqfOSob2nRUmOiyDwOSWa2n1Hmi9
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
index ee774c3b8dcd..bc012c86fcd6 100644
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
index 1a1e45d64552..3d9f4eb9d093 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2776,14 +2776,42 @@ static bool access_sp_el1(struct kvm_vcpu *vcpu,
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
@@ -2792,10 +2820,16 @@ static bool access_spsr(struct kvm_vcpu *vcpu,
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


