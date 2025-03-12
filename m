Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559F5C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 08:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0BBMuKtIC6P1EY0Q77a15N5+yKo1PTwJFgTXqXqBYY=; b=XrOOcp6cN/lGk4b13s8n7aAgZT
	hhfWWxaeqxtfRZ9HFZFWjuQ72bftrLnlHbuBSeZEwsKoyTqN7+tgtSm0CHUU1D8iXJXHS/cN6p8qA
	b1/jMYB+CcQB7fmembltinBdkjWxirh8o6m7eHg8gnt60moVGIWq5maIygMZI4aWhZP4WPNMcIcqV
	EXZs1fT91ZPWIJENv/rE9iKORffxFKmt3CGrNcV1veJHIqKRlXgPg3CvPQOypexVAaOUHYyHQX/yL
	j18F2lTuJlUTmiYBJNv5Apzf5CDW8iZXyJjsz1TT+pAsIGxJ95MDuHzAtnvxIi43LUfhijXEVdhwq
	dRYAejuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsH6l-00000007mlA-2zXO;
	Wed, 12 Mar 2025 08:06:31 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGok-00000007kAB-1SlQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 07:47:56 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZCN0c49z1z1ltcG;
	Wed, 12 Mar 2025 15:43:28 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id C6B3A1A0188;
	Wed, 12 Mar 2025 15:47:49 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 12 Mar 2025 15:47:49 +0800
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
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <260393cc-614a-b5c1-0e04-8443e00a7991@huawei.com>
Date: Wed, 12 Mar 2025 15:47:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Wy9-nDW-F+R1Aob6GOfP1Cnmr1gKkCO+WebA8ES7uu8A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_004754_747726_E9E3D787 
X-CRM114-Status: GOOD (  31.37  )
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

