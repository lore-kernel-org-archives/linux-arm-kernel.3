Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4CDCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 22:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVD4DJVtoBrKvlbtSGq+TafFJcaizg8CU1ex4tJTqNc=; b=0oltIqHOBSW9DUX1QeNn0TyAsf
	NW4SmxJyHKZS/5cLjnOoG3nFwWeDov0r7pY3/C5+JfLa9jBlLSnhPue0Qk1GYzr7TNNTCExLRb33r
	NxZ+RmPF7Gcco9oXxx6xq+7G7mnDno5HeR1ETQvxbOYM8E9V6ZScDXeuN2zvPKv1bJiLOwwCNFExl
	CvRGCyLbxokTHoqvEvWen1pu+AVt5ypOrO+4PG7uobuQCubYCPvmT8UFCncISjRE9bdOQup5v+0F8
	o50NjKnax0RF37VafZ0ClNJaLiKZnY5lN2wcR+CaODMzNfd/KENNsRkvJIpLLHWmPVPR4DzVXm4nx
	1/6238fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXRl5-00000008QiC-00Tx;
	Wed, 10 Jun 2026 22:50:51 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXRl2-00000008QhC-14Ia
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 22:50:50 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-91574384cc2so839718585a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 15:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781131847; x=1781736647; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVD4DJVtoBrKvlbtSGq+TafFJcaizg8CU1ex4tJTqNc=;
        b=JkOVs6fivrQS70JkrUiITYkKBJsCoC2WxYwmBwcVtrW4fFGnxJooPlVzL+mLeZuWXM
         5bB3WYXPTz96JC4X96EgwQ9ov4P7J46DP1E1rvKjVEIxVQVtG+eJw+AGTOhLdRg7TqHi
         iWaT7uzCGEfcEBzsfc0kQ3Nzk8VA9hCkPf3nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781131847; x=1781736647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JVD4DJVtoBrKvlbtSGq+TafFJcaizg8CU1ex4tJTqNc=;
        b=h5WM0QPg3d1+ccL81EBDSqyaEEdXJrMKTqQSSsZpQ6etIElUYpSlBRMgBWS/5xuEG1
         wr+JuRZ0t+i/MMmtpBz96YOzijaN2GPLlhkjE44HUPdGDis23K8IoDoCsbKAYNLwXRgE
         f3Sr5FB8ghoWKAXdFyHuc3m5U7v3Ay7FQVfpcvYgCxBoWzbyooXXjaWjqruD0p7CL8Ef
         W/i3XhbscBD1q1AW0cU5WfIcs3cGlNMjGNjgdFR0XgSSvQ1YlGZdlFbsg8/Kk2x3YMEm
         DbykkJ+ebXAscp16fjYh/FYEXwuMvrnQ9jEErxJIFXORlVPEoM+1vSAtHJR6nAUVDXsI
         NjDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pmc0uoEEJRrLxIC92nl0UgWxVpNuEkuNJNxmo1UP2iK0ZDG4Mf9PH1U/NH8ka8I52YYlsidHMmSQuWrd/aK7b@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+bAvoJ1Xm4uUv6+g1TgccL8z3xywrDf3vMTCdirMabyU/n0fM
	FBgRrCylXTLqgOjDPtEPLBqpAzliMvTAK7Mn2WID+5QzMEeOc3uupVcTIQVz/dC3zSWxsIi/rbS
	o6Ww=
X-Gm-Gg: Acq92OF78ustxIJ1PJqfE5Fdu/b9/Rpu/Z3KlOOhimuf++eKR/7wat+s/xCz6EzRO60
	XQ/NAgIrQRByiN3+OkJgKIqoEZYsK3hMA7CMf3AfUNJLkG6G1R/4IzVMn4+Zm3naz4MmEjoj22/
	VE44linZd7i2sEHw5P+ix4+3iuyfE1PO5ssZHMKwFY0Zsn6W434DDFGojCXMsV1OZxZu8Ah1VXX
	6bQvxDj/YHxtLTcheZSfKL51UPIMJb/8ry8yAIq4gu2fiYLE6M9Roe9RPbXKL1j8hBoGOmDHge7
	GEBrRxTBQPqcK6g3SiQYj0BQEOLT6OErvi1mfmNlq4CoRgELMyxoo5mfBl0h8C4xxHYc1w13af5
	a2WzooKVj0v7JC2iPRSh4xpNKeus1cy9dgnH/bAGPYD+pdIlyoiwy1EnvbRCjGq1u8ztCkwyI6t
	tX7PANj/OGAM6K9RQGae6qUDx7F8OJX6zytsO5yU0g/3FgX1aMgn8arwOaErP1I1YlQcBbHsZ8a
	hJh
