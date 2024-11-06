Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826E3D59F6A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 19:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1inw3OwubNIi3+7A17al6rMgt93Qu69e8y64kVdcx/s=; b=eqs6TtyAlMHZZAfqlJy6EXqK3c
	3VNNbtUYh/RoyOeeeEsySwAfAnFt87gXQ/zVQ1GgjAV+rx2/EAa9FOHAHas/WQAebGISWh1p9szwJ
	ULcBVaauDDD1vE4BhqUGd1C43Bj7M3Lt3axFmbMpYuRekFTxbiiDF09Q1TNbxsHBG1o7qfYI4F5qo
	OP5w5IOWjbr+EoUfn2SnO0Mfis3IOWCLZ2xmWotOTQXCcwZS4/ENpugwUg+nyDoyLHjT3MhZQjT+T
	Hxr+HvFMsUBlcBo380gvsCngCXHQIGxPXYnSrQb4iuzBgcxcHcjQLN3sMD6FbsOCktfXacfjbh+uM
	lk5coihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lx5-00000004Zkp-2Rl4;
	Wed, 06 Nov 2024 19:44:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lqd-00000004XjC-2xuE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 19:37:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 98ED4A442EB;
	Wed,  6 Nov 2024 19:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C776CC4CEC6;
	Wed,  6 Nov 2024 19:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730921866;
	bh=fN9Lf/+1M3vz8fvp9JB7a8D4GFEYSQKstM1USNDT7tY=;
	h=From:Date:Subject:To:Cc:From;
	b=r9YNZL5FtlvtBFjClx+bm3BBFZvMrxlkyCXwkeH4gBq0Xugpa4nJ08H6b5joQGoyi
	 nfoTKH1ZQRrYeze8ERvAsycHTfbC7Fe4J6E2sx5FbWFBCcl6+7nJhnrXxgj/26QVk2
	 gkEU5gNvL4CE+tvFvLU7QSIlRgOsekPVWND8nbCVS3xo4WpX3BC9NLQ9E3faXjnNfi
	 8ohZQh1STT651Je5Dm1JcmqIK+HHzYvuZR10NsPYLSJ5tDH3gxs3IHewseuadrW9Qe
	 5pGL36jJ4Xqq4TjkesY2pX+nBBm5L3GmgbE3ZxkqGLlWfgc+oPeXIGpGAEwpPwjSwj
	 D9Aey8V7h8d2A==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 06 Nov 2024 19:35:46 +0000
Subject: [PATCH v3] arm64/signal: Avoid corruption of SME state when
 entering signal handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-arm64-fp-sme-sigentry-v3-1-38d06b75c850@kernel.org>
X-B4-Tracking: v=1; b=H4sIABLFK2cC/4XNQQ6CMBCF4auYrh3TTqtFV97DuCgwhUYppCWNh
 HB3CytdGJf/S+abmUUKjiK77GYWKLnoep9D7nesao1vCFydmyFHJThKMKE7KbADxI4guob8GCY
 wWNZaFJq0KFm+HQJZ99rc2z136+LYh2l7k8S6/hOTAAGoztZqqqSp+fVBwdPz0IeGrWTCD0byX
 wxmRsmKCn6sRYnfzLIsb/9qie8CAQAA
