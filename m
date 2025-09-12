Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3D9CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwL+WnJhHhBqb/GN46HHQDg8lEaNZNCc2cXEgqTchrQ=; b=Udm3yMnOpgRwz9e/5dcoqj1LPa
	Rc8n3ddaDieTCumtXpMPs4i+goZHCAHIDDCYQv6nRobR05cSSwRLuerb0ZuiTdUK3kAXN1xG8nZWT
	h/8qf6iZy6kL2DcCODleBve4BBss/HMg1G8v9wWCNsGkVLJGNuMNHVAeLpNG9PjocnC/l/8QE0EE7
	V2SEwUqlWdK7CHZkM3FuK1DB20tqvwcFCHHGPGdL0Sb2JhEO3EG3kUvpCQ/upZ9BU6VdTdTrnsOGJ
	BzzepAOEO5gFGOgCJPYm1dx1Ut6rg+eKZk2TfqzusCL2f/+6e/ksJkNwVZdjjiibklsgU2ng4P0zy
	k7x6P1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1r8-00000008qjT-0DGK;
	Fri, 12 Sep 2025 11:22:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1r5-00000008qh1-2wAs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:22:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 231CF60241;
	Fri, 12 Sep 2025 11:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89522C4CEF7;
	Fri, 12 Sep 2025 11:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757676134;
	bh=xaVskRKfvaYHjeBh7ZUg/Y9QZVgaF1sqMd02LaZ+I3g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lvb/I5NWrp7HtvlplxuWpL2vNGssAA7pBilYGFeo9znUH28bTMemg3VODTUQ+KixA
	 72S3Fwd3PD340IhxFsPTo36Eh4pbAbBpFnDGRTGPYDTCJL6ve3P040yvjYtnuKTswm
	 HFzzFeTvv956UFQwEq7V+QgqFxyC60+CpUy7uU58cWez5ZToInUtUl6sllDaeh4N3L
	 CSnunXYlowbD6jMyBu+2vZAkotAiPdhwD1EHWwupDGZ+8MgIqU2M3InbVhtHpchobe
	 x66WdnLa1ybUqom7AYwWtbkI2k0e5LyCWwlj+wRMtebuVovqWoo9xnELzWrKYLMfDe
	 KUQmhR5WJKoEg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 12 Sep 2025 10:25:30 +0100
Subject: [PATCH v16 4/6] KVM: arm64: Validate GCS exception lock when
 emulating ERET
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-arm64-gcs-v16-4-6435e5ec37db@kernel.org>
References: <20250912-arm64-gcs-v16-0-6435e5ec37db@kernel.org>
In-Reply-To: <20250912-arm64-gcs-v16-0-6435e5ec37db@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=openpgp-sha256; l=2656; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xaVskRKfvaYHjeBh7ZUg/Y9QZVgaF1sqMd02LaZ+I3g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoxAJXCR4RyxPnfSQCG7eAvAVupSzVjrtMNwsGJ
 6JUwuO6RhmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaMQCVwAKCRAk1otyXVSH
 0H5+B/9E8krfa7iOgqbgX6kd63Vmw1Uc5wEELqhQ42KmcIl9iZrDNCGP7GpjV3eHls/O7bCcH9n
 Rk8SxCyZl/k7lgtDSiyl7Kqtt+r9wvpuZFEDOKWfoIV+yDHHa5zKiEtCedUQyPAU/tBCQ8Er3jf
 4QgXevDz+SIuD4yh66FtcZjq53tGrmXAFumQiSRx4IN1cTcU1a8kWwu5Jb1PyJFKTLVlR1P+Nl+
 Uc0Gkz3591iMuMXASYuJJuHDLpyo8VwazmAXaf+VmK0xTiBQmAy/e0oGFdyxJtRuEt/8SUdzbzL
 ZR3xu0yw47Co2/+JqwE7U0TU7ociDovb5/zoSo+Bk6SHfNWi
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
emulating ERET for nested guests.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 90cb4b7ae0ff..9b02b85eda64 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2632,6 +2632,41 @@ bool forward_debug_exception(struct kvm_vcpu *vcpu)
 	return forward_mdcr_traps(vcpu, MDCR_EL2_TDE);
 }
 
+/*
+ * A subset of the pseudocode ELFromSPSR(), validity checks are
+ * assumed to have been done in code that is not GCS specific.
+ */
+static inline int exlock_el_from_spsr(u64 spsr)
+{
+	return FIELD_GET(GENMASK(3, 2), spsr);
+}
+
+/* See IllegalExceptionReturn() pseudocode */
+static bool kvm_check_illegal_exlock_return(struct kvm_vcpu *vcpu, u64 spsr)
+{
+	u64 cur_el, target_el;
+	u64 gcscr;
+
+	if (!kvm_has_gcs(vcpu->kvm))
+		return false;
+
+	if (spsr & PSR_EXLOCK_BIT)
+		return false;
+
+	cur_el = exlock_el_from_spsr(vcpu->arch.ctxt.regs.pstate);
+	target_el = exlock_el_from_spsr(spsr);
+
+	if (cur_el != target_el)
+		return false;
+
+	if (vcpu_is_el2(vcpu))
+		gcscr = __vcpu_sys_reg(vcpu, GCSCR_EL2);
+	else
+		gcscr = __vcpu_sys_reg(vcpu, GCSCR_EL1);
+
+	return gcscr & GCSCR_ELx_EXLOCKEN;
+}
+
 static u64 kvm_check_illegal_exception_return(struct kvm_vcpu *vcpu, u64 spsr)
 {
 	u64 mode = spsr & PSR_MODE_MASK;
@@ -2642,12 +2677,15 @@ static u64 kvm_check_illegal_exception_return(struct kvm_vcpu *vcpu, u64 spsr)
 	 * - trying to return to an illegal M value
 	 * - trying to return to a 32bit EL
 	 * - trying to return to EL1 with HCR_EL2.TGE set
+	 * - GCSCR_ELx.EXLOCKEN is 1 and PSTATE.EXLOCK is 0 when attempting
+	 *   to return from ELx the same EL.
 	 */
 	if (mode == PSR_MODE_EL3t   || mode == PSR_MODE_EL3h ||
 	    mode == 0b00001         || (mode & BIT(1))       ||
 	    (spsr & PSR_MODE32_BIT) ||
 	    (vcpu_el2_tge_is_set(vcpu) && (mode == PSR_MODE_EL1t ||
-					   mode == PSR_MODE_EL1h))) {
+					   mode == PSR_MODE_EL1h)) ||
+	    kvm_check_illegal_exlock_return(vcpu, spsr)) {
 		/*
 		 * The guest is playing with our nerves. Preserve EL, SP,
 		 * masks, flags from the existing PSTATE, and set IL.

-- 
2.47.2