X-Received: by 2002:a05:620a:2611:b0:915:7fe4:cac5 with SMTP id af79cd13be357-915e8333aacmr1454681085a.49.1781131846785;
        Wed, 10 Jun 2026 15:50:46 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a243041sm2650054085a.18.2026.06.10.15.50.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 15:50:45 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51788280e71so79309921cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 15:50:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9QnMUy5c+zNS6UfgOlI3Hiyq6nThsjZA8Jxqdk2it05Psq2Xu8rwVvy1Tqsm+VJ7QgRAGrXoTeJ+tAdMTrcwoY@lists.infradead.org
X-Received: by 2002:a05:622a:6201:b0:517:906b:c043 with SMTP id
 d75a77b69052e-517ee1c5958mr4710171cf.36.1781131843959; Wed, 10 Jun 2026
 15:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780496779.git.kas@kernel.org> <cover.1781013134.git.kas@kernel.org>
 <a7ed093b78e6966c049bacc7644a8a00a9a52720.1781013134.git.kas@kernel.org>
In-Reply-To: <a7ed093b78e6966c049bacc7644a8a00a9a52720.1781013134.git.kas@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jun 2026 15:50:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VLoJBMhDjb=3XAOCZWDBACn_=KdnkL0J6-Ch4uKrHjNA@mail.gmail.com>
X-Gm-Features: AVVi8CciGqVcpIhL2Q7MYd6G_uBvzThyYEUZAtEldfH-MO5pE6wmOHBhbivRT1s
Message-ID: <CAD=FV=VLoJBMhDjb=3XAOCZWDBACn_=KdnkL0J6-Ch4uKrHjNA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: escalate smp_send_stop() to an SDEI NMI as
 a last resort
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
	Breno Leitao <leitao@debian.org>, Julien Thierry <julien.thierry.kdev@gmail.com>, 
	Lecopzer Chen <lecopzer@gmail.com>, Sumit Garg <sumit.garg@kernel.org>, kernel-team@meta.com, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_155048_330563_AB6F737D 
X-CRM114-Status: GOOD (  35.99  )
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

Hi,

On Tue, Jun 9, 2026 at 6:58=E2=80=AFAM Kiryl Shutsemau <kirill@shutemov.nam=
e> wrote:
>
> @@ -910,6 +911,35 @@ static void __noreturn ipi_cpu_crash_stop(unsigned i=
nt cpu, struct pt_regs *regs
>  #endif
>  }
>
> +#ifdef CONFIG_ARM_SDEI_NMI
> +/*
> + * Stop entry for the SDEI cross-CPU NMI service: its event-0 handler
> + * lands here when this CPU was asked to stop. The bookkeeping mirrors
> + * the IPI_CPU_STOP{,_NMI} handling; the park happens inside the SDEI
> + * event, which is never completed -- completing it would have firmware
> + * resume the interrupted (typically wedged) context. No PSCI CPU_OFF
> + * either: powering off a PE that EL3 still considers mid-event invites
> + * firmware trouble.
> + */
> +void __noreturn arm64_nmi_cpu_stop(struct pt_regs *regs)
> +{
> +       unsigned int cpu =3D smp_processor_id();
> +
> +       local_daif_mask();
> +
> +       if (IS_ENABLED(CONFIG_KEXEC_CORE) && crash_stop)
> +               crash_save_cpu(regs, cpu);
> +
> +       /* the ack the stop requester polls for */
> +       set_cpu_online(cpu, false);
> +
> +       sdei_mask_local_cpu();
> +
> +       cpu_park_loop();
> +}
> +NOKPROBE_SYMBOL(arm64_nmi_cpu_stop);
> +#endif

Can we combine everything into one function so we don't have to keep
all the different stop functionality in sync? Like this (untested):

void __noreturn arm64_nmi_cpu_stop(struct pt_regs *regs, bool die_on_crash)
{
  unsigned int cpu =3D smp_processor_id();
  bool crash =3D IS_ENABLED(CONFIG_KEXEC_CORE) && crash_stop;

  /*
   * Use local_daif_mask() instead of local_irq_disable() to make sure
   * that pseudo-NMIs are disabled. The "stop" code starts with
   * an IRQ and falls back to NMI (which might be pseudo). If the IRQ
   * finally goes through right as we're timing out then the NMI could
   * interrupt us. It's better to prevent the NMI and let the IRQ
   * finish since the pt_regs will be better.
   */
  local_daif_mask();

  if (crash)
    crash_save_cpu(regs, cpu);

  set_cpu_online(cpu, false);

  sdei_mask_local_cpu();

  if (crash && die_on_crash)
    __cpu_try_die(cpu);

  /* just in case */
  cpu_park_loop();
}

