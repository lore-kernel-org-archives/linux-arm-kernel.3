Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44BCC36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 23:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qmIEMi6XOGv3HGJoHRNphCYSx6Cktjdm3HBMwNssGY=; b=prLP3c4+wxcSVB5Lu1hAcQ3d7j
	g4Nen1kNeNKf1Q5Y4Qcau+DpiJZLRy1Y4KxU+DeuGOBvLOrKgm1Sj1J1hajFsmwksT6iZpg4Ts7vU
	3uQgr4O5c3pFQCcy6u0W7eWntioJdvigrVBwYoDnrNI3EBdOY8rEhHL9BZa1blqh9cZ0fX638EtaB
	cbIJVYMoBjgHYluuwEBzDRwD/RMUPAWudCaSgQiRCQicvOaTBaxzvcyTjLhXrJQXMV4+YGxFFpZs5
	lZAKTuWN6cwJI1LskphdbJd4usx0rmVgnwJ51yggf0i+X1OnvgESe9m9z+UxcKrrsLr1YLC/B0mw5
	KW4To66w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07R2-00000007Ony-0pQ2;
	Wed, 02 Apr 2025 23:23:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07Gn-00000007NNI-3DfQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 23:13:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04ABC443FF;
	Wed,  2 Apr 2025 23:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43EC5C4CEEB;
	Wed,  2 Apr 2025 23:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743635597;
	bh=nlVU4m2cGOe9nm23h8UEok/akX92Rm8UP7rBstIa2ww=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SQcrr3nfpRELCHfXW94TzpOuPbpqtdc009Rx0J9/GRx8i+51s9cjayq8yTuNXer18
	 jPMVOrKbMX/bUjQMmlbvU2dVmv3XXXavEIItFVTj/Lj3nZK1HPIAAv47eLc7Td/4E1
	 5ZboKmDjINyY5HOtFZKhOPlzbJfsBeV9+CxF8gVI0tmuJPeBGlaPT/9/zTbBK2/86E
	 suZamKoGvl4furbm1x8B9moe5cvRDcyAA2ENXXd1CsfbALwJa2Hr+E9MBKFIKTFEJ9
	 Z5XbaE2v9riPC10IeZNPBaiHdH+mWmIxS+osSkr9V4fBlU9RlSTKuNLhU0D4s0Mr5a
	 4TGtJRuJy8I4A==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 02 Apr 2025 23:59:37 +0100
Subject: [PATCH 05/10] arm64/fpsimd: Stop using TIF_SVE to manage register
 saving in KVM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-stable-sve-5-15-v1-5-84d0e5ff1102@kernel.org>
References: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
In-Reply-To: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3851; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nlVU4m2cGOe9nm23h8UEok/akX92Rm8UP7rBstIa2ww=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn7cR4jz+1xO696XbwVAk4aCE4x9KrK6Yp6EI9NXz9
 bZ9npY2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ+3EeAAKCRAk1otyXVSH0JpRB/
 41VT8sIS1wRDFoA5Mll33zdBM34e9099U/RT60Tex6eXhoUAoLkTOuWrIo2c+TQ59n33CgGi1cEAiD
 rpE92rhxtYv8QvZqvW0e1jsciZQPPd1FC55MckCT0rpemfzRUC3M+5Q8fPBV2UFV8rEHhd2h5KnIPA
 0f0yCpwYO0lBBaetULd5zlFzfpetakgYSbyjYPNMWa9ETsSg6DpwZFTPVNN441ImVAKkqOoDdGVbUk
 x5pe9nyd+N6pvRLP9hdl23PsoqPmGYz1Nd1/c76DYOZZfuhJuyFhob70zXMZenQD95Aazjv6I1I+En
 FTYWt8NSS/xnmRISeJ3r2XsVSG135P
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_161317_850953_226B0454 
X-CRM114-Status: GOOD (  17.82  )
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

