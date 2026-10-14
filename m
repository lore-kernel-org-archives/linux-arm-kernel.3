Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB51CC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 14:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgDmbLtvb0Bbe+ZC7gTroHBuG04gtGr+M66R48NvSNE=; b=xVwJZY19EdKkjLAp18F29dZZCb
	lkobncT+carVemzgqg7xAXDNNVcE5M5xrZpPpbag0l1UyWi53OzRVMm/XZtbQYRFKuwDyBb+H8tH6
	TYS7wKOxEvFLcbxxb7IhtcmDIf3azD9xb1jckWXAZYc4vZ4dAxpaOIlbQdSA636KOyDZTSd66bS4R
	+h0ZELcvuYYza65SeDk/qQ/JX5lHL67PWAIGKnB5lNBqpZ8q3OKOPddEU9MrCS26t4dmpB/LVWw77
	HEfGJUaz8zUOfqx5pp7yvqZA0EAXpX+7jAhxXMwDo7gedi6djkIpvEbE4++wCgy6vyQw5Oi7oh4HB
	kxWrUuJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzwf-0000000FjBY-05kG;
	Wed, 14 Oct 2026 14:27:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzwd-0000000FjAI-1Fms
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 14:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YgDmbLtvb0Bbe+ZC7gTroHBuG04gtGr+M66R48NvSNE=; b=aIcvs3pB14ryVDWbEmekFH/yfH
	L4wvARr7t48z3/YgPShqmFfhMnXDKDkQ24/l0t4geeKA0lhOEd/NSK6TaAwovDG7ry7PTgQ1WzlOc
	9cMs1z7p4paDET+dFZRjcMr9kSrpVWndewTPISP76zGKsAtbDJ0lfIbK9eamUZWw3JhfVo/yjqVGU
	iaf3xk8GAMJRJsoj/i9UcSAjJUokVIss25/4KnM+BEsFneS4Fw6hNhcMpijIL566Tx2YwCl20nV+7
	ggINxs4GsdpM3SbmQ9DkS15XoaLxbRTR0FdVHVdvW1oZaXm3MOuPoJvXwWiwKm3vUmIH+RJq8k+2j
	LEhfuEgg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGzwR-0000000Gsbw-1ifW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 14:26:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09D311570;
	Wed, 14 Oct 2026 07:26:16 -0700 (PDT)
Received: from [10.57.12.254] (unknown [10.57.12.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 313283F673;
	Wed, 14 Oct 2026 07:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791987979; bh=F84HomwI7RDpju62PoqCWgA1Ivfs4haiBD/st0o+QzE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nFBgg7xs78iiK+yIReZwBNw+qWrI1JYs6yVae8edJkk6j+F+8YkDvGcapDQbql5Tn
	 e6OBc+S6BRxNLQ3McUWK/8p+/tYmsXTU/3Qp5IsgdadZPyjlSTYLNI/4GJLLLyDnLf
	 3AyF8VMWuq2wd7jYlcyw46wh5qQHawDBjcE/sOF8=
Message-ID: <e9d01b93-3658-4ba3-a15c-e6b4122b5c08@arm.com>
Date: Wed, 14 Oct 2026 15:26:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] perf/core: Add PERF_PMU_SCOPE_DEVICE
To: Peter Zijlstra <peterz@infradead.org>,
 Haris Okanovic <harisokn@amazon.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013185603.1347265-1-harisokn@amazon.com>
 <20261013185603.1347265-3-harisokn@amazon.com>
 <20261014102700.GC4121339@noisy.programming.kicks-ass.net>
Content-Language: en-GB
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20261014102700.GC4121339@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_152652_153268_E95326B4 
X-CRM114-Status: GOOD (  21.69  )
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

On 2026-10-14 11:27 am, Peter Zijlstra wrote:
> On Tue, Oct 13, 2026 at 01:56:01PM -0500, Haris Okanovic wrote:
>> Add a "device" pmu::scope for PMUs counted on a single CPU drawn
>> from a driver-supplied set instead of a fixed topology.
>>
>> This mechanism is implemented by new callbacks: filter_allowed_cpus()
>> is invoked to constrain the running CPU set to an allowed set for a
>> particular device; migrate_cpu() is used to perform any device specific
>> migration steps. Both are optional, e.g. for devices that can run on
>> any CPU or have no additional migration steps.
>>
>> Placement initially happens in perf_pmu_register() before the PMU
>> becomes visible, and is subsequently re-evaluated on hotplug events.
>> A new CPU selection is made by cpumask_any_distribute() to spread out
>> load from multiple devices, but only when the previous CPU selection is
>> offline or no longer allowed by filter_allowed_cpus().
>>
>> PMU events of these devices follow the chosen CPU. They are initially
>> bound to a CPU in perf_try_init_event() then reassigned by
>> perf_pmu_migrate_context() when a new CPU is selected.
> 
>>
>> The initial CPU assignment can race with migration, leaving a stranded
>> event. A sequence counter is added to close this gap without additional
>> locks. A count in struct pmu increments on each migration and is copied
>> to struct perf_event on init. The copied count is checked again before
>> the event is installed, under the same context mutex, which causes
>> perf_event_open() and perf_event_create_kernel_counter() to return -EBUSY
>> during migration periods.
> 
> I'm not entirely sure on this. How is this race different from changing
> CPU on hotplug?

Not much, other than that hotplug is at least already serialised against 
perf_event_open on the perf core side via perf_online_mask. This is also 
where I was heading with my generic hotplug proposal[1] - once perf core 
can be in charge of that, it should then be viable to also migrate PMUs 
for reasons other than hotplug, and it would all look the same to the 
drivers.

(Yes, as-is my patch still preserves the status quo of drivers picking 
their own target CPU to keep things simple, but that was one of the 
points I was hoping to generate some discussion on...)

Thanks,
Robin.

[1] 
https://lore.kernel.org/linux-arm-kernel/cover.1784911757.git.robin.murphy@arm.com/

