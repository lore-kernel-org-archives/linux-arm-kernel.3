Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95C0C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 13:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ipe8otlxUwk9EKtCHcHQsXumUkaDMpU0wTGubRbdZbE=; b=DfTsPYRv4w32TKs1WVvbISX58m
	uz09cgRazyE1Y+pTYX/ky7XhniRp2PL6SDuLDg8lhYU95uJ6KDflhVm8tVR/6uH8mI2IABBAoZ0Kw
	eLoovIT9VY9wZN24kWCu4VJG9dneOgQzprX17GhM/a3exRR4EqfPjeY26mZscWKJzKLSmGMRE5Oc0
	nWssq9qeCsvaDSr6C3qfX5Lf+Hkog/rI+TsuE6gROZ7hiFmjDe9RFTwNOd5KoK8jnw9kPF4LBdzX2
	PLVBGrUBeYB6faA/MGqP9j6QREJLfmpgqCQmEEnpngZpdWVG/hsZaLenPQYOUUAQOss3cb1NJDSXc
	6BqyfObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hFD-0000000Br2S-40WT;
	Fri, 04 Apr 2025 13:38:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0h5E-0000000BpAJ-49TY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 13:27:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 348F642B71;
	Fri,  4 Apr 2025 13:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87691C4CEE8;
	Fri,  4 Apr 2025 13:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743773264;
	bh=RRrgm1q6EeT2E848Is7OgtYEI0k9m9Vbvkpw1yYV0SY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Fx+CMP94+MV0H0NH20YNkySVoT3FQSOTYf1hsHo3QznxfnlEip4MG368OOpUzzZvM
	 7kZ6FT41NPo9e9bqtnM2Ix3/narlWi4cfEoI8QbcC7Ld/RWk78QAvSBH+oJt6fZA+c
	 HLMibXgVT2/B1/mIlustB/43rt7A7JIBIn59B5f9nY7LFICiBlI11fM2cm9N4j5zCx
	 aYmaNivKEG4BOBEMB/y/eaYVOemN57Du45I0KPmlaq5GrHnXzNJ2MCHWv68A1o6EDN
	 fKRg9DE/HTrjIURUHwPo4QqcnjKxSM//y2quYnuFmfihlJRZehYu9WaX3bVaE+a9iy
	 qQZdOkDtZk1tw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 04 Apr 2025 14:23:38 +0100
Subject: [PATCH RESEND 6.1 05/12] KVM: arm64: Unconditionally save+flush
 host FPSIMD/SVE/SME state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-stable-sve-6-1-v1-5-cd5c9eb52d49@kernel.org>
References: <20250404-stable-sve-6-1-v1-0-cd5c9eb52d49@kernel.org>
In-Reply-To: <20250404-stable-sve-6-1-v1-0-cd5c9eb52d49@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Oliver Upton <oliver.upton@linux.dev>, Oleg Nesterov <oleg@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org, 
 Mark Rutland <mark.rutland@arm.com>, Eric Auger <eauger@redhat.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, Eric Auger <eric.auger@redhat.com>, 
 Florian Weimer <fweimer@redhat.com>, Fuad Tabba <tabba@google.com>, 
 Jeremy Linton <jeremy.linton@arm.com>, Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5370; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1aPGpSPcZz/+QejW/+rfK2C2Ou9/JMy1RmOqGT2RPKc=;
 b=owEBbAGT/pANAwAKASTWi3JdVIfQAcsmYgBn794x/as9Dtp3/K1sGWHY+A01G1WEmhQtqdMt2ubW
 11U0UKuJATIEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ+/eMQAKCRAk1otyXVSH0FbnB/
 dYMFeUdMWGyNJP/zBhNKpYDQAAzSidAnZX0UXHuZf2JbeN6N/S23JgBBLzUDXTOsf9ETtVMZiy7wQQ
 3cr3Zbd1OCLlydGDHrwxPymN7LEGBLGkTbj5dHH7SQyELWUzxTLpmB19qnJoHAFFWLQ/Z18Tpdx3bl
 KTzRM6wEouGHIBvRQmqCVJ1NEtJrKNqMi8ev3AAsSHGXGp5skHfH5xFTLl+6JBzfcOcmuV7Mm4/U5I
 lVJj9V0oetL+Kp6jsxgAqwR2ALLwusIv6RFw/rGEiny5rM6XTvlp6Eo5DGgO0jQjarkfu7A/r/XoPI
 TkNwofqgloeIk/4ET2TvXnwslHdh8=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_062745_076078_CB9E56C9 
X-CRM114-Status: GOOD (  23.38  )
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

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit fbc7e61195e23f744814e78524b73b59faa54ab4 ]

There are several problems with the way hyp code lazily saves the host's
FPSIMD/SVE state, including:

* Host SVE being discarded unexpectedly due to inconsistent
  configuration of TIF_SVE and CPACR_ELx.ZEN. This has been seen to
  result in QEMU crashes where SVE is used by memmove(), as reported by
  Eric Auger:

  https://issues.redhat.com/browse/RHEL-68997