X-Change-ID: 20241023-arm64-fp-sme-sigentry-a2bd7187e71b
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=6777; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fN9Lf/+1M3vz8fvp9JB7a8D4GFEYSQKstM1USNDT7tY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnK8WH1to3G4Nc52JGFgAtq6nyvdY7xhRxskcODXv2
 tvGLqw+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyvFhwAKCRAk1otyXVSH0MbJB/
 43Z9YJKdN4EQdlLfsAL0Ro+d90IuYlIvHZjjQ7r/LoK+p4wlm6tQzK/E4rob9iAOt9ZtQjzQKs/+jW
 4FdkKVAu0sbiVCQAXs2yKbwGiXWcQYNL3xUiVpCRAmWraUUnsnMpcr+RyGAOC9m0zvIwDQznvNZtOE
 rA3bLCy1Rdcz6VBUMhQFOwK7U+m+6n3J4oGZKuEIrtmmBJkyCsan2d5IiQrI5ekLjPwQNDcERC1z+y
 0nuGf70+eXtlz+hm8l2knQywg0crvJkBRcX7MbrQ4Kfwn9cQuIA9KRw0ngawKB5uErqTC5p1xQ9EZr
 TxtdKsJbnUj71F+24UYJ4FqEx6thbt
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_113747_962639_A780AFB9 
X-CRM114-Status: GOOD (  25.39  )
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

We intend that signal handlers are entered with PSTATE.{SM,ZA}={0,0}.
The logic for this in setup_return() manipulates the saved state and
live CPU state in an unsafe manner, and consequently, when a task enters
a signal handler:

 * The task entering the signal handler might not have its PSTATE.{SM,ZA}
   bits cleared, and other register state that is affected by changes to
   PSTATE.{SM,ZA} might not be zeroed as expected.

 * An unrelated task might have its PSTATE.{SM,ZA} bits cleared
   unexpectedly, potentially zeroing other register state that is
   affected by changes to PSTATE.{SM,ZA}.

   Tasks which do not set PSTATE.{SM,ZA} (i.e. those only using plain
   FPSIMD or non-streaming SVE) are not affected, as there is no
   resulting change to PSTATE.{SM,ZA}.

Consider for example two tasks on one CPU:

 A: Begins signal entry in kernel mode, is preempted prior to SMSTOP.
 B: Using SM and/or ZA in userspace with register state current on the
    CPU, is preempted.
 A: Scheduled in, no register state changes made as in kernel mode.
 A: Executes SMSTOP, modifying live register state.
 A: Scheduled out.
 B: Scheduled in, fpsimd_thread_switch() sees the register state on the
    CPU is tracked as being that for task B so the state is not reloaded
    prior to returning to userspace.

Task B is now running with SM and ZA incorrectly cleared.

Fix this by:

 * Checking TIF_FOREIGN_FPSTATE, and only updating the saved or live
   state as appropriate.

 * Using {get,put}_cpu_fpsimd_context() to ensure mutual exclusion
   against other code which manipulates this state. To allow their use,
   the logic is moved into a new fpsimd_enter_sighandler() helper in
   fpsimd.c.

This race has been observed intermittently with fp-stress, especially
with preempt disabled, commonly but not exclusively reporting "Bad SVCR: 0".

While we're at it also fix a discrepancy between in register and in memory
entries. When operating on the register state we issue a SMSTOP, exiting
streaming mode if we were in it. This clears the V/Z and P register and
FPMR but nothing else. The in memory version clears all the user FPSIMD
state including FPCR and FPSR but does not clear FPMR. Add the clear of
FPMR and limit the existing memset() to only cover the vregs, preserving
the state of FPCR and FPSR like SMSTOP does.

Fixes: 40a8e87bb3285 ("arm64/sme: Disable ZA and streaming mode when handling signals")
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
Changes in v3:
- Fix the in memory update to follow the behaviour of the SMSTOP we
  issue when updating in registers.
- Link to v2: https://lore.kernel.org/r/20241030-arm64-fp-sme-sigentry-v2-1-43ce805d1b20@kernel.org

Changes in v2:
- Commit message tweaks.
- Flush the task state when updating in memory to ensure we reload.
- Link to v1: https://lore.kernel.org/r/20241023-arm64-fp-sme-sigentry-v1-1-249ff7ec3ad0@kernel.org
---
 arch/arm64/include/asm/fpsimd.h |  1 +
 arch/arm64/kernel/fpsimd.c      | 39 +++++++++++++++++++++++++++++++++++++++
 arch/arm64/kernel/signal.c      | 19 +------------------
 3 files changed, 41 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index f2a84efc361858d4deda99faf1967cc7cac386c1..09af7cfd9f6c2cec26332caa4c254976e117b1bf 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -76,6 +76,7 @@ extern void fpsimd_load_state(struct user_fpsimd_state *state);
 extern void fpsimd_thread_switch(struct task_struct *next);
 extern void fpsimd_flush_thread(void);
 
