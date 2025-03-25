Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A77C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 18:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEOKUtGdCM12QSt2NesujViI1YejaMurytS7Qu7YEdE=; b=qaQqWrIc56gOqMn1id7HMOgxMv
	lZ244bd5+SuI0eoCZ4t3yGzVR39t+CkZxQsIAxsQnOkB49ut1vhP0GHsK+rWnRJL+0fkU2o5HBa5Z
	O0hiDwW7L+3WzzB4N54Mk2jTSZAt0s3awj60gTapLIBhQI6LHSM3pnUKegBRU2JvBZ5k82uZ6Hf3p
	nfR1KBoe+PIllTokV5SkWMuzYwY17OUFqgLGz/hYirCRkjngQxD1wGkVT8Ezi/JXGd6KH+PfxUjPx
	pbAWgAsYSSXOsOTacJLo7iJZfCOSgkw+wucyM5tRr4j6KFwcZzIyTMFGLHG1uGLjkTl+ASqbLAS/x
	wAJdJIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9S6-00000006mih-0vTU;
	Tue, 25 Mar 2025 18:56:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9LB-00000006lTQ-2ctJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 18:49:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14AAE5C6445;
	Tue, 25 Mar 2025 18:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F405C4CEE4;
	Tue, 25 Mar 2025 18:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742928572;
	bh=2+URmYuqU9k3emvb53ht0RW1v5r4YgWgFbXpwB4TljM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YjjZfO5B451az+TLpNEhWv2GonTV2QpL+TjaDxhYeYd3DehPpLGbs5XLrE3dTa5qm
	 PaMX4y+UVZ/8sdLkKQSU3ODCcAKXSdyCJS1c7ZwLR4+PGuyedd04KJP5dVwuA+VO3n
	 li6CwBrC7BnfK7vH2wKtW6cXSlQJOfzu3D3ai5RwtP3CUqSKLX3h39O2C2Rpe7UgBR
	 qdsfLzoAAqzvE0OOhud0cqj9n78kO8FAOrApViH0b+Bwi19/G0N/2Yh1LeCVPzTHm7
	 wwgd5YC5Exr+qRLw0LCWRHGe7mbC0hgzKVOmwL8lGGlVFZH9x7+hNgQRSGWfTLyfZs
	 KAJjb5dL+aAFg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 25 Mar 2025 18:48:17 +0000
Subject: [PATCH 6.1 03/12] arm64/fpsimd: Have KVM explicitly say which FP
 registers to save
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-stable-sve-6-1-v1-3-83259d427d84@kernel.org>
References: <20250325-stable-sve-6-1-v1-0-83259d427d84@kernel.org>
In-Reply-To: <20250325-stable-sve-6-1-v1-0-83259d427d84@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Oliver Upton <oliver.upton@linux.dev>, Oleg Nesterov <oleg@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=7200; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2+URmYuqU9k3emvb53ht0RW1v5r4YgWgFbXpwB4TljM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn4vqobNp43QT6nTfr+EBshJyDuFIV5VCRSn9quLkW
 AlpIxM+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ+L6qAAKCRAk1otyXVSH0K2AB/
 4pH9kqgeQXoNKOe3DSgu8O9E0g1VmM7Gsc6re0W86A7KoNBKbKY46YqlbUlfe68YUIA99/3P96r2YN
 wVgEnMCXbmWbR3LQViAEJnE+OxyZSt98gFM3vwsn6eZC0d8A1ddi6TWey2vc6QVtJqsry70HKN5tJ2
 63OdkP0OE5edN2nr8tZ0nsgW78yrpEfzNRMzLYjjRU8Yl6kchyN/2AuL0ZqOeTPCeDIod+r81bbuRz
 fIL+quOiR/piaYoFvoGAHJVCxDhj+c9txHKmeKtvrDpI4QwOUX212svLMfDyrGVfvEPGTx7ckRKmXJ
 80VXA/QAXnunz1n2WV/xUpBxxbKnO3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_114933_756883_4F6CE458 
X-CRM114-Status: GOOD (  27.57  )
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

[ Upstream commit deeb8f9a80fdae5a62525656d65c7070c28bd3a4 ]

In order to avoid needlessly saving and restoring the guest registers KVM
relies on the host FPSMID code to save the guest registers when we context
switch away from the guest. This is done by binding the KVM guest state to
the CPU on top of the task state that was originally there, then carefully
managing the TIF_SVE flag for the task to cause the host to save the full
SVE state when needed regardless of the needs of the host task. This works
well enough but isn't terribly direct about what is going on and makes it
much more complicated to try to optimise what we're doing with the SVE
register state.

Let's instead have KVM pass in the register state it wants saving when it
binds to the CPU. We introduce a new FP_STATE_CURRENT for use
during normal task binding to indicate that we should base our
decisions on the current task. This should not be used when
actually saving. Ideally we might want to use a separate enum for
the type to save but this enum and the enum values would then
need to be named which has problems with clarity and ambiguity.

