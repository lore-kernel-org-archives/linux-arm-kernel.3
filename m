Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F9BE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 21:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RmeqvqWWSUYBUtVoitaaIKcqngujk/6p1ETAIdV+/c=; b=k74P7DpeuxshO+HI4zEH/oLlqo
	4Jh9m3N4+fOBdOQNymrWp8FZAGJ29j+nALaRRzzVrtM/fsWzbGbAtdopOOFMnbS4TuP+I40fgFkw4
	MKepl5fI7FljcOdOBV61yrgRIkBPtiKTOTEOIj8PJrE+xexCY0aEZzFcuZ2CPUEioamw4emWOLLO/
	c9+Q/jYCbBg3DIfw1W9AMX/Y0cN2dGfYmhZpZGIyZLPdRBhJn9NDctzD/wCUt3b2TdunoKjBYmcB9
	KGD803nBg8sjz+sJnvZOEEmztij8YzerCLnfqARlgTX5xY8kOPuYeFoXYJi5XxB3rmVKqvlIArjwT
	3Tksd0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIxNv-0000000Dxye-3vIa;
	Wed, 04 Dec 2024 21:58:15 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIxMu-0000000Dxt0-02ay
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 21:57:13 +0000
Date: Wed, 4 Dec 2024 13:56:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733349426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4RmeqvqWWSUYBUtVoitaaIKcqngujk/6p1ETAIdV+/c=;
	b=DdpLPeLwbJUxOj1OhAJzwuUqWHe0NNhVATfvn06/ghXi31JPgry15DyHseooq4Zc9vaq9u
	80qAL8nXldMTrEDyb+zARIXGhyrtJrjMUApsPcHHkAXJBGCOeo3Ev7SsYTEBCshgqJEyzp
	KcqHk+//eBHCs4wS1IlR7aT8OZyEJXk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 05/14] KVM: arm64: Always allow fixed cycle counter
Message-ID: <Z1DQKg02tebLmGsO@linux.dev>
References: <20241203193220.1070811-1-oliver.upton@linux.dev>
 <20241203193220.1070811-6-oliver.upton@linux.dev>
 <87ldwwsbad.wl-maz@kernel.org>
 <Z0-HBsBgf6WB7x4R@linux.dev>
 <87ikrzstt1.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikrzstt1.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_135712_527511_48460C70 
X-CRM114-Status: GOOD (  19.62  )
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

On Wed, Dec 04, 2024 at 09:04:26AM +0000, Marc Zyngier wrote:
> On Tue, 03 Dec 2024 22:32:38 +0000,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > > More importantly, the current filtering works in terms of events, and
> > > not in terms of counters.
> > > 
> > > Instead of changing the ABI, how about simply not supporting filtering
> > > on such non-compliant HW? Surely that would simplify a few things.
> > 
> > Yeah, that sounds reasonable. Especially if we allow programmable event
> > counters where the event ID space doesn't match the architecture.
> 
> Another thing I have been wondering is if a slightly better approach
> would be to move some of the handling to the PMU driver itself, and
> let it emulate PMUv3 if it can. This would allow conversion of event
> numbers in situ rather than polluting the PMUv3 code in KVM.

Sure, but I think the actual event fed into perf_event_create_kernel_counter()
should be the correct hardware event, not a PMUv3 event reinterpreted
behind the scenes. Otherwise, we'd need to devise an alternate config encoding
for PMUv3-like events since the event ID spaces overlap.

I'm thinking this could be a helper in the arm_pmu struct that takes a
PMUv3 event and spits out (in this case) an M1 event. The resulting KVM
code would be miniscule, like:

u64 kvm_map_pmu_event(struct kvm *kvm, u64 eventsel)
{
	struct arm_pmu *pmu = kvm->arch.arm_pmu;

	if (!pmu->map_pmuv3_event)
		return eventsel;

	return pmu->map_pmuv3_event(eventsel);
}

static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
{

	[...]

	attr.config = kvm_map_pmu_event(vcpu->kvm, eventsel);
	event = perf_event_create_kernel_counter(&attr, ...);
}

We could even have the M1 PMU driver populate arm_pmu->pmceid_bitmap
with the events it knows about and get PMCEID emulation for free.

-- 
Thanks,
Oliver

