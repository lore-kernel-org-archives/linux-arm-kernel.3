Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B78D5B845
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 22:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLJb+MSFeIuMjaWbZFbinF8pHkgM5h+mk8sFEoJ/Tys=; b=0UNvdfotzxEPDtpWrKL/lHHSnf
	3TYm4pm6ECC6Odyi4HohCl2KbFe0HmzFjrVDMHnDFF737BdxMaSQk+bLrTZhyhEPDz9pqZNJusg2A
	zwFlbnmnp7shO/GUcupkVFx+kylN56+LFAyqnVG+sXO64ICm76bR85qNvHtXf3KgKoyUQoAucmvyH
	HnJRUQEJm4UkXaUKaBtToJVQKRIWndkuHUvkTm7ZXq7NGxn10sq+kp6AJ3UxHhHRDRcoNnOXckgCk
	ob4E3dvqQEKrm87CC400/QVJKQcNPW8wAu5nhFoOgFZ8igMibfMIVxzAEl59j/JdGwuP41zkVTzSx
	8Xc/bGAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Y39-0000000CUwn-3mjA;
	Mon, 28 Oct 2024 22:17:23 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XyV-0000000CUIV-2WFr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 22:12:37 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-4a47d70cd8aso1454424137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 15:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730153549; x=1730758349; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLJb+MSFeIuMjaWbZFbinF8pHkgM5h+mk8sFEoJ/Tys=;
        b=tKPqs6Za4NBXxPeRi62KytHEFzJ4+BOIf/TOKt2QL1X+OHPmg4QQN7mntAqiaBhGm6
         KykslKIzL3wk4brv9oYVkIljeMJx1wVjYr19f1jq19IAMXleC22CE3rkP+T3bYfapqtK
         bNf6JfbUiNRaNtu98oNffZ4bszXtWN1HAmtIGf/yS7zKsLM2XwuTVd2Y/jeq4OQJ0SD9
         QBLNhP2ij7ZfUTv8h32t0z43XvbjEKKPKz5ufK/DoN0T4/iBh07BPImOBFqi9rW29ppp
         4PqSigPA5N/AjHjQmjIfp3BMhlmaIjbp5p/AEdyvf4gAnN1W/WZKK73jxrlu/DmytbCd
         gpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730153549; x=1730758349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLJb+MSFeIuMjaWbZFbinF8pHkgM5h+mk8sFEoJ/Tys=;
        b=aLLs4XyU2oWGdug7gfvdkaNUJdMTDI9ITRVO4qobTUNIubhUYIUSDZMEehlxlcAa6W
         kW8DQe+3UDVPfE24Z/4uIFQo368VJXTflwwwqBiH/qUOBJE4EImhv7aiXYF9cIXjEFl+
         wD2KdGaq0Q3Zb6QDMURwl+notiuZsve6z9fZ+isOaP3AUwF4ywhwyEAcUCN3t12qEWt+
         5PkCenhI/L3fKu6PyBnufp6D9kmwH2yBL2fsulsq5yY68l9/4/JZFTvYzwEQe8rd6e/V
         FFd0RzgCUN5hP50uaIbCJ/Yxh0L6k7aGtDhAIZEcxX5Ts1clUz/eGXBpuPtgJU0T++CH
         C/RA==
X-Forwarded-Encrypted: i=1; AJvYcCUhg/7LagZ/063U/Pv61ycFZcTPSePlEo+zn1C79q/bK1fRb9yhkuyWerQIB4VMKE+9Ln5qaRMSL5SBjJpX80xT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy19G6SupPoAUTHPqTy5DCKyLqzizF56k3mORRpis9J9K6ISfP1
	GtK66Z7v5TcDNKyxlhBcOFDKndkpV74SgCTJIsn3kBadtwSEEMTII53FDOPdb3OKaQlqgwcaHOS
	cBgqQdzTkuBqjOizVvJ79Q9C8eda/60GpSsYk
