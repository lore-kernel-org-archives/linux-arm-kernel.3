Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B30AC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 02:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//1TOs6hKn7JmOjI+FRAX0WXPzQCUya/d3paJfhNqh0=; b=oQC70UNhuGyDGKJNmMaFdbFWXY
	3blt8NWZBl4h9tAMN+YCNoWO4NnHk+puGSKx+Hq2RNJOObBx3wfpDAXcWAt+7hfQ849tOCMj96JlZ
	DqEGSELKa0o1reuimXLPJnbCKdxXSoiEcTKqxBlWZQvjSDDZvzi8EnVrX6uuODXEHybUak7jF3AfF
	6WdOxsUdocV48d5O5n0nUC5XnHPSa7tIrBP2p+5xgxsc6AzPymNnHQP5ePRyc+DiraYBqGXEqay0x
	/G0nSgcOaFSby0UTyWI/vy4pmYD7uHtCNFTU534+7HhjZdsa4u1f22RzZBvoOZyU6r+aSl9HqQw0o
	C5Oy/sag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsuQC-0000000CvVn-2eKP;
	Fri, 14 Mar 2025 02:05:12 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsuOX-0000000CvQ3-0lYD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 02:03:30 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30c461a45f8so7138461fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 19:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741917806; x=1742522606; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//1TOs6hKn7JmOjI+FRAX0WXPzQCUya/d3paJfhNqh0=;
        b=Q5luYic+8tX9Pb8gaWmGlUxVN5U66YD+VtyJcZ4OlEX8vS2Ea4SRbBFR7Esnqumadj
         eLn6wqrGxnRT1qMn1WtP6Svgqk8kXPZMizs9XvtWP+OjM55AlFTbPqsMcJXiPAbxK7cT
         AaW7WqWykWfLADRFpcIy1tcNqI0bwOucY5iW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741917806; x=1742522606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//1TOs6hKn7JmOjI+FRAX0WXPzQCUya/d3paJfhNqh0=;
        b=RyPuC07QRmOnrSI3ZsgForcRqVidCxPlgXdfy+E4O0VsW5s/kvBw3Czw+iykZh0ihw
         OVoNZZko74oXTvi8jZBtBeG1iScvcQphRvlnvzGOg96G7jzILvfVhF2Auok724ch6/zw
         yq2U91Sh+8R5m/Uipbx6DMfq+iVSR5P5YH6HI5j+CWxyYWDrbvX4kBS/L8nU9DzQM3oL
         lJVJLmEDQovTrRnfuHHRl0atPqdeU/b/6og2B26l7U2UQHxZHIrzsqOQpFTbd5ZDIhmO
         55uWelAspu/e4PlA+OwRZfllokMBkZDLY26OJtBLygMIB0JMsUGD8pJcYqek6mfgK47n
         6Gkw==
X-Forwarded-Encrypted: i=1; AJvYcCXwXEFxS2ZL7DhvO0mAXkBxWXgtM795ORYxHJROvoZFOv/pkgAZKFgAWl1B0NyHXLR6LsmTr4lfk6UOB/e1h0aT@lists.infradead.org
X-Gm-Message-State: AOJu0YzXLySyvNTJsdoEf/iS9cHabibyta+B01Z7fLIDFdP3bUpDifyT
	eEWA0R+Yffd8q3u6posGGmASIQLoghVV7OqnqsDKeGACPUmTsI9J4qqgDJDwG0bv2KHCrClB9/N
	jUw==
X-Gm-Gg: ASbGnculvSlt0kIJv2RexSKfjtaDfvpMYMONUbMrmb1E9HvvSbisYVyYlQrEUBKSZqW
	atv3jvTkCRwc5u8NSs7mClg06pAuC9E5gEbNwqBZfJKiNFQXgnHLggjjv8nmSEWX9OtnCyqOybi
	4f81Mv7LVU0PQbkbe9adGivp1OpAYWw9sEqDRW22YpSHFmJu17+EcrkRz1DktQg+C2T+AdgsTuF
	CNm1cVCPT8RSqJim9/3MIAePj9349E6y9tD0BkBE4VReHgXwAU2p2Bg19Of+Ev014Wc9hnlIWFi
	9rpR3YXUh+2PErUobQyDpzDX4pqowt4KRNusYEobLxWKaS8EyARK+LaLiSBmxC9cysF5hY+nfVp
	ybyINR34f
X-Google-Smtp-Source: AGHT+IG7axoRzP+GBq6KVL0mlzsN/yZWPWWa24rlcq7VM0+HS/hXJboLIiNuAQz8bQQNux0WvfSjog==
X-Received: by 2002:a05:6512:10d6:b0:549:b0f3:43a0 with SMTP id 2adb3069b0e04-549c391a806mr182409e87.27.1741917806187;
        Thu, 13 Mar 2025 19:03:26 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7c0336sm370881e87.68.2025.03.13.19.03.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 19:03:24 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5499e3ec54dso1732509e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 19:03:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXW05qva/A4fV+Wl7nGc3XAMElV95zbJdTqwqmqmWy6E6ibcSr+MbpyT6NZAvtgVK5IyGSXYtEORLwDBT5COnOG@lists.infradead.org
