Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4D7C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 11:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Qw4uHb2miFMURj+GlOF0mgNf4WXU9GXeO7JmqKsLUU=; b=emsLsT5I5vXX0HFVgWimlolxfd
	VRg1gfOzJjIVIyec5O9RDcndFnzopH6I6dTOKFMDodt2Dfbi4Uxq+uXT7ha6GTSkZlphXdtbgq+XC
	ipr3CU3mIgOZz2nGyFj00l+bwi08+63EGhaLCcTJqgi4FsUa8hIvA7J2yV1kPnDNwtvausU396btZ
	/4mEns1x/tlKrMy26+hzjNZi05xM4MAWco723HS+3AQWJssBmbsZJN6E/5fcWkXhtrtehx9L1Lddq
	esL9tDFqiYmoOvWxGcvFxMb3yhest9ijjSL6UvuMEpJHyYhCzJODe+wa9ESI4i6pFBPtet1oZxWdC
	EAbt/0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZrx-0000000FSan-2aiJ;
	Fri, 20 Jun 2025 11:25:17 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZ7R-0000000FM7u-1Gea
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 10:37:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-453647147c6so6824565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 03:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750415832; x=1751020632; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Qw4uHb2miFMURj+GlOF0mgNf4WXU9GXeO7JmqKsLUU=;
        b=KSOUp7bQmssDeY5VIWJ1knu4KOD3xyk0qZoQokkjWoDNZ49ODn1CTZ4VRmm5JZWq1j
         49gbBTuhVnXNBgwSP6NTmgKhCsjhFz57FyNzuSdT7MPB10NzFdK034Ex3Y1hbjDLCGGv
         wJWh73Tbwb1qUKRSsLOb+qP7grSggVXRgWkA/nHsNPqA+LU6ODXJh4dkqrbE9LqsN24y
         d+UV0korSEJ3hM6AazJRukyz3yVC1NyaC9bV6Y36EJTluZDxSxprmsIIFNDH8+DCYYXM
         AnDZRuCYUUl6Ri55iZBhPg/YJKPa6UvE3CUyZIxKKPMtHYwk9XiSUOh0aydBfYcJTNuN
         N03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415832; x=1751020632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Qw4uHb2miFMURj+GlOF0mgNf4WXU9GXeO7JmqKsLUU=;
        b=iyFiGxL+7UKw3kherLqe+/8/Q5zQKjg0QhAjFZehswzR26CFMI8FBmZiTDd4ExoS7q
         yDd8BY+4M9s+qumQd9O1oID7uRvgVCsI+j9HZl7ct/EcepLyK5GUFsZB6CLigH46KwgR
         OC3ne7EG9hHTHXxdprMby3VdFdRdTZNjwHmNKXh+PxHEQptsku1u8HbkPecVpQgCLcS0
         2mKJizu5Z4BhuawbmeyiGJqkNi0SKQobSUpI0YmSeEJUJvJ9Pznn0Q0Z6ymUu79ktA7s
         yp24eIrBjZiXdDrVMehQkqhm6dBsPnnY7SAtsUuEL9zJJEqk/t4cacep+c7BaM0gaac9
         Xa9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9E3Bd62ECUK6a3a618rhMO2qUViaBYsLyzjkv1D158arf38+v1GO8xdWf2xjsuxRqtubfbtvJc629mvguHdnU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+keMY3fMu16BeMqLnl3PyOSGrOgOeZq2zapZlxpsydWAxU2Lq
	sAK770hZMoDieqLEbN8zY6YlETYCCuE1VLtmenVIM8wntouWCZ82q+UE4wWFLeWP7kg=
X-Gm-Gg: ASbGnctB2esUeh1t+qrjbgZF0MPX4Y8iYtmVD1TH8NHpbuFMoUyQN/cyFgj7R/I9rok
	mbSNkPKK/QxV319/AgwM+y09mwtDj/jdwTjjhNMTRoHSZaV+1B7HNpxQQTdLXTi8/+IjKe0kigz
	q+bGATc03t9sg7wOMrLEi6rlZw49M2OjwYcT1dMFtDog+Oyvb0KvL6O5OY0PiKDzbXSlbPsgdRN
	y6HgRSVAqwfNLGLZ3FtP4HrVpB/1ZlLLwYh+GktHDyniNQoqsal9RiMytjEzMRCSjF/49AUITw5
	KI9gfnvObMuSkagOvuabmesqWe3tTpJ7hQ08AEqDLy9/9hATvF/TUPlk8ntRXZNBvHY=
