Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA0AC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ffg0iXEA2G0pgrfFnPLVJ/IivgD9mYBR14NIBm41Bw=; b=rbosIr7kvLjt8abkBTjzJjHoCe
	P/S4aNjNRh5yYlLXGW78Mg7QCTBcMJ1gF9IUNHBMnv4uqn+W2kPhJvQr27kaGl+8maLJTGYNZZedn
	gxwnJzfNRF7yfNU00Pv0CYG/78rbQvFjKs+4HcFbmi5sZ3Nptw0GB7UxqqaENODmty+NehROae05L
	BNJCnZxqCpaXYZqStTzgpWV9yPsfm+sbxDqBaidmQeTIpxq6nImzXKl3c1XlXJXcjis6stV0rXXGg
	hWyL7Th/NmOiYZtvQ4x8dINzYTsK2R+Eh2I79PZQ36CDIGiVL/sn5NFSUcZhnKvO9m2IZXTXa1qK1
	sErn3clg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZgw-0000000FRIp-0zWQ;
	Fri, 20 Jun 2025 11:13:54 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYxb-0000000FKft-3tjZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 10:27:05 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so1351670f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 03:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750415222; x=1751020022; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ffg0iXEA2G0pgrfFnPLVJ/IivgD9mYBR14NIBm41Bw=;
        b=u4nW9nL6M1XaZQoVq7llrueU9/m6GcoDAp2gQiUxvtikFosI4r+/KC8uOhvolByWyE
         byb0zXPrdYQ4zZYzfhoDYHyDg+feRtF4rg4qtKyilQFkT8NVjB+r1Wt+R9WQ0OyNeHh/
         2Y20OywulG181VRtUEtBM5bXwRgJuWm3LPupNGzm8nO+SaJY/FP+G59ts9/V9nfSPl0f
         BAjICp0Y2vnudxhjVosIC3XOp3LRsKBzNlv9r6/xbxwp4mg4ZPpWP8oLlff6ei8e4Brv
         2rmooeDMQm2Cd2FWBuR78FokZ5ZNozpNeihmVx9B6/62z485z9SmmQGZiQSFncA6JwAP
         xQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415222; x=1751020022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ffg0iXEA2G0pgrfFnPLVJ/IivgD9mYBR14NIBm41Bw=;
        b=kbN76BlnZhgclPRyt1xyx7pE1rmkhVaupcVWuSdWjgLVzZlAy3X3yBiou52kKURucg
         nOMX5msIx9WbPy17pL/rwg28YauiisNPqWeFusuXxsIk56wqyQFucb4ogydiudKpvbkp
         mbA/aJksqjUS6y091aK88aybcQz34wNiO2FZE+Gei7f+Nb5bvHNlNvw2K3wevxYGa8rV
         vEJPa6LK3aQBs+WqNSZ6jI4OYK8h0VM/PRXpM7wrHpOgzSoC95sZe0OJ+eCRcH/P1p9N
         /PWWX4h/hESDCenAIgfkET/0tkzOBtkVk58tFRzMPvP8rWhIiRSpdPev9E7aJ7ClZMjm
         P1fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCuBW2b0viwimdgGxIMOdyHYHvh4+5SlceYOXk5GPto6KOGB8i08K3TUrSo0ErNrk64wYnNGai/W1WUWvBHPK1@lists.infradead.org
X-Gm-Message-State: AOJu0YyU0iOewG3KP76xdgterzT4kjxqiNryKYsvlRiEWxtoejRCbjQp
	SUVyQmV7ly6LDWidD8QNtKFltVPLcuk2wPbFua2p4aMI/8jPMIwfI7NTqdYhpqyaWk4=
X-Gm-Gg: ASbGncs6okZiA4nxU2P516hEVf0L5jY7defMRi0ILVCkDToY/hTi1Q06JIW09AnVFwq
	HUqHl1n7h/rcNPs6OBA66KivzCCT5hWnLqIrr3gobxt6EhJyliOP3p6cfPVewfOKZJXK5c4vgF+
	zBe+Ds3BOgLGShAyZuCo4wxCYmxxwc8JpjnWt+n2OH5fXFQH51plamCcnCfPqxmTbccohtwpl5N
	aL2dDwlMYzCSuBQ79h9qnmU/X2uRJ2Km+hYRNEuo5jTYyJkouzno0xvP2Uk/nrcNfRoJkODIyDy
	PIIwdnpVtonLpjtIQc1zfnA/xPXPgD/mm8QvmiVgm3qVzgqiLJvf/EuHQNuTwyr85GgS04xWtYt
	hkg==
