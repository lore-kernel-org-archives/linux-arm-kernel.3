Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E0CD111A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 22:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYeM/H7hoSwQ1s8BIcONkWDUv2mIXaREYQrutx2cl7c=; b=RWP+h82/Q4RYZKblgqFUEpTmVR
	QqhspGOTrkduT8XDSrPGF3GWWysD+UYloJF0dz/Y+J6BXuK5/iqJOhOC0PIndlSxt91982hiLaFTB
	iAVgqkjym5fYChU9jtL6qn1H1Vg3GtEqTvUQoBpcXVvlnM6G5LkMRBRi6R5sKoX73PXu/cGpPOeb3
	+HXYsYPodtMk1o9tihIchnu/HkjkVanuwffgNr0gV+dgcW6UIX1FAoCOKDr0mn2wsOpLLwmoph232
	z2UMMDQ3pG4hpu4eYhcC/8QxjLc9FLII3L4VounEIq6Wu3pXpF2LCqKn5gXy4AAdHjDIPUQLt1UTT
	DFuPhAuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOOTQ-0000000FjnR-24xz;
	Wed, 26 Nov 2025 22:58:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOOTP-0000000FjnL-1PjW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 22:58:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BF4760215
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 22:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F47C116D0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 22:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764197934;
	bh=L813tODdIN+ImpneORlFGowuRI/q2D8Ym10x3oV2La4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vAIWn0U2p7v55HMWL/0p3Hamw5T6RHqlorJnXy6S2Kr7Cvwe2923lkqpVTjGQc7Cc
	 KIOYUr4lIIQZvS3NJ6J69VNA371YKP0/UyCh2oCmzD8qJv0St1dCQsDlxRizlIKajQ
	 48mHUdluaTBcAcSYO9zv6O1srInlzd3D3cMsl4PYtit19vH2fCFKl3l5Rcx04+afvN
	 6gGJRPWRookaomk1ns5TI3xXlUDCzuiTUfKWYUbVFbZ9/JEm5XYft1XEHVOIy5Fou9
	 BOqpcJVM0ehN3BuOqaRpVzofvl2Qd038LvoCUduxxyTQyLiY5aaa8ITiLFjIofKY7o
	 cW47uXcbhUXMw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5958232f806so329362e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 14:58:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+RyJK+RGpiIGfXxEP5Y5TY0rqhMMwQO9ahsgT0zhQtWfw9MPUSF4YzvKR5pdGF5m2V1vFJ1cgTS5DG3MYrCWm@lists.infradead.org
X-Gm-Message-State: AOJu0YzcvuYpAuZ9KAMweQUibstKIRc1YOaZA1fVxXL2jN5puTlj0tmy
	tR7tshsadxGUcddbXfV/fdbxOYaku7d2S9zTeEnJsxZHG/FAly05ikmPk8wXXA0Idh28tNlh6rm
	ukUryMGhitXWn2YfW+3wIGNY40cJnBSs=
X-Google-Smtp-Source: AGHT+IGLdlWOWJULGEin2lIfqefxm9QpDU7p9Yr+3YjaGMHHTSXy0CPUSapsMjX4emcGY/VefStPPuvOCU0JQ7TJGC4=
X-Received: by 2002:a05:6512:308d:b0:594:2cdf:1941 with SMTP id
 2adb3069b0e04-596a3ed702amr6770855e87.31.1764197932426; Wed, 26 Nov 2025
 14:58:52 -0800 (PST)
MIME-Version: 1.0
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com> <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
 <aSRtaVjfNc11EtKg@willie-the-truck> <B696956E-579E-412E-B774-AAADCFA4B31C@kernel.org>
 <ecc11ec7-ba00-41f1-8a2a-8f3a83c9ffd9@arm.com> <202511241250.EB2ADED@keescook>
 <d9b18b84-22ab-4bc8-b55f-804e0607cec6@arm.com>
