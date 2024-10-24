Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0DECE8E89
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NEROD9SoptjaH6z4ZaBOxf64L1Sc5rI203o1wBOxJ8=; b=wE2e3lNJjdawI6ALqY/drlOlsi
	Dn9Hn8R7SJi0IMRlWEPyXdF8VK60JwaqvpHZ7Xubn5u3QLzONPTFw3stPAsfsFjzPFGWeDqcEELz7
	okZHRQjXz8LqvOwjq4wGStlIk80/S1FQKVOyMZx45V7cxZ8KSvIQgqGPFIPX+nFV8UP/a3BXXy3Z6
	9/Ntx+t1L1aGfthHOq8bg+IMBi2CUp4RsYGt4LgXybVxDb0opdjJOvUyW/fmra2XDuXFDST/3/FuG
	vxCAAefyUp3eKvXUw809wp8OMr7BVYBibjD5xkWvEdouZJqQrO1G2yFQUYtt+Hhbt7U63BRe0ZF50
	hBue9VJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zc6-00000000t9t-27Iw;
	Thu, 24 Oct 2024 15:19:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zTo-00000000sBm-1g46
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Oct 2024 15:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:CC:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0NEROD9SoptjaH6z4ZaBOxf64L1Sc5rI203o1wBOxJ8=; b=naje/1i8kWgfVM9/udy2sh5DB5
	LeCeiAEQmuRGRE6OE8OcMG9ASyv/429JDKMyj4RCKTrtjVsEtm+2+1OymFQTDZLYo9/1vr4PDB4UN
	KiWAjAv15moPnR5i54mvIADc960zbz17fajp9G87ojZS+2gB5y5tXS3d/mtU9+70YmH3yhZIezNVb
	AdvQS9FCdr/bGKSOXgI3t7d9Ym2M93SOsP1qN1Rk2Id0uy8MQu3XcBGS9RrK+of/AG9l+CmLRa7AG
	lYrNl4b6cYv/ij7rDCwLov/LwKp/Rt7jbf/wL3RFkeM987P6pzQUwqDV2XGvyeOVYTRVUQK6Hqr9U
	7afh2opg==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zTj-00000008ge3-1Rka
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 15:10:26 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XZ8Rf1Mv4z10N2T;
	Thu, 24 Oct 2024 23:07:58 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id A77E51401E9;
	Thu, 24 Oct 2024 23:10:01 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 24 Oct 2024 23:10:00 +0800
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <dietmar.eggemann@arm.com>,
	<yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>
Subject: Re: [PATCH v6 3/4] arm64: topology: Support SMT control on ACPI based
 system
To: Pierre Gondois <pierre.gondois@arm.com>
References: <20241015021841.35713-1-yangyicong@huawei.com>
 <20241015021841.35713-4-yangyicong@huawei.com>
 <896f9bb7-7053-4835-8db4-1ff063c268c1@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <3181577e-d6dd-fd91-f51f-ae6ca0413687@huawei.com>
Date: Thu, 24 Oct 2024 23:09:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <896f9bb7-7053-4835-8db4-1ff063c268c1@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_161024_541985_151C4DA6 
X-CRM114-Status: GOOD (  35.65  )
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

On 2024/10/24 16:44, Pierre Gondois wrote:
> Hello Yicong,
> 
> On 10/15/24 04:18, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> For ACPI we'll build the topology from PPTT and we cannot directly
>> get the SMT number of each core. Instead using a temporary xarray
>> to record the heterogeneous information (from ACPI_PPTT_ACPI_IDENTICAL)
>> and SMT information of the first core in its heterogeneous CPU cluster
>> when building the topology. Then we can know the largest SMT number
>> in the system.
> 
> Is it possible to also state that the logic only work for PPTT versions
> prior to 6.2. Otherwise find_acpi_cpu_topology_hetero_id() will return
> the id of the root node of the PPTT, and all the CPUs of the platform
> will be assumed to be identical.
> 

sure. of course.

