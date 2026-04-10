Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94044F45A08
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 19:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gjcWWPQhSmbrmnsR/lubaglMagOfX9bvyQffKbcT2I=; b=pK79XjjW2+JjFTTAqtXecotavH
	mMuIUO/EptKJTPZwahIFvov6223TyqA06Xw1j/nWpmmSLz2ZPkLAKUMnE2nE1u3gQHHZrvRvJ513p
	5pFPgM1WGqpSiMom2X5tvdyJvXn6qf0OtbOn5DQcKhm7n4RGqwdsVSqIuEhLdtHTc7eJbsbXSNtNF
	7erY8rInFh/h0HCJaeXfZe7ZasQjbhDqqh9R13cPEJVcw8iwY7lgXxfhN/pFWvZzF63ouP42a3iyY
	9EkrS6ySEEcXNY5dNiA67BvUlT6xZtynq5O34CPx1cyBoa+4wnzxN6Teh+b+yU0rFFjBZ2SP1sBx6
	9S6PyOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBHxc-0000000CkAK-1jex;
	Fri, 10 Apr 2026 19:56:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBHxb-0000000CkAE-2J7o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 19:56:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 597CA60181
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 19:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B57C2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 19:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775850970;
	bh=J0+sK84ErorCVePEnHFFFb37BgkU1ZRXvWCpuLHsgvM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dfZRyaxvxtlr4pV773zr0WY9t88NUP8JBvsg52mpt6qHCoyagcOIMUA8X6Sgaxf7F
	 BU4xA1UJwP4vZ+po0YQr36fJmaLk812T33on+p0ciIq4Ebm1vB6cMDyHijDh16EpHW
	 F+qifGlS+PsafIhiOMZdH+TJbqYJL8MqQEERsYiIG/Q//ZVDhwdoCIMI1xZRST2nT7
	 VxXC+9u0w8I602gmpSuyqb2vYVqGYKAIkf0qXc06ygl6d8C4lSly4Xh+8jxroHhi+f
	 ti9V6yKODlTpMqf9j5D2OBSbvKA+qH43yen1uJwfemq+ibhBT/0zjCyaYCofDMxbru
	 idNqLBJtYK2Rg==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66fb5f2183fso4301912a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 12:56:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVArZ53bjuAV4y8GX+DzsiZhDsq1gjmXCy+378POvzsmt4HGZbRd2vDGECkkZb5LCOtod+RjBjhRUruc2wvOv0c@lists.infradead.org
X-Gm-Message-State: AOJu0YyplsymRCiiIdzmH7c6srridUiZ4Zg54ma1taYiPBgbwAAxEEgk
	/UoMCwsft7uJmN0sTx1Ip6RpHKetBeM5bAK0cfa6/GUhTG7SW0hGyAnzzb5JIB1vDKUDYP+QJ/d
	+vCUt40xrhLLOpDdWr8xqIH5IGNriag==
X-Received: by 2002:a05:6402:a21b:10b0:670:8b30:a8a5 with SMTP id
 4fb4d7f45d1cf-6708b30a916mr1683630a12.17.1775850968328; Fri, 10 Apr 2026
 12:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20241216040831.2448257-1-anshuman.khandual@arm.com>
 <20241216040831.2448257-8-anshuman.khandual@arm.com> <Z2AH1SN5CipWkkE4@J2N7QTR9R3>
 <20260331225800.GA2082670-robh@kernel.org> <ac5G8e4zWTdicDBs@J2N7QTR9R3>
 <CAL_JsqLEBJ7Ok9TngWTqjaWY_LJCPtronv8=gnm=J0FymDKLCg@mail.gmail.com> <adeE4MD0RgapI8aL@J2N7QTR9R3>
