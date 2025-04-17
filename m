Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D18C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 01:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxrqjGKr7M5fisZEa24wiWAckoXA2Ql9SgJh+3Tck4w=; b=Ld+fLj/2ey0lyQ8/N95Qu4QfyU
	sUk9lM7Q/9iXP5dwATu34Wbal/MH0RkYJ3renr/5Ver3/rIgaMIRIBVii+KLZzyHoyTohETohxqnP
	iQbFOS1eYBqrfvpLdy94CKY77LTdeSTvcIU5/11f/DO1hJJ03TTgqNsdExhflGyn9VKzazSN3XgKm
	vKt9YduzwMe9YE3AqW3ly5nGahxE/On4aSyCjxr5zRnJY+37yXugksfH7At6+dQh9goqNgamMOzEh
	k4d3+m2sj+O1Qav7Os9Yb2SMSaqfrFsS+LpyFXHddNbU+GODN1uk+IUIX+LwdaySP+8SCiGxDWd+7
	5CQKGB+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Djx-0000000BOeX-0VZc;
	Thu, 17 Apr 2025 01:08:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5D5q-0000000BHC3-44gv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 00:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06547A4B03F;
	Thu, 17 Apr 2025 00:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4633C4CEED;
	Thu, 17 Apr 2025 00:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744849622;
	bh=Cvq6eABdDqP2hcq/eRmzqfXa00dzXj2dZhiT5XmdxBo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SW6XkpCWvc+XEbG8iE7WT1gmZ58DpBgpmmyUmeLTjzpYOU6jOtzsZwcBgIP9Tsr0L
	 KQ1eQfa+NG7K4llLcQrD+NdmaOSr53ZdcukkJOo9o7y0643/eyjBTvnmyFCwztkZ/f
	 dsYXbZiXn9F/vf9+7BbLI8c1BZ8M4liTneCk+jQKsIaZExABvvkzyO1SKu2N3YartF
	 a1t+sWemSpJmd/qpq2QeB99iApUnZPpU9PsMyqpWMmsSw2EiqfwHF1r0OfR43vtGUq
	 hLNDPhSX/cK8eNFhPnn6O3xWlX8q0+UshiO+GBHsBcqMpJIboy4sVrXFD6dXpMGR9r
	 yb0AtUJ2xeIZQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 17 Apr 2025 01:25:25 +0100
Subject: [PATCH v5 21/28] KVM: arm64: Flush register state on writes to
 SVCR.SM and SVCR.ZA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-kvm-arm64-sme-v5-21-f469a2d5f574@kernel.org>
References: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
In-Reply-To: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3370; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Cvq6eABdDqP2hcq/eRmzqfXa00dzXj2dZhiT5XmdxBo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoAEp/rjAQoyRjhEAHaxvC9+m6jLrGDd2SZVIFUxUe
 1scs86OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaABKfwAKCRAk1otyXVSH0PLbB/
 908/iRrkOt7rAypIV4yIV1NhagBAAwKxHrrJe2L5XGQfUDa1RILLmW9AibuqrlL2LFsi9LuG7UnMRZ
 vUISSTyOYGTOwPf51nN1DW9lKUXiaiMC1OKTlzZYRPKye+J4ulrLGSyx+k0IiDoPBaKTJ07QqOuKsE
 GIlIxFfEUGMyNzDD8qKlWyoWRsCLao/FjS+vx8jFYfGXK4Urkr1pO8DadS2eBH297o633Ye7Z0Fr8y
 /boGga7O1O9yjcTpTfM5uh3IOdIEtpTK7KUzyUr+ESoL4Mh/fb+CWIXpkpaYW2EIL976+BvcWAj93n
 dJp77Fr/n0RHITnkcjawRL7uLLOETN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_172703_145490_B22171AE 
X-CRM114-Status: GOOD (  16.53  )
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

