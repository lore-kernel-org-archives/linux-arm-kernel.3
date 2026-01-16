Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918B5C98301
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ib6Pre9AmKy6Deo0H6hsuR4Gt6AAwQyo8gA6MlsNCkY=; b=a85iNBlAMe+Pqq7/xLcMaWWnBW
	nZPH/mjp3I9KhofIxTxekNme6qGG+g/xFFLJHUKfsw46lYVs12iGCt8wfDByziwItXaitoc6PTNcm
	qkKe0DfOjUYOgL0rAZzap1fmuOP5pv1iGkYip9bsvyMkap72EWrxBDegrqkJE11GKyER0oxBIG3OR
	9V0OKyNdl736i5rFH7yMeOv29+PQrY507+xo6v3qAkiTl2naDsPHTJ8ARQE6M0WJNtCr5C9tzY9u1
	EsrVse4orZYZ3byJgYTKfGgHfmap8sxwutR+OilwJNfQY3sEjYu8yihi92xhi29/hTc3TORQ/oc34
	pDNPc4+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq7e-0000000ElT5-0R2b;
	Fri, 16 Jan 2026 20:08:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6z-0000000EkcE-15uN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ib6Pre9AmKy6Deo0H6hsuR4Gt6AAwQyo8gA6MlsNCkY=; b=QglP77Js6qujevNNS3mbM4CkX+
	AEMTT8Nmnpo1KVZ9wjSZxrd1RGfh/6taL+va6bS5b6nvPh/i73q4B3jAwpDcFoZfGx0N27ZXnJJ12
	0smF8bbpIOGVpoOh3JX25Bqm8XjFnnlKg1lSn4rywesI2gLhAmsSc+PcMGmugpmp4QZdjkCr9azg+
	g0jBA7xGJ3iBq64LcCB3DUCdsIs72RgnOSH090EM4XnSf6Gs2/0kCckyrEkAOzoJRHsNjSj7F8OIZ
	n1RUhRZ3vnSiyU7MBSPQmfgARR5Q8mSPhMbDeHpBqvMlb0ikEO9S9Oluubw8QE4drnPUuefwCbeA2
	HvLFHhHg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47356)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vgq6t-000000002eY-3ff9;
	Fri, 16 Jan 2026 20:07:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vgq6q-000000003rz-0o2T;
	Fri, 16 Jan 2026 20:07:52 +0000
Date: Fri, 16 Jan 2026 20:07:51 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Yadi.hu" <yadi.hu@windriver.com>, Bryan Brattlof <bb@ti.com>
Subject: Re: [PATCH v4 1/2] ARM: mm: fault: Enable interrupts before invoking
 __do_user_fault()
Message-ID: <aWqal9WQkYMkSzJl@shell.armlinux.org.uk>
References: <20260116170041.1059997-1-bigeasy@linutronix.de>
 <20260116170041.1059997-2-bigeasy@linutronix.de>
 <aWp2fKGfIQKJ8wze@shell.armlinux.org.uk>
 <20260116181201.v-z31XJY@linutronix.de>
 <aWqZDwxUtaE1yP28@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWqZDwxUtaE1yP28@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_120801_479985_00FC65FF 
X-CRM114-Status: GOOD (  32.53  )
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

