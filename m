Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34E6CAC5BC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 02:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDDVDZIdgHY10IxWeSmThIWnM3Kfl8SB2Uc8qwV0eGM=; b=agsNzGU30T8hAasIMqDYsUjmpx
	fwyEY/UBKEkrkVaAcdZbiiEn9JSLwGnco20WNGBaFP1ogZgha/87jw+G2+6aYbF6X2S+KcphK5f6g
	D/weU5XckXqjTqfsHp0NzezBmA0Y/+E/ogpOedOElGgpf1/uTVOKtjIrVqoX5ibX7UlefKI7b33ie
	QRjqALzPTDGHiVigH1/GiQ0u3gxoqLdZyXwatOUp+QkLiKIQWS9RDKHZmdYzEZlwECRgvHHzYkkDE
	1QFaJbBY8YexfS1dMMzi1gqMkXnY13SWXJ37X557J4AOnaOr0u0dyXyczU5d6IBP95VwINEeOKxB/
	CutsJRrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2hIz-0000000DIx2-0cCa;
	Sun, 28 Sep 2025 02:38:29 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2hIx-0000000DIvm-0JdK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 02:38:28 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-62189987b47so2209359eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 19:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1759027102; x=1759631902; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDDVDZIdgHY10IxWeSmThIWnM3Kfl8SB2Uc8qwV0eGM=;
        b=gX6R41Oh6FTv9J388VaO0bd+nEZ6DZXoMmYiKEP2RYjVs4vfgPfc1tBpXaYpAjryWv
         0kGrsRTbzY3mgoQHMP6uenXu7/inSyG25NaV3HsJmJp0PyRWcCqaOR0PLSU1UgRl8yjo
         J8urotKLEFuJI4PzbgffaULOzbXaDkOXSch0S/8gUBtuK7YBwZ4kG+tz/aM1mTQeG6Oo
         N5nDYTuskdMLlnfvgNQErwnhUTZneEEcI3SqpK81ok7MTd70aiOlLJLIFymp6j1D5W21
         9ouz41QEk+pzknmmpWV5MVtsYTXmDLpG+Hpn1d8oja7N0nEdinvL0+VnHXWO0rJX55Ku
         +ARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759027102; x=1759631902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDDVDZIdgHY10IxWeSmThIWnM3Kfl8SB2Uc8qwV0eGM=;
        b=NGmFZh4rgruTdmu17XkO6mNjYj45/LrGhC+W2qgJS00GdEXHpFEIzACNLBjOAZ7STu
         XN+D8aR6NKYAw78g7SK7YyJoXPh5MspjK8EqYmCyTgt9A9PO4MPwhQXVw8mHTUCF/aog
         otng5nM8Zhby+fgstR9/VwS59IlHDkcE1UFgWNKQf0bHqcAMcEB8sj9bxLRzgzuR4glQ
         ETwupMLUvyAlCz6r33S3qIAEiJEdJ/1UuJcV6rCsALIwg0z8rw8+Xj4ykmErut+vM6rE
         MG+Wi0jGxA9jb1nM0/JwOAPCn16znz7lCx6jd4C7OoVr94WXXFMebu/Wien6StYg7Dv3
         AOTg==
X-Forwarded-Encrypted: i=1; AJvYcCX8EhtMbEQ4/F892H/9TxOAyie80Fv8kYDXkL0si0CWd1/9vBnGohRDswrjvhScp9MXrjTZBRqyc/CVkTHEpiY0@lists.infradead.org
X-Gm-Message-State: AOJu0YwERSn+j8Nt5Z9+uQB1CH0QAkbDpwPCRDakrGf4gzsktOLytOKq
	sCdmzSZ5D+4KHNVOD61xg2qm7M5NoYNceGqOc03o+xvwuobBG7+eeKMGCA5Zih4oDGA4esikaVN
	F7zv7yHD8YEplabEcjPe6b3+TtIJuSuxmMD07M3k1ZQ==
X-Gm-Gg: ASbGnctmijN83XbZSRWGwWVU7Dg6uCSJK16MKz3Eh3MVzeFGsjOEdMZ/zwBdxjqV2gO
	X/bYuepPTJ4crZGC0mAHqKSB3O7GQ7ifrELKhZMPsaR5N0V7Oq/mmIjuJ5d8I0EUmdOqqnzo6lO
	M9c1GxZOWLyJe7JdGUZa6TiaCifhMcXiPsKQgfN6cB4AW/zzAhFenf41SLKGA6PXGv/3s8RJSJE
	Wq3mzQzNb/F067aAQXFyYqVN+myaSw=
X-Google-Smtp-Source: AGHT+IHN9SZKPMfskn9LtN56hlvjdE/PVxPJY1sD2/2M2FEMKbIx55CZ1Hog94gS2psvQYARXktJ5bJrXOdSq0er7i4=
X-Received: by 2002:a05:6808:3022:b0:43f:7287:a5d0 with SMTP id
 5614622812f47-43f7287b062mr1202461b6e.34.1759027101799; Sat, 27 Sep 2025
 19:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250925084806.89715-1-cuiyunhui@bytedance.com>
 <20250925084806.89715-2-cuiyunhui@bytedance.com> <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
 <CAEEQ3wnwNdTgt6ByHCzM43fhZMLSxwXvYx-AGBpsktraXqif2Q@mail.gmail.com> <CAD=FV=X6Xv_WYPMXKtOWLJX7skCoQmia3JbQej_u38qxqAbqDg@mail.gmail.com>