On 2025/3/11 23:41, Doug Anderson wrote:
> Hi,
> 
> On Tue, Mar 11, 2025 at 1:33 AM Yicong Yang <yangyicong@huawei.com> wrote:
>>
>> On 2025/3/8 0:53, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Thu, Mar 6, 2025 at 6:18 PM Yicong Yang <yangyicong@huawei.com> wrote:
>>>>
>>>> From: Yicong Yang <yangyicong@hisilicon.com>
>>>>
>>>> arm64 depends on the cpufreq driver to gain the maximum cpu frequency
>>>> to convert the watchdog_thresh to perf event period. cpufreq drivers
>>>> like cppc_cpufreq will be initialized lately after the initializing of
>>>> the hard lockup detector so just use a safe cpufreq which will be
>>>> inaccurency. Use a cpufreq notifier to adjust the event's period to
>>>> a more accurate one.
>>>>
>>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>>>> ---
>>>>  arch/arm64/kernel/watchdog_hld.c | 34 ++++++++++++++++++++++++++++++++
>>>>  1 file changed, 34 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/kernel/watchdog_hld.c b/arch/arm64/kernel/watchdog_hld.c
>>>> index dcd25322127c..719ae39e8bc0 100644
>>>> --- a/arch/arm64/kernel/watchdog_hld.c
>>>> +++ b/arch/arm64/kernel/watchdog_hld.c
>>>> @@ -34,3 +34,37 @@ bool __init arch_perf_nmi_is_available(void)
>>>>          */
>>>>         return arm_pmu_irq_is_nmi();
>>>>  }
>>>> +
>>>> +static int watchdog_freq_notifier_callback(struct notifier_block *nb,
>>>> +                                          unsigned long val, void *data)
>>>> +{
>>>> +       struct cpufreq_policy *policy = data;
>>>> +       unsigned long max_cpu_freq;
>>>
>>> Feels like max_cpu_freq should be a u64. It probably should have been
>>> u64 in hw_nmi_get_sample_period() as well. Otherwise you could end up
>>> with a problem if the max CPU frequency is above ~4.3GHz and "unsigned
>>> long" is 32-bits (I think it technically could be?)
>>>
>>
>> I guess this won't happen for arm64 and we're in kernel space. here I
>> keep the same type with hw_nmi_get_sample_period() which is also using
>> "unsigned long".
> 
> I guess I won't insist, but given that you use u64 explicitly
> elsewhere it feels like you should be explicit that you need 64-bits
> here too.
> 
> 
>>>> +       for_each_cpu(cpu, policy->cpus) {
>>>> +               max_cpu_freq = cpufreq_get_hw_max_freq(cpu) * 1000UL;
>>>> +               if (!max_cpu_freq)
>>>> +                       continue;
>>>> +
>>>> +               new_period = watchdog_thresh * max_cpu_freq;
>>>> +               hardlockup_detector_perf_adjust_period(cpu, new_period);
>>>> +       }
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static struct notifier_block watchdog_freq_notifier = {
>>>> +       .notifier_call = watchdog_freq_notifier_callback,
>>>> +};
>>>> +
>>>> +static int __init init_watchdog_freq_notifier(void)
>>>> +{
>>>> +       return cpufreq_register_notifier(&watchdog_freq_notifier,
>>>> +                                        CPUFREQ_POLICY_NOTIFIER);
>>>> +}
>>>> +core_initcall(init_watchdog_freq_notifier);
>>>
>>> I haven't dug into everything, but don't you have a potential blind
>>> spot, though? What if the order is this:
>>>
>>> 1. hw_nmi_get_sample_period() is called
>>> 2. cpufreq driver probes
>>> 3. init_watchdog_freq_notifier() initcall runs
>>>
>>> Since the cpufreq driver proved before you registered for the
>>> notifier, won't you miss the creation of the policy? Maybe instead of
>>> registering for an initcall you should somehow trigger off the first
>>> call to hw_nmi_get_sample_period() and register at that point in time?
>>>
>>
>> for arm64 the watchdog_perf is registered after armv8 PMU driver's init,
>> so the sequence is like:
>>
>> # core_initcall
>> init_watchdog_freq_notifier()
>> # device_initcall
>> armv8_pmu_driver_init()
>>   lockup_detector_retry_init()
>>     schedule_work(&detector_work);
>> # in detector work
>> hw_nmi_get_sample_period() // notifier's already been registered
>>
>> so we'll always get the correct frequency, either by the cpufreq
>> already registered or by the notifier which will update the
>> frequency. Please correct me if I missed anything :)
> 
> Hmm, OK. So this relies on the fact that because the
> init_watchdog_freq_notifier() is at "core" level that it'll pretty
> much init before any of the other things. This type of thing is always
> a little fragile but I guess it's OK.
> 
> What about if the order is different though? Again, I haven't traced
> through it all, but I'm thinking:
> 
> # core_initcall
> init_watchdog_freq_notifier()
> # device_initcall
> <cpufreq driver policy is created>
> 
> Now hardlockup_detector_perf_adjust_period() will be called before
> armv8_pmu_driver_init(). Is that a problem?

it doesn't matter, since in this situation:

# device_initcall
<cpufreq driver policy is created>
  hardlockup_detector_perf_adjust_period()
    if (!event) // armv8_pmu_driver_init() not called, not event created
      return;
# later after armv8_pmu_driver_init()
hw_nmi_get_sample_period() // since cpufreq already been registered, we can
                           // get the accurate cpufreq

> 
> I guess even worse would be if async probe was on and the cpufreq
> driver and PMU driver were running at the same time?
> 

I think there're 2 cases here:
1) cpufreq initialized before hw_nmi_get_sample_period() called, in which
   case the cpufreq is accurate when create the event
2) hw_nmi_get_sample_period() called before cpufreq driver's initialized,
   in which case we rely on the notifier call to adjust the event's period

May need further check to see if there's any race window here, but the worst
case will be using the inaccurate cpufreq (5GHz) for calculating the period.

Thanks.


