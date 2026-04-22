Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7832BFA1FE9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 19:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIad0NUruDUG63kx4ECALjd4inHFblMc1GRENB68XKU=; b=xFOFYBuQkBhem1ZaN4tRHUCl5l
	wSC7CMhGVx5xGFjeSHsweE8qlR2mmle/SIlGp2ss/brKXxQAj1dveiYR1iDtk8QceOzWce50y7f8a
	9rETVCN8WPF+wQZyqpQLf9MsSUafaV3ZQAgnyeTPZySYBaGCd6Vmw8YTx/1+EiPP4a4W9VQyZlzPZ
	L5nZcTeGd5vkk9HftU38F9Ee4dFXESFr5hA7KzdpDgstvv2RCetzpXKH+/VxBiJ6eLyyxyQtDOPvQ
	pMrFITwaA3ertjIwH9twiBH5djtvmdmZDtFqLWt++DHyJhXvsT79EJQlEVLG/aSS7KAZWOO5mEm8f
	T8DEm3Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFdXP-0000000Ah5e-2eqJ;
	Wed, 22 Apr 2026 19:47:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFdXN-0000000Ah5D-0Rw6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 19:47:06 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776887221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FIad0NUruDUG63kx4ECALjd4inHFblMc1GRENB68XKU=;
	b=vzr/TcQ7PwlFKHcw3kxS9e+RpxqhTqOk+0x6/WRL5ITuTpLCFEYGcRkA8LuGb320ImhtSR
	WIC0PNkhHvH3cSQJBUoLDPoZaT7lP51lDZTJbhVKtzj8uCIjiuiEhx5kBsekT/bRAyYdQ0
	kWshgbh66cOJkZhtx1w4b4m4+ehVTviPTsLn9xGRzvBLSMGE8boNZ9I08Fkdf7tR5IGOYv
	u4fQUzRzdTxPhRFW60PjE3tvEx5iupIhnCX7y0HvKv6hdHA3t+YxBY3jFDcrrDPgjW5ncg
	tGZnOqVz7YoHBwLbQobq30vAXhbPzgBDobtJculDL7iBP64uWFuR/nOLiFFCSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776887221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FIad0NUruDUG63kx4ECALjd4inHFblMc1GRENB68XKU=;
	b=yIOGVhETdnA7SVsy83sNKIDsqBO5QBui6NQo6LsNgmFEUmHVFK5uRSmJgeCbGME1ZmLEfc
	hW9Cf2L8iFcbRJBQ==
To: Mark Rutland <mark.rutland@arm.com>
Cc: Mathias Stearn <mathias@mongodb.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Jinjie Ruan
 <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com>
Date: Wed, 22 Apr 2026 21:47:00 +0200
Message-ID: <87wlxy22x7.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_124705_354653_8282962C 
X-CRM114-Status: GOOD (  17.35  )
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

On Wed, Apr 22 2026 at 19:11, Mark Rutland wrote:
> On Wed, Apr 22, 2026 at 07:49:30PM +0200, Thomas Gleixner wrote:
> Conceptually we just need to use syscall_enter_from_user_mode() and
> irqentry_enter_from_user_mode() appropriately.

Right. I figured that out.

> In practice, I can't use those as-is without introducing the exception
> masking problems I just fixed up for irqentry_enter_from_kernel_mode(),
> so I'll need to do some similar refactoring first.

See below.

> I haven't paged everything in yet, so just to cehck, is there anything
> that would behave incorrectly if current->rseq.event.user_irq were set
> for syscall entry? IIUC it means we'll effectively do the slow path, and
> I was wondering if that might be acceptable as a one-line bodge for
> stable.

It might work, but it's trivial enough to avoid that. See below. That on
top of 6.19.y makes the selftests pass too.

Thanks,

        tglx
---
 arch/arm64/kernel/entry-common.c |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -58,6 +58,12 @@ static void noinstr exit_to_kernel_mode(
 	irqentry_exit(regs, state);
 }
 
+static __always_inline void arm64_enter_from_user_mode_syscall(struct pt_regs *regs)
+{
+	enter_from_user_mode(regs);
+	mte_disable_tco_entry(current);
+}
+
 /*
  * Handle IRQ/context state management when entering from user mode.
  * Before this function is called it is not safe to call regular kernel code,
@@ -65,8 +71,8 @@ static void noinstr exit_to_kernel_mode(
  */
 static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
 {
-	enter_from_user_mode(regs);
-	mte_disable_tco_entry(current);
+	arm64_enter_from_user_mode_syscall(regs);
+	rseq_note_user_irq_entry();
 }
 
 /*
@@ -717,7 +723,7 @@ static void noinstr el0_brk64(struct pt_
 
 static void noinstr el0_svc(struct pt_regs *regs)
 {
-	arm64_enter_from_user_mode(regs);
+	arm64_enter_from_user_mode_syscall(regs);
 	cortex_a76_erratum_1463225_svc_handler();
 	fpsimd_syscall_enter();
 	local_daif_restore(DAIF_PROCCTX);
@@ -869,7 +875,7 @@ static void noinstr el0_cp15(struct pt_r
 
 static void noinstr el0_svc_compat(struct pt_regs *regs)
 {
-	arm64_enter_from_user_mode(regs);
+	arm64_enter_from_user_mode_syscall(regs);
 	cortex_a76_erratum_1463225_svc_handler();
 	local_daif_restore(DAIF_PROCCTX);
 	do_el0_svc_compat(regs);

