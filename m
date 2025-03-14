Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47447C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 09:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+cfzX22IbBOLxyOqDg7iqnovY5rmZuB+AfJrOsUu/k=; b=gJtU9FHa5rH5tFhYsrtKA/Xvkh
	SrJ20OJy9NuuQuSwZEtW71p17qu1Op2BwHImlM52KIYAzKQ2+5nBECqeX8aRYYp+r+dT5YuZrvMCI
	rRoeBwvQZ24WH00bToRRpevL6jQ0l3gVsrD9Wretxz44WwwaSrFE2TqAD7ycNCnBo8Va0Gn48uXn+
	dYjuu7qXDLAm4+FUZtLBxtmEDoYVsxILrLY8YZaXaWNYFq5nLGdTPZpjI0b+yf10e6SJgJAregMpV
	4S7zRu6BSWPvCXyHCCTIDUanD4TQdWv6YEMMCBk08lZQoBEnaY/dEjBdOrhH9erEDkzN+ntXWlmTY
	mtLJdKAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1SK-0000000Dgzb-2UiD;
	Fri, 14 Mar 2025 09:35:52 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1Qe-0000000DgcT-1EL9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 09:34:10 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4ZDfM02gTzz1d080;
	Fri, 14 Mar 2025 17:33:48 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 5F66A140159;
	Fri, 14 Mar 2025 17:33:55 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 14 Mar 2025 17:33:54 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<akpm@linux-foundation.org>, <sumit.garg@linaro.org>, <kernelfans@gmail.com>,
	<lecopzer.chen@mediatek.com>, <tglx@linutronix.de>, <song@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>,
	<zhanjie9@hisilicon.com>, <prime.zeng@hisilicon.com>, <linuxarm@huawei.com>
Subject: Re: [PATCH 2/2] arm64/watchdog_hld: Add a cpufreq notifier for update
 watchdog thresh
To: Doug Anderson <dianders@chromium.org>
References: <20250307021811.46981-1-yangyicong@huawei.com>
 <20250307021811.46981-3-yangyicong@huawei.com>
 <CAD=FV=XLn9Dz8rhRnjTKdbbeS3YP+XZFzpSV0C6+DakWOUmMpA@mail.gmail.com>
 <99a3afd4-6e16-0f39-9d2a-f629457dd756@huawei.com>
 <CAD=FV=Wy9-nDW-F+R1Aob6GOfP1Cnmr1gKkCO+WebA8ES7uu8A@mail.gmail.com>
 <260393cc-614a-b5c1-0e04-8443e00a7991@huawei.com>
 <CAD=FV=XhMnGWAQ19n6_O2QTkXNu_+NkA+R=4X_w+-Vewpd55ng@mail.gmail.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <1ec5d92d-a9d9-82a4-7630-1fc0b2311ed3@huawei.com>
Date: Fri, 14 Mar 2025 17:33:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XhMnGWAQ19n6_O2QTkXNu_+NkA+R=4X_w+-Vewpd55ng@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_023408_660202_2DD28F7D 
X-CRM114-Status: GOOD (  30.31  )
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

