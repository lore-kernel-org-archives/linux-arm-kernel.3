Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75497C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3GCxL+YDPcqeTX4EEB9vPwJWOeC12f9UGGf8/tKF5A=; b=cY8o15a3E8It7/b8DP3uce71oa
	EwvJyjEpkovLa2ShqV9KiEv6jl7cEDQ7wUtiEuA76cErlkAZEirZbTcUd3k/HglNcwuptIF+dfVo2
	/bzSeDSqshmwd0luN8PreKsv8wFopCHMKwjtfSMSrLDDxZa0SyD7bQpLldlAFUoPg7GhWAL8bCsh1
	sXxkXFkFTe6EjDADMmOdcrhOXfHME4NAFpv5ivyDpRmOaOhzu327UZU6JheYH9JlJEbYxdog/Rxnm
	Q/r39EXFXyflkU3y2uCnOvU070M5ZAiBhHzyzt1MBdMZ9H8Y7PCa6TQzjTbnQQz9OhDcpqev6P+Ud
	4cxWWDqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIet-0000000Df6V-2BTl;
	Thu, 19 Jun 2025 17:02:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSG0o-0000000DGKk-1kd8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 14:13:07 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-453398e90e9so6058435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750342385; x=1750947185; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b3GCxL+YDPcqeTX4EEB9vPwJWOeC12f9UGGf8/tKF5A=;
        b=QTWAFChDa43uxjRyVZyb9AepsVZqN/yfaLzCKFEte88t5BxspYz5K6BCS4OolaSnkQ
         NQ7TYiLmmNZMUtawCwvq28jqA7nigX0wCgLDj1s8P+jguhy3WdxR+GN1A22V/6MfgVVS
         p20RFW0IStKgKesbev5kYSjOXG+Ls8iJpX0n5mfO0cOR7ExL4fooOkRjH0BmrO986zhV
         6i04cl4vKtmqQtjP0sUw2bitGnlmbSOdVgoxfPNtssNDL6quLKb6/EDSi8Qbrmge1oHH
         ZzKj1dHwnTQOIeZARrvPRxssYqqGGzol8oNb67Oqr/Q2Up7OHuTPU+PymLE+s/3hg4MU
         ok5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750342385; x=1750947185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b3GCxL+YDPcqeTX4EEB9vPwJWOeC12f9UGGf8/tKF5A=;
        b=YyneWLeJB7JEAFfw9LLUZHFJfGX06UqZ+DQMZVXA8OZFTpSRoiWPsSxNUXkc0Wu/7f
         4osxwjBxYkqBQPw4PUSQ/m2tSdcv8+oG6QvIk4SmOZu6jBjC2pTYMs4Wk7IBZZDL/TDe
         q2RiN5RkrgtB8jDxAROnEKeZZWkk3IbtGYW7MffnOGMWdIeG6CfnZTRiHQmVtuECVWqm
         UCvmiwOGGsS2oGi8naWYUKQOzo+wpdT5gCnqAEVKb7pBTdYkqjq5bnjcbfVorz+3aR7C
         eiYjZOveJP//YMWYkPqM6vZnD5fLBkcluBmudVxFLFaKCW3fBStFmDDjt3lOSi6Rc2Q9
         J1bw==
X-Forwarded-Encrypted: i=1; AJvYcCWt3LQGRYvkCysD/jiCn7hdJi2nAOgVjO1w+Q+U6+KcaAdWzL6Wkz+lsWhLcaQsenjK8rpCwsM9slbZjDUbvO7p@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6E7RIeIVSuiiFCt6xn50f3Mqe4tElslOuqYKteth9kSCoKSlI
	Nm0IkxOtxoqQxzD1YwmyF2japh0LsGoiQjeWxTDW6RIOYwyR4GWdsEJHjSrU+OhhCgI=
X-Gm-Gg: ASbGncuiUz/uJYvat3pZG1kghbVPdjSSxDStcmK2sBjxPICyGGgIInLmVu7g0GlHAFX
	1XgCAQUctsuL06Nj15U5hxYSbVMIMwMW5dsTN4KItncg068akaiI0SW6URgPV3hg3KSs1AaUAJQ
	Fs9xbVR+pA6OeUWk9VHTlbYXzmWZzwu39EZoBMEtafAbaHkUQh/UkCoXHjcIPJp6k+qCMfIu1vb
	6fc5RacpGjH5CJmE1lzedopGrKucqFJ/OfYcLDr1pJ0bgrDFuaNYtic2kEcnownGoHkSplxi2hU
	d8pAgPELRFfb4NAmFSwzmndKZ1vA+51fhjEXpXzlf/f20+Fe5kBK+EsmGaXUQDXewsAkfbL4kcP
	G3w==
X-Google-Smtp-Source: AGHT+IFPKpBZ4TxXKzFWe6qKBcJNNZnH9SxfGUNf9G9XY2OEy3rLY6Z/IKXAVI7xVSnp9YfkfkOQGg==
X-Received: by 2002:a05:600c:8012:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-4533cae684fmr215134985e9.11.1750342384744;
        Thu, 19 Jun 2025 07:13:04 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ef6edbesm27883605e9.20.2025.06.19.07.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 07:13:04 -0700 (PDT)
Message-ID: <ad01491f-7dfc-4741-87a1-237030183195@linaro.org>
Date: Thu, 19 Jun 2025 15:13:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] perf arm_spe: Directly propagate raw event
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
 <20250613-arm_spe_support_hitm_overhead_v1_public-v1-4-6faecf0a8775@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-4-6faecf0a8775@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_071306_471288_D7FECE7E 
