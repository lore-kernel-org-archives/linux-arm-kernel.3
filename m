Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC42CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 08:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2t6eAzkVvp8Qu/Z8lAZgu0tEi3eS4GJsdvPNGE2knkI=; b=o11jiMQZ3UdQPPgM2SLsHt+4f/
	AG43UJ9UoCK56nVUjr3VeLR+meIh8ZeVXQxTKkLhtm8CeJkWUnV/ejVIn6UvTqLOCVyz1SQHXqP20
	bNLRmIMU2NC9Ay7yGwRGVnpWVZZ5lbnQUsm8KQ8CzQAvZsCz4cUX9H1vcwwByd/aIEoOwNxF4oUr1
	ceUnomVcmx04rHXTiyhXvIHAWhqj5MPeqg5DJigZ9h0IrUQN/VYwMlJ0ux6a16rpe3/rOYegjGDVj
	bBe1xdO8j0DH9A6hIFUaBqT70bgtQ95O6WAkXURWQoM3heWDAKYmqTMHHWnb4AsdCybtTyzuCEEXE
	4y56vMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6gm-0000000D4GT-30kG;
	Wed, 13 Aug 2025 08:18:28 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6SN-0000000D1nc-1sur
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 08:03:37 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4c215Y59pfz2Dc26;
	Wed, 13 Aug 2025 16:00:49 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 5A9D01A016C;
	Wed, 13 Aug 2025 16:03:29 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 13 Aug 2025 16:03:29 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 13 Aug 2025 16:03:28 +0800
CC: <yangyicong@hisilicon.com>, <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <james.clark@linaro.org>,
	<robh@kernel.org>, <anshuman.khandual@arm.com>,
	<jonathan.cameron@huawei.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <wangyushan12@huawei.com>
Subject: Re: [PATCH 2/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
To: Mark Rutland <mark.rutland@arm.com>
References: <20250812080830.20796-1-yangyicong@huawei.com>
 <20250812080830.20796-3-yangyicong@huawei.com> <aJsYah_DGPIQ5v3-@J2N7QTR9R3>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <5c7bce33-da6a-28e6-cbd6-2aedd7e6b378@huawei.com>
Date: Wed, 13 Aug 2025 16:03:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <aJsYah_DGPIQ5v3-@J2N7QTR9R3>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_010335_856048_0858EEDC 
X-CRM114-Status: GOOD (  24.28  )
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

On 2025/8/12 18:33, Mark Rutland wrote:
> On Tue, Aug 12, 2025 at 04:08:30PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> CPU_CYCLES is expected to count the logical CPU (PE) clock. Currently it's
>> preferred to use PMCCNTR_EL0 for counting CPU_CYCLES, but it'll count
>> processor clock rather than the PE clock (ARM DDI0487 L.b D13.1.3) if
>> one of the SMT siblings is not idle on a multi-threaded implementation.
>>
>> So don't use it on SMT cores.
> 
> This is rather unfortunate.
> 
> When does this actually matter?
> 

the event metrics use cycles will be affected, like IPC. also the cycles profiling
for code's hotspot. the result won't be precise, e.g. if the thread 0 is running at
half speed while it's sibling thread 1 is running at full speed. also sometimes
we'll use cycles to detect the currently running frequency. the senarios maybe
non-exhaustive.

> Per ARM DDI 0487 L.b, page D14-6918:
> 
> | If FEAT_PMUv3p9 is implemented, then CPU_CYCLES does not increment
> | when the clocks are stopped by WFI and WFE instructions. Otherwise, it
> | is CONSTRAINED UNPREDICTABLE whether or not CPU_CYCLES continues to
> | increment when the clocks are stopped by WFI and WFE instructions.
> 
> ... so prior to FEAT_PMUv3p9, no-one could rely on the difference
> anyway.
> 
>> When counting cycles on SMT CPU 2-3 and CPU 3 is idle, without this
>> patch we'll get:
>> [root@client1 tmp]# perf stat -e cycles -A -C 2-3 -- stress-ng -c 1
>> --taskset 2 --timeout 1
>> [...]
>>  Performance counter stats for 'CPU(s) 2-3':
>>
>> CPU2           2880457316      cycles
>> CPU3           2880459810      cycles
>>        1.254688470 seconds time elapsed
>>
>> With this patch the idle state of CPU3 is observed as expected:
>> [root@client1 ~]#  perf stat -e cycles -A -C 2-3 -- stress-ng -c 1
>> --taskset 2 --timeout 1
>> [...]
>>  Performance counter stats for 'CPU(s) 2-3':
>>
>> CPU2           2558580492      cycles
>> CPU3               305749      cycles
>>        1.113626410 seconds time elapsed
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  drivers/perf/arm_pmuv3.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
>> index 95c899d07df5..ed3149632b71 100644
>> --- a/drivers/perf/arm_pmuv3.c
>> +++ b/drivers/perf/arm_pmuv3.c
>> @@ -1002,6 +1002,15 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>>  	if (has_branch_stack(event))
>>  		return false;
>>  
>> +	/*
>> +	 * The PMCCNTR_EL0 increments from the processor clock rather than
>> +	 * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
>> +	 * counting on a WFI PE if one of its SMT silbing is not idle on a
>> +	 * multi-threaded implementation. So don't use it on SMT cores.
>> +	 */
>> +	if (cpumask_weight(topology_sibling_cpumask(smp_processor_id())) > 1)
>> +		return false;
> 
> This effectively forbids use of PMCCNTR_EL0 for any events.
> 
> Is there any existing event that it is useful for?
> 

I think no. we're using the core pmu's events in a per-cpu (PE) manner. users don't
know whether this CPU_CYCLES events is scheduled on the PMCCNTR_EL0 or a common
counter so they also have no way to use PMCCNTR_EL0.

thanks.



