Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA21C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 11:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fR2JiKduz29SihBHyUhqzOKWWeUFFTMa8sDNsxCND9o=; b=Xf6Js2gbxgbvMAk99lmR7ZrUV1
	sf5oWFtNm54C31CzYwekkuSRqmcOJ6JTn+1nHV77o2G77vaJ5075Ft07ZPmlo3uH08aR98jNoQrXs
	ML7aivjMAK6qzTSVYwDm3Tx0JuC0J+ZfL0BlQhfqOScYgmWK0Skw+F108vBr1uvEYj/JYjdZYxYYD
	dUI45RenWFtD5/NJGS+v81ghTnUrF3x2mfBfuy4XQNgR47m5KeSnB5WyoSD63yC3DRp8wytqp4hOt
	g/hoZAFpUkQK7wbvYfGl/AmmjVtRtPcmPUlRkIgxZewi5Ofl8yuDZlHWfwNPp8FF6ygAnh2JCTBZW
	AXhYAOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZj9-0000000FRYa-3wFT;
	Fri, 20 Jun 2025 11:16:11 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZ0n-0000000FKyb-4AMi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 10:30:23 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-453426170b6so16623275e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 03:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750415420; x=1751020220; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fR2JiKduz29SihBHyUhqzOKWWeUFFTMa8sDNsxCND9o=;
        b=mkIJXIQgAqWBYYqAOZT9wEOKEi+DVZPtD33TB/hgZmBD6XypeJgx3pX9mSnBpdG8n6
         ryx+8BYrjI/TeKNmZ+UKRawZcHhZ9EP6SMqD7+07HLv7Kb9BK6cYHHgi3GHDSaALJMfR
         /XTvYofSn7BgdiZAyQ6hhNOSECucB+3BhoOwIKDUm7yR4tHVtMKnHet7ZDCnwcFIlAK7
         7NzVxgGcVN5P01yUlMRvvT61nwHNwDHCSwxpw3FsnNK31GSr2p6yYi5tEF+9iD3Vuo8o
         23E7VC+aypou5tX9esU+75vju5TbWbmHb63QZBa34a23P+058ul7LWbQRLgG+6Y5yesA
         AEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415420; x=1751020220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fR2JiKduz29SihBHyUhqzOKWWeUFFTMa8sDNsxCND9o=;
        b=X7Id5EJ0UVjuC9tBhK8SgGVze+Sb63K9mGuoOvbq3KKzWP6PjeblibF+Ao7tVfpOh/
         LLRwR593bk5lb/X93EJDcHApshSeXZmj5pbafFK3ONnQJR7dkZInRAGN7uUfedt1QWsf
         UTHUkj3mGHxeFBF082Svvcq8E6YTPLQFdnaPaI8SkS6jRBHHNLLczKRnaZ5AR7BbThXk
         Ub3SnzIbJTT1L7KW192zhxQHIvm9rY378iLZLBo2mcUltVBSysIerC2mVBkDlem7bA7j
         vdmtdBJ3V2kEWmzQ4hPWEX4x44sch8b80rT4YYrVG1lMTypa4dvru9SCkd5XJU1/DZU9
         bFDw==
X-Forwarded-Encrypted: i=1; AJvYcCV3yz0GFyzj66nA/gaqgoCE+0gAjS6tGz3aJ43HkWDLwjgOyoZp9B+rfC0KK88a9uWC6RtfE7UU0cJGkk3ArK3p@lists.infradead.org
X-Gm-Message-State: AOJu0YyJN37qvQ8RBmQINqnM29Xkm4K31Y0i4XTYp25rFKNnqAwkb8dV
	qhhvW+NqlRuOSiXXvruf9KbPIuLliotTrkP1doRN3VfTXfmyKZEPcmjtXhKtW4d4FU4=
X-Gm-Gg: ASbGnct6QmhP2BNCHoEU+O5gKFchjJbDgigz35BvwoT95EfXYlj2bjZGkdHkD92SA7h
	O5mcNnZyNQk6pSbdt8T2m/ouq+nhGpoW6pHjboejLAtIUOr1ur/KE9APpbU6o08coz0hyYlBwOR
	sP5yoOpMqpGlCJS0j9XC/uGD/RTjJGfxq2oUtDe43g+h1TYtHFdB1oA0s6/9cghtec1xI8F3yLG
	HenWNzU9F4WFkbMYeKJeQN1Avblvl8rH8kSTfe9qXMMCjjEvfqqnlNCaolZTMvOVKjFn/YLrhXd
	xxFwwvnNN5eTQF5I/kG02uQ0fVXs+Kyr2NpmW0n1mar8zJmwYrJK2tO1IQHu/lNrryM=
