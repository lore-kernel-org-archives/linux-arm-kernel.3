Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13218CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 11:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgWuzsJrb6D9VK8toYmxffFxiCrPdJWsdakO7DuPZ3E=; b=EUGziS/PEdRmBf1wySXejD6Gzy
	MHrVRn0aGobi6NKGZQ6lX2g10v2HYk7f0oqKsH8wjxNXfPWc/0EQhGkuNZhOJDLwaOLoqHtB62GPN
	RdPXbP/IPLEMPAw/LEakoqpfjFEqPF4mWZ+MEIc8LyHWwUTAG9W9oM8nY15W9KgNL5DZLEQq1r+5e
	GmpcliEPtSIxBMO4pCoaHY6+OQ8yW9ZskgHfD1uVavRNLKrv3+8vkfp8IdfpJGc+wW9awctlqmQ4B
	TZ0bHm1SHJCakyO6VrgMUqr1E2Vdw2JS83S9SrMsf85TEEzxyLn73WeQaCpat5eK6NITdsX48Hll4
	HhfPRguw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZ71-00000002gV2-2G4Z;
	Fri, 19 Sep 2025 11:17:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZ6z-00000002gUR-3Oeb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 11:17:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F416643DF9;
	Fri, 19 Sep 2025 11:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B8FC4CEF0;
	Fri, 19 Sep 2025 11:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758280628;
	bh=kgRw65o5Hf9LDU9VxxGWKm+G8HsE+qwuxlRs/gNASDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CXMsRA+eANj+d/E+i0mYdJKoBLepJ5Oz+0NY9VCsl4c/jAtmCO/tHQxah9DMe4lBV
	 TnuGw1SafWHNfMLLLyoU3fJk2dyhyUbjhjZR82kNXpo+5PkgEYxipFsEYBAtihXFmD
	 OMRF8w2tJ/Y1eGLKlstGRduKfehl2ltJuDHbaXFH6LrsRRB9DWux5rH4huT1P2LIR5
	 159uG/Gms6qEvzWKbPjr6Y1enDBRig7MHxbPDNkYuvlMWIvYCQmDBKdwdqw+S7zujN
	 ejmjvoDcEpxMtXKZVXc5B/mTxgttI6R7+DvPyS5SgOh5cOLZoLajgjQE7Q5bxmTmre
	 3sb9tMJL7u6PA==
Date: Fri, 19 Sep 2025 12:17:03 +0100
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>, yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com,
	james.clark@linaro.org, robh@kernel.org, anshuman.khandual@arm.com,
	jonathan.cameron@huawei.com, hejunhao3@huawei.com,
	linuxarm@huawei.com, prime.zeng@hisilicon.com, xuwei5@huawei.com,
	wangyushan12@huawei.com
Subject: Re: [PATCH v2 2/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT
 cores
Message-ID: <aM07r5IC2sdHB1qq@willie-the-truck>
References: <20250820084534.28037-1-yangyicong@huawei.com>
 <20250820084534.28037-3-yangyicong@huawei.com>
 <aMwJ5FpGRmsyhQuZ@willie-the-truck>
 <d890b8e6-37f5-4466-b580-7e6d8c1d29bf@huawei.com>
 <aM0fgQvO6p91mF_u@J2N7QTR9R3>
 <49ca87d6-9e5f-96f1-d807-b936d2e1c483@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49ca87d6-9e5f-96f1-d807-b936d2e1c483@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_041709_891993_91CACFFB 
X-CRM114-Status: GOOD (  36.59  )
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

On Fri, Sep 19, 2025 at 06:27:54PM +0800, Yicong Yang wrote:
> On 2025/9/19 17:16, Mark Rutland wrote:
> > On Fri, Sep 19, 2025 at 04:56:18PM +0800, Yicong Yang wrote:
> >> On 2025/9/18 21:32, Will Deacon wrote:
> >>> On Wed, Aug 20, 2025 at 04:45:34PM +0800, Yicong Yang wrote:
> > 
> >>>> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> >>>> index 5c310e803dd7..137ef55d6973 100644
> >>>> --- a/drivers/perf/arm_pmu.c
> >>>> +++ b/drivers/perf/arm_pmu.c
> >>>> @@ -901,6 +901,9 @@ struct arm_pmu *armpmu_alloc(void)
> >>>>  
> >>>>  		events = per_cpu_ptr(pmu->hw_events, cpu);
> >>>>  		events->percpu_pmu = pmu;
> >>>> +
> >>>> +		if (!pmu->has_smt && topology_core_has_smt(cpu))
> >>>> +			pmu->has_smt = true;
> >>>
> >>> Why isn't that just:
> >>>
> >>> 	pmu->has_smt = topology_core_has_smt(cpu);
> >>>
> >>> ?
> >>
> >> also works. since one pmu only contains one type of CPU, so just thought
> >> no need to set it multiple times.
> >>
> >>> but then if that's the case, why do we need to stash the result in the
> >>> PMU at all?
> >>
> >> should based on the discussion here [1]. stash it during probe will avoid
> >> calling {raw_}smp_processor_id() in pmu::event_init() which may be
> >> horrible for debug in some condition.
> >>
> >> [1] https://lore.kernel.org/linux-arm-kernel/aJsV7nzlILHd_ZMa@J2N7QTR9R3/
> > 
> > This isn't about being 'horrible for debug'; my comment there was saying
> > that the proposed patch was incorrect AND it would be horrible to debug
> > that in practice when it inevitably went wrong.
> > 
> > The key details are:
> > 
> > (1) We need pmu::event_init() to know whether the cycle counter can be
> >     used such that it doesn't permit a group to be created which can
> >     *NEVER* be scheduled in hardware. Otherwise, the core perf code will
> >     waste time periodically trying to schedule that group when it will
> >     *ALWAYS* be rejected by pmu::add().
> > 
> > (2) The pmu::event_init() call runs in a preemptible context and can
> >     run on any CPU in the system, completely independent of the PMU's
> >     supported CPUs. Thus [raw_]smp_processor_id() tells you nothing
> >     about the CPU(s) the event will run on.
> > 
> >     Note that for task-bound events, the event->cpu is -1, so that
> >     doesn't tell us either. Only the PMU instance tells us the set of
> >     CPUs.
> > 
> 
> yes this is the problem in the last approach using [raw_]smp_processor_id()
> in pmu::event_init().. sorry for the wrong information replied above and
> thanks for help me recall this..
> 
> > We can solve that by either stashing this boolean flag at probe time OR
> > having pmu::event_init() check something like:
> > 
> > 	topology_core_has_smt(cpumask_first(pmu->supported_cpus));
> > 
> 
> this works. I didn't think of this approach... pmu->supported_cpus may contain
> offline CPUs but it doesn't matter since topology_core_has_smt() can also
> retieve the SMT implementation for offline CPU.
> 
> > ... and I think stashing at probe time is nicer/clearer.
> > 
> 
> I feel similar. will wait for Will's comments :)

Seems like it's two against one, so we'll go with pmu->has_smt and I'll
live with it.

Will