Writes to the physical SVCR.SM and SVCR.ZA change the state of PSTATE.SM
and PSTATE.ZA, causing other floating point state to reset. Emulate this
behaviour for writes done via the KVM userspace ABI.

Setting PSTATE.ZA to 1 causes ZA and ZT0 to be reset to 0, these are stored
in sme_state. Setting PSTATE.ZA to 0 causes ZA and ZT0 to become inaccesible
so no reset is needed.

Any change in PSTATE.SM causes the V, Z, P, FFR and FPMR registers to be
reset to 0 and FPSR to be reset to 0x800009f.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 18 ++++++++++++++++++
 arch/arm64/kvm/sys_regs.c         | 29 ++++++++++++++++++++++++++++-
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 09351c14032f..ef8b60222ac9 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1066,6 +1066,24 @@ struct kvm_vcpu_arch {
 	__size_ret;							\
 })
 
+#define vcpu_sme_state(vcpu) (kern_hyp_va((vcpu)->arch.sme_state))
+
+#define vcpu_sme_state_size(vcpu) ({					\
+	size_t __size_ret;						\
+	unsigned int __vcpu_vq;						\
+									\
+	if (WARN_ON(!sve_vl_valid((vcpu)->arch.max_vl[ARM64_VEC_SME]))) { \
+		__size_ret = 0;						\
+	} else {							\
+		__vcpu_vq = vcpu_sme_max_vq(vcpu);			\
+		__size_ret = ZA_SIG_REGS_SIZE(__vcpu_vq);		\
+		if (vcpu_has_sme2(vcpu))				\
+			__size_ret += ZT_SIG_REG_SIZE;			\
+	}								\
+									\
+	__size_ret;							\
+})
+
 /*
  * Only use __vcpu_sys_reg/ctxt_sys_reg if you know you want the
  * memory backed version of a register, and not the one most recently
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 7cfc0c2801ed..0f08f791e3fe 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -806,6 +806,33 @@ static bool access_smidr(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static int set_svcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
+		    u64 val)
+{
+	u64 old = __vcpu_sys_reg(vcpu, rd->reg);
+
+	if (val & SVCR_RES0)
+		return -EINVAL;
+
+	if ((val & SVCR_ZA) && !(old & SVCR_ZA) && vcpu->arch.sme_state)
+		memset(vcpu->arch.sme_state, 0, vcpu_sme_state_size(vcpu));
+
+	if ((val & SVCR_SM) != (old & SVCR_SM)) {
+		memset(vcpu->arch.ctxt.fp_regs.vregs, 0,
+		       sizeof(vcpu->arch.ctxt.fp_regs.vregs));
+
+		if (vcpu->arch.sve_state)
+			memset(vcpu->arch.sve_state, 0,
+			       vcpu_sve_state_size(vcpu));
+
+		__vcpu_sys_reg(vcpu, FPMR) = 0;
+		vcpu->arch.ctxt.fp_regs.fpsr = 0x800009f;
+	}
+
+	__vcpu_sys_reg(vcpu, rd->reg) = val;
+	return 0;
+}
+
 static unsigned int pmu_visibility(const struct kvm_vcpu *vcpu,
 				   const struct sys_reg_desc *r)
 {
@@ -3115,7 +3142,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 		    CTR_EL0_DminLine_MASK |
 		    CTR_EL0_L1Ip_MASK |
 		    CTR_EL0_IminLine_MASK),
-	{ SYS_DESC(SYS_SVCR), undef_access, reset_val, SVCR, 0, .visibility = sme_visibility  },
+	{ SYS_DESC(SYS_SVCR), undef_access, reset_val, SVCR, 0, .visibility = sme_visibility, .set_user = set_svcr },
 	{ SYS_DESC(SYS_FPMR), undef_access, reset_val, FPMR, 0, .visibility = fp8_visibility },
 
 	{ PMU_SYS_REG(PMCR_EL0), .access = access_pmcr, .reset = reset_pmcr,

-- 
2.39.5


