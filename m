Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87331D5D672
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 17:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLcLe1lppCElbSoTVeyvY8TiKkX0ea4jaUYFfrewuuo=; b=3U+rJKHAWN7fUpMT+UjtXjinCS
	oNN4J8i1g4jznkqzft3mxTkEcoDIAswc8+NLWzstdWGy+akfUsIiZ4bnRh26rzoSy6rL1JWvwnFKe
	kTXu0JOU2eVmoy3zRG92qej/fKcZ/tTH8K/YX52G30Z/SYjUbgd9nc9DrX5HpR97940mldZFwiw49
	GZjduvD+o3d/ugQxki9i9UdBIaLThDTYtwLK8u4RcXGdAidqvqdPuwyULxqdsfRqAXJHGTCnrqx2c
	Ui+RFkyGl9GgCifNrx49PJxcUtIJyy7PbaR/BRnV96Kzi5yfNIu7LjTj2DiWCI0x5G8Kb34GTBBMt
	K0Wk26aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t96Ez-00000007o4H-35bh;
	Thu, 07 Nov 2024 17:24:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t96BQ-00000007nIs-298g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 17:20:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98D0D1063;
	Thu,  7 Nov 2024 09:21:05 -0800 (PST)
Received: from [10.57.26.139] (unknown [10.57.26.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C7C13F6A8;
	Thu,  7 Nov 2024 09:20:30 -0800 (PST)
Message-ID: <a8a41066-e569-44c4-aa96-176d4788c7b6@arm.com>
Date: Thu, 7 Nov 2024 18:20:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
To: Yicong Yang <yangyicong@huawei.com>, Thomas Gleixner
 <tglx@linutronix.de>, catalin.marinas@arm.com, will@kernel.org,
 sudeep.holla@arm.com, peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, dietmar.eggemann@arm.com
Cc: yangyicong@hisilicon.com, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, xuwei5@huawei.com,
 guohanjun@huawei.com
References: <20241030125415.18994-1-yangyicong@huawei.com>
 <20241030125415.18994-2-yangyicong@huawei.com> <87ttcty71m.ffs@tglx>
 <488d8289-b538-01cb-5de7-d691f49c0d7b@huawei.com>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <488d8289-b538-01cb-5de7-d691f49c0d7b@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_092036_629420_5F104EF9 
X-CRM114-Status: GOOD (  15.88  )
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



On 10/31/24 13:17, Yicong Yang wrote:
> On 2024/10/30 22:55, Thomas Gleixner wrote:
>> On Wed, Oct 30 2024 at 20:54, Yicong Yang wrote:
>>>   
>>> +#ifndef topology_is_primary_thread
>>> +#define topology_is_primary_thread topology_is_primary_thread
>>
>> Please do not glue defines and functions together w/o a newline in between.
>>
> 
> sure, will add a newline here.
> 
>>> +static inline bool topology_is_primary_thread(unsigned int cpu)
>>> +{
>>> +	/*
>>> +	 * On SMT hotplug the primary thread of the SMT won't be disabled.
>>> +	 * Architectures do have a special primary thread (e.g. x86) need
>>> +	 * to override this function. Otherwise just make the first thread
>>> +	 * in the SMT as the primary thread.
>>> +	 */
>>> +	return cpu == cpumask_first(topology_sibling_cpumask(cpu));
>>
>> How is that supposed to work? Assume both siblings are offline, then the
>> sibling mask is empty and you can't boot the CPU anymore.
>>
> 
> For architectures' using arch_topology, topology_sibling_cpumask() will at least
> contain the tested CPU itself. This is initialized in
> drivers/base/arch_topology.c:reset_cpu_topology(). So it won't be empty here.
> 
> Besides we don't need to check topology_is_primary_thread() at boot time:
> -> cpu_up(cpu)
>       cpu_bootable()
>         if (cpu_smt_control == CPU_SMT_ENABLED &&
>             cpu_smt_thread_allowed(cpu)) // will always return true if !CONFIG_SMT_NUM_THREADS_DYNAMIC
>           return true; // we'll always return here and @cpu is always bootable
> 
> Also tested fine in practice.
> 
> Thanks.
> 
> 

FWIW, I also tested the case where:
- setting maxcpus=1 in the kernel cmdline to have CPUs that never booted
- setting smt to off:
   'echo off > /sys/devices/system/cpu/smt/control'
and effectively the primary CPUs can boot and secondary CPUs can't,
so it works as expected.

