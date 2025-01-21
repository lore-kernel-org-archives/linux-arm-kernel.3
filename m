Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740EAC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u4vaYSGAqiC2k5PFBj4rKLbIFmWsNma/5FFeHHBhlWE=; b=kmpHaIcF8x9xjo1Wsm/VnMFRGm
	B01lEdc4uMZ2+4XMc1rVEr8ZowBpLehS4khUDDCdiNskQh4Fma4yRZYZT/DKB8qNmWESTgSmub6yy
	eyGM76ytEcSvjJo+WyjKu6digWtg1liYdhtMXdiUjyYS5i/Ps3pCH9bA9XDhZDlD6TCewi4/JlopR
	KaZLAYHc0piUhJgzKbwmAKOvTvOxSF2PrOLadhOxJsWQIVTD6qF6P1B7T83TgX3wPsyoK/B1xJAY1
	5/jSQPqCHjszJ1f4roVQJyP/3MmDHY7DR56Yv4PkI1BHFr6wIaudRW8zEL8tKCVs7gGg3wvkCy02u
	EVNNaEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taB5A-00000007Vwg-2WWT;
	Tue, 21 Jan 2025 10:02:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taB3t-00000007Vmq-3U5y
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Jan 2025 10:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=u4vaYSGAqiC2k5PFBj4rKLbIFmWsNma/5FFeHHBhlWE=; b=C40GMV9ZUAiCp0Srs9n7kLrT0c
	NLDr2hcRZ9D6rQEcfjt/CORiNBD9jH+C7AEuO3r2jzn+YUZ7p4YbtF7bA5SLUMl3m5mGx6U75jimL
	H76iCfRFVjNDzPYDjOtQApwKoe4rEndjhGHNn9h095iYC686qGODijk9CWVM+edrKGVcTRhqW7KCK
	NeEoJt3JcKXRKysx5b9bmDA89DOhH8NpS+PCSvx8KQxtDKNT2Fn/wSXLU6fF0CAWhsqhltz6oAqw8
	4Pe+yKDz64hbMcOPkNnUTZ88++DQysnwCUxeTMZ+FcYD0EHRVC8KiDIe0e/uYkb+G3TzE4KHwqU1f
	9C2K9V4A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taB3m-0000000DEhJ-1X3H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 10:00:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0DE6106F;
	Tue, 21 Jan 2025 02:01:03 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F276C3F740;
	Tue, 21 Jan 2025 02:00:32 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	eauger@redhat.com,
	fweimer@redhat.com,
	jeremy.linton@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	pbonzini@redhat.com,
	stable@vger.kernel.org,
	wilco.dijkstra@arm.com,
	will@kernel.org
Subject: [PATCH] KVM: arm64/sve: Ensure SVE is trapped after guest exit
Date: Tue, 21 Jan 2025 10:00:26 +0000
Message-Id: <20250121100026.3974971-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_100038_886833_D85E46A6 
X-CRM114-Status: GOOD (  23.45  )
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

There is a period of time after returning from a KVM_RUN ioctl where
userspace may use SVE without trapping, but the kernel can unexpectedly
discard the live SVE state. Eric Auger has observed this causing QEMU
crashes where SVE is used by memmove():

  https://issues.redhat.com/browse/RHEL-68997

The only state discarded is the user SVE state of the task which issued
the KVM_RUN ioctl. Other tasks are unaffected, plain FPSIMD state is
unaffected, and kernel state is unaffected.

This happens because fpsimd_kvm_prepare() incorrectly manipulates the
FPSIMD/SVE state. When the vCPU is loaded, fpsimd_kvm_prepare()
unconditionally clears TIF_SVE but does not reconfigure CPACR_EL1.ZEN to
trap userspace SVE usage. If the vCPU does not use FPSIMD/SVE and hyp
does not save the host's FPSIMD/SVE state, the kernel may return to
userspace with TIF_SVE clear while SVE is still enabled in
CPACR_EL1.ZEN. Subsequent userspace usage of SVE will not be trapped,
and the next save of userspace FPSIMD/SVE state will only store the
FPSIMD portion due to TIF_SVE being clear, discarding any SVE state.

The broken logic was originally introduced in commit:

  93ae6b01bafee8fa ("KVM: arm64: Discard any SVE state when entering KVM guests")

... though at the time fp_user_discard() would reconfigure CPACR_EL1.ZEN
to trap subsequent SVE usage, masking the issue until that logic was
removed in commit:

  8c845e2731041f0f ("arm64/sve: Leave SVE enabled on syscall if we don't context switch")

Avoid this issue by reconfiguring CPACR_EL1.ZEN when clearing
TIF_SVE. At the same time, add a comment to explain why
current->thread.fp_type must be set even though the FPSIMD state is not
foreign. A similar issue exists when SME is enabled, and will require
further rework. As SME currently depends on BROKEN, a BUILD_BUG() and
comment are added for now, and this issue will need to be fixed properly
in a follow-up patch.

Commit 93ae6b01bafee8fa also introduced an unintended ptrace ABI change.
Unconditionally clearing TIF_SVE regardless of whether the state is
foreign discards saved SVE state created by ptrace after syscall entry.
Avoid this by only clearing TIF_SVE when the FPSIMD/SVE state is not
foreign. When the state is foreign, KVM hyp code does not need to save
any host state, and so this will not affect KVM.

There appear to be further issues with unintentional SVE state
discarding, largely impacting ptrace and signal handling, which will
need to be addressed in separate patches.

Reported-by: Eric Auger <eauger@redhat.com>
Reported-by: Wilco Dijkstra <wilco.dijkstra@arm.com>
Cc: stable@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Florian Weimer <fweimer@redhat.com>
Cc: Jeremy Linton <jeremy.linton@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
---
 arch/arm64/kernel/fpsimd.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

I believe there are some other issues in this area, but I'm sending this
out on its own because I beleive the other issues are more complex while
this is self-contained, and people are actively hitting this case in
production.

I intend to follow-up with fixes for the other cases I mention in the
commit message, and for the SME case with the BUILD_BUG_ON().

Mark.

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 8c4c1a2186cc5..e4053a90ed240 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1711,8 +1711,24 @@ void fpsimd_kvm_prepare(void)
 	 */
 	get_cpu_fpsimd_context();
 
-	if (test_and_clear_thread_flag(TIF_SVE)) {
-		sve_to_fpsimd(current);
+	if (!test_thread_flag(TIF_FOREIGN_FPSTATE) &&
+	    test_and_clear_thread_flag(TIF_SVE)) {
+		sve_user_disable();
+
+		/*
+		 * The KVM hyp code doesn't set fp_type when saving the host's
+		 * FPSIMD state. Set fp_type here in case the hyp code saves
+		 * the host state.
+		 *
+		 * If hyp code does not save the host state, then the host
+		 * state remains live on the CPU and saved fp_type is
+		 * irrelevant until it is overwritten by a later call to
+		 * fpsimd_save_user_state().
+		 *
+		 * This is *NOT* sufficient when CONFIG_ARM64_SME=y, where
+		 * fp_type can be FP_STATE_SVE regardless of TIF_SVE.
+		 */
+		BUILD_BUG_ON(IS_ENABLED(CONFIG_ARM64_SME));
 		current->thread.fp_type = FP_STATE_FPSIMD;
 	}
 
-- 
2.30.2


