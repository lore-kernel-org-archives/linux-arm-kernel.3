Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A19EBFD18
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xP/WlfcPo1kQzeWxonPzh0gu3m/LB5MrsZmJa2zsNQE=; b=BrlZZaI85HPNuBGAhNN3j3I6P6
	i//NSVOih7uXAutHnihoXqCHFjAh5ee4WhT1sXu6RT6CBXSfXq+i/DSsl7L2mFbizFRJC7x/wf1e3
	q/eGyA2UzSm5086bXnHtO7uAewQCiqjMyUJHY2Cm0quJMbhiEz/z2x2yV1xHcUyruyizoKfbGEU9a
	Cc4nHtPqxY5Vbd6Ek0m59VL+42q1pyPPV6e0Tx3e3+mDZ3eBAyNQ9ynapx6zhkAF7eRaoGjVNqWic
	BuVMFJiXzn/IPF496bvLkSL3hy1rIA2w9nh+efcNFjK3lPFgvmmBqichzqA9jcLcDMiDPKRkAAtrq
	TwywPvig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCyE-0000000FIRX-3ree;
	Mon, 13 Apr 2026 08:48:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCyB-0000000FIQg-3LGu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:48:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B49F35A7;
	Mon, 13 Apr 2026 01:48:26 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E8F73F641;
	Mon, 13 Apr 2026 01:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776070112; bh=hUPxWcI4NOizYbLE5rZuxt0rbBg5Iy6mLneKPMJd5BA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tLeYU031x+gzICTUUu7gLB1KHTBpdjTlNnEOQgRT1RDGz5P6ZWnUx3WyfNNiMgB1/
	 sXQVi3l79V6yd2Ia/f/kizy+c55whhJZfuJyLObNFpRN5jvt/S8Dklb2HNsxbOXJrQ
	 tLJqZBo3c2+T7TGmj8/Gt8Hbmh+m8zSSIPKec48Q=
Date: Mon, 13 Apr 2026 09:48:24 +0100
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
Message-ID: <adyt2FYz0Cx5r-To@J2N7QTR9R3>
References: <20241216040831.2448257-1-anshuman.khandual@arm.com>
 <20241216040831.2448257-8-anshuman.khandual@arm.com>
 <Z2AH1SN5CipWkkE4@J2N7QTR9R3>
 <20260331225800.GA2082670-robh@kernel.org>
 <ac5G8e4zWTdicDBs@J2N7QTR9R3>
 <CAL_JsqLEBJ7Ok9TngWTqjaWY_LJCPtronv8=gnm=J0FymDKLCg@mail.gmail.com>
 <adeE4MD0RgapI8aL@J2N7QTR9R3>
 <CAL_Jsq+=3CKrUDcdgSHFaSGgvnh9ZxTGEBTRLkwrYgzQ=frOdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+=3CKrUDcdgSHFaSGgvnh9ZxTGEBTRLkwrYgzQ=frOdg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_014835_919971_78ADEE17 
X-CRM114-Status: GOOD (  35.82  )
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

On Fri, Apr 10, 2026 at 02:55:55PM -0500, Rob Herring wrote:
> On Thu, Apr 9, 2026 at 5:52 AM Mark Rutland <mark.rutland@arm.com> wrote:
> > Both breakpoint and watchpoint exceptions are synchronous, meanning that
> > they can only be taken from the specific instruction that triggered
> > them.  However, updates to the watchpoint control registers *do* need a
> > context synchronization event before they're guarnateed to take effect.
> >
> > For a sequence:
> >
> >     // Initially:
> >     // - MDSCR, MDCR, DAIF.D permit debug exceptions at CurrentEL
> >     // - No watchpoints enabled
> >
> >     0x000:  LDR <val>, [<addr>]
> >     0x004:  MSR DBGWVR<n>_EL1, <addr>
> >     0x008:  MSR DBGWCR<n>_EL1, <configure_and_enable>
> >     0x010:  LDR <val>, [<addr>]
> >     0x014:  ISB
> >     0x018:  LDR <val>, [<addr>]
> >
> > ... we know:
> >
> >     (a) The LDR at 0x000 *cannot* trigger the watchpoint.
> 
> Why not?

Because:

(a) As noted above, both breakpoint and watchpoint exceptions are
    synchronous. They can only be taken from the specific *instruction*
    that triggered them, and the exception must be consistent with no
    subsequent instructions having been executed.

    In ARM DDI 0487 M.a.a, see:

    - Section D1.4 ("Exceptions"), and in particular RFQHGR, RTNVSL.
    - Section D2.8 ("Breakpoint exceptions")
    - Section D2.9 ("Watchpoint exceptions")

