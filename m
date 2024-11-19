Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241BAD44148
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 12:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzY5TtQm6Ue6u4zoUA9OEnl0DUpLjxzz4KUu1sghaI4=; b=X2qcFw1hrNkXK/DgPI67sieZHx
	kw/Zs+HzXWQAR43spxD9V8OOYyp1tNxyT9FBL3VtPxK3eBL8XDqA+RFveXg4jrJ/RazNeV0ds5BGN
	rAra977gO3nWgiip0n+YqY454Ckq+ML8USnfXxHCgkDRi0JOS/xrKj55K0PwKezG5xNvNmMlxt2B7
	NKaStjyceRRDppSc0j0Kg/QsoyzQvV5sYjY92a0uZ8BIDXZbDlB9wRgXSvmcE2D+WBI7OeI6TeDyI
	ZBGDtz2Ma1ehgvsc4ipWH4mZUo7tTyaNWUkRuHKfmEcn30d1OdpKmClwGVht/Vu2abxmqDpPC2QVA
	QX3WFjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNLa-0000000CMs1-3RBE;
	Tue, 19 Nov 2024 12:28:46 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNKd-0000000CMbe-29Ad
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 12:27:49 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xt3d26qkHz21kWm;
	Tue, 19 Nov 2024 20:26:14 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 17D7014010C;
	Tue, 19 Nov 2024 20:27:36 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 19 Nov 2024 20:27:35 +0800
CC: <yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <mpe@ellerman.id.au>,
	<peterz@infradead.org>, <tglx@linutronix.de>, <sudeep.holla@arm.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <linux-kernel@vger.kernel.org>,
	<morten.rasmussen@arm.com>, <msuchanek@suse.de>,
	<gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<dave.hansen@linux.intel.com>
Subject: Re: [PATCH v9 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
To: Dietmar Eggemann <dietmar.eggemann@arm.com>, Pierre Gondois
	<pierre.gondois@arm.com>
References: <20241114141127.23232-1-yangyicong@huawei.com>
 <20241114141127.23232-2-yangyicong@huawei.com>
 <427bd639-33c3-47e4-9e83-68c428eb1a7d@arm.com>
 <3876e185-2fcc-25dd-e70d-93fdcbf8fc37@huawei.com>
 <ab5d70ad-d4a4-4116-82c6-908b9e641ee6@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <6d732b89-d3d4-7bd6-d60e-e8bea05d05cf@huawei.com>
Date: Tue, 19 Nov 2024 20:27:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <ab5d70ad-d4a4-4116-82c6-908b9e641ee6@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_042747_867389_5FA82AA4 
X-CRM114-Status: GOOD (  20.98  )
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

On 2024/11/18 23:04, Dietmar Eggemann wrote:
> On 18/11/2024 11:50, Yicong Yang wrote:
>> On 2024/11/15 17:42, Pierre Gondois wrote:
>>> Hello Yicong,
>>>
>>>
>>> On 11/14/24 15:11, Yicong Yang wrote:
>>>> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> [...]
> 
>>>>   diff --git a/include/linux/topology.h b/include/linux/topology.h
>>>> index 52f5850730b3..b8e860276518 100644
>>>> --- a/include/linux/topology.h
>>>> +++ b/include/linux/topology.h
>>>> @@ -240,6 +240,26 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
>>>>   }
>>>>   #endif
>>>>   +#ifndef topology_is_primary_thread
>>>> +
>>>> +#define topology_is_primary_thread topology_is_primary_thread
>>>> +
>>>> +static inline bool topology_is_primary_thread(unsigned int cpu)
>>>> +{
>>>> +    /*
>>>> +     * On SMT hotplug the primary thread of the SMT won't be disabled.
>>>> +     * Architectures do have a special primary thread (e.g. x86) need
>>>> +     * to override this function. Otherwise just make the first thread
>>>> +     * in the SMT as the primary thread.
>>>> +     *
>>>> +     * The sibling cpumask of an offline CPU contains always the CPU
>>>> +     * itself.
>>>
>>> As Thomas suggested, would it be possible to check it for other
>>> architectures ?
>>> For instance for loongarch at arch/loongarch/kernel/smp.c,
>>> clear_cpu_sibling_map() seems to completely clear &cpu_sibling_map[cpu]
>>> when a CPU is put offline. This would make topology_sibling_cpumask(cpu)
>>> to be empty and cpu_bootable() return false if the CPU never booted before.
>>>
>>
>> cpu_bootable() only affects architectures select HOTPLUG_SMT, otherwise it'll always
>> return true. Since x86 and powerpc have their own illustration of primary thread and
>> have an override version of this funciton, arm64 is the only user now by this patchset.
>> We have this guarantee for arm64 and also for other architectures using arch_topology.c
>> (see clear_cpu_topology()). So if loogarch has a different implementation, they
>> should implement a topology_is_primary_thread() variant to support HOTPLUG_SMT.
> 
> I also stumbled over this sentence.
> 
> drivers/base/arch_topology.c:
> 
> void clear_cpu_topology(int cpu)                   (2)
> 
>   ...
>   cpumask_set_cpu(cpu, &cpu_topo->thread_sibling)  (4)
> 
> void __init reset_cpu_topology(void)               (1)
> 
>   for_each_possible_cpu(cpu)
> 
>     ...
>     clear_cpu_topology(cpu)                        (2)
> 
> #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV) (3)
> void __init init_cpu_topology(void)
> 
>   reset_cpu_topology()                             (1)
>   ...
> 
> Does this mean the default implementation relies on (4), i.e. is only
> valid for arm64 and riscv? (3)
> Do all the other archs then have to overwrite the default implementation
>  (like x86 and powerpc) if they want to implement CONFIG_HOTPLUG_SMT?
> 

I think yes if they have problems with the default implementation. That's
what used to be to support HOTPLUG_SMT before this, each arthitecture
provides their own variant of topology_is_primary_thread.

The current approach may also work since cpu_bootable() will make all the
CPUs boot at least once:
static inline bool cpu_bootable(unsigned int cpu) {
[...]
	if (topology_is_primary_thread(cpu))
		return true;

	return !cpumask_test_cpu(cpu, &cpus_booted_once_mask); // True if not booted
}

The boot process will be like below. cpu_bootable() is checked twice:
-> cpu_up()
     cpu_bootable() (1)
     [...]
     cpuhp_bringup_ap()
       [ archs usually update the sibling_mask in start_secondary() here ]
       bringup_wait_for_ap_online()
         if (!cpu_bootable(cpu)) (2)
           return -ECANCELED // roll back and offline this CPU

So an empty mask in (1) won't block the CPU going online. And the default
topology_is_primary_thread() should work if sibling mask updated before
the checking in (2). I hacked x86 to use the default topology_is_primary_thread
and tested on a qemu vm and it seems also work (just for test since the
primary thread should not always be the 1st thread in the core on x86,
not quite sure).

Thanks.



