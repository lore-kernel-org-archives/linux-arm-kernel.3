Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C36CCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 22:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWwi2YKfcBmpXzN2h2HKSfYkQo0+gXnuV1TKOkK9JPg=; b=SLBcPK+p+Xaxl8NrNQ54onTtsY
	+kgs5+8to3YeTJq7cLHBPce6AO8XeGFgA2c09VW3ts5Z04D419z5GnSuFFyEMo0iUVBbkvCdnYuLl
	/pOEQlFLs6okOv/T7TIcBr9RoLOVJb6h9GQEstMvCnXIAjhmPM9bHNJeoXzzGGAA89AH72OsN4Ryd
	jCAc7jaj0uI1wKdNIbkh65IJHZyQckwY5Wc0+yO8T2hIuBePjc37etHeyuxhqjD+Ftmtgw4c9vcXZ
	MDLxKDBbR0gK+KJA7LfnXbSEUOK9JXlamTFg/SR0cFdp8yWCWVRDXoH8GiP4ATDQLDk1K0sK4yoJf
	nkySVYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Mmc-00000003ac1-0HpU;
	Mon, 29 Sep 2025 22:55:50 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3MmZ-00000003abZ-3dTW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 22:55:49 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7835321bc98so2319039b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 15:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759186547; x=1759791347; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWwi2YKfcBmpXzN2h2HKSfYkQo0+gXnuV1TKOkK9JPg=;
        b=BxjdYvDcgqGF0NPXRPYsUtW1GiIaPa6CA/rpLDy3Q0jQP5lgFnK86rmbw8zOkApAuA
         WBkxjpQEr5/0l6FaXEj0fq+nz1OGDcgrw90QBGD8lerYrRnZwNObGOZqkKkGEPUEM8Y9
         /8jV99nRLz57FnwwNcFXKdPAs3Hp/afw7w1SY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759186547; x=1759791347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWwi2YKfcBmpXzN2h2HKSfYkQo0+gXnuV1TKOkK9JPg=;
        b=iq68Kvgfh/rJm73iKJqWK6Rk6n5H1SizyCdaSaz8gsXKXdykTn9n5g1VhbZ5IslB7r
         YsvdtMA0GqS0NjkN0xgVaAshJG6klV1pZkJ1gXxlWWp8C3u0NqqTzhGJrIb/dcK2cZFU
         0qezYv5W1jSuAEEfPCHsmufY7ExNXrFyIutxMeHU7QEXbh4uP+ZmvicpWuSucd7ChM5G
         qFQs0csyoYmSPNNV1y++1+1sVi5AEu/9+hQJqMw5rCXaZ4H30l7AYP6zbk6J1vRFAsiX
         vDDtYfuoMfR0GSUGbjX7oihVQKLaWFiVwBmqwr/4R+pGf2E8dcdlyhmC2G4Uz2kODUyG
         yuYA==
X-Forwarded-Encrypted: i=1; AJvYcCUL35604AjoBPSgj/0Ab0c3RPNz1zZDoTe1Pt9MBxR4oF4ziNMMCA8uYT+J+dFzqihLTRVTqaZeL5/uO4ktygRH@lists.infradead.org
X-Gm-Message-State: AOJu0YwiGMtta33qxXpqeVr1pcSB5uRj4SaBAM4oHRJ4Cgk5XqggQh+z
	IAYR9jSVrU/hdGbnU6rOdZI31g+Fw4WSJxaJB4jM0ACA1baNjWadNWq3nzr0ibp8Mnqrn6XlWST
	fh+U=
X-Gm-Gg: ASbGncvqzUCX1YbHslSp/CQJRNjewKK9gUNWwnyuUlvuyeSmwwCzMlQuSv2NAxC3P70
	Lh05W5f6zElnH81O7tzAX3bTQNuw46u8lrEMzB2SrC+IeaUNWM8fxi8T1DMN+o5jojsdSLq5Suy
	5jL0soQl30lkWD/AEJQ90WfDxoDfu47frWbDiOhMkaZtnrVuyL4l3c6iO4bRPQG/G0pbL1jq+BC
	wKLheOuvcApPF5a1obwbEEsbowaXy2r9koIOSqbT2wvXYv5J/KC8rRtZHEi2jy6MEA3giU/3mdM
	VNdeM/HaQuV2XzUnbT0rd4/K/QBcltY6paBke8iCD7+EuwCeE/Dpu4O8ItJV+E1IOOlNDJgonam
	KdRFYBiZDK8NBMQESvYE7PEG8mbGn7qaXBIYUtZReYYVW1wsCfX1v2KMD+JxpFeNdGFCEA/gwWy
	HK
