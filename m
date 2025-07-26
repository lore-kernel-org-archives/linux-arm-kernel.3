Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F190FC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 03:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9dtPbb/iKSq4bP9b9K2UHCeLBx2PYnERbNb0MTZq3E=; b=vH8ZOAVu91PFtxOznhj4sRVW1O
	scLzoE1eeqP1x9O0wMgyTL74NwzRqaf/vMofGEQq+qBtlAH+Y06dQAhnv0jbVS/0hpxUOfhTBoyt3
	nhAKw+oejRGRqVfWPryV7maGeyoytGGq3hMjFHFb43EV38b+J50m0q9VuJIJUP/4WhUsQaxwqllzY
	4m9XivNBLk/tyvSIjQiLGL9DkQWBj5k6y6QarPQyPYTFINPeuKzYR+Sq/Eg/1YyYH34i0Tf50GM63
	zAOWnax4hZV1vhOmyVNGJyw/TrsyCbkFWnLjHKbyL3BGwGw48etPg+8jYg2Lxns791Jcmt+a2oYpR
	EZzgRv2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufVHG-0000000B4KE-184f;
	Sat, 26 Jul 2025 03:08:50 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufVEm-0000000B4Cn-19uG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 03:06:18 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bpqJQ56x3z2CfvK;
	Sat, 26 Jul 2025 11:01:26 +0800 (CST)