In-Reply-To: <adeE4MD0RgapI8aL@J2N7QTR9R3>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 Apr 2026 14:55:55 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+=3CKrUDcdgSHFaSGgvnh9ZxTGEBTRLkwrYgzQ=frOdg@mail.gmail.com>
X-Gm-Features: AQROBzA5KLZDDNcMFHPCHSCcvUxzxdbsbT_tKeErp7FMHwVLiJT0a7YPMt7UER0
Message-ID: <CAL_Jsq+=3CKrUDcdgSHFaSGgvnh9ZxTGEBTRLkwrYgzQ=frOdg@mail.gmail.com>
Subject: Re: [PATCH V3 7/7] arm64/hw_breakpoint: Enable FEAT_Debugv8p9
To: Mark Rutland <mark.rutland@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Apr 9, 2026 at 5:52=E2=80=AFAM Mark Rutland <mark.rutland@arm.com> =
wrote:
>
> On Thu, Apr 02, 2026 at 12:46:56PM -0500, Rob Herring wrote:
> > On Thu, Apr 2, 2026 at 5:37=E2=80=AFAM Mark Rutland <mark.rutland@arm.c=
om> wrote:
> > >
> > > On Tue, Mar 31, 2026 at 05:58:00PM -0500, Rob Herring wrote:
> > > > On Mon, Dec 16, 2024 at 10:58:29AM +0000, Mark Rutland wrote:
> > > > > On Mon, Dec 16, 2024 at 09:38:31AM +0530, Anshuman Khandual wrote=
:
> > > That said, the use of 'bp_per_reg' looks suspect given their
> > > arch_install_hw_breakpoint() and arch_uninstall_hw_breakpoint() modif=
y
> > > that non-atomically.
> >
> > You don't believe the comment saying counter->ctx->lock is held?
>
> Sorry, my concern here was that hw_breakpoint_handler() (which cannot
> hold the lock) consumes bp_per_reg[], and could race with the non-atomic
> modification in arch_install_hw_breakpoint() or
> arch_uninstall_hw_breakpoint().
>
> I've sent a more elaborate mail to x86 folk, with that and another issue
> caused by taking a breakpoint under arch_uninstall_hw_breakpoint():
>
>   https://lore.kernel.org/lkml/adZWmPW8S9Y2pwkv@J2N7QTR9R3.cambridge.arm.=
com/
>
> I think we have a similar latent issue where we can take an breakpoint
> or watchpoint ad infinitum, described in more detail at the end of this
> mail.
>
> [...]
>
> > > > > | What prevents a race with an exception handler? e.g.
> > > > > |
> > > > > | * Does the structure of the code prevent that somehow?
> > > >
> > > > If you can't set a breakpoint/watchpoint in NOKPROBE_SYMBOL() annot=
ated
> > > > code, you can't race.
> > >
> > > As above, I agree (with caveats), but I couldn't spot where this is
> > > enforced.
> > >
> > > > However, there's no such annotation for data. It looks like the ker=
nel
> > > > policy is "don't do that" or disable all breakpoints/watchpoints.
> > >
> > > If we have to transiently disable watchpoints/breakpoints when
> > > manipulating the relevant HW registers, that sounds fine to me.
> >
> > For wp/bp_on_reg, the ordering is 'data access, h/w accesses'. I think
> > we just need a barrier to enforce that ordering so the data access
> > (and then watchpoint) don't trigger in the middle of the h/w accesses.
>
> I assume that by 'h/w accesses' you mean MSRs to the system registers
> controlling breakpoints/watchpoints. Ordering-wise, I don't believe
> memory barriers are necessary here (explain in more detail below).
> However, I also think there's a latent issue here that might bite us
> with the new banking, described at the end of this mail.
>
> Both breakpoint and watchpoint exceptions are synchronous, meanning that
> they can only be taken from the specific instruction that triggered
> them.  However, updates to the watchpoint control registers *do* need a
> context synchronization event before they're guarnateed to take effect.
>
> For a sequence:
>
>     // Initially:
>     // - MDSCR, MDCR, DAIF.D permit debug exceptions at CurrentEL
>     // - No watchpoints enabled
>
>     0x000:  LDR <val>, [<addr>]
>     0x004:  MSR DBGWVR<n>_EL1, <addr>
>     0x008:  MSR DBGWCR<n>_EL1, <configure_and_enable>
>     0x010:  LDR <val>, [<addr>]
>     0x014:  ISB
>     0x018:  LDR <val>, [<addr>]
>
> ... we know:
>
>     (a) The LDR at 0x000 *cannot* trigger the watchpoint.

