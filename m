Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427B4C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 15:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LQAfzk8v+RBqv5u3A3kBq2H/sguGs6IKLT8p7KewFFU=; b=apEsLnxU7L95rH50SCGaLYwapj
	rQ9pxT2dD5c9Lv5Kz1zHRPkwykQh7Jopc6Joaech4VlzTS6FJebXqvckTN3QE+ZBv5oifsfTNX5wv
	oL8qUr53cZFDKaTcC5NT//G859dCCFR9e5GYy5ejO0jM5kU6XesOl1iDOpzXIPR91qP2zV9KYAG6l
	tIkZjdW/MugGqhbaj+WYQ2HmzNd08bTGsN0nf3ciNLNlvc8E0yqkv4+J55tj0uir9VBN/qwK+OfYl
	ai2OW8sAIxAf+DWWj7UYu6NIRNfQw0fCk8vHL3wfsnZxA6aoCUBw8H029YARL8wzTtKNO7cyhg/vv
	X8xGqH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1lq-00000006Blk-2pyX;
	Tue, 11 Mar 2025 15:43:54 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1kA-00000006BVu-2uPw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 15:42:11 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5497590ffbbso6378109e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 08:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741707722; x=1742312522; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQAfzk8v+RBqv5u3A3kBq2H/sguGs6IKLT8p7KewFFU=;
        b=bXSu7//6b9FTa3xRm4IwxPFoT9Gb1U4sXb2DEgCDgVdBR/PPC70gllSt1MPVwFpmTC
         ApE38sfCvweTAUDLi4vxmP5a3sEibHVcynGBVr57RDu1vKxi1RNH+E7HYi9URVF1RJVm
         0B/bptKctrLSRFVjwGfJ+zX2cm4Np9Nry9mAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741707722; x=1742312522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQAfzk8v+RBqv5u3A3kBq2H/sguGs6IKLT8p7KewFFU=;
        b=WF30l2IfuvfhK+BBXUIbOGiTX4P6nRAvYHNgJ1FMltZ/KpyQTOSncj526bMvUNWWrU
         9dyPizQdkEVQV5cOO2i0EcvxFM3wH2gTEGxB1hvDsHKsRBHauGqLlgjEtKnSpiC5gO9R
         YIuVaXAwFhOGfiFxYZyZ2Ia7sv9ClTQ5ALxLtyxQBhbk/OfLCSzGSgxM5HSABQ+XJYgI
         ogVSK5/4T/NVaD0kBlnDTwSuUOJzhFaE30NlLBwEcthOlG1BmNOQhcy5YcDAW6YHoo4m
         Z0WLf2VYQxPCJBHg0qwlgOXSuazM+4CMxlMSk1Lsc3f1/2LJKB6aZ9sLbHHuMPMh+O03
         6wBg==
X-Forwarded-Encrypted: i=1; AJvYcCViAN8/G3LE1wUF9HBOAzxddw14dTEB7wHwsDspiv0BFmx0K/bLeNXjOGaCNyue6fjAR9mZWNhnUL79vyNcB0ct@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6kLFdPuyfMymdC3S0Mc37Kyi5oqlWY3FHDnj+FblkR+aYI5cM
	fkQqN2Wz7Tby8jnZtD/m2e6CGj0JtH8GiHzIKNgM/N0oEJt8BmrpuvhtK8lS2ebDvcdu+WxsxTJ
	htw==
X-Gm-Gg: ASbGncvm25PqKfL8Q8jLNdLPUY/2SPP9f9nwhs15dmQn8Mh2urBYC4YSA7CMy3pnI+G
	ub7w2kuWlpcBWxnJOGltCefmJb7hVfoz3n8JA9VDnkkeLx1y9gfw+SVraOiGaYHsedt043C6+8c
	lRp8XiD7KVcixj/D5uj2JAc6/9xA5xwwKcPUXY0nO47gTtgPalzLwFJFhUX0j2FPufZcizDCAdL
	HRMxKW0tKvIoDQZw8uFDqy+RJfZOdxndWtJGx0f+ypAsAgXvTRJ/n3Cgd3xqqXg5KdKHgcpE6Pz
	vV6vBx/6aUOfi0aWNwIpdECM3S045jzTgYXBc40JC4Jz+ZtIx2PARIjZGRrG2lrl0mEp0fR+4Vv
	npBbW5lsn