Received: from kwepemh100008.china.huawei.com (unknown [7.202.181.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 18CD4140279;
	Sat, 26 Jul 2025 11:05:38 +0800 (CST)
Received: from [10.67.121.90] (10.67.121.90) by kwepemh100008.china.huawei.com
 (7.202.181.93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 26 Jul
 2025 11:05:37 +0800
Message-ID: <82b7c3e8-2c3e-4a71-9898-446f5d2dd39a@huawei.com>
Date: Sat, 26 Jul 2025 11:05:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: topology: Setup AMU FIE for online CPUs only
To: Sudeep Holla <sudeep.holla@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <beata.michalska@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<viresh.kumar@linaro.org>, <vincent.guittot@linaro.org>,
	<yangyicong@hisilicon.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>,
	<yubowen8@huawei.com>, <linhongye@h-partners.com>
References: <20250725102813.1404322-1-zhenglifeng1@huawei.com>
 <20250725-courageous-myrtle-manatee-b113b5@sudeepholla>
From: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
In-Reply-To: <20250725-courageous-myrtle-manatee-b113b5@sudeepholla>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.90]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemh100008.china.huawei.com (7.202.181.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_200616_628315_74F0B354 
X-CRM114-Status: GOOD (  30.47  )
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

On 2025/7/25 21:11, Sudeep Holla wrote:
> On Fri, Jul 25, 2025 at 06:28:13PM +0800, Lifeng Zheng wrote:
>> When boot with maxcpu=1 restrict, and LPI(Low Power Idle States) is on,
>> only CPU0 will go online. The support AMU flag of CPU0 will be set but the
>> flags of other CPUs will not. This will cause AMU FIE set up fail for CPU0
>> when it shares a cpufreq policy with other CPU(s). After that, when other
>> CPUs are finally online and the support AMU flags of them are set, they'll
>> never have a chance to set up AMU FIE, even though they're eligible.
>>
>> To solve this problem, the process of setting up AMU FIE needs to be
>> modified as follows:
>>
>> 1. Set up AMU FIE only for the online CPUs.
>>
>> 2. Try to set up AMU FIE each time a CPU goes online and do the
>> freq_counters_valid() check for all the online CPUs share the same policy.
>> If this check fails, clear scale freq source of these CPUs, in case they
>> use different source of the freq scale.
>>
>> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
>> ---
> 
> I have no idea what changed from v1->v2 and no link to v1 for me to
> refer to it and check the delta 🙁.

My fault.

Changes in v2:

 - keep init_amu_fie_notifier for setting up AMU FIE when the cpufreq
   policy is being created
 - set up AMU FIE only for online CPUs instead of related_cpus in
   init_amu_fie_callback()
 - check and set all the online CPUs in the same policy when hotplug one
 - clear scale freq source for all the online CPUs in the same policy to
   avoid using different source of the freq scale

---
Discussions of previous version:
v1: https://lore.kernel.org/all/20250607094533.416368-1-zhenglifeng1@huawei.com/

> 
>>  arch/arm64/kernel/topology.c | 49 ++++++++++++++++++++++++++++++++----
>>  1 file changed, 44 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>> index 5d07ee85bdae..d578c496d457 100644
>> --- a/arch/arm64/kernel/topology.c
>> +++ b/arch/arm64/kernel/topology.c
>> @@ -357,12 +357,15 @@ static void amu_fie_setup(const struct cpumask *cpus)
>>  
>>  	/* We are already set since the last insmod of cpufreq driver */
>>  	if (cpumask_available(amu_fie_cpus) &&
>> -	    unlikely(cpumask_subset(cpus, amu_fie_cpus)))
>> +	    cpumask_subset(cpus, amu_fie_cpus))
>>  		return;
>>  
>> -	for_each_cpu(cpu, cpus)
>> -		if (!freq_counters_valid(cpu))
>> +	for_each_cpu(cpu, cpus) {
>> +		if (!freq_counters_valid(cpu)) {
>> +			topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, cpus);
>>  			return;
>> +		}
>> +	}
>>  
>>  	if (!cpumask_available(amu_fie_cpus) &&
>>  	    !zalloc_cpumask_var(&amu_fie_cpus, GFP_KERNEL)) {
>> @@ -385,7 +388,7 @@ static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
>>  	struct cpufreq_policy *policy = data;
>>  
>>  	if (val == CPUFREQ_CREATE_POLICY)
>> -		amu_fie_setup(policy->related_cpus);
>> +		amu_fie_setup(policy->cpus);
>>  
>>  	/*
>>  	 * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
>> @@ -404,10 +407,46 @@ static struct notifier_block init_amu_fie_notifier = {
>>  	.notifier_call = init_amu_fie_callback,
>>  };
>>  
>> +static int cpuhp_topology_online(unsigned int cpu)
>> +{
>> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>> +	cpumask_var_t cpus_to_set;
>> +
>> +	if (!zalloc_cpumask_var(&cpus_to_set, GFP_KERNEL))
>> +		return -ENOMEM;
>> +
>> +	cpumask_copy(cpus_to_set, cpumask_of(cpu));
>> +
>> +	policy = cpufreq_cpu_get(cpu);
>> +	if (policy) {
>> +		cpumask_or(cpus_to_set, cpus_to_set, policy->cpus);
>> +		amu_fie_setup(cpus_to_set);
>> +	}
>> +
>> +	free_cpumask_var(cpus_to_set);
> 
> What am I missing here as I don't see the need to for this local
> copy  `cpus_to_set`.
> 
> Why can't you just call
> 	policy = cpufreq_cpu_get(cpu);
> 	if (policy)
> 		amu_fie_setup(cpus_to_set);

As mentioned in the commit log, when hotplug a CPU, the
freq_counters_valid() check should be done for all the online CPUs share
the same policy. Otherwise they may use different source of the freq scale
and cause some problems.

> 
> 
>> +	return 0;
>> +}
>> +
>>  static int __init init_amu_fie(void)
>>  {
>> -	return cpufreq_register_notifier(&init_amu_fie_notifier,
>> +	int ret;
>> +
>> +	ret = cpufreq_register_notifier(&init_amu_fie_notifier,
>>  					CPUFREQ_POLICY_NOTIFIER);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
>> +					"arm64/topology:online",
>> +					cpuhp_topology_online,
>> +					NULL);
>> +	if (ret < 0) {
>> +		cpufreq_unregister_notifier(&init_amu_fie_notifier,
>> +					    CPUFREQ_POLICY_NOTIFIER);
>> +		return ret;
>> +	}
>> +
> 
> Why can't you just set up cpuhp_* first and then cpufreq notifier to avoid
> this unregistering ?

If set up cpuhp state first, it should be remove when register notifier
fails. So I think there is no difference which one is called first.