X-Google-Smtp-Source: AGHT+IEF6QONHUMg2SXvjSO3dQFckJ8Bm0mqnGeVgafpCQ/hKom7svtIBg7u7cwUr2vDb5+1ayMDZg==
X-Received: by 2002:a05:600c:c4aa:b0:453:a95:f07d with SMTP id 5b1f17b1804b1-453654cb7b3mr25608665e9.10.1750415831697;
        Fri, 20 Jun 2025 03:37:11 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm30717055e9.1.2025.06.20.03.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 03:37:11 -0700 (PDT)
Message-ID: <c9ebcc02-cbe7-403f-a427-b1209e3c041a@linaro.org>
Date: Fri, 20 Jun 2025 11:37:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] perf arm_spe: Fill memory levels for FEAT_SPEv1p4
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
 <20250613-arm_spe_support_hitm_overhead_v1_public-v1-9-6faecf0a8775@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-9-6faecf0a8775@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_033713_380601_27425C7E 
X-CRM114-Status: GOOD (  17.58  )
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
> Starting with FEAT_SPEv1p4, Arm SPE provides information on Level 2 data
> cache and recently fetched events. This patch fills in the memory levels
> for these new events.
> 
> The recently fetched events are matched to line-fill buffer (LFB). In
> general, the latency for accessing LFB is higher than accessing L1 cache
> but lower than accessing L2 cache. Thus, it locates in the memory
> hierarchy information between L1 cache and L2 cache.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe-decoder/arm-spe-decoder.h |  3 +++
>   tools/perf/util/arm-spe.c                         | 14 ++++++++++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> index 03da55453da8fd2e7b9e2dcba3ddcf5243599e1c..90c76928c7bf1b35cec538abdb0e88d6083fe81b 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> @@ -25,6 +25,9 @@
>   #define ARM_SPE_SVE_PARTIAL_PRED	BIT(EV_PARTIAL_PREDICATE)
>   #define ARM_SPE_SVE_EMPTY_PRED		BIT(EV_EMPTY_PREDICATE)
>   #define ARM_SPE_IN_TXN			BIT(EV_TRANSACTIONAL)
> +#define ARM_SPE_L2D_ACCESS		BIT(EV_L2D_ACCESS)
> +#define ARM_SPE_L2D_MISS		BIT(EV_L2D_MISS)
> +#define ARM_SPE_RECENTLY_FETCH		BIT(EV_RECENTLY_FETCHED)

FETCH -> FETCHED

Reviewed-by: James Clark <james.clark@linaro.org>

>   
>   enum arm_spe_op_type {
>   	/* First level operation type */
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 8f18af7336db53b00b450eb4299feee350d0ecb9..2ab38d21d52f73617451a6a79f9d5ae931a34f49 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -842,6 +842,12 @@ static void arm_spe__synth_ld_memory_level(const struct arm_spe_record *record,
>   	if (arm_spe_is_cache_hit(record->type, L1D)) {
>   		data_src->mem_lvl = PERF_MEM_LVL_L1 | PERF_MEM_LVL_HIT;
>   		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
> +	} else if (record->type & ARM_SPE_RECENTLY_FETCH) {
> +		data_src->mem_lvl = PERF_MEM_LVL_LFB | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_LFB;
> +	} else if (arm_spe_is_cache_hit(record->type, L2D)) {
> +		data_src->mem_lvl = PERF_MEM_LVL_L2 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
>   	} else if (arm_spe_is_cache_hit(record->type, LLC)) {
>   		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
>   		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> @@ -853,6 +859,9 @@ static void arm_spe__synth_ld_memory_level(const struct arm_spe_record *record,
>   	} else if (arm_spe_is_cache_miss(record->type, LLC)) {
>   		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_MISS;
>   		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> +	} else if (arm_spe_is_cache_miss(record->type, L2D)) {
> +		data_src->mem_lvl = PERF_MEM_LVL_L2 | PERF_MEM_LVL_MISS;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
>   	} else if (arm_spe_is_cache_miss(record->type, L1D)) {
>   		data_src->mem_lvl = PERF_MEM_LVL_L1 | PERF_MEM_LVL_MISS;
>   		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
> @@ -868,6 +877,11 @@ static void arm_spe__synth_st_memory_level(const struct arm_spe_record *record,
>   		data_src->mem_lvl |= arm_spe_is_cache_miss(record->type, LLC) ?
>   				     PERF_MEM_LVL_MISS : PERF_MEM_LVL_HIT;
>   		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> +	} else if (arm_spe_is_cache_level(record->type, L2D)) {
> +		data_src->mem_lvl = PERF_MEM_LVL_L2;
> +		data_src->mem_lvl |= arm_spe_is_cache_miss(record->type, L2D) ?
> +				     PERF_MEM_LVL_MISS : PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
>   	} else if (arm_spe_is_cache_level(record->type, L1D)) {
>   		data_src->mem_lvl = PERF_MEM_LVL_L1;
>   		data_src->mem_lvl |= arm_spe_is_cache_miss(record->type, L1D) ?
> 


