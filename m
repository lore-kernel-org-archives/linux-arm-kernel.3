Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D30C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 10:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsFKh9UbkZa4mPXu6xn2EHAIINbDdqAyML0CYYvfpfc=; b=h/LULD486gTx/SdMaIRTdBGMYy
	R5gKEaUByBqqOHpvhfh3FzsKXfa01beEVZNRuCgm6ZDmZEfCT7hYHgyHwu32VNgkMO+52krqX/NQC
	rS0C9zc8Wwv3yUB2vHcJn4LJkBa/VdTdE+EmoYdPVDEenVb/02x8TcfGB0EjP/IW4E0JAnqY2hxcG
	94fyUna1DvUqxB6FxOAI9xiDxspVB4c9xn8CVF4ODuXoQvJCVTO2UEHiVYxKnyOa+KHEIzltaDyw0
	7AnHRyTMZ+eu0fd4fc6TeAG+SwoLXv2d/wxoZnWVVvUPZrfj51UkJ2djefvgtMlPPS+WOhXdraWBN
	ez5s+9NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbHi-000000071Bp-13qA;
	Thu, 27 Feb 2025 10:38:30 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbG9-0000000710O-3gxg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 10:36:55 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-abbac134a19so110117066b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 02:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740652612; x=1741257412; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jsFKh9UbkZa4mPXu6xn2EHAIINbDdqAyML0CYYvfpfc=;
        b=DGsdyoSahnZmZ7jhqbN2CKVfcXt/YBKRaUZVgFhHpdalipVa8cr31NIzcqmMHraxch
         zAT50RrHIjeX2guFm7rz/MVr7iSMdXEpq3yQ1fQyyTq8zUfFAkkZnLe7gSDNrzoLzYCz
         z82o5kt8F8KZnPvWKTkdSM1gWjwMBy28WdwpYcg4y/BuFL2GaZtoeyO4u2K7OXXqeVTg
         KAmA7VL9svPkzVWPf+fP5bGAV9oeWCnIjgjg3DZTU06vJtv4IMtDFNUC/3hGkHFgvrbK
         ywTQVV/lfgEGMGVMWEue27I5ocGZho9HGltGdAk2BMPVpdOvN8kM0uhJ2tM1U+0S90hT
         nh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740652612; x=1741257412;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsFKh9UbkZa4mPXu6xn2EHAIINbDdqAyML0CYYvfpfc=;
        b=Ah+CvSS/0XCU3KybCczHaB62NCXv8c81gQbr4XD+O/vG4rE+4Fli/36qv5jIalUQgg
         JW122sTB1cASY9fIUT1lScf4G97YM/JEmgeV7T8KKeWLMPi8ByF5e3OdZqLIHIIy3REl
         yacWd8ZFP4t8qU80n4mBBQOxsoL8obHPhCvw214Rz4yMxmQc7/kkCPG1t+f9c+zfEHH/
         fxt0/9s+fd5DL+sIM6L8GK8ym01XbEKzTixOY3OrjTCT/LHbZ14n8ZZ7pj6xySGAeRxz
         5by2nnN0pHbHdb2eG1RQR7p5LO9tJsA+uB8dzOUyICWQHGiIMrJijTD2+YTyJ9ZB0wpb
         7BXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/Ly1cxSYRXy7Lsa9BKcpOOx6PjuACoKtgtS3KWTAb3MKf1ntr8Iz5zqUUgfBmNnhcomjjJr47tXx1nd7QB/VL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+mKPeyFotASGlkfGGRLO67s4qUrhi6uIkFEk6UOWjZAJL41cg
	oSz5E5vm8XICZt8ItVjEzDpSZsQIoL0hDqx7ybFx/chHxUq2r7SJgA+gw0m9eJ8=
