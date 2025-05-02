Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB61C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 10:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puSPtJgiq5j+3P1fzpHguSE2J5rQeUrLCM0jY3yUNWY=; b=IC8ZDw7cGfbqLeYoHBJSwpaWqp
	cVN7hOUwctAn2p4TuKwZYXqBjz9lQgZ2C0rvRO0+TBW/MRx8gWMGwn//+s72xPecl47k8mnG2z/e0
	ePZn/+AfO3yDXBpTsNhrAN3rJ+iH1B1aerdsNC0LhJ7L69omQuBRoVeSjC87A1UGNaAG1nY08UqhI
	FWo6tdJGVPwsTPhuPk0DG5+RhxE8DlijG3r0KZvZhnBsfFZehJ/f9/1688w5v+cJqEAwsrelyOvMp
	61bYOx9Z5TO/Mrl1WziKHFVx2PZNEWT3FhgGdg7cMzBYiSS7updaR5364XhH//c5Bpdd2lIvqUE8Q
	FKMipsoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAo1t-00000001gn6-0sbp;
	Fri, 02 May 2025 10:54:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnzv-00000001gEI-2frm
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 May 2025 10:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=puSPtJgiq5j+3P1fzpHguSE2J5rQeUrLCM0jY3yUNWY=; b=cjH9aAjDq18LnxycTLCPha+M07
	JVrStImAY2++7hiM76pybVp+eEIOiw19hA7ln5ZgWVbwxi3+Q7LhFEP6u7rBINp4QAw4q0QBjtiUs
	+n0b1GMPhyrnXhpMbf+jKpntxsFv6AKWV/LZZGeFOAtpx5KwuG5ekbo+vrepmqTN2ujaN5dRcoVgj
	BHCTTyKeDLwdor/3c9vPEKVraDUmUvCsVU/GC/W1JjZ8sitYYTLwyvhYVwAoOdSWOPdq32vY1rUtS
	VFPKUPFulL1MgwpVFnVfk/sAf27sBWqTlN5kD1ybxbL7KdMSQnManAn0oNeWO6GKB9sXE8uXSEnQX
	BAJsEhqA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAnzr-0000000EmP6-3cjt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 10:52:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81E8A1688;
	Fri,  2 May 2025 03:51:47 -0700 (PDT)
Received: from [10.163.80.227] (unknown [10.163.80.227])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F8993F66E;
	Fri,  2 May 2025 03:51:45 -0700 (PDT)
Message-ID: <02c125c9-7a1f-4dfd-b058-02a38ed5b598@arm.com>
Date: Fri, 2 May 2025 16:21:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] perf: Allocate non-contiguous AUX pages by default
To: Yabin Cui <yabinc@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Liang Kan <kan.liang@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
References: <20250501193556.23473-1-yabinc@google.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250501193556.23473-1-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_115200_510587_9A960AA6 
X-CRM114-Status: GOOD (  30.06  )
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

On 5/2/25 01:05, Yabin Cui wrote:
> perf always allocates contiguous AUX pages based on aux_watermark.
> However, this contiguous allocation doesn't benefit all PMUs. For
> instance, ARM SPE and TRBE operate with virtual pages, and Coresight
> ETR allocates a separate buffer. For these PMUs, allocating contiguous
> AUX pages unnecessarily exacerbates memory fragmentation. This
> fragmentation can prevent their use on long-running devices.
> 
> This patch modifies the perf driver to be memory-friendly by default,
> by allocating non-contiguous AUX pages. For PMUs requiring contiguous
> pages (Intel BTS and some Intel PT), the existing
> PERF_PMU_CAP_AUX_NO_SG capability can be used. For PMUs that don't
> require but can benefit from contiguous pages (some Intel PT), a new
> capability, PERF_PMU_CAP_AUX_PREFER_LARGE, is added to maintain their
> existing behavior.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
> Changes since v2:
> Let NO_SG imply PREFER_LARGE. So PMUs don't need to set both flags.
> Then the only place needing PREFER_LARGE is intel/pt.c.
> 
> Changes since v1:
> In v1, default is preferring contiguous pages, and add a flag to
> allocate non-contiguous pages. In v2, default is allocating
> non-contiguous pages, and add a flag to prefer contiguous pages.
> 
> v1 patchset:
> perf,coresight: Reduce fragmentation with non-contiguous AUX pages for
> cs_etm
> 
>  arch/x86/events/intel/pt.c  |  2 ++
>  include/linux/perf_event.h  |  1 +
>  kernel/events/ring_buffer.c | 20 +++++++++++++-------
>  3 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
> index fa37565f6418..25ead919fc48 100644
> --- a/arch/x86/events/intel/pt.c
> +++ b/arch/x86/events/intel/pt.c
> @@ -1863,6 +1863,8 @@ static __init int pt_init(void)
>  
>  	if (!intel_pt_validate_hw_cap(PT_CAP_topa_multiple_entries))
>  		pt_pmu.pmu.capabilities = PERF_PMU_CAP_AUX_NO_SG;
> +	else
> +		pt_pmu.pmu.capabilities = PERF_PMU_CAP_AUX_PREFER_LARGE;
>  
>  	pt_pmu.pmu.capabilities		|= PERF_PMU_CAP_EXCLUSIVE |
>  					   PERF_PMU_CAP_ITRACE |