On Fri, Jan 16, 2026 at 08:01:20PM +0000, Russell King (Oracle) wrote:
> On Fri, Jan 16, 2026 at 07:12:01PM +0100, Sebastian Andrzej Siewior wrote:
> > On 2026-01-16 17:33:48 [+0000], Russell King (Oracle) wrote:
> > > On Fri, Jan 16, 2026 at 06:00:40PM +0100, Sebastian Andrzej Siewior wrote:
> > > > From: "Yadi.hu" <yadi.hu@windriver.com>
> > > > 
> > > > A page fault from userland for a kernel address originates from from
> > > > do_sect_fault() (!LPAE) or do_page_fault() and ends in __do_user_fault()
> > > > by sending a signal.
> > > > 
> > > > Sending a signal requires to acquire sighand_struct::siglock which is a
> > > > spinlock_t. On PREEMPT_RT spinlock_t becomes a sleeping spin lock which
> > > > requires interrupts to be enabled. Since the calling context is user
> > > > land, interrupts must have been enabled so it is fine to enable them in
> > > > this case.
> > > > 
> > > > Enable interrupts in do_kernel_address_page_fault() unconditional in the
> > > > user_mode case().
> > > > Enable interrupts in do_sect_fault() if they were previously enabled.
> > > 
> > > Do you need any of this? __do_user_fault() now calls
> > > local_irq_enable() as almost the first thing it does.
> > 
> > Different path(s):
> > 
> > LPAE
> > | BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> > | in_atomic(): 0, irqs_disabled(): 128, non_block: 0, pid: 639, name: arm-segfault
> > | preempt_count: 0, expected: 0
> > | RCU nest depth: 0, expected: 0
> > | CPU: 0 UID: 0 PID: 639 Comm: arm-segfault3 Tainted: G        W           6.19.0-rc5-dirty #7 PREEMPT_RT
> > | Tainted: [W]=WARN
> > | Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 02/02/2022
> > | Call trace:
> > |  unwind_backtrace from show_stack+0x18/0x1c
> > |  show_stack from dump_stack_lvl+0x34/0x44
> > |  dump_stack_lvl from __might_resched+0x180/0x1c0
> > |  __might_resched from rt_spin_lock+0x3c/0x1f0
> > |  rt_spin_lock from force_sig_info_to_task+0x24/0x184
> > |  force_sig_info_to_task from force_sig_fault+0x50/0x74
> > |  force_sig_fault from do_kernel_address_page_fault+0xa8/0xb4
> > |  do_kernel_address_page_fault from do_DataAbort+0x38/0xac
> > |  do_DataAbort from __dabt_usr+0x50/0x60
> > 
> > !LPAE
> > | BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> > | in_atomic(): 0, irqs_disabled(): 128, non_block: 0, pid: 622, name: arm-segfault
> > | preempt_count: 0, expected: 0
> > | RCU nest depth: 0, expected: 0
> > | CPU: 0 UID: 0 PID: 622 Comm: arm-segfault Tainted: G        W           6.19.0-rc5-dirty #8 PREEMPT_RT
> > | Tainted: [W]=WARN
> > | Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 02/02/2022
> > | Call trace:
> > |  unwind_backtrace from show_stack+0x18/0x1c
> > |  show_stack from dump_stack_lvl+0x34/0x44
> > |  dump_stack_lvl from __might_resched+0x180/0x1c0
> > |  __might_resched from rt_spin_lock+0x3c/0x1f0
> > |  rt_spin_lock from force_sig_info_to_task+0x24/0x184
> > |  force_sig_info_to_task from force_sig_fault+0x50/0x74
> > |  force_sig_fault from do_sect_fault+0x30/0x80
> > |  do_sect_fault from do_DataAbort+0x44/0xb8
> > |  do_DataAbort from __dabt_usr+0x50/0x60
> 
> Right, because I haven't pushed all the patches out. What was pushed out
> was the basic set of fixes during the last merge window:
> 
> fd2dee1c6e22 ARM: fix branch predictor hardening (fixes)
> 7733bc7d299d ARM: fix hash_name() fault
> 40b466db1dff ARM: allow __do_kernel_fault() to report execution of memory faults
> dea20281ac88 ARM: group is_permission_fault() with is_translation_fault()
> edb924a7211c ARM: 9464/1: fix input-only operand modification in load_unaligned_zeropad()
> 
> which were sent out on the 8th December, but I still have these:
> 
> 1055c9d604f9 ARM: provide individual is_translation_fault() and is_permission_fault()
> 47ce12a37f82 ARM: move FSR fault status definitions before fsr_fs()
> eefbf2e97ad5 ARM: use BIT() and GENMASK() for fault status register fields
> 5f1e55bed37f ARM: move is_permission_fault() and is_translation_fault() to fault.h
> ad1c1212ae15 ARM: move vmalloc() lazy-page table population
> 92442d814d99 ARM: ensure interrupts are enabled in __do_user_fault()
> 
> and, because they weren't fixes, it would've been inappropriate to
> post these. However, I was on vacation from the 11th December through
> to the 2nd January, had the madness of the huge email mountain, and
> been working on stmmac and internal work issues since, I've not had any
> time to look at anything else.
> 
> However, these changes will negate the need for your patch 1.

Oh, and, as I've said on netdev recently, I have lots of patches. I
don't have time to push all patches all the time. Those that I think
are the highest priority get the attention - so if something goes
quiet, the patches don't get progressed (because something else has
taken over.)

I haven't published these yet to my external git tree because they're
currently on top of my raw private "development" branch containing...

$ git lg origin..rmk | wc -l
473

many of those behind those I mentioned above. At some point I need to
move them to their own separate branch, or to the "misc" branch after
sending them to the mailing list... but the latter means spending time
writing a covering message summarising the changes, and the key thing
is "time".

I've wasted almost all of today running a bisect for a stmmac issue that
takes out my _entire_ network at home. It's wasted because what I
thought was a good commit turns out, on re-testing, to have been bad,
and right now I have no idea what a good commit is, and whether that
even exists before the platform support was merged.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

