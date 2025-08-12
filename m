Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42626C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8msx2fNRVI4qGF+4ukX+QUIDfAz3yNjMJXopol6RLr8=; b=fx8Ci6YicGlnnU6Cf3YtUKbYPe
	R/xMogU355/FsfvLzZWFrCzWXakCtxu+RIYG7kqRTecrtaKyp0RCZi6O+DWOFedAww/rrSC1Lx3H2
	Yl1/edjOHVGov3NgLq7FrY6Iyz4DL8bMPd9FbQmYBZ9jbZzooYrA+BSvOPzkhzc02PJpFBsG64M9y
	Cb30sMEKmmt7ZveUMsGVT7Lna5M1kBBJQbfTBtK+zYHGfLfq77v24xmiWC8qiztwx5K0ntRPfaODJ
	snefyC0Y72bk0tZ6ISzEpOGWBA467Mxv5mwMA5W+pWf2dg/1U7WEe1kh176BKRP+HnHTNqyBPENWJ
	MkVJlCTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulriJ-0000000BI4z-1vnz;
	Tue, 12 Aug 2025 16:19:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulmBt-0000000AVP5-1U8i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 10:25:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 590BD25E1;
	Tue, 12 Aug 2025 03:25:04 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAA173F738;
	Tue, 12 Aug 2025 03:25:09 -0700 (PDT)
Date: Tue, 12 Aug 2025 11:25:07 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org,
	james.clark@linaro.org, robh@kernel.org, anshuman.khandual@arm.com,
	jonathan.cameron@huawei.com, hejunhao3@huawei.com,
	linuxarm@huawei.com, prime.zeng@hisilicon.com, xuwei5@huawei.com,
	wangyushan12@huawei.com, yangyicong@hisilicon.com
Subject: Re: [PATCH 1/2] perf: arm_pmuv3: Factor out PMCCNTR_EL0 use
 conditions
Message-ID: <aJsWg9g_Z9z-ejcL@J2N7QTR9R3>
References: <20250812080830.20796-1-yangyicong@huawei.com>
 <20250812080830.20796-2-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812080830.20796-2-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_032513_433641_88FE999E 
X-CRM114-Status: GOOD (  22.49  )
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

On Tue, Aug 12, 2025 at 04:08:29PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> PMCCNTR_EL0 is preferred for counting CPU_CYCLES under certain
> conditions. Factor out the condition check to a separate function
> for further extension. Add documents for better understanding.
> No functional changes intended.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

FWIW, splitting this oudt looks fine to me (with one nit below), so:

Acked-by: Mark Rutland <mark.rutland@arm.com>

> ---
>  drivers/perf/arm_pmuv3.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index f6d7bab5d555..95c899d07df5 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -978,6 +978,33 @@ static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc,
>  	return -EAGAIN;
>  }
>  
> +static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
> +				     struct perf_event *event)
> +{
> +	struct hw_perf_event *hwc = &event->hw;
> +	unsigned long evtype = hwc->config_base & ARMV8_PMU_EVTYPE_EVENT;
> +
> +	/* PMCCNTR_EL0 can only be used for CPU_CYCLES event */
> +	if (evtype != ARMV8_PMUV3_PERFCTR_CPU_CYCLES)
> +		return false;

Nit: I don't think this comment is useful, and it could be deleted.

Mark.

> +
> +	/*
> +	 * A CPU_CYCLES event with threshold counting cannot use PMCCNTR_EL0
> +	 * since it lacks threshold support.
> +	 */
> +	if (armv8pmu_event_get_threshold(&event->attr))
> +		return false;
> +
> +	/*
> +	 * PMCCNTR_EL0 is not affected by BRBE controls like BRBCR_ELx.FZP.
> +	 * So don't use it for branch events.
> +	 */
> +	if (has_branch_stack(event))
> +		return false;
> +
> +	return true;
> +}
> +
>  static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
>  				  struct perf_event *event)
>  {
> @@ -986,8 +1013,7 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
>  	unsigned long evtype = hwc->config_base & ARMV8_PMU_EVTYPE_EVENT;
>  
>  	/* Always prefer to place a cycle counter into the cycle counter. */
> -	if ((evtype == ARMV8_PMUV3_PERFCTR_CPU_CYCLES) &&
> -	    !armv8pmu_event_get_threshold(&event->attr) && !has_branch_stack(event)) {
> +	if (armv8pmu_can_use_pmccntr(cpuc, event)) {
>  		if (!test_and_set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
>  			return ARMV8_PMU_CYCLE_IDX;
>  		else if (armv8pmu_event_is_64bit(event) &&
> -- 
> 2.24.0
> 

