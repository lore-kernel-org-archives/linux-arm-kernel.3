Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C173CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 07:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CR+v3DYyPIQfSuBgQSD/F1YEBoxZbmD+6/3elV5THH0=; b=NXmBWQZHyqdccyU6emQM49fSoA
	t2EN1VFJuS0wVGauWjGCKsTdXTdBo2Jz8CZ9vr2r9Wi+4sQP2nDYb0YqndzvrYNmoSP7t6gNfGaSq
	eKunxJdRPeC8b7Lud4NO0amdQnVosQ/gitRKNiVTDzIAlnAyJCDjLVylUAtaaB3Efo0SLToVCOQps
	67349rfXbKmP6OGzKlvHE7/VxPDdKqvRhd2xiUh+uNob120uRH5uoXKu+CyguGO3a+Ux/xufE2pxK
	BBUiu1kDlGUuSFv+uhbSW9sEDkoIUN4jn7mws0Yd/Slvbl2couEgQJlVYdrfQTJonGxRD8dUUN+gw
	58A8gliA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UWR-00000004SEp-0a0b;
	Tue, 30 Sep 2025 07:11:39 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UWO-00000004SC4-0VWa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 07:11:37 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-43f9eb204baso39738b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 00:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1759216294; x=1759821094; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CR+v3DYyPIQfSuBgQSD/F1YEBoxZbmD+6/3elV5THH0=;
        b=I/ZVMfC8QvUE2jv42oZhyrg00ADiwk2hq7KSKEGXt3xJHzkD9Z8oW0mu0LOoI0cb0f
         1a6CBYxloGxhJQYVyxM2owTCxPAS8T8eZIWmiOfLm+HKxm+XiyKtfxi9aVhWfGBJSBpa
         AQ96nIflUeOxl7zR3CJTMfj44+ZGtNSsMIIIivHmyVWbxi/I98zaJT0FjhlaKLZda5WF
         /SWlJMUkPpwZFDVWTeUAVMQyORBRvfLEmqe5ASARscyp13+fcn3xQBSdBVuQYxSqsRTW
         wc4kMooxwYMsfMQvCs5hIB7SEsuRpZdXGfQscqvpA/e3YHVG/25sUD54M5aODKSiOSg6
         5u0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759216294; x=1759821094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CR+v3DYyPIQfSuBgQSD/F1YEBoxZbmD+6/3elV5THH0=;
        b=rowbnpKkJUPzUxlJIHeDY+UhcwdxRnq36jv3XBpnK+/sSPvsVnC2WHpAsim8Xg8abG
         BKAmBOMpVZIUTiffzQ5yKOCWTIycUQUiSLOpeIwEO79sKUgrj2Rh4sldwqklTE1yL7rf
         oaIhKxXtJmzkd3GY0hzIg+ELfVEA0i+Vvf8pfmjmsq5RMrGx9LT2syjOMlu0MGEmRWlf
         E3JQrAKPC6NCxmXJum7yCt6BY5HOmnXo96R4yjxFVrwfk3epE0vrgq0Aay+G7IiVvOmm
         b3MGXZ90wH1/o0MAijEPWhoaCMfHtZWiY97z57K9GLlzyrjec/rq+d4kphrxoweJqXz/
         FDTA==
X-Forwarded-Encrypted: i=1; AJvYcCXKj2u8b1Qs29QZoM9voyPa4LSo7uAowff1wOiknObW2o5CTYYaKhQjYxZnSavdTxCkW4jKIa0qM8DlSJhsiSAf@lists.infradead.org
X-Gm-Message-State: AOJu0YwJhjfRIwH/Oxoyj1R5tRn+MNa08m8DI2ivEuMfhoi4LlYcyTiO
	rmzBDTLl3WpyGj5XC6Gi/pyXmyap26ZgI3+po5lA+Z6lA8fw3TUsBYgJtzpxbxPntAKnw+sMA4m
	mZDLamlDIjNIXnHMHl0AjEzGe/ypqAYcTiQNxr5S5aw==
X-Gm-Gg: ASbGncux9qKHh7K53GAxrQzzy1Y34QoCdX6ANYiOETyjPBHMIBNP5t8pKsCligafrpF
	d2gnxDNxHRzEXW4d7lg/Rrv4KTNZ1lh8zgQdOMydHsgCmrl1E1G5b38gurigld0l9S0thRS3Fad
	t+03/1ojTtO2SHpZfArHnScoY0hEk6aqRP2ab32Vy3rYxKvVVAO10dRE11+MAm9q+T1UiJuz87z
	O6eJKl+clvOW4MJMphhZ4r/on1qthZCove4TVxlg7+SS3Xfk6s=
