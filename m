Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEEDCDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 09:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OO+/HYEHVU7mrQlTQFm+x8smhOEbJOWX2G5Z9vZo/LU=; b=vJGBo8DYohhtR9a1ZHMY2r1f1u
	n0YOAnpluK9kC8i/G/Kz7b6VcOo14grtXNdxF1r26pWPoBq1On3txWb4C4ijco312FDt0qKmJB1NL
	pF+sOqcKnvQbZQbOKqkyAHjHC01g77yYYuOIbK6ETXqtmmJdniIg1qfoDZr2nriA23zkGgp9N9kUG
	yileUsezBhcfULMrWKN2rhVmn+Jl/nDSJn/4p4J4PfLvDIKo6yDLLyAbvbMghYHTXkKlNl/VBJhGS
	FoqfD7aFwVEB9lRKv9ENghzPYw77beRK+A5PPM69nA4DDlmQD+xHDZyREnb+29tndoTcZU0/qJQQO
	EIW4pCXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcg2G-00000008sOD-2qqS;
	Thu, 25 Jun 2026 09:06:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcg2D-00000008sMs-21zS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OO+/HYEHVU7mrQlTQFm+x8smhOEbJOWX2G5Z9vZo/LU=; b=a2wge7awYvSVOrIb6JR/DXjX1Z
	CS8EiK4eIIXAxU5duFXx8VssXWvKe5MwSEEq0syXbEBBuJae68Wn543V9DZzf92TJqJFo8dctJrEW
	UTh4D7UBhAQksKZa1mNk4k+m8NqWwKeepZ0w6ymaUTCcNCp//kFWQ8YMKjS8ci0MwvAq4hJcg7Ytf
	jT+nfizmlrqc1nZE8Q2TU47LZdGnlZs9QBUwBWtcZBay5vJZw/jj4yj5WXE3q2+PPSwKXK3WgSPjN
	omkCfhyAP9bK9YmfuDn/r/PqvQDdVtq4q+B/UjRnIIBYEGwZeDkE7ytUnzy3Nnu8dJ6EZ9zVY7HN/
	1cKJVqEQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55702)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wcg20-000000000gq-1mB7;
	Thu, 25 Jun 2026 10:05:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wcg1w-000000001sO-44Zi;
	Thu, 25 Jun 2026 10:05:52 +0100
Date: Thu, 25 Jun 2026 10:05:52 +0100
From: Russell King <linux@armlinux.org.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, clrkwllms@kernel.org,
	rostedt@goodmis.org, linusw@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, liaohua4@huawei.com,
	lilinjie8@huawei.com
Subject: Re: [PATCH] ARM: enable interrupts when arm_notify_die() is handling
 user mode errors
Message-ID: <ajzvcCve4LubjH9J@shell.armlinux.org.uk>
References: <20260625073522.182503-1-xieyuanbin1@huawei.com>
 <20260625085034.tvyGSmaP@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625085034.tvyGSmaP@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_020609_831823_3CACC735 
X-CRM114-Status: GOOD (  30.06  )
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

On Thu, Jun 25, 2026 at 10:50:34AM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-06-25 15:35:22 [+0800], Xie Yuanbin wrote:
> > For lastest linux-next kernel, with default multi_v7_defconfig, and
> > setting CONFIG_PREEMPT_RT=y, CONFIG_DEBUG_ATOMIC_SLEEP=y, and
> > CONFIG_PERF_EVENTS=n. When the user program executes bkpt
> > instruction, the following WARN will be triggered:
> > ```log
> > [    3.677825] BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> > [    3.678002] in_atomic(): 0, irqs_disabled(): 128, non_block: 0, pid: 84, name: test
> > [    3.678036] preempt_count: 0, expected: 0
> > [    3.678078] RCU nest depth: 0, expected: 0
> > [    3.678864] CPU: 0 UID: 0 PID: 84 Comm: test Tainted: G        W           7.1.0-next-20260623 #45 PREEMPT_RT
> > [    3.679067] Tainted: [W]=WARN
> > [    3.679088] Hardware name: Generic DT based system
> > [    3.679198] Call trace:
> > [    3.679695]  unwind_backtrace from show_stack+0x10/0x14
> > [    3.680363]  show_stack from dump_stack_lvl+0x50/0x5c
> > [    3.680377]  dump_stack_lvl from __might_resched+0x160/0x174
> > [    3.680393]  __might_resched from rt_spin_lock+0x38/0x138
> > [    3.680425]  rt_spin_lock from force_sig_info_to_task+0x1c/0x11c
> > [    3.680438]  force_sig_info_to_task from force_sig_fault+0x44/0x64
> > [    3.680450]  force_sig_fault from do_PrefetchAbort+0x94/0x9c
> > [    3.680461]  do_PrefetchAbort from ret_from_exception+0x0/0x20
> > [    3.680513] Exception stack(0xf0ab5fb0 to 0xf0ab5ff8)
> > [    3.680653] 5fa0:                                     00000000 bed32e94 bed32e9c 00037954
> > [    3.680672] 5fc0: 00000002 00000001 bed32e94 0009d590 00000000 bed32e9c 00000002 00000000
> > [    3.680682] 5fe0: bed32d48 bed32d38 00037a00 00037958 60000010 ffffffff
> > ```
> 
> I don't think this required information as it is obvious. At the very
> least you could trim it the needed parts if considered needed.
> 
> > When PREEMPT_RT is enabled, force_sig_info() requires interrupts to be
> > enabled. Enable interrupts when arm_notify_die() is handling user mode
> > errors to fix the issue.
> > 
> > Fixes: c6e61c06d606 ("ARM: 9463/1: Allow to enable RT")
> > 
> > Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > Cc: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
> 
> So I did test the 32bit case on arm64 while testing/ backporting the
> breakpoint handling there but apparently did not try it on real
> arm32.
> 
> For "asm("BKPT #0");" the SIGTRAP is not raised instead I get just
> | 8<--- cut here ---
> | Unhandled prefetch abort: debug event (0x222) at 0x00000000
> 
> on the kernel side and a "Bus error" on userland side.
> 
> So
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> for this but actual breakpoint handling might be broken or is it just
> me? But then your stack trace looks like mine so :/

ARM Linux doesn't use BKPT. BKPT was an instruction introduced by Arm
Ltd in ARMv5TE. Prior to this, we use a UDF instruction instead (we
had to pick something!) and gdb and other tools use that as a
breapoint.

Moreover, BKPT isn't guaranteed to trap to the kernel, especially when
there is a hardware debugger connected. In that case, DDI0100E states
that use of BKPT must be according to the instructions provided with
the hardware debugger. This makes BKPT unsuitable for use.

Consequently, ARM Linux has not supported the use of BKPT - no code
was added to support this instruction, hence why the kernel prints an
Alert level message stating that the fault was unhandled.

In addition, when a hardware debugger is not being used, with the
addition of hw_breakpoint.c, what userland sees in response depends on
kernel configuration. If hw_breakpoint.c is not built (when PERF_EVENTS
is disabled), then a SIGBUS signal will be raised. If it is built, and
prior to a recent commit by LinusW, it will raise a SIGTRAP. After
LinusW's commit, it won't raise a signal, but userspace will spin on
the BKPT instruction.

The path we go through in the above case is very much an "oh damn,
we aren't handling this exception, let's try to do something that
might save the day".

Rather than throwing local_irq_enable() in random places, it would
be better to do it earlier, but I would want to review what x86 does
when it gets an exception that the kernel doesn't handle - not sure
when I'll get around to doing that though.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

