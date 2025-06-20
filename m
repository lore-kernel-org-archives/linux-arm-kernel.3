Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D90DC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 11:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuLrjbbKOgaIzal22l5ckDSrq4FJ56tyusFUaCNNOC8=; b=w9g3w2e9+04OBpSv4sIC1w5sns
	brlRGiHMDVghhS6xQlq+YQd7L6e5+LuVtL/XYmt+NUWQPUm1SlMKoem7FOlhFGWn+N4/y2+7XElkQ
	BEo6du3nczMRCdOQRlr9lHbwhs2MK6008fHqQvyjr7DysA5eMEoNUrvMS0BaHA/NXt54jQA+R4+wr
	qEYpgUlq0EmZ3bMEFtgWHUbGKKqxPhmx2oyt15nfVT/AXYrSF4PmeTX1rFzVgHNA5nyHffJAjeXIR
	BIw9VEOEyGwbjMYyiQlvyJ6w3bfXsl0O3g/FPLZInN8nkdjpf68jW2drG51fDxb1hONUpZEa3Rv11
	PKNBg7TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSa7e-0000000FU59-44nh;
	Fri, 20 Jun 2025 11:41:30 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZL9-0000000FP56-2fWf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 10:51:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-453643020bdso6141665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 03:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750416682; x=1751021482; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wuLrjbbKOgaIzal22l5ckDSrq4FJ56tyusFUaCNNOC8=;
        b=x1qXJtS98G2Sw1AQdMlKyngs12cHeofqRp8GV9v33KDPJVn8Fut4DN0Se3SXOF2775
         R3Z+mWNRw06CZif8iq8VeUbcEblP3mFKeNjDJK84Ft+leQrlrOBn0hHRDcvC7/61gXGS
         QcR0w9nRwSf3voS5oO38o6BGXt57kjcZXNgj0AW2ahpbrxHYsmXF3N6qKhoKl5bUXQRe
         2nGwvZQ4C8DVIcoFAFcpEczV+lyphnhrsVvcCBG1PkFH+an+y6qLgSn5EVmtNvI7bAvI
         Z7ub5oSpc6zeaYek5KD2rLPS8HlNJ2t5YJyDcKGwliM4j04wBv/6jc9ivrd1miTZgIyV
         yyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750416682; x=1751021482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wuLrjbbKOgaIzal22l5ckDSrq4FJ56tyusFUaCNNOC8=;
        b=KDTYB77sLM9+01O0U5EBeekbdWoOlupwe+rZnqJLUfR8A5EBLCNOCiQ+WfL6xsCbl4
         fDrkrtXAk2VyktLR+AlO05UueilA40g6+nkWJKIzcBId3n2LkCJbxYwAyCyXV8yLNKJj
         OoQKiotWlsayCOlEXpZqmXXKZW25ZS1zWZc6+KLbDIs6hnPQJRIMNMw46wJpfm1+iMM2
         AOLgrrZTkT6MGwWH+0vxFbxMOUKlXOaaesJIaKxSqajtTkrpYleEU9+O4i7XU+MSJVkj
         Gmg84srlSoRhkkIw4im3Rc2aF0/2B0pC/McytGvlmYjBKCMvvTlFLuTO+X/LBqUd2qN8
         9pOw==
X-Forwarded-Encrypted: i=1; AJvYcCXhBHyC61hN3FcEjpQQC2ulRMQRmJ1LizDPFnoaThP6xQ36hsyHDLaEbEOKcLbD1oO90P42T5yx0gRswV6Td71o@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7Y4SbWGGOEGHoSW8+/2wABJV3E869RsrvkXIw6DI+nXRII/Ay
	rBtkMNU/h2BOCpIj3tWw2An65mfLiun8ezOUEuMMw+AUVmElyqGUcBPIa3bHa0rNCzg=
X-Gm-Gg: ASbGnctUhJWo6/vHKaH0vc3/N+xLfceFGe3zZ0SIjtmkldPDBDYrqPhCbq3ZT9ze6ro
	qeU0yg5G4x8/rHs9/t/CVQXOZJzGOhe1qdf6eoKgOXNEbu550wnCwfrEwWfAwBaHVluM1h38aEq
	1SaH0gsDjj+O8/xTmfbpTEsNQYGMMljElRi5vi1Jxb4eDbN0+r6Xbcuq1IybPk0YYMRlVNP9nYR
	r2giS/kK1Q/QyMh5OnSB9LDGKbiWD3sWYxqc0YQGkuwA1KWgGvRiBoBNGTSG6uik/hjjs21F1Tc
	y1z/ePTaT6TVxRp6jjz4c+3bL6Ahc+fpVRA15sTk1VXVuKLYoUVrLUP9eAwW86V0ZYLNHiCb8/k
	1TA==
