Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA842C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 11:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKBMUgxG1IH2cC43C7CQlxG9+juo4HBXbKwgJd/KfcY=; b=FndGx0F1gi/Fa32ifvJO+gHvJv
	tkmy6/J4dDlBvVC2nx73I4TLCFtpQAcQ/3H5MCNY1Ws8vBC0aWu+6fU9JWNmt7JYCbJtHqrLYv9Dg
	UDhjapRMiqKnSYJ6lSuHYJd2WjaBCMJ/2ISgDeXw388a0bFyQrBqtdWXOjDlZgndLMg12O7ZtnMX/
	1Ktm8ZaKmAGrJeFgPvy4f86fiRrUlaavXjDvZb1v5lKms2lgZ5mMx50UNTB0TavnmO/W+oG4rwxZA
	kLZewXFMB/ZpP6KFjSamf02BgFJw5fRD6pJ0QFqNTV+h3R8GGgXU7WuovSemX/nvwhpFwXtWx/EEu
	xa+x0V6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZwL-0000000FT0v-30Fu;
	Fri, 20 Jun 2025 11:29:49 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZFe-0000000FNTI-43LH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 10:45:44 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so1246734f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 03:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750416341; x=1751021141; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SKBMUgxG1IH2cC43C7CQlxG9+juo4HBXbKwgJd/KfcY=;
        b=qg7WQjZU19250mN32gn30yTXAytYvHGvnvfePRJdyiVqk+KDItF6rscc4vdMKWbB0m
         R3OsaUsNGdSFmDn/+B3gc6DuRJPqCdi6SF1/wrzM7RUYzT7CeRnhz6YMP4+++RQI/tlM
         FRUFq7hSu3CgTO2tIbz83u/Zsl5xF7DRHNwMTYKYMOlSXad/DrQEvnZDjEqgoxs38tIY
         QGJGamNfXJojfcHhmdR14Ht0N32M5xu73dqdNeZi0yZ2o52lW3jhga1ugOWp8l62AiCj
         EwvAvCVcnglSMlNg9gN+UwtecniqbwirFk2KRgxcr0akLp4wZBp8f/lpoKFAGfdosi+B
         uO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750416341; x=1751021141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SKBMUgxG1IH2cC43C7CQlxG9+juo4HBXbKwgJd/KfcY=;
        b=HTLWe58t1QVoAW4X9e4gw5DY3N/EVS4iG+hyUpiVBGsFQfScgXH5s69+rJnd0/X6Av
         XMqlJcpavPOomjtPZI4U0wfsdL5E8yuzI+u9vb1NumcZcU0guNthLndul/0ey2IzS93s
         JbGYCWOj2bDyTPOrw1Ex8tsFXpnzCSq1UPxRmDe+vu618tI1UjJKV/w11UpCDJxskMlb
         QujpKxJ3lo3EPLfOabiBL1gt1HKccmrlA5/c9EFXTsfBsEx2VfiV3e3fiR35RvoHnd7f
         dkANGT5Hwg3gVl06TeonqpWVGa1YMGkzsP73pnh3AoWzQsXMUgWkCPwl9mej3M6yuKU4
         qztw==
X-Forwarded-Encrypted: i=1; AJvYcCVUNl20P0YFJrmh0SQSnf2OCTYQunUeZz531mLaHiC310x/qDXUop8PA0I3tpoLDMDeVWrEJpOAgkGmmWkELQz+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7Ps6R8Lji1YcgICaAdGKEAAdcT41xS34f+Eaf3iGovoOFZ0bm
	Q8Eb/8Jt76su09U1xRUnbZeFQQGW/Xj73kgN+WZxM4YPkVjWAkihPb0ikY8RV5UiSeg=
