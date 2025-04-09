Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E81C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 17:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3aL/M8TDdtaQXtfQDx4LW1VRYvBYq1CKZ49VKgsnZ0=; b=Z7y3xxDfYxp4MXbq1LYmKfFJZ5
	K03tpfrPqiN6LmqT5gRMMPzW0Wab7Kag/TKNTOzY1uB0hym0hWSs8E8+JTY2pHvirvI58t2hlwsAe
	jPYxABAjhkAe0B5FtlFSe42W7UmCGY93wUO4gEMz1hJ+HCT6FqhJNKxlR38B/39yu5TmyGKEHyvYX
	d0iL/5wlxMI1+zQmuV465gPZZ3kRPpXEqnJfpgvpie1VRMfxJ4AA5GDeP3OM1MssyoIZmQuNt1jOr
	NETusWOR1OCbWsZ5dnYAtZr/ehk5vcNuVOfwQfXeb4NTBp2YJFtotna+LCie+IvCn6zdq9wC/pSL1
	ljuz7N3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YoO-00000007yS6-41Ri;
	Wed, 09 Apr 2025 17:02:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YTq-00000007uy1-0OuQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:40:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C5E11C25;
	Wed,  9 Apr 2025 09:40:50 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 78ED43F59E;
	Wed,  9 Apr 2025 09:40:48 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH v2 11/13] arm64/fpsimd: signal32: Always save+flush state early
Date: Wed,  9 Apr 2025 17:40:08 +0100
Message-Id: <20250409164010.3480271-12-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250409164010.3480271-1-mark.rutland@arm.com>
References: <20250409164010.3480271-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_094050_174369_AF3667C3 
X-CRM114-Status: GOOD (  16.27  )
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
Reviewed-by: Mark Brown <broonie@kernel.org>
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


