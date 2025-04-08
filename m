Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927E6C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 18:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7YQrHygwgkPoJf/MfgSb7sVcYw33GA+KxOxJM2BSjo=; b=zgpboTJx/MIgE334tH/qB54LbL
	aklJD/6ZJtHRNvIouv0YkC6UTAVDVvjR5AqaOR5tMlSURHqJTU7HjP++LHHaeH1feUITFvTiHQBh2
	T/co/ie/cuxIWPB5m6nnSxAvZYPnZgnjv30pzWEBc950EQXtg/wJ4axniLmg39YCYfls1uRLwLZx4
	KyT4tCyuHMbeUUKBmeZD7gZ3wuP+52a6cUjRqff4WF0y8+pFYVx/eN6v4V4Wbdo1lALSGa6OtoV+9
	SZFFaXNmtgb7+q2jBcXdaA3XJLR5fW14/jB1HFePddr8A4is5GnUuvJHyEVfU87SavZrzQXp2k7Da
	JTPHoHbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2De0-000000056Te-3IuI;
	Tue, 08 Apr 2025 18:25:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DaW-000000055r6-3NI7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 18:22:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DE7C44B0D;
	Tue,  8 Apr 2025 18:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86E8C4CEEC;
	Tue,  8 Apr 2025 18:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744136540;
	bh=m/dwRDdQP4Th7ONfZTRuvj+AHHMjMEezB28FzQTPJTg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cleALQBSbh8B/Zhg9RszuxECxGyu7NNBZ/1SMIsvKNIAwnBCf19AdEUwVUlClXO4N
	 5z0zxe9KbIpBeGMlHNiJwmNDpv8syOFUu0wEfzPSruDlZyTx6PW5oRmFIh/QHBctmO
	 JUrXu++9hOJoxPrtd297kB4nJ5QllVn79RcZHImwO1yIlPt9NV3I8ihiJjXIVDbcWd
	 n3wrYsEzPMdMzAKJzoUBtcRHhAN9UhK4IddE0qHshd6EuFDEFADPaULxuBuhv5+WI0
	 m+2vEI/So2YVEnFKssD4ZUdyVeEnWoJDxLlY0V+cp91HGt+i06CY2q+wS7+92qrPOX
	 IXO0G8Lr1tFtA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 08 Apr 2025 19:09:56 +0100
Subject: [PATCH 5.15 v3 01/11] KVM: arm64: Get rid of host SVE
 tracking/saving
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-stable-sve-5-15-v3-1-ca9a6b850f55@kernel.org>
References: <20250408-stable-sve-5-15-v3-0-ca9a6b850f55@kernel.org>
In-Reply-To: <20250408-stable-sve-5-15-v3-0-ca9a6b850f55@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6329; i=broonie@kernel.org;
 h=from:subject:message-id; bh=O3k+gOgTUGiM5t6hYHLkd+5jlCwRM5xVq/AQhFHUOBY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn9WlM3QOnn7g6n/M/+7XLgjdx0mDw5QJUdy6HYhQ8
 9+RXF/iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ/VpTAAKCRAk1otyXVSH0MIHB/
 9j4L5NDGCIuTCQOnPjBwi+ZqVWmTsxPIaDxgKk/GWQK4VlaUY8MiBsYMOEaJbeqn0CKpgj6sHeuOHL
 Cr5rRKxOqiFvkpCr6Gsbj161kFgpuqJHdJxOhF/eXCtWmehvRHPxNupiboxtGDuo/xl1iljy9NTGpm
 oI21i6QG4i1Q0U5N6gEaZP+84MOISavam5wjq+iWOOGwmZj6mVLxgkk/8nL2/lISXXGAihXvJYwBQF
 f9T9YmMAL1tD4Kz2+nP2qz9wPtAWa+FokhT9FAKhkj4eyLqAsvOnOZhUvF4FjRRnI2pbhI2w11cWbI
 iT+fHu+RIgJ732RhJAHr6vGvdSzE0T
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_112220_895193_8B29A964 
X-CRM114-Status: GOOD (  23.04  )
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

From: Marc Zyngier <maz@kernel.org>

[ Upstream commit 8383741ab2e773a992f1f0f8acdca5e7a4687c49 ]

The SVE host tracking in KVM is pretty involved. It relies on a
set of flags tracking the ownership of the SVE register, as well
as that of the EL0 access.

It is also pretty scary: __hyp_sve_save_host() computes
a thread_struct pointer and obtains a sve_state which gets directly
accessed without further ado, even on nVHE. How can this even work?

The answer to that is that it doesn't, and that this is mostly dead
code. Closer examination shows that on executing a syscall, userspace
loses its SVE state entirely. This is part of the ABI. Another
thing to notice is that although the kernel provides helpers such as
kernel_neon_begin()/end(), they only deal with the FP/NEON state,
and not SVE.

Given that you can only execute a guest as the result of a syscall,
and that the kernel cannot use SVE by itself, it becomes pretty
obvious that there is never any host SVE state to save, and that
this code is only there to increase confusion.

