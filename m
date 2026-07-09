Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7C0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 00:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ng0eoSfPdDRfiXjYHgTRJSjiJJN1g/dJiDj1pJZB0R0=; b=vVhtkBNvfiWgf3cGhl9g4ISx2Q
	7cx6q0/AmKoU/EuKqjwWEPVgE8CiSO40ohL7tI7Jtd++D20bpQr/N1CZ8o/bSCRyvLEWvD8vTfOaC
	zJn8NEE8HHiX/Ul++ktroX8e6WpFqLwjpDh3gucAXxdggPwgjvc/yFa27HlC2OO2t9eCy3sCpWSZ6
	cHXdpPFhP3+4OGJo+qWMntEHNB6Ya/oIVt/kLdUFAwrbUuPOjfPYgyaD1k31AycKAwWlPc1Ewq6Sb
	nnBq4D3bu4s9/b0enrK8HQx0TJR0vBrfVFy7w8rtrMy7m+pkEYFv3pJCu//uNMAA1/y/jTpjw7MvL
	admI6log==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd0k-00000000gTK-17Q0;
	Thu, 09 Jul 2026 00:53:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd0i-00000000gRS-34dx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 00:53:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 311BC6111A;
	Thu,  9 Jul 2026 00:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07AF1F00A3A;
	Thu,  9 Jul 2026 00:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783558383;
	bh=Ng0eoSfPdDRfiXjYHgTRJSjiJJN1g/dJiDj1pJZB0R0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hLZDHwtdVJfYkin1OmHE6LlmALn3shzuRWiYf/tMXs8/rZ57O6nBuKJPc2Rlpsq8E
	 LkVyfKMOFzKmAIMet8THqq+uB1o0aFJLRHW06XYfD9OBobviJeyQbyUDLsdnSIGTrH
	 brIZYghv98Zx6btea/AE/x2F/dJvaoS9U/x++BwtMQyPEt5K87CRkZaacSAgXhpvu5
	 Lovq8CacoHfLEzUCt5EuqVY9rgDtIdes6Kjdou8PyfCuRsg3rzIKOqf7i7a8M50a90
	 U1bIWgyXqblRY3XDR06h2LAl/LM2luUf3jKsHaiclwuGRT7+9t8Y80BwmZF+ne4SzB
	 RFJw2aUHh7Gmg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 01:51:43 +0100
Subject: [PATCH v11 06/29] KVM: arm64: Handle FEAT_IDST for guest accesses
 to hidden registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v11-6-32799f66db9d@kernel.org>
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Jean-Philippe Brucker <jpb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3302; i=broonie@kernel.org;
 h=from:subject:message-id; bh=u65dLobDDTfZ3Plqj3qN97beHdtUOk+/y5QgneNdn5w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqTvC+1G/gf0rWduU6sz1wJdtXAqe0wQDYqusg4
 fmly9Rc9AuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak7wvgAKCRAk1otyXVSH
 0G9+B/9g94EnScnAkSL17GenLDRRxzTbkQnlGqYDeJc+8jMDbf7W19NfvM7PcBwUypMA9ihN4DS
 JIndEGPpdA/GeyET80BFF9lXBBVltr86cqtTRhHf7JzMB6aIwVOmg8PAcpl/kscxY/3DrkO1FTH
 xf6VRUmZHeZrrBCYC0CBYMNlQyamAYeSv4wSkgQivQ8dL20cRuslL2V1FdMmn9Y+iIzeoaX8zp0
 0xxLYJUIvO1FGGfqnSSZfRDYLTNrySc19+RrNW8GOFQYaKpnDnlscUTSKilz87nsGqSL11Xf5M9
 qvCDWjpBSA5ve2MIefsQFLi7YX4XyXxwqpFOJS65H/WxAvQx
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

In preparation for adding support for SMIDR_EL1 which is only available in
systems with SME factor out the FEAT_IDST injection from emulate-nested.c
into a helper and use it when handling hidden ID registers, ensuring that
we provide FEAT_IDST behaviour for them.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h |  1 +
 arch/arm64/kvm/emulate-nested.c      |  6 +-----
 arch/arm64/kvm/inject_fault.c        | 15 +++++++++++++++
 arch/arm64/kvm/sys_regs.c            |  6 +++++-
 4 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 5bf3d7e1d92c..994afbf479fc 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -45,6 +45,7 @@ bool kvm_condition_valid32(const struct kvm_vcpu *vcpu);
 void kvm_skip_instr32(struct kvm_vcpu *vcpu);
 
 void kvm_inject_undefined(struct kvm_vcpu *vcpu);
+void kvm_inject_undefined_idreg(struct kvm_vcpu *vcpu);
 void kvm_inject_sync(struct kvm_vcpu *vcpu, u64 esr);
 int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr);
 int kvm_inject_sea(struct kvm_vcpu *vcpu, bool iabt, u64 addr);
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index e688bc5139c1..f49b7b311d09 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2669,11 +2669,7 @@ bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
 		 * helper for the purpose of dealing with FEAT_IDST.
 		 */
 		if (in_feat_id_space(&params)) {
-			if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR2_EL1, IDS, IMP))
-				kvm_inject_sync(vcpu, kvm_vcpu_get_esr(vcpu));
-			else
-				kvm_inject_undefined(vcpu);
-
+			kvm_inject_undefined_idreg(vcpu);
 			return true;
 		}
 
diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index 89982bd3345f..e2f519ca3045 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -331,6 +331,21 @@ void kvm_inject_undefined(struct kvm_vcpu *vcpu)
 		inject_undef64(vcpu);
 }
 
+/**
+ * kvm_inject_undefined_idreg - emulate UnimplementedIDRegister() pseudocode
+ * @vcpu: The vCPU in which to inject the exception
+ *
+ * It is assumed that this code is called from the VCPU thread and that the
+ * VCPU therefore is not currently executing guest code.
+ */
+void kvm_inject_undefined_idreg(struct kvm_vcpu *vcpu)
+{
+	if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR2_EL1, IDS, IMP))
+		kvm_inject_sync(vcpu, kvm_vcpu_get_esr(vcpu));
+	else
+		kvm_inject_undefined(vcpu);
+}
+
 static bool serror_is_masked(struct kvm_vcpu *vcpu)
 {
 	return (*vcpu_cpsr(vcpu) & PSR_A_BIT) && !effective_sctlr2_nmea(vcpu);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 5d5c579d4579..b352cd323e30 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4759,7 +4759,11 @@ static void perform_access(struct kvm_vcpu *vcpu,
 
 	/* Check for regs disabled by runtime config */
 	if (sysreg_hidden(vcpu, r)) {
-		kvm_inject_undefined(vcpu);
+		if (in_feat_id_space(params)) {
+			kvm_inject_undefined_idreg(vcpu);
+		} else {
+			kvm_inject_undefined(vcpu);
+		}
 		return;
 	}
 

-- 
2.47.3


