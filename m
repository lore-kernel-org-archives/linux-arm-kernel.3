Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4296AC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 12:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrK7lgexJPet3LciwomGJulr6bHo4CUHRAIGKlU8QPk=; b=JLVXyQdCJHzPlxPT3BcOQ1PM8e
	SMzFpykz2Adb4D+N5BsNjVKCgIFzKynBqSEAKUgPGNkN5r+ni5Xf4l8zD8osSj5NGHNZ5MC/Mvf8M
	OXgpqsHgeU7PPFJeyPjGM0QOtDm1oZT0IIaE5mubwH+5q58HtzupyZGZ8SdmigQMw2hbhNtIpvVNr
	5Brh4B1ErSlggMQ9TEfFK3m4g3gQGXoYPVZWqsA5TdByr+uc1t7Z48wJhIdXoXDLnObWjs1mj67Cu
	BNhrNqVw1uYzRX+ufSvE6EQbrUdBxLncq47mELM3JwIdT7AgHj8PDiHh799PUBaIEtDp7HqKm0Nyj
	ZTycoKfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzmT-00000009BFB-49bH;
	Mon, 19 May 2025 12:39:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzd4-000000099Vx-3tQ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 12:30:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60E074A983;
	Mon, 19 May 2025 12:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0C3C4CEE4;
	Mon, 19 May 2025 12:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747657802;
	bh=cR68oHfl1t9ywt/NWwZVHzu9vBeDFFwhdFjq16MJ57w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ihtr0SvYpqY3g7eCmAA8tspChbubtaRSjSCEHzk7dF2AtdmnuJCPJRKqRn0qLfIcp
	 cwkycvCpuRe6jv3Khd7Iw2jGEKD0sIOCHNSdNWr4Z8KTyDqeYWtqHNbPM4ENcWiDpV
	 SE9ZcMZpjUIg3Fmv37RV4pk+fMvgS7X9xaR+gsGStQqSiO10EDQdKnx/YqgXn8Yss0
	 nrj5+1jOUqOOQqpWfWN5NXwE764qjq+Te8SgXSp11P01s5736sIy28eqFq3rj9MMhL
	 Ge+u17FbhsS+FTOBr+l8l9tz1j7tmHqV9T1LhXvrVMigxAyzrqBLOl/7lD5PHYjUag
	 FykWGyDtVzx5A==
Date: Mon, 19 May 2025 13:29:57 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, allen.wang@hj-micro.com,
	peter.du@hj-micro.com, andy.xu@hj-micro.com
Subject: Re: [PATCH 3/3] perf/arm-ni: Support sharing IRQs within an NI
 instance
Message-ID: <20250519122956.GA16848@willie-the-truck>
References: <cover.1747149165.git.robin.murphy@arm.com>
 <c7ac53d0f608d92d96e4e2827e253a9cb2a337bb.1747149165.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7ac53d0f608d92d96e4e2827e253a9cb2a337bb.1747149165.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_053003_007889_09591FAC 
X-CRM114-Status: GOOD (  30.77  )
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