X-Google-Smtp-Source: AGHT+IElJiKqLwM1nu2akPYEyNDCRaSGXatY3xaUFgPqalGVkMnBYFozyfty9AxakVAu40aZ1bOXBA==
X-Received: by 2002:a05:6512:3988:b0:545:2e76:495c with SMTP id 2adb3069b0e04-54990e6729dmr4585589e87.25.1741707722001;
        Tue, 11 Mar 2025 08:42:02 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae591e1sm1834707e87.102.2025.03.11.08.41.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 08:42:01 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-549b12ad16eso102027e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 08:41:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5tu36uvLp4bj/yxbDT5FPhsYHERbDXmwgYeP07AGCiAvu7vEEICQD6L0zGFpIZ35dovydQAAbJyg1kOOHkIEz@lists.infradead.org
X-Received: by 2002:a05:6512:ad1:b0:547:6733:b5a3 with SMTP id
 2adb3069b0e04-54990e6763fmr6551630e87.28.1741707719305; Tue, 11 Mar 2025
 08:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250307021811.46981-1-yangyicong@huawei.com> <20250307021811.46981-3-yangyicong@huawei.com>
 <CAD=FV=XLn9Dz8rhRnjTKdbbeS3YP+XZFzpSV0C6+DakWOUmMpA@mail.gmail.com> <99a3afd4-6e16-0f39-9d2a-f629457dd756@huawei.com>
In-Reply-To: <99a3afd4-6e16-0f39-9d2a-f629457dd756@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Mar 2025 08:41:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wy9-nDW-F+R1Aob6GOfP1Cnmr1gKkCO+WebA8ES7uu8A@mail.gmail.com>
X-Gm-Features: AQ5f1JrxHGUrxyfA9NxefIeyyGTnErHH--t0pPyT8xYU19zPrAvx8R-DhV-hVkE
Message-ID: <CAD=FV=Wy9-nDW-F+R1Aob6GOfP1Cnmr1gKkCO+WebA8ES7uu8A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64/watchdog_hld: Add a cpufreq notifier for update
 watchdog thresh
To: Yicong Yang <yangyicong@huawei.com>
Cc: yangyicong@hisilicon.com, catalin.marinas@arm.com, will@kernel.org, 
	akpm@linux-foundation.org, sumit.garg@linaro.org, kernelfans@gmail.com, 
	lecopzer.chen@mediatek.com, tglx@linutronix.de, song@kernel.org, 
	linux-arm-kernel@lists.infradead.org, jonathan.cameron@huawei.com, 
	zhanjie9@hisilicon.com, prime.zeng@hisilicon.com, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_084210_757547_4EADE1E7 
X-CRM114-Status: GOOD (  41.00  )
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

On Tue, Mar 11, 2025 at 1:33=E2=80=AFAM Yicong Yang <yangyicong@huawei.com>=
 wrote:
