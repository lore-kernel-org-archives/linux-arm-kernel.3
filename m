Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DDEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 11:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWLHf5xywEt1g+rMFiar0YPJspdWWxdbM4QLN2TCSew=; b=uVBJjFmcYWFkNmlTVtmzcBinKl
	yPZHRMg6UEIGr4IqCjx2VYKUY+WLaTBPoFk3Hq6eqePypvLGnOsPT+j0P7SCu3HHt9p8YHCqTPl2m
	Kav9LKsuoUlV6MSn1OTruRN9dWyXV9qpkHjmuZCggFQW1Pmyo+sAJgh3AKg3MUmizJPwK1Lp8tX2D
	qCzT4zGfOXgTBTyla5M5Aj8SGeMyE6NrAPmBIdNcxNS2HDLr1s6gkbJwFIlzu6GQg2VTUzjX8+vKc
	q0iGZtJlDy2GNoeqPWbwSTQ5/K8wLb7rFTdB+HKrK8beOZ1SoYN+r4zjDILsojP7ei9SB0nB1AeNS
	c85utrWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQmBq-0000000FhPg-2ZGz;
	Thu, 26 Dec 2024 11:38:06 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQmAb-0000000FhIE-3v3n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 11:36:52 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YJmhq16Y6zxWtd;
	Thu, 26 Dec 2024 19:33:15 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 77EC414022E;
	Thu, 26 Dec 2024 19:36:40 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 26 Dec 2024 19:36:39 +0800
