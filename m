Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA67FC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 18:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/G9uDnqvO/SNte/vpWdizBSe8394GiUY5FDFE6yDmU=; b=PLKOKM73gVjFjVRodSxmH1FVkh
	0qcgC7KLXgdACDvTjMNaiFuWNeITMNllKyFnIAEGAbZAAlvymhPqgnWEfJZsnDt7WCnCfZofq7XKw
	77pzKBBKvbnfpWKlZBO/aey8Kwv7vZ6A9k6/lKX8iIzKIeQKEB3VHKqRYJpyaG3SvGAUR6W8lKt9l
	He92bakMCmAeAzrUZn/oKeViq6d4T8HpES9C9cCY23ekMyetpdkGglkGUkeOOUXryD9+cUAJMJyMh
	E5gBuTchdtSvkjbSX8/tL1ynEMTj+afRUThZFcYKGsLE4ZMv/BjLmCrDvP4LVP7bticRJ4e6uHNNZ
	ZjcjYJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lTT-0000000CUqy-2r35;
	Fri, 04 Apr 2025 18:09:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0l6I-0000000CRTL-2FbB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 17:45:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DF5D1515;
	Fri,  4 Apr 2025 10:45:08 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC4093F63F;
	Fri,  4 Apr 2025 10:45:04 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH 12/14] arm64/fpsimd: signal32: Always save+flush state early
Date: Fri,  4 Apr 2025 18:44:33 +0100
Message-Id: <20250404174435.3288106-13-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250404174435.3288106-1-mark.rutland@arm.com>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_104506_621018_9DE6D988 
X-CRM114-Status: GOOD (  16.00  )
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

There are several issues with the way the native signal handling code
manipulates FPSIMD/SVE/SME state. To fix those issues, subsequent
patches will rework the native signal handling code to always save+flush
the current task's FPSIMD/SVE/SME state before manipulating that state.

In preparation for those changes, rework the compat signal handling code
to save+flush the current task's FPSIMD state before manipulating it.

Subsequent patches will remove fpsimd_signal_preserve_current_state()
and fpsimd_update_current_state(). Compat tasks can only have FPSIMD
state, and cannot have any SVE or SME state. Thus, the SVE state
manipulation present in fpsimd_signal_preserve_current_state() and
fpsimd_update_current_state() is not necessary, and it is safe to
directly manipulate current->thread.uw.fpsimd_state once it has been
saved+flushed.

Use fpsimd_save_and_flush_current_state() to save+flush the state for
both signal delivery and signal return, before the state is manipulated
in any way. While it would be safe for compat_restore_vfp_context() to
use fpsimd_flush_task_state(current), there are several extant issues in
the native signal code resulting from incorrect use of
fpsimd_flush_task_state(), and for consistency it is preferable to use
fpsimd_save_and_flush_current_state().

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/signal32.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/signal32.c b/arch/arm64/kernel/signal32.c
index 81e798b6dadaf..bb3b526ff43f7 100644
--- a/arch/arm64/kernel/signal32.c
+++ b/arch/arm64/kernel/signal32.c
@@ -103,7 +103,7 @@ static int compat_preserve_vfp_context(struct compat_vfp_sigframe __user *frame)
 	 * Note that this also saves V16-31, which aren't visible
 	 * in AArch32.
 	 */
-	fpsimd_signal_preserve_current_state();
+	fpsimd_save_and_flush_current_state();
 
 	/* Place structure header on the stack */
 	__put_user_error(magic, &frame->magic, err);
@@ -169,14 +169,17 @@ static int compat_restore_vfp_context(struct compat_vfp_sigframe __user *frame)
 	fpsimd.fpsr = fpscr & VFP_FPSCR_STAT_MASK;
 	fpsimd.fpcr = fpscr & VFP_FPSCR_CTRL_MASK;
 
+	if (err)
+		return -EFAULT;
+
 	/*
 	 * We don't need to touch the exception register, so
 	 * reload the hardware state.
 	 */
-	if (!err)
-		fpsimd_update_current_state(&fpsimd);
+	fpsimd_save_and_flush_current_state();
+	current->thread.uw.fpsimd_state = fpsimd;
 
-	return err ? -EFAULT : 0;
+	return 0;
 }
 
 static int compat_restore_sigframe(struct pt_regs *regs,
-- 
2.30.2


