Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C64FD6B6C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 20:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ggr6BaTADQiCQQ2pyuRNV4+vQ3AyQIdqQhgoVq4+imU=; b=jcQHr7TxhGAEFYW27lPKhK7uzR
	IpNUE5Rsmco08fLcEN2P6zqhJude4/Nps42SHub0pebhjjhIt9FLB/+z+ru5UVTg9QCgOyUaiNLu4
	1ctszenkczX6gmjubpBecsdcanB1ZbDBTXij3aKFzlwg6Iz0he6dn81sQJWYRsDXGfYGKHYa1MZQe
	XOdEsjG4U3Z2riqsGvnWRPekfFt6SVcbw2zCcbb7Nw6wot/vHMdpH2jztimqQ2/tAv7Wx30qfHKiy
	HUCopJLzE3vGbVM3u5C4IY5QdXjy9WN76fBJqG8zj9ZI4GbmIF9qFfzmW0P7Dghw+m8+4+lzLyZOt
	p37cYoqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6EsF-00000001bE4-2bsf;
	Wed, 30 Oct 2024 20:00:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Eqb-00000001b3Y-08rZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 19:59:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1AD1B5C5AD7;
	Wed, 30 Oct 2024 19:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600C9C4CECE;
	Wed, 30 Oct 2024 19:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730318355;
	bh=jFJZHVikImfPN6/7Pm8IGDpcRPne931iD1BBV0B0ze8=;
	h=From:Date:Subject:To:Cc:From;
	b=XLonZKqFHsqZlksAO3Y6nlXrtfiyIjTPeR+RzUMYQfO47OXEQ7yWDVhLUl8gTaTTX
	 f0uTn3wLiOIr9V4Fw3aQxVx9BLCUX/lzZtC5wFchnhbGhjqldmKsGkz0lzSFbbeE4+
	 4R1SL7m6dVNUhOjH1yBCxAx50ZrjawWdNrt2EA5Rx6V5yQ/UAtxWtNrt+6+Dolihsy
	 MJbbSnLIIjyLMScl4IabJiuOJEy6xFm/7j0FhT3FSszFql+imknsYfFkafzDNOnvu0
	 5py0PMfywDR9LPRt1pzuw7Q2cuamjD8un9aUl8PdZ8TjEPDwzCYyACiejkhuljU1TW
	 vGsF1ZM0OnPbg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Oct 2024 19:58:36 +0000
Subject: [PATCH v2] arm64/signal: Avoid corruption of SME state when
 entering signal handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-arm64-fp-sme-sigentry-v2-1-43ce805d1b20@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOuPImcC/4WNQQ6CMBBFr0Jm7RhaiFVX3sOwKDCFidKSKWkkh
 LtbuYDL95L//gaRhCnCvdhAKHHk4DPoUwHdaP1AyH1m0KWuVakrtDJdanQzxokw8kB+kRWtbnu
 jroaMaiFvZyHHn6P7bDKPHJcg63GT1M/+KyaFCnV9c85QV9m+fLxIPL3PQQZo9n3/AhzM3zG7A
 AAA
X-Change-ID: 20241023-arm64-fp-sme-sigentry-a2bd7187e71b
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=5830; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jFJZHVikImfPN6/7Pm8IGDpcRPne931iD1BBV0B0ze8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnIpARO4VR7nH3VaP15rcCXqnbuYN8xwGMg8AnN6RK
 kbn2BiaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyKQEQAKCRAk1otyXVSH0GV/B/
 0aAQOxdhRqTObLx0GFRRiv4iERonjAQf2WjbU8R83H0qqcQLmKDRpdPpMI3SboTvguCKaVk8IYrR6m
 MFT36tFEkQKbRK8om4GUgUbSuNzOMBCm3pUJ2RQ4ZdJNj+ik+ArA0qPT/0xTZ132Tz9iLXv0s3bGQT
 He/Md7hkJZUCL7q847qdkgeDqzEfyUSmHZRipQhp2MRhMFKuee0VIlfSFURvUaWBhCMZGPZw10w2f0
 tUA6QJFS+rP7p0y/quRhIDFGsEQa60OlQqqahAPhLXshM8IUx2vNUS+NYSvhL/vrrEyhWqUBWesT4+
 jF4lz66dzEvqnsP+dMg7HTf8cZVVn/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_125917_199439_AB49F74D 
X-CRM114-Status: GOOD (  22.43  )
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

Fixes: 40a8e87bb3285 ("arm64/sme: Disable ZA and streaming mode when handling signals")
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
Changes in v2:
- Commit message tweaks.
- Flush the task state when updating in memory to ensure we reload.
- Link to v1: https://lore.kernel.org/r/20241023-arm64-fp-sme-sigentry-v1-1-249ff7ec3ad0@kernel.org
---
 arch/arm64/include/asm/fpsimd.h |  1 +
 arch/arm64/kernel/fpsimd.c      | 33 +++++++++++++++++++++++++++++++++
 arch/arm64/kernel/signal.c      | 19 +------------------
 3 files changed, 35 insertions(+), 18 deletions(-)

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
index 77006df20a75aee7c991cf116b6d06bfe953d1a4..c4149f474ce889af42bc2ce9402e7d032818c2e4 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1693,6 +1693,39 @@ void fpsimd_signal_preserve_current_state(void)
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
+		/* Exiting streaming mode zeros the FPSIMD state */
+		if (current->thread.svcr & SVCR_SM_MASK) {
+			memset(&current->thread.uw.fpsimd_state, 0,
+			       sizeof(current->thread.uw.fpsimd_state));
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


