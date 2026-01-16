Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6BFC98301
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWaFz2wgfe4zdqlsfrjYk4d5sFBpE0mayxuwBctGAZE=; b=QEe5Jeb+A/mc/4pwjZVF29MHHG
	UhWF2j73a8V6kqhWbVtm7HmJlDGpfzu02xQz+7wviqZznUygRFmxhJUhF9KnMRSo8DYi+UpXdNLgf
	b8dA18C1sNmhBPaJPqO8l7KEfyJOdQd5hbp//yDwlTq6gCxeoBXvwWxT5/cHrTusPr3zhv27dOzWd
	l/ReYHEPJIB42zRDeTteNl2nMCsykM+Lgx9U9obvPkXv2WpyA/aF/P+OQALvGq8RzI9JDaF8FIWsB
	gdpXaFMF6bJdEZyjCBTFmkrujmM9rbY+3HwqoaL9ysQVWRL7+waJTpRNLEUDdt0LD6SBPXcahIwjp
	5wIGHNKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq0h-0000000Ejbo-14LO;
	Fri, 16 Jan 2026 20:01:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq0e-0000000EjbH-1nkc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wWaFz2wgfe4zdqlsfrjYk4d5sFBpE0mayxuwBctGAZE=; b=VSy9zeuvnsW2ekUYA3DEa3DICC
	7TXp13Zr8anfGy0endwSwcwQhSS8PoFxCj15FO5P3J5jNhZXipWvCwWSdpTroBBLY9FquGv+3nBQF
	M0smljE0hv1RBFINQcL6mt/pWZdjUoH9zOjF3fXK/4EQIwQpCL7kYzLRmgCAAXmgoGoezYsMuUS9/
	aGIv6n4R5tovr0ZpKZ/qslquF2th9wItC3rt4baUzJ7l6F8YI2yo9WElB5mfC3eIGjOXovXJwuR+l
	RLDsnwlOMp9UvJpaZ4dBfBwgrvPRl8PSrrMk8mPwBkldwMcDxcwBMleE4FAlF8SILYamdkdJBYwV7
	p70eEfaw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47948)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vgq0Z-000000002cl-1Ixf;
	Fri, 16 Jan 2026 20:01:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vgq0W-000000003rp-0MPl;
	Fri, 16 Jan 2026 20:01:20 +0000
Date: Fri, 16 Jan 2026 20:01:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Yadi.hu" <yadi.hu@windriver.com>, Bryan Brattlof <bb@ti.com>
Subject: Re: [PATCH v4 1/2] ARM: mm: fault: Enable interrupts before invoking
 __do_user_fault()
Message-ID: <aWqZDwxUtaE1yP28@shell.armlinux.org.uk>
References: <20260116170041.1059997-1-bigeasy@linutronix.de>
 <20260116170041.1059997-2-bigeasy@linutronix.de>
 <aWp2fKGfIQKJ8wze@shell.armlinux.org.uk>
 <20260116181201.v-z31XJY@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116181201.v-z31XJY@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_120128_735989_2960523D 
X-CRM114-Status: GOOD (  20.95  )
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