>
> On 2025/3/8 0:53, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Mar 6, 2025 at 6:18=E2=80=AFPM Yicong Yang <yangyicong@huawei.c=
om> wrote:
> >>
> >> From: Yicong Yang <yangyicong@hisilicon.com>
> >>
> >> arm64 depends on the cpufreq driver to gain the maximum cpu frequency
> >> to convert the watchdog_thresh to perf event period. cpufreq drivers
> >> like cppc_cpufreq will be initialized lately after the initializing of
> >> the hard lockup detector so just use a safe cpufreq which will be
> >> inaccurency. Use a cpufreq notifier to adjust the event's period to
> >> a more accurate one.
> >>
> >> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> >> ---
> >>  arch/arm64/kernel/watchdog_hld.c | 34 +++++++++++++++++++++++++++++++=
+
> >>  1 file changed, 34 insertions(+)
> >>
> >> diff --git a/arch/arm64/kernel/watchdog_hld.c b/arch/arm64/kernel/watc=
hdog_hld.c
> >> index dcd25322127c..719ae39e8bc0 100644
> >> --- a/arch/arm64/kernel/watchdog_hld.c
> >> +++ b/arch/arm64/kernel/watchdog_hld.c
> >> @@ -34,3 +34,37 @@ bool __init arch_perf_nmi_is_available(void)
> >>          */
> >>         return arm_pmu_irq_is_nmi();
> >>  }
> >> +
> >> +static int watchdog_freq_notifier_callback(struct notifier_block *nb,
> >> +                                          unsigned long val, void *da=
ta)
> >> +{
> >> +       struct cpufreq_policy *policy =3D data;
> >> +       unsigned long max_cpu_freq;
> >
> > Feels like max_cpu_freq should be a u64. It probably should have been
> > u64 in hw_nmi_get_sample_period() as well. Otherwise you could end up
> > with a problem if the max CPU frequency is above ~4.3GHz and "unsigned
> > long" is 32-bits (I think it technically could be?)
> >
>
> I guess this won't happen for arm64 and we're in kernel space. here I
> keep the same type with hw_nmi_get_sample_period() which is also using
> "unsigned long".

I guess I won't insist, but given that you use u64 explicitly
elsewhere it feels like you should be explicit that you need 64-bits
here too.


> >> +       for_each_cpu(cpu, policy->cpus) {
> >> +               max_cpu_freq =3D cpufreq_get_hw_max_freq(cpu) * 1000UL=
;
> >> +               if (!max_cpu_freq)
> >> +                       continue;
> >> +
> >> +               new_period =3D watchdog_thresh * max_cpu_freq;
> >> +               hardlockup_detector_perf_adjust_period(cpu, new_period=
);
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static struct notifier_block watchdog_freq_notifier =3D {
> >> +       .notifier_call =3D watchdog_freq_notifier_callback,
> >> +};
> >> +
> >> +static int __init init_watchdog_freq_notifier(void)
> >> +{
> >> +       return cpufreq_register_notifier(&watchdog_freq_notifier,
> >> +                                        CPUFREQ_POLICY_NOTIFIER);
> >> +}
> >> +core_initcall(init_watchdog_freq_notifier);
> >
> > I haven't dug into everything, but don't you have a potential blind
> > spot, though? What if the order is this:
> >
> > 1. hw_nmi_get_sample_period() is called
> > 2. cpufreq driver probes
> > 3. init_watchdog_freq_notifier() initcall runs
> >
> > Since the cpufreq driver proved before you registered for the
> > notifier, won't you miss the creation of the policy? Maybe instead of
> > registering for an initcall you should somehow trigger off the first
> > call to hw_nmi_get_sample_period() and register at that point in time?
> >
>
> for arm64 the watchdog_perf is registered after armv8 PMU driver's init,
> so the sequence is like:
>
> # core_initcall
> init_watchdog_freq_notifier()
> # device_initcall
> armv8_pmu_driver_init()
>   lockup_detector_retry_init()
>     schedule_work(&detector_work);
> # in detector work
> hw_nmi_get_sample_period() // notifier's already been registered
>
> so we'll always get the correct frequency, either by the cpufreq
> already registered or by the notifier which will update the
> frequency. Please correct me if I missed anything :)

Hmm, OK. So this relies on the fact that because the
init_watchdog_freq_notifier() is at "core" level that it'll pretty
much init before any of the other things. This type of thing is always
a little fragile but I guess it's OK.

What about if the order is different though? Again, I haven't traced
through it all, but I'm thinking:

# core_initcall
init_watchdog_freq_notifier()
# device_initcall
<cpufreq driver policy is created>

Now hardlockup_detector_perf_adjust_period() will be called before
armv8_pmu_driver_init(). Is that a problem?

I guess even worse would be if async probe was on and the cpufreq
driver and PMU driver were running at the same time?


-Doug

