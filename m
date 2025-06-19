Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873E9C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpNMm7+iraDtlv3r4NZ2iAVcnI6OhAJlxqB6Otbd2KQ=; b=atja8B5D1eYZCmlORSb2oKpXFj
	0UePpaTE/KzBRgmxmBQfLT+lS6S3ANYwTieuEJbJPovwkhbRXbRGKM+E+wzoMSmwhbFwLqj2h68H+
	VoVoz6FAYvkKLxVuSct0PRQ3tzloXtKC4bukfowTIESv1OSUKXI78nOJfgoSjcAGRUnhzB32iifd1
	VfFRiO1Y1pAVxuy8VlldyoRVieor6AuXWWyUsmAUhhN1W2ZWTgGBHjh2sOLP6+v2ECs2XvEit/qYb
	JRpW02HbXUxFdNbKf0RCFgIuBxDrpyV+tBdWnDuwEJxUOlDbSfaJnLiJB20umhHYWW/Y/5NIRxdy5
	AyBUWuFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRs-0000000DS1d-0JKX;
	Thu, 19 Jun 2025 15:45:08 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDRW-0000000Crs9-24HU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:28:31 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so370415f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 04:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750332508; x=1750937308; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MpNMm7+iraDtlv3r4NZ2iAVcnI6OhAJlxqB6Otbd2KQ=;
        b=TvPwY/wYQVzIEV3QyTfBtKD941SY8rB6z5mvms9MrrgMB5r7c3D4deu2sL62olJ1ei
         Qp2p8jqYa8LnuwksI3Sn8oGb6pUhZiP9YE3zraitRdDRpTQrjtpjzpjJ/IKpykvMLyl2
         StfFcBnD34VcsBYKESJC0+V8MUgFg9qNf23xFp5PKAUbSC1gdP7EFWSWmcQALwbHoJs/
         VHNPMVIDZ/ZC9SOaF/tem6ARKtEp7K+TeiLJSLtR2mDKe/OkwQCsoKO9YD4sBC0r0yDv
         5nQU+J7NOnAsXJH93IdeuAQ8QkqIXxO9Cx/+ziHG+W1caCMVA2ADHWOF/ESuqMqoj/TA
         KmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750332508; x=1750937308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MpNMm7+iraDtlv3r4NZ2iAVcnI6OhAJlxqB6Otbd2KQ=;
        b=rcqf1b51V3/rfA3WhQAH/Bhz1meBSBj/q1gmZNIeY8T8dY5xlrVIO0sUWGdvq9GgWd
         s8RIVgJHBzYII7SIW17viS/8cGGHPLTlMsGUdWcumqj/w9kXs8ZMZTXB4zjxBbB/mreG
         S1hXow48s5cKNjn93CA5Xw+U2qy++6nZGYl3FXuVJJhAuyRm+ocrwKyhht+sPFAnQxev
         mMfYGSLeg6icwqGMuD0nOeWmBLdKSD94xap2GGj8X0yKI3m2HlKd4WXj/jyTBtkP/2N6
         MfrYgs2ftIKLkiYphWI4miK8PgqWzQnGSk3wqpfNR8xvtJfRbUQ3QIoaRMizsrBU6Pjv
         tgyw==
X-Forwarded-Encrypted: i=1; AJvYcCX1B3omyazf55Z/EOyzIovsKoIozb4ic5BptY8xPnTzFy6JBIMFz57AAPJveWMGQ4YhzcfmUszHiSL9NBVDa80B@lists.infradead.org
X-Gm-Message-State: AOJu0Yw324+es88J5rpNEWTXvZs0jRHRdL5ikFzgV1iP4m4+a8Cmsws3
	vnihB/RVl1o2QLZUS53X12fVen7HpdRu0xo0sB0LfXrjwW0ktLJSGBfSwXLjOVUdjeQlNmP3c2p
	ifjqP