X-Google-Smtp-Source: AGHT+IG13enBpViuqbJkl3egtFONm0MWRV/sewI1GNsujGwdIAgHii202fyE/GTui5/tKuBeRANEDhPr69i6SXBk7hQ=
X-Received: by 2002:a05:6808:158d:b0:437:d0a7:e7aa with SMTP id
 5614622812f47-43f9401fe52mr1763089b6e.19.1759216292941; Tue, 30 Sep 2025
 00:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250925084806.89715-1-cuiyunhui@bytedance.com>
 <20250925084806.89715-2-cuiyunhui@bytedance.com> <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
 <CAEEQ3wnwNdTgt6ByHCzM43fhZMLSxwXvYx-AGBpsktraXqif2Q@mail.gmail.com>
 <CAD=FV=X6Xv_WYPMXKtOWLJX7skCoQmia3JbQej_u38qxqAbqDg@mail.gmail.com>
 <CAEEQ3wn0UckgNTJCPCNDtHW8DwWAJR1PXURvH57yfHATYqs7Gw@mail.gmail.com>
 <CAD=FV=XoUw6HWoFLMcgyHhYm7oeTOXCAyvBdpOghggmdvYzp6Q@mail.gmail.com> <CAEEQ3w==Ekffs4+Z55AXMV52f+8ht1pWm3JexXCSiB7T6rzppA@mail.gmail.com>
In-Reply-To: <CAEEQ3w==Ekffs4+Z55AXMV52f+8ht1pWm3JexXCSiB7T6rzppA@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 30 Sep 2025 15:11:21 +0800
X-Gm-Features: AS18NWBdZh_HxwD18sk9IRGlss7IupBdkXT8d-g2velRw5frfqvDCFq41tp_kn0
Message-ID: <CAEEQ3wkUai4-noA6CQDsOs=Hn3bSB5cdV9tZJZR8_g+o9e-Mpg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/2] watchdog: move arm64 watchdog_hld
 into common code
To: Doug Anderson <dianders@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	ziqianlu@bytedance.com, akpm@linux-foundation.org, alex@ghiti.fr, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	catalin.marinas@arm.com, johannes@sipsolutions.net, lihuafei1@huawei.com, 
	mark.rutland@arm.com, masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_001136_296265_139B046F 
X-CRM114-Status: GOOD (  47.98  )
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

Hi Doug,