>>
>> The core's SMT control provides two interface to the users [1]:
>> 1) enable/disable SMT by writing on/off
>> 2) enable/disable SMT by writing thread number 1/max_thread_number
>>
>> If a system have more than one SMT thread number the 2) may
>> not handle it well, since there're multiple thread numbers in the
>> system and 2) only accept 1/max_thread_number. So issue a warning
>> to notify the users if such system detected.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   arch/arm64/kernel/topology.c | 61 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 61 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>> index 1a2c72f3e7f8..2fa584b932ee 100644
>> --- a/arch/arm64/kernel/topology.c
>> +++ b/arch/arm64/kernel/topology.c
>> @@ -15,8 +15,10 @@
>>   #include <linux/arch_topology.h>
>>   #include <linux/cacheinfo.h>
>>   #include <linux/cpufreq.h>
>> +#include <linux/cpu_smt.h>
>>   #include <linux/init.h>
>>   #include <linux/percpu.h>
>> +#include <linux/xarray.h>
>>     #include <asm/cpu.h>
>>   #include <asm/cputype.h>
>> @@ -37,17 +39,29 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>>       return !!is_threaded;
>>   }
>>   +struct cpu_smt_info {
>> +    int thread_num;
>> +    int core_id;
>> +    int cpu;
> 
> It doesn't seem that the 'cpu' is used. Maybe this should be removed,
> or used in the error message (I think this could be removed).
> 

sure. will remove..

>> +};
>> +
>>   /*
>>    * Propagate the topology information of the processor_topology_node tree to the
>>    * cpu_topology array.
>>    */
>>   int __init parse_acpi_topology(void)
>>   {
>> +    int max_smt_thread_num = 0;
>> +    struct cpu_smt_info *entry;
>> +    struct xarray hetero_cpu;
>> +    unsigned long hetero_id;
>>       int cpu, topology_id;
>>         if (acpi_disabled)
>>           return 0;
>>   +    xa_init(&hetero_cpu);
>> +
>>       for_each_possible_cpu(cpu) {
>>           topology_id = find_acpi_cpu_topology(cpu, 0);
>>           if (topology_id < 0)
>> @@ -57,6 +71,30 @@ int __init parse_acpi_topology(void)
>>               cpu_topology[cpu].thread_id = topology_id;
>>               topology_id = find_acpi_cpu_topology(cpu, 1);
>>               cpu_topology[cpu].core_id   = topology_id;
>> +
>> +            /*
>> +             * Build up the XArray using the heterogeneous ID of
>> +             * the CPU cluster. Store the CPU and SMT information
>> +             * of the first appeared CPU in the CPU cluster of this
>> +             * heterogeneous ID since the SMT information should be
>> +             * the same in this CPU cluster. Then we can know the
>> +             * SMT information of each heterogeneous CPUs in the
>> +             * system.
>> +             */
> 
> A suggestion just in case:
> /*
>  * In the PPTT, CPUs below a node with the 'identical
>  * implementation' flag have the same number of threads.
>  * Count the number of threads for only one CPU (i.e.
>  * one core_id) among those with the same hetero_id.
>  *
>  * One entry is created for each node having:
>  * - the 'identical implementation' flag
>  * - its parent not having the flag
>  */
> 

ok maybe we can also refer to the comments of find_acpi_cpu_topology_hetero_id() [1] to lead
reader there if they want more details.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/acpi/pptt.c#n794

> 
>> +            hetero_id = find_acpi_cpu_topology_hetero_id(cpu);
>> +            entry = (struct cpu_smt_info *)xa_load(&hetero_cpu, hetero_id);
>> +            if (!entry) {
>> +                entry = kzalloc(sizeof(*entry), GFP_KERNEL);
>> +                WARN_ON(!entry);
>> +
>> +                entry->cpu = cpu;
>> +                entry->core_id = topology_id;
>> +                entry->thread_num = 1;
>> +                xa_store(&hetero_cpu, hetero_id,
>> +                     entry, GFP_KERNEL);
>> +            } else if (entry->core_id == topology_id) {
>> +                entry->thread_num++;
>> +            }
>>           } else {
>>               cpu_topology[cpu].thread_id  = -1;
>>               cpu_topology[cpu].core_id    = topology_id;
>> @@ -67,6 +105,29 @@ int __init parse_acpi_topology(void)
>>           cpu_topology[cpu].package_id = topology_id;
>>       }
>>   +    /*
>> +     * This should be a short loop depending on the number of heterogeneous
>> +     * CPU clusters. Typically on a homogeneous system there's only one
>> +     * entry in the XArray.
>> +     */
> 
> I think it should be ok to remove the above/below comments
> 

I'd leave the above comment since this won't make people who are awared of the efficiency feel
nervous about the loop here...

will drop the below comment.

>> +    xa_for_each(&hetero_cpu, hetero_id, entry) {
>> +        /*
>> +         * If max_smt_thread_num has been initialized and doesn't match
>> +         * the thread number of this entry, then the system has
>> +         * heterogeneous SMT topology.
>> +         */
>> +        if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)
>> +            pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
>> +
>> +        if (entry->thread_num > max_smt_thread_num)
>> +            max_smt_thread_num = entry->thread_num;
>> +
>> +        xa_erase(&hetero_cpu, hetero_id);
>> +        kfree(entry);
>> +    }
>> +
>> +    cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
>> +    xa_destroy(&hetero_cpu);
>>       return 0;
>>   }
>>   #endif
> 
> Otherwise I tested the SMT detection and it worked well
> 

appreciated for the tests!

Thanks.