X-Google-Smtp-Source: AGHT+IG5fVMEopdEziHI+RGidETpM3IE7UHI2UOJ/hAkd2zj3k25GLKI+2A0L4NRM5cb36+ALaJzpQ==
X-Received: by 2002:a05:600c:1e8a:b0:442:f956:53f9 with SMTP id 5b1f17b1804b1-453659dde93mr22342415e9.18.1750416682104;
        Fri, 20 Jun 2025 03:51:22 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c02fsm1736693f8f.50.2025.06.20.03.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 03:51:21 -0700 (PDT)
Message-ID: <dc919865-317c-49c8-a6b4-8ce2a6cf9c0a@linaro.org>
Date: Fri, 20 Jun 2025 11:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] perf arm_spe: Set HITM flag
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
 <20250613-arm_spe_support_hitm_overhead_v1_public-v1-11-6faecf0a8775@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-11-6faecf0a8775@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_035123_689755_813871EE 
X-CRM114-Status: GOOD (  25.23  )
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
> Since FEAT_SPEv1p4, Arm SPE provides extra two events "Cache data
> modified" and "Data snooped".
> 
> Set the snoop mode as:
> 
> - If both the "Cache data modified" event and the "Data snooped" event
>    are set, which indicates a load operation that snooped from a outside
>    cache and hit a modified copy, set the HITM flag to inspect false
>    sharing.
> - If the snooped event bit is not set, and the snooped event has been
>    supported by the hardware, set as NONE mode (no snoop operation).
> - If the snooped event bit is not set, and the event is not supported or
>    absent the events info in the meta data, set as NA mode (not
>    available).
> 
> Don't set any mode for only "Cache data modified" event, as it hits a
> local modified copy.
> 

Reviewed-by: James Clark <james.clark@linaro.org>

> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe-decoder/arm-spe-decoder.h |  2 ++
>   tools/perf/util/arm-spe.c                         | 26 +++++++++++++++++++++--
>   2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> index 90c76928c7bf1b35cec538abdb0e88d6083fe81b..a2b48b0c87712f232587023eeaa66a9b83aed382 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> @@ -28,6 +28,8 @@
>   #define ARM_SPE_L2D_ACCESS		BIT(EV_L2D_ACCESS)
>   #define ARM_SPE_L2D_MISS		BIT(EV_L2D_MISS)
>   #define ARM_SPE_RECENTLY_FETCH		BIT(EV_RECENTLY_FETCHED)
> +#define ARM_SPE_DATA_SNOOPED		BIT(EV_DATA_SNOOPED)
> +#define ARM_SPE_HITM			BIT(EV_CACHE_DATA_MODIFIED)
>   
>   enum arm_spe_op_type {
>   	/* First level operation type */
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 8e93b0d151a98714d0c5e5f6ceec386a2aa63ad0..8a889f727f9cd5351b4ca027935112eddd16ea6c 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -903,9 +903,12 @@ static void arm_spe__synth_st_memory_level(const struct arm_spe_record *record,
>   	}
>   }
>   
> -static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
> +static void arm_spe__synth_memory_level(struct arm_spe_queue *speq,
> +					const struct arm_spe_record *record,
>   					union perf_mem_data_src *data_src)
>   {
> +	struct arm_spe *spe = speq->spe;
> +
>   	if (data_src->mem_op == PERF_MEM_OP_LOAD)
>   		arm_spe__synth_ld_memory_level(record, data_src);
>   	if (data_src->mem_op == PERF_MEM_OP_STORE)
> @@ -916,6 +919,25 @@ static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
>   		data_src->mem_lvl_num = PERF_MEM_LVLNUM_NA;
>   	}
>   
> +	if (record->type & ARM_SPE_DATA_SNOOPED) {
> +		if (record->type & ARM_SPE_HITM)
> +			data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
> +		else
> +			data_src->mem_snoop = PERF_MEM_SNOOP_HIT;
> +	} else {
> +		u64 *metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
> +
> +		/*
> +		 * Set NA ("Not available") mode if no meta data or the
> +		 * SNOOPED event is not supported.
> +		 */
> +		if (!metadata ||
> +		    !(metadata[ARM_SPE_CAP_EVENTS] & ARM_SPE_DATA_SNOOPED))
> +			data_src->mem_snoop = PERF_MEM_SNOOP_NA;
> +		else
> +			data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +	}
> +
>   	if (record->type & ARM_SPE_REMOTE_ACCESS)
>   		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
>   }
> @@ -971,7 +993,7 @@ static u64 arm_spe__synth_data_source(struct arm_spe_queue *speq,
>   		return 0;
>   
>   	if (!arm_spe__synth_ds(speq, record, &data_src))
> -		arm_spe__synth_memory_level(record, &data_src);
> +		arm_spe__synth_memory_level(speq, record, &data_src);
>   
>   	if (record->type & (ARM_SPE_TLB_ACCESS | ARM_SPE_TLB_MISS)) {
>   		data_src.mem_dtlb = PERF_MEM_TLB_WK;
> 