X-Google-Smtp-Source: AGHT+IGrcCthqm0ioH86WkDuKawZp+7l51060VVgntKbeJZgzMtH2dkN5uKRibR7xMjW8qMY6Mo5bg==
X-Received: by 2002:a05:600c:871b:b0:453:ec2:c7b2 with SMTP id 5b1f17b1804b1-45365e3dfc0mr17238275e9.7.1750415420300;
        Fri, 20 Jun 2025 03:30:20 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536470415csm20680135e9.31.2025.06.20.03.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 03:30:19 -0700 (PDT)
Message-ID: <3ede12b2-7d70-4e8d-8d6c-694c53d19098@linaro.org>
Date: Fri, 20 Jun 2025 11:30:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] perf arm_spe: Separate setting of memory levels for
 loads and stores
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
 <20250613-arm_spe_support_hitm_overhead_v1_public-v1-8-6faecf0a8775@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-8-6faecf0a8775@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_033022_035800_A3F108AD 
X-CRM114-Status: GOOD (  24.34  )
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
> For a load hit, the lowest-level cache reflects the latency of fetching
> a data. Otherwise, the highest-level cache involved in refilling
> indicates the overhead caused by a load.
> 
> Store operations remain unchanged to keep the descending order when
> iterating through cache levels.
> 
> Split into two functions: one is for setting memory levels for loads and
> another for stores.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   tools/perf/util/arm-spe.c | 45 +++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index b2296cd025382ea36820641164ec71b13a4e7a0e..8f18af7336db53b00b450eb4299feee350d0ecb9 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -45,6 +45,9 @@
>   #define arm_spe_is_cache_level(type, lvl) \
>   	((type) & ARM_SPE_CACHE_EVENT(lvl))
>   
> +#define arm_spe_is_cache_hit(type, lvl) \
> +	(((type) & ARM_SPE_CACHE_EVENT(lvl)) == ARM_SPE_##lvl##_ACCESS)
> +
>   #define arm_spe_is_cache_miss(type, lvl) \
>   	((type) & ARM_SPE_##lvl##_MISS)
>   
> @@ -828,9 +831,38 @@ static const struct data_source_handle data_source_handles[] = {
>   	DS(hisi_hip_ds_encoding_cpus, data_source_hisi_hip),
>   };
>   
> -static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
> -					union perf_mem_data_src *data_src)
> +static void arm_spe__synth_ld_memory_level(const struct arm_spe_record *record,
> +					   union perf_mem_data_src *data_src)
> +{
> +	/*
> +	 * To find a cache hit, search in ascending order from the lower level
> +	 * caches to the higher level caches. This reflects the best scenario
> +	 * for a cache hit.
> +	 */
> +	if (arm_spe_is_cache_hit(record->type, L1D)) {
> +		data_src->mem_lvl = PERF_MEM_LVL_L1 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
> +	} else if (arm_spe_is_cache_hit(record->type, LLC)) {
> +		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> +	/*
> +	 * To find a cache miss, search in descending order from the higher
> +	 * level cache to the lower level cache. This represents the worst
> +	 * scenario for a cache miss.
> +	 */
> +	} else if (arm_spe_is_cache_miss(record->type, LLC)) {
> +		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_MISS;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> +	} else if (arm_spe_is_cache_miss(record->type, L1D)) {
> +		data_src->mem_lvl = PERF_MEM_LVL_L1 | PERF_MEM_LVL_MISS;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
> +	}
> +}
> +
> +static void arm_spe__synth_st_memory_level(const struct arm_spe_record *record,
> +					   union perf_mem_data_src *data_src)
>   {
> +	/* Record the greatest level info for a store operation. */
>   	if (arm_spe_is_cache_level(record->type, LLC)) {
>   		data_src->mem_lvl = PERF_MEM_LVL_L3;
>   		data_src->mem_lvl |= arm_spe_is_cache_miss(record->type, LLC) ?
> @@ -842,6 +874,15 @@ static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
>   				     PERF_MEM_LVL_MISS : PERF_MEM_LVL_HIT;
>   		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
>   	}
> +}
> +
> +static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
> +					union perf_mem_data_src *data_src)
> +{
> +	if (data_src->mem_op == PERF_MEM_OP_LOAD)
> +		arm_spe__synth_ld_memory_level(record, data_src);
> +	if (data_src->mem_op == PERF_MEM_OP_STORE)
> +		arm_spe__synth_st_memory_level(record, data_src);
>   
>   	if (!data_src->mem_lvl) {
>   		data_src->mem_lvl = PERF_MEM_LVL_NA;
> 