Then in do_handle_IPI(), it's just:

  case IPI_CPU_STOP:
  case IPI_CPU_STOP_NMI:
    arm64_nmi_cpu_stop(get_irq_regs(), true);
    break;

...and from the SDEI code you pass "false" for "die_on_crash".

Perhaps when doing that you'd stop unconditionally getting the cpu in
do_handle_IPI() and just call it for `IPI_KGDB_ROUNDUP` since it would
now be the only consumer of that local variable.

FWIW, I'm not totally sure I followed the logic for why "die_on_crash"
needs to be "false" for the SDEI case, but I also am not terribly
familiar with KEXEC and crash-dumping kernels, since I've never
attempted to get that feature to work.


> @@ -1263,6 +1293,29 @@ void smp_send_stop(void)
>                         udelay(1);
>         }
>
> +       /*
> +        * If CPUs are *still* online, try the SDEI cross-CPU NMI. Firmwa=
re
> +        * delivers it regardless of the target's DAIF state, so it reach=
es
> +        * a CPU spinning with interrupts masked, which neither rung abov=
e
> +        * could (without pseudo-NMI there is no NMI rung at all). Allow
> +        * 100ms: a firmware round-trip per CPU, with headroom.
> +        */
> +       if (num_other_online_cpus()) {
> +               /* re-snapshot after the rungs above took CPUs offline */
> +               smp_rmb();
> +               cpumask_copy(&mask, cpu_online_mask);
> +               cpumask_clear_cpu(smp_processor_id(), &mask);
> +
> +               if (sdei_nmi_stop_cpus(&mask)) {
> +                       pr_info("SMP: retry stop with SDEI NMI for CPUs %=
*pbl\n",
> +                               cpumask_pr_args(&mask));

Perhaps it's being a bit pedantic, but it's a little weird that you're
printing a message that sounds like "I'm going to retry with SDEI"
after you've already done it. It feels like it would be nominally
cleaner (and more parellel with the pseudo-NMI case) if you could
separately test if SDEI is available. Then sdei_nmi_stop_cpus() would
just return void?


> @@ -59,8 +64,45 @@ static bool sdei_nmi_available;
>
>  #define SDEI_NMI_EVENT                 0
>
> +/*
> + * Stop-request dispatch lives on the same SDEI event 0 as everything
> + * else. The requesting CPU sets each target's bit in sdei_nmi_stop_mask
> + * before signalling event 0; the target's handler test-and-clears its
> + * bit and hands the CPU to arm64_nmi_cpu_stop(), which saves crash
> + * state when the stop is a kdump crash-stop, marks the CPU offline
> + * (which is what the requester polls for) and parks it.
> + *
> + * This mirrors the cpumask the framework's nmi_cpu_backtrace() consults
> + * just below, and a shared mask rather than a separate SDEI event avoid=
s
> + * extra registrations from firmware.
> + */

Do you have any reasoning for why you don't pick a separate EVENT ID
for "backtrace" vs. "stop". If you absolutely have to share an ID
because they're a limited resource then I guess it's fine, but it
would make the code easier to understand / reason about if they were
separate IDs.

If you had a separate EVENT ID, then it seems like you could
completely eliminate the (potentially large) `sdei_nmi_stop_mask`
variable, right? Any time a "STOP" event fires you can unconditionally
consider it to be a stop w/ no globals needed, right?


> @@ -115,6 +157,35 @@ bool sdei_nmi_trigger_cpumask_backtrace(const cpumas=
k_t *mask, int exclude_cpu)
>         return true;
>  }
>
> +/*
> + * Last rung of the stop escalation in smp_send_stop() (see
> + * arch/arm64/kernel/smp.c). The caller runs the regular stop IPI (and
> + * the pseudo-NMI stop IPI, where available) first; @mask holds whatever
> + * stayed online through those -- typically CPUs wedged with interrupts
> + * masked, unreachable by an IPI. Set each target's stop-request flag an=
d
> + * signal event 0 at it; a target acks by marking itself offline, which
> + * the caller polls for.
> + *
> + * Returns false when SDEI isn't active, so the caller can skip the wait=
.
> + */
> +bool sdei_nmi_stop_cpus(const cpumask_t *mask)
> +{
> +       unsigned int cpu;
> +
> +       if (!sdei_nmi_available)
> +               return false;
> +
> +       cpumask_or(&sdei_nmi_stop_mask, &sdei_nmi_stop_mask, mask);

As per above, hopefully we can get rid of `sdei_nmi_stop_mask`. ...but
if we keep it, I'm curious why "or" and not "copy"?

