Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611DAC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wz0SGej6Xy19EgAxic7KIK5EZGnRx2zg64G04W8Nxb8=; b=LPaUbTA/gW7kEm
	pECtk1T089AEQNOnTxzChtILOGy5WUJN3Q/1vIvl9goqh7sS2t4TZK0bfxZYpHL93ubEdxE0XMhM+
	8N+l8s5DcGBh15iO/pX38djn/YdBt1j+mcIeoyCqEyWtNADlhCix8S8hDx9gebUZX0S3Aytj/9KiJ
	p5nDmVd8BkfzrC6mnzN01oUrxOkKlnXv/BkZSFjbSTyLqtUYWjZSrnbVukm01DNMNaOZm0ELPTXgi
	l1Ockh+2W6FMJr2ePdqbK46BgpEuGRk20uagv1pRx4zz5Wpgd9Bj7K0mnPnDZksO+tOfXzf3V7ciV
	3UjX36KwToWvRfhqYcwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRD-00000007N0j-06H0;
	Mon, 07 Sep 2026 16:43:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRC-00000007Mzi-0fId
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:43:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A24860534;
	Mon,  7 Sep 2026 16:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E29A1F00A3A;
	Mon,  7 Sep 2026 16:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799397;
	bh=wz0SGej6Xy19EgAxic7KIK5EZGnRx2zg64G04W8Nxb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XWa2uf4nbXCN69odGjDi+sjEEMAUrlwe/0Q74DE9U7EC1fb0MPj9i0UlLQ8HmKB75
	 cERxTXlV6Swa83k14doSpGGHFg1q96UTcqfuB1tpnCY7HCbsLGzp0V7ovzgTCBae81
	 wMcj48jBXLpNLgSgXEMs4lPRpK5UTalx2XPuK41iVnxFOucDGEkhRxxylqquMUliI+
	 6r8dVpzd0FQppi5SaaVsz92p4JeAWWgQ+dN9V5qXWsG0kzhY5SMwgE1qE2kbMdkq6L
	 cc8DdBmwjPmsXmej41lrQbvC6ct498xLOaE/IeOtZLsduG3em6tEAqatDJ1RwLip6V
	 t9iZUSlgJbHmw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/21] KVM: arm64: Protect TPIDRRO_EL0 across guest entry/exit
Date: Mon,  7 Sep 2026 17:42:30 +0100
Message-ID: <20260907164247.17223-6-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Mostafa Saleh <smostafa@google.com>

To prepare for using TPIDRRO_EL0 to hold 'current' and repurposing
SP_EL0 as an overflow stack pointer, eagerly switch both registers when
entering and exiting the guest.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_asm.h           | 10 ++++++++++
 arch/arm64/kernel/asm-offsets.c            |  1 +
 arch/arm64/kvm/hyp/entry.S                 | 12 ++++++++----
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h |  2 --
 4 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index e5b92ac09e69..1cfe9216a2ff 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -408,6 +408,16 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr, u64 elr_virt,
 	msr	sp_el0, \tmp
 .endm
 
+.macro save_tpidrro_el0 ctxt, tmp
+	mrs	\tmp,	tpidrro_el0
+	str	\tmp,	[\ctxt, #CPU_TPIDRRO_EL0_OFFSET]
+.endm
+
+.macro restore_tpidrro_el0 ctxt, tmp
+	ldr	\tmp,	  [\ctxt, #CPU_TPIDRRO_EL0_OFFSET]
+	msr	tpidrro_el0, \tmp
+.endm
+
 #endif
 
 #endif /* __ARM_KVM_ASM_H__ */
diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index 6038ab3beb25..cb8448cc5f51 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -108,6 +108,7 @@ int main(void)
   DEFINE(VCPU_HCR_EL2,		offsetof(struct kvm_vcpu, arch.hcr_el2));
   DEFINE(CPU_USER_PT_REGS,	offsetof(struct kvm_cpu_context, regs));
   DEFINE(CPU_ELR_EL2,		offsetof(struct kvm_cpu_context, sys_regs[ELR_EL2]));
+  DEFINE(CPU_TPIDRRO_EL0_OFFSET, offsetof(struct kvm_cpu_context, sys_regs[TPIDRRO_EL0]));
   DEFINE(CPU_RGSR_EL1,		offsetof(struct kvm_cpu_context, sys_regs[RGSR_EL1]));
   DEFINE(CPU_GCR_EL1,		offsetof(struct kvm_cpu_context, sys_regs[GCR_EL1]));
   DEFINE(CPU_APIAKEYLO_EL1,	offsetof(struct kvm_cpu_context, sys_regs[APIAKEYLO_EL1]));
diff --git a/arch/arm64/kvm/hyp/entry.S b/arch/arm64/kvm/hyp/entry.S
index 308100ed25de..4c89931a6a92 100644
--- a/arch/arm64/kvm/hyp/entry.S
+++ b/arch/arm64/kvm/hyp/entry.S
@@ -30,8 +30,9 @@ SYM_FUNC_START(__guest_enter)
 	// Store the hyp regs
 	save_callee_saved_regs x1
 
-	// Save hyp's sp_el0
+	// Save hyp's sp_el0 and tpidrro_el0
 	save_sp_el0	x1, x2
+	save_tpidrro_el0 x1, x2
 
 	// Now the hyp state is stored if we have a pending RAS SError it must
 	// affect the host or hyp. If any asynchronous exception is pending we
@@ -66,8 +67,9 @@ alternative_else_nop_endif
 	// when this feature is enabled for kernel code.
 	ptrauth_switch_to_guest x29, x0, x1, x2
 
-	// Restore the guest's sp_el0
+	// Restore the guest's sp_el0 and tpidrro_el0
 	restore_sp_el0 x29, x0
+	restore_tpidrro_el0 x29, x0
 
 	// Restore guest regs x0-x17
 	ldp	x0, x1,   [x29, #CPU_XREG_OFFSET(0)]
@@ -146,8 +148,9 @@ SYM_INNER_LABEL(__guest_exit, SYM_L_GLOBAL)
 	// Store the guest regs x18-x29, lr
 	save_callee_saved_regs x1
 
-	// Store the guest's sp_el0
+	// Store the guest's sp_el0 and tpidrro_el0
 	save_sp_el0	x1, x2
+	save_tpidrro_el0 x1, x2
 
 	adr_this_cpu x2, kvm_hyp_ctxt, x3
 
@@ -161,8 +164,9 @@ SYM_INNER_LABEL(__guest_exit, SYM_L_GLOBAL)
 	// mte_switch_to_hyp(g_ctxt, h_ctxt, reg1)
 	mte_switch_to_hyp x1, x2, x3
 
-	// Restore hyp's sp_el0
+	// Restore hyp's sp_el0 and tpidrro_el0
 	restore_sp_el0 x2, x3
+	restore_tpidrro_el0 x2, x3
 
 	// Now restore the hyp regs
 	restore_callee_saved_regs x2
diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index c382848d3194..b5f7ef8e6371 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -66,7 +66,6 @@ static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
 static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
 {
 	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
-	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
 }
 
 static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
@@ -209,7 +208,6 @@ static inline void __sysreg_restore_common_state(struct kvm_cpu_context *ctxt)
 static inline void __sysreg_restore_user_state(struct kvm_cpu_context *ctxt)
 {
 	write_sysreg(ctxt_sys_reg(ctxt, TPIDR_EL0),	tpidr_el0);
-	write_sysreg(ctxt_sys_reg(ctxt, TPIDRRO_EL0),	tpidrro_el0);
 }
 
 static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,
-- 
2.55.0.979.g7e5102b832-goog