On Tue, May 13, 2025 at 04:39:00PM +0100, Robin Murphy wrote:
> From: Shouping Wang <allen.wang@hj-micro.com>
> 
> NI-700 has a distinct PMU interrupt output for each Clock Domain,
> however some integrations may still combine these together externally.
> The initial driver didn't attempt to support this, in anticipation of a
> more general solution for IRQ sharing between system PMU instances, but
> that's still a way off, so let's make this intermediate step for now to
> at least allow sharing IRQs within an individual NI instance.
> 
> Now that CPU affinity and migration are cleaned up, it's fairly
> straightforward to adopt similar logic to arm-cmn, to identify CDs with
> a common interrupt and loop over them directly in the handler.
> 
> Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
> [ rm: Rework for affinity handling, cosmetics, new commit message ]
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/perf/arm-ni.c | 78 ++++++++++++++++++++++++++++---------------
>  1 file changed, 51 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
> index 168750e78fc4..ca033c8785ff 100644
> --- a/drivers/perf/arm-ni.c
> +++ b/drivers/perf/arm-ni.c
> @@ -102,6 +102,7 @@ struct arm_ni_unit {
>  struct arm_ni_cd {
>  	void __iomem *pmu_base;
>  	u16 id;
> +	s8 irq_friend;

Why not just store the pointer to the cd as opposed to a relative offset?

>  	int num_units;
>  	int irq;
>  	struct pmu pmu;
> @@ -448,33 +449,37 @@ static irqreturn_t arm_ni_handle_irq(int irq, void *dev_id)
>  {
>  	struct arm_ni_cd *cd = dev_id;
>  	irqreturn_t ret = IRQ_NONE;
> -	u32 reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
>  
> -	if (reg & (1U << NI_CCNT_IDX)) {
> -		ret = IRQ_HANDLED;
> -		if (!(WARN_ON(!cd->ccnt))) {
> -			arm_ni_event_read(cd->ccnt);
> -			arm_ni_init_ccnt(cd);
> +	for (;;) {

Could this be a do { ... } while (cd) loop instead?

> +		u32 reg = readl_relaxed(cd->pmu_base + NI_PMOVSCLR);
> +
> +		if (reg & (1U << NI_CCNT_IDX)) {
> +			ret = IRQ_HANDLED;
> +			if (!(WARN_ON(!cd->ccnt))) {
> +				arm_ni_event_read(cd->ccnt);
> +				arm_ni_init_ccnt(cd);
> +			}
>  		}
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
>  		}
> +		writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
> +		if (!cd->irq_friend)
> +			return ret;
> +		cd += cd->irq_friend;
>  	}
> -	writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
> -	return ret;
>  }
>  
>  static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_start)
>  {
>  	struct arm_ni_cd *cd = ni->cds + node->id;
>  	const char *name;
> -	int err;
>  
>  	cd->id = node->id;
>  	cd->num_units = node->num_components;
> @@ -534,20 +539,11 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
>  		       cd->pmu_base + NI_PMCR);
>  	writel_relaxed(U32_MAX, cd->pmu_base + NI_PMCNTENCLR);
>  	writel_relaxed(U32_MAX, cd->pmu_base + NI_PMOVSCLR);
> -	writel_relaxed(U32_MAX, cd->pmu_base + NI_PMINTENSET);
>  
>  	cd->irq = platform_get_irq(to_platform_device(ni->dev), cd->id);
>  	if (cd->irq < 0)
>  		return cd->irq;
>  
> -	err = devm_request_irq(ni->dev, cd->irq, arm_ni_handle_irq,
> -			       IRQF_NOBALANCING | IRQF_NO_THREAD,
> -			       dev_name(ni->dev), cd);
> -	if (err)
> -		return err;
> -
> -	irq_set_affinity(cd->irq, cpumask_of(ni->cpu));
> -
>  	cd->pmu = (struct pmu) {
>  		.module = THIS_MODULE,
>  		.parent = ni->dev,
> @@ -593,6 +589,30 @@ static void arm_ni_probe_domain(void __iomem *base, struct arm_ni_node *node)
>  	node->num_components = readl_relaxed(base + NI_CHILD_NODE_INFO);
>  }
>  
> +static int arm_ni_init_irqs(struct arm_ni *ni)
> +{
> +	int err;
> +
> +	ni_for_each_cd(ni, cd) {
> +		for (struct arm_ni_cd *prev = cd; prev-- > ni->cds; ) {
> +			if (prev->irq == cd->irq) {
> +				prev->irq_friend = cd - prev;

Can't this race with the read of `irq_friend` in the interrupt handler?

Similarly, how do you handle the race between the interrupt firing on
one CD and the friend CD being torn down on e.g. the remove path?

> +				goto enable_irq;
> +			}
> +		}
> +		err = devm_request_irq(ni->dev, cd->irq, arm_ni_handle_irq,
> +				       IRQF_NOBALANCING | IRQF_NO_THREAD,
> +				       dev_name(ni->dev), cd);

What's the reason not to use IRQF_SHARED and register multiple handlers?
I'm sure there is one, but capturing that in a comment would help to
justify the manual multiplexing.

Will

