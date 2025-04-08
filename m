Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD1CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 18:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1HjBXlklLcdesQqC3h2XM3HL2gCYP/Vt59GYna5i34=; b=4A351SOkYbmgMe7YF5AnsQZ3hF
	A9vuI99mo+4kNOn4XUQihtegEzG3tYPNISD961yb1IAXUNkCrvA2nwSE6OxoOCmhNNEG11m0CogA9
	POFU9FdGRRA2echcLhagCfYyVG3s5F9g5BxpPR7+Ae3ZMbDFCyjKGXaLRnO+Fylyvci6svK7kbsiT
	KiDDFIcQq+AjyVXcQdASJMcfnIqSPWHR6egqzMxA8zEJ8YjeuIp16xMbjal5LMip6uc5OK+7K9YI9
	VkWw1iuuOLJsdqYEVjcQOzsFqMQFUy9/QrDMjjcahWnPAmPUj22G2cFVsDNnhdRiuMKeVRAWSeS39
	TdOnu6LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DoT-000000058Bu-0i81;
	Tue, 08 Apr 2025 18:36:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Dap-000000055vw-498c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 18:22:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 080FB4A1B5;
	Tue,  8 Apr 2025 18:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA857C4CEE5;
	Tue,  8 Apr 2025 18:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744136559;
	bh=snqshUSLnJbd+v3fb51JH5LHVcFkGZDOPske10wHJPE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AR5OGwjNDfXPbXYhciE1n44y2H+OKESTbpp9vEWRCdndPEAd1tImFap3UUrqgf5XT
	 6WTOWuzeb7nOCp72RhMi9VxNVxFkHBRZFei9UMIwFWTZb2v5xV38XQroJZrnnrN1ui
	 ccipwFN+Z/+L3fkAr1tnG7ECrLl/i4ZKyEsSOHBMqexkqEONGKiGt7/RBeN7A2F1BX
	 KE6sBaT3uIOrodXt52uP2gMxETYORqmB+1SPX2nDOddx2+9v/unuFZ75Je2gnGyk9k
	 Hfg92g2lzHQn5xzwoadSbWEj00VOF+d5EMfs/dJmJDs92Gx+gP+0EDeqcZvDU2usDI
	 74E5VVl0odNLw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 08 Apr 2025 19:10:02 +0100
Subject: [PATCH 5.15 v3 07/11] KVM: arm64: Unconditionally save+flush host
 FPSIMD/SVE/SME state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-stable-sve-5-15-v3-7-ca9a6b850f55@kernel.org>
References: <20250408-stable-sve-5-15-v3-0-ca9a6b850f55@kernel.org>
In-Reply-To: <20250408-stable-sve-5-15-v3-0-ca9a6b850f55@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Eric Auger <eauger@redhat.com>, Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 Eric Auger <eric.auger@redhat.com>, Florian Weimer <fweimer@redhat.com>, 
 Fuad Tabba <tabba@google.com>, Jeremy Linton <jeremy.linton@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5038; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ejt+NbeaO37nvme363QMF97yG2cqvt7ZXstCZKzmrH4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn9WlR2WLA4NWswrks6bn91iHqIEp4z8jsy9k/Hjos
 mHjeagOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ/VpUQAKCRAk1otyXVSH0OeRB/
 45wYrknZM36rCncP0naHOHCCEcEZz0B+KrmexGOnSojHpkqCw32TSOhY7HHXe+h5vI6iISVuKrhcvE
 FNqHEGVq88E/We9/OjTE8pLewXNGSjsDPgwV53+c+BZ0UHak9IubnKHaxqYek410krR156DVMG83PQ
 RJKp2RDR72vNgGBGAEN7BM+CHDrQV2bEG2aM7hacsmm9uG77lBafbWJ1c9CLF9I5o0cMSx7XDImhcQ
 AUlWUYhVlgliKVOAswZgL2+AzqtTiHM7G+NExg/VVb/0cxJYP6+yU3cSus357MedfdRZs6l0d7Bflj
 xtyB5q5ZsSykXBvm2ITCvMfSGRQo6N
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_112240_077941_CAC15241 
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
 arch/arm64/kvm/fpsimd.c    | 13 ++++++++++---
 2 files changed, 10 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e8f10daaa0d7..4be9d9fd4fb7 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1154,31 +1154,6 @@ void fpsimd_signal_preserve_current_state(void)
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
index 2e0f44f4c470..2afa2521bce1 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -74,9 +74,16 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 	vcpu->arch.flags &= ~KVM_ARM64_FP_ENABLED;
 	vcpu->arch.flags |= KVM_ARM64_FP_HOST;
 
-	fpsimd_kvm_prepare();
-
-	vcpu->arch.flags &= ~KVM_ARM64_HOST_SVE_ENABLED;
+	/*
+	 * Ensure that any host FPSIMD/SVE/SME state is saved and unbound such
+	 * that the host kernel is responsible for restoring this state upon
+	 * return to userspace, and the hyp code doesn't need to save anything.
+	 *
+	 * When the host may use SME, fpsimd_save_and_flush_cpu_state() ensures
+	 * that PSTATE.{SM,ZA} == {0,0}.
+	 */
+	fpsimd_save_and_flush_cpu_state();
+	vcpu->arch.flags &= ~KVM_ARM64_FP_HOST;
 
 	if (read_sysreg(cpacr_el1) & CPACR_EL1_ZEN_EL0EN)
 		vcpu->arch.flags |= KVM_ARM64_HOST_SVE_ENABLED;

-- 
2.39.5


