Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA26C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcnEXxxeKsCOsmpcqmjdXscM6sARewA8iaQ93yTUR2w=; b=kRyX01y4fUxid78Y2ai9TFK7zz
	vgMxPSofjKSGqplyu0KGXgLAthGeWTF2NsLw63jLFjGlm3lU8qJZNDb30wrBGOyjGddXO4Dd64tfw
	RRxT+sNxn8EFtON8ixoSa4sC8IIZwOCEP1lhEf5FmNB77Z30k5zZQtA7ZA/hzEQdZX9T3j+QBTUSo
	BmTQbu/nVUXWzqsG6Y99mbwiYtElsHP5XkBpCPrQFjeYb8f/NjijcecRT9SgW2bEPVogWHyIPeoBH
	jdUAu+pAWJhyI0rqP1VUd0mhnzDebFEpZJaujvQMenbLy1ajD4yEBUZR6svmzRoHIEvhlebyayVYC
	OGrBhBhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulriF-0000000BHys-39zu;
	Tue, 12 Aug 2025 16:18:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulm9Y-0000000AVAD-0UZT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 10:22:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA2F825E1;
	Tue, 12 Aug 2025 03:22:38 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B3793F738;
	Tue, 12 Aug 2025 03:22:44 -0700 (PDT)
Date: Tue, 12 Aug 2025 11:22:38 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: James Clark <james.clark@linaro.org>, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, yangyicong@hisilicon.com,
	robh@kernel.org, anshuman.khandual@arm.com,
	jonathan.cameron@huawei.com, hejunhao3@huawei.com,
	linuxarm@huawei.com, prime.zeng@hisilicon.com, xuwei5@huawei.com,
	wangyushan12@huawei.com
Subject: Re: [PATCH 2/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
Message-ID: <aJsV7nzlILHd_ZMa@J2N7QTR9R3>
References: <20250812080830.20796-1-yangyicong@huawei.com>
 <20250812080830.20796-3-yangyicong@huawei.com>
 <3d37844a-63c5-49c2-9d6d-7c3665a95466@linaro.org>
 <931e26ef-bdc6-5f9e-8976-d5a4b8e6e81f@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <931e26ef-bdc6-5f9e-8976-d5a4b8e6e81f@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_032248_194667_9E1A2A16 
X-CRM114-Status: GOOD (  23.26  )
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

On Tue, Aug 12, 2025 at 06:14:33PM +0800, Yicong Yang wrote:
> On 2025/8/12 18:00, James Clark wrote:
> > On 12/08/2025 9:08 am, Yicong Yang wrote:
> >> @@ -1002,6 +1002,15 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
> >>       if (has_branch_stack(event))
> >>           return false;
> >>   +    /*
> >> +     * The PMCCNTR_EL0 increments from the processor clock rather than
> >> +     * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
> >> +     * counting on a WFI PE if one of its SMT silbing is not idle on a
> >> +     * multi-threaded implementation. So don't use it on SMT cores.
> >> +     */
> >> +    if (cpumask_weight(topology_sibling_cpumask(smp_processor_id())) > 1)
> >> +        return false;
> >> +
> > 
> > Isn't this something that's static to the PMU? If all CPUs in each PMU are always the same then this doesn't need to be probed every time and can be set once.
> > 
> we can make use of PMCCNTR_EL0 if the SMT is runtime disabled, e.g. by /sys/devices/system/cpu/smt/control
> if set this at probe time then we permanently lose the chance to use PMCCNTR_EL0.

Can it be runtime enabled too?

If so, then we can't use PMCCNTR_EL0 in case we later dynamically go
from disabled to enabled.

I do not think this should be handled dynamically.

> > Also you can't call smp_processor_id() from here because this is
> > also called in armpmu_event_init() -> __hw_perf_event_init() ->
> > validate_group() before the event is actually scheduled on a CPU.
> > With CONFIG_DEBUG_PREEMPT you'd see the error.
> 
> ok, will use raw_smp_processor_id() instead. it won't affect the validation checking in pmu::event_init().
> in pmu::add() the cpu id is always stable so it'll also be fine.

NAK to this.

It *will* affect validation since it affects the number of events that
can be placed into a single group (by virtue of allowing or forbidding
an additional cycles events). That would be non-deterministic, which is
horrible to debug.

Mark.

