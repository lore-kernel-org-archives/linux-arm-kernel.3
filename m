Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01815C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 15:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Vg0z7hxSP8AOqg9PdorcqALF0ZPi5xNdSjFcbclxkg=; b=vrPs2Gjqd/2vYB+iffW54VJ/VA
	2FpxcW8Ka30pZjTIgMYxukRvKzAFZXrk/f4D+Y7VTl4Rkuk7c6091qMj04icMn70u2zYmJefdccyB
	Y8zLasxspLwXj2W6FNrfgjVOM5pq9TKp05uXWij2+z0y2+2cjf89IMvkSXHWGS+poonllFQ88XVLP
	csQ+Qc7Qe6qkRfra9MHuwQ1BPcxEbkJYzl9goiKl3mg6FOx353QGG7FOO7Hyfr3DYcfZUXer+YM1m
	L9TVMmkuUl1pH/ptOijdkSpwuuJZKlpPRWToIG0bt6W8YmNclmEbXpAAWJZRO1ntVa7PmIV+BGxXJ
	YdhnIIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSRC-00000009Btp-158n;
	Wed, 25 Jun 2025 15:53:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOGS-00000008Sya-3pKL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:26:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC8625C64CA;
	Wed, 25 Jun 2025 11:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFEDAC4CEEE;
	Wed, 25 Jun 2025 11:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750850764;
	bh=ffkxZH/7L4xrwhzE4HLTZSuTIJi+LZUlSy7jJp6bhoA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nFxKT6WaBkHebCsc+TE9IVZAf/XyB/GM21+hrjZ1jLLc+DmkPIKPHzHJLuYiAIKKm
	 751lV/Wz32W+gvCI2waq2DkEmxOpLVssIGY5LAgCSYyrWME6IuFLjBIysSOlAg83jI
	 MyKN78w0MWEcNtvKbXyFg935rq9jy4gqPeRjx/UsXnhU2MM9AX+Rj44XRxN9q+s/q7
	 baPDfrPMD1Hv/r8Wpqz65TNIlX7yS30cetJN6kNlRrVO1AswktMMCy5+X43N9eBeLn
	 fAvxM/bmaqX2QGzcESAFtZdr1zKuf+0UeeTPj6KSDQhJHpvpdjhF1obiyvDZ0LE/Gq
	 h8aC9CUPrGxIw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 25 Jun 2025 11:48:12 +0100
Subject: [PATCH v6 21/28] KVM: arm64: Flush register state on writes to
 SVCR.SM and SVCR.ZA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-kvm-arm64-sme-v6-21-114cff4ffe04@kernel.org>
References: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
In-Reply-To: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
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
X-Mailer: b4 0.15-dev-08c49
X-Developer-Signature: v=1; a=openpgp-sha256; l=3596; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ffkxZH/7L4xrwhzE4HLTZSuTIJi+LZUlSy7jJp6bhoA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoW9x1S6U9Djc0/YcgJMo+NNYP9tRdlyK6yyzk5
 F6pPlNM2mOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaFvcdQAKCRAk1otyXVSH
 0PbsCACEEN3PHl6o6oLjPnOVbidwRs2LvB4LuiZ1evd0IcPQ9VNBu2TcFFhLhLu3twEFqzDxOKb
 EFm6GLgJg0YwhKMc+MB6kUV7K5j5nIlbPQyHWw3R395mmNiYEa4QyCuRahQ+b0dKjSnvzjVDv3d
 A5wGNZNMweCAKO44qC1OVUr0BYNyl4Cne5lPLqg3P8xt3AZuGoyjw4QnhNjIxNdhnfHC4qx7dxx
 IKBz43iTNq5B0i6veWRRGG/YWQrdoc17wUGTf6Dr+2dK8CKk3nSkhkihBAVW8UYrxNXzNG+tcw6
 ko9GrCnHKjSvVXuEypfhMKpdN/eP5aXsXnu1lXLu0CwoBCrI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_042605_040134_C8AA3B8C 
X-CRM114-Status: GOOD (  17.37  )
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
 arch/arm64/include/asm/kvm_host.h | 24 ++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c         | 29 ++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 5ce9e06324b5..431e5c0ce119 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1123,6 +1123,30 @@ struct kvm_vcpu_arch {
 
 #define vcpu_sve_state_size(vcpu) sve_state_size_from_vl((vcpu)->arch.max_vl[ARM64_VEC_SVE])
 
+#define vcpu_sme_state(vcpu) (kern_hyp_va((vcpu)->arch.sme_state))
+
+#define sme_state_size_from_vl(vl, sme2) ({				\
+	size_t __size_ret;						\
+	unsigned int __vq;						\
+									\
+	if (WARN_ON(!sve_vl_valid(vl))) {				\
+		__size_ret = 0;						\
+	} else {							\
+		__vq = sve_vq_from_vl(vl);				\
+		__size_ret = ZA_SIG_REGS_SIZE(__vq);			\
+		if (sme2)						\
+			__size_ret += ZT_SIG_REG_SIZE;			\
+	}								\
+									\
+	__size_ret;							\
+})
+
+#define vcpu_sme_state_size(vcpu) ({					\
+	unsigned long __vl;						\
+	__vl = (vcpu)->arch.max_vl[ARM64_VEC_SME];			\
+	sme_state_size_from_vl(__vl, vcpu_has_sme2(vcpu));		\
+})
+
 /*
  * Only use __vcpu_sys_reg/ctxt_sys_reg if you know you want the
  * memory backed version of a register, and not the one most recently
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 1fee8e534615..edc61a53ba64 100644
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
+		__vcpu_assign_sys_reg(vcpu, FPMR, 0);
+		vcpu->arch.ctxt.fp_regs.fpsr = 0x800009f;
+	}
+
+	__vcpu_assign_sys_reg(vcpu, rd->reg, val);
+	return 0;
+}
+
 static unsigned int pmu_visibility(const struct kvm_vcpu *vcpu,
 				   const struct sys_reg_desc *r)
 {
@@ -3175,7 +3202,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 		    CTR_EL0_DminLine_MASK |
 		    CTR_EL0_L1Ip_MASK |
 		    CTR_EL0_IminLine_MASK),
-	{ SYS_DESC(SYS_SVCR), undef_access, reset_val, SVCR, 0, .visibility = sme_visibility  },
+	{ SYS_DESC(SYS_SVCR), undef_access, reset_val, SVCR, 0, .visibility = sme_visibility, .set_user = set_svcr },
 	{ SYS_DESC(SYS_FPMR), undef_access, reset_val, FPMR, 0, .visibility = fp8_visibility },
 
 	{ PMU_SYS_REG(PMCR_EL0), .access = access_pmcr, .reset = reset_pmcr,

-- 
2.39.5