* Host SVE state is discarded *after* modification by ptrace, which was an
  unintentional ptrace ABI change introduced with lazy discarding of SVE state.

* The host FPMR value can be discarded when running a non-protected VM,
  where FPMR support is not exposed to a VM, and that VM uses
  FPSIMD/SVE. In these cases the hyp code does not save the host's FPMR
  before unbinding the host's FPSIMD/SVE/SME state, leaving a stale
  value in memory.

Avoid these by eagerly saving and "flushing" the host's FPSIMD/SVE/SME
state when loading a vCPU such that KVM does not need to save any of the
host's FPSIMD/SVE/SME state. For clarity, fpsimd_kvm_prepare() is
removed and the necessary call to fpsimd_save_and_flush_cpu_state() is
placed in kvm_arch_vcpu_load_fp(). As 'fpsimd_state' and 'fpmr_ptr'
should not be used, they are set to NULL; all uses of these will be
removed in subsequent patches.

Historical problems go back at least as far as v5.17, e.g. erroneous
assumptions about TIF_SVE being clear in commit:

  8383741ab2e773a9 ("KVM: arm64: Get rid of host SVE tracking/saving")

... and so this eager save+flush probably needs to be backported to ALL
stable trees.

Fixes: 93ae6b01bafee8fa ("KVM: arm64: Discard any SVE state when entering KVM guests")
Fixes: 8c845e2731041f0f ("arm64/sve: Leave SVE enabled on syscall if we don't context switch")
Fixes: ef3be86021c3bdf3 ("KVM: arm64: Add save/restore support for FPMR")
Reported-by: Eric Auger <eauger@redhat.com>
Reported-by: Wilco Dijkstra <wilco.dijkstra@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>
Tested-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Florian Weimer <fweimer@redhat.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Jeremy Linton <jeremy.linton@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20250210195226.1215254-2-mark.rutland@arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
[ Mark: Handle vcpu/host flag conflict, remove host_data_ptr() ]
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 25 -------------------------
 arch/arm64/kvm/fpsimd.c    | 18 ++++++++++--------
 2 files changed, 10 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 3fcacbce5d42..47425311acc5 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1671,31 +1671,6 @@ void fpsimd_signal_preserve_current_state(void)
 		sve_to_fpsimd(current);
 }
 
-/*
- * Called by KVM when entering the guest.
- */
-void fpsimd_kvm_prepare(void)
-{
-	if (!system_supports_sve())
-		return;
-
-	/*
-	 * KVM does not save host SVE state since we can only enter
-	 * the guest from a syscall so the ABI means that only the
-	 * non-saved SVE state needs to be saved.  If we have left
-	 * SVE enabled for performance reasons then update the task
-	 * state to be FPSIMD only.
-	 */
-	get_cpu_fpsimd_context();
-
-	if (test_and_clear_thread_flag(TIF_SVE)) {
-		sve_to_fpsimd(current);
-		current->thread.fp_type = FP_STATE_FPSIMD;
-	}
-
-	put_cpu_fpsimd_context();
-}
-
 /*
  * Associate current's FPSIMD context with this cpu
  * The caller must have ownership of the cpu FPSIMD context before calling
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index ec82d0191f76..1765f723afd4 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -79,9 +79,16 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 	if (!system_supports_fpsimd())
 		return;
 
-	fpsimd_kvm_prepare();
-
-	vcpu->arch.fp_state = FP_STATE_HOST_OWNED;
+	/*
+	 * Ensure that any host FPSIMD/SVE/SME state is saved and unbound such
+	 * that the host kernel is responsible for restoring this state upon
+	 * return to userspace, and the hyp code doesn't need to save anything.
+	 *
+	 * When the host may use SME, fpsimd_save_and_flush_cpu_state() ensures
+	 * that PSTATE.{SM,ZA} == {0,0}.
+	 */
+	fpsimd_save_and_flush_cpu_state();
+	vcpu->arch.fp_state = FP_STATE_FREE;
 
 	vcpu_clear_flag(vcpu, HOST_SVE_ENABLED);
 	if (read_sysreg(cpacr_el1) & CPACR_EL1_ZEN_EL0EN)
@@ -100,11 +107,6 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 		vcpu_clear_flag(vcpu, HOST_SME_ENABLED);
 		if (read_sysreg(cpacr_el1) & CPACR_EL1_SMEN_EL0EN)
 			vcpu_set_flag(vcpu, HOST_SME_ENABLED);
-
-		if (read_sysreg_s(SYS_SVCR) & (SVCR_SM_MASK | SVCR_ZA_MASK)) {
-			vcpu->arch.fp_state = FP_STATE_FREE;
-			fpsimd_save_and_flush_cpu_state();
-		}
 	}
 }
 

-- 
2.39.5


