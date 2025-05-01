Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF327C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 10:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=si3fNE9GQSrIDtSL2LXUzl+e8wIwmtqlcMDREI82glc=; b=r1cMhc0+LBrDsrTF9q1TdtGxHE
	8k5Sz8tGVDYZECZZ6fiUEHi7wn3Xhuof+YnhFaJ3oFi043QShoFkhL3suSGtZLQRmGmMyyQogt7bG
	CSqVRzXucnteP+edeJ4ZmO5ZcF0exoEYzu1+GYjPkDwitF1JfjRqP3M0cBRVXhiAxszV+GYn4LFQK
	3sugtTJg5LV8PkamY/ffCqIAVI3XjcW0SQ2u7NGsRMHB7YXUIh89xnfAsf35vOKL7PZ1ASpGomDpc
	wYZb7nr3sXs3kBf8mVJxBON2OTjnmRKg1u1lyRe01vwWzCrgQ58UUZNy5EPeYSc9yscoqdx60I+St
	UIyAIQXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARUd-0000000FDyO-3d2g;
	Thu, 01 May 2025 10:50:15 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARSQ-0000000FDnB-48oX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 10:48:00 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso460402f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 03:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746096477; x=1746701277; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=si3fNE9GQSrIDtSL2LXUzl+e8wIwmtqlcMDREI82glc=;
        b=gLfywZS2117RF7vVYGAtiqufMCtGM/j1ENg4YvRT61RRg7jpvXEcsUYHckZSZLTzar
         hXqewQNyFZtfsq3/ouGKXrm2HHKm3rxGWjQ6QLqH2I/sAsuQyQ27HA8bjP6Lkll0jYz5
         5l5MClQx3GvAORfzSTSjazehublTlaO8CL7/vOMGp3zSHm5d9ByY/jsUPvdy2OE0LtbN
         g2gYzQkOfjDjb/YPxRTOTFJBMWapM82DTGgglxodLG44LBX0VXtYp6Awi5c3Xk+Xm70/
         nscs4hA8ugpbZzuSa0W5JrUehcdVDBtNZzXvh79NKRT4cxDMcaacC9w+5cjR8/Iejc5z
         Ff/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746096477; x=1746701277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=si3fNE9GQSrIDtSL2LXUzl+e8wIwmtqlcMDREI82glc=;
        b=uq2XBKh7Ygy+gp+frGtXdeVoTlYC5Y7ZO8zGx04hA0cbbxcIzyzFDKQlAg7tTTeiy8
         SrlkH9syhQHejdO3rxr/EaHsqnSTvuMMgrqdFppSHOpc+pthioDqlaTijWuLLH+OcKeT
         cLVmr2stOseRMGiIWre+AYr0noeOd/oanjR7jET4GjmrnnB4lCBq0vcc2vO68ouwnUlq
         N5OVqiFYHJr62DiluEkLIACa1sXCyyb9/bZjfxpV4zvtGQSdnY7+ajYewR03XZlBMzcl
         M/0ZiuCTMMxg78WQ2ApUk88PCDjtShVyHHXK9V5aZexkm1ElZu9PNpzsXX0zYqAmm2/Y
         7eGg==
X-Forwarded-Encrypted: i=1; AJvYcCVUrduJt8UnDpF580CH7fxqfweDfh/QoV/BxyVFRPQE0iTJobQHaUXg7UYeIGPPtPP28vnuZvL8IRR1O43VzYAH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8lEd5sLZQ/gEcXznDkb3NYOzIt44qxfAJMes+nMzRU10KxAS+
	XzrrMoJpJ1xe9z7NBN9EFboG501wSCjXONZ1xM55EDqAdrIT7GMJCixm3tO5gNw=