On Tue, Sep 30, 2025 at 9:53=E2=80=AFAM yunhui cui <cuiyunhui@bytedance.com=
> wrote:
>
> Hi Doug,
>
> On Tue, Sep 30, 2025 at 6:56=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Sat, Sep 27, 2025 at 7:38=E2=80=AFPM yunhui cui <cuiyunhui@bytedance=
.com> wrote:
> > >
> > > Hi Doug,
> > >
> > > On Sat, Sep 27, 2025 at 4:58=E2=80=AFAM Doug Anderson <dianders@chrom=
ium.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Fri, Sep 26, 2025 at 2:37=E2=80=AFAM yunhui cui <cuiyunhui@byted=
ance.com> wrote:
> > > > >
> > > > > Hi Doug,
> > > > >
> > > > > On Fri, Sep 26, 2025 at 4:00=E2=80=AFAM Doug Anderson <dianders@c=
hromium.org> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On Thu, Sep 25, 2025 at 1:48=E2=80=AFAM Yunhui Cui <cuiyunhui@b=
ytedance.com> wrote:
> > > > > > >
> > > > > > > @@ -17,6 +17,7 @@
> > > > > > >  #include <linux/cpu_pm.h>
> > > > > > >  #include <linux/export.h>
> > > > > > >  #include <linux/kernel.h>
> > > > > > > +#include <linux/nmi.h>
> > > > > > >  #include <linux/perf/arm_pmu.h>
> > > > > > >  #include <linux/slab.h>
> > > > > > >  #include <linux/sched/clock.h>
> > > > > > > @@ -696,10 +697,12 @@ static int armpmu_get_cpu_irq(struct ar=
m_pmu *pmu, int cpu)
> > > > > > >         return per_cpu(hw_events->irq, cpu);
> > > > > > >  }
> > > > > > >
> > > > > > > -bool arm_pmu_irq_is_nmi(void)
> > > > > > > +#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
> > > > > > > +bool arch_perf_nmi_is_available(void)
> > > > > > >  {
> > > > > > >         return has_nmi;
> > > > > > >  }
> > > > > > > +#endif
> > > > > >
> > > > > > Should the previous comment move here, AKA:
> > > > > >
> > > > > > /*
> > > > > >  * hardlockup_detector_perf_init() will success even if Pseudo-=
NMI turns off,
> > > > >
> > > > > Okay, we also need to change it to =E2=80=9Cwatchdog_hardlockup_p=
robe()=E2=80=9D
> > > > >
> > > > > >  * however, the pmu interrupts will act like a normal interrupt=
 instead of
> > > > > >  * NMI and the hardlockup detector would be broken.
> > > > > > */
> > > > > >
> > > > > >
> > > > > > > +static int __init init_watchdog_freq_notifier(void)
> > > > > > > +{
> > > > > > > +       return cpufreq_register_notifier(&watchdog_freq_notif=
ier,
> > > > > > > +                                        CPUFREQ_POLICY_NOTIF=
IER);
> > > > > >
> > > > > > I think you need to do something to prevent this from happening=
 on any
> > > > > > platforms that override hw_nmi_get_sample_period(), right? Thes=
e
> > > > > > cpufreq notifiers will be useless in that case...
> > > > >
> > > > > I understand this is not a problem. watchdog_perf uses
> > > > > PERF_COUNT_HW_CPU_CYCLES, which means it is inherently limited by=
 the
> > > > > CPU's main frequency. After we make such a change, a larger value=
 may
> > > > > be used as the period, so the NMI period will become longer, but =
this
> > > > > value will not change after the system starts.
> > > >
> > > > I'm not sure I follow. On x86, hw_nmi_get_sample_period() is:
> > > >
> > > > u64 hw_nmi_get_sample_period(int watchdog_thresh)
> > > > {
> > > >   return (u64)(cpu_khz) * 1000 * watchdog_thresh;
> > > > }
> > >
> > > I have added the maintainers for arch/x86.
> > >
> > > 1. cpu_khz can be understood as returning the base operating frequenc=
y
> > > of a CPU, such as 2.3GHz. In practice, the CPU's core frequency may
> > > downclock to 800MHz under low load and overclock to 4.4GHz under high
> > > load.
> > >
> > > 2. Because the event provided to the PMU has the
> > > PERF_COUNT_HW_CPU_CYCLES attribute, and the counter's value is based
> > > on 2.3GHz, the execution cycle of watchdog_overflow_callback() is not
> > > fixed; it varies with the CPU's core frequency. When the CPU runs at =
a
> > > frequency higher than 2.3GHz, the NMI cycle will shorten; otherwise,
> > > it will lengthen.
> > >
> > > 3. After our modification, if the architecture is not integrated with
> > > cpufreq, it returns 0 and will not update the cycle. If integrated
> > > with cpufreq, it returns the maximum frequency supported by the CPU,
> > > so the NMI cycle is only slightly lengthened, with no impact on the
> > > actual hardlockup detection function.
> > >
> > > 4. I have also conducted tests:
> > > stress-ng --cpu 1 --taskset 1 --cpu-load 80
> > > echo 800000 > scaling_max_freq
> > > turbostat shows that Bzy_MHz and TSC_MHz are 800 and 2300 respectivel=
y.
> > > And the NMI cycle became approximately 30 seconds:
> > > [ 2309.442743] NMI watchdog: ------ watchdog overflow callback, cpu =
=3D 1
> > > [ 2341.526032] NMI watchdog: ------ watchdog overflow callback, cpu =
=3D 1
> >
> > Whether or not having x86 and powerpc start looking at cpufreq is an
> > improvement, certainly it is a change in behavior, right? If we're
> > really changing the behavior here then the commit subject and commit
> > message need to mention this. Right now this is billed as a simple
> > rename...
> >
> > I don't personally have lots of experience with x86 cpufreq but I do
> > know it doesn't work quite the same as how it does on arm. It would
> > definitely be good to get someone on x86 / powerpc to make sure that
> > they are happy with this. ...or you just keep making it work the way
> > it did before and then you don't have to worry about getting any
> > buy-in from x86 / powerpc folks. Up to you, I guess.
>
> Well, I fully agree with your suggestion. What I can think of for now
> is wrapping the newly added content with #if defined(CONFIG_ARM64) ||
> defined(CONFIG_RISCV).

I=E2=80=99ve also thought of an alternative approach: add a generic
WATCHDOG_PERF_ADJUST_PERIOD to /lib/Kconfig.debug, then have the
Kconfig files for arch/arm64 and riscv select
WATCHDOG_PERF_ADJUST_PERIOD. What=E2=80=99s your take on this?

Do you have a more elegant approach to
> recommend?
>
> >
> > Note that folks on x86 have definitely had to deal with turbo mode
> > before.  See commit 7edaeb6841df ("kernel/watchdog: Prevent false
> > positives with turbo modes").
> >
> > -Doug
> >
>
> Thanks,
> Yunhui

Thanks,
Yunhui

