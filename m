Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A0FC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsGU0SjXzJ8Ulc1X82M9BUGZ3S7li6bCgR5TheURalk=; b=f4Lznuutwo4yC33h9ARkaHoriB
	BVxT79y72+/4ZFzknW+lWO9KzyPHdXeFxPk73cViOs4IiB8jdcdh4TJpsaczE0MgasKZHr5vtBn9u
	mdbuqs7+bafI+LeFletn40K1fG0wU+cmUGj9ADfyBEy6DXRWG1cEamyG9Znw7w1dEWy1CWVxdvZTZ
	zlutQeVTbBxgiBj31J0wYqIjvX9VgPD/Tc4VbU78EyaHRB3aZwcQtJDTBr6KdpAA56e2Ywu84NK8a
	zc4NHL8Bh7D7i/4WOC60OHdIAqD3Ni7VeWIcrwTzuF6W89g5wR+i8ivXLQ5czZ/vMu3Plygqygy3P
	aLdl0Adg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Yku-00000007xrw-28Tp;
	Wed, 09 Apr 2025 16:58:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YTm-00000007uxN-1b4f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:40:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 603921C25;
	Wed,  9 Apr 2025 09:40:46 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 979AB3F59E;
	Wed,  9 Apr 2025 09:40:44 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH v2 09/13] arm64/fpsimd: Fix merging of FPSIMD state during signal return
Date: Wed,  9 Apr 2025 17:40:06 +0100
Message-Id: <20250409164010.3480271-10-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250409164010.3480271-1-mark.rutland@arm.com>
References: <20250409164010.3480271-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_094046_556397_E2CCDA79 
X-CRM114-Status: GOOD (  17.45  )
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

For backwards compatibility reasons, when a signal return occurs which
restores SVE state, the effective lower 128 bits of each of the SVE
vector registers are restored from the corresponding FPSIMD vector
register in the FPSIMD signal frame, overriding the values in the SVE
signal frame. This is intended to be the case regardless of streaming
mode.

To make this happen, restore_sve_fpsimd_context() uses
fpsimd_update_current_state() to merge the lower 128 bits from the
FPSIMD signal frame into the SVE register state. Unfortunately,
fpsimd_update_current_state() performs this merging dependent upon
TIF_SVE, which is not always correct for streaming SVE register state:

* When restoring non-streaming SVE register state there is no observable
  problem, as the signal return code configures TIF_SVE and the saved
  fp_type to match before calling fpsimd_update_current_state(), which
  observes either:

  - TIF_SVE set    AND  fp_type == FP_STATE_SVE
  - TIF_SVE clear  AND  fp_type == FP_STATE_FPSIMD

* On systems which have SME but not SVE, TIF_SVE cannot be set. Thus the
  merging will never happen for the streaming SVE register state.

* On systems which have SVE and SME, TIF_SVE can be set and cleared
  independently of PSTATE.SM. Thus the merging may or may not happen for
  streaming SVE register state.

  As TIF_SVE can be cleared non-deterministically during syscalls
  (including at the start of sigreturn()), the merging may occur
  non-deterministically from the perspective of userspace.

This logic has been broken since its introduction in commit:

  85ed24dad2904f7c ("arm64/sme: Implement streaming SVE signal handling")

... at which point both fpsimd_signal_preserve_current_state() and
fpsimd_update_current_state() only checked TIF SVE. When PSTATE.SM==1
and TIF_SVE was clear, signal delivery would place stale FPSIMD state
into the FPSIMD signal frame, and signal return would not merge this
into the restored register state.

Subsequently, signal delivery was fixed as part of commit:

  61da7c8e2a602f66 ("arm64/signal: Don't assume that TIF_SVE means we saved SVE state")

... but signal restore was not given a corresponding fix, and when
TIF_SVE was clear, signal restore would still fail to merge the FPSIMD
state into the restored SVE register state. The 'Fixes' tag did not
indicate that this had been broken since its introduction.

Fix this by merging the FPSIMD state dependent upon the saved fp_type,
matching what we (currently) do during signal delivery.

As described above, when backporting this commit, it will also be
necessary to backport commit:

  61da7c8e2a602f66 ("arm64/signal: Don't assume that TIF_SVE means we saved SVE state")

... and prior to commit:

  baa8515281b30861 ("arm64/fpsimd: Track the saved FPSIMD state type separately to TIF_SVE")

... it will be necessary for fpsimd_signal_preserve_current_state() and
fpsimd_update_current_state() to consider both TIF_SVE and
thread_sm_enabled(&current->thread), in place of the saved fp_type.

Fixes: 85ed24dad2904f7c ("arm64/sme: Implement streaming SVE signal handling")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 0b6fda5b7bad5..11f21809d3b7d 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1781,7 +1781,7 @@ void fpsimd_update_current_state(struct user_fpsimd_state const *state)
 	get_cpu_fpsimd_context();
 
 	current->thread.uw.fpsimd_state = *state;
-	if (test_thread_flag(TIF_SVE))
+	if (current->thread.fp_type == FP_STATE_SVE)
 		fpsimd_to_sve(current);
 
 	task_fpsimd_load();
-- 
2.30.2