Why not? Can't the LDR complete after the MSR? Is ordering ensured
between those? Surely the watchpoint triggers on completion of the
load and that wouldn't stall the PE from doing the MSR(s)?

>     (b) The LDR at 0x010 *might* trigger the matchpoint.
>     (c) The LDR at 0x018 *must* trigger the watchpoint.
>
> For C code, we can enforce this order with barrier(), e.g.
>
>         val =3D *addr;
>         barrier();
>         write_sysreg(addr, DBGWVR<n>_EL1);
>         write_sysreg(configure_and_enable, DBGWCR<n>_EL1);
>         isb();
>
> ... where the compiler cannot re-order the memory access (or
> write_sysreg(), or isb()) across the barrier(), and as isb() has a
> memory clobber, the same is true for isb().
>
> Likewise, for the inverse sequence:
>
>     // Initially:
>     // - MDSCR, MDCR, DAIF.D permit debug exceptions at CurrentEL
>     // - Watchpoint configured and enabled for <addr>
>
>     0x100:  LDR <val>, [<addr>]
>     0x104:  MSR DBGWCR<n>_EL1, <disable>
>     0x108:  LDR <val>, [<addr>]
>     0x110:  ISB
>     0x114:  LDR <val>, [<addr>]
>
> ... we know:
>
>     (a) The LDR at 0x100 *must* trigger the watchpoint.
>     (b) The LDR at 0x108 *might* trigger the watchpoint.
>     (c) The LDR at 0x114 *cannot* trigger the watchpoint.
>
> > Any guidance on the flavor of dsb here? (And is there any guarantee
> > that the access is visible to the watchpoint h/w after a dsb
> > completes?)
>
> Hopefully the above was sufficient?
>
> As mentioned above, I think we have a latent issue where we can take a
> breakpoint or watchpoint under arch_uninstall_hw_breakpoint(), where we
> have:
>
>     arch_uninstall_hw_breakpoint(bp) {
>         ...
>         hw_breakpoint_control(bp, HW_BREAKPOINT_UNINSTALL) {
>             ...
>             hw_breakpoint_slot_setup(slots, max_slots, bp, HW_BREAKPOINT_=
UNINSTALL) {
>                  ...
>                  *slot =3D NULL;
>                  ...
>             }
>             ...
>             write_wb_reg(ctrl_reg, i, 0) {
>                 ...
>                 write_sysreg(0, ...);
>                 isb();
>                 ...
>             }
>         }
>     }
>
> The HW breakpoint/watchpoint associated with 'bp' could be triggered
> between setting '*slot' to NULL and the ISB. If that happens, then
> do_breakpoint() won't find 'bp', and will return *without* disabling the
> HW breakpoint or attempting to step.
>
> If that first exception was taken *before* the MSR in write_sysreg(),
> then nothing has changed, and the breakpoint/watchpoint will then be
> taken again ad infinitum.
>
> If that first exception was taken *after* the MSR in write_sysreg(), the
> context synchronization provided by exception entry/return will prevent
> it from being taken again.
>
> Building v6.19 and testing (with pseudo-NMI enabled):
>
> | #  grep write_wb_reg /proc/kallsyms
> | ffff80008004b980 t write_wb_reg
> | # ./perf-6.19 stat -a -C 1 -e 'mem:0xffff80008004b980/4:xk' true

I'll give it a try with v4, but that should be prevented with my
changes to exclude kprobe regions.

Rob

