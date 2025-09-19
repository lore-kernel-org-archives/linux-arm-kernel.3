Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CA1CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 10:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wu9/kvujoYXelzj/YUHvOz8FiqXY1dI1nlq1Z/3YChM=; b=u9mqRgNLeGPVwao04We7BQ3Kfq
	tL1znRhHOcW0BKTHgU4S3pvZcGGUSJiGQGof+8y17S3PQ0SVjzsRid8JFoyFzFsjQ/jZVExyQEQ2u
	g9FUrHuSy+TIhexWFKb388rKd699H/eARtRR19hD4Iguhvp43WcgwJXlYVC9kXvmfXaiD15W0M3vA
	a86ptRKclORQvjeWW1Ypa3IAZhiT1DFSIpjYNIAnOkH2/c/CrElVuuAbABa1EzakjHAQmfD6yq472
	QDyvIZR02a4nyeehIFMEX8DVcGoYaxL5NeUVPEQeyehtxD88JaQLFcq3q/SCdMGUZbezJ96LrBLcC
	Biw4SGxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzYLT-00000002Z9y-25MH;
	Fri, 19 Sep 2025 10:28:03 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzYLQ-00000002Z8f-2T3x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 10:28:02 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4cSpVv6fcGz2Cg7q;
	Fri, 19 Sep 2025 18:23:19 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 3CFD514025A;
	Fri, 19 Sep 2025 18:27:56 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 19 Sep 2025 18:27:56 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 19 Sep 2025 18:27:55 +0800
CC: <yangyicong@hisilicon.com>, Will Deacon <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <sudeep.holla@arm.com>,
	<james.clark@linaro.org>, <robh@kernel.org>, <anshuman.khandual@arm.com>,
	<jonathan.cameron@huawei.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <wangyushan12@huawei.com>
Subject: Re: [PATCH v2 2/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT
 cores
To: Mark Rutland <mark.rutland@arm.com>
References: <20250820084534.28037-1-yangyicong@huawei.com>
 <20250820084534.28037-3-yangyicong@huawei.com>
 <aMwJ5FpGRmsyhQuZ@willie-the-truck>
 <d890b8e6-37f5-4466-b580-7e6d8c1d29bf@huawei.com>
 <aM0fgQvO6p91mF_u@J2N7QTR9R3>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <49ca87d6-9e5f-96f1-d807-b936d2e1c483@huawei.com>
Date: Fri, 19 Sep 2025 18:27:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <aM0fgQvO6p91mF_u@J2N7QTR9R3>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_032800_943672_34B9C989 
X-CRM114-Status: GOOD (  26.69  )
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

On 2025/9/19 17:16, Mark Rutland wrote:
> On Fri, Sep 19, 2025 at 04:56:18PM +0800, Yicong Yang wrote:
>> On 2025/9/18 21:32, Will Deacon wrote:
>>> On Wed, Aug 20, 2025 at 04:45:34PM +0800, Yicong Yang wrote:
> 
>>>> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
>>>> index 5c310e803dd7..137ef55d6973 100644
>>>> --- a/drivers/perf/arm_pmu.c
>>>> +++ b/drivers/perf/arm_pmu.c
>>>> @@ -901,6 +901,9 @@ struct arm_pmu *armpmu_alloc(void)
>>>>  
>>>>  		events = per_cpu_ptr(pmu->hw_events, cpu);
>>>>  		events->percpu_pmu = pmu;
>>>> +
>>>> +		if (!pmu->has_smt && topology_core_has_smt(cpu))
>>>> +			pmu->has_smt = true;
>>>
>>> Why isn't that just:
>>>
>>> 	pmu->has_smt = topology_core_has_smt(cpu);
>>>
>>> ?
>>
>> also works. since one pmu only contains one type of CPU, so just thought
>> no need to set it multiple times.
>>
>>> but then if that's the case, why do we need to stash the result in the
>>> PMU at all?
>>
>> should based on the discussion here [1]. stash it during probe will avoid
>> calling {raw_}smp_processor_id() in pmu::event_init() which may be
>> horrible for debug in some condition.
>>
>> [1] https://lore.kernel.org/linux-arm-kernel/aJsV7nzlILHd_ZMa@J2N7QTR9R3/
> 
> This isn't about being 'horrible for debug'; my comment there was saying
> that the proposed patch was incorrect AND it would be horrible to debug
> that in practice when it inevitably went wrong.
> 
> The key details are:
> 
> (1) We need pmu::event_init() to know whether the cycle counter can be
>     used such that it doesn't permit a group to be created which can
>     *NEVER* be scheduled in hardware. Otherwise, the core perf code will
>     waste time periodically trying to schedule that group when it will
>     *ALWAYS* be rejected by pmu::add().
> 
> (2) The pmu::event_init() call runs in a preemptible context and can
>     run on any CPU in the system, completely independent of the PMU's
>     supported CPUs. Thus [raw_]smp_processor_id() tells you nothing
>     about the CPU(s) the event will run on.
> 
>     Note that for task-bound events, the event->cpu is -1, so that
>     doesn't tell us either. Only the PMU instance tells us the set of
>     CPUs.
> 

yes this is the problem in the last approach using [raw_]smp_processor_id()
in pmu::event_init().. sorry for the wrong information replied above and
thanks for help me recall this..

> We can solve that by either stashing this boolean flag at probe time OR
> having pmu::event_init() check something like:
> 
> 	topology_core_has_smt(cpumask_first(pmu->supported_cpus));
> 

this works. I didn't think of this approach... pmu->supported_cpus may contain
offline CPUs but it doesn't matter since topology_core_has_smt() can also
retieve the SMT implementation for offline CPU.

> ... and I think stashing at probe time is nicer/clearer.
> 

I feel similar. will wait for Will's comments :)

thanks.

