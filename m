Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B711C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 21:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHnPZg/net7a+AQdOjT36JOU7VGnbjYxcvxeIjCtLNc=; b=zrp+iqcqS0g1XzZzvy9V2gO+pm
	PFCJdppu5fKgho9RGJBMMKGGpcXTaireYR/jRnxykxckaNW1aH1u0lZsieoMmUc6GZ1w7dLdpKPBX
	9lGKSdlct8HlXAQ56SVUFY85cajJqiRsRzr8ymr7hjsMY/vvMlQP6NqRB0lQwYD52MZYGg+CMaxGO
	wEjLO+thO3azkbLIY25nik+M7KAOQed1tYXD4YImQlNukyaNQo9E2fhok9FfVIZXH3ieSngDJ+7pg
	tkxKp3vYiMQTVvULwBbEd5jTJTKw5u3xTrmCBWdUV+hwxCYcGEBU3O4dD2gBlxT224lB/tG3Zqm0H
	X4iSrTgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1WNf-0000000DQGf-3vVQ;
	Tue, 01 Sep 2026 21:50:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1WNe-0000000DQFq-2hr9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 21:50:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6851243CD0;
	Tue,  1 Sep 2026 21:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E88B1F00A3A;
	Tue,  1 Sep 2026 21:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788299458;
	bh=KHnPZg/net7a+AQdOjT36JOU7VGnbjYxcvxeIjCtLNc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=id4kALbJSvCv3lQfPGhvN2kJZaoPf1b9Y30ySDtXKHwI8CBLWJrLqw71t5KrAW8En
	 MXMd0nPS9VgdXjm1LPqiTki2NRk5zyiyUabs+2LkJlPwX1wnnY42ZTD/U1ovl2XHgI
	 oqflOJDkmFA2MEEkUuezZ5m+kP2T7JMu3dlAstk1TLnxFxKaMod2DRiCYSjmJRozhp
	 QgsfhsNhTUlXDhY/dasYVlwlM6e51s/g4BQf82zOVbRXukYM4uBnwSqvPkd259NS2d
	 MngVOrAlXXV0QSCf87w2X00anCV4JlF0vw3eUmc4L/uhyknGEDehVy/KCvYqa5zZwn
	 zYmwvJMClFdSQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 22:47:04 +0100
Subject: [PATCH v20 06/14] KVM: arm64: Validate GCS exception lock when
 emulating ERET
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-gcs-v20-6-f31750bdfadb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3807; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bxVsB4rskIKiN1PVeIRuoZGQxKFGSMyZpayUqX7OE88=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBql0ih5Tuxm01Ccs5r23+rEkMvOu6q3wxrigZEO
 HcQ18QxVZaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapdIoQAKCRAk1otyXVSH
 0Pf4B/4nRi9ComSxb4Ck0ja/JaqjMy3dr/ZrdhDUUElLzcIr+Awkq/MO2hMBdUksVXV8aYMr/jC
 iAuBZTEkxvHHKDVp9lok7PS/ViOGfl1uY5hqCghgJdZvCWf4klKP/ZjRHpWisLzYFJfpWgvI68M
 1Zz7ovId5SDzC9o/bSo4TWXknAZCMxcQ2XlnfzcDVg/wGf8LhL8ltGxEiPhdoIpmnFLRjN1+L4b
 FwPMqzqDFGB0Jqt/tZMdMdNEN2jYRVcKQ1RnZ/uwAL8AZi4Rqkd1nIuO51S/N5wbnmjIwIguafk
 0NxH70532VXwp4po2XVZQYQD0dupQjkKhC2qb1AeBV2jRo1j
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

As per DDI0487 R_TYTWB GCS adds an additional case where an illegal
exception return can be generated. If all of:

 - PSTATE.EXLOCK is 0.
 - The EL is not being changed by the ERET.
 - GCSCR_ELx.EXLOCKEN is 1.