X-Google-Smtp-Source: AGHT+IHEhq0pd2zFJVw/8Epzpr6VDWchQS6cqS8QFthQr8alu2jJ5WEsHjj27uV/lMaWT2lJWpbaVg==
X-Received: by 2002:a05:6a21:339e:b0:2f6:9592:9075 with SMTP id adf61e73a8af0-2f69592cce3mr16528996637.25.1759186546726;
        Mon, 29 Sep 2025 15:55:46 -0700 (PDT)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com. [209.85.215.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b231ebsm12088680b3a.52.2025.09.29.15.55.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 15:55:46 -0700 (PDT)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b57f08e88bcso2902001a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 15:55:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUy3JUyCfkXYXN83x/hb0PRzCfEwX2c2AS5zdCXv3noZ3Ql0H8RbACk2LIE217+m9lMlLdIg6omH1FmFQtb9J04@lists.infradead.org
X-Received: by 2002:a17:903:2291:b0:27e:dc53:d222 with SMTP id
 d9443c01a7336-27edc53d5ddmr177688785ad.44.1759186545584; Mon, 29 Sep 2025
 15:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250925084806.89715-1-cuiyunhui@bytedance.com>
 <20250925084806.89715-2-cuiyunhui@bytedance.com> <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
 <CAEEQ3wnwNdTgt6ByHCzM43fhZMLSxwXvYx-AGBpsktraXqif2Q@mail.gmail.com>
 <CAD=FV=X6Xv_WYPMXKtOWLJX7skCoQmia3JbQej_u38qxqAbqDg@mail.gmail.com> <CAEEQ3wn0UckgNTJCPCNDtHW8DwWAJR1PXURvH57yfHATYqs7Gw@mail.gmail.com>
In-Reply-To: <CAEEQ3wn0UckgNTJCPCNDtHW8DwWAJR1PXURvH57yfHATYqs7Gw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Sep 2025 15:55:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XoUw6HWoFLMcgyHhYm7oeTOXCAyvBdpOghggmdvYzp6Q@mail.gmail.com>
X-Gm-Features: AS18NWAnKZZMEtwxIM0YbV4Mazpr4rnQGlLmvr3-cqjcbEOsSH_1wE2lEHBVzYs
Message-ID: <CAD=FV=XoUw6HWoFLMcgyHhYm7oeTOXCAyvBdpOghggmdvYzp6Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/2] watchdog: move arm64 watchdog_hld
 into common code
To: yunhui cui <cuiyunhui@bytedance.com>
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
X-CRM114-CacheID: sfid-20250929_155547_944523_E687A5AA 
X-CRM114-Status: GOOD (  41.31  )
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