X-Gm-Gg: ASbGncsVZ4d1SEsB6C0RAVb0ZC8meLdrC3mn3ourK8cK1B7pF4whBsf5jPQZtKJdmxH
	BP7jGR/Y28Zg0tGJlSVbXsXzO2droqtq43f7chr7Fwc5FIdOo0GbbyciUBZ0fw4LaHcdRYVAddG
	WpySL4tag/wlZSyx3f5+YGoQT6Q0FFX2s/spcHFn/8YtZbFOuswu9M3AkQIuBLKVBN4xrdS6bWH
	A0de/sj1nCOOKrtP5Fvop5R8Wu54TUeX7KV6+WwXxSXhChIwkEls3UtT/SMD21kRGavlUKtVeXZ
	2qPoitE1zyG6TCEmBJemG5n3MOCQaqYQdhQSBBqQ+6UpvIZh0ckSew==
X-Google-Smtp-Source: AGHT+IHslO86ZF1CU2IPZPf6KTthtEvUGuil8yHuz65YUqPluNBK+P3P3sk3bArImylFI/g6oEQAvQ==
X-Received: by 2002:a05:6000:1ac8:b0:391:3f4f:a169 with SMTP id ffacd0b85a97d-3a08ff3c000mr5090505f8f.32.1746096477139;
        Thu, 01 May 2025 03:47:57 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a8f92fsm520512f8f.90.2025.05.01.03.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 03:47:56 -0700 (PDT)
Message-ID: <a7c2ff21-4399-4cff-83d9-2fb0da0b5a08@linaro.org>
Date: Thu, 1 May 2025 11:47:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf: Allocate non-contiguous AUX pages by default
To: Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Liang Kan <kan.liang@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
References: <20250429213133.922495-1-yabinc@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250429213133.922495-1-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_034759_049498_C3C56BFC 
X-CRM114-Status: GOOD (  30.14  )
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



