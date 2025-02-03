Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06351C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 06:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TeyiLeHiTE196+/HgG3Gc+/m1/IDOfR0F/AsKLGOww=; b=SyMYzTtRkCDyBaYf4uG2SOPb+v
	3gEd4HMxjXmY3hPGh1EW1aV2CRTOMbz8Sy/FLSORBaqyGoGK6Zd9Vagea0oA6dl9yi87OxwC3mdI+
	NSzIDfSG+VvH5hj9JgXekl9lC52ypA4FS21KvcVFADwQzXkpHgUhjmSBXmcr4S9U98Zm4g82Ff9z5
	WSql3RT88KiNkCqTihv6M00jhCzEAUOP/+Rx4E7J+WmSg0jk89xP4+hw9dV6OsDcMOkSWcp+/1g+q
	avz7+KY/XeoQUHJFjigHlKh5Gv12IHCtp5lGCGB3ciWfeHHRJ+SFcP+gKDTiQ0VcwGVg9m6KhGQFR
	k86NiYKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tepal-0000000Ecay-0wyl;
	Mon, 03 Feb 2025 06:05:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tepZQ-0000000EcUb-2lF2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 06:04:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E39C1476;
	Sun,  2 Feb 2025 22:04:56 -0800 (PST)
Received: from [10.162.16.79] (unknown [10.162.16.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EF0F3F63F;
	Sun,  2 Feb 2025 22:04:27 -0800 (PST)
Message-ID: <5bcc9ffb-62a0-4b98-9b41-9cf1786751a6@arm.com>
Date: Mon, 3 Feb 2025 11:34:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 02/11] perf: arm_pmu: Don't disable counter in
 armpmu_add()
To: "Rob Herring (Arm)" <robh@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-2-1c1300802385@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250202-arm-brbe-v19-v19-2-1c1300802385@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_220432_792890_3928EE2D 
X-CRM114-Status: GOOD (  28.07  )
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



On 2/3/25 06:12, Rob Herring (Arm) wrote:
> From: Mark Rutland <mark.rutland@arm.com>
> 
> Currently armpmu_add() tries to handle a newly-allocated counter having
> a stale associated event, but this should not be possible, and if this

A stale associated event ? Does that mean hw_events->events[idx] still
points to a valid event even though counter idx has already been freed
up and allocated to a new event.

> were to happen the current mitigation is insufficient and potentially
> expensive. It would be better to warn if we encounter the impossible
> case.

Makes sense.

> 
> Calls to pmu::add() and pmu::del() are serialized by the core perf code,
> and armpmu_del() clears the relevant slot in pmu_hw_events::events[]
> before clearing the bit in pmu_hw_events::used_mask such that the
> counter can be reallocated. Thus when armpmu_add() allocates a counter
> index from pmu_hw_events::used_mask, it should not be possible to observe
> a stale even in pmu_hw_events::events[] unless either
> pmu_hw_events::used_mask or pmu_hw_events::events[] have been corrupted.
> 
> If this were to happen, we'd end up with two events with the same
> event->hw.idx, which would clash with each other during reprogramming,
> deletion, etc, and produce bogus results. Add a WARN_ON_ONCE() for this
> case so that we can detect if this ever occurs in practice.

Agreed.

> 
> That possiblity aside, there's no need to call arm_pmu::disable(event)

s/possiblity/possibility

> for the new event. The PMU reset code initialises the counter in a
> disabled state, and armpmu_del() will disable the counter before it can
> be reused. Remove the redundant disable.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/perf/arm_pmu.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index 398cce3d76fc..2f33e69a8caf 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -342,12 +342,10 @@ armpmu_add(struct perf_event *event, int flags)
>  	if (idx < 0)
>  		return idx;
>  
> -	/*
> -	 * If there is an event in the counter we are going to use then make
> -	 * sure it is disabled.
> -	 */
> +	/* The newly-allocated counter should be empty */

Should this comment also include what happens when two events some how end
up using the same 'event->hw.idx' as mentioned in the commit message, just
to make things clearer.

> +	WARN_ON_ONCE(hw_events->events[idx]);
> +
>  	event->hw.idx = idx;
> -	armpmu->disable(event);
>  	hw_events->events[idx] = event;
>  
>  	hwc->state = PERF_HES_STOPPED | PERF_HES_UPTODATE;
> 

Otherwise LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

