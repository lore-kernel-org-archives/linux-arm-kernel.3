Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4CDCF5396
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yC4QYfmcqdgdjdPOzkxgOmveq1yXgsgEdyzmUa+OTyU=; b=XgPcwflcopwqtnqwTlhGpksV3/
	qjEbdUZoklS6sqxH4Dn4fA69SuM9/q725mWlTuUtpGhMx4u6/9gQsgN5l2x8Jv90bWNfbzsFAPWuk
	NLPAUmIRi7Om2tAyylxHfbOYOWOAzSA3+ooov4QgSq/obkcWS1fn+PZU9nLUJsAx1N9grEUgtfek3
	I7g8PuLdyD9635yRdM8AGh72MxzfqAvoTVyY+gPEK0zn32uhfo9KPWXGVzmw65Zguoqaoxf1IiGbH
	7NT60TrUUEIiacg3qFJqSVqjJJz4o6ZVEOToyxJsa162ONOZ/oeQKMRG+pXcOtVroe9Kw5oJKZ1Of
	bf8X8clA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cq7-0000000EqtK-3Nq0;
	Wed, 23 Oct 2024 14:59:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckD-0000000EpHh-3ZaG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:53:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC7115C5E62;
	Wed, 23 Oct 2024 14:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AA6C4CEEE;
	Wed, 23 Oct 2024 14:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695233;
	bh=qgl95QioFvsUmyfTslZFoefHDVM9JNr0Jgcb3kh5g6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vu/DdJwqEjQHpPQ4fZkc0hcXovN7xztYbWJ/RaGx0+zgnY3N64QTqZNtloYZeFBuA
	 HmxXuEirYlIEvaz5ARovkEQWYo3sz0zGNRBdjgHL6B5sZEBXrZ79T/GNYiGzxBXDv5
	 t+pvSpNzWl9tc+F1EEan/6zlVaTr1T5Tgj1RqKmEJc8PUnv3GJwsdjdcB2sLoPIUtC
	 o38ym9o9tKq5gtBZzodzBh6b/+I9WU6isx3XkdS7hiVWwYniPcmjXPhYLCxyZjaKTf
	 2ldoWQjPF41R0X5NWoimpd9f9XIKICDhOastkvuzInJtNTmsnP6eRdQ/ooxKs+ho7w
	 kg0LO4rNaey3w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckB-0068vz-9T;
	Wed, 23 Oct 2024 15:53:51 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 09/37] KVM: arm64: Extend masking facility to arbitrary registers
Date: Wed, 23 Oct 2024 15:53:17 +0100
Message-Id: <20241023145345.1613824-10-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_075354_001100_A4633739 
X-CRM114-Status: GOOD (  18.03  )
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

We currently only use the masking (RES0/RES1) facility for VNCR
registers, as they are memory-based and thus easy to sanitise.

But we could apply the same thing to other registers if we:

- split the sanitisation from __VNCR_START__
- apply the sanitisation when reading from a HW register

This involves a new "marker" in the vcpu_sysreg enum, which
defines the point at which the sanitisation applies (the VNCR
registers being of course after this marker).