X-Gm-Gg: ASbGncuhGW0yDywSArKB2yE38ePCnmPqCDr8w7TIE9XYcwk65RK1sMLyK26dHjb862r
	cyU0PRhsgGLenPYIGhl69Igi3rInzGvtYplFiDVlnX/7UVkWmt18oSWeGlDepYHZ483zHR3OUXv
	1Fc1pN8+vxD7Yf7q9yuCuwCuSK+oqorQuCo/a68MqkM25aAXUxlOhP10d9+UtnPrfLrCTIyNCGP
	E6o/SHiAjACrHvBmTe5OMHf9W8oElQ4ivcf+Eg+MG3Dmeqj2HJeSyZ1sf0bQxcnrhz53wvE//4i
	lUmgs1JNuJo2/8YGR3HOqK5ukpNzs5pw2Q8MuAw6Jm4lu4oY5/IZdyeWQW+t0hKQCMo=
X-Google-Smtp-Source: AGHT+IGY+SB4ZBG7c1vRa8LWTNDxjzu/yUDXbu3C2egw8C1VI0GTMDtixMHZ8nT+Uycz7iEtBensWg==
X-Received: by 2002:a05:6000:288d:b0:3a5:8905:2dd9 with SMTP id ffacd0b85a97d-3a6d1331316mr1932398f8f.51.1750416341422;
        Fri, 20 Jun 2025 03:45:41 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d118a1f2sm1660123f8f.83.2025.06.20.03.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 03:45:41 -0700 (PDT)
Message-ID: <f5f70b05-dd8b-4e46-a6ee-e2710a9cf1ee@linaro.org>
Date: Fri, 20 Jun 2025 11:45:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] perf arm_spe: Refactor
 arm_spe__get_metadata_by_cpu()
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
 <20250613-arm_spe_support_hitm_overhead_v1_public-v1-10-6faecf0a8775@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-10-6faecf0a8775@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_034543_014894_9407C160 
X-CRM114-Status: GOOD (  21.32  )
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
> Handle "CPU=-1" (per-thread mode) in the arm_spe__get_metadata_by_cpu()
> function. As a result, the function is more general and will be invoked
> by a sequential change.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe.c | 30 ++++++++++++++----------------
>   1 file changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 2ab38d21d52f73617451a6a79f9d5ae931a34f49..8e93b0d151a98714d0c5e5f6ceec386a2aa63ad0 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -324,6 +324,19 @@ static u64 *arm_spe__get_metadata_by_cpu(struct arm_spe *spe, u64 cpu)
>   	if (!spe->metadata)
>   		return NULL;
>   
> +	/* CPU ID is -1 for per-thread mode */
> +	if (cpu < 0) {
> +		/*
> +		 * On the heterogeneous system, due to CPU ID is -1,
> +		 * cannot confirm the meta data.
> +		 */
> +		if (!spe->is_homogeneous)
> +			return NULL;
> +
> +		/* In homogeneous system, simply use CPU0's metadata */
> +		return spe->metadata[0];
> +	}
> +
>   	for (i = 0; i < spe->metadata_nr_cpu; i++)
>   		if (spe->metadata[i][ARM_SPE_CPU] == cpu)
>   			return spe->metadata[i];
> @@ -924,22 +937,7 @@ static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
>   		cpuid = perf_env__cpuid(spe->session->evlist->env);
>   		midr = strtol(cpuid, NULL, 16);
>   	} else {
> -		/* CPU ID is -1 for per-thread mode */
> -		if (speq->cpu < 0) {
> -			/*
> -			 * On the heterogeneous system, due to CPU ID is -1,
> -			 * cannot confirm the data source packet is supported.
> -			 */
> -			if (!spe->is_homogeneous)
> -				return false;
> -
> -			/* In homogeneous system, simply use CPU0's metadata */
> -			if (spe->metadata)
> -				metadata = spe->metadata[0];
> -		} else {
> -			metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
> -		}
> -
> +		metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
>   		if (!metadata)
>   			return false;
>   
> 

Reviewed-by: James Clark <james.clark@linaro.org>