On 2025/3/14 10:03, Doug Anderson wrote:
> Hi,
> 
> On Wed, Mar 12, 2025 at 12:48 AM Yicong Yang <yangyicong@huawei.com> wrote:
>>
>>>>>> +static int __init init_watchdog_freq_notifier(void)
>>>>>> +{
>>>>>> +       return cpufreq_register_notifier(&watchdog_freq_notifier,
>>>>>> +                                        CPUFREQ_POLICY_NOTIFIER);
>>>>>> +}
>>>>>> +core_initcall(init_watchdog_freq_notifier);
>>>>>
>>>>> I haven't dug into everything, but don't you have a potential blind
>>>>> spot, though? What if the order is this:
>>>>>
>>>>> 1. hw_nmi_get_sample_period() is called
>>>>> 2. cpufreq driver probes
>>>>> 3. init_watchdog_freq_notifier() initcall runs
>>>>>
>>>>> Since the cpufreq driver proved before you registered for the
>>>>> notifier, won't you miss the creation of the policy? Maybe instead of
>>>>> registering for an initcall you should somehow trigger off the first
>>>>> call to hw_nmi_get_sample_period() and register at that point in time?
>>>>>
>>>>
>>>> for arm64 the watchdog_perf is registered after armv8 PMU driver's init,
>>>> so the sequence is like:
>>>>
>>>> # core_initcall
>>>> init_watchdog_freq_notifier()
>>>> # device_initcall
>>>> armv8_pmu_driver_init()
>>>>   lockup_detector_retry_init()
>>>>     schedule_work(&detector_work);
>>>> # in detector work
>>>> hw_nmi_get_sample_period() // notifier's already been registered
>>>>
>>>> so we'll always get the correct frequency, either by the cpufreq
>>>> already registered or by the notifier which will update the
>>>> frequency. Please correct me if I missed anything :)
>>>
>>> Hmm, OK. So this relies on the fact that because the
>>> init_watchdog_freq_notifier() is at "core" level that it'll pretty
>>> much init before any of the other things. This type of thing is always
>>> a little fragile but I guess it's OK.
>>>
>>> What about if the order is different though? Again, I haven't traced
>>> through it all, but I'm thinking:
>>>
>>> # core_initcall
>>> init_watchdog_freq_notifier()
>>> # device_initcall
>>> <cpufreq driver policy is created>
>>>
>>> Now hardlockup_detector_perf_adjust_period() will be called before
>>> armv8_pmu_driver_init(). Is that a problem?
>>
>> it doesn't matter, since in this situation:
>>
>> # device_initcall
>> <cpufreq driver policy is created>
>>   hardlockup_detector_perf_adjust_period()
>>     if (!event) // armv8_pmu_driver_init() not called, not event created
>>       return;
>> # later after armv8_pmu_driver_init()
>> hw_nmi_get_sample_period() // since cpufreq already been registered, we can
>>                            // get the accurate cpufreq
> 
> Got it. Sorry for asking the dumb questions--I didn't have time to dig
> through the code earlier this week. Yeah, looks like it should be OK.
> 
> 
>>> I guess even worse would be if async probe was on and the cpufreq
>>> driver and PMU driver were running at the same time?
>>>
>>
>> I think there're 2 cases here:
>> 1) cpufreq initialized before hw_nmi_get_sample_period() called, in which
>>    case the cpufreq is accurate when create the event
>> 2) hw_nmi_get_sample_period() called before cpufreq driver's initialized,
>>    in which case we rely on the notifier call to adjust the event's period
>>
>> May need further check to see if there's any race window here, but the worst
>> case will be using the inaccurate cpufreq (5GHz) for calculating the period.
> 
> OK, sure. _Maybe_ there could be some small race if these two things
> are happening at exactly the same time on two different cores:
> 
> core 1:
> * lockup_detector_delay_init()
> * watchdog_hardlockup_probe()
> * hardlockup_detector_event_create()
> * hw_nmi_get_sample_period()
> * No cpufreq driver, so returns SAFE_MAX_CPU_FREQ
> 
> core 2:
> * cpufreq driver probes + policy is created
> * "event" hasn't been created yet, so your new code is a no-op
> 
> core 1:
> * event gets created based on SAFE_MAX_CPU_FREQ.
> 
> Did I get that right?
> 

I think yes, should exist theoretically.

> That doesn't feel _completely_ impossible especially since
> lockup_detector_delay_init() is already running on a separate
> workqueue. As you said, though, the worst case is it looks like we'll
> just end up with how things were before your patch series.
> 
> In any case, I guess it's pretty unlikely, but maybe it wouldn't be
> very hard to add a mutex in there? It doesn't feel like that would add
> much overhead...
> 

I'll see how to do the synchronization here. I need to look a bit deeper into
the cpufreq core. Will update in the next version.

Thanks.