+extern void fpsimd_enter_sighandler(void);
 extern void fpsimd_signal_preserve_current_state(void);
 extern void fpsimd_preserve_current_state(void);
 extern void fpsimd_restore_current_state(void);
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 77006df20a75aee7c991cf116b6d06bfe953d1a4..10c8efd1c5ce83f4ea4025b213111ab9519263b1 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1693,6 +1693,45 @@ void fpsimd_signal_preserve_current_state(void)
 		sve_to_fpsimd(current);
 }
 
+/*
+ * Called by the signal handling code when preparing current to enter
+ * a signal handler. Currently this only needs to take care of exiting
+ * streaming mode and clearing ZA on SME systems.
+ */
+void fpsimd_enter_sighandler(void)
+{
+	if (!system_supports_sme())
+		return;
+
+	get_cpu_fpsimd_context();
+
+	if (test_thread_flag(TIF_FOREIGN_FPSTATE)) {
+		/*
+		 * Exiting streaming mode zeros the V/Z and P
+		 * registers and FPMR.  Zero FPMR and the V registers,
+		 * marking the state as FPSIMD only to force a clear
+		 * of the remaining bits during reload if needed.
+		 */
+		if (current->thread.svcr & SVCR_SM_MASK) {
+			memset(&current->thread.uw.fpsimd_state.vregs, 0,
+			       sizeof(current->thread.uw.fpsimd_state.vregs));
+			current->thread.uw.fpmr = 0;
+			current->thread.fp_type = FP_STATE_FPSIMD;
+		}
+
+		current->thread.svcr &= ~(SVCR_ZA_MASK |
+					  SVCR_SM_MASK);
+
+		/* Ensure any copies on other CPUs aren't reused */
+		fpsimd_flush_task_state(current);
+	} else {
+		/* The register state is current, just update it. */
+		sme_smstop();
+	}
+
+	put_cpu_fpsimd_context();
+}
+
 /*
  * Called by KVM when entering the guest.
  */
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 5619869475304776fc005fe24a385bf86bfdd253..fe07d0bd9f7978d73973f07ce38b7bdd7914abb2 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -1218,24 +1218,7 @@ static void setup_return(struct pt_regs *regs, struct k_sigaction *ka,
 	/* TCO (Tag Check Override) always cleared for signal handlers */
 	regs->pstate &= ~PSR_TCO_BIT;
 
-	/* Signal handlers are invoked with ZA and streaming mode disabled */
-	if (system_supports_sme()) {
-		/*
-		 * If we were in streaming mode the saved register
-		 * state was SVE but we will exit SM and use the
-		 * FPSIMD register state - flush the saved FPSIMD
-		 * register state in case it gets loaded.
-		 */
-		if (current->thread.svcr & SVCR_SM_MASK) {
-			memset(&current->thread.uw.fpsimd_state, 0,
-			       sizeof(current->thread.uw.fpsimd_state));
-			current->thread.fp_type = FP_STATE_FPSIMD;
-		}
-
-		current->thread.svcr &= ~(SVCR_ZA_MASK |
-					  SVCR_SM_MASK);
-		sme_smstop();
-	}
+	fpsimd_enter_sighandler();
 
 	if (system_supports_poe())
 		write_sysreg_s(POR_EL0_INIT, SYS_POR_EL0);

---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241023-arm64-fp-sme-sigentry-a2bd7187e71b

Best regards,
-- 
Mark Brown <broonie@kernel.org>


