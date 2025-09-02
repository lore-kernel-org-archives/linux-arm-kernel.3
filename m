Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FABCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 14:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWOR5JAU3kynwk179ZOfk/fB/owyMlGNcIo7VmVSNCk=; b=0zEaka5kGZi56S+pE0Yjkha6H+
	vmyjvVTnypIMZ7Fxa5U5lSb0kyTH0yWSY+QsijjNYbtTkttL7ZGu0IiR9bzJ+UM9FpwdkeUo4PWfj
	RAczbAuQSXrxPnusc7KrvnaI5ZPtAGcD1UiPSP7787zQZHeTFHsZJ1dMBEojD3mSu31DD+idA7s+x
	FpjYHidw7xRvwiAaOKtPb1GR3/b5b94w33AgZZhEHcj8oWAW7kxUeRDhm8DX/NxLAYjRaN2oimzKm
	k5I5fUfIyvhmtRfj7jFW2wO1L9KDqUP2z6gh4kdpxnr5Ha9JVRh8Suj7uUBYUqa5nvQxZNg/RpzHt
	2D3txPMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRqK-00000000JFd-0ObT;
	Tue, 02 Sep 2025 14:18:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPSZ-0000000GzFh-38Iv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:46:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B35040A51;
	Tue,  2 Sep 2025 11:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7FCC4CEED;
	Tue,  2 Sep 2025 11:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813559;
	bh=K/O9CttzW0zt3QhDrAZF6NQXIZmkZnmyhsSNH3lWRrU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cyysmErdQnsGhAI7LauWgMOqAJlIKVs243APJWcei6qn/NMTkucSU8IVpqOFYPLll
	 WvrIOjTPqL1dkjOmdw/EMjoRvW7D2/E7dFTBSyzOStBly12lZJQXLeZk1RynYZ1MUB
	 2E5b/JBEr4cxcXEgD5VIDYgwUgNAJgblDtQpQ3cngM1sw+aGY+HN++A8CxhVBe8eP8
	 j4z4oYffv1m9O8uJjJqnlhPMr8GhsIJ5S9+Z+qjYNyWf7+rUFi/Dm95F9tyFMMCh/z
	 d2xWngqlXVNd/rSiU3fCpiuWBcsoVsOOjoEfYtpU6aJa12ixXxO3J761TW4CHxXmMV
	 yWvF15t7+eopA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Sep 2025 12:36:25 +0100
Subject: [PATCH v8 22/29] KVM: arm64: Flush register state on writes to
 SVCR.SM and SVCR.ZA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-kvm-arm64-sme-v8-22-2cb2199c656c@kernel.org>
References: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
In-Reply-To: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=3621; i=broonie@kernel.org;
 h=from:subject:message-id; bh=K/O9CttzW0zt3QhDrAZF6NQXIZmkZnmyhsSNH3lWRrU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBottiLOOREPgtGmGQzcmsCTjpuRPxvjG7kfaCVp
 9oPVplO1wOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaLbYiwAKCRAk1otyXVSH
 0AXUB/0TZZCGtlyShi6U3mavSZg5/Dy1snG0FfS5N64yz7AiGhEnPZd4q2TUg0snTlhMnBKdAxO
 nN1yTY/Iv5rfj+9F94WeqlDXXB3m4FKe1UUXQKgYxX6rtlc20n/36bJPjyZuUhUk7zeMEMkUeYS
 /NHfPoD9vbJZNJdneUhiXK1MobDbRx1nysapJ1IqohY46kK8M8FeIs7KR1MUre1GuUU3+tvxtF/
 RvZ5AU44Kt59uGKDR8S48C6dO532CHgE6VMItwNC/TVWH+e542fGsBMbF9u3/Wdq9pELVTTgqvP
 AZudWOfPcg6zgSoomH3jBOHjcVZKN0pFg88PhK+z5eM5LPhw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_044559_832173_6BCB0096 
X-CRM114-Status: GOOD (  17.90  )
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
index ebc516fe09db..8e5c16372b83 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1144,6 +1144,30 @@ struct kvm_vcpu_arch {
 
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
index 7284705a5f0a..0752e119c056 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -788,6 +788,33 @@ static unsigned int hidden_visibility(const struct kvm_vcpu *vcpu,
 	return REG_HIDDEN;
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
@@ -3248,7 +3275,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 		    CTR_EL0_DminLine_MASK |
 		    CTR_EL0_L1Ip_MASK |
 		    CTR_EL0_IminLine_MASK),
-	{ SYS_DESC(SYS_SVCR), undef_access, reset_val, SVCR, 0, .visibility = sme_visibility  },
+	{ SYS_DESC(SYS_SVCR), undef_access, reset_val, SVCR, 0, .visibility = sme_visibility, .set_user = set_svcr },
 	{ SYS_DESC(SYS_FPMR), undef_access, reset_val, FPMR, 0, .visibility = fp8_visibility },
 
 	{ PMU_SYS_REG(PMCR_EL0), .access = access_pmcr, .reset = reset_pmcr,

-- 
2.39.5