On 29/04/2025 10:31 pm, Yabin Cui wrote:
> perf always allocates contiguous AUX pages based on aux_watermark.
> However, this contiguous allocation doesn't benefit all PMUs. For
> instance, ARM SPE and TRBE operate with virtual pages, and Coresight
> ETR allocates a separate buffer. For these PMUs, allocating contiguous
> AUX pages unnecessarily exacerbates memory fragmentation. This
> fragmentation can prevent their use on long-running devices.
> 
> This patch modifies the perf driver to allocate non-contiguous AUX
> pages by default. For PMUs that can benefit from contiguous pages (
> Intel PT and BTS), a new PMU capability, PERF_PMU_CAP_AUX_PREFER_LARGE
> is introduced to maintain their existing behavior.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
> Changes since v1:
> In v1, default is preferring contiguous pages, and add a flag to
> allocate non-contiguous pages. In v2, default is allocating
> non-contiguous pages, and add a flag to prefer contiguous pages.
> 
> v1 patchset:
> perf,coresight: Reduce fragmentation with non-contiguous AUX pages for
> cs_etm
> 
>   arch/x86/events/intel/bts.c |  3 ++-
>   arch/x86/events/intel/pt.c  |  3 ++-
>   include/linux/perf_event.h  |  1 +
>   kernel/events/ring_buffer.c | 18 +++++++++++-------
>   4 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/x86/events/intel/bts.c b/arch/x86/events/intel/bts.c
> index a95e6c91c4d7..9129f00e4b9f 100644
> --- a/arch/x86/events/intel/bts.c
> +++ b/arch/x86/events/intel/bts.c
> @@ -625,7 +625,8 @@ static __init int bts_init(void)
>   		return -ENOMEM;
>   
>   	bts_pmu.capabilities	= PERF_PMU_CAP_AUX_NO_SG | PERF_PMU_CAP_ITRACE |
> -				  PERF_PMU_CAP_EXCLUSIVE;
> +				  PERF_PMU_CAP_EXCLUSIVE |
> +				  PERF_PMU_CAP_AUX_PREFER_LARGE;
>   	bts_pmu.task_ctx_nr	= perf_sw_context;
>   	bts_pmu.event_init	= bts_event_init;
>   	bts_pmu.add		= bts_event_add;
> diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
> index fa37565f6418..37179e813b8c 100644
> --- a/arch/x86/events/intel/pt.c
> +++ b/arch/x86/events/intel/pt.c
> @@ -1866,7 +1866,8 @@ static __init int pt_init(void)
>   
>   	pt_pmu.pmu.capabilities		|= PERF_PMU_CAP_EXCLUSIVE |
>   					   PERF_PMU_CAP_ITRACE |
> -					   PERF_PMU_CAP_AUX_PAUSE;
> +					   PERF_PMU_CAP_AUX_PAUSE |
> +					   PERF_PMU_CAP_AUX_PREFER_LARGE;
>   	pt_pmu.pmu.attr_groups		 = pt_attr_groups;
>   	pt_pmu.pmu.task_ctx_nr		 = perf_sw_context;
>   	pt_pmu.pmu.event_init		 = pt_event_init;
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 0069ba6866a4..56d77348c511 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -301,6 +301,7 @@ struct perf_event_pmu_context;
>   #define PERF_PMU_CAP_AUX_OUTPUT			0x0080
>   #define PERF_PMU_CAP_EXTENDED_HW_TYPE		0x0100
>   #define PERF_PMU_CAP_AUX_PAUSE			0x0200
> +#define PERF_PMU_CAP_AUX_PREFER_LARGE		0x0400
>   
>   /**
>    * pmu::scope
> diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
> index 5130b119d0ae..d76249ce4f17 100644
> --- a/kernel/events/ring_buffer.c
> +++ b/kernel/events/ring_buffer.c
> @@ -679,7 +679,7 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>   {
>   	bool overwrite = !(flags & RING_BUFFER_WRITABLE);
>   	int node = (event->cpu == -1) ? -1 : cpu_to_node(event->cpu);
> -	int ret = -ENOMEM, max_order;
> +	int ret = -ENOMEM, max_order = 0;
>   
>   	if (!has_aux(event))
>   		return -EOPNOTSUPP;
> @@ -689,8 +689,8 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>   
>   	if (!overwrite) {
>   		/*
> -		 * Watermark defaults to half the buffer, and so does the
> -		 * max_order, to aid PMU drivers in double buffering.
> +		 * Watermark defaults to half the buffer, to aid PMU drivers
> +		 * in double buffering.
>   		 */
>   		if (!watermark)
>   			watermark = min_t(unsigned long,
> @@ -698,16 +698,20 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>   					  (unsigned long)nr_pages << (PAGE_SHIFT - 1));
>   
>   		/*
> -		 * Use aux_watermark as the basis for chunking to
> +		 * For PMUs that prefer large contiguous buffers,
> +		 * use aux_watermark as the basis for chunking to
>   		 * help PMU drivers honor the watermark.
>   		 */
> -		max_order = get_order(watermark);
> +		if (event->pmu->capabilities & PERF_PMU_CAP_AUX_PREFER_LARGE)
> +			max_order = get_order(watermark);
>   	} else {
>   		/*
> -		 * We need to start with the max_order that fits in nr_pages,
> +		 * For PMUs that prefer large contiguous buffers,
> +		 * we need to start with the max_order that fits in nr_pages,
>   		 * not the other way around, hence ilog2() and not get_order.
>   		 */
> -		max_order = ilog2(nr_pages);
> +		if (event->pmu->capabilities & PERF_PMU_CAP_AUX_PREFER_LARGE)
> +			max_order = ilog2(nr_pages);

Doesn't this one need to be 'PERF_PMU_CAP_AUX_PREFER_LARGE | 
PERF_PMU_CAP_AUX_NO_SG', otherwise the NO_SG test further down doesn't 
work for devices that only have NO_SG and not PREFER_LARGE.

NO_SG implies PREFER_LARGE behavior, except that NO_SG additionally hard 
fails if it can't do it in one alloc. But I think you shouldn't have to 
set them both to get the correct behavior.


