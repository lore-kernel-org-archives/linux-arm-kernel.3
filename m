Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1389EA3C4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 10:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00OgwhjvE58HPFHqLSXK/Zv2Ur++0Ezv5iC70n7exiI=; b=CBQcDncvmauDWZPZO4kjqCBm30
	O96aCT0HwfLxHfScb68Gf7WWsbAeuN1ubQJPOYV2W1VFYuafsD6V6ExXDQOG/Iorm23AoX0MqsoLX
	xvK77vW+Tt+vYZKkRCBRmXxEkXKe53qxsx+3kLKegXvNwJ3x4oEApW+/b1vJx6pTO0HtkUnh+9BVZ
	9dozEyz1R8T9kyCuK3f4qqeEWdL32jgfHHXGx6EwKQzl5gc2KNO/GjcB2ik+A4Q9xJNqfIqMTVUuu
	82fWRO3L0oK9JUcR5dbhh3KGOSQNFGV3MzwEpPwNuYYXVOYSbrVJIH7KwumkI19iGb4tDg5moWeD6
	IdhxhZzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmzp-0000000AC2U-42BB;
	Thu, 09 Apr 2026 10:52:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmzm-0000000AC1R-3ifX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 10:52:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D2653517;
	Thu,  9 Apr 2026 03:52:15 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2688C3F632;
	Thu,  9 Apr 2026 03:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775731941; bh=JhA+BE6gIOvzfklZpV3HvOOedmNWkkbMDfee5BYiMB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rUwGOFO8/JfFFTQTz5Alv8657N9cUcl2Z+r4LAiH9OjHfXGloo/Cd5zcVQrlmfYKd
	 0o1EgNjy+essvCBgLwG+5wMMsqGnGT1ewLrwEkv1rsj002F6VxYxmvaa2HdUIsflG1
	 UOPSsq79ZgBxSB9qJA7wU52KTqF5XNocsobNlADk=
Date: Thu, 9 Apr 2026 11:52:16 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH V3 7/7] arm64/hw_breakpoint: Enable FEAT_Debugv8p9
Message-ID: <adeE4MD0RgapI8aL@J2N7QTR9R3>
References: <20241216040831.2448257-1-anshuman.khandual@arm.com>
 <20241216040831.2448257-8-anshuman.khandual@arm.com>
 <Z2AH1SN5CipWkkE4@J2N7QTR9R3>
 <20260331225800.GA2082670-robh@kernel.org>
 <ac5G8e4zWTdicDBs@J2N7QTR9R3>
 <CAL_JsqLEBJ7Ok9TngWTqjaWY_LJCPtronv8=gnm=J0FymDKLCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLEBJ7Ok9TngWTqjaWY_LJCPtronv8=gnm=J0FymDKLCg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_035223_009127_98EB285A 
X-CRM114-Status: GOOD (  33.78  )
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

On Thu, Apr 02, 2026 at 12:46:56PM -0500, Rob Herring wrote:
> On Thu, Apr 2, 2026 at 5:37 AM Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > On Tue, Mar 31, 2026 at 05:58:00PM -0500, Rob Herring wrote:
> > > On Mon, Dec 16, 2024 at 10:58:29AM +0000, Mark Rutland wrote:
> > > > On Mon, Dec 16, 2024 at 09:38:31AM +0530, Anshuman Khandual wrote:
> > That said, the use of 'bp_per_reg' looks suspect given their
> > arch_install_hw_breakpoint() and arch_uninstall_hw_breakpoint() modify
> > that non-atomically.
> 
> You don't believe the comment saying counter->ctx->lock is held?

Sorry, my concern here was that hw_breakpoint_handler() (which cannot
hold the lock) consumes bp_per_reg[], and could race with the non-atomic
modification in arch_install_hw_breakpoint() or
arch_uninstall_hw_breakpoint().

I've sent a more elaborate mail to x86 folk, with that and another issue
caused by taking a breakpoint under arch_uninstall_hw_breakpoint():

  https://lore.kernel.org/lkml/adZWmPW8S9Y2pwkv@J2N7QTR9R3.cambridge.arm.com/

