Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE593D767F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 18:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zifDQr8Gy9ICyc3p2ENuZG+aDhE1SHEQ39uTi6PmnYo=; b=sZMt6ZVphLMcnxyX57Jkp1CBsM
	tLfNPnxxohLTLW1ftxwL5t/MGtSCtAr+jarlaf/StfGsTmVrrvbPJ9jxrEQYEKWO552KEumIHOl4l
	ImlsOfw6zXS9gHkUBcjChh9hlGoCuhz43hQ/uR4V46quZaH4bGiod8RAGMQfcOTt5gUJb5iLrRcym
	psN9UjwzyAegxD9fcHfEuExz6zQ9wSYXszyKzXBPDwrzqYNv6hXUm64Q+NjMHRX3op1Y8b7jNqn3c
	9BFyTBKd1fZZtqhg8inV7peXjR7WgXfy4aqXcNsv7+h5VCyJGaflhTzfE9/WOIoFuXq4Xu/D4x8FG
	Z/uBDGJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Zhn-00000004TWB-300I;
	Thu, 31 Oct 2024 18:15:35 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Zdk-00000004Sta-2aAA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 18:11:26 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5ebc22e6362so605598eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730398283; x=1731003083; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zifDQr8Gy9ICyc3p2ENuZG+aDhE1SHEQ39uTi6PmnYo=;
        b=WpmKlEsjZCwGdcNaQcfRTkjzMSa13/vZiJQa6+0tKT336jACPuUtnZCXF2sPOAzeGU
         ux3JgSKz8BhoFW8poWXJy90VXXMEuTsfxtR1OrWvMYyaOwG3dB0NccqySBYQyKE8uIzc
         KXu3HnyLsL1RcoVAw0OQoqJoY0H4A1hGqjHP+/iezo1RG8FISle7yM9diXWS7kAmifld
         074jEjrY7j5XEjZuXjreS2L6Rfv0huOpdm+wF8BOsC1PuFsZmSt4AIRI/9hwc67A5ZLQ
         /cUtC3D7YkucA4iUIPfKGpCyJytCwBzWaVMXSzJGAqqxIzXoGf06Fnan8k9RILqwb2Sg
         2esQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730398283; x=1731003083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zifDQr8Gy9ICyc3p2ENuZG+aDhE1SHEQ39uTi6PmnYo=;
        b=s/+ojitHubia+RZXFOafth9ii55lSm7HFUJoi6SvXVECs5GLDQHfw3quZVWVSR3e/A
         5rau3YdQbhsideDuFPcD+VujXTdf4zNr+0MvZkdsoA6Ty11cjh+lLHehsJ0GRAPl+Y0E
         opXeoiAAmB71DHFnN0ZULl4ND8CeRxWaLZjtDNrq+b48HOFP+Lo3wadE2j/WdcrFNPHD
         l44b2JINv1CeHsUNKjvyB+gcLzM1tHGTsAIpqXKwv0vooksv5lZgNtvEoJVHyJsnUoga
         XklhLMaR4z5z1aBqkiR0jg6g3LeRk9rNJy1XR5Qft+OGixKu6mLb7RZzehruV4GI1JGr
         LGWw==
X-Forwarded-Encrypted: i=1; AJvYcCVqkoJtekt8/3HoE7gumJe8Uzv2nhEPKC8EQMqywV0Gdbx02vGKTDkptJ++6JJj11IjiL1HPYqQEpDgQ1gWoDoJ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgo5WVb7jXzsnFoe+H3TtNL6kP8vPfO4fwSx3vRJC9oNzgKfx1
	PonON2hIF8cGf4KeEaIAo0hFMXQ3mvA4SU8uQSjtm9cnDWdQ0T2PLq2AQHLYFGWHNzhwUmN5Feb
	rFBFg0jYRLEgAp/GAOpVmGFW0OJb+VjD2D8w2
X-Google-Smtp-Source: AGHT+IGCZUfA0nt9tbEFHktX/dCx4DkdYhEES5nQZ7wCYXRaHV6mv2O2BXeCcEfn6XydEqak20pVWKM5POqkaQsbpvU=
X-Received: by 2002:a05:6359:4115:b0:1c3:8d57:ea8b with SMTP id
 e5c5f4694b2df-1c5ee96bd85mr291907555d.16.1730398282240; Thu, 31 Oct 2024
 11:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20241021042218.746659-1-yuzhao@google.com> <20241021042218.746659-5-yuzhao@google.com>
 <868qug3yig.wl-maz@kernel.org> <CAOUHufabSWTZ+cBjXEDTRh61GeALL5b6uh0M76=2ninZP3KAzQ@mail.gmail.com>
 <8634ke3dn4.wl-maz@kernel.org>