X-Gm-Gg: ASbGnctAst3yRsuL/zFQGrDoHRELPaQ0yZRbEkFEYduwDrGTn7sWSbcvmdm5BeUcbAU
	w7J5eFBCsQHIappQu4WnvxTe4GMqVifybg7Qrk1omKwPsqh+RWJXeqc4cwqr/2SBZpoX4S2YS4b
	C69n3gXnwFmQvBWMj+BXRrxIsvPbC6IY0pk2QdqNsF8xm+3x0z7oOsBkHsxWT1HK2sDcNw52eNL
	3oiUFNUVrLTgFeBsH8T79jZgOI2eqv49HTJPhCgxodA/wsWAFuaIlPHz5i2FwUDIKt8U3WOkJmZ
	/is3Wx+r0IMyoP1QO8gRdkGKmkdJk5LCJA==
X-Google-Smtp-Source: AGHT+IEsSfiZIs400KhlsV64WxdFbebZ9xtk3b00PNEdGcSXHdqx0XdTR9/OXY1rEFnEmYXIsXcKzQ==
X-Received: by 2002:a17:906:6a20:b0:ab7:e451:4834 with SMTP id a640c23a62f3a-abed0d117bamr1339096666b.19.1740652612039;
        Thu, 27 Feb 2025 02:36:52 -0800 (PST)
Received: from [192.168.1.247] ([145.224.66.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c6ed7ccsm101865366b.96.2025.02.27.02.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 02:36:51 -0800 (PST)
Message-ID: <7c3e1316-a4a6-4a9e-b179-57e9c8aca697@linaro.org>
Date: Thu, 27 Feb 2025 10:36:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf arm-spe: Report error if set frequency
To: Leo Yan <leo.yan@arm.com>
References: <20250227085544.2154136-1-leo.yan@arm.com>
Content-Language: en-US
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250227085544.2154136-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_023653_922359_9F4AC510 
X-CRM114-Status: GOOD (  24.68  )
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



On 27/02/2025 8:55 am, Leo Yan wrote:
> When users set the parameter '-F' to specify frequency for Arm SPE, the
> tool reports error:
> 
>    perf record -F 1000 -e arm_spe_0// -- sleep 1
>    Error:
>    Invalid event (arm_spe_0//) in per-thread mode, enable system wide with '-a'.
> 
> The output logs are confused and it does not give the correct reminding.
> Arm SPE does not support frequency setting given it adopts a statistical
> based approach.
> 
> Alternatively, Arm SPE supports setting period.  This commit adds a
> for frequency setting.  It reports error and reminds users to set period
> instead.
> 
> After:
> 
>    perf record -F 1000 -e arm_spe_0// -- sleep 1
>    Arm SPE: Frequency is not supported. Set period with -c option or PMU parameter (-e arm_spe_0/period=NUM/).
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
> 
> Changes from v1:
> - Sugguested users for '-c' option or PMU parameter 'period' in the log
>    (Namhyung)
> 
>   tools/perf/arch/arm64/util/arm-spe.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
> index 4301181b8e45..4f2833b62ff5 100644
> --- a/tools/perf/arch/arm64/util/arm-spe.c
> +++ b/tools/perf/arch/arm64/util/arm-spe.c
> @@ -40,6 +40,19 @@ struct arm_spe_recording {
>   	bool			*wrapped;
>   };
>   
> +/* Iterate config list to detect if the "freq" parameter is set */
> +static bool arm_spe_is_set_freq(struct evsel *evsel)
> +{
> +	struct evsel_config_term *term;
> +
> +	list_for_each_entry(term, &evsel->config_terms, list) {
> +		if (term->type == EVSEL__CONFIG_TERM_FREQ)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>   /*
>    * arm_spe_find_cpus() returns a new cpu map, and the caller should invoke
>    * perf_cpu_map__put() to release the map after use.
> @@ -389,6 +402,14 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
>   				return -EINVAL;
>   			}
>   			opts->full_auxtrace = true;
> +
> +			if (opts->user_freq != UINT_MAX ||
> +			    arm_spe_is_set_freq(evsel)) {
> +				pr_err("Arm SPE: Frequency is not supported. "
> +				       "Set period with -c option or PMU parameter (-e %s/period=NUM/).\n",
> +				       evsel->pmu->name);
> +				return -EINVAL;
> +			}
>   		}
>   	}
>   

Reviewed-by: James Clark <james.clark@linaro.org>