X-Google-Smtp-Source: AGHT+IHE8BSpoZxO7KuVCVXUe3qb6bi6sj1JXY7eEQFY8+4LrfXFVw++FIBjk+kGTF27zg9cp2n8Jg==
X-Received: by 2002:a05:6000:4906:b0:3a4:f661:c3e0 with SMTP id ffacd0b85a97d-3a6d12e6a3emr1737494f8f.45.1750415222121;
        Fri, 20 Jun 2025 03:27:02 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45364705748sm20361355e9.28.2025.06.20.03.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 03:27:01 -0700 (PDT)
Message-ID: <4d96e0a9-23af-4fdc-b5a2-945b258c45cf@linaro.org>
Date: Fri, 20 Jun 2025 11:27:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] perf arm_spe: Refine memory level filling
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
 <20250613-arm_spe_support_hitm_overhead_v1_public-v1-7-6faecf0a8775@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-7-6faecf0a8775@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_032703_993187_622345AB 
X-CRM114-Status: GOOD (  18.61  )
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
> This commit introduces macros for detecting cache level and cache miss.
> 
> Populates the 'mem_lvl_num' field which is a later added attribute for
> representing memory level. Set NA ("not available") to memory levels if
> memory hierarchy info is absent.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   tools/perf/util/arm-spe.c | 32 +++++++++++++++++++++-----------
>   1 file changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 55b8391990467c8b7818bb63de3545d94d021bb7..b2296cd025382ea36820641164ec71b13a4e7a0e 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -39,6 +39,15 @@
>   
>   #define is_ldst_op(op)		(!!((op) & ARM_SPE_OP_LDST))
>   
> +#define ARM_SPE_CACHE_EVENT(lvl) \
> +	(ARM_SPE_##lvl##_ACCESS | ARM_SPE_##lvl##_MISS)
> +
> +#define arm_spe_is_cache_level(type, lvl) \
> +	((type) & ARM_SPE_CACHE_EVENT(lvl))
> +
> +#define arm_spe_is_cache_miss(type, lvl) \
> +	((type) & ARM_SPE_##lvl##_MISS)
> +
>   struct arm_spe {
>   	struct auxtrace			auxtrace;
>   	struct auxtrace_queues		queues;
> @@ -822,20 +831,21 @@ static const struct data_source_handle data_source_handles[] = {
>   static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
>   					union perf_mem_data_src *data_src)
>   {
> -	if (record->type & (ARM_SPE_LLC_ACCESS | ARM_SPE_LLC_MISS)) {
> +	if (arm_spe_is_cache_level(record->type, LLC)) {
>   		data_src->mem_lvl = PERF_MEM_LVL_L3;
> -
> -		if (record->type & ARM_SPE_LLC_MISS)
> -			data_src->mem_lvl |= PERF_MEM_LVL_MISS;
> -		else
> -			data_src->mem_lvl |= PERF_MEM_LVL_HIT;
> -	} else if (record->type & (ARM_SPE_L1D_ACCESS | ARM_SPE_L1D_MISS)) {
> +		data_src->mem_lvl |= arm_spe_is_cache_miss(record->type, LLC) ?
> +				     PERF_MEM_LVL_MISS : PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> +	} else if (arm_spe_is_cache_level(record->type, L1D)) {
>   		data_src->mem_lvl = PERF_MEM_LVL_L1;
> +		data_src->mem_lvl |= arm_spe_is_cache_miss(record->type, L1D) ?
> +				     PERF_MEM_LVL_MISS : PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
> +	}
>   
> -		if (record->type & ARM_SPE_L1D_MISS)
> -			data_src->mem_lvl |= PERF_MEM_LVL_MISS;
> -		else
> -			data_src->mem_lvl |= PERF_MEM_LVL_HIT;
> +	if (!data_src->mem_lvl) {
> +		data_src->mem_lvl = PERF_MEM_LVL_NA;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_NA;
>   	}
>   
>   	if (record->type & ARM_SPE_REMOTE_ACCESS)
> 


