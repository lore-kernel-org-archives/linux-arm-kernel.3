Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11161CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 08:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LkqoE3lmoPfgENOimdSBmjVSv3R56mgJVY4VbBfJfU=; b=EhmtKMdR4Nf9ZBtYZHKFUKwa8h
	1C295BbVcBaJHgTueiJI0ao+n2i9NM+2dCIz7/jcak/uWfJ1eRumMtxswohGM5DuvoHB5Kr6BXhqf
	4CnIRb64CAUKBJyz/XXO9MNTMrPBIzAXPXmOPaigqnRzLDvwFi76lop2JByR/0HOg8RmJiUCyYrYp
	GTCJPlpfmdhWJ2w9tIlkIka4jwuNSnnYFzJ/WbA6Iu3HZALSG1qjy1aVLWcBCIJwPcknYTMvXIV4N
	LBaRO0qa+0UqwLXJuKUIOxS7fj4dXWzljpMTqeGQnEsjAEpvfcvtBuYyPhn9nkXoIsPJCWEPtqwst
	Q1BX1OMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWuo-00000002JDh-1mav;
	Fri, 19 Sep 2025 08:56:26 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWul-00000002JD5-3e5z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 08:56:25 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4cSmTC0kKMzddDS;
	Fri, 19 Sep 2025 16:51:43 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 98F2B18006C;
	Fri, 19 Sep 2025 16:56:19 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 19 Sep 2025 16:56:19 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 19 Sep 2025 16:56:18 +0800
CC: <yangyicong@hisilicon.com>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <sudeep.holla@arm.com>,
	<james.clark@linaro.org>, <robh@kernel.org>, <anshuman.khandual@arm.com>,
	<jonathan.cameron@huawei.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <wangyushan12@huawei.com>
Subject: Re: [PATCH v2 2/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT
 cores
To: Will Deacon <will@kernel.org>
References: <20250820084534.28037-1-yangyicong@huawei.com>
 <20250820084534.28037-3-yangyicong@huawei.com>
 <aMwJ5FpGRmsyhQuZ@willie-the-truck>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <d890b8e6-37f5-4466-b580-7e6d8c1d29bf@huawei.com>
Date: Fri, 19 Sep 2025 16:56:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <aMwJ5FpGRmsyhQuZ@willie-the-truck>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_015624_244972_5F0FA4DB 
X-CRM114-Status: GOOD (  19.33  )
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

On 2025/9/18 21:32, Will Deacon wrote:
> On Wed, Aug 20, 2025 at 04:45:34PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> CPU_CYCLES is expected to count the logical CPU (PE) clock. Currently it's
>> preferred to use PMCCNTR_EL0 for counting CPU_CYCLES, but it'll count
>> processor clock rather than the PE clock (ARM DDI0487 L.b D13.1.3) if
>> one of the SMT siblings is not idle on a multi-threaded implementation.
>> So don't use it on SMT cores.
>>
>> Introduce topology_core_has_smt() for knowing the SMT implementation and
>> cached it in arm_pmu::has_smt during allocation.
>>
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
>>  drivers/perf/arm_pmu.c        |  3 +++
>>  drivers/perf/arm_pmuv3.c      | 10 ++++++++++
>>  include/linux/arch_topology.h | 11 +++++++++++
>>  include/linux/perf/arm_pmu.h  |  1 +
>>  4 files changed, 25 insertions(+)
>>
>> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
>> index 5c310e803dd7..137ef55d6973 100644
>> --- a/drivers/perf/arm_pmu.c
>> +++ b/drivers/perf/arm_pmu.c
>> @@ -901,6 +901,9 @@ struct arm_pmu *armpmu_alloc(void)
>>  
>>  		events = per_cpu_ptr(pmu->hw_events, cpu);
>>  		events->percpu_pmu = pmu;
>> +
>> +		if (!pmu->has_smt && topology_core_has_smt(cpu))
>> +			pmu->has_smt = true;
> 
> Why isn't that just:
> 
> 	pmu->has_smt = topology_core_has_smt(cpu);
> 
> ?

also works. since one pmu only contains one type of CPU, so just thought
no need to set it multiple times.

> 
> but then if that's the case, why do we need to stash the result in the
> PMU at all?
> 

should based on the discussion here [1]. stash it during probe will avoid
calling {raw_}smp_processor_id() in pmu::event_init() which may be
horrible for debug in some condition.

[1] https://lore.kernel.org/linux-arm-kernel/aJsV7nzlILHd_ZMa@J2N7QTR9R3/

thanks.

