Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2742D6AAF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 17:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzYj00Q4GRg0KJ+G7UmxE5+0Nnj4CIWoVV9uWzVVyTs=; b=3q/8/KJmj3h0devEhIQWxXyGzq
	4UVyzWDuu5UwaDclPorqZWqzD9QDTOsfTdNeAn/BRZaM10R58v2aHsvmaKioYy+OE7WP/6Gihyl5i
	cfK9MqgFwIJekWu9t4M7HozYSq+Rec6AKxxjLdhQfHEJLd2+SlcK6lxpaf49lNTURPKH093/h2Aus
	wsyF5aYEX4t7MPVu2JdIZ9qE+W6rX5HHG57IvzkWFoiO3pLthzXrRH1XllFyYUZL6tEfBw56DiR12
	hhljyPbRWvx5ItYar4K8rkB3NJvM7cpcvnc3hadO4YRyH3ozwm9EhP2X+Pc4MYuDrqhfkdbHPE3FQ
	vk55AUpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8M8P-00000000cBg-1s2K;
	Thu, 02 Apr 2026 17:47:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8M8N-00000000cBQ-10qM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 17:47:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5969F60008
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Apr 2026 17:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11384C19424
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Apr 2026 17:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775152030;
	bh=881R4R92P1YKFSJtM/lRHoVXtD6ori3wDkWyVqvOe4A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VCUX/blTB+zfXJN80c5azMk3ezsyQg1oiJdwtSIj4YtiXSDwGublDr/OaE+VHi5NO
	 4xS8oFOMhg2OFoBaD5ZWj46vnq/mLR2K3mc+IsTJTAlLBh+CDuzEDUrO8C8OlkZxPE
	 1NQW9W3LKf6AoE0KrWsJv7l0/MPBTWgVH9ZjFn977tfhm7W9PppGDWDdih5yFC8NBC
	 HFiOIG2puoIOIR0MMHbc8+OdQCCHKyznWRdElOONwI2XbixKusNxiZtOMzjYm/ecjP
	 FnGmUqyPONho7aV8gbL7HUl2XiPYWhgbPuGVmIsi6lrAvY2tXqg8QBt5+vAs3bvUHL
	 U2uUJWShdcyqA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso1583711a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 10:47:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3TTQnqULKMkwCiKQIcap+HzGconzUESKvzCN+UfB8mNYjtSLTGxBF/XRPlqhHvedUo7uMv2rUCDBwpXrFUtNs@lists.infradead.org
X-Gm-Message-State: AOJu0YwkZd+IhYpWapcIHaTmNcBWImQ57T4kIvGtoodZau5AwAKiKTrz
	LaCWtIgO8pR8l+lNGIOShssd8YEFfJb8TEFzIkrj/slPnuZezaAQmFY1uxgI1J/rNsH99gp/yY+
	2VY2I4CZ+vQgwdzEwgv0fuZpcpjeLxw==
X-Received: by 2002:a05:6402:438b:b0:66b:b5fd:70a7 with SMTP id
 4fb4d7f45d1cf-66db0cfbfadmr4618096a12.24.1775152028592; Thu, 02 Apr 2026
 10:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <20241216040831.2448257-1-anshuman.khandual@arm.com>
 <20241216040831.2448257-8-anshuman.khandual@arm.com> <Z2AH1SN5CipWkkE4@J2N7QTR9R3>
 <20260331225800.GA2082670-robh@kernel.org> <ac5G8e4zWTdicDBs@J2N7QTR9R3>
In-Reply-To: <ac5G8e4zWTdicDBs@J2N7QTR9R3>
From: Rob Herring <robh@kernel.org>
Date: Thu, 2 Apr 2026 12:46:56 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLEBJ7Ok9TngWTqjaWY_LJCPtronv8=gnm=J0FymDKLCg@mail.gmail.com>
X-Gm-Features: AQROBzDfUlPxcSU1xRiDudAFdbQWItNPfrHcFJc4JDFpHAjOA-0L5BDRaj_XxD0
Message-ID: <CAL_JsqLEBJ7Ok9TngWTqjaWY_LJCPtronv8=gnm=J0FymDKLCg@mail.gmail.com>
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

