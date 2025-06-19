Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E716BC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e8WNT+z3+irPWp7wRSD++eyN/HRNyi8w5j1DKC9MAJg=; b=HVkOasIMgK59gVD2fXUnQlJ23C
	H9KnwCdVoeGjlihalsYmCgUE7cMtJOS7sBqeVog0Ux14Zub0CSDFXDZL7NVQisI46Wh7PMzOYQUXq
	WjPdkHKD3nPZNWN5VQT/VVNjP3Up+YtQaUfv4HKGDR2xUc6sd0I+htDtUG4PC2oGBaP0JJX2zGMHk
	nCpVd0CX4XybCrN546gJTF8tpighHf4CqMipMDbjh7q4PhhcQsNXeQJWswdOHV3pox2/qlyHmMnZr
	tK1OV+Jsgx/LQ19Z5VJY7t/HeOjYzY0jxI+cCuACd557DHHpTmcs4WY7QNyj2dgTuUomyN5mWOaj7
	/mPklAVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIeh-0000000Deq1-2GpH;
	Thu, 19 Jun 2025 17:02:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFcy-0000000DDep-2ZAz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 13:48:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44206113E;
	Thu, 19 Jun 2025 06:48:05 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A156D3F58B;
	Thu, 19 Jun 2025 06:48:23 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	kvmarm@lists.linux.dev,
	mark.rutland@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	tabba@google.com,
	will@kernel.org
Subject: [PATCH] KVM: arm64: Remove kvm_arch_vcpu_run_map_fp()
Date: Thu, 19 Jun 2025 14:48:17 +0100
Message-Id: <20250619134817.4075340-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_064828_741951_F0B551E6 
X-CRM114-Status: GOOD (  16.93  )
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

Historically KVM hyp code saved the host's FPSIMD state into the hosts's
fpsimd_state memory, and so it was necessary to map this into the hyp
Stage-1 mappings before running a vCPU.

This is no longer necessary as of commits:

* fbc7e61195e2 ("KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state")
* 8eca7f6d5100 ("KVM: arm64: Remove host FPSIMD saving for non-protected KVM")

Since those commits, we eagerly save the host's FPSIMD state before
calling into hyp to run a vCPU, and hyp code never reads nor writes the
host's fpsimd_state memory. There's no longer any need to map the host's
fpsimd_state memory into the hyp Stage-1, and kvm_arch_vcpu_run_map_fp()
is unnecessary but benign.

Remove kvm_arch_vcpu_run_map_fp(). Currently there is no code to perform
a corresponding unmap, and we never mapped the host's SVE or SME state
into the hyp Stage-1, so no other code needs to be removed.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev
---
 arch/arm64/include/asm/kvm_host.h |  1 -
 arch/arm64/kvm/arm.c              |  4 ----
 arch/arm64/kvm/fpsimd.c           | 26 --------------------------
 3 files changed, 31 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 5ccca509dff1a..f7ad74404202b 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1482,7 +1482,6 @@ int kvm_vm_ioctl_get_reg_writable_masks(struct kvm *kvm,
 					struct reg_mask_range *range);
 
 /* Guest/host FPSIMD coordination helpers */
-int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_ctxflush_fp(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index de2b4e9c9f9fb..1502faa460863 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -825,10 +825,6 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 	if (!kvm_arm_vcpu_is_finalized(vcpu))
 		return -EPERM;
 
-	ret = kvm_arch_vcpu_run_map_fp(vcpu);
-	if (ret)
-		return ret;
-
 	if (likely(vcpu_has_run_once(vcpu)))
 		return 0;
 
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 8f6c8f57c6b9c..15e17aca1dec0 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -14,32 +14,6 @@
 #include <asm/kvm_mmu.h>
 #include <asm/sysreg.h>
 
-/*
- * Called on entry to KVM_RUN unless this vcpu previously ran at least
- * once and the most recent prior KVM_RUN for this vcpu was called from
- * the same task as current (highly likely).
- *
- * This is guaranteed to execute before kvm_arch_vcpu_load_fp(vcpu),
- * such that on entering hyp the relevant parts of current are already
- * mapped.
- */
-int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu)
-{
-	struct user_fpsimd_state *fpsimd = &current->thread.uw.fpsimd_state;
-	int ret;
-
-	/* pKVM has its own tracking of the host fpsimd state. */
-	if (is_protected_kvm_enabled())
-		return 0;
-
-	/* Make sure the host task fpsimd state is visible to hyp: */
-	ret = kvm_share_hyp(fpsimd, fpsimd + 1);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 /*
  * Prepare vcpu for saving the host's FPSIMD state and loading the guest's.
  * The actual loading is done by the FPSIMD access trap taken to hyp.
-- 
2.30.2


