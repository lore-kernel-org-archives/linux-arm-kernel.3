Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2062ACA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 06:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpWmgxfj2V/dQ3mAnOZRDc6v+uecxWMRnny+ARxOkv4=; b=0uppV/MqYakf/4q2cimdQIz5Vf
	QhO6Ry0agSn25eUTlQjT7dHcPOvVzUUMws54R1VP+71eI/ouWIEp5OzkWW2NlJoxh+IH3Uf+BIgCz
	U7YHOop8g4uoN/KH+9JjeMK52nVFav1hk5XDOYVsn0Li3hg7Go0hg8t/BkqEXPj1YfjDBigDA/kXi
	9rnrUgpphexxCtwYNxdU6O127308WXR9wzJ3fswIoZh6H1joAldJflH+8I4EIzfmkIYXAGQJo5nsh
	1qtZf8vLXS6c8euDJ9ITDikneODdgoE/aFnctp5DsHYFZQBXKVy7stg6E1gauVKei7iXUMqP7TCYf
	da4AtMhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLSX-00000001iUW-3TEQ;
	Fri, 22 Aug 2025 06:41:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upGza-00000001BZa-2xNG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 01:54:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0AA41A58721;
	Fri, 22 Aug 2025 01:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F32C4CEEB;
	Fri, 22 Aug 2025 01:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755827697;
	bh=Sp+TAelZmX24aLyaDocHISqg813AdGCzZMNr5P6CYI4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HfYf91E2maGA3GZ8dIacAgPOtLnD5vsLR0VAXS7RANNRgZyUI4K32k7JgrGDzG4aG
	 +gIH/aHm5qG+fmz/mUrULpM1rocjGLAbixmApGDjkejv6AWIe5dbaU5wOrPbplUTog
	 t062FY05TU+E7fjwKxJoSSkAnV+izGSzBF+WVYOYiX/3haQStAp5sD3BP6L8tQTvKC
	 We+Mknfof6x/P1NAD9u+dvzNcY6h4qHx7mcT8QNkXVpUgenVTEaV4cLMT2qMlPRWsG
	 2higbfMFDqA8pftTeePNuAhpPYlHoGKbm7y2IHhBQ8GeH8VZMg9smD4miIYE0UHaIH
	 TTYRZBtqBZD0A==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 Aug 2025 02:53:37 +0100
Subject: [PATCH v7 08/29] KVM: arm64: Pull ctxt_has_ helpers to start of
 sysreg-sr.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-kvm-arm64-sme-v7-8-7a65d82b8b10@kernel.org>
References: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
In-Reply-To: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
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
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=3907; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Sp+TAelZmX24aLyaDocHISqg813AdGCzZMNr5P6CYI4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBop82+8E+qQ2biWvK54LmYXwac54UiR74PjxM5c
 wdjpRzgNQ2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKfNvgAKCRAk1otyXVSH
 0OD7B/4mpUxOxRZaFS6g5BXtGs46mMGQgGp7fPIF5ZZ4/z1eMQW8mNdsTffRGiEGK7X9A4Y2gOl
 Htt4punjrKq5/54ovofB9Vfs4Bcv/IxX3EtBImJmI/SGnKtg/iECBTpisV8B7jfFQw644aw9Rlo
 k1Qctanl6Ck0zDZsFBzeOY3/3moQo6OcZEuTfJfLTdyhXQ+Jv5Ci8dpZphF8eXJ0CuutC/tNmBS
 xGiZsYIaMlIDLQG027Gw9lRJ4noRA5JI4DEbiZ6wX+bRNEKKCHOpqUoIKlbZQG1Zf+iPVATd5fK
 LDSA23Je2Ravfi5Bs6iZMES4+My1IkwN9oSFP5GGNnWZ3w+c
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_185458_879041_4B198EFE 
X-CRM114-Status: GOOD (  12.44  )
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
2.39.5


