Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778F4C982E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 18:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44ovzE0jgnGikbgDfiXC8zkvtERzgKGt8g/FgXzZCh0=; b=GrCnEktZK6CWPAcorLeLIZrdGF
	zi9fSJQUQfx5tv4eWjVEKFCYtY59q0EPKewNiYilVp0UARVtaQXoOdQkdGygyKLHxKT2JOrEhFHMG
	0ZDPLZsh6BJtrP+HorO16Ky8hmbc5kStajV2qXCjqhW3MlF15bH1f1AXvvxmqyuFcVuzkyZOAmdxN
	lhPrWa1q5idBpYEsJyqFxMf3SOGHtzGUj0c6NmV6+W/VprMbA717PUIHhYrLQY9B6+Kzlrng0b1Ad
	fR5Q6/u5FK/pq5sutVuQP0YzXHp9i1ZLBtOf3WBjkkRsFj38n+c3s1IKDEAwRjhUPG1VY5SafQLQi
	KDyoH1JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgoIq-0000000Eck3-1UI0;
	Fri, 16 Jan 2026 18:12:08 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgoIo-0000000EcjF-0Kgt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 18:12:07 +0000
Date: Fri, 16 Jan 2026 19:12:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768587122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=44ovzE0jgnGikbgDfiXC8zkvtERzgKGt8g/FgXzZCh0=;
	b=J1hwsbAzRj47aAHpn7CcxGiJHFdJjbGjpfmOkeRFUQ2QcIH20XReb9sYr2ZPQQbkGebfxW
	GLYnEj7jHQPBO8C0D2OqFlfztwJTl9R1ZXIrhedihNQkHhNLQj/bPkLi53boZXbJzAV9yd
	DVZoI4YPyGAV3fwNfTxrdxpH2azIQ3BtHXGrYiGBIiGDXdFpg8e5Axlh2A093sMD71BpEQ
	CqCFpDWR2XXKFCFX+GPo401DyPOcEM+c+O7IXkkLmJlIih8t5OKNVFexWKqOX0gH5zUJDV
	+XvvdsALqj8LFgVKKqA94/13AybsvieX4AjgzCr8ER4yF0hjrwoRK9Hj2qRcrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768587122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=44ovzE0jgnGikbgDfiXC8zkvtERzgKGt8g/FgXzZCh0=;
	b=zEvPD4Nf6oR7B1xtbrUtlnU67rQ+EZnMCcC5XjIBmyyjaI1q2eYEL/zo8pgPHiakOG1b8+
	x0C+F3Zxas35VODQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Yadi.hu" <yadi.hu@windriver.com>, Bryan Brattlof <bb@ti.com>
Subject: Re: [PATCH v4 1/2] ARM: mm: fault: Enable interrupts before invoking
 __do_user_fault()
Message-ID: <20260116181201.v-z31XJY@linutronix.de>
References: <20260116170041.1059997-1-bigeasy@linutronix.de>
 <20260116170041.1059997-2-bigeasy@linutronix.de>
 <aWp2fKGfIQKJ8wze@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aWp2fKGfIQKJ8wze@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_101206_261890_1DB8C9F0 
X-CRM114-Status: GOOD (  12.83  )
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

On 2026-01-16 17:33:48 [+0000], Russell King (Oracle) wrote:
> On Fri, Jan 16, 2026 at 06:00:40PM +0100, Sebastian Andrzej Siewior wrote:
> > From: "Yadi.hu" <yadi.hu@windriver.com>
> > 
> > A page fault from userland for a kernel address originates from from
> > do_sect_fault() (!LPAE) or do_page_fault() and ends in __do_user_fault()
> > by sending a signal.
> > 
> > Sending a signal requires to acquire sighand_struct::siglock which is a
> > spinlock_t. On PREEMPT_RT spinlock_t becomes a sleeping spin lock which
> > requires interrupts to be enabled. Since the calling context is user
> > land, interrupts must have been enabled so it is fine to enable them in
> > this case.
> > 
> > Enable interrupts in do_kernel_address_page_fault() unconditional in the
> > user_mode case().
> > Enable interrupts in do_sect_fault() if they were previously enabled.
> 
> Do you need any of this? __do_user_fault() now calls
> local_irq_enable() as almost the first thing it does.

Different path(s):

LPAE
| BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
| in_atomic(): 0, irqs_disabled(): 128, non_block: 0, pid: 639, name: arm-segfault
| preempt_count: 0, expected: 0
| RCU nest depth: 0, expected: 0
| CPU: 0 UID: 0 PID: 639 Comm: arm-segfault3 Tainted: G        W           6.19.0-rc5-dirty #7 PREEMPT_RT
| Tainted: [W]=WARN
| Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 02/02/2022
| Call trace:
|  unwind_backtrace from show_stack+0x18/0x1c
|  show_stack from dump_stack_lvl+0x34/0x44
|  dump_stack_lvl from __might_resched+0x180/0x1c0
|  __might_resched from rt_spin_lock+0x3c/0x1f0
|  rt_spin_lock from force_sig_info_to_task+0x24/0x184
|  force_sig_info_to_task from force_sig_fault+0x50/0x74
|  force_sig_fault from do_kernel_address_page_fault+0xa8/0xb4
|  do_kernel_address_page_fault from do_DataAbort+0x38/0xac
|  do_DataAbort from __dabt_usr+0x50/0x60

!LPAE
| BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
| in_atomic(): 0, irqs_disabled(): 128, non_block: 0, pid: 622, name: arm-segfault
| preempt_count: 0, expected: 0
| RCU nest depth: 0, expected: 0
| CPU: 0 UID: 0 PID: 622 Comm: arm-segfault Tainted: G        W           6.19.0-rc5-dirty #8 PREEMPT_RT
| Tainted: [W]=WARN
| Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 02/02/2022
| Call trace:
|  unwind_backtrace from show_stack+0x18/0x1c
|  show_stack from dump_stack_lvl+0x34/0x44
|  dump_stack_lvl from __might_resched+0x180/0x1c0
|  __might_resched from rt_spin_lock+0x3c/0x1f0
|  rt_spin_lock from force_sig_info_to_task+0x24/0x184
|  force_sig_info_to_task from force_sig_fault+0x50/0x74
|  force_sig_fault from do_sect_fault+0x30/0x80
|  do_sect_fault from do_DataAbort+0x44/0xb8
|  do_DataAbort from __dabt_usr+0x50/0x60

Sebastian