Why this PMU has PERF_PMU_CAP_AUX_PREFER_LARGE fallback option but
not the other PMU in arch/x86/events/intel/bts.c even though both
had PERF_PMU_CAP_AUX_NO_SG ?

> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 0069ba6866a4..56d77348c511 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -301,6 +301,7 @@ struct perf_event_pmu_context;
>  #define PERF_PMU_CAP_AUX_OUTPUT			0x0080
>  #define PERF_PMU_CAP_EXTENDED_HW_TYPE		0x0100
>  #define PERF_PMU_CAP_AUX_PAUSE			0x0200
> +#define PERF_PMU_CAP_AUX_PREFER_LARGE		0x0400
>  
>  /**
>   * pmu::scope
> diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
> index 5130b119d0ae..4d2f1c95673e 100644
> --- a/kernel/events/ring_buffer.c
> +++ b/kernel/events/ring_buffer.c
> @@ -679,7 +679,7 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>  {
>  	bool overwrite = !(flags & RING_BUFFER_WRITABLE);
>  	int node = (event->cpu == -1) ? -1 : cpu_to_node(event->cpu);
> -	int ret = -ENOMEM, max_order;
> +	int ret = -ENOMEM, max_order = 0;

0 order is now the default allocation granularity. This might benefit
from a comment above explaining that max_order could change only with
PERF_PMU_CAP_AUX_NO_SG or PERF_PMU_CAP_AUX_PREFER_LARGE PMU flags etc.

>  
>  	if (!has_aux(event))
>  		return -EOPNOTSUPP;
> @@ -689,8 +689,8 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>  
>  	if (!overwrite) {
>  		/*
> -		 * Watermark defaults to half the buffer, and so does the
> -		 * max_order, to aid PMU drivers in double buffering.
> +		 * Watermark defaults to half the buffer, to aid PMU drivers
> +		 * in double buffering.
>  		 */
>  		if (!watermark)
>  			watermark = min_t(unsigned long,
> @@ -698,16 +698,22 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>  					  (unsigned long)nr_pages << (PAGE_SHIFT - 1));
>  
>  		/*
> -		 * Use aux_watermark as the basis for chunking to
> +		 * For PMUs that need or prefer large contiguous buffers,
> +		 * use aux_watermark as the basis for chunking to
>  		 * help PMU drivers honor the watermark.
>  		 */
> -		max_order = get_order(watermark);
> +		if (event->pmu->capabilities & (PERF_PMU_CAP_AUX_NO_SG |
> +						PERF_PMU_CAP_AUX_PREFER_LARGE))
> +			max_order = get_order(watermark);
>  	} else {
>  		/*
> -		 * We need to start with the max_order that fits in nr_pages,
> +		 * For PMUs that need or prefer large contiguous buffers,
> +		 * we need to start with the max_order that fits in nr_pages,
>  		 * not the other way around, hence ilog2() and not get_order.
>  		 */
> -		max_order = ilog2(nr_pages);
> +		if (event->pmu->capabilities & (PERF_PMU_CAP_AUX_NO_SG |
> +						PERF_PMU_CAP_AUX_PREFER_LARGE))
> +			max_order = ilog2(nr_pages);
>  		watermark = 0;
>  	}
>  

Although not really sure, could event->pmu->capabilities check against the ORed
PMU flags PERF_PMU_CAP_AUX_NO_SG and PERF_PMU_CAP_AUX_PREFER_LARGE be contained
in a helper pmu_prefers_cont_alloc(struct *pmu ...) or something similar ?