Get rid of the TIF_SVE tracking and host save infrastructure altogether.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h       |  1 -
 arch/arm64/kvm/fpsimd.c                 | 20 +++++---------------
 arch/arm64/kvm/hyp/include/hyp/switch.h | 27 +++------------------------
 3 files changed, 8 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 91038fa2e5e0..4e84d75ae91c 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -410,7 +410,6 @@ struct kvm_vcpu_arch {
 #define KVM_ARM64_DEBUG_DIRTY		(1 << 0)
 #define KVM_ARM64_FP_ENABLED		(1 << 1) /* guest FP regs loaded */
 #define KVM_ARM64_FP_HOST		(1 << 2) /* host FP regs loaded */
-#define KVM_ARM64_HOST_SVE_IN_USE	(1 << 3) /* backup for host TIF_SVE */
 #define KVM_ARM64_HOST_SVE_ENABLED	(1 << 4) /* SVE enabled for EL0 */
 #define KVM_ARM64_GUEST_HAS_SVE		(1 << 5) /* SVE exposed to guest */
 #define KVM_ARM64_VCPU_SVE_FINALIZED	(1 << 6) /* SVE config completed */
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 5621020b28de..2d15e1d6e214 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -66,22 +66,15 @@ int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu)
  *
  * Here, we just set the correct metadata to indicate that the FPSIMD
  * state in the cpu regs (if any) belongs to current on the host.
- *
- * TIF_SVE is backed up here, since it may get clobbered with guest state.
- * This flag is restored by kvm_arch_vcpu_put_fp(vcpu).
  */
 void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 {
 	BUG_ON(!current->mm);
+	BUG_ON(test_thread_flag(TIF_SVE));
 
-	vcpu->arch.flags &= ~(KVM_ARM64_FP_ENABLED |
-			      KVM_ARM64_HOST_SVE_IN_USE |
-			      KVM_ARM64_HOST_SVE_ENABLED);
+	vcpu->arch.flags &= ~KVM_ARM64_FP_ENABLED;
 	vcpu->arch.flags |= KVM_ARM64_FP_HOST;
 
-	if (test_thread_flag(TIF_SVE))
-		vcpu->arch.flags |= KVM_ARM64_HOST_SVE_IN_USE;
-
 	if (read_sysreg(cpacr_el1) & CPACR_EL1_ZEN_EL0EN)
 		vcpu->arch.flags |= KVM_ARM64_HOST_SVE_ENABLED;
 }
@@ -115,13 +108,11 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
 void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
 {
 	unsigned long flags;
-	bool host_has_sve = system_supports_sve();
-	bool guest_has_sve = vcpu_has_sve(vcpu);
 
 	local_irq_save(flags);
 
 	if (vcpu->arch.flags & KVM_ARM64_FP_ENABLED) {
-		if (guest_has_sve) {
+		if (vcpu_has_sve(vcpu)) {
 			__vcpu_sys_reg(vcpu, ZCR_EL1) = read_sysreg_el1(SYS_ZCR);
 
 			/* Restore the VL that was saved when bound to the CPU */
@@ -131,7 +122,7 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
 		}
 
 		fpsimd_save_and_flush_cpu_state();
-	} else if (has_vhe() && host_has_sve) {
+	} else if (has_vhe() && system_supports_sve()) {
 		/*
 		 * The FPSIMD/SVE state in the CPU has not been touched, and we
 		 * have SVE (and VHE): CPACR_EL1 (alias CPTR_EL2) has been
@@ -145,8 +136,7 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
 			sysreg_clear_set(CPACR_EL1, CPACR_EL1_ZEN_EL0EN, 0);
 	}
 
-	update_thread_flag(TIF_SVE,
-			   vcpu->arch.flags & KVM_ARM64_HOST_SVE_IN_USE);
+	update_thread_flag(TIF_SVE, 0);
 
 	local_irq_restore(flags);
 }
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index ecd41844eda0..269ec3587210 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -207,16 +207,6 @@ static inline bool __populate_fault_info(struct kvm_vcpu *vcpu)
 	return __get_fault_info(esr, &vcpu->arch.fault);
 }
 
-static inline void __hyp_sve_save_host(struct kvm_vcpu *vcpu)
-{
-	struct thread_struct *thread;
-
-	thread = container_of(vcpu->arch.host_fpsimd_state, struct thread_struct,
-			      uw.fpsimd_state);
-
-	__sve_save_state(sve_pffr(thread), &vcpu->arch.host_fpsimd_state->fpsr);
-}
-
 static inline void __hyp_sve_restore_guest(struct kvm_vcpu *vcpu)
 {
 	sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
@@ -228,21 +218,14 @@ static inline void __hyp_sve_restore_guest(struct kvm_vcpu *vcpu)
 /* Check for an FPSIMD/SVE trap and handle as appropriate */
 static inline bool __hyp_handle_fpsimd(struct kvm_vcpu *vcpu)
 {
-	bool sve_guest, sve_host;
+	bool sve_guest;
 	u8 esr_ec;
 	u64 reg;
 
 	if (!system_supports_fpsimd())
 		return false;
 
-	if (system_supports_sve()) {
-		sve_guest = vcpu_has_sve(vcpu);
-		sve_host = vcpu->arch.flags & KVM_ARM64_HOST_SVE_IN_USE;
-	} else {
-		sve_guest = false;
-		sve_host = false;
-	}
-
+	sve_guest = vcpu_has_sve(vcpu);
 	esr_ec = kvm_vcpu_trap_get_class(vcpu);
 	if (esr_ec != ESR_ELx_EC_FP_ASIMD &&
 	    esr_ec != ESR_ELx_EC_SVE)
@@ -269,11 +252,7 @@ static inline bool __hyp_handle_fpsimd(struct kvm_vcpu *vcpu)
 	isb();
 
 	if (vcpu->arch.flags & KVM_ARM64_FP_HOST) {
-		if (sve_host)
-			__hyp_sve_save_host(vcpu);
-		else
-			__fpsimd_save_state(vcpu->arch.host_fpsimd_state);
-
+		__fpsimd_save_state(vcpu->arch.host_fpsimd_state);
 		vcpu->arch.flags &= ~KVM_ARM64_FP_HOST;
 	}
 

-- 
2.39.5