On Fri, Jan 16, 2026 at 07:12:01PM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-01-16 17:33:48 [+0000], Russell King (Oracle) wrote:
> > On Fri, Jan 16, 2026 at 06:00:40PM +0100, Sebastian Andrzej Siewior wrote:
> > > From: "Yadi.hu" <yadi.hu@windriver.com>
> > > 
> > > A page fault from userland for a kernel address originates from from
> > > do_sect_fault() (!LPAE) or do_page_fault() and ends in __do_user_fault()
> > > by sending a signal.
> > > 
> > > Sending a signal requires to acquire sighand_struct::siglock which is a
> > > spinlock_t. On PREEMPT_RT spinlock_t becomes a sleeping spin lock which
> > > requires interrupts to be enabled. Since the calling context is user
> > > land, interrupts must have been enabled so it is fine to enable them in
> > > this case.
> > > 
> > > Enable interrupts in do_kernel_address_page_fault() unconditional in the
> > > user_mode case().
> > > Enable interrupts in do_sect_fault() if they were previously enabled.
> > 
> > Do you need any of this? __do_user_fault() now calls
> > local_irq_enable() as almost the first thing it does.
> 
> Different path(s):
> 
> LPAE
> | BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> | in_atomic(): 0, irqs_disabled(): 128, non_block: 0, pid: 639, name: arm-segfault
> | preempt_count: 0, expected: 0
> | RCU nest depth: 0, expected: 0
> | CPU: 0 UID: 0 PID: 639 Comm: arm-segfault3 Tainted: G        W           6.19.0-rc5-dirty #7 PREEMPT_RT
> | Tainted: [W]=WARN
> | Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 02/02/2022
> | Call trace:
> |  unwind_backtrace from show_stack+0x18/0x1c
> |  show_stack from dump_stack_lvl+0x34/0x44
> |  dump_stack_lvl from __might_resched+0x180/0x1c0
> |  __might_resched from rt_spin_lock+0x3c/0x1f0
> |  rt_spin_lock from force_sig_info_to_task+0x24/0x184
> |  force_sig_info_to_task from force_sig_fault+0x50/0x74
> |  force_sig_fault from do_kernel_address_page_fault+0xa8/0xb4
> |  do_kernel_address_page_fault from do_DataAbort+0x38/0xac
> |  do_DataAbort from __dabt_usr+0x50/0x60
> 
> !LPAE
> | BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> | in_atomic(): 0, irqs_disabled(): 128, non_block: 0, pid: 622, name: arm-segfault
> | preempt_count: 0, expected: 0
> | RCU nest depth: 0, expected: 0
> | CPU: 0 UID: 0 PID: 622 Comm: arm-segfault Tainted: G        W           6.19.0-rc5-dirty #8 PREEMPT_RT
> | Tainted: [W]=WARN
> | Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 02/02/2022
> | Call trace:
> |  unwind_backtrace from show_stack+0x18/0x1c
> |  show_stack from dump_stack_lvl+0x34/0x44
> |  dump_stack_lvl from __might_resched+0x180/0x1c0
> |  __might_resched from rt_spin_lock+0x3c/0x1f0
> |  rt_spin_lock from force_sig_info_to_task+0x24/0x184
> |  force_sig_info_to_task from force_sig_fault+0x50/0x74
> |  force_sig_fault from do_sect_fault+0x30/0x80
> |  do_sect_fault from do_DataAbort+0x44/0xb8
> |  do_DataAbort from __dabt_usr+0x50/0x60

Right, because I haven't pushed all the patches out. What was pushed out
was the basic set of fixes during the last merge window:

fd2dee1c6e22 ARM: fix branch predictor hardening (fixes)
7733bc7d299d ARM: fix hash_name() fault
40b466db1dff ARM: allow __do_kernel_fault() to report execution of memory faults
dea20281ac88 ARM: group is_permission_fault() with is_translation_fault()
edb924a7211c ARM: 9464/1: fix input-only operand modification in load_unaligned_zeropad()

which were sent out on the 8th December, but I still have these:

1055c9d604f9 ARM: provide individual is_translation_fault() and is_permission_fault()
47ce12a37f82 ARM: move FSR fault status definitions before fsr_fs()
eefbf2e97ad5 ARM: use BIT() and GENMASK() for fault status register fields
5f1e55bed37f ARM: move is_permission_fault() and is_translation_fault() to fault.h
ad1c1212ae15 ARM: move vmalloc() lazy-page table population
92442d814d99 ARM: ensure interrupts are enabled in __do_user_fault()

and, because they weren't fixes, it would've been inappropriate to
post these. However, I was on vacation from the 11th December through
to the 2nd January, had the madness of the huge email mountain, and
been working on stmmac and internal work issues since, I've not had any
time to look at anything else.

However, these changes will negate the need for your patch 1.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

