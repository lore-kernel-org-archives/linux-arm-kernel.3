Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378CBC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5ehTbGPlCrPWJJRIBYaLByv3FIRmY6+NtNAJeCWBNw=; b=LR+dN2UEVlZBGl8V2s/HWChiWn
	XtC94EmuX6npajlaYaaOc0XVja8hZP0MEOq5t9HZv61UcTdRpPfdczz37FDfz4ISFvjoAr9rfK3do
	AEt0NWabjmdrKEoc14pwblF4sCEML3iUyAU+q4N1hIITSzcCThKQQKyfRM+XYJamgm2VeeXXp/PFN
	Ek3l6GKXuQdoCvG0ar5egAd7/Az+XHhBvNCF7+HeWpWkE7mcr6dfEHinpkwmzcCCu6guPvp03ZETr
	RHZNnFQ3+Qq81uGBdXPVK7NQBSs3Y+/m8CPdDaWIALLHwgA+Tk0tErv4QulMX8c/I0Z1D4WGpycO9
	XjuI4Bdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2m3-00000009gHx-3Z2P;
	Mon, 19 May 2025 15:51:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1vs-00000009Vcq-05cY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:57:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F353F1516;
	Mon, 19 May 2025 07:57:20 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14D8D3F6A8;
	Mon, 19 May 2025 07:57:32 -0700 (PDT)
Message-ID: <91c20c05-9607-4f98-ba00-a70b85862e60@arm.com>
Date: Mon, 19 May 2025 15:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] perf/arm-ni: Support sharing IRQs within an NI
 instance
To: Will Deacon <will@kernel.org>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, allen.wang@hj-micro.com,
 peter.du@hj-micro.com, andy.xu@hj-micro.com
References: <cover.1747149165.git.robin.murphy@arm.com>
 <c7ac53d0f608d92d96e4e2827e253a9cb2a337bb.1747149165.git.robin.murphy@arm.com>
 <20250519122956.GA16848@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250519122956.GA16848@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_075736_152943_40F82ADF 
X-CRM114-Status: GOOD (  33.69  )
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