(b) Generally, writes to system registers cannot affect earlier
    instructions.

    In ARM DDI 0487 M.a.a, see: Section D24.1.2.2 ("Synchronization
    requirements for AArch64 System registers").

    Note in particular the statement: "Direct writes to System registers
    are not allowed to affect any instructions appearing in program
    order before the direct write."

> Can't the LDR complete after the MSR?

The memory effects of the LDR at 0x000 could complete after the MSRs at
0x004 and 0x008 are executed.

However, any watchpoints/breakpoint triggered by the LDR at 0x000 must
be taken *before* the next instruction (i.e. the MSR at 0x004) can be
architecturally executed, and any such execption must be consistent with
th PE state prior to that next instruction being executed.

Note that this doesn't forbid the PE from speculating the MSR and other
subsequent instructions; it just has to maintain program order (so later
instructions can't affect earlier instructions), and must be able to
discard anything that was speculated past taking an exception.

> Is ordering ensured between those? Surely the watchpoint triggers on
> completion of the load and that wouldn't stall the PE from doing the
> MSR(s)?

Hopefully the above covers these concerns?

> 
> >     (b) The LDR at 0x010 *might* trigger the matchpoint.
> >     (c) The LDR at 0x018 *must* trigger the watchpoint.
> >
> > For C code, we can enforce this order with barrier(), e.g.
> >
> >         val = *addr;
> >         barrier();
> >         write_sysreg(addr, DBGWVR<n>_EL1);
> >         write_sysreg(configure_and_enable, DBGWCR<n>_EL1);
> >         isb();
> >
> > ... where the compiler cannot re-order the memory access (or
> > write_sysreg(), or isb()) across the barrier(), and as isb() has a
> > memory clobber, the same is true for isb().
> >
> > Likewise, for the inverse sequence:
> >
> >     // Initially:
> >     // - MDSCR, MDCR, DAIF.D permit debug exceptions at CurrentEL
> >     // - Watchpoint configured and enabled for <addr>
> >
> >     0x100:  LDR <val>, [<addr>]
> >     0x104:  MSR DBGWCR<n>_EL1, <disable>
> >     0x108:  LDR <val>, [<addr>]
> >     0x110:  ISB
> >     0x114:  LDR <val>, [<addr>]
> >
> > ... we know:
> >
> >     (a) The LDR at 0x100 *must* trigger the watchpoint.
> >     (b) The LDR at 0x108 *might* trigger the watchpoint.
> >     (c) The LDR at 0x114 *cannot* trigger the watchpoint.
> >
> > > Any guidance on the flavor of dsb here? (And is there any guarantee
> > > that the access is visible to the watchpoint h/w after a dsb
> > > completes?)
> >
> > Hopefully the above was sufficient?
> >
> > As mentioned above, I think we have a latent issue where we can take a
> > breakpoint or watchpoint under arch_uninstall_hw_breakpoint(), where we
> > have:
> >
> >     arch_uninstall_hw_breakpoint(bp) {
> >         ...
> >         hw_breakpoint_control(bp, HW_BREAKPOINT_UNINSTALL) {
> >             ...
> >             hw_breakpoint_slot_setup(slots, max_slots, bp, HW_BREAKPOINT_UNINSTALL) {
> >                  ...
> >                  *slot = NULL;
> >                  ...
> >             }
> >             ...
> >             write_wb_reg(ctrl_reg, i, 0) {
> >                 ...
> >                 write_sysreg(0, ...);
> >                 isb();
> >                 ...
> >             }
> >         }
> >     }
> >
> > The HW breakpoint/watchpoint associated with 'bp' could be triggered
> > between setting '*slot' to NULL and the ISB. If that happens, then
> > do_breakpoint() won't find 'bp', and will return *without* disabling the
> > HW breakpoint or attempting to step.
> >
> > If that first exception was taken *before* the MSR in write_sysreg(),
> > then nothing has changed, and the breakpoint/watchpoint will then be
> > taken again ad infinitum.
> >
> > If that first exception was taken *after* the MSR in write_sysreg(), the
> > context synchronization provided by exception entry/return will prevent
> > it from being taken again.
> >
> > Building v6.19 and testing (with pseudo-NMI enabled):
> >
> > | #  grep write_wb_reg /proc/kallsyms
> > | ffff80008004b980 t write_wb_reg
> > | # ./perf-6.19 stat -a -C 1 -e 'mem:0xffff80008004b980/4:xk' true
> 
> I'll give it a try with v4, but that should be prevented with my
> changes to exclude kprobe regions.

That'll work for breakpoints specifically, but not for watchpoints, and
I think for that we either have to dynamically disable
watchpoint/breakpoint exceptions (e.g. via DAIF.D), or write the code to
be race-aware. I strongly suspect that the latter will be simpler.

I think we can solve that with some wider cleanup, e.g. having
arch_uninstall_hw_breakpoint() disable the breakpoint/watchpoint
*before* setting its slot to NULL, but we'll need to take some care
(e.g. to save/restore MDSELR).

I strongly suspect that we can defer implementing support for EMBWE
until we've done a more general cleanup, but I'll need to go do some
reading first.

Mark.