In order to ease any future debugging that might be required this patch
does not actually update any of the decision making about what to save,
it merely starts tracking the new information and warns if the requested
state is not what we would otherwise have decided to save.

Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20221115094640.112848-4-broonie@kernel.org
Signed-off-by: Will Deacon <will@kernel.org>
[ Mark: trivial backport ]
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h    |  3 ++-
 arch/arm64/include/asm/processor.h |  1 +
 arch/arm64/kernel/fpsimd.c         | 27 ++++++++++++++++++++++++---
 arch/arm64/kvm/fpsimd.c            |  9 ++++++++-
 4 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index e10894100c7394b3f3156f7475d62646662812d4..7622782d0bb97529867a784bf1db0c14260bac99 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -61,7 +61,8 @@ extern void fpsimd_kvm_prepare(void);
 extern void fpsimd_bind_state_to_cpu(struct user_fpsimd_state *state,
 				     void *sve_state, unsigned int sve_vl,
 				     void *za_state, unsigned int sme_vl,
-				     u64 *svcr, enum fp_type *type);
+				     u64 *svcr, enum fp_type *type,
+				     enum fp_type to_save);
 
 extern void fpsimd_flush_task_state(struct task_struct *target);
 extern void fpsimd_save_and_flush_cpu_state(void);
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 208434a2e9247c9be5c85a032494f256e4c2cd58..1b822e618bb4bb35b7a89d1308bce7f860ee331b 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -123,6 +123,7 @@ enum vec_type {
 };
 
 enum fp_type {
+	FP_STATE_CURRENT,	/* Save based on current task state. */
 	FP_STATE_FPSIMD,
 	FP_STATE_SVE,
 };
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 2e0cecf02bf8fcaa799cf1bc89439a61a2a77973..1f6fd9229e536966292a9751f08103912a48ba07 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -126,6 +126,7 @@ struct fpsimd_last_state_struct {
 	unsigned int sve_vl;
 	unsigned int sme_vl;
 	enum fp_type *fp_type;
+	enum fp_type to_save;
 };
 
 static DEFINE_PER_CPU(struct fpsimd_last_state_struct, fpsimd_last_state);
@@ -356,7 +357,8 @@ void task_set_vl_onexec(struct task_struct *task, enum vec_type type,
  *    but userspace is discouraged from relying on this.
  *
  *    task->thread.sve_state does not need to be non-NULL, valid or any
- *    particular size: it must not be dereferenced.
+ *    particular size: it must not be dereferenced and any data stored
+ *    there should be considered stale and not referenced.
  *
  *  * SVE state - FP_STATE_SVE:
  *
@@ -369,7 +371,9 @@ void task_set_vl_onexec(struct task_struct *task, enum vec_type type,
  *    task->thread.uw.fpsimd_state should be ignored.
  *
  *    task->thread.sve_state must point to a valid buffer at least
- *    sve_state_size(task) bytes in size.
+ *    sve_state_size(task) bytes in size. The data stored in
+ *    task->thread.uw.fpsimd_state.vregs should be considered stale
+ *    and not referenced.
  *
  *  * FPSR and FPCR are always stored in task->thread.uw.fpsimd_state
  *    irrespective of whether TIF_SVE is clear or set, since these are
@@ -459,6 +463,21 @@ static void fpsimd_save(void)
 		vl = last->sve_vl;
 	}
 
+	/*
+	 * Validate that an explicitly specified state to save is
+	 * consistent with the task state.
+	 */
+	switch (last->to_save) {
+	case FP_STATE_CURRENT:
+		break;
+	case FP_STATE_FPSIMD:
+		WARN_ON_ONCE(save_sve_regs);
+		break;
+	case FP_STATE_SVE:
+		WARN_ON_ONCE(!save_sve_regs);
+		break;
+	}
+
 	if (system_supports_sme()) {
 		u64 *svcr = last->svcr;
 
@@ -1709,6 +1728,7 @@ static void fpsimd_bind_task_to_cpu(void)
 	last->sme_vl = task_get_sme_vl(current);
 	last->svcr = &current->thread.svcr;
 	last->fp_type = &current->thread.fp_type;
+	last->to_save = FP_STATE_CURRENT;
 	current->thread.fpsimd_cpu = smp_processor_id();
 
 	/*
@@ -1733,7 +1753,7 @@ static void fpsimd_bind_task_to_cpu(void)
 void fpsimd_bind_state_to_cpu(struct user_fpsimd_state *st, void *sve_state,
 			      unsigned int sve_vl, void *za_state,
 			      unsigned int sme_vl, u64 *svcr,
-			      enum fp_type *type)
+			      enum fp_type *type, enum fp_type to_save)
 {
 	struct fpsimd_last_state_struct *last =
 		this_cpu_ptr(&fpsimd_last_state);
@@ -1748,6 +1768,7 @@ void fpsimd_bind_state_to_cpu(struct user_fpsimd_state *st, void *sve_state,
 	last->sve_vl = sve_vl;
 	last->sme_vl = sme_vl;
 	last->fp_type = type;
+	last->to_save = to_save;
 }
 
 /*
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index a4b4502ad850a5c12f0d2809bdedbba6c6eb957e..89c02ce797b874196eff978464a936dfb020ad02 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -130,9 +130,16 @@ void kvm_arch_vcpu_ctxflush_fp(struct kvm_vcpu *vcpu)
  */
 void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
 {
+	enum fp_type fp_type;
+
 	WARN_ON_ONCE(!irqs_disabled());
 
 	if (vcpu->arch.fp_state == FP_STATE_GUEST_OWNED) {
+		if (vcpu_has_sve(vcpu))
+			fp_type = FP_STATE_SVE;
+		else
+			fp_type = FP_STATE_FPSIMD;
+
 		/*
 		 * Currently we do not support SME guests so SVCR is
 		 * always 0 and we just need a variable to point to.
@@ -141,7 +148,7 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
 					 vcpu->arch.sve_state,
 					 vcpu->arch.sve_max_vl,
 					 NULL, 0, &vcpu->arch.svcr,
-					 &vcpu->arch.fp_type);
+					 &vcpu->arch.fp_type, fp_type);
 
 		clear_thread_flag(TIF_FOREIGN_FPSTATE);
 		update_thread_flag(TIF_SVE, vcpu_has_sve(vcpu));

-- 
2.39.5