[ Upstream commit 62021cc36add7b2c015b837f7893f2fb4b8c2586 ]

Now that we are explicitly telling the host FP code which register state
it needs to save we can remove the manipulation of TIF_SVE from the KVM
code, simplifying it and allowing us to optimise our handling of normal
tasks. Remove the manipulation of TIF_SVE from KVM and instead rely on
to_save to ensure we save the correct data for it.

There should be no functional or performance impact from this change.

Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20221115094640.112848-5-broonie@kernel.org
Signed-off-by: Will Deacon <will@kernel.org>
[ Mark: trivial backport ]
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 40 ++++++++++++++++------------------------
 arch/arm64/kvm/fpsimd.c    |  3 ---
 2 files changed, 16 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 105b8aa0c038..e8f10daaa0d7 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -318,7 +318,13 @@ static void task_fpsimd_load(void)
 
 /*
  * Ensure FPSIMD/SVE storage in memory for the loaded context is up to
- * date with respect to the CPU registers.
+ * date with respect to the CPU registers. Note carefully that the
+ * current context is the context last bound to the CPU stored in
+ * last, if KVM is involved this may be the guest VM context rather
+ * than the host thread for the VM pointed to by current. This means
+ * that we must always reference the state storage via last rather
+ * than via current, if we are saving KVM state then it will have
+ * ensured that the type of registers to save is set in last->to_save.
  */
 static void fpsimd_save(void)
 {
@@ -334,9 +340,15 @@ static void fpsimd_save(void)
 	if (test_thread_flag(TIF_FOREIGN_FPSTATE))
 		return;
 
-	if (IS_ENABLED(CONFIG_ARM64_SVE) &&
-	    test_thread_flag(TIF_SVE)) {
-		if (WARN_ON(sve_get_vl() != last->sve_vl)) {
+	if ((last->to_save == FP_STATE_CURRENT && test_thread_flag(TIF_SVE)) ||
+	    last->to_save == FP_STATE_SVE) {
+		save_sve_regs = true;
+		vl = last->sve_vl;
+	}
+
+	if (IS_ENABLED(CONFIG_ARM64_SVE) && save_sve_regs) {
+		/* Get the configured VL from RDVL, will account for SM */
+		if (WARN_ON(sve_get_vl() != vl)) {
 			/*
 			 * Can't save the user regs, so current would
 			 * re-enter user with corrupt state.
@@ -347,26 +359,6 @@ static void fpsimd_save(void)
 		}
 	}
 
-	if (test_thread_flag(TIF_SVE)) {
-		save_sve_regs = true;
-		vl = last->sve_vl;
-	}
-
-	/*
-	 * Validate that an explicitly specified state to save is
-	 * consistent with the task state.
-	 */
-	switch (last->to_save) {
-	case FP_STATE_CURRENT:
-		break;
-	case FP_STATE_FPSIMD:
-		WARN_ON_ONCE(save_sve_regs);
-		break;
-	case FP_STATE_SVE:
-		WARN_ON_ONCE(!save_sve_regs);
-		break;
-	}
-
 	if (IS_ENABLED(CONFIG_ARM64_SVE) && save_sve_regs) {
 		sve_save_state((char *)last->sve_state +
 			       sve_ffr_offset(last->sve_vl),
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 54a31c97eb7a..2e0f44f4c470 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -110,7 +110,6 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
 					 &vcpu->arch.fp_type, fp_type);
 
 		clear_thread_flag(TIF_FOREIGN_FPSTATE);
-		update_thread_flag(TIF_SVE, vcpu_has_sve(vcpu));
 	}
 }
 
@@ -151,7 +150,5 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
 			sysreg_clear_set(CPACR_EL1, CPACR_EL1_ZEN_EL0EN, 0);
 	}
 
-	update_thread_flag(TIF_SVE, 0);
-
 	local_irq_restore(flags);
 }

-- 
2.39.5


