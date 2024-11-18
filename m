Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D959BD49232
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 15:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhJz2n820RfIKKRXmPJ+olZDv6ZE74OuixOiG3FK7gI=; b=MvG8jJiy5nCZ75xfqHBTzZyDFJ
	uMEJKh39DiR17G6wMDEi5wq+BIjqcxFoulHtLp8Zmd7wB2NUIVrnn1imReOZZlE8vHrg5Ab7BS67j
	3T0Ba1d9XKLVeVE4vJdLuHbKovicIyTV2r46bypB+8wlF5KG2nYQ8fdhNJTnDuL4cwFsvHfyy6UIx
	hZYi1yNa1qRc/Bb3euZYQulRr5TVYvyBCjMlCHqzTVKp3NCAs+xOcCGmKGisHBo2czH6hKvHOn1aD
	ikpejhi7irZrhgT2v0cKOE/kjJnpAlgfxsQHHb2lZ6CQk3nd81k6B6Gn7ccR8yVdbyxLUhVHgdh5S
	c/h9P9Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3M2-00000009sEz-3ug1;
	Mon, 18 Nov 2024 15:07:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3JQ-00000009rcA-0A9c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 15:05:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 685B611FB;
	Mon, 18 Nov 2024 07:05:36 -0800 (PST)
Received: from [192.168.178.6] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B3183F5A1;
	Mon, 18 Nov 2024 07:05:01 -0800 (PST)
Message-ID: <ab5d70ad-d4a4-4116-82c6-908b9e641ee6@arm.com>
Date: Mon, 18 Nov 2024 16:04:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
To: Yicong Yang <yangyicong@huawei.com>,
 Pierre Gondois <pierre.gondois@arm.com>
Cc: yangyicong@hisilicon.com, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 bp@alien8.de, mingo@redhat.com, linux-arm-kernel@lists.infradead.org,
 mpe@ellerman.id.au, peterz@infradead.org, tglx@linutronix.de,
 sudeep.holla@arm.com, catalin.marinas@arm.com, will@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, xuwei5@huawei.com,
 guohanjun@huawei.com, dave.hansen@linux.intel.com
References: <20241114141127.23232-1-yangyicong@huawei.com>
 <20241114141127.23232-2-yangyicong@huawei.com>
 <427bd639-33c3-47e4-9e83-68c428eb1a7d@arm.com>
 <3876e185-2fcc-25dd-e70d-93fdcbf8fc37@huawei.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <3876e185-2fcc-25dd-e70d-93fdcbf8fc37@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_070512_158288_EC04D95E 
X-CRM114-Status: GOOD (  14.24  )
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

On 18/11/2024 11:50, Yicong Yang wrote:
> On 2024/11/15 17:42, Pierre Gondois wrote:
>> Hello Yicong,
>>
>>
>> On 11/14/24 15:11, Yicong Yang wrote:
>>> From: Yicong Yang <yangyicong@hisilicon.com>

[...]

>>>   diff --git a/include/linux/topology.h b/include/linux/topology.h
>>> index 52f5850730b3..b8e860276518 100644
>>> --- a/include/linux/topology.h
>>> +++ b/include/linux/topology.h
>>> @@ -240,6 +240,26 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
>>>   }
>>>   #endif
>>>   +#ifndef topology_is_primary_thread
>>> +
>>> +#define topology_is_primary_thread topology_is_primary_thread
>>> +
>>> +static inline bool topology_is_primary_thread(unsigned int cpu)
>>> +{
>>> +    /*
>>> +     * On SMT hotplug the primary thread of the SMT won't be disabled.
>>> +     * Architectures do have a special primary thread (e.g. x86) need
>>> +     * to override this function. Otherwise just make the first thread
>>> +     * in the SMT as the primary thread.
>>> +     *
>>> +     * The sibling cpumask of an offline CPU contains always the CPU
>>> +     * itself.
>>
>> As Thomas suggested, would it be possible to check it for other
>> architectures ?
>> For instance for loongarch at arch/loongarch/kernel/smp.c,
>> clear_cpu_sibling_map() seems to completely clear &cpu_sibling_map[cpu]
>> when a CPU is put offline. This would make topology_sibling_cpumask(cpu)
>> to be empty and cpu_bootable() return false if the CPU never booted before.
>>
> 
> cpu_bootable() only affects architectures select HOTPLUG_SMT, otherwise it'll always
> return true. Since x86 and powerpc have their own illustration of primary thread and
> have an override version of this funciton, arm64 is the only user now by this patchset.
> We have this guarantee for arm64 and also for other architectures using arch_topology.c
> (see clear_cpu_topology()). So if loogarch has a different implementation, they
> should implement a topology_is_primary_thread() variant to support HOTPLUG_SMT.

I also stumbled over this sentence.

drivers/base/arch_topology.c:

void clear_cpu_topology(int cpu)                   (2)

  ...
  cpumask_set_cpu(cpu, &cpu_topo->thread_sibling)  (4)

void __init reset_cpu_topology(void)               (1)

  for_each_possible_cpu(cpu)

    ...
    clear_cpu_topology(cpu)                        (2)

#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV) (3)
void __init init_cpu_topology(void)

  reset_cpu_topology()                             (1)
  ...

Does this mean the default implementation relies on (4), i.e. is only
valid for arm64 and riscv? (3)
Do all the other archs then have to overwrite the default implementation
 (like x86 and powerpc) if they want to implement CONFIG_HOTPLUG_SMT?

[...]