CC: <yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>
Subject: Re: [PATCH v10 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
To: Shrikanth Hegde <sshegde@linux.ibm.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
 <20241220075313.51502-2-yangyicong@huawei.com>
 <718d69e0-f145-4393-b571-80e8a0a372f6@linux.ibm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <297f999d-5c6f-1a6e-5df2-f4f14c283b46@huawei.com>
Date: Thu, 26 Dec 2024 19:36:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <718d69e0-f145-4393-b571-80e8a0a372f6@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_033650_328905_C4CBCC46 
X-CRM114-Status: GOOD (  28.32  )
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

On 2024/12/26 15:18, Shrikanth Hegde wrote:
> 
> 
> On 12/20/24 13:23, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Currently if architectures want to support HOTPLUG_SMT they need to
>> provide a topology_is_primary_thread() telling the framework which
>> thread in the SMT cannot offline. However arm64 doesn't have a
>> restriction on which thread in the SMT cannot offline, a simplest
>> choice is that just make 1st thread as the "primary" thread. So
>> just make this as the default implementation in the framework and
>> let architectures like x86 that have special primary thread to
>> override this function (which they've already done).
>>
>> There's no need to provide a stub function if !CONFIG_SMP or
>> !CONFIG_HOTPLUG_SMP. In such case the testing CPU is already
> 
> s/CONFIG_HOTPLUG_SMP/CONFIG_HOTPLUG_SMT
> 
>> the 1st CPU in the SMT so it's always the primary thread.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>> As questioned in v9 [1] whether this works on architectures not using
>> CONFIG_GENERIC_ARCH_TOPOLOGY, hacked on LoongArch VM and this also works.
>> Architectures should use this on their own situation.
>> [1] https://lore.kernel.org/linux-arm-kernel/427bd639-33c3-47e4-9e83-68c428eb1a7d@arm.com/
>>
> 
> sorry to ask this question this late in the series.
> 
> I am curious to know why not just add the arch specific topology_is_primary_thread? current infra would handle that right?

Yes, this also works. It was implemented like you said before v4. It's thought trival and was suggested to provide
a default implementation for all and make archs that have special requirement to override it.[1]

[1] https://lore.kernel.org/linux-arm-kernel/fe03425c-6b9a-f0eb-0e8d-e0f47404a7cb@huawei.com/

> 
> is there any other arch that is going to enable this soon? or the rationale is to add the generic function so that archs that use generic topology it is just a kconfig change in case they want to add the support?
> 

It depends on the arch and currently it's only going to be supported on arm64. If they don't have special requirement
of the primary thread, they can use this function. It's still needed to call cpu_smt_set_num_threads() besides select
the kconfig to notify the framework of the thread number since it maybe detected by arthitectural way or ACPI which is
also from the arch codes (like arm64). If it's detected from device tree and using CONFIG_GENERIC_ARCH_TOPOLOGY,
should work to only select kconfig.

Thanks.

>> [root@localhost smt]# uname -m
>> loongarch64
>> [root@localhost smt]# pwd
>> /sys/devices/system/cpu/smt
>> [root@localhost smt]# cat ../possible
>> 0-3
>> [root@localhost smt]# cat ../online
>> 0-3
>> [root@localhost smt]# cat control
>> on
>> [root@localhost smt]# echo off > control
>> [root@localhost smt]# cat control
>> off
>> [root@localhost smt]# cat ../online
>> 0,2
>> [root@localhost smt]# echo on > control
>> [root@localhost smt]# cat control
>> on
>> [root@localhost smt]# cat ../online
>> 0-3
>>
>>   arch/powerpc/include/asm/topology.h |  1 +
>>   arch/x86/include/asm/topology.h     |  2 +-
>>   include/linux/topology.h            | 22 ++++++++++++++++++++++
>>   3 files changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
>> index 16bacfe8c7a2..da15b5efe807 100644
>> --- a/arch/powerpc/include/asm/topology.h
>> +++ b/arch/powerpc/include/asm/topology.h
>> @@ -152,6 +152,7 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
>>   {
>>       return cpu == cpu_first_thread_sibling(cpu);
>>   }
>> +#define topology_is_primary_thread topology_is_primary_thread
>>     static inline bool topology_smt_thread_allowed(unsigned int cpu)
>>   {
>> diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
>> index fd41103ad342..faa0d6334ea4 100644
>> --- a/arch/x86/include/asm/topology.h
>> +++ b/arch/x86/include/asm/topology.h
>> @@ -228,11 +228,11 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
>>   {
>>       return cpumask_test_cpu(cpu, cpu_primary_thread_mask);
>>   }
>> +#define topology_is_primary_thread topology_is_primary_thread
>>     #else /* CONFIG_SMP */
>>   static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
>>   static inline int topology_max_smt_threads(void) { return 1; }
>> -static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
>>   static inline unsigned int topology_amd_nodes_per_pkg(void) { return 1; }
>>   #endif /* !CONFIG_SMP */
>>   diff --git a/include/linux/topology.h b/include/linux/topology.h
>> index 52f5850730b3..b3aba443c4eb 100644
>> --- a/include/linux/topology.h
>> +++ b/include/linux/topology.h
>> @@ -240,6 +240,28 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
>>   }
>>   #endif
>>   +#ifndef topology_is_primary_thread
>> +
>> +#define topology_is_primary_thread topology_is_primary_thread
>> +
>> +static inline bool topology_is_primary_thread(unsigned int cpu)
>> +{
>> +    /*
>> +     * On SMT hotplug the primary thread of the SMT won't be disabled.
>> +     * Architectures do have a special primary thread (e.g. x86) need
>> +     * to override this function. Otherwise just make the first thread
>> +     * in the SMT as the primary thread.
>> +     *
>> +     * The sibling cpumask of an offline CPU contains always the CPU
>> +     * itself for architectures using CONFIG_GENERIC_ARCH_TOPOLOGY.
>> +     * Other architectures should use this depend on their own
>> +     * situation.
>> +     */
>> +    return cpu == cpumask_first(topology_sibling_cpumask(cpu));
>> +}
>> +
>> +#endif
>> +
>>   static inline const struct cpumask *cpu_cpu_mask(int cpu)
>>   {
>>       return cpumask_of_node(cpu_to_node(cpu));
> 
> .