X-CRM114-Status: GOOD (  17.48  )
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
> Two separate sets of event bits are defined: one for used in the code
> for generating samples and another for the backend decoder. Reduce
> the redundancy by using the raw event bits directly in the frontend
> code.
> 
> To avoid overflow issues, change the type of the event variable from
> enum to u64.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   tools/perf/util/arm-spe-decoder/arm-spe-decoder.c | 37 +----------------------
>   tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 28 ++++++++---------
>   2 files changed, 14 insertions(+), 51 deletions(-)
> 
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> index 688fe6d7524416420a7c18d5f8a268492ce7c3b8..96eb7cced6fd1574f5d823e4c67b9051dcf183ed 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> @@ -229,42 +229,7 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
>   			}
>   			break;
>   		case ARM_SPE_EVENTS:
> -			if (payload & BIT(EV_L1D_REFILL))
> -				decoder->record.type |= ARM_SPE_L1D_MISS;
> -
> -			if (payload & BIT(EV_L1D_ACCESS))
> -				decoder->record.type |= ARM_SPE_L1D_ACCESS;
> -
> -			if (payload & BIT(EV_TLB_WALK))
> -				decoder->record.type |= ARM_SPE_TLB_MISS;
> -
> -			if (payload & BIT(EV_TLB_ACCESS))
> -				decoder->record.type |= ARM_SPE_TLB_ACCESS;
> -
> -			if (payload & BIT(EV_LLC_MISS))
> -				decoder->record.type |= ARM_SPE_LLC_MISS;
> -
> -			if (payload & BIT(EV_LLC_ACCESS))
> -				decoder->record.type |= ARM_SPE_LLC_ACCESS;
> -
> -			if (payload & BIT(EV_REMOTE_ACCESS))
> -				decoder->record.type |= ARM_SPE_REMOTE_ACCESS;
> -
> -			if (payload & BIT(EV_MISPRED))
> -				decoder->record.type |= ARM_SPE_BRANCH_MISS;
> -
> -			if (payload & BIT(EV_NOT_TAKEN))
> -				decoder->record.type |= ARM_SPE_BRANCH_NOT_TAKEN;
> -
> -			if (payload & BIT(EV_TRANSACTIONAL))
> -				decoder->record.type |= ARM_SPE_IN_TXN;
> -
> -			if (payload & BIT(EV_PARTIAL_PREDICATE))
> -				decoder->record.type |= ARM_SPE_SVE_PARTIAL_PRED;
> -
> -			if (payload & BIT(EV_EMPTY_PREDICATE))
> -				decoder->record.type |= ARM_SPE_SVE_EMPTY_PRED;
> -
> +			decoder->record.type = payload;
>   			break;
>   		case ARM_SPE_DATA_SOURCE:
>   			decoder->record.source = payload;
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> index 881d9f29c1380b62486f0cd81498750ba06c4b50..03da55453da8fd2e7b9e2dcba3ddcf5243599e1c 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> @@ -13,20 +13,18 @@
>   
>   #include "arm-spe-pkt-decoder.h"
>   
> -enum arm_spe_sample_type {
> -	ARM_SPE_L1D_ACCESS		= 1 << 0,
> -	ARM_SPE_L1D_MISS		= 1 << 1,
> -	ARM_SPE_LLC_ACCESS		= 1 << 2,
> -	ARM_SPE_LLC_MISS		= 1 << 3,
> -	ARM_SPE_TLB_ACCESS		= 1 << 4,
> -	ARM_SPE_TLB_MISS		= 1 << 5,
> -	ARM_SPE_BRANCH_MISS		= 1 << 6,
> -	ARM_SPE_REMOTE_ACCESS		= 1 << 7,
> -	ARM_SPE_SVE_PARTIAL_PRED	= 1 << 8,
> -	ARM_SPE_SVE_EMPTY_PRED		= 1 << 9,
> -	ARM_SPE_BRANCH_NOT_TAKEN	= 1 << 10,
> -	ARM_SPE_IN_TXN			= 1 << 11,
> -};
> +#define ARM_SPE_L1D_ACCESS		BIT(EV_L1D_ACCESS)
> +#define ARM_SPE_L1D_MISS		BIT(EV_L1D_REFILL)
> +#define ARM_SPE_LLC_ACCESS		BIT(EV_LLC_ACCESS)
> +#define ARM_SPE_LLC_MISS		BIT(EV_LLC_MISS)
> +#define ARM_SPE_TLB_ACCESS		BIT(EV_TLB_ACCESS)
> +#define ARM_SPE_TLB_MISS		BIT(EV_TLB_WALK)
> +#define ARM_SPE_BRANCH_MISS		BIT(EV_MISPRED)
> +#define ARM_SPE_BRANCH_NOT_TAKEN	BIT(EV_NOT_TAKEN)
> +#define ARM_SPE_REMOTE_ACCESS		BIT(EV_REMOTE_ACCESS)
> +#define ARM_SPE_SVE_PARTIAL_PRED	BIT(EV_PARTIAL_PREDICATE)
> +#define ARM_SPE_SVE_EMPTY_PRED		BIT(EV_EMPTY_PREDICATE)
> +#define ARM_SPE_IN_TXN			BIT(EV_TRANSACTIONAL)
>   
>   enum arm_spe_op_type {
>   	/* First level operation type */
> @@ -100,7 +98,7 @@ enum arm_spe_hisi_hip_data_source {
>   };
>   
>   struct arm_spe_record {
> -	enum arm_spe_sample_type type;
> +	u64 type;
>   	int err;
>   	u32 op;
>   	u32 latency;
> 


