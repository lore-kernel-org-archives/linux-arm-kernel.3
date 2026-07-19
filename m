Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3088CC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 23:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+YU88ZRUFkvSVuCkK74k+hG8HaktkRVNfkNeUzR+i14=; b=maivosSYdDAfbErI4WtOcw3450
	a7nBy4VpqVcaGL9em5GCuK79BroI6A0XxJ7kY3llDKEnwkgSFtvzkKmAm3LuVkwauK7WRfsVumLh8
	KaB+GZgRbDDm65COhGrFCWijHoIHGyP03zSO5sdP7Y7NbcqFibtAQtzKeP4DLRHFeqNZL51aku4du
	RWDTdFXD/mmH1GweGt2zZ/AOM0Q58RnkURpc5pyU+SAHdLgDfTbusYPZRCkH0scjLJilXo1Qqr7ui
	RXCgU089bS792vKRCBG1NZF2irDgtDSEsDMsgn+bP6qPrMhMBAS16v4sQvAgSuMevts3Fd7LjRFBW
	1n2mi8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlael-00000005Sfw-2UIe;
	Sun, 19 Jul 2026 23:10:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlaeb-00000005SYM-1eKT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 23:10:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D0E3560120;
	Sun, 19 Jul 2026 23:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42441F00A3A;
	Sun, 19 Jul 2026 23:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784502636;
	bh=+YU88ZRUFkvSVuCkK74k+hG8HaktkRVNfkNeUzR+i14=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lKZST2U7ubjF94vzjCLR7/tBNZHKWq/SqHHaeYDDFUgkJRTsm/NYPp1dN28Grf1zc
	 ezK3qcf4oUDbMhB58cHm3ldJGm0lU0htcVBcvOit1dcOqGuY82vy9kePDBfQa+K934
	 QTvvnwrFe77Xd/sSbjtQmBs8BDG0ZJCAOiKNCpW0OsJEZKUaQifOXxDa6e0UG8RwU+
	 eo7D+AaFTnwz9JpcCsWjrMBRgU8L25wEK8kqY4ZZuzzCtPd1U4CMDwcbyykhhXnVPt
	 TWJaEZj0NUzizt9RGJSJz7JiHRrVKz+M1wFuEBOtB0fC4n5JNIvuesw8L06i+sgsqt
	 zVopxsQUaJK8g==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 20 Jul 2026 00:07:36 +0100
Subject: [PATCH v13 09/32] KVM: arm64: Pull ctxt_has_ helpers to start of
 sysreg-sr.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kvm-arm64-sme-v13-9-d9abd3ffa245@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4004; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1qAIu+pXeO/t0Rjmal4q8j7FSwr2awFBos2cAAJK0lg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXVkuuB2WFjp/yCHTYWLJwZ//ZY+ziiL++zNgW
 7XZWKWf06iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal1ZLgAKCRAk1otyXVSH
 0IOAB/9zm0mTMrpACLfYQpRp5JTRK32UJLPDANkxqiujJAMEA2cYcOIiCgWaIDyKrlbL4JHlx/u
 lzEHf8UVQaXur8zc9E2qtt1ZJRLIGz6K+wGp+A0s7OVC3USUcnBgvYuedaWSFSabNL/sc9R+wwB
 NnKmKXctmfhytkAl+fKtrs/01ruaaYRZqrVbNfNTybysrw0gdiRT9mfZD7rVeXcPOJ9scdp2FTH
 ir/6Ss2e8oBTBQyrpK2YM8dC+340heBL/7UDYXKBbjWaJTC9RQFANscflSgZl+XbXbbhMqFVkIL
 oxHg5yvNLBElRbkKSaCmMQcmOYBs8zMO9fYbBPBqb2GnIMjG
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

Rather than add earlier prototypes of specific ctxt_has_ helpers let's just
pull all their definitions to the top of sysreg-sr.h so they're all
available to all the individual save/restore functions.

Reviewed-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Jean-Philippe Brucker <jpb@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 84 +++++++++++++++---------------
 1 file changed, 41 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index a17cbe7582de..5624fd705ae3 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -16,8 +16,6 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 
-static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt);
-
 static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
 {
 	struct kvm_vcpu *vcpu = ctxt->__hyp_running_vcpu;
@@ -28,47 +26,6 @@ static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
 	return vcpu;
 }
 
-static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
-{
-	return host_data_ptr(host_ctxt) != ctxt;
-}
-
-static inline u64 *ctxt_mdscr_el1(struct kvm_cpu_context *ctxt)
-{
-	struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
-
-	if (ctxt_is_guest(ctxt) && kvm_host_owns_debug_regs(vcpu))
-		return &vcpu->arch.external_mdscr_el1;
-
-	return &ctxt_sys_reg(ctxt, MDSCR_EL1);
-}
-
-static inline u64 ctxt_midr_el1(struct kvm_cpu_context *ctxt)
-{
-	struct kvm *kvm = kern_hyp_va(ctxt_to_vcpu(ctxt)->kvm);
-
-	if (!(ctxt_is_guest(ctxt) &&
-	      test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &kvm->arch.flags)))
-		return read_cpuid_id();
-
-	return kvm_read_vm_id_reg(kvm, SYS_MIDR_EL1);
-}
-
-static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
-{
-	*ctxt_mdscr_el1(ctxt)	= read_sysreg(mdscr_el1);
-
-	// POR_EL0 can affect uaccess, so must be saved/restored early.
-	if (ctxt_has_s1poe(ctxt))
-		ctxt_sys_reg(ctxt, POR_EL0)	= read_sysreg_s(SYS_POR_EL0);
-}
-
-static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
-{
-	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
-	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
-}
-
 static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
 {
 	struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
@@ -131,6 +88,47 @@ static inline bool ctxt_has_sctlr2(struct kvm_cpu_context *ctxt)
 	return kvm_has_sctlr2(kern_hyp_va(vcpu->kvm));
 }
 
+static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
+{
+	return host_data_ptr(host_ctxt) != ctxt;
+}
+
+static inline u64 *ctxt_mdscr_el1(struct kvm_cpu_context *ctxt)
+{
+	struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
+
+	if (ctxt_is_guest(ctxt) && kvm_host_owns_debug_regs(vcpu))
+		return &vcpu->arch.external_mdscr_el1;
+
+	return &ctxt_sys_reg(ctxt, MDSCR_EL1);
+}
+
+static inline u64 ctxt_midr_el1(struct kvm_cpu_context *ctxt)
+{
+	struct kvm *kvm = kern_hyp_va(ctxt_to_vcpu(ctxt)->kvm);
+
+	if (!(ctxt_is_guest(ctxt) &&
+	      test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &kvm->arch.flags)))
+		return read_cpuid_id();
+
+	return kvm_read_vm_id_reg(kvm, SYS_MIDR_EL1);
+}
+
+static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
+{
+	*ctxt_mdscr_el1(ctxt)	= read_sysreg(mdscr_el1);
+
+	// POR_EL0 can affect uaccess, so must be saved/restored early.
+	if (ctxt_has_s1poe(ctxt))
+		ctxt_sys_reg(ctxt, POR_EL0)	= read_sysreg_s(SYS_POR_EL0);
+}
+
+static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
+{
+	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
+	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
+}
+
 static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
 {
 	ctxt_sys_reg(ctxt, SCTLR_EL1)	= read_sysreg_el1(SYS_SCTLR);

-- 
2.47.3