X-Gm-Gg: ASbGncvQzwTQwOaRw/71L6YdwjsSEriAmP/8PY+yiDdNx3ykmuIUwWj7MR2c71Mjmnt
	N0+625cugk7roIv+FSEIwJT8iT75stQt1xiFeQIIvHX+kgg1JsvrU3CvOUrbexrUybIMwF8firE
	KJu7f8bczsLVGh3F6CZoPpopd+doc0M6C46fXcZPxrzV52vT6y/I0E6ktg8SdJrSV9vyFaFPGeI
	WYjG2Q8Cei8ze7EFO78TXQ9w6RyZPRiNwln0z8gXCO3aprUJDnBJ6jKM4cMYwDH58RJ8gmZjsMW
	LchKaSHb7BEilf7FUH50qvQJxJB9/c9K8atOyG5DOk9qZ6teCkMP+/oIdr1GqXIxl0MftOiso4Q
	glA==
X-Google-Smtp-Source: AGHT+IHC0sbX9Z9VqfAmAZiUDmN26P+ig5+XGpKEWeMktgLCD/97lAcJvUfJW5zzgit7Gtv3T8jF7w==
X-Received: by 2002:a05:6000:4304:b0:3a4:dc42:a0c3 with SMTP id ffacd0b85a97d-3a572e9e438mr17317684f8f.56.1750332508563;
        Thu, 19 Jun 2025 04:28:28 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a6ee12sm19274954f8f.31.2025.06.19.04.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 04:28:28 -0700 (PDT)
Message-ID: <3a833298-10a1-4c6a-8a90-6836c47a1dcb@linaro.org>
Date: Thu, 19 Jun 2025 12:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drivers/perf: arm_spe: Store event reserved bits in
 driver data
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>
References: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-0-6faecf0a8775@arm.com>
 <20250613-arm_spe_support_hitm_overhead_v1_public-v1-1-6faecf0a8775@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-1-6faecf0a8775@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_042830_564106_DF735BF9 
X-CRM114-Status: GOOD (  20.31  )
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



On 13/06/2025 4:53 pm, Leo Yan wrote:
> Store the reserved event bits in the driver structure. This cached value
> avoids redundant calls to arm_spe_pmsevfr_res0() each time a profiling
> session is created.
 > > Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/perf/arm_spe_pmu.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index 3efed8839a4ec5604eba242cb620327cd2a6a87d..be2ed326bb794d7e5dd1d6cfa89330753ced3ca5 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -77,6 +77,7 @@ struct arm_spe_pmu {
>   	u16					pmsver;
>   	u16					min_period;
>   	u16					counter_sz;
> +	u64					pmsevfr_res0;

IMO this is a premature optimization and we shouldn't store things that 
are only transformations of some other already stored value. It becomes 
another thing to worry about when it's valid to read and to potentially 
keep it up to date etc.

It's just one new one now, but eventually you end up with tons of them 
and then someone forgets to update a dependent one when the parent value 
changes and it makes a mess.

And arm_spe_pmu_event_init() isn't even a particularly hot path.

>   
>   #define SPE_PMU_FEAT_FILT_EVT			(1UL << 0)
>   #define SPE_PMU_FEAT_FILT_TYP			(1UL << 1)
> @@ -722,10 +723,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
>   	    !cpumask_test_cpu(event->cpu, &spe_pmu->supported_cpus))
>   		return -ENOENT;
>   
> -	if (arm_spe_event_to_pmsevfr(event) & arm_spe_pmsevfr_res0(spe_pmu->pmsver))
> +	if (arm_spe_event_to_pmsevfr(event) & spe_pmu->pmsevfr_res0)
>   		return -EOPNOTSUPP;
>   
> -	if (arm_spe_event_to_pmsnevfr(event) & arm_spe_pmsevfr_res0(spe_pmu->pmsver))
> +	if (arm_spe_event_to_pmsnevfr(event) & spe_pmu->pmsevfr_res0)
>   		return -EOPNOTSUPP;
>   
>   	if (attr->exclude_idle)
> @@ -1103,6 +1104,8 @@ static void __arm_spe_pmu_dev_probe(void *info)
>   		spe_pmu->counter_sz = 16;
>   	}
>   
> +	spe_pmu->pmsevfr_res0 = arm_spe_pmsevfr_res0(spe_pmu->pmsver);
> +
>   	dev_info(dev,
>   		 "probed SPEv1.%d for CPUs %*pbl [max_record_sz %u, align %u, features 0x%llx]\n",
>   		 spe_pmu->pmsver - 1, cpumask_pr_args(&spe_pmu->supported_cpus),
> 


