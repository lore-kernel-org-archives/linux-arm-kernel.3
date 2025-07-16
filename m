Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6211DC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 07:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJn/whvboypqwAMDxixf5+DsxNzLZ50VBwxNX+BMTMM=; b=T29gnL7M3LROQXIcwU5wZGiQBM
	Hsy/kr/If512n9pPtBaoznvM/2a7dtmbLL60ImEN6Fg6QbyngVv+xJ8HRNwhsYSw7XggE//tDQGd3
	ELRPajzKt0tbSZ0UInX8EzQlQqis9jL8EweJeARGGn18uT/bVUGlv82O6eGtg1E8okm87QCBLVjRL
	Bb2Lx94dSlsrbM1P4CzyLTRo5XvlPgXwG8l7kmq+Z/huWSS43UvRVbmrQ2mgTTFbr3Ob99NWNdzrr
	YQ/Yj1t/RFFh7Rh9iD3OuHomKPYxxYL4TSCFecyusxhcmSepOd60r+h4D/KjPcIpM5vKKPNHHRTxa
	0F10tBMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubx0m-000000075oH-4BSS;
	Wed, 16 Jul 2025 07:57:09 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwws-000000074oF-2kiO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 07:53:08 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bhpC05Cldz2FbP6;
	Wed, 16 Jul 2025 15:50:52 +0800 (CST)