In-Reply-To: <8634ke3dn4.wl-maz@kernel.org>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 31 Oct 2024 12:10:45 -0600
Message-ID: <CAOUHufZVDsfBVHUV6NjR82uWo602sT8X3sJ8t1Q_Qk2KJzi0mw@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] arm64: broadcast IPIs to pause remote CPUs
To: Marc Zyngier <maz@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_111124_687401_1CFE70A5 
X-CRM114-Status: GOOD (  72.00  )
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

On Tue, Oct 29, 2024 at 1:36=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Mon, 28 Oct 2024 22:11:52 +0000,
> Yu Zhao <yuzhao@google.com> wrote:
> >
> > On Tue, Oct 22, 2024 at 10:15=E2=80=AFAM Marc Zyngier <maz@kernel.org> =
wrote:
> > >
> > > On Mon, 21 Oct 2024 05:22:16 +0100,
> > > Yu Zhao <yuzhao@google.com> wrote:
> > > >
> > > > Broadcast pseudo-NMI IPIs to pause remote CPUs for a short period o=
f
> > > > time, and then reliably resume them when the local CPU exits critic=
al
> > > > sections that preclude the execution of remote CPUs.
> > > >
> > > > A typical example of such critical sections is BBM on kernel PTEs.
> > > > HugeTLB Vmemmap Optimization (HVO) on arm64 was disabled by
> > > > commit 060a2c92d1b6 ("arm64: mm: hugetlb: Disable
> > > > HUGETLB_PAGE_OPTIMIZE_VMEMMAP") due to the folllowing reason:
> > > >
> > > >   This is deemed UNPREDICTABLE by the Arm architecture without a
> > > >   break-before-make sequence (make the PTE invalid, TLBI, write the
> > > >   new valid PTE). However, such sequence is not possible since the
> > > >   vmemmap may be concurrently accessed by the kernel.
> > > >
> > > > Supporting BBM on kernel PTEs is one of the approaches that can mak=
e
> > > > HVO theoretically safe on arm64.
> > >
> > > Is the safety only theoretical? I would have expected that we'd use a=
n
> > > approach that is absolutely rock-solid.
> >
> > We've been trying to construct a repro against the original HVO
> > (missing BBM), but so far no success. Hopefully a repro does exist,
> > and then we'd be able to demonstrate the effectiveness of this series,
> > which is only theoretical at the moment.
>
> That wasn't my question.
>
> Just because your HW doesn't show you a failure mode doesn't mean the
> issue doesn't exist. Or that someone will eventually make use of the
> relaxed aspects of the architecture and turn the behaviour you are
> relying on into the perfect memory corruption  You absolutely cannot
> rely on an implementation-defined behaviour for this stuff.

I agree.

> Hence my question: is your current approach actually safe?

AFAIK, yes.

> In a
> non-theoretical manner?

We are confident enough to try it in our production, but it doesn't
mean it's bug free. It would take more eyeballs and soak time before
it can prove itself.

> > > > Note that it is still possible for the paused CPUs to perform
> > > > speculative translations. Such translations would cause spurious
> > > > kernel PFs, which should be properly handled by
> > > > is_spurious_el1_translation_fault().
> > >
> > > Speculative translation faults are never reported, that'd be a CPU
> > > bug.
> >
> > Right, I meant to say "speculative accesses that cause translations".
> >
> > > *Spurious* translation faults can be reported if the CPU doesn't
> > > implement FEAT_ETS2, for example, and that has to do with the orderin=
g
> > > of memory access wrt page-table walking for the purpose of translatio=
ns.
> >
> > Just want to make sure I fully understand: after the local CPU sends
> > TLBI (followed by DSB & ISB), FEAT_ETS2 would act like DSB & ISB on
> > remote CPUs when they perform the invalidation, and therefore
> > speculative accesses are ordered as well on remote CPUs.
>
> ETS2 has nothing to do with TLBI. It has to do with non-cacheable
> (translation, access and address size) faults, and whether an older
> update to a translation is visible to a younger memory access without
> extra synchronisation.

Is it correct to say that *without* ETS2, we also wouldn't see
spurious faults on the local CPU from the following BBM sequence?
  clear_pte(); dsb(); isb(); tlbi(); dsb(); isb(); set_valid_pte();
dsb(); isb(); ...

> It definitely has nothing to do with remote
> CPUs (and the idea of a remote ISB, while cute, doesn't exist).
>
> > Also I'm assuming IPIs on remote CPUs don't act like a full barrier,
> > and whatever they interrupt still can be speculatively executed even
> > though the IPI hander itself doesn't access the vmemmap area
> > undergoing BBM. Is this correct?
>
> Full barrier *for what*? An interrupt is a CSE, which has the effects
> described in the ARM ARM, but that's about it.

Sorry for the confusion. I hope the following could explain what's in my mi=
nd:

local cpu          remote cpu

send ipi
                   cse (=3D dsb(); isb() ?)
                   enters ipi handler
                   sets cpu_paused
sees cpu_paused
clear_pte()
dsb();
tlbi();
dsb(); isb()
set_valid_pte()
dsb();
sets cpu_resumed
                  sees cpu_resumed
                  No isb()
                  exits ipi handler

My current understanding is:
Because exception exit doesn't have the CSE and there are no isb()s
within the IPI handler running on the remote CPU, it's possible for
the remote CPU to speculative execute the next instruction before it
sees the valid PTE and trigger a spurious fault.

> > > > Signed-off-by: Yu Zhao <yuzhao@google.com>
> > > > ---
> > > >  arch/arm64/include/asm/smp.h |  3 ++
> > > >  arch/arm64/kernel/smp.c      | 92 ++++++++++++++++++++++++++++++++=
+---
> > > >  2 files changed, 88 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/=
smp.h
> > > > index 2510eec026f7..cffb0cfed961 100644
> > > > --- a/arch/arm64/include/asm/smp.h
> > > > +++ b/arch/arm64/include/asm/smp.h
> > > > @@ -133,6 +133,9 @@ bool cpus_are_stuck_in_kernel(void);
> > > >  extern void crash_smp_send_stop(void);
> > > >  extern bool smp_crash_stop_failed(void);
> > > >
> > > > +void pause_remote_cpus(void);
> > > > +void resume_remote_cpus(void);
> > > > +
> > > >  #endif /* ifndef __ASSEMBLY__ */
> > > >
> > > >  #endif /* ifndef __ASM_SMP_H */
> > > > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > > > index 3b3f6b56e733..68829c6de1b1 100644
> > > > --- a/arch/arm64/kernel/smp.c
> > > > +++ b/arch/arm64/kernel/smp.c
> > > > @@ -85,7 +85,12 @@ static int ipi_irq_base __ro_after_init;
> > > >  static int nr_ipi __ro_after_init =3D NR_IPI;
> > > >  static struct irq_desc *ipi_desc[MAX_IPI] __ro_after_init;
> > > >
> > > > -static bool crash_stop;
> > > > +enum {
> > > > +     SEND_STOP =3D BIT(0),
> > > > +     CRASH_STOP =3D BIT(1),
> > > > +};
> > > > +
> > > > +static unsigned long stop_in_progress;
> > > >
> > > >  static void ipi_setup(int cpu);
> > > >
> > > > @@ -917,6 +922,79 @@ static void __noreturn ipi_cpu_crash_stop(unsi=
gned int cpu, struct pt_regs *regs
> > > >  #endif
> > > >  }
> > > >
> > > > +static DEFINE_SPINLOCK(cpu_pause_lock);
> > >
> > > PREEMPT_RT will turn this into a sleeping lock. Is it safe to sleep a=
s
> > > you are dealing with kernel mappings?
> >
> > Right, it should be a raw spinlock -- the caller disabled preemption,
> > which as you said is required when dealing with the kernel mappings.
> >
> > > > +static cpumask_t paused_cpus;
> > > > +static cpumask_t resumed_cpus;
> > > > +
> > > > +static void pause_local_cpu(void)
> > > > +{
> > > > +     int cpu =3D smp_processor_id();
> > > > +
> > > > +     cpumask_clear_cpu(cpu, &resumed_cpus);
> > > > +     /*
> > > > +      * Paired with pause_remote_cpus() to confirm that this CPU n=
ot only
> > > > +      * will be paused but also can be reliably resumed.
> > > > +      */
> > > > +     smp_wmb();
> > > > +     cpumask_set_cpu(cpu, &paused_cpus);
> > > > +     /* paused_cpus must be set before waiting on resumed_cpus. */
> > > > +     barrier();
> > >
> > > I'm not sure what this is trying to enforce. Yes, the compiler won't
> > > reorder the set and the test.
> >
> > Sorry I don't follow: does cpumask_set_cpu(), i.e., set_bit(), already
> > contain a compiler barrier?
> >
> > My understanding is that the compiler is free to reorder the set and
> > test on those two independent variables, and make it like this:
> >
> >   while (!cpumask_test_cpu(cpu, &resumed_cpus))
> >       cpu_relax();
> >   cpumask_set_cpu(cpu, &paused_cpus);
> >
> > So the CPU sent the IPI would keep waiting on paused_cpus being set,
> > and this CPU would keep waiting on resumed_cpus being set, which would
> > end up with a deadlock.
> >
> > > But your comment seems to indicate that
> > > also need to make sure the CPU preserves that ordering
> > > and short of a
> > > DMB, the test below could be reordered.
> >
> > If this CPU reorders the set and test like above, it wouldn't be a
> > problem because the set would eventually appear on the other CPU that
> > sent the IPI.
>
> I don't get it. You are requiring that the compiler doesn't reorder
> things, but you're happy that the CPU reorders the same things. Surely
> this leads to the same outcome...

I was thinking that the compiler might be able to reorder even if it
can't prove the loop actually terminates. But I now think that
shouldn't happen. So yes, I agree with what you said earlier that "the
compiler won't reorder the set and the test".

> > > > +     while (!cpumask_test_cpu(cpu, &resumed_cpus))
> > > > +             cpu_relax();
> > > > +     /* A typical example for sleep and wake-up functions. */
> > >
> > > I'm not sure this is "typical",...
> >
> > Sorry, this full barrier isn't needed. Apparently I didn't properly
> > fix this from the previous attempt to use wfe()/sev() to make this
> > function the sleeper for resume_remote_cpus() to wake up.
> >
> > > > +     smp_mb();
> > > > +     cpumask_clear_cpu(cpu, &paused_cpus);
> > > > +}
> > > > +
> > > > +void pause_remote_cpus(void)
> > > > +{
> > > > +     cpumask_t cpus_to_pause;
> > > > +
> > > > +     lockdep_assert_cpus_held();
> > > > +     lockdep_assert_preemption_disabled();
> > > > +
> > > > +     cpumask_copy(&cpus_to_pause, cpu_online_mask);
> > > > +     cpumask_clear_cpu(smp_processor_id(), &cpus_to_pause);
> > >
> > > This bitmap is manipulated outside of your cpu_pause_lock. What
> > > guarantees you can't have two CPUs stepping on each other here?
> >
> > Do you mean cpus_to_pause? If so, that's a local bitmap.
>
> Ah yes, sorry.
>
> >
> > > > +
> > > > +     spin_lock(&cpu_pause_lock);
> > > > +
> > > > +     WARN_ON_ONCE(!cpumask_empty(&paused_cpus));
> > > > +
> > > > +     smp_cross_call(&cpus_to_pause, IPI_CPU_STOP_NMI);
> > > > +
> > > > +     while (!cpumask_equal(&cpus_to_pause, &paused_cpus))
> > > > +             cpu_relax();
> > >
> > > This can be a lot of things to compare, specially that you are
> > > explicitly mentioning large systems. Why can't this be implemented as
> > > a counter instead?
> >
> > Agreed - that'd be sufficient and simpler.
> >
> > > Overall, this looks like stop_machine() in disguise. Why can't this
> > > use the existing infrastructure?
> >
> > This came up during the previous discussion [1]. There are
> > similarities. The main concern with reusing stop_machine() (or part of
> > its current implementation) is that it may not meet the performance
> > requirements. Refactoring might be possible, however, it seems to me
> > (after checking the code again) that such a refactoring unlikely ends
> > up cleaner or simpler codebase, especially after I got rid of CPU
> > masks, as you suggested.
>
> I would have expected to see an implementation handling faults during
> the break window. IPIs are slow, virtualised extremely badly, and
> pNMIs are rarely enabled, due to the long history of issues with it.
> At this stage, I'm not sure what you have here is any better than
> stop_machine(). On the other hand, faults should be the rarest thing,

Let me measure stop_machine() and see how that works for our
production. Meanwhile, if you don't mind that we leave the IPI
approach along with the kernel PF approach on the table?

Thanks.