On 19/05/2025 1:29 pm, Will Deacon wrote:
> On Tue, May 13, 2025 at 04:39:00PM +0100, Robin Murphy wrote:
>> From: Shouping Wang <allen.wang@hj-micro.com>
>>
>> NI-700 has a distinct PMU interrupt output for each Clock Domain,
>> however some integrations may still combine these together externally.
>> The initial driver didn't attempt to support this, in anticipation of a
>> more general solution for IRQ sharing between system PMU instances, but
>> that's still a way off, so let's make this intermediate step for now to
>> at least allow sharing IRQs within an individual NI instance.
>>
>> Now that CPU affinity and migration are cleaned up, it's fairly
>> straightforward to adopt similar logic to arm-cmn, to identify CDs with
>> a common interrupt and loop over them directly in the handler.
>>
>> Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
>> [ rm: Rework for affinity handling, cosmetics, new commit message ]
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/perf/arm-ni.c | 78 ++++++++++++++++++++++++++++---------------
>>   1 file changed, 51 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
>> index 168750e78fc4..ca033c8785ff 100644
>> --- a/drivers/perf/arm-ni.c
>> +++ b/drivers/perf/arm-ni.c
>> @@ -102,6 +102,7 @@ struct arm_ni_unit {
>>   struct arm_ni_cd {
>>   	void __iomem *pmu_base;
>>   	u16 id;
>> +	s8 irq_friend;
> 
> Why not just store the pointer to the cd as opposed to a relative offset?

Same reason as in arm-cmn - we know we're referencing another entry 
within the same array, so a full pointer costs 8 bytes of memory to be 
mostly redundant, while the offset fits in existing padding so costs 
nothing. In this case we could actually encode an absolute index just as 
easily as a relative offset since we have at most 32 CDs, but since you 
and Mark tend to prefer consistency across drivers where they do similar 
things, following the exact same pattern as arm-cmn feels like the 
clearest option (and in that existing case it is more significant, since 
arm-cmn's offset range is only +/-3, but somewhere in the middle of an 
array of many hundreds.)

>>   	int num_units;
>>   	int irq;
>>   	struct pmu pmu;
>> @@ -448,33 +449,37 @@ static irqreturn_t arm_ni_handle_irq(int irq, void *dev_id)
>>   {
>>   	struct arm_ni_cd *cd = dev_id;
>>   	irqreturn_t ret = IRQ_NONE;
>> -	u32 reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
>>   
>> -	if (reg & (1U << NI_CCNT_IDX)) {
>> -		ret = IRQ_HANDLED;
>> -		if (!(WARN_ON(!cd->ccnt))) {
>> -			arm_ni_event_read(cd->ccnt);
>> -			arm_ni_init_ccnt(cd);
>> +	for (;;) {
> 
> Could this be a do { ... } while (cd) loop instead?

I did try, but it still ends up looking just as clunky if not more so - 
I assume I must have gone through the same exercise 5 years ago for 
arm-cmn to have ended up this way :)

>> +		u32 reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
>> +
>> +		if (reg & (1U << NI_CCNT_IDX)) {
>> +			ret = IRQ_HANDLED;
>> +			if (!(WARN_ON(!cd->ccnt))) {
>> +				arm_ni_event_read(cd->ccnt);
>> +				arm_ni_init_ccnt(cd);
>> +			}
>>   		}
>> -	}
>> -	for (int i = 0; i < NI_NUM_COUNTERS; i++) {
>> -		if (!(reg & (1U << i)))
>> -			continue;
>> -		ret = IRQ_HANDLED;
>> -		if (!(WARN_ON(!cd->evcnt[i]))) {
>> -			arm_ni_event_read(cd->evcnt[i]);
>> -			arm_ni_init_evcnt(cd, i);
>> +		for (int i = 0; i < NI_NUM_COUNTERS; i++) {
>> +			if (!(reg & (1U << i)))
>> +				continue;
>> +			ret = IRQ_HANDLED;
>> +			if (!(WARN_ON(!cd->evcnt[i]))) {
>> +				arm_ni_event_read(cd->evcnt[i]);
>> +				arm_ni_init_evcnt(cd, i);
>> +			}
>>   		}
>> +		writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
>> +		if (!cd->irq_friend)
>> +			return ret;
>> +		cd += cd->irq_friend;
>>   	}
>> -	writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
>> -	return ret;
>>   }
>>   
>>   static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_start)
>>   {
>>   	struct arm_ni_cd *cd = ni->cds + node->id;
>>   	const char *name;
>> -	int err;
>>   
>>   	cd->id = node->id;
>>   	cd->num_units = node->num_components;
>> @@ -534,20 +539,11 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
>>   		       cd->pmu_base + NI_PMCR);
>>   	writel_relaxed(U32_MAX, cd->pmu_base + NI_PMCNTENCLR);
>>   	writel_relaxed(U32_MAX, cd->pmu_base + NI_PMOVSCLR);
>> -	writel_relaxed(U32_MAX, cd->pmu_base + NI_PMINTENSET);
>>   
>>   	cd->irq = platform_get_irq(to_platform_device(ni->dev), cd->id);
>>   	if (cd->irq < 0)
>>   		return cd->irq;
>>   
>> -	err = devm_request_irq(ni->dev, cd->irq, arm_ni_handle_irq,
>> -			       IRQF_NOBALANCING | IRQF_NO_THREAD,
>> -			       dev_name(ni->dev), cd);
>> -	if (err)
>> -		return err;
>> -
>> -	irq_set_affinity(cd->irq, cpumask_of(ni->cpu));
>> -
>>   	cd->pmu = (struct pmu) {
>>   		.module = THIS_MODULE,
>>   		.parent = ni->dev,
>> @@ -593,6 +589,30 @@ static void arm_ni_probe_domain(void __iomem *base, struct arm_ni_node *node)
>>   	node->num_components = readl_relaxed(base + NI_CHILD_NODE_INFO);
>>   }
>>   
>> +static int arm_ni_init_irqs(struct arm_ni *ni)
>> +{
>> +	int err;
>> +
>> +	ni_for_each_cd(ni, cd) {
>> +		for (struct arm_ni_cd *prev = cd; prev-- > ni->cds; ) {
>> +			if (prev->irq == cd->irq) {
>> +				prev->irq_friend = cd - prev;
> 
> Can't this race with the read of `irq_friend` in the interrupt handler?

Not in any way that matters. Any IRQ at this point would be a spurious 
one left latched at the interrupt controller after we've already reset 
all the PMUs. The handler can hardly observe a torn partial store of 1 
byte, so either it'll see a valid irq_friend or none. Either way we'll 
eventually return IRQ_NONE, EOI the phantom IRQ and be done.

I'm not entertaining the idea of somehow being preempted here for long 
enough for userspace to notice the already-registered PMUs (even though 
the module load hasn't yet finished...), open an event and have it count 
enough to genuinely overflow, because that would be in the order of at 
least tens of seconds if not minutes.

> Similarly, how do you handle the race between the interrupt firing on
> one CD and the friend CD being torn down on e.g. the remove path?

Again, we've already disabled *all* the PMUs (and explicitly cleared 
their PMINTENs to leave no doubt) in arm_ni_remove(). After that, devres 
ordering will then free the IRQs themselves before the CDs ever get freed.

>> +				goto enable_irq;
>> +			}
>> +		}
>> +		err = devm_request_irq(ni->dev, cd->irq, arm_ni_handle_irq,
>> +				       IRQF_NOBALANCING | IRQF_NO_THREAD,
>> +				       dev_name(ni->dev), cd);
> 
> What's the reason not to use IRQF_SHARED and register multiple handlers?
> I'm sure there is one, but capturing that in a comment would help to
> justify the manual multiplexing.

The usual perf reason - IRQF_SHARED allows any *other* random driver to 
also request the same IRQ and then mess with its affinity behind our back.

Thanks,
Robin.