X-Google-Smtp-Source: AGHT+IGhZjhk8TWm4Ox13TlDPCl1f+no887h0FoY5bya9X/aDkGoU1CVHkU9ScAAG7rcSvUbBqANUY0rSjFirr2oCPk=
X-Received: by 2002:a05:6102:290e:b0:4a5:e63f:3655 with SMTP id
 ada2fe7eead31-4a8cfb27a53mr8607614137.1.1730153549305; Mon, 28 Oct 2024
 15:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241021042218.746659-1-yuzhao@google.com> <20241021042218.746659-5-yuzhao@google.com>
 <868qug3yig.wl-maz@kernel.org>
In-Reply-To: <868qug3yig.wl-maz@kernel.org>
From: Yu Zhao <yuzhao@google.com>
Date: Mon, 28 Oct 2024 16:11:52 -0600
Message-ID: <CAOUHufabSWTZ+cBjXEDTRh61GeALL5b6uh0M76=2ninZP3KAzQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241028_151235_677178_B0B083C8 
X-CRM114-Status: GOOD (  49.68  )
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

On Tue, Oct 22, 2024 at 10:15=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> On Mon, 21 Oct 2024 05:22:16 +0100,
> Yu Zhao <yuzhao@google.com> wrote:
> >
> > Broadcast pseudo-NMI IPIs to pause remote CPUs for a short period of
> > time, and then reliably resume them when the local CPU exits critical
> > sections that preclude the execution of remote CPUs.
> >
> > A typical example of such critical sections is BBM on kernel PTEs.
> > HugeTLB Vmemmap Optimization (HVO) on arm64 was disabled by
> > commit 060a2c92d1b6 ("arm64: mm: hugetlb: Disable
> > HUGETLB_PAGE_OPTIMIZE_VMEMMAP") due to the folllowing reason:
> >
> >   This is deemed UNPREDICTABLE by the Arm architecture without a
> >   break-before-make sequence (make the PTE invalid, TLBI, write the
> >   new valid PTE). However, such sequence is not possible since the
> >   vmemmap may be concurrently accessed by the kernel.
> >
> > Supporting BBM on kernel PTEs is one of the approaches that can make
> > HVO theoretically safe on arm64.
>
> Is the safety only theoretical? I would have expected that we'd use an
> approach that is absolutely rock-solid.

We've been trying to construct a repro against the original HVO
(missing BBM), but so far no success. Hopefully a repro does exist,
and then we'd be able to demonstrate the effectiveness of this series,
which is only theoretical at the moment.

> > Note that it is still possible for the paused CPUs to perform
> > speculative translations. Such translations would cause spurious
> > kernel PFs, which should be properly handled by
> > is_spurious_el1_translation_fault().
>
> Speculative translation faults are never reported, that'd be a CPU
> bug.

Right, I meant to say "speculative accesses that cause translations".

> *Spurious* translation faults can be reported if the CPU doesn't
> implement FEAT_ETS2, for example, and that has to do with the ordering
> of memory access wrt page-table walking for the purpose of translations.

Just want to make sure I fully understand: after the local CPU sends
TLBI (followed by DSB & ISB), FEAT_ETS2 would act like DSB & ISB on
remote CPUs when they perform the invalidation, and therefore
speculative accesses are ordered as well on remote CPUs.

Also I'm assuming IPIs on remote CPUs don't act like a full barrier,
and whatever they interrupt still can be speculatively executed even
though the IPI hander itself doesn't access the vmemmap area
undergoing BBM. Is this correct?

> > Signed-off-by: Yu Zhao <yuzhao@google.com>
> > ---
> >  arch/arm64/include/asm/smp.h |  3 ++
> >  arch/arm64/kernel/smp.c      | 92 +++++++++++++++++++++++++++++++++---
> >  2 files changed, 88 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.=
h
> > index 2510eec026f7..cffb0cfed961 100644
> > --- a/arch/arm64/include/asm/smp.h
> > +++ b/arch/arm64/include/asm/smp.h
> > @@ -133,6 +133,9 @@ bool cpus_are_stuck_in_kernel(void);
> >  extern void crash_smp_send_stop(void);
> >  extern bool smp_crash_stop_failed(void);
> >
> > +void pause_remote_cpus(void);
> > +void resume_remote_cpus(void);
> > +
> >  #endif /* ifndef __ASSEMBLY__ */
> >
> >  #endif /* ifndef __ASM_SMP_H */
> > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > index 3b3f6b56e733..68829c6de1b1 100644
> > --- a/arch/arm64/kernel/smp.c
> > +++ b/arch/arm64/kernel/smp.c
> > @@ -85,7 +85,12 @@ static int ipi_irq_base __ro_after_init;
> >  static int nr_ipi __ro_after_init =3D NR_IPI;
> >  static struct irq_desc *ipi_desc[MAX_IPI] __ro_after_init;
> >
> > -static bool crash_stop;
> > +enum {
> > +     SEND_STOP =3D BIT(0),
> > +     CRASH_STOP =3D BIT(1),
> > +};
> > +
> > +static unsigned long stop_in_progress;
> >
> >  static void ipi_setup(int cpu);
> >
> > @@ -917,6 +922,79 @@ static void __noreturn ipi_cpu_crash_stop(unsigned=
 int cpu, struct pt_regs *regs
> >  #endif
> >  }
> >
> > +static DEFINE_SPINLOCK(cpu_pause_lock);
>
> PREEMPT_RT will turn this into a sleeping lock. Is it safe to sleep as
> you are dealing with kernel mappings?

Right, it should be a raw spinlock -- the caller disabled preemption,
which as you said is required when dealing with the kernel mappings.

> > +static cpumask_t paused_cpus;
> > +static cpumask_t resumed_cpus;
> > +
> > +static void pause_local_cpu(void)
> > +{
> > +     int cpu =3D smp_processor_id();
> > +
> > +     cpumask_clear_cpu(cpu, &resumed_cpus);
> > +     /*
> > +      * Paired with pause_remote_cpus() to confirm that this CPU not o=
nly
> > +      * will be paused but also can be reliably resumed.
> > +      */
> > +     smp_wmb();
> > +     cpumask_set_cpu(cpu, &paused_cpus);
> > +     /* paused_cpus must be set before waiting on resumed_cpus. */
> > +     barrier();
>
> I'm not sure what this is trying to enforce. Yes, the compiler won't
> reorder the set and the test.

Sorry I don't follow: does cpumask_set_cpu(), i.e., set_bit(), already
contain a compiler barrier?

My understanding is that the compiler is free to reorder the set and
test on those two independent variables, and make it like this:

  while (!cpumask_test_cpu(cpu, &resumed_cpus))
      cpu_relax();
  cpumask_set_cpu(cpu, &paused_cpus);

So the CPU sent the IPI would keep waiting on paused_cpus being set,
and this CPU would keep waiting on resumed_cpus being set, which would
end up with a deadlock.

> But your comment seems to indicate that
> also need to make sure the CPU preserves that ordering
> and short of a
> DMB, the test below could be reordered.

If this CPU reorders the set and test like above, it wouldn't be a
problem because the set would eventually appear on the other CPU that
sent the IPI.

> > +     while (!cpumask_test_cpu(cpu, &resumed_cpus))
> > +             cpu_relax();
> > +     /* A typical example for sleep and wake-up functions. */
>
> I'm not sure this is "typical",...

Sorry, this full barrier isn't needed. Apparently I didn't properly
fix this from the previous attempt to use wfe()/sev() to make this
function the sleeper for resume_remote_cpus() to wake up.

> > +     smp_mb();
> > +     cpumask_clear_cpu(cpu, &paused_cpus);
> > +}
> > +
> > +void pause_remote_cpus(void)
> > +{
> > +     cpumask_t cpus_to_pause;
> > +
> > +     lockdep_assert_cpus_held();
> > +     lockdep_assert_preemption_disabled();
> > +
> > +     cpumask_copy(&cpus_to_pause, cpu_online_mask);
> > +     cpumask_clear_cpu(smp_processor_id(), &cpus_to_pause);
>
> This bitmap is manipulated outside of your cpu_pause_lock. What
> guarantees you can't have two CPUs stepping on each other here?

Do you mean cpus_to_pause? If so, that's a local bitmap.

> > +
> > +     spin_lock(&cpu_pause_lock);
> > +
> > +     WARN_ON_ONCE(!cpumask_empty(&paused_cpus));
> > +
> > +     smp_cross_call(&cpus_to_pause, IPI_CPU_STOP_NMI);
> > +
> > +     while (!cpumask_equal(&cpus_to_pause, &paused_cpus))
> > +             cpu_relax();
>
> This can be a lot of things to compare, specially that you are
> explicitly mentioning large systems. Why can't this be implemented as
> a counter instead?

Agreed - that'd be sufficient and simpler.

> Overall, this looks like stop_machine() in disguise. Why can't this
> use the existing infrastructure?

This came up during the previous discussion [1]. There are
similarities. The main concern with reusing stop_machine() (or part of
its current implementation) is that it may not meet the performance
requirements. Refactoring might be possible, however, it seems to me
(after checking the code again) that such a refactoring unlikely ends
up cleaner or simpler codebase, especially after I got rid of CPU
masks, as you suggested.

[1] https://lore.kernel.org/all/ZbKjHHeEdFYY1xR5@arm.com/

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 3b3f6b56e733..b672af2441a3 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -917,6 +922,64 @@ static void __noreturn
ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs
 #endif
 }

+static DEFINE_RAW_SPINLOCK(cpu_pause_lock);
+static bool __cacheline_aligned_in_smp cpu_paused;
+static atomic_t __cacheline_aligned_in_smp nr_cpus_paused;
+
+static void pause_local_cpu(void)
+{
+ atomic_inc(&nr_cpus_paused);
+
+ while (READ_ONCE(cpu_paused))
+ cpu_relax();
+
+ atomic_dec(&nr_cpus_paused);
+}
+
+void pause_remote_cpus(void)
+{
+ cpumask_t cpus_to_pause;
+ int nr_cpus_to_pause =3D num_online_cpus() - 1;
+
+ lockdep_assert_cpus_held();
+ lockdep_assert_preemption_disabled();
+
+ if (!nr_cpus_to_pause)
+ return;
+
+ cpumask_copy(&cpus_to_pause, cpu_online_mask);
+ cpumask_clear_cpu(smp_processor_id(), &cpus_to_pause);
+
+ raw_spin_lock(&cpu_pause_lock);
+
+ WARN_ON_ONCE(cpu_paused);
+ WARN_ON_ONCE(atomic_read(&nr_cpus_paused));
+
+ cpu_paused =3D true;
+
+ smp_cross_call(&cpus_to_pause, IPI_CPU_STOP_NMI);
+
+ while (atomic_read(&nr_cpus_paused) !=3D nr_cpus_to_pause)
+ cpu_relax();
+
+ raw_spin_unlock(&cpu_pause_lock);
+}
+
+void resume_remote_cpus(void)
+{
+ if (!cpu_paused)
+ return;
+
+ raw_spin_lock(&cpu_pause_lock);
+
+ WRITE_ONCE(cpu_paused, false);
+
+ while (atomic_read(&nr_cpus_paused))
+ cpu_relax();
+
+ raw_spin_unlock(&cpu_pause_lock);

+}
+
 static void arm64_backtrace_ipi(cpumask_t *mask)
 {
  __ipi_send_mask(ipi_desc[IPI_CPU_BACKTRACE], mask);

