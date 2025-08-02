Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF3CC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Aug 2025 10:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3g+msApkkP/3mzvSWmf8zHoFKT2NpS/mO2NbmwlzjXg=; b=Gaza0TxJ/FsEtFNXMBZbhx/Rlm
	bx6Nubrv86aQjCVgZ8IJwV88kY4bnkik6y05YxzN4io+FQ3j4XR3Uz5k5P+ryy2DmI4O3zlvMEKac
	qVtBq7KUfNioq9PEQA7M4rq7smpcVFXmKorIRN9DEcNitFwU6Hi+hJzqqfgbpxQitXT5HawGDKFL1
	9FMf2T81QiKri98eZ7KG/WBWYbJoPJLYYh7DvkP71dG5Ah8c3rt0J/007UhsA7/MnLyJm11GO6Y14
	xnuhGbHg8LGlnW6GPelbl+f2bdAL8KEnKEiG3xjDJt5zzDiJvbqg5yCCpkx76eHPHoOBIg9kOCYuN
	92+80X3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui9S4-00000007Xfa-1UHB;
	Sat, 02 Aug 2025 10:26:56 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui9PT-00000007XaD-1yb8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Aug 2025 10:24:17 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bvJh85nvMz14M7G;
	Sat,  2 Aug 2025 18:19:04 +0800 (CST)
Received: from kwepemh100008.china.huawei.com (unknown [7.202.181.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 41F62180064;
	Sat,  2 Aug 2025 18:23:59 +0800 (CST)
Received: from [10.67.121.90] (10.67.121.90) by kwepemh100008.china.huawei.com
 (7.202.181.93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 2 Aug
 2025 18:23:58 +0800
Message-ID: <0efd122b-221a-4928-8b8d-76821cfc4548@huawei.com>
Date: Sat, 2 Aug 2025 18:23:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: topology: Setup AMU FIE for online CPUs only
To: Beata Michalska <beata.michalska@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<viresh.kumar@linaro.org>, <vincent.guittot@linaro.org>,
	<yangyicong@hisilicon.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>,
	<yubowen8@huawei.com>, <linhongye@h-partners.com>
References: <20250725102813.1404322-1-zhenglifeng1@huawei.com>
 <aIss-syLMXmCBZ7E@arm.com>
From: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
In-Reply-To: <aIss-syLMXmCBZ7E@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.90]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemh100008.china.huawei.com (7.202.181.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_032415_824510_54870ADB 
X-CRM114-Status: GOOD (  30.49  )
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

On 2025/7/31 16:44, Beata Michalska wrote:

> Hi Lifeng,
> 
> Apologies for late reply.
> 
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
> Right, so this will only work for the AMU side of things. The cpufreq core still
> considers `related_cpus` which should be aligned (if possible).

'cpus' means the online CPUs relate to this policy, and 'related_cpus'
means all the CPUs relate to this policy. Use 'cpus' here because AMU FIE
only needs to be set for the online CPUs. As for the offline CPUs, they
don't have to set up AMU FIE, and shouldn't affect other CPUs setting up
AMU FIE.

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
> This should be available via `amu_fie_cpus` mask (as of subset).
> So it should be enough to test only the CPU at hand?

Yeah, makes sense. Thanks.

> Additionally there is no tracking whether that CPU hasn't been verified already.

I don't think it's necessary. If a CPU has been verified already and pass,
then the 'amu_fie_cpus' mask should contain it, otherwise it deserves to be
checked again.

>> +		amu_fie_setup(cpus_to_set);
>> +	}
>> +
>> +	free_cpumask_var(cpus_to_set);
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
> We should check whether we really have to set it up, as of all CPUs are already
> online).

All CPUs are likely to be online at this point. However, we cannot
guarantee that this is still the case when the cpufreq policies are
created.

>> +	if (ret < 0) {
>> +		cpufreq_unregister_notifier(&init_amu_fie_notifier,
>> +					    CPUFREQ_POLICY_NOTIFIER);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>>  }
>>  core_initcall(init_amu_fie);
>>  
>> -- 
>> 2.33.0
>>
> 