are true then the return is illegal. Emulate this behaviour when
emulating ERET for nested guests, while we're at it using the symbolic
definition for EXLOCK in SPSR.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_nested.h | 32 ++++++++++++++++++++++++++++++++
 arch/arm64/kvm/emulate-nested.c     |  5 ++++-
 arch/arm64/kvm/hyp/vhe/switch.c     |  4 ++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 1ed708335809..9e595e8e7642 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -240,6 +240,38 @@ static inline bool kvm_auth_eretax(struct kvm_vcpu *vcpu, u64 *elr)
 }
 #endif
 
+#ifdef CONFIG_ARM64_GCS
+/* See IllegalExceptionReturn() pseudocode */
+static inline bool kvm_check_illegal_exlock_return(struct kvm_vcpu *vcpu,
+						   u64 spsr)
+{
+	u64 pstate, cur_mode, target_mode;
+
+	if (!kvm_has_gcs(vcpu->kvm))
+		return false;
+
+	if (vcpu->arch.ctxt.regs.pstate & PSR_EXLOCK_BIT)
+		return false;
+
+	/* Check the EL only, ignore thread mode */
+	pstate = vcpu->arch.ctxt.regs.pstate;
+	cur_mode = (pstate & PSR_MODE_MASK) | PSR_MODE_THREAD_BIT;
+	target_mode = (spsr & PSR_MODE_MASK) | PSR_MODE_THREAD_BIT;
+
+	if (cur_mode != target_mode)
+		return false;
+
+	return vcpu_read_sys_reg(vcpu, GCSCR_EL2) & GCSCR_ELx_EXLOCKEN;
+}
+
+#else
+static inline bool kvm_check_illegal_exlock_return(struct kvm_vcpu *vcpu,
+						   u64 spsr)
+{
+	return false;
+}
+#endif
+
 #define KVM_NV_GUEST_MAP_SZ	(KVM_PGTABLE_PROT_SW1 | KVM_PGTABLE_PROT_SW0)
 
 static inline u64 kvm_encode_nested_level(struct kvm_s2_trans *trans)
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 3806ff0920fe..170c0c521f22 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2748,10 +2748,13 @@ static u64 kvm_check_illegal_exception_return(struct kvm_vcpu *vcpu, u64 spsr)
 	 * - trying to return to an illegal M value
 	 * - trying to return to a 32bit EL
 	 * - trying to return to EL1 with HCR_EL2.TGE set
+	 * - GCSCR_ELx.EXLOCKEN is 1 and PSTATE.EXLOCK is 0 when attempting
+	 *   to return from ELx the same EL.
 	 */
 	if (mode == PSR_MODE_EL3t   || mode == PSR_MODE_EL3h ||
 	    mode == 0b00001         || (mode & BIT(1))       ||
 	    (spsr & PSR_MODE32_BIT) ||
+	    kvm_check_illegal_exlock_return(vcpu, spsr) ||
 	    (vcpu_el2_tge_is_set(vcpu) && (mode == PSR_MODE_EL1t ||
 					   mode == PSR_MODE_EL1h))) {
 		u64 mask;
@@ -2778,7 +2781,7 @@ static u64 kvm_check_illegal_exception_return(struct kvm_vcpu *vcpu, u64 spsr)
 
 		mask = PSR_MODE_MASK | PSR_MODE32_BIT;
 		if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
-			mask |= BIT_ULL(34);	/* PSTATE.EXLOCK */
+			mask |= PSR_EXLOCK_BIT;
 
 		spsr |= *vcpu_cpsr(vcpu) & mask;
 		spsr |= PSR_IL_BIT;
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 7875911c0506..af59d1bf51ad 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -383,6 +383,10 @@ static bool kvm_hyp_handle_eret(struct kvm_vcpu *vcpu, u64 *exit_code)
 		return false;
 	}
 
+	/* Push GCS exception lock failures into the slow path */
+	if (kvm_check_illegal_exlock_return(vcpu, spsr))
+		return false;
+
 	/* If ERETAx fails, take the slow path */
 	if (esr_iss_is_eretax(esr)) {
 		if (!(vcpu_has_ptrauth(vcpu) && kvm_auth_eretax(vcpu, &elr)))

-- 
2.47.3