On Thu, Apr 2, 2026 at 5:37=E2=80=AFAM Mark Rutland <mark.rutland@arm.com> =
wrote:
>
> On Tue, Mar 31, 2026 at 05:58:00PM -0500, Rob Herring wrote:
> > On Mon, Dec 16, 2024 at 10:58:29AM +0000, Mark Rutland wrote:
> > > On Mon, Dec 16, 2024 at 09:38:31AM +0530, Anshuman Khandual wrote:
> > > > Currently there can be maximum 16 breakpoints, and 16 watchpoints a=
vailable
> > > > on a given platform - as detected from ID_AA64DFR0_EL1.[BRPs|WRPs] =
register
> > > > fields. But these breakpoint, and watchpoints can be extended furth=
er up to
> > > > 64 via a new arch feature FEAT_Debugv8p9.
> > > >
> > > > This first enables banked access for the breakpoint and watchpoint =
register
> > > > set via MDSELR_EL1, extended exceptions via MDSCR_EL1.EMBWE and det=
ermining
> > > > available breakpoints and watchpoints in the platform from ID_AA64D=
FR1_EL1,
> > > > when FEAT_Debugv8p9 is enabled.
> > >
> > > [...]
> >
> > Well, this series has landed on my plate...
>
> Sorry about that; thanks for taking a look!
>
> > > > +static u64 read_wb_reg(int reg, int n)
> > > > +{
> > > > + unsigned long flags;
> > > > + u64 val;
> > > > +
> > > > + if (!is_debug_v8p9_enabled())
> > > > +         return __read_wb_reg(reg, n);
> > > > +
> > > > + /*
> > > > +  * Bank selection in MDSELR_EL1, followed by an indexed read from
> > > > +  * breakpoint (or watchpoint) registers cannot be interrupted, as
> > > > +  * that might cause misread from the wrong targets instead. Hence
> > > > +  * this requires mutual exclusion.
> > > > +  */
> > > > + local_irq_save(flags);
> > > > + write_sysreg_s(SYS_FIELD_PREP(MDSELR_EL1, BANK, n / MAX_PER_BANK)=
, SYS_MDSELR_EL1);
> > > > + isb();
> > > > + val =3D __read_wb_reg(reg, n % MAX_PER_BANK);
> > > > + local_irq_restore(flags);
> > > > + return val;
> > > > +}
> > > >  NOKPROBE_SYMBOL(read_wb_reg);
> > >
> > > I don't believe that disabling interrupts here is sufficient. On the
> > > last version I asked about the case of racing with a watchpoint handl=
er:
> > >
> > > | For example, what prevents watchpoint_handler() from firing in the
> > > | middle of arch_install_hw_breakpoint() or
> > > | arch_uninstall_hw_breakpoint()?
> > >
> > > ... and disabling interrupts cannot prevent that, because
> > > local_irq_{save,restore}() do not affect the behaviour of watchpoints=
 or
> > > breakpoints.
> >
> > I think the answer is we just need NOKPROBE_SYMBOL() annotation on
> > hw_breakpoint_control() (what arch_install_hw_breakpoint() and
> > arch_uninstall_hw_breakpoint() wrap).
>
> Ok. I couldn'y spot where we prevent placing HW breakpoints on
> NOKPROBE_SYMBOL() functions, but if we do enforce that, something like
> that sounds ok.

Uh, actually you are right. I think we need the equivalent to this in
arch_build_bp_info():

    case HW_BREAKPOINT_X:
        /*
         * We don't allow kernel breakpoints in places that are not
         * acceptable for kprobes.  On non-kprobes kernels, we don't
         * allow kernel breakpoints at all.
         */
        if (attr->bp_addr >=3D TASK_SIZE_MAX) {
            if (within_kprobe_blacklist(attr->bp_addr))
                return -EINVAL;
        }