In-Reply-To: <CAD=FV=X6Xv_WYPMXKtOWLJX7skCoQmia3JbQej_u38qxqAbqDg@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sun, 28 Sep 2025 10:38:10 +0800
X-Gm-Features: AS18NWAN-ZpVjYdN0iAwRHsiQoYm1lDRDU85PF8Qq2B5t-2l3rsp0TxumU2MhVA
Message-ID: <CAEEQ3wn0UckgNTJCPCNDtHW8DwWAJR1PXURvH57yfHATYqs7Gw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/2] watchdog: move arm64 watchdog_hld
 into common code
To: Doug Anderson <dianders@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, hpa@zytor.com, ziqianlu@bytedance.com
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_193827_262091_9689253F 
X-CRM114-Status: GOOD (  32.12  )
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

On Sat, Sep 27, 2025 at 4:58=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Sep 26, 2025 at 2:37=E2=80=AFAM yunhui cui <cuiyunhui@bytedance.c=
om> wrote:
> >
> > Hi Doug,
> >
> > On Fri, Sep 26, 2025 at 4:00=E2=80=AFAM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, Sep 25, 2025 at 1:48=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedan=
ce.com> wrote:
> > > >
> > > > @@ -17,6 +17,7 @@
> > > >  #include <linux/cpu_pm.h>
> > > >  #include <linux/export.h>
> > > >  #include <linux/kernel.h>
> > > > +#include <linux/nmi.h>
> > > >  #include <linux/perf/arm_pmu.h>
> > > >  #include <linux/slab.h>
> > > >  #include <linux/sched/clock.h>
> > > > @@ -696,10 +697,12 @@ static int armpmu_get_cpu_irq(struct arm_pmu =
*pmu, int cpu)
> > > >         return per_cpu(hw_events->irq, cpu);
> > > >  }
> > > >
> > > > -bool arm_pmu_irq_is_nmi(void)
> > > > +#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
> > > > +bool arch_perf_nmi_is_available(void)
> > > >  {
> > > >         return has_nmi;
> > > >  }
> > > > +#endif
> > >
> > > Should the previous comment move here, AKA:
> > >
> > > /*
> > >  * hardlockup_detector_perf_init() will success even if Pseudo-NMI tu=
rns off,
> >
> > Okay, we also need to change it to =E2=80=9Cwatchdog_hardlockup_probe()=
=E2=80=9D
> >
> > >  * however, the pmu interrupts will act like a normal interrupt inste=
ad of
> > >  * NMI and the hardlockup detector would be broken.
> > > */
> > >
> > >
> > > > +static int __init init_watchdog_freq_notifier(void)
> > > > +{
> > > > +       return cpufreq_register_notifier(&watchdog_freq_notifier,
> > > > +                                        CPUFREQ_POLICY_NOTIFIER);
> > >
> > > I think you need to do something to prevent this from happening on an=
y
> > > platforms that override hw_nmi_get_sample_period(), right? These
> > > cpufreq notifiers will be useless in that case...
> >
> > I understand this is not a problem. watchdog_perf uses
> > PERF_COUNT_HW_CPU_CYCLES, which means it is inherently limited by the
> > CPU's main frequency. After we make such a change, a larger value may
> > be used as the period, so the NMI period will become longer, but this
> > value will not change after the system starts.
>
> I'm not sure I follow. On x86, hw_nmi_get_sample_period() is:
>
> u64 hw_nmi_get_sample_period(int watchdog_thresh)
> {
>   return (u64)(cpu_khz) * 1000 * watchdog_thresh;
> }

I have added the maintainers for arch/x86.

1. cpu_khz can be understood as returning the base operating frequency
of a CPU, such as 2.3GHz. In practice, the CPU's core frequency may
downclock to 800MHz under low load and overclock to 4.4GHz under high
load.

2. Because the event provided to the PMU has the
PERF_COUNT_HW_CPU_CYCLES attribute, and the counter's value is based
on 2.3GHz, the execution cycle of watchdog_overflow_callback() is not
fixed; it varies with the CPU's core frequency. When the CPU runs at a
frequency higher than 2.3GHz, the NMI cycle will shorten; otherwise,
it will lengthen.

3. After our modification, if the architecture is not integrated with
cpufreq, it returns 0 and will not update the cycle. If integrated
with cpufreq, it returns the maximum frequency supported by the CPU,
so the NMI cycle is only slightly lengthened, with no impact on the
actual hardlockup detection function.

4. I have also conducted tests:
stress-ng --cpu 1 --taskset 1 --cpu-load 80
echo 800000 > scaling_max_freq
turbostat shows that Bzy_MHz and TSC_MHz are 800 and 2300 respectively.
And the NMI cycle became approximately 30 seconds:
[ 2309.442743] NMI watchdog: ------ watchdog overflow callback, cpu =3D 1
[ 2341.526032] NMI watchdog: ------ watchdog overflow callback, cpu =3D 1



>
> On PowerPC it's:
>
> u64 hw_nmi_get_sample_period(int watchdog_thresh)
> {
>   return ppc_proc_freq * watchdog_thresh;
> }
>
> Neither of those are necessarily based on the results the cpufreq
> reports. ...so therefore I don't think you should be taking the
> cpufreq reported numbers and assuming they're OK on x86 and powerpc.
>
> -Doug
>

Thanks,
Yunhui

