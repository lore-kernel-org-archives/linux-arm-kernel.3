Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2A3C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 09:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4FzbJRoFIpdnPZJqvb8bY8EBkO0P8Qao2ti8QKPVRg=; b=xdZvxrhHQaT6tEaWzcuF7geLAf
	9YkF5JK0kzxOXkettZ8IeWcOU4Vz1UVDfHduKEvwuK4XsP8XoxdD+rXTIEZSHnGBvDSB2kfZVZzKc
	lzr+fG+WIPtIvS63Is2spnGlyk6nzmznaa/3yI2dxs/2LEKJEbVZiwawAowMxjPeokR3GB34qdmb9
	25WYfULWVeUWiRe/zYc9gs5Nl8ueXUTNDgn0Fn0C1UmUSJ26ziVcDYBJe6HOYzgjuk5MuqioXTmTi
	72Lp8rawQNT4qRXbdsXAdzWOqXSWBuYsuP1OH6d8bqkUTxLkMhq3l/lg8Eu7jC9xFLA1oImdTwcs5
	l/lJOPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6nue-000000042v3-27au;
	Mon, 21 Apr 2025 09:58:04 +0000
Received: from mail-m1973192.qiye.163.com ([220.197.31.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6nrN-000000042d9-0N8D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 09:54:44 +0000
Received: from [127.0.0.1] (unknown [122.224.241.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1295c5899;
	Mon, 21 Apr 2025 17:54:29 +0800 (GMT+08:00)
Message-ID: <e473bba6-a9ad-45fa-a9d0-3cabbc162966@hj-micro.com>
Date: Mon, 21 Apr 2025 17:54:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] perf:arm-ni: support PMUs to share IRQs for different
 clock domains
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peter.du@hj-micro.com, andy.xu@hj-micro.com
References: <20250410114214.1599777-1-allen.wang@hj-micro.com>
 <20250410114214.1599777-3-allen.wang@hj-micro.com>
 <4e25536e-459b-4376-9422-4a7d0156234d@arm.com>
Content-Language: en-US
From: Shouping Wang <allen.wang@hj-micro.com>
In-Reply-To: <4e25536e-459b-4376-9422-4a7d0156234d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDS0pCVk1OSUNNGU5IGkNMSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUlPSlVIT1lXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
X-HM-Tid: 0a9657c548a709d9kunm1295c5899
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PjI6Fzo4PDJNHgIINAghMD1C
	PVYwCktVSlVKTE9OSUlCSUxLS09CVTMWGhIXVRoXFx4VVQwaFRw7ExFWFhIYCRRVGBQWRVlXWRIL
	WUFZSklJVUlJT1VJT0pVSE9ZV1kIAVlBQ0lKTjcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_025441_282313_95F53452 
X-CRM114-Status: GOOD (  25.55  )
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

For the same NI700 device, different CDs share a PMU interrupt. The
cd->cpu is set to the first CPU in the NUMA node associated with the
device, meaning all CDs share the same cd->cpu value. During event_init,
event->cpu is assigned to cd->cpu, resulting in all CD PMUs sharing the
interrupt being bound to the same CPU context. if the CPU goes offline,
the PMU context on that CPU is migrated to a target CPU, and the
interrupt is rebound to the target CPU. My understanding is that the CPU
affinity and hotplug operations can remain synchronized. Could you
confirm if there are any misunderstandings in this logic?

On 4/17/2025 10:41 PM, Robin Murphy wrote:
> On 10/04/2025 12:42 pm, Shouping Wang wrote:
>> The ARM NI700 contains multiple clock domains, each with a PMU.
>> In some hardware implementations, these PMUs under the same device
>> share a common interrupt line. The current codes implementation
>> only supports requesting a separate IRQ for each clock domain's PMU.
>>
>> Here, a single interrupt handler is registered for shared interrupt.
>> Within this handler, the interrupt status of all PMUs sharing the
>> interrupt is checked.
> 
> Unfortunately this isn't sufficient for sharing an IRQ between multiple
> PMUs - the CPU affinity and hotplug context migration must be kept in
> sync as well.
> 
> I guess I really should get back to my old plan to factor out a common
> helper library for all this stuff - that was the main reason I left
> combined IRQ support out of the initial version here rather than do
> another copy-paste of the arm_dmc620 design again...
> 
> Thanks,
> Robin.
> 
>> Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
>> ---
>>   drivers/perf/arm-ni.c | 77 +++++++++++++++++++++++++++++--------------
>>   1 file changed, 53 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
>> index 3f3d2e0f91fa..611085e89436 100644
>> --- a/drivers/perf/arm-ni.c
>> +++ b/drivers/perf/arm-ni.c
>> @@ -104,6 +104,7 @@ struct arm_ni_cd {
>>       u16 id;
>>       int num_units;
>>       int irq;
>> +    s8 irq_friend;
>>       int cpu;
>>       struct hlist_node cpuhp_node;
>>       struct pmu pmu;
>> @@ -446,26 +447,31 @@ static irqreturn_t arm_ni_handle_irq(int irq,
>> void *dev_id)
>>   {
>>       struct arm_ni_cd *cd = dev_id;
>>       irqreturn_t ret = IRQ_NONE;
>> -    u32 reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
>> +    u32 reg;
>>   -    if (reg & (1U << NI_CCNT_IDX)) {
>> -        ret = IRQ_HANDLED;
>> -        if (!(WARN_ON(!cd->ccnt))) {
>> -            arm_ni_event_read(cd->ccnt);
>> -            arm_ni_init_ccnt(cd);
>> +    for (;;) {
>> +        reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
>> +        if (reg & (1U << NI_CCNT_IDX)) {
>> +            ret = IRQ_HANDLED;
>> +            if (!(WARN_ON(!cd->ccnt))) {
>> +                arm_ni_event_read(cd->ccnt);
>> +                arm_ni_init_ccnt(cd);
>> +            }
>>           }
>> -    }
>> -    for (int i = 0; i < NI_NUM_COUNTERS; i++) {
>> -        if (!(reg & (1U << i)))
>> -            continue;
>> -        ret = IRQ_HANDLED;
>> -        if (!(WARN_ON(!cd->evcnt[i]))) {
>> -            arm_ni_event_read(cd->evcnt[i]);
>> -            arm_ni_init_evcnt(cd, i);
>> +        for (int i = 0; i < NI_NUM_COUNTERS; i++) {
>> +            if (!(reg & (1U << i)))
>> +                continue;
>> +            ret = IRQ_HANDLED;
>> +            if (!(WARN_ON(!cd->evcnt[i]))) {
>> +                arm_ni_event_read(cd->evcnt[i]);
>> +                arm_ni_init_evcnt(cd, i);
>> +            }
>>           }
>> +        writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
>> +        if (!cd->irq_friend)
>> +            return ret;
>> +        cd += cd->irq_friend;
>>       }
>> -    writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
>> -    return ret;
>>   }
>>     static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node
>> *node, u64 res_start)
>> @@ -538,12 +544,6 @@ static int arm_ni_init_cd(struct arm_ni *ni,
>> struct arm_ni_node *node, u64 res_s
>>       if (cd->irq < 0)
>>           return cd->irq;
>>   -    err = devm_request_irq(ni->dev, cd->irq, arm_ni_handle_irq,
>> -                   IRQF_NOBALANCING | IRQF_NO_THREAD,
>> -                   dev_name(ni->dev), cd);
>> -    if (err)
>> -        return err;
>> -
>>       cd->cpu = cpumask_local_spread(0, dev_to_node(ni->dev));
>>       cd->pmu = (struct pmu) {
>>           .module = THIS_MODULE,
>> @@ -603,6 +603,30 @@ static void arm_ni_probe_domain(void __iomem
>> *base, struct arm_ni_node *node)
>>       node->num_components = readl_relaxed(base + NI_CHILD_NODE_INFO);
>>   }
>>   +static int arm_ni_irq_init(struct arm_ni *ni)
>> +{
>> +    int irq;
>> +    int err = 0;
>> +
>> +    for (int i = 0; i < ni->num_cds; i++) {
>> +        irq = ni->cds[i].irq;
>> +        for (int j = i; j--; ) {
>> +            if (ni->cds[j].irq == irq) {
>> +                ni->cds[j].irq_friend = i-j;
>> +                goto next;
>> +            }
>> +        }
>> +        err =  devm_request_irq(ni->dev, irq, arm_ni_handle_irq,
>> +                    IRQF_NOBALANCING | IRQF_NO_THREAD,
>> +                     dev_name(ni->dev), &ni->cds[i]);
>> +        if (err)
>> +            return err;
>> +next:
>> +        ;
>> +    }
>> +    return 0;
>> +}
>> +
>>   static int arm_ni_probe(struct platform_device *pdev)
>>   {
>>       struct arm_ni_node cfg, vd, pd, cd;
>> @@ -611,6 +635,7 @@ static int arm_ni_probe(struct platform_device *pdev)
>>       void __iomem *base;
>>       static atomic_t id;
>>       int num_cds;
>> +    int ret;
>>       u32 reg, part;
>>         /*
>> @@ -669,8 +694,6 @@ static int arm_ni_probe(struct platform_device *pdev)
>>               reg = readl_relaxed(vd.base + NI_CHILD_PTR(p));
>>               arm_ni_probe_domain(base + reg, &pd);
>>               for (int c = 0; c < pd.num_components; c++) {
>> -                int ret;
>> -
>>                   reg = readl_relaxed(pd.base + NI_CHILD_PTR(c));
>>                   arm_ni_probe_domain(base + reg, &cd);
>>                   ret = arm_ni_init_cd(ni, &cd, res->start);
>> @@ -683,6 +706,12 @@ static int arm_ni_probe(struct platform_device
>> *pdev)
>>           }
>>       }
>>   +    ret = arm_ni_irq_init(ni);
>> +    if (ret) {
>> +        arm_ni_remove(pdev);
>> +        return ret;
>> +    }
>> +
>>       return 0;
>>   }
>>   
> 
> 


