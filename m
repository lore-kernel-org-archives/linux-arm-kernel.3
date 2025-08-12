Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869DBCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crhlZ27g4TUM573iiD8kotFvcsvZbOjV/R2z9geUIeQ=; b=FNqSZCPD0MRhJAmuln/QJZS/DO
	T5TXZN6I+QRAWZCzKQWB3qfbitp+0N85RjhZUwRIlsOTfkJED6uP2jLonczp4qYwDg4cH9vTw1gPD
	nP9o6cL858B949I4hANbAE3HYuIzX9FMq3wbJKksCsLg5rPkhUlQS0yzRgR8/wjx+J5JiO4QoxV+w
	g+UkOJ+r9c8nMg5VM5EdmEleSwKWHhv4HwOqx54N/kgiI0h5GBOb46uBFPELSzJLhqIFH7oX9mffh
	rmrQS2VB8DKc1DE34qQ1GVvih6I1W8Ddybb/Mg3yz82NNGQnKnBGIAdJC+ARUQ/K+dra7M0oSNllx
	TefhffGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulri5-0000000BHlr-3UxO;
	Tue, 12 Aug 2025 16:18:49 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulm1p-0000000AUOA-1eA9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 10:14:51 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c1S2Y2B3zz13N3g;
	Tue, 12 Aug 2025 18:11:17 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 413741402EB;
	Tue, 12 Aug 2025 18:14:40 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 12 Aug 2025 18:14:34 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 12 Aug 2025 18:14:34 +0800
CC: <yangyicong@hisilicon.com>, <robh@kernel.org>,
	<anshuman.khandual@arm.com>, <jonathan.cameron@huawei.com>,
	<hejunhao3@huawei.com>, <linuxarm@huawei.com>, <prime.zeng@hisilicon.com>,
	<xuwei5@huawei.com>, <wangyushan12@huawei.com>
Subject: Re: [PATCH 2/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
To: James Clark <james.clark@linaro.org>, <will@kernel.org>,
	<mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>
References: <20250812080830.20796-1-yangyicong@huawei.com>
 <20250812080830.20796-3-yangyicong@huawei.com>
 <3d37844a-63c5-49c2-9d6d-7c3665a95466@linaro.org>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <931e26ef-bdc6-5f9e-8976-d5a4b8e6e81f@huawei.com>
Date: Tue, 12 Aug 2025 18:14:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <3d37844a-63c5-49c2-9d6d-7c3665a95466@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_031449_725936_A0F74EBA 
X-CRM114-Status: GOOD (  19.44  )
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

On 2025/8/12 18:00, James Clark wrote:
> 
> 
> On 12/08/2025 9:08 am, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> CPU_CYCLES is expected to count the logical CPU (PE) clock. Currently it's
>> preferred to use PMCCNTR_EL0 for counting CPU_CYCLES, but it'll count
>> processor clock rather than the PE clock (ARM DDI0487 L.b D13.1.3) if
>> one of the SMT siblings is not idle on a multi-threaded implementation.
>> So don't use it on SMT cores.
>>
>> When counting cycles on SMT CPU 2-3 and CPU 3 is idle, without this
>> patch we'll get:
>> [root@client1 tmp]# perf stat -e cycles -A -C 2-3 -- stress-ng -c 1
>> --taskset 2 --timeout 1
>> [...]
>>   Performance counter stats for 'CPU(s) 2-3':
>>
>> CPU2           2880457316      cycles
>> CPU3           2880459810      cycles
>>         1.254688470 seconds time elapsed
>>
>> With this patch the idle state of CPU3 is observed as expected:
>> [root@client1 ~]#  perf stat -e cycles -A -C 2-3 -- stress-ng -c 1
>> --taskset 2 --timeout 1
>> [...]
>>   Performance counter stats for 'CPU(s) 2-3':
>>
>> CPU2           2558580492      cycles
>> CPU3               305749      cycles
>>         1.113626410 seconds time elapsed
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   drivers/perf/arm_pmuv3.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
>> index 95c899d07df5..ed3149632b71 100644
>> --- a/drivers/perf/arm_pmuv3.c
>> +++ b/drivers/perf/arm_pmuv3.c
>> @@ -1002,6 +1002,15 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>>       if (has_branch_stack(event))
>>           return false;
>>   +    /*
>> +     * The PMCCNTR_EL0 increments from the processor clock rather than
>> +     * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
>> +     * counting on a WFI PE if one of its SMT silbing is not idle on a
>> +     * multi-threaded implementation. So don't use it on SMT cores.
>> +     */
>> +    if (cpumask_weight(topology_sibling_cpumask(smp_processor_id())) > 1)
>> +        return false;
>> +
> 
> Isn't this something that's static to the PMU? If all CPUs in each PMU are always the same then this doesn't need to be probed every time and can be set once.
> 
we can make use of PMCCNTR_EL0 if the SMT is runtime disabled, e.g. by /sys/devices/system/cpu/smt/control
if set this at probe time then we permanently lose the chance to use PMCCNTR_EL0.


> Also you can't call smp_processor_id() from here because this is also called in armpmu_event_init() -> __hw_perf_event_init() -> validate_group() before the event is actually scheduled on a CPU. With CONFIG_DEBUG_PREEMPT you'd see the error.

ok, will use raw_smp_processor_id() instead. it won't affect the validation checking in pmu::event_init().
in pmu::add() the cpu id is always stable so it'll also be fine.

Thanks.



