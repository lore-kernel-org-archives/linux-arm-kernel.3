Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42371C44512
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 23:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ng0eoSfPdDRfiXjYHgTRJSjiJJN1g/dJiDj1pJZB0R0=; b=PnJHJKTXZUeyErUb/ZKtabtGHW
	r6fsqb9EvrtQ6CkDxurgsqSJXu3TSc8qNS9JjchERTPpCA6YZa0JJj2vG0x5VfQwGb7W4Y7ta/McU
	Hq3UhLJjkegHxPfdLNDEYJa4eLQNSM6E64xi7ycoDSLBYDV9qTvlHkZa+5kwlQZNuv1Sk/g8OReR9
	CnEGw15v2AHD+KqWSbElC6u1FXojOOAr4tPDg5SE8NKxe1mDlBsOBNtKd7W0EKTzm2YvF2BUEZxbW
	wc+/FHJkZqcRbosKrNdOErzJiwoNSiL4rRM+sZblcnv0G7N/MMgu1gWbndj/EB04wHqR7z3G8/YCE
	B/kiLOKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlaea-00000005SXG-20fP;
	Sun, 19 Jul 2026 23:10:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlaeW-00000005SUg-2dqm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 23:10:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5ACF544E93;
	Sun, 19 Jul 2026 23:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571431F000E9;
	Sun, 19 Jul 2026 23:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784502632;
	bh=Ng0eoSfPdDRfiXjYHgTRJSjiJJN1g/dJiDj1pJZB0R0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hdXyEEzJRFbgjLtyC/lq1G4FbKuRVlOSgHD0q1QQoQ/gIAgy7tMtKLTxhgwiSITF9
	 Ko5UhCDHeBmrIf0dAdHF1wbnPOuEVSxyz52sXHzeNpkwiWkNbe45/IoOu1U9+I6N7R
	 I+6QJDcoycnIl2afhe7OS4Yw4D1JNqvnN5CpJQHPc8U4iQLtBnV6F3lfe4anmposdf
	 M9OvDCFNRVjAWzdUcDrgfyAuS1CHuP6pn+svPuoVZ8bYQMhkyUdZLF25ywGCk8E9mj
	 SQMhw1joyq7iZnq2vAkSO8U0+YOobAlXnCcESOlhakIKoFEUmZ58uXlFRGPWVsJZAR
	 kSUxfB+53qHKQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 20 Jul 2026 00:07:35 +0100
Subject: [PATCH v13 08/32] KVM: arm64: Handle FEAT_IDST for guest accesses
 to hidden registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kvm-arm64-sme-v13-8-d9abd3ffa245@kernel.org>
References: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
In-Reply-To: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
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
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXVktAsIYP374sv1xm9qZtN9am1d8QeKvklDxA
 UIjA3x2+huJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal1ZLQAKCRAk1otyXVSH
 0HRVB/4u8LqyVRGfm1HCUwUlndcEylq/XCAG1KSUHIsmDxlV/k7cGXPEAFE7xIU4k3gCnmjmpci
 YgJjYWjtJbMmaIt+0dNFLhzomj8pGk18eNILi0jpr5TleZdX/tUg9DWlPjUXAGjSSojFqdN1eR5
 4iKoesXM3npTTKZBtnLKdvcvYYmrLSgZB5EbPSE9c11P8QoesDUuumRRGlPEVFdS1kJY7+QITC9
 X7HqCBbHPdjH5MX1LbUiQINNM4LnVvbhYKaSTq7H9FXmnXjUQO2YrpKtwdVsz+D/T/wsWdQIjOQ
 6TgjtBeRfsQY+HIzELsouDRQddytVajvf8esv2zLXWGfC7ib
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