On Sat, Sep 27, 2025 at 7:38=E2=80=AFPM yunhui cui <cuiyunhui@bytedance.com=
> wrote:
>
> Hi Doug,
>
> On Sat, Sep 27, 2025 at 4:58=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Fri, Sep 26, 2025 at 2:37=E2=80=AFAM yunhui cui <cuiyunhui@bytedance=
.com> wrote:
> > >
> > > Hi Doug,
> > >
> > > On Fri, Sep 26, 2025 at 4:00=E2=80=AFAM Doug Anderson <dianders@chrom=
ium.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Thu, Sep 25, 2025 at 1:48=E2=80=AFAM Yunhui Cui <cuiyunhui@byted=
ance.com> wrote:
> > > > >
> > > > > @@ -17,6 +17,7 @@
> > > > >  #include <linux/cpu_pm.h>
> > > > >  #include <linux/export.h>
> > > > >  #include <linux/kernel.h>
> > > > > +#include <linux/nmi.h>
> > > > >  #include <linux/perf/arm_pmu.h>
> > > > >  #include <linux/slab.h>
> > > > >  #include <linux/sched/clock.h>
> > > > > @@ -696,10 +697,12 @@ static int armpmu_get_cpu_irq(struct arm_pm=
u *pmu, int cpu)
> > > > >         return per_cpu(hw_events->irq, cpu);
> > > > >  }
> > > > >
> > > > > -bool arm_pmu_irq_is_nmi(void)
> > > > > +#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
> > > > > +bool arch_perf_nmi_is_available(void)
> > > > >  {
> > > > >         return has_nmi;
> > > > >  }
> > > > > +#endif
> > > >
> > > > Should the previous comment move here, AKA:
> > > >
> > > > /*
> > > >  * hardlockup_detector_perf_init() will success even if Pseudo-NMI =
turns off,
> > >
> > > Okay, we also need to change it to =E2=80=9Cwatchdog_hardlockup_probe=
()=E2=80=9D
> > >
> > > >  * however, the pmu interrupts will act like a normal interrupt ins=
tead of
> > > >  * NMI and the hardlockup detector would be broken.
> > > > */
> > > >
> > > >
> > > > > +static int __init init_watchdog_freq_notifier(void)
> > > > > +{
> > > > > +       return cpufreq_register_notifier(&watchdog_freq_notifier,
> > > > > +                                        CPUFREQ_POLICY_NOTIFIER)=
;
> > > >
> > > > I think you need to do something to prevent this from happening on =
any
> > > > platforms that override hw_nmi_get_sample_period(), right? These
> > > > cpufreq notifiers will be useless in that case...
> > >
> > > I understand this is not a problem. watchdog_perf uses
> > > PERF_COUNT_HW_CPU_CYCLES, which means it is inherently limited by the
> > > CPU's main frequency. After we make such a change, a larger value may
> > > be used as the period, so the NMI period will become longer, but this
> > > value will not change after the system starts.
> >
> > I'm not sure I follow. On x86, hw_nmi_get_sample_period() is:
> >
> > u64 hw_nmi_get_sample_period(int watchdog_thresh)
> > {
> >   return (u64)(cpu_khz) * 1000 * watchdog_thresh;
> > }
>
> I have added the maintainers for arch/x86.
>
> 1. cpu_khz can be understood as returning the base operating frequency
> of a CPU, such as 2.3GHz. In practice, the CPU's core frequency may
> downclock to 800MHz under low load and overclock to 4.4GHz under high
> load.
>
> 2. Because the event provided to the PMU has the
> PERF_COUNT_HW_CPU_CYCLES attribute, and the counter's value is based
> on 2.3GHz, the execution cycle of watchdog_overflow_callback() is not
> fixed; it varies with the CPU's core frequency. When the CPU runs at a
> frequency higher than 2.3GHz, the NMI cycle will shorten; otherwise,
> it will lengthen.
>
> 3. After our modification, if the architecture is not integrated with
> cpufreq, it returns 0 and will not update the cycle. If integrated
> with cpufreq, it returns the maximum frequency supported by the CPU,
> so the NMI cycle is only slightly lengthened, with no impact on the
> actual hardlockup detection function.
>
> 4. I have also conducted tests:
> stress-ng --cpu 1 --taskset 1 --cpu-load 80
> echo 800000 > scaling_max_freq
> turbostat shows that Bzy_MHz and TSC_MHz are 800 and 2300 respectively.
> And the NMI cycle became approximately 30 seconds:
> [ 2309.442743] NMI watchdog: ------ watchdog overflow callback, cpu =3D 1
> [ 2341.526032] NMI watchdog: ------ watchdog overflow callback, cpu =3D 1

Whether or not having x86 and powerpc start looking at cpufreq is an
improvement, certainly it is a change in behavior, right? If we're
really changing the behavior here then the commit subject and commit
message need to mention this. Right now this is billed as a simple
rename...

I don't personally have lots of experience with x86 cpufreq but I do
know it doesn't work quite the same as how it does on arm. It would
definitely be good to get someone on x86 / powerpc to make sure that
they are happy with this. ...or you just keep making it work the way
it did before and then you don't have to worry about getting any
buy-in from x86 / powerpc folks. Up to you, I guess.

Note that folks on x86 have definitely had to deal with turbo mode
before.  See commit 7edaeb6841df ("kernel/watchdog: Prevent false
positives with turbo modes").

-Doug