In-Reply-To: <d9b18b84-22ab-4bc8-b55f-804e0607cec6@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 26 Nov 2025 23:58:40 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG4ELUdxGMp0+tNiV+7ygfHbe-u_pGPMTVj6UNdzQ+sDQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnItg4JNA7SlvAXZ9P22v_iE-okvlUGOC4Oq9LI808wEwFF_tBC0b75U1Y
Message-ID: <CAMj1kXG4ELUdxGMp0+tNiV+7ygfHbe-u_pGPMTVj6UNdzQ+sDQ@mail.gmail.com>
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Kees Cook <kees@kernel.org>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jeremy Linton <jeremy.linton@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 25 Nov 2025 at 12:15, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 24/11/2025 20:51, Kees Cook wrote:
> > On Mon, Nov 24, 2025 at 05:50:14PM +0000, Ryan Roberts wrote:
> >> On 24/11/2025 17:11, Kees Cook wrote:
> >>>
> >>>
> >>> On November 24, 2025 6:36:25 AM PST, Will Deacon <will@kernel.org> wrote:
> >>>> On Mon, Nov 17, 2025 at 11:31:22AM +0000, Ryan Roberts wrote:
> >>>>> On 17/11/2025 11:30, Ryan Roberts wrote:
> >>>>>> Could this give us a middle ground between strong-crng and
> >>>>>> weak-timestamp-counter? Perhaps the main issue is that we need to store the
> >>>>>> secret key for a long period?
> >>>>>>
> >>>>>>
> >>>>>> Anyway, I plan to work up a series with the bugfixes and performance
> >>>>>> improvements. I'll add the siphash approach as an experimental addition and get
> >>>>>> some more detailed numbers for all the options. But wanted to raise it all here
> >>>>>> first to get any early feedback.
> >>>>
> >>>> FWIW, I share Mark's concerns about using a counter for this. Given that
> >>>> the feature currently appears to be both slow _and_ broken I'd vote for
> >>>> either removing it or switching over to per-thread offsets as a first
> >>>> step.
> >>>
> >>> That it has potential weaknesses doesn't mean it should be entirely removed.
> >>>
> >>>> We already have a per-task stack canary with
> >>>> CONFIG_STACKPROTECTOR_PER_TASK so I don't understand the reluctance to
> >>>> do something similar here.
> >>>
> >>> That's not a reasonable comparison: the stack canary cannot change arbitrarily for a task or it would immediately crash on a function return. :)
> >>>
> >>>> Speeding up the crypto feels like something that could happen separately.
> >>>
> >>> Sure. But let's see what Ryan's patches look like. The suggested changes sound good to me.
> >>
> >> Just to say I haven't forgotten about this; I ended up having to switch to
> >> something more urgent. Hoping to get back to it later this week. I don't think
> >> this is an urgent issue, so hopefully folks are ok waiting.
> >>
> >> I propose to post whatever I end up with then we can all disscuss from there.
> >> But the rough shape so far:
> >>
> >> Fixes:
> >>  - Remove choose_random_kstack_offset()
> >>  - arch passes random into add_random_kstack_offset() (fixes migration bypass)
> >>  - Move add_random_kstack_offset() to el0_svc()/el0_svc_compat() (before
> >>    enabling interrupts) to fix non-preemption requirement (arm64)
> >
> > I thought we'd keep choose_random_kstack_offset() and just move
> > everything into a per-task location? (And for arm64 only)
>
> Err... I thought you were the one arguing against per-task state? I'm not really
> keen on having arm64 do a completely different thing to everyone else; It seems
> reasonable to me that we only need to (continue to) abstract the random source
> per-arch and the rest should remain common?
>
> Per my previous mails, I'm not really sure what choose_random_kstack_offset() is
> giving us in practice. Why not simplify?
>

It seems to me that arm64 inherited a lot of complexity from other
architectures that rely on a counter. AIUI, the 'non-preemption
requirement' and the 'migration bypass' issues are both a result of
the fact that the syscall duration is relied upon to provide more
pseudo-randomness, which is recorded in a per-CPU counter when the
syscall completes and carried over to the next invocation. (I don't
really buy the idea that having the next offset in memory for a
shorter time buys us anything in terms of robustness tbh)

I have some patches that make get_random_uXX()'s fast path lockless
that I will send out shortly (assuming no hate mail from the bots in
the mean time), which should make it suitable for general use as the
entropy source for kstack randomization on all architectures, modulo
the tail latency issue, but I'm not sure I understand why that is a
problem to begin with if it occurs sufficiently rarely. Is that a
PREEMPT_RT issue? Would it be better if the refill of the per-CPU
batched entropy buffers was relegated to some kind of kthread so it
can be scheduled independently? (Those buffers are all the same size
so we could easily keep a few hot spares)

TL;DR I agree with Ryan but I'd like to fix it across the board, i.e.,
get rid of the per-CPU variable entirely and all the dodgy uses of
counters.

