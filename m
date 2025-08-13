Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB49C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 08:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvgJRbKZgcDP62aWN+XSTDcVuXGJa/6Gej/4auMyvgI=; b=uFbjpJM5lMijCcLHM582BlVSGT
	7w7WdFbTDl9YOu4jIUq31EJQ+Yn04CMfxeYl28QJyTDRsVeoles7+tD2bYW3PSZ1QfTI3Yc4EaQ6a
	zKJrBMAxPPVSqI2BBTBxwmDb5nk7SVmtDfDEGc9I+4hyd11KkFnb6eqBpPYESxfZ4iKdvttyAzK91
	hj/Ki84mDsuphwBKLx+qQQyHbyAPZdzi0Z6Sk8KBjLqWSYIYkivLhZOfIR6d+H4o6ic8CqBaCJQqx
	CJXl38PzRKAPzMsxtI/JouOoTRDd11oKBhyfVHFNspGtFdwxZyEEKRWYhXfu9UKNmlGmBQU5C4UoE
	XZvPPykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6xC-0000000D7IL-3VBr;
	Wed, 13 Aug 2025 08:35:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6ue-0000000D6vu-2RyA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 08:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:CC:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TvgJRbKZgcDP62aWN+XSTDcVuXGJa/6Gej/4auMyvgI=; b=WbVVdJ9a/y6KUODTa6mKwRiZOh
	FJc1528Is6zTGIYF8iB467EoZ3E8rvcJehLGewgQETfsBQkP2WYAf/PqM1S9lPtr7+gGW2OLyWeIB
	cN+fqfKrbnPtUPSGtG4Nx1gKvqZBQeGBG3PVVVv43/mxhM+GL5EXmyEroXxrvyhRtGX6oB8db3ev2
	Ah9aT5NWSGXXeCtO/WAZgkN0nJFbY5xKoh55l3qYa4KcU4nfNnJkaPFNOVnjKskK3dDK6FBUMSbjU
	b19uWW2Im3bk3vNc5QLcUUA6q6y0mhOCKM0kpcuSrobvBXa68RrVTWhAC62NmUt0jVBaIqD1kVyqT
	igRsOmkA==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6uZ-0000000G0le-0Wnt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 08:32:45 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c21hG2n1pz14MWD;
	Wed, 13 Aug 2025 16:27:26 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id C038414027A;
	Wed, 13 Aug 2025 16:32:25 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 13 Aug 2025 16:32:25 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 13 Aug 2025 16:32:24 +0800
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
 <931e26ef-bdc6-5f9e-8976-d5a4b8e6e81f@huawei.com>
 <647299e8-26e4-4b6c-b655-a072a3c8ee72@linaro.org>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <14d13d00-3bba-1edf-5eb3-7879d3dbaf4d@huawei.com>
Date: Wed, 13 Aug 2025 16:32:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <647299e8-26e4-4b6c-b655-a072a3c8ee72@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_093244_250194_5EF278AD 
X-CRM114-Status: GOOD (  26.09  )
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

On 2025/8/12 18:31, James Clark wrote:
> 
> 
> On 12/08/2025 11:14 am, Yicong Yang wrote:
>> On 2025/8/12 18:00, James Clark wrote:
>>>
>>>
>>> On 12/08/2025 9:08 am, Yicong Yang wrote:
>>>> From: Yicong Yang <yangyicong@hisilicon.com>
>>>>
>>>> CPU_CYCLES is expected to count the logical CPU (PE) clock. Currently it's
>>>> preferred to use PMCCNTR_EL0 for counting CPU_CYCLES, but it'll count
>>>> processor clock rather than the PE clock (ARM DDI0487 L.b D13.1.3) if
>>>> one of the SMT siblings is not idle on a multi-threaded implementation.
>>>> So don't use it on SMT cores.
>>>>
>>>> When counting cycles on SMT CPU 2-3 and CPU 3 is idle, without this
>>>> patch we'll get:
>>>> [root@client1 tmp]# perf stat -e cycles -A -C 2-3 -- stress-ng -c 1
>>>> --taskset 2 --timeout 1
>>>> [...]
>>>>    Performance counter stats for 'CPU(s) 2-3':
>>>>
>>>> CPU2           2880457316      cycles
>>>> CPU3           2880459810      cycles
>>>>          1.254688470 seconds time elapsed
>>>>
>>>> With this patch the idle state of CPU3 is observed as expected:
>>>> [root@client1 ~]#  perf stat -e cycles -A -C 2-3 -- stress-ng -c 1
>>>> --taskset 2 --timeout 1
>>>> [...]
>>>>    Performance counter stats for 'CPU(s) 2-3':
>>>>
>>>> CPU2           2558580492      cycles
>>>> CPU3               305749      cycles
>>>>          1.113626410 seconds time elapsed
>>>>
>>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>>>> ---
>>>>    drivers/perf/arm_pmuv3.c | 9 +++++++++
>>>>    1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
>>>> index 95c899d07df5..ed3149632b71 100644
>>>> --- a/drivers/perf/arm_pmuv3.c
>>>> +++ b/drivers/perf/arm_pmuv3.c
>>>> @@ -1002,6 +1002,15 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>>>>        if (has_branch_stack(event))
>>>>            return false;
>>>>    +    /*
>>>> +     * The PMCCNTR_EL0 increments from the processor clock rather than
>>>> +     * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
>>>> +     * counting on a WFI PE if one of its SMT silbing is not idle on a
>>>> +     * multi-threaded implementation. So don't use it on SMT cores.
>>>> +     */
>>>> +    if (cpumask_weight(topology_sibling_cpumask(smp_processor_id())) > 1)
>>>> +        return false;
>>>> +
>>>
>>> Isn't this something that's static to the PMU? If all CPUs in each PMU are always the same then this doesn't need to be probed every time and can be set once.
>>>
>> we can make use of PMCCNTR_EL0 if the SMT is runtime disabled, e.g. by /sys/devices/system/cpu/smt/control
>> if set this at probe time then we permanently lose the chance to use PMCCNTR_EL0.
>>
> 
> Is that a valuable usecase though? I don't actually know the answer to this. How common is disabling SMT on SMT cores and then also using PMU events in a way that you would miss having the extra cycles counter, despite not minding that you didn't have it when SMT was enabled?
> 

I suppose it won't be frequent. just an example to show that the SMT can be runtime disabled and in such case we can
make use of PMCCNTR_EL0. but...

> And would it correctly handle enabling and disabling SMT after the event has already started? Feels like it wouldn't if you start the event with it disabled and it puts it onto PMCCNTR_EL0 then you enable it and the counts become wrong again.
> 

...as you mentioned it will be a problem if we use PMCCNTR_EL0 but the SMT is later enabled.

>>
>>> Also you can't call smp_processor_id() from here because this is also called in armpmu_event_init() -> __hw_perf_event_init() -> validate_group() before the event is actually scheduled on a CPU. With CONFIG_DEBUG_PREEMPT you'd see the error.
>>
>> ok, will use raw_smp_processor_id() instead. it won't affect the validation checking in pmu::event_init().
>> in pmu::add() the cpu id is always stable so it'll also be fine.
>>
>> Thanks.
>>
>>
> 
> That feels a bit wrong but I suppose it will work. Maybe the real problem is that validation is doing too much. I know it's to re-use code, but then we're doing things as part of the validation that don't make sense. That can confuse the reader or it's just wasted effort. Also using raw removes the safety check which might mean it gets refactored into somewhere were it isn't valid to call it in the future.
> 

ok. as Mark mentioned in this way the group validation will be affected.

thanks.



