Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514ACC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TW+EIblYSmY3UAv6OXokVKqXHCwpCq6qXK9NdANI4Q=; b=oYt8J6hD8Il8eQFc9zACmLOBhk
	mSs4BGm6Zr4F9PH0Mt85vKalFtKngpAlLtvEnXKVr+ccGD60lFWyuubLJRFf9x+bFTErmszkyF+hM
	FwzIhJeu9Uz/F3sHAI5anNdXKIQpo3IxJ5ZMgT7mENSFeuWwdIf2PAeARJ42PuPZAb46IxOFT5v9E
	rGYMGgedRMtMXv2hXBlsjhafYuvr6Oxo/BGNPaRmS+MxEls68d8yPEnj8+7OViQZdnLBIin2YGCdV
	czAbGNhRnCmRYODt5Q2SirJAJjyYtmfikEmWy+LLQanSpXxpbf2Dpxxt09cwpKPAK0VqrkRXUFKU+
	HamOzgIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogXb-00000005ByO-0Y7C;
	Tue, 28 Jul 2026 12:04:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogXQ-00000005Buk-488M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:04:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35E3E168F;
	Tue, 28 Jul 2026 05:03:54 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D980E3F86F;
	Tue, 28 Jul 2026 05:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785240238; bh=QPMGxfL7sRTASsW/WHWUTA/jar9afmNRd3cjtJDfS60=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=lI2HlSLEWWdzGRHJUWPkDET2bYIhr+PKaIuu/cVoXdNqZOKj2PnlZn8Rx6MLNH+F0
	 WeD7R+qbMzYIRM67Ka4N1ZcUXfJsMH78O6Hc1MPjbVUE4iwhsPzCOhFHmuEU3MKK5P
	 vIL2NjO7vAlNUN6P5TLN9tSgX/hiZKT88cPCR3e4=
Message-ID: <54c60aa5-6fd7-44fd-9a9c-2d7e658e8c7f@arm.com>
Date: Tue, 28 Jul 2026 13:03:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] perf: Generic hotplug/cpumask for system PMUs
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org, mark.rutland@arm.com, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, namhyung@kernel.org
Cc: alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, james.clark@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1784911757.git.robin.murphy@arm.com>
 <d85ac6d5f5f6383be5b882b6694052eac8062ced.1784911757.git.robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <d85ac6d5f5f6383be5b882b6694052eac8062ced.1784911757.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_050401_113601_176B44FF 
X-CRM114-Status: GOOD (  13.20  )
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

On 24/07/2026 6:48 pm, Robin Murphy wrote:
[...]
> @@ -12918,6 +12943,17 @@ int perf_pmu_register(struct pmu *_pmu, const char *name, int type)
>   	INIT_LIST_HEAD(&pmu->events);
>   	spin_lock_init(&pmu->events_lock);
>   
> +	/*
> +	 * Finally, if appropriate give the PMU a chance to pick an initial CPU
> +	 * affinity for its cpumask, or initialise any general per-CPU state.
> +	 * Note that we're serialised against perf_event_{init,exit}_cpu()
> +	 * themselves here by virtue of pmus_lock.
> +	 */
> +	if (pmu->init_cpu) {
> +		for_each_online_cpu(cpu)

Having thought about it, while the drivers I want to convert should all 
be fine with a potential double-init, I guess it is true that an 
outgoing CPU in between CPUHP_AP_PERF_ONLINE and CPUHP_TEARDOWN_CPU 
would still be in cpu_online_mask with interrupts enabled, and thus 
potentially able to be picked by the driver callback, and thus end up 
inaccessible unless and until that CPU comes back again. So indeed for 
true race elimination this probably should use perf_online_mask. I'll 
save spamming a v3 until I get some feedback that the overall idea is 
worth pursuing at all, though.

(But I shall continue to ignore the rest of the twaddle from word-salad 
models which apparently can't differentiate "initialise" from "allocate"...)

Thanks,
Robin.

> +			smp_call_function_single(cpu, perf_scope_init_cpu, pmu, 1);
> +	}
> +
>   	/*
>   	 * Now that the PMU is complete, make it visible to perf_try_init_event().
>   	 */

