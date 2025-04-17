Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AC4C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvAym484430/Adz3ChHadijwGpn4MjLOn2NVEiFzhk8=; b=nh0+Pt8bvsn9SuWc+Q+dvZm0dq
	Luww0OepXuXGsMl5NZrQRWMN35HX8Rzs1rN4q4dkHNpxNVKUIb6ys0cKvlKT/u98BbI3oPLXjjjvH
	Wudh6ijKWMHs0cs68oEoVPUeU9BRZN8DIo75IAwAOUBBVIOUCplbLCD1jnVUKsQuOO88elcR1Qbir
	CADl4wl/DRDddwS19b1HEpivzgv9G4/BXR4UdQvYM6mt/CXxunwRqgjKWxUKuG+15R+Yo9DXjXzO0
	Tpdsnxkzv+544jjAxL1zpFMHGPbGoMYoWtZxp+cdj2uRk1r8//ddhce4RMmcvilsL3ynpVq1GpLEF
	bToPGUjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RI3-0000000DXcj-42vA;
	Thu, 17 Apr 2025 15:36:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QR1-0000000DMMA-1SOG
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Apr 2025 14:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KvAym484430/Adz3ChHadijwGpn4MjLOn2NVEiFzhk8=; b=oWE1KFmXlIljroekyTuENvn0pP
	sFCQyexYdQ83ILJWF2tobIckK1b6Tii50vtEoa8S7fJIXTvSDubDyymZuolyhJeUSXaoizcWdN6Js
	hjwJTOSjlpiWA0bhFlFK0+Up5K0cLMp59t/p7vnWI7tnvVqukHQN8VPY+kxNpwxcjxVXG3gc+Z/Bq
	XiNWZVJSN7ReHocbaZcpNslmNCiIjeeKcIxX1xk1U6XtlBU8z9wHG+1hydaZ9UxbtScFiZXWT+BRq
	Yek1M92PgmIF0ndpkPWyISuvL9XNJEA5pVaUKgr9uiNLRA66ejsesq17kz8mE2ZNjUTfss2bJZ3rX
	5z2MxtcA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5QQx-0000000AJZU-1bD9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:41:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 356CB1515;
	Thu, 17 Apr 2025 07:41:38 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E75C3F66E;
	Thu, 17 Apr 2025 07:41:38 -0700 (PDT)
Message-ID: <4e25536e-459b-4376-9422-4a7d0156234d@arm.com>
Date: Thu, 17 Apr 2025 15:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] perf:arm-ni: support PMUs to share IRQs for different
 clock domains
To: Shouping Wang <allen.wang@hj-micro.com>, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peter.du@hj-micro.com, andy.xu@hj-micro.com
References: <20250410114214.1599777-1-allen.wang@hj-micro.com>
 <20250410114214.1599777-3-allen.wang@hj-micro.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250410114214.1599777-3-allen.wang@hj-micro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_154143_882078_27CAE4B9 
X-CRM114-Status: GOOD (  25.49  )
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

On 10/04/2025 12:42 pm, Shouping Wang wrote:
> The ARM NI700 contains multiple clock domains, each with a PMU.
> In some hardware implementations, these PMUs under the same device
> share a common interrupt line. The current codes implementation
> only supports requesting a separate IRQ for each clock domain's PMU.
> 
> Here, a single interrupt handler is registered for shared interrupt.
> Within this handler, the interrupt status of all PMUs sharing the
> interrupt is checked.

Unfortunately this isn't sufficient for sharing an IRQ between multiple 
PMUs - the CPU affinity and hotplug context migration must be kept in 
sync as well.

I guess I really should get back to my old plan to factor out a common 
helper library for all this stuff - that was the main reason I left 
combined IRQ support out of the initial version here rather than do 
another copy-paste of the arm_dmc620 design again...

Thanks,
Robin.

> Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
> ---
>   drivers/perf/arm-ni.c | 77 +++++++++++++++++++++++++++++--------------
>   1 file changed, 53 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
> index 3f3d2e0f91fa..611085e89436 100644
> --- a/drivers/perf/arm-ni.c
> +++ b/drivers/perf/arm-ni.c
> @@ -104,6 +104,7 @@ struct arm_ni_cd {
>   	u16 id;
>   	int num_units;
>   	int irq;
> +	s8 irq_friend;
>   	int cpu;
>   	struct hlist_node cpuhp_node;
>   	struct pmu pmu;
> @@ -446,26 +447,31 @@ static irqreturn_t arm_ni_handle_irq(int irq, void *dev_id)
>   {
>   	struct arm_ni_cd *cd = dev_id;
>   	irqreturn_t ret = IRQ_NONE;
> -	u32 reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
> +	u32 reg;
>   
> -	if (reg & (1U << NI_CCNT_IDX)) {
> -		ret = IRQ_HANDLED;
> -		if (!(WARN_ON(!cd->ccnt))) {
> -			arm_ni_event_read(cd->ccnt);
> -			arm_ni_init_ccnt(cd);
> +	for (;;) {
> +		reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
> +		if (reg & (1U << NI_CCNT_IDX)) {
> +			ret = IRQ_HANDLED;
> +			if (!(WARN_ON(!cd->ccnt))) {
> +				arm_ni_event_read(cd->ccnt);
> +				arm_ni_init_ccnt(cd);
> +			}
>   		}
> -	}
> -	for (int i = 0; i < NI_NUM_COUNTERS; i++) {
> -		if (!(reg & (1U << i)))
> -			continue;
> -		ret = IRQ_HANDLED;
> -		if (!(WARN_ON(!cd->evcnt[i]))) {
> -			arm_ni_event_read(cd->evcnt[i]);
> -			arm_ni_init_evcnt(cd, i);
> +		for (int i = 0; i < NI_NUM_COUNTERS; i++) {
> +			if (!(reg & (1U << i)))
> +				continue;
> +			ret = IRQ_HANDLED;
> +			if (!(WARN_ON(!cd->evcnt[i]))) {
> +				arm_ni_event_read(cd->evcnt[i]);
> +				arm_ni_init_evcnt(cd, i);
> +			}
>   		}
> +		writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
> +		if (!cd->irq_friend)
> +			return ret;
> +		cd += cd->irq_friend;
>   	}
> -	writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
> -	return ret;
>   }
>   
>   static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_start)
> @@ -538,12 +544,6 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
>   	if (cd->irq < 0)
>   		return cd->irq;
>   
> -	err = devm_request_irq(ni->dev, cd->irq, arm_ni_handle_irq,
> -			       IRQF_NOBALANCING | IRQF_NO_THREAD,
> -			       dev_name(ni->dev), cd);
> -	if (err)
> -		return err;
> -
>   	cd->cpu = cpumask_local_spread(0, dev_to_node(ni->dev));
>   	cd->pmu = (struct pmu) {
>   		.module = THIS_MODULE,
> @@ -603,6 +603,30 @@ static void arm_ni_probe_domain(void __iomem *base, struct arm_ni_node *node)
>   	node->num_components = readl_relaxed(base + NI_CHILD_NODE_INFO);
>   }
>   
> +static int arm_ni_irq_init(struct arm_ni *ni)
> +{
> +	int irq;
> +	int err = 0;
> +
> +	for (int i = 0; i < ni->num_cds; i++) {
> +		irq = ni->cds[i].irq;
> +		for (int j = i; j--; ) {
> +			if (ni->cds[j].irq == irq) {
> +				ni->cds[j].irq_friend = i-j;
> +				goto next;
> +			}
> +		}
> +		err =  devm_request_irq(ni->dev, irq, arm_ni_handle_irq,
> +					IRQF_NOBALANCING | IRQF_NO_THREAD,
> +					 dev_name(ni->dev), &ni->cds[i]);
> +		if (err)
> +			return err;
> +next:
> +		;
> +	}
> +	return 0;
> +}
> +
>   static int arm_ni_probe(struct platform_device *pdev)
>   {
>   	struct arm_ni_node cfg, vd, pd, cd;
> @@ -611,6 +635,7 @@ static int arm_ni_probe(struct platform_device *pdev)
>   	void __iomem *base;
>   	static atomic_t id;
>   	int num_cds;
> +	int ret;
>   	u32 reg, part;
>   
>   	/*
> @@ -669,8 +694,6 @@ static int arm_ni_probe(struct platform_device *pdev)
>   			reg = readl_relaxed(vd.base + NI_CHILD_PTR(p));
>   			arm_ni_probe_domain(base + reg, &pd);
>   			for (int c = 0; c < pd.num_components; c++) {
> -				int ret;
> -
>   				reg = readl_relaxed(pd.base + NI_CHILD_PTR(c));
>   				arm_ni_probe_domain(base + reg, &cd);
>   				ret = arm_ni_init_cd(ni, &cd, res->start);
> @@ -683,6 +706,12 @@ static int arm_ni_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> +	ret = arm_ni_irq_init(ni);
> +	if (ret) {
> +		arm_ni_remove(pdev);
> +		return ret;
> +	}
> +
>   	return 0;
>   }
>   

