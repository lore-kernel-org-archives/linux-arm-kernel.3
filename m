Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5633C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 09:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxV/4ni6q0aC0NPRBzz2zpqrQ+HPJcgTCYdiRIa1Dqk=; b=hVH0nzURlDmBCtFt7oyBgbplvD
	+EvUofSLJ6bYS85XblZcMOj9ByqUUfpOLuenXtq0pa2Gxh8yWCzOfoITNeIUNX2GyJq5Xli+7hS1C
	YMNaZH626kCbvASMOuT7qpcONbt8+YTMdGkQbyYbWkYKryysW15puYsmELxeoa1kFQk8geIlwZMG2
	YX8cy3wP1+lRDc4O0mPdT76UAMOtTCyya803Cmv+zu8xch2zC6NcJux5ry5qaoXac2pQYrL6oYvFP
	MsQAneb43Uo6xhkTFDYibWytFLbQosOuhe8sAjZ1mcYgWlRaciogIYA2lT5TWjJZz4U5a0rHl4YAw
	CGwtxdgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxUO-00000000FYa-3q6b;
	Thu, 08 May 2025 09:24:24 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCx8z-00000000CIK-0Sej
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 09:02:18 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3995ff6b066so404904f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 02:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746694935; x=1747299735; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TxV/4ni6q0aC0NPRBzz2zpqrQ+HPJcgTCYdiRIa1Dqk=;
        b=AmcUu7nluInOWRMhbVpxSJbjyOnhSlK7sgodNfvqSjOwC9hHnmO2Hl2n/pVeDoI5MS
         13ip5jgpRWhfg4jzY8Qsxmw0x9JBEFpoXyScMK3BVkAzFJWnh0qZWmqxINF8FW4ukJBO
         ZHzikMO+XJqB/ES9OvuvTGgj/hLcichBb/jjkMobdkuyyuQAATTpnwPcKq3VA2Vt2GYM
         iY/Dnth47A0SF8feWPewncqJwsMkLxEYBuX29ApbU11sHM9FaRpOo2n2gENR9ej3/eQr
         65OAKOUvsStgDWh9m9EvuM/nCdtaahPM8zYa4tNEkNVLoCEIXt3NYe1Rk9OXFGiJRlbF
         h2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746694935; x=1747299735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TxV/4ni6q0aC0NPRBzz2zpqrQ+HPJcgTCYdiRIa1Dqk=;
        b=INPwidysgM8UnK4XODCEpzjcUrtaI+EFMILul5Gd7QK3blH2PCCfJao3HG0TkKR7B6
         kkqs9ph8QAgqCVqgZ6JYy40wXhKwdts1JpdtoT5HR8OalzepKJ+Zar03+0zk9j40bcj/
         woZTN9cqWxd0wIg2Ip15kvp1PVZaxvSS5OrRu/0QPKVjOqRb7FIX6Deh1p9q2rQGef+t
         vjozc0gwWqIkPmGzIYn56HjXVmywvmpsRgxhTV9sREBZCRU9jVplcXeLVYYNXjrGh7rC
         yIBuIlVZoDE+X9nGyp7GQ3c6ydG8cMTg7nDX6xc8YZocKHFOFLkH0LVqYwENEtIHE5DL
         V14w==
X-Forwarded-Encrypted: i=1; AJvYcCX2IwEeeowz4/5hyrXsZDQkcq4XJ1TZDLVn8RtYRblvGQwfNyu4mI9aHrNPcs6z3uHrY3fKyH2vO2kK99CycMA2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+5Du/WHBu/11GIhk9/Ri8/VO49YxYQnQR8LM1qUsAbK7KPAuN
	gVPEjBZ6JTYskuqy/vd4Ua+OjoCj9vdr/hC695CivPA3r3LZAD7IjExQM2BCpAU=
X-Gm-Gg: ASbGncsJJL6fYLxtCE31p8qSRUZ/brxo3NBtUCXoyIAYB3Afuwcp/ChQZg8U4UHEVmi
	uTpSGKMtX+f756sLEvEKCZVquvM6wa1BRQlOUBKDwk3djweCR1b708igJZaZ7UNUjuKjbydcFAF
	lXveU+O6ZNv5S1ePWcr3rOtPxvYcPRqWqlJadPYxm0fPx06Bx56unFuLebZP6K95tbsTtw4Jneh
	ocrPUb+MR0HAHhengD9XuP8e4ow9KrMfLqZeINEInzaftgHB9Neqgk3vHwFf8fhNXLhQLZBz7YC
	GrwFkTFjQY0wMDBsiDOQt9SOS41amu8Q62sk90lTKDs=