Received: from kwepemh100008.china.huawei.com (unknown [7.202.181.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 762E514011B;
	Wed, 16 Jul 2025 15:52:56 +0800 (CST)
Received: from [10.67.121.90] (10.67.121.90) by kwepemh100008.china.huawei.com
 (7.202.181.93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 16 Jul
 2025 15:52:55 +0800
Message-ID: <6c90b7ee-cf14-444e-bda0-d7f1fd86662e@huawei.com>
Date: Wed, 16 Jul 2025 15:52:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: topology: Setup amu fie when cpu hotplugging
To: Beata Michalska <beata.michalska@arm.com>
CC: Will Deacon <will@kernel.org>, <sudeep.holla@arm.com>,
	<catalin.marinas@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <viresh.kumar@linaro.org>,
	<yangyicong@hisilicon.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>,
	<yubowen8@huawei.com>, <vincent.guittot@linaro.org>
References: <20250607094533.416368-1-zhenglifeng1@huawei.com>
 <20250612151736.GC12912@willie-the-truck> <aEs9RRs95IrHBBX6@arm.com>
 <3c7ac433-480b-4cb3-9645-4d2cc495f1a3@huawei.com> <aFsStNd_c6bHC6Bo@arm.com>
From: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
In-Reply-To: <aFsStNd_c6bHC6Bo@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.90]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemh100008.china.huawei.com (7.202.181.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_005307_062412_A4F87554 
X-CRM114-Status: GOOD (  53.40  )
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

Hi Beata,

Sorry for a late reply.

On 2025/6/25 5:03, Beata Michalska wrote:
> Hi Lifeng,
> 
> First of all, apologies for late reply.
> 
> On Mon, Jun 16, 2025 at 09:22:27PM +0800, zhenglifeng (A) wrote:
>> On 2025/6/13 4:49, Beata Michalska wrote:
>>> On Thu, Jun 12, 2025 at 04:17:36PM +0100, Will Deacon wrote:
>>>> [+arm topology folks]
>>>>
>>>> On Sat, Jun 07, 2025 at 05:45:33PM +0800, Lifeng Zheng wrote:
>>>>> Amu fie was set up by a cpufreq policy notifier after the policy was
>>>>> created. This caused some problems:
>>>>>
>>>>> 1. The cpus related to the same policy would all fail to set up amu fie if
>>>>> one of them couldn't pass the freq_counters_valid() check.
>>>>>
>>> I believe that was actually deliberate - it's all or nothing.
>>> On the other hand, that validation is pretty straightforward.
>>> Would you mind sharing some more details on the setup that triggers it?
>>>>> 2. The cpus fail to set up amu fie would never have a chance to set up
>>>>> again.
>>>>
>>> I'd say that's the consequence of 1.
>>>> I don't fully understand this (we don't tend to use the past tense in commit
>>>> messages), but it sounds like you're saying that the singleton nature of
>>>> the AMU driver is causing you problems with late CPU hotplug. Is that
>>>> correct? Can you perhaps be a bit more specific about what goes wrong and
>>>> how to reproduce the issue, please?
>>
>> Here's the problem I met:
>>
>> Assuming cpu0 and cpu1 share the same cpufreq policy and LPI(Low Power Idle
>> States) is on. When boot with a parameter maxcpus=1, Only cpu0 will go
>> online. The support amu flag of cpu0 will be set but the flag of cpu1 will
>> not. This will cause amu fie set up fail for cpu0 when cpufreq policy0 is
>> creating. After that, when hotplug cpu1 on, the support amu flag of it will
>> finally be set. But for cpu0 and cpu1, they'll never have the chance to set
>> up amu fie, even though they're eligible.
> Right, so currently we are using the related_cpus mask of a given policy.
> For offlined CPUs, the cpu_has_amu_feat might not have a chance to check
> the AMU support (as it is in your case) so indeed the setup for AMU FIE
> support might fail.
>>
>> So I think the best time to set up amu fie is when the cpu is going online,
>> not when cpufreq policy is being created. This is what this patch does.
>>
> I am not entirely sure this is the right way to go about this.
> Getting back to the case described above: let's assume that CPU1 for some
> (weird) reason cannot use AMU counters for frequency scale factor.
> CPU0 will register for arch_scale_freq_tick and will use AMU counters to setup
> the arch_freq_scale, whereas CPU1 won't. That can lead to inconsistencies
> as the two will use different source of the freq scale.
> Furthermore, the scale factor will be mixed between counter-based and
> CPUFREQ-based even for CPU0 (topology_set_freq_scale).
> I think we gonna need the mixture of the two.
> We could try to use cpufreq_cpu_get on onlining CPU, but that will still not
> solve all the issues.

I think we could do this: when a CPU is going online, check the support amu
flags of CPUs which share the same cpufreq policy with this one. And set up
amu fie for all these CPUs if they pass this check. This will make sure all
the CPUs in the same policy use the same kind of source of the freq scale.

>>>>
>>>>> When boot with maxcpu=1 restrict, the support amu flags of the offline cpus
>>>>> would never be setup. After that, when cpufreq policy was being created,
>>>>> the online cpu might set up amu fie fail because the other cpus related to
>>>>> the same policy couldn't pass the freq_counters_valid() check. Hotplug the
>>>>> offline cpus, since the policy was already created, amu_fie_setup() would
>>>>> never be called again. All cpus couldn't setup amu fie in this situation.
>>>>>
>>>>> After commit 1f023007f5e7 ("arm64/amu: Use capacity_ref_freq() to set AMU
>>>>> ratio"), the max_freq stores in policy data is never needed when setting up
>>>>> amu fie.  This indicates that the setting up of amu fie does not depend on
>>>>> the policy any more. So each cpu can set up amu fie separately during
>>>>> hotplug and the problems above will be solved.
>>> I do not think this is the conclusion I would draw from that change.
>>> It aligns the AMU FIE code to use the right ratio based on the reference freq
>>> instead of cpuinfo.max_freq
>>
>> Yes, it's the purpose of this commit. What I'm trying to say is that thanks
>> for this commit, cpuinfo.max_freq or even the whole policy is not needed
>> anymore for setting up amu fie. And this is the precondition to this patch.
> It is not needed for setting up AMU support for FIE, but it is needed to
> provide consistent and reliable frequency scaling information I think.

Yes, you are right.

>>
>>>>>
>>>>> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
>>>>> ---
>>>>>  arch/arm64/kernel/topology.c | 56 ++++++++++++++----------------------
>>>>>  1 file changed, 21 insertions(+), 35 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>>>>> index 5d07ee85bdae..207eab4fa31f 100644
>>>>> --- a/arch/arm64/kernel/topology.c
>>>>> +++ b/arch/arm64/kernel/topology.c
>>>>> @@ -351,63 +351,49 @@ int arch_freq_get_on_cpu(int cpu)
>>>>>  	return freq;
>>>>>  }
>>>>>  
>>>>> -static void amu_fie_setup(const struct cpumask *cpus)
>>>>> +static void amu_fie_setup(unsigned int cpu)
>>>>>  {
>>>>> -	int cpu;
>>>>> -
>>>>> -	/* We are already set since the last insmod of cpufreq driver */
>>>>>  	if (cpumask_available(amu_fie_cpus) &&
>>>>> -	    unlikely(cpumask_subset(cpus, amu_fie_cpus)))
>>>>> +	    cpumask_test_cpu(cpu, amu_fie_cpus))
>>>>>  		return;
>>>>>  
>>>>> -	for_each_cpu(cpu, cpus)
>>>>> -		if (!freq_counters_valid(cpu))
>>>>> -			return;
>>>>> +	if (!freq_counters_valid(cpu))
>>>>> +		return;
>>>>>  
>>>>>  	if (!cpumask_available(amu_fie_cpus) &&
>>>>>  	    !zalloc_cpumask_var(&amu_fie_cpus, GFP_KERNEL)) {
>>>>> -		WARN_ONCE(1, "Failed to allocate FIE cpumask for CPUs[%*pbl]\n",
>>>>> -			  cpumask_pr_args(cpus));
>>>>> +		WARN_ONCE(1, "Failed to allocate FIE cpumask for CPUs[%u]\n",
>>>>> +			  cpu);
>>>>>  		return;
>>>>>  	}
>>>>>  
>>>>> -	cpumask_or(amu_fie_cpus, amu_fie_cpus, cpus);
>>>>> +	cpumask_set_cpu(cpu, amu_fie_cpus);
>>>>>  
>>>>>  	topology_set_scale_freq_source(&amu_sfd, amu_fie_cpus);
>>>>
>>>> Isn't it going to be potentially expensive to call this every time a CPU
>>>> comes online?
>>>>
>>> It does seem *bit excessive - I guess this should use single-CPU mask, to start
>>> with.
>>
>> For the cpus which already setup amu fie, they won't pass the first "if" in
>> this function, so it's not so expensive I think. For the other cpus, I
>> believe it's worth a try to set.
> I believe the deal here is that topology_set_scale_freq_source will be called
> with amu_fie_cpus mask that might contain other CPUs that already have been
> registered as freq scale source. But that is not horribly expensive, and
> calling rebuild_sched_domains_energy is already optimised.

This extra expense is not introduced by this patch and I'm not sure if
there's any reason for this. So I keep it. If it's unnecessary, we can do
some optimization after this patch.

> 
> ---
> BR
> Beata
>>
>>>> Will
>>>>
>>>> [left the rest of the patch below for the folks I added]
>>>
>>> I think I kinda get the idea, but having more details would help to clarify
>>> things.
>>>
>>> ---
>>> BR
>>> Beata
>>>>
>>>>>  
>>>>> -	pr_debug("CPUs[%*pbl]: counters will be used for FIE.",
>>>>> -		 cpumask_pr_args(cpus));
>>>>> +	pr_debug("CPUs[%u]: counters will be used for FIE.", cpu);
>>>>>  }
>>>>>  
>>>>> -static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
>>>>> -				 void *data)
>>>>> +static int cpuhp_topology_online(unsigned int cpu)
>>>>>  {
>>>>> -	struct cpufreq_policy *policy = data;
>>>>> -
>>>>> -	if (val == CPUFREQ_CREATE_POLICY)
>>>>> -		amu_fie_setup(policy->related_cpus);
>>>>> -
>>>>> -	/*
>>>>> -	 * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
>>>>> -	 * counters don't have any dependency on cpufreq driver once we have
>>>>> -	 * initialized AMU support and enabled invariance. The AMU counters will
>>>>> -	 * keep on working just fine in the absence of the cpufreq driver, and
>>>>> -	 * for the CPUs for which there are no counters available, the last set
>>>>> -	 * value of arch_freq_scale will remain valid as that is the frequency
>>>>> -	 * those CPUs are running at.
>>>>> -	 */
>>>>> +	amu_fie_setup(cpu);
>>>>>  
>>>>>  	return 0;
>>>>>  }
>>>>>  
>>>>> -static struct notifier_block init_amu_fie_notifier = {
>>>>> -	.notifier_call = init_amu_fie_callback,
>>>>> -};
>>>>> -
>>>>>  static int __init init_amu_fie(void)
>>>>>  {
>>>>> -	return cpufreq_register_notifier(&init_amu_fie_notifier,
>>>>> -					CPUFREQ_POLICY_NOTIFIER);
>>>>> +	int ret;
>>>>> +
>>>>> +	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>>>>> +				"arm64/topology:online",
>>>>> +				cpuhp_topology_online,
>>>>> +				NULL);
>>>>> +
>>>>> +	if (ret < 0)
>>>>> +		return ret;
>>>>> +
>>>>> +	return 0;
>>>>>  }
>>>>>  core_initcall(init_amu_fie);
>>>>>  
>>>>> -- 
>>>>> 2.33.0
>>>>>
>>>
>>
> 