X-Received: by 2002:a05:6512:ac6:b0:549:792a:a382 with SMTP id
 2adb3069b0e04-549c3989a87mr304225e87.32.1741917803652; Thu, 13 Mar 2025
 19:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250307021811.46981-1-yangyicong@huawei.com> <20250307021811.46981-3-yangyicong@huawei.com>
 <CAD=FV=XLn9Dz8rhRnjTKdbbeS3YP+XZFzpSV0C6+DakWOUmMpA@mail.gmail.com>
 <99a3afd4-6e16-0f39-9d2a-f629457dd756@huawei.com> <CAD=FV=Wy9-nDW-F+R1Aob6GOfP1Cnmr1gKkCO+WebA8ES7uu8A@mail.gmail.com>
 <260393cc-614a-b5c1-0e04-8443e00a7991@huawei.com>
In-Reply-To: <260393cc-614a-b5c1-0e04-8443e00a7991@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Mar 2025 19:03:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XhMnGWAQ19n6_O2QTkXNu_+NkA+R=4X_w+-Vewpd55ng@mail.gmail.com>
X-Gm-Features: AQ5f1JpkeNT24Ng1uHh3yvUBJLTc566c88DDoAUerASay_Kh0djoHZt8iV5y0O0
Message-ID: <CAD=FV=XhMnGWAQ19n6_O2QTkXNu_+NkA+R=4X_w+-Vewpd55ng@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250313_190329_252245_6A217EF6 
X-CRM114-Status: GOOD (  36.90  )
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

On Wed, Mar 12, 2025 at 12:48=E2=80=AFAM Yicong Yang <yangyicong@huawei.com=
> wrote:
>
> >>>> +static int __init init_watchdog_freq_notifier(void)
> >>>> +{
> >>>> +       return cpufreq_register_notifier(&watchdog_freq_notifier,
> >>>> +                                        CPUFREQ_POLICY_NOTIFIER);
> >>>> +}
> >>>> +core_initcall(init_watchdog_freq_notifier);
> >>>
> >>> I haven't dug into everything, but don't you have a potential blind
> >>> spot, though? What if the order is this:
> >>>
> >>> 1. hw_nmi_get_sample_period() is called
> >>> 2. cpufreq driver probes
> >>> 3. init_watchdog_freq_notifier() initcall runs
> >>>
> >>> Since the cpufreq driver proved before you registered for the
> >>> notifier, won't you miss the creation of the policy? Maybe instead of
> >>> registering for an initcall you should somehow trigger off the first
> >>> call to hw_nmi_get_sample_period() and register at that point in time=
?
> >>>
> >>
> >> for arm64 the watchdog_perf is registered after armv8 PMU driver's ini=
t,
> >> so the sequence is like:
> >>
> >> # core_initcall
> >> init_watchdog_freq_notifier()
> >> # device_initcall
> >> armv8_pmu_driver_init()
> >>   lockup_detector_retry_init()
> >>     schedule_work(&detector_work);
> >> # in detector work
> >> hw_nmi_get_sample_period() // notifier's already been registered
> >>
> >> so we'll always get the correct frequency, either by the cpufreq
> >> already registered or by the notifier which will update the
> >> frequency. Please correct me if I missed anything :)
> >
> > Hmm, OK. So this relies on the fact that because the
> > init_watchdog_freq_notifier() is at "core" level that it'll pretty
> > much init before any of the other things. This type of thing is always
> > a little fragile but I guess it's OK.
> >
> > What about if the order is different though? Again, I haven't traced
> > through it all, but I'm thinking:
> >
> > # core_initcall
> > init_watchdog_freq_notifier()
> > # device_initcall
> > <cpufreq driver policy is created>
> >
> > Now hardlockup_detector_perf_adjust_period() will be called before
> > armv8_pmu_driver_init(). Is that a problem?
>
> it doesn't matter, since in this situation:
>
> # device_initcall
> <cpufreq driver policy is created>
>   hardlockup_detector_perf_adjust_period()
>     if (!event) // armv8_pmu_driver_init() not called, not event created
>       return;
> # later after armv8_pmu_driver_init()
> hw_nmi_get_sample_period() // since cpufreq already been registered, we c=
an
>                            // get the accurate cpufreq

Got it. Sorry for asking the dumb questions--I didn't have time to dig
through the code earlier this week. Yeah, looks like it should be OK.


> > I guess even worse would be if async probe was on and the cpufreq
> > driver and PMU driver were running at the same time?
> >
>
> I think there're 2 cases here:
> 1) cpufreq initialized before hw_nmi_get_sample_period() called, in which
>    case the cpufreq is accurate when create the event
> 2) hw_nmi_get_sample_period() called before cpufreq driver's initialized,
>    in which case we rely on the notifier call to adjust the event's perio=
d
>
> May need further check to see if there's any race window here, but the wo=
rst
> case will be using the inaccurate cpufreq (5GHz) for calculating the peri=
od.

OK, sure. _Maybe_ there could be some small race if these two things
are happening at exactly the same time on two different cores:

core 1:
* lockup_detector_delay_init()
* watchdog_hardlockup_probe()
* hardlockup_detector_event_create()
* hw_nmi_get_sample_period()
* No cpufreq driver, so returns SAFE_MAX_CPU_FREQ

core 2:
* cpufreq driver probes + policy is created
* "event" hasn't been created yet, so your new code is a no-op

core 1:
* event gets created based on SAFE_MAX_CPU_FREQ.

Did I get that right?

That doesn't feel _completely_ impossible especially since
lockup_detector_delay_init() is already running on a separate
workqueue. As you said, though, the worst case is it looks like we'll
just end up with how things were before your patch series.

In any case, I guess it's pretty unlikely, but maybe it wouldn't be
very hard to add a mutex in there? It doesn't feel like that would add
much overhead...

-Doug

