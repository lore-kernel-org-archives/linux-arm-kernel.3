Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641EBCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGn9bhOnRso2hK6qnlES+LU8iSaaT3N8pXu1UtOJVWc=; b=HKEem8U7PBaOynmd5t6RISxFaO
	ZZoBAMCDO3GEXTfseMQrbpA68MDNRNeSG9GJXClD7QJtW1IieHkGYMOKPwrZQRrcybjz+7o86xoh7
	4nvSEa6aqPwZZMYZxff9e5imT/nWe2ClYVJFzVkQnzkMb6V9Nc+oJvC5mshi+nE/8rJBtJCEAvoL3
	PHWDmwo/i39frg7Ln7IXU6kvbQqE9ZpBYJL2BOeGptWyMWE40K51NXmZetTyGQPNW1OP9A4AMjWaw
	sE+ujXKUAbM/mu+DxVL9AasPJG2YRkt1oFi0CtI6jals/+HYXW38lpRnYZKt9Sq5I+vAnkTQxRJdy
	MwIGx4Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXEn-00000002LfU-1C9L;
	Fri, 19 Sep 2025 09:17:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXEk-00000002Ldx-0xgd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 09:17:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11EC7169E;
	Fri, 19 Sep 2025 02:16:53 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D66AB3F66E;
	Fri, 19 Sep 2025 02:16:56 -0700 (PDT)
Date: Fri, 19 Sep 2025 10:16:49 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: Will Deacon <will@kernel.org>, yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com,
	james.clark@linaro.org, robh@kernel.org, anshuman.khandual@arm.com,
	jonathan.cameron@huawei.com, hejunhao3@huawei.com,
	linuxarm@huawei.com, prime.zeng@hisilicon.com, xuwei5@huawei.com,
	wangyushan12@huawei.com
Subject: Re: [PATCH v2 2/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT
 cores
Message-ID: <aM0fgQvO6p91mF_u@J2N7QTR9R3>
References: <20250820084534.28037-1-yangyicong@huawei.com>
 <20250820084534.28037-3-yangyicong@huawei.com>
 <aMwJ5FpGRmsyhQuZ@willie-the-truck>
 <d890b8e6-37f5-4466-b580-7e6d8c1d29bf@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d890b8e6-37f5-4466-b580-7e6d8c1d29bf@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_021702_312991_ACEC412E 
X-CRM114-Status: GOOD (  24.91  )
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

On Fri, Sep 19, 2025 at 04:56:18PM +0800, Yicong Yang wrote:
> On 2025/9/18 21:32, Will Deacon wrote:
> > On Wed, Aug 20, 2025 at 04:45:34PM +0800, Yicong Yang wrote:

> >> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> >> index 5c310e803dd7..137ef55d6973 100644
> >> --- a/drivers/perf/arm_pmu.c
> >> +++ b/drivers/perf/arm_pmu.c
> >> @@ -901,6 +901,9 @@ struct arm_pmu *armpmu_alloc(void)
> >>  
> >>  		events = per_cpu_ptr(pmu->hw_events, cpu);
> >>  		events->percpu_pmu = pmu;
> >> +
> >> +		if (!pmu->has_smt && topology_core_has_smt(cpu))
> >> +			pmu->has_smt = true;
> > 
> > Why isn't that just:
> > 
> > 	pmu->has_smt = topology_core_has_smt(cpu);
> > 
> > ?
> 
> also works. since one pmu only contains one type of CPU, so just thought
> no need to set it multiple times.
> 
> > but then if that's the case, why do we need to stash the result in the
> > PMU at all?
> 
> should based on the discussion here [1]. stash it during probe will avoid
> calling {raw_}smp_processor_id() in pmu::event_init() which may be
> horrible for debug in some condition.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/aJsV7nzlILHd_ZMa@J2N7QTR9R3/

This isn't about being 'horrible for debug'; my comment there was saying
that the proposed patch was incorrect AND it would be horrible to debug
that in practice when it inevitably went wrong.

The key details are:

(1) We need pmu::event_init() to know whether the cycle counter can be
    used such that it doesn't permit a group to be created which can
    *NEVER* be scheduled in hardware. Otherwise, the core perf code will
    waste time periodically trying to schedule that group when it will
    *ALWAYS* be rejected by pmu::add().

(2) The pmu::event_init() call runs in a preemptible context and can
    run on any CPU in the system, completely independent of the PMU's
    supported CPUs. Thus [raw_]smp_processor_id() tells you nothing
    about the CPU(s) the event will run on.

    Note that for task-bound events, the event->cpu is -1, so that
    doesn't tell us either. Only the PMU instance tells us the set of
    CPUs.

We can solve that by either stashing this boolean flag at probe time OR
having pmu::event_init() check something like:

	topology_core_has_smt(cpumask_first(pmu->supported_cpus));

... and I think stashing at probe time is nicer/clearer.

Mark.