I think we have a similar latent issue where we can take an breakpoint
or watchpoint ad infinitum, described in more detail at the end of this
mail.

[...]

> > > > | What prevents a race with an exception handler? e.g.
> > > > |
> > > > | * Does the structure of the code prevent that somehow?
> > >
> > > If you can't set a breakpoint/watchpoint in NOKPROBE_SYMBOL() annotated
> > > code, you can't race.
> >
> > As above, I agree (with caveats), but I couldn't spot where this is
> > enforced.
> >
> > > However, there's no such annotation for data. It looks like the kernel
> > > policy is "don't do that" or disable all breakpoints/watchpoints.
> >
> > If we have to transiently disable watchpoints/breakpoints when
> > manipulating the relevant HW registers, that sounds fine to me.
> 
> For wp/bp_on_reg, the ordering is 'data access, h/w accesses'. I think
> we just need a barrier to enforce that ordering so the data access
> (and then watchpoint) don't trigger in the middle of the h/w accesses.

I assume that by 'h/w accesses' you mean MSRs to the system registers
controlling breakpoints/watchpoints. Ordering-wise, I don't believe
memory barriers are necessary here (explain in more detail below).
However, I also think there's a latent issue here that might bite us
with the new banking, described at the end of this mail.

Both breakpoint and watchpoint exceptions are synchronous, meanning that
they can only be taken from the specific instruction that triggered
them.  However, updates to the watchpoint control registers *do* need a
context synchronization event before they're guarnateed to take effect.

For a sequence:

    // Initially:
    // - MDSCR, MDCR, DAIF.D permit debug exceptions at CurrentEL
    // - No watchpoints enabled
    
    0x000:  LDR <val>, [<addr>]
    0x004:  MSR DBGWVR<n>_EL1, <addr>
    0x008:  MSR DBGWCR<n>_EL1, <configure_and_enable>
    0x010:  LDR <val>, [<addr>]
    0x014:  ISB
    0x018:  LDR <val>, [<addr>]

... we know:

    (a) The LDR at 0x000 *cannot* trigger the watchpoint.
    (b) The LDR at 0x010 *might* trigger the matchpoint.
    (c) The LDR at 0x018 *must* trigger the watchpoint.

For C code, we can enforce this order with barrier(), e.g.

	val = *addr;
	barrier();
	write_sysreg(addr, DBGWVR<n>_EL1);
	write_sysreg(configure_and_enable, DBGWCR<n>_EL1);
	isb();

... where the compiler cannot re-order the memory access (or
write_sysreg(), or isb()) across the barrier(), and as isb() has a
memory clobber, the same is true for isb().

Likewise, for the inverse sequence:

    // Initially:
    // - MDSCR, MDCR, DAIF.D permit debug exceptions at CurrentEL
    // - Watchpoint configured and enabled for <addr>

    0x100:  LDR <val>, [<addr>]
    0x104:  MSR DBGWCR<n>_EL1, <disable>
    0x108:  LDR <val>, [<addr>]
    0x110:  ISB
    0x114:  LDR <val>, [<addr>]

... we know:

    (a) The LDR at 0x100 *must* trigger the watchpoint.
    (b) The LDR at 0x108 *might* trigger the watchpoint.
    (c) The LDR at 0x114 *cannot* trigger the watchpoint.

> Any guidance on the flavor of dsb here? (And is there any guarantee
> that the access is visible to the watchpoint h/w after a dsb
> completes?)

Hopefully the above was sufficient?

As mentioned above, I think we have a latent issue where we can take a
breakpoint or watchpoint under arch_uninstall_hw_breakpoint(), where we
have:

    arch_uninstall_hw_breakpoint(bp) {
        ...
	hw_breakpoint_control(bp, HW_BREAKPOINT_UNINSTALL) {
	    ...
	    hw_breakpoint_slot_setup(slots, max_slots, bp, HW_BREAKPOINT_UNINSTALL) {
	         ...
		 *slot = NULL;
		 ...
	    }
	    ...
	    write_wb_reg(ctrl_reg, i, 0) {
	        ...
	    	write_sysreg(0, ...);
		isb();
		...
	    }
	}
    }