Whle we are at it, rename kvm_vcpu_sanitise_vncr_reg() to
kvm_vcpu_apply_reg_masks(), which is vaguely more explicit,
and harden set_sysreg_masks() against setting masks for
random registers...

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 19 +++++++++++++------
 arch/arm64/kvm/nested.c           | 12 ++++++++----
 arch/arm64/kvm/sys_regs.c         |  3 +++
 3 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 1adf68971bb17..7f409dfc5cd4a 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -367,7 +367,7 @@ struct kvm_arch {
 
 	u64 ctr_el0;
 
-	/* Masks for VNCR-baked sysregs */
+	/* Masks for VNCR-backed and general EL2 sysregs */
 	struct kvm_sysreg_masks	*sysreg_masks;
 
 	/*
@@ -401,6 +401,9 @@ struct kvm_vcpu_fault_info {
 	r = __VNCR_START__ + ((VNCR_ ## r) / 8),	\
 	__after_##r = __MAX__(__before_##r - 1, r)
 
+#define MARKER(m)				\
+	m, __after_##m = m - 1
+
 enum vcpu_sysreg {
 	__INVALID_SYSREG__,   /* 0 is reserved as an invalid value */
 	MPIDR_EL1,	/* MultiProcessor Affinity Register */
@@ -487,7 +490,11 @@ enum vcpu_sysreg {
 	CNTHV_CTL_EL2,
 	CNTHV_CVAL_EL2,
 
-	__VNCR_START__,	/* Any VNCR-capable reg goes after this point */
+	/* Anything from this can be RES0/RES1 sanitised */
+	MARKER(__SANITISED_REG_START__),
+
+	/* Any VNCR-capable reg goes after this point */
+	MARKER(__VNCR_START__),
 
 	VNCR(SCTLR_EL1),/* System Control Register */
 	VNCR(ACTLR_EL1),/* Auxiliary Control Register */
@@ -547,7 +554,7 @@ struct kvm_sysreg_masks {
 	struct {
 		u64	res0;
 		u64	res1;
-	} mask[NR_SYS_REGS - __VNCR_START__];
+	} mask[NR_SYS_REGS - __SANITISED_REG_START__];
 };
 
 struct kvm_cpu_context {
@@ -995,13 +1002,13 @@ static inline u64 *___ctxt_sys_reg(const struct kvm_cpu_context *ctxt, int r)
 
 #define ctxt_sys_reg(c,r)	(*__ctxt_sys_reg(c,r))
 
-u64 kvm_vcpu_sanitise_vncr_reg(const struct kvm_vcpu *, enum vcpu_sysreg);
+u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *, enum vcpu_sysreg, u64);
 #define __vcpu_sys_reg(v,r)						\
 	(*({								\
 		const struct kvm_cpu_context *ctxt = &(v)->arch.ctxt;	\
 		u64 *__r = __ctxt_sys_reg(ctxt, (r));			\
-		if (vcpu_has_nv((v)) && (r) >= __VNCR_START__)		\
-			*__r = kvm_vcpu_sanitise_vncr_reg((v), (r));	\
+		if (vcpu_has_nv((v)) && (r) >= __SANITISED_REG_START__)	\
+			*__r = kvm_vcpu_apply_reg_masks((v), (r), *__r);\
 		__r;							\
 	}))
 
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index f9e30dd34c7a1..b20b3bfb9caec 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -908,15 +908,15 @@ static void limit_nv_id_regs(struct kvm *kvm)
 	kvm_set_vm_id_reg(kvm, SYS_ID_AA64DFR0_EL1, val);
 }
 
-u64 kvm_vcpu_sanitise_vncr_reg(const struct kvm_vcpu *vcpu, enum vcpu_sysreg sr)
+u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *vcpu,
+			     enum vcpu_sysreg sr, u64 v)
 {
-	u64 v = ctxt_sys_reg(&vcpu->arch.ctxt, sr);
 	struct kvm_sysreg_masks *masks;
 
 	masks = vcpu->kvm->arch.sysreg_masks;
 
 	if (masks) {
-		sr -= __VNCR_START__;
+		sr -= __SANITISED_REG_START__;
 
 		v &= ~masks->mask[sr].res0;
 		v |= masks->mask[sr].res1;
@@ -927,7 +927,11 @@ u64 kvm_vcpu_sanitise_vncr_reg(const struct kvm_vcpu *vcpu, enum vcpu_sysreg sr)
 
 static void set_sysreg_masks(struct kvm *kvm, int sr, u64 res0, u64 res1)
 {
-	int i = sr - __VNCR_START__;
+	int i = sr - __SANITISED_REG_START__;
+
+	BUILD_BUG_ON(!__builtin_constant_p(sr));
+	BUILD_BUG_ON(sr < __SANITISED_REG_START__);
+	BUILD_BUG_ON(sr >= NR_SYS_REGS);
 
 	kvm->arch.sysreg_masks->mask[i].res0 = res0;
 	kvm->arch.sysreg_masks->mask[i].res1 = res1;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 932d2fb7a52a0..d9c20563cae93 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -189,6 +189,9 @@ u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
 
 		/* Get the current version of the EL1 counterpart. */
 		WARN_ON(!__vcpu_read_sys_reg_from_cpu(el1r, &val));
+		if (reg >= __SANITISED_REG_START__)
+			val = kvm_vcpu_apply_reg_masks(vcpu, reg, val);
+
 		return val;
 	}
 
-- 
2.39.2


