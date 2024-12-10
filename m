Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D59E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hNffYeP5s02VjGhpA/pyQQ2nDENNZocS+EyTfSNis/k=; b=sD7rW6JYIgLWKvyWwEQ9+pZRhX
	l0wQAj1m4rsUJhaSGei+gvKCTY+dGMG3wDOZZELELhy7TlUWsd1NMNBwyq7PMlhqXeV4fOgX97Po4
	ApQhfymuRMjlRpQjFhczo5b2MuNyv9ZjOKPxMpERLMXDkNsf4GusI2PwW4HCYTpm8qPafo0OKJSQw
	tCZv3OsuFLt7IQsaLpNAoZADH0EeCaFpEiNd43aMHkKFlIwai4AejnE4iETYSQq3uZf6U7G/+uF1I
	4dymtpsIX6xdC5bQEv0UXrlg07bLxGig1TwvVJFIVee/mchUTU472QQjLjOOwg8RC8BcbA5lL3qSN
	D3whgMhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2sS-0000000C3GF-1uBe;
	Tue, 10 Dec 2024 16:14:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2oC-0000000C2Wr-1duC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:10:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 270FA106F;
	Tue, 10 Dec 2024 08:10:25 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D85C3F5A1;
	Tue, 10 Dec 2024 08:09:55 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	Dave.Martin@arm.com,
	will@kernel.org
Subject: [PATCH v2] arm64: signal: Ensure signal delivery failure is recoverable
Date: Tue, 10 Dec 2024 16:09:40 +0000
Message-ID: <20241210160940.2031997-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_081000_518158_D1B8D350 
X-CRM114-Status: GOOD (  18.80  )
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

Commit eaf62ce1563b ("arm64/signal: Set up and restore the GCS
context for signal handlers") introduced a potential failure point
at the end of setup_return(). This is unfortunate as it is too late
to deliver a SIGSEGV: if that SIGSEGV is handled, the subsequent
sigreturn will end up returning to the original handler, which is
not the intention (since we failed to deliver that signal).

Make sure this does not happen by calling gcs_signal_entry()
at the very beginning of setup_return(), and add a comment just
after to discourage error cases being introduced from that point
onwards.

While at it, also take care of copy_siginfo_to_user(): since it may
fail, we shouldn't be calling it after setup_return() either. Call
it before setup_return() instead, and move the setting of X1/X2
inside setup_return() where it belongs (after the "point of no
failure").

Background: the first part of setup_rt_frame(), including
setup_sigframe(), has no impact on the execution of the interrupted
thread. The signal frame is written to the stack, but the stack
pointer remains unchanged. Failure at this stage can be recovered by
a SIGSEGV handler, and sigreturn will restore the original context,
at the point where the original signal occurred. On the other hand,
once setup_return() has updated registers including SP, the thread's
control flow has been modified and we must deliver the original
signal.

Fixes: eaf62ce1563b ("arm64/signal: Set up and restore the GCS context for signal handlers")
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
v1..v2:
* Added a short comment in setup_rt_frame() after the call to
  setup_return() to discourage adding failure points there.
  [Dave's suggestion]

Cc: broonie@kernel.org
Cc: catalin.marinas@arm.com
Cc: Dave.Martin@arm.com
Cc: will@kernel.org
---
 arch/arm64/kernel/signal.c | 48 ++++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 14ac6fdb872b..37e24f1bd227 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -1462,10 +1462,33 @@ static int setup_return(struct pt_regs *regs, struct ksignal *ksig,
 			 struct rt_sigframe_user_layout *user, int usig)
 {
 	__sigrestore_t sigtramp;
+	int err;
+
+	if (ksig->ka.sa.sa_flags & SA_RESTORER)
+		sigtramp = ksig->ka.sa.sa_restorer;
+	else
+		sigtramp = VDSO_SYMBOL(current->mm->context.vdso, sigtramp);
+
+	err = gcs_signal_entry(sigtramp, ksig);
+	if (err)
+		return err;
+
+	/*
+	 * We must not fail from this point onwards. We are going to update
+	 * registers, including SP, in order to invoke the signal handler. If
+	 * we failed and attempted to deliver a nested SIGSEGV to a handler
+	 * after that point, the subsequent sigreturn would end up restoring
+	 * the (partial) state for the original signal handler.
+	 */
 
 	regs->regs[0] = usig;
+	if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
+		regs->regs[1] = (unsigned long)&user->sigframe->info;
+		regs->regs[2] = (unsigned long)&user->sigframe->uc;
+	}
 	regs->sp = (unsigned long)user->sigframe;
 	regs->regs[29] = (unsigned long)&user->next_frame->fp;
+	regs->regs[30] = (unsigned long)sigtramp;
 	regs->pc = (unsigned long)ksig->ka.sa.sa_handler;
 
 	/*
@@ -1506,14 +1529,7 @@ static int setup_return(struct pt_regs *regs, struct ksignal *ksig,
 		sme_smstop();
 	}
 
-	if (ksig->ka.sa.sa_flags & SA_RESTORER)
-		sigtramp = ksig->ka.sa.sa_restorer;
-	else
-		sigtramp = VDSO_SYMBOL(current->mm->context.vdso, sigtramp);
-
-	regs->regs[30] = (unsigned long)sigtramp;
-
-	return gcs_signal_entry(sigtramp, ksig);
+	return 0;
 }
 
 static int setup_rt_frame(int usig, struct ksignal *ksig, sigset_t *set,
@@ -1537,14 +1553,16 @@ static int setup_rt_frame(int usig, struct ksignal *ksig, sigset_t *set,
 
 	err |= __save_altstack(&frame->uc.uc_stack, regs->sp);
 	err |= setup_sigframe(&user, regs, set, &ua_state);
-	if (err == 0) {
+	if (ksig->ka.sa.sa_flags & SA_SIGINFO)
+		err |= copy_siginfo_to_user(&frame->info, &ksig->info);
+
+	if (err == 0)
 		err = setup_return(regs, ksig, &user, usig);
-		if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
-			err |= copy_siginfo_to_user(&frame->info, &ksig->info);
-			regs->regs[1] = (unsigned long)&frame->info;
-			regs->regs[2] = (unsigned long)&frame->uc;
-		}
-	}
+
+	/*
+	 * We must not fail if setup_return() succeeded - see comment at the
+	 * beginning of setup_return().
+	 */
 
 	if (err == 0)
 		set_handler_user_access_state();

base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.47.0