The HW breakpoint/watchpoint associated with 'bp' could be triggered
between setting '*slot' to NULL and the ISB. If that happens, then
do_breakpoint() won't find 'bp', and will return *without* disabling the
HW breakpoint or attempting to step.

If that first exception was taken *before* the MSR in write_sysreg(),
then nothing has changed, and the breakpoint/watchpoint will then be
taken again ad infinitum.

If that first exception was taken *after* the MSR in write_sysreg(), the
context synchronization provided by exception entry/return will prevent
it from being taken again.

Building v6.19 and testing (with pseudo-NMI enabled):

| #  grep write_wb_reg /proc/kallsyms
| ffff80008004b980 t write_wb_reg
| # ./perf-6.19 stat -a -C 1 -e 'mem:0xffff80008004b980/4:xk' true
| rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
| rcu:     1-...0: (1 GPs behind) idle=2334/1/0x4000000000000000 softirq=140/140 fqs=2623
| rcu:     (detected by 0, t=5252 jiffies, g=-859, q=7 ncpus=2)
| Sending NMI from CPU 0 to CPUs 1:
| NMI backtrace for cpu 1
| CPU: 1 UID: 0 PID: 139 Comm: perf-6.19 Not tainted 6.19.0 #1 PREEMPT 
| Hardware name: linux,dummy-virt (DT)
| pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
| pc : write_wb_reg+0x0/0x250
| lr : hw_breakpoint_control+0x164/0x248
| sp : ffff800082d73980
| pmr: 000000c0
| x29: ffff800082d73980 x28: ffff000004692dc0 x27: ffff8000802708a0
| x26: ffff00000473c000 x25: 0000000000000000 x24: 0000000000000000
| x23: ffff00000473c000 x22: 0000000000000000 x21: ffff800082d73b70
| x20: ffff00007fbd7b28 x19: ffff00000473c000 x18: 0000000000000000
| x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
| x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
| x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
| x8 : 0000000000000001 x7 : 0000000000000001 x6 : 0000000000000010
| x5 : 0000000000000001 x4 : 0000000000000006 x3 : ffff00000473c000
| x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000010
| Call trace:
|  write_wb_reg+0x0/0x250 (P)
|  arch_uninstall_hw_breakpoint+0x14/0x20
|  hw_breakpoint_del+0x10/0x20
|  event_sched_out+0x8c/0x160
|  group_sched_out+0x44/0xa0
|  __perf_event_disable.part.0+0x114/0x120
|  __perf_event_disable+0x1c/0x2c
|  event_function+0x84/0xd8
|  remote_function+0x50/0x64
|  generic_exec_single+0x88/0xf0
|  smp_call_function_single+0x90/0x1c8
|  event_function_call+0x1d8/0x1e4
|  _perf_event_disable+0x44/0x6c
|  perf_event_for_each_child+0x38/0x84
|  _perf_ioctl+0x19c/0xab8
|  perf_ioctl+0x50/0x80
|  __arm64_sys_ioctl+0xa4/0x100
|  invoke_syscall.constprop.0+0x40/0xf0
|  el0_svc_common.constprop.0+0x38/0xd8
|  do_el0_svc+0x1c/0x28
|  el0_svc+0x38/0x148
|  el0t_64_sync_handler+0xa0/0xe4
|  el0t_64_sync+0x1ac/0x1b0

I think that ideally when diabling a breakpoint/watchpoint, we'd program
the control register *before* manipulating the slot. The existing
structure of the code is rather unhelpful for fixing that.

While this does fall into "don't do that" territory, I do think we
should aim for the kernel to survive rather than fall into a livelock.
I'll take another look into this shortly -- I think we need a wider
cleanup.

Mark.