X-Google-Smtp-Source: AGHT+IGND12jBuwGb9fbCT8AT3eW6atqvX53aTSi7rk1Y/3WdjX/LgXU1BNPBra4UmXrAyxLW1UlqQ==
X-Received: by 2002:a5d:47a6:0:b0:391:4873:7943 with SMTP id ffacd0b85a97d-3a0b4a29c0dmr4950605f8f.32.1746694934826;
        Thu, 08 May 2025 02:02:14 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b44ad93asm5693275f8f.91.2025.05.08.02.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 02:02:14 -0700 (PDT)
Message-ID: <dee41e51-879d-491a-a330-9876660befa9@linaro.org>
Date: Thu, 8 May 2025 10:02:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] perf: Allocate non-contiguous AUX pages by default
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
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
References: <20250507181346.1892103-1-yabinc@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250507181346.1892103-1-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_020217_177146_8932CF85 
X-CRM114-Status: GOOD (  33.38  )
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



On 07/05/2025 7:13 pm, Yabin Cui wrote:
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
> Changes since v3:
> Add comments and a local variable to explain max_order value
> changes in rb_alloc_aux().
> 
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
>   arch/x86/events/intel/pt.c  |  2 ++
>   include/linux/perf_event.h  |  1 +
>   kernel/events/ring_buffer.c | 33 ++++++++++++++++++++++++---------
>   3 files changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
> index fa37565f6418..25ead919fc48 100644
> --- a/arch/x86/events/intel/pt.c
> +++ b/arch/x86/events/intel/pt.c
> @@ -1863,6 +1863,8 @@ static __init int pt_init(void)
>   
>   	if (!intel_pt_validate_hw_cap(PT_CAP_topa_multiple_entries))
>   		pt_pmu.pmu.capabilities = PERF_PMU_CAP_AUX_NO_SG;
> +	else
> +		pt_pmu.pmu.capabilities = PERF_PMU_CAP_AUX_PREFER_LARGE;
>   
>   	pt_pmu.pmu.capabilities		|= PERF_PMU_CAP_EXCLUSIVE |
>   					   PERF_PMU_CAP_ITRACE |
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
> index 5130b119d0ae..69c90ea1b79a 100644
> --- a/kernel/events/ring_buffer.c
> +++ b/kernel/events/ring_buffer.c
> @@ -679,7 +679,19 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>   {
>   	bool overwrite = !(flags & RING_BUFFER_WRITABLE);
>   	int node = (event->cpu == -1) ? -1 : cpu_to_node(event->cpu);
> -	int ret = -ENOMEM, max_order;
> +	/*
> +	 * True if the PMU needs a contiguous AUX buffer (CAP_AUX_NO_SG) or
> +	 * prefers large contiguous pages (CAP_AUX_PREFER_LARGE).
> +	 */
 > +	bool use_contiguous_pages = event->pmu->capabilities & (> +	 
PERF_PMU_CAP_AUX_NO_SG | PERF_PMU_CAP_AUX_PREFER_LARGE);

Reviewed-by: James Clark <james.clark@linaro.org>

Minor nit: this comment is a bit verbose IMO, and it's only describing 
what rather than why. But the other one is ok.

> +	/*
> +	 * Initialize max_order to 0 for page allocation. This allocates single
> +	 * pages to minimize memory fragmentation. This is overriden if
> +	 * use_contiguous_pages is true.
> +	 */
> +	int max_order = 0;
> +	int ret = -ENOMEM;
>   
>   	if (!has_aux(event))
>   		return -EOPNOTSUPP;
> @@ -689,8 +701,8 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
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
> @@ -698,16 +710,19 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>   					  (unsigned long)nr_pages << (PAGE_SHIFT - 1));
>   
>   		/*
> -		 * Use aux_watermark as the basis for chunking to
> -		 * help PMU drivers honor the watermark.
> +		 * If using contiguous pages, use aux_watermark as the basis
> +		 * for chunking to help PMU drivers honor the watermark.
>   		 */
> -		max_order = get_order(watermark);
> +		if (use_contiguous_pages)
> +			max_order = get_order(watermark);
>   	} else {
>   		/*
> -		 * We need to start with the max_order that fits in nr_pages,
> -		 * not the other way around, hence ilog2() and not get_order.
> +		 * If using contiguous pages, we need to start with the
> +		 * max_order that fits in nr_pages, not the other way around,
> +		 * hence ilog2() and not get_order.
>   		 */
> -		max_order = ilog2(nr_pages);
> +		if (use_contiguous_pages)
> +			max_order = ilog2(nr_pages);
>   		watermark = 0;
>   	}
>   