The 2nd sentence is enforced by within_kprobe_blacklist() returning
true for !CONFIG_KPROBES. Seems like a reasonable restriction, but it
would be a change. Unfortunately, we can't move this to non-arch code
as some arches support h/w BP without supporting kprobes.

>
> I suspect we'd need to make that noinstr to also prevent ftrace
> instrumentation, unless ftrace also inhibits itself for
> NOKPROBE_SYMBOL() functions.

If we use NOKPROBE_SYMBOL() along with nokprobe_inline (which just
forces inlining functions), then ftrace could only be used on the
entry or exit of
arch_install_hw_breakpoint()/arch_uninstall_hw_breakpoint() which I
think would be fine.

>
> > We also need that on __read_wb_reg
> > and __read_wb_reg though I would think those are folded into the callin=
g
> > functions by the compiler. Interestly, the x86 code doesn't use the
> > annotation at all.
>
> IIUC, it looks like they *can* take debug NMIs during
> arch_install_hw_breakpoint() and arch_uninstall_hw_breakpoint(), which
> is why they have ordering constraints for modifying the percpu 'cpu_dr7'
> variable, and their actual DR7 register (which IIUC has the enable
> controls for each HW breakpoint).
>
> That said, the use of 'bp_per_reg' looks suspect given their
> arch_install_hw_breakpoint() and arch_uninstall_hw_breakpoint() modify
> that non-atomically.

You don't believe the comment saying counter->ctx->lock is held?

> We could consider allowing breakpoints on those functions, but I'm not
> sure whether that's possible for us, and (as noted below) it might be
> better to transiently disable breakpoints/watchpoints.

Even if possible, is it all that useful? Easier to just disable than
reason whether it would work or not IMO.


> IIRC on x86, breakpoint exceptions are taken *after* execution of the
> instruction that triggered them, so the handler doesn't have to
> manipulate single-step, and can safely ignore a breakpoint exception
> without the risk of getting stuck taking the breakpoint repeatedly.
>
> > I initially thought the IRQ disabling is also still needed as IRQ
> > handlers can trigger breakpoints. However, the x86 version of
> > arch_install_hw_breakpoint() contains a lockdep_assert_irqs_disabled(),
> > so it seems for that case interrupts are already disabled. And in debug
> > exceptions, we disable interrupts. So I think the interrupt disabling
> > can be dropped.
>
> I'd expect that the core perf code disables interrupts before calling
> arch_install_hw_breakpoint() or arch_uninstall_hw_breakpoint(), and this
> would be necessary for perf to serialise against IPIs that manipulate
> the perf_event_context.
>
> I agree that when we actually take the breakpoint, we'll mask all
> exceptions, and so it's not necessary to mask IRQs there.
>
> So a first step is probably to add that lockdep assert.
>
> > > Please can you try to answer the questions I asked last time, i.e.
> > >
> > > | What prevents a race with an exception handler? e.g.
> > > |
> > > | * Does the structure of the code prevent that somehow?
> >
> > If you can't set a breakpoint/watchpoint in NOKPROBE_SYMBOL() annotated
> > code, you can't race.
>
> As above, I agree (with caveats), but I couldn't spot where this is
> enforced.
>
> > However, there's no such annotation for data. It looks like the kernel
> > policy is "don't do that" or disable all breakpoints/watchpoints.
>
> If we have to transiently disable watchpoints/breakpoints when
> manipulating the relevant HW registers, that sounds fine to me.

For wp/bp_on_reg, the ordering is 'data access, h/w accesses'. I think
we just need a barrier to enforce that ordering so the data access
(and then watchpoint) don't trigger in the middle of the h/w accesses.
Any guidance on the flavor of dsb here? (And is there any guarantee
that the access is visible to the watchpoint h/w after a dsb
completes?)

Rob

