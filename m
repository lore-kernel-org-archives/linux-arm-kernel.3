Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D29CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 16:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q19oaIkh8pZtTx6+ejqtPcIWBkJdlO13ec1bjezpv68=; b=XJBffDLXgYHl+HuNWVhzywQ/X/
	VBmo+uNQdQl6acs8PInTa43ohFzwAloOqQQztNRaMWit2Uoq03Nt+ZNzoXQdiDtyLaQYEoqKRAI5R
	IVGMIPLerjYulDl8OkURYyPfqAAO/+84kDs8o8ExpcptsAaBAxiL3ibNfejxBJA4XDlEdjN6/Oz5f
	iATxiz3xO6UV8iZFFcBLyXrI4TZSAYg6m5rEJ/z5+eXVorgDXDQS1pNB79RBgUN5NkTi75kc/HA+S
	ErGfCXE/KHPwkymaPSK7wyiJoKAbkcmj1eceCZJAfDUcXX3E9woGY4SYnA1W/c3T9Z3XHT/8l1IO+
	K+4GOvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgLn-0000000C46w-0dBm;
	Fri, 02 Oct 2026 16:43:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgLh-0000000C46E-3esM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 16:43:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FDA31476;
	Fri,  2 Oct 2026 09:43:01 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 302C93F86F;
	Fri,  2 Oct 2026 09:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790959385; bh=S1ocxV/VbevQfXTqsaKRpnBp8nCL0tXpJMZQOIv/8vo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J4Rcbcl1TxRBmBGk0V26lf8P0Uwknezro9iX1Faz3t96bHD19HEEoIVqdA5R03QFU
	 OHmOvaRc9MxuYvvd1vNhxlfokUqhLZ1cbVPU3IZloxGFF3f4g0mFwIDHGWNO3F2XPI
	 WStR4GnjwYQ0rSmCeuzlSu5tuC2zyRWc6EgWHSVc=
Message-ID: <2d70be7b-12c0-46e0-b308-744a3159388a@arm.com>
Date: Fri, 2 Oct 2026 17:43:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: Allow userspace to select the PMU's CPU
To: "Okanovic, Haris" <harisokn@amazon.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "will@kernel.org" <will@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260929223244.2411400-1-harisokn@amazon.com>
 <b782f893-e3ab-40f7-a7c5-ce19660be2c1@arm.com>
 <CY2PR18MB8432185386B28FBC1DA23F3333A88B2@CY2PR18MB843218.namprd18.prod.outlook.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CY2PR18MB8432185386B28FBC1DA23F3333A88B2@CY2PR18MB843218.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_094306_037179_2F56E902 
X-CRM114-Status: GOOD (  24.22  )
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

On 30/09/2026 8:29 pm, Okanovic, Haris wrote:
> Hi Robin,
> 
>>> All of the PMU's recurring work therefore lands on one CPU. This is
>>> problematic on systems which reserve particular CPUs for latency
>>> sensitive work or confine background activity to a chosen set of
>>> housekeeping CPUs.
> 
>>> There is no way to set it explicitly. perf_event_open() and 'perf stat
>>> -C' have no effect because arm_cmn_event_init() overwrites event->cpu;
>>> /proc/irq/*/smp_affinity is refused for the DTC interrupts, which are
>>> requested with IRQF_NOBALANCING because their affinity has to follow the
>>> owning CPU.
> 
>> All system PMU drivers have the same concern in this regard - why
>> should arm-cmn be special?
> 
> As I mentioned earlier, we can improve performance on certain system
> topologies by assigning PMU work to housekeeping CPUs.
> 
> arm-cmn has no constraints around CPU assignment, so this is possible.
> Every register access is MMIO and the DTC interrupts can be affinitised
> anywhere, so any online CPU can own it. That's what makes "write any
> online CPU" a sound interface here. I've moved it to CPUs in both NUMA
> nodes on the two platforms I tested.
> 
> You're right that the concern is general, but a single interface isn't
> easily shared, because the set of CPUs that a PMU may be driven from
> is platform/device-specific:
> 
> arm_dsu_pmu, for instance, can only be driven from the CPUs attached to
> the DSU, which it already exposes as "associated_cpus" and enforces in
> event_init(); hisi_uncore_pmu publishes the same attribute.
> 
> Intel uncore is per-die: MSR-accessed boxes must be read from a CPU on
> the target die, since rdmsr reads the executing CPU. Accepting an
> arbitrary CPU there would silently read a different die's counters.

You seem to have missed my point. Pretty much all system/uncore PMU 
drivers - other than the trivial ones with non-programmable free-running 
counters and no interrupt - have to pick a CPU to associate with, 
irrespective of whether it's from the whole system or some specific 
subset, and they all do so effectively arbitrarily, whether that's by 
cpumask_local_spread(), cpumask_any(), cpumask_any_and() or whatever. If 
one driver picking an arbitrary CPU is a problem that needs fixing, why 
do the dozens of other drivers which also pick an arbitrary CPU not also 
need fixing?

And the answer is that they do! Irrespective of whether systems might 
want particular CPUs to do particular things, we've already seen that in 
systems with lots of PMU instances, when they all end up on the same 
default "any CPU", it ends up severely over-serialising event scheduling 
to a degree that can start to significantly impact event runtimes.

> Do you have an alternate API in mind?

I don't see this being practical without first generalising the notion 
of CPU affinity so that it can at least be dealt with from a single 
place in the perf core. Inconsistent, ad-hoc hacks in individual drivers 
will not scale or be maintainable. Perf core also then has a reasonable 
chance of being able to reliably avoid racing against itself, whereas 
attempting to mitigate racy calls from within those calls when it's 
already too late is never really going to be a proper solution.

Thanks,
Robin.

