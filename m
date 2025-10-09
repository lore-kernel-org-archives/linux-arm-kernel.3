Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21602CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 09:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLLcZPWRUnnpdUZy/o5VvMg5k4e/Wy0T75t8BL7fr3o=; b=tWACxLIzSh7k1V2Jqc0VW3noxy
	6wF2GNPqf7LxV9vyPLPEnfxs4jiubBQHOUHhFRReFB5lmwrEectO8OBxjh3WcnMqMJ/3XcJmEK4Qh
	2TImb2ZqHDQU11PbdFLWHuRS3Izf1KV6T7BH/dlVa6qL7l2jThq3TjG5M99qIEsAyAMXPAlyeILlX
	55rhdOT4qp7H+WKWkSNFc6CXwXfLDXRAS0MtfhKvKyolvwIt8OmQU/ccFKBgFS1wQ4NoPuW9AaoNx
	3fFci1uUTd12hcy+BKGfUhIsY9MHH83nggd+LLDVZPlApPL7AvzkasZLp3vqngHvb4+z7icXe2WN5
	f9BIZFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6n1y-00000005fqB-349a;
	Thu, 09 Oct 2025 09:33:50 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6n1w-00000005fpm-0gTL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 09:33:49 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46e3cdc1a6aso5947135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 02:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760002426; x=1760607226; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLLcZPWRUnnpdUZy/o5VvMg5k4e/Wy0T75t8BL7fr3o=;
        b=etqzP2YN4fHRT4Qt0yr+hZE/XiBbMewb2QxS5NDiESNeBFJSN0MBRcWuDGjNAUNDWO
         bOmOGGw5S3M9xbzKQ86pBmJMLndruf13Gle65ZdkMzZ55SwMUWPGZecAzVG+0ccCYFsd
         J5i5hf7yF61pHhtCjBiEpmaJcqi2POdE0xJI+nxvsSIkaMShY4SWOCXZNVdcSrTEYNdP
         uHVZQL1DXcSy3yUNvM/LWRLAY2ZIn6c32Vb0Fsgw9zWqkFoPhsTpjCJhxk/YYuMlJf/6
         Pv9v8jVOkN+fb77qSbFOE4p1YoZpuJk4DnrBs8eeO4/CHnrFAJQcEGgIQBq2M/A1JE+I
         0tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002426; x=1760607226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GLLcZPWRUnnpdUZy/o5VvMg5k4e/Wy0T75t8BL7fr3o=;
        b=DWep3ccjLRtgzEuuRxu1LfV3EkvhQDqXto4T4QWjwdsM32Fm0L+To1kcaCPIoF5jQS
         X3Eten0sapBrxY6CcYigdWKN6Nv77nhAoBT2B66Y4OPAs0+I5UKkglbbwS01arWJrctv
         tnpIClEzB4ho6XXWnTWL1bRSqp6rGyNCkCiTeByB5itW4mWZzdv9BspxGwORhwjRuLZ8
         aUCxFvb88jmO3KvniNljUKdMPqm4gVQyrlE8xnpMto2TE+RpSZ04BTVdCP84z3pxk7xG
         Lrae+dtCRw81hv05ds9yp5W4skYwbgQaVP7+SjZDbUp2IrhXWZPSZQDF2sIQPWMYPxAI
         IZlA==
X-Forwarded-Encrypted: i=1; AJvYcCWjMJwLS9pRxSOKQ7nVKuoAomWKsU6tTzOHGg8bSCj6w0pbMNQR+LDZzDHoluHGpbSjjnVteMJGc/f0YwNkmj1r@lists.infradead.org
X-Gm-Message-State: AOJu0YxdxCxP9/85HQcmLudgQ/a/Y4PRHALDXxxxEimBS/+m8nsxuFWv
	WfWkw+Xpyf6vpyZCNnJTboV0U27T/u7L0hko8kWSu6+UPHqvbRanE0qecZIX8Gh8KHw=
X-Gm-Gg: ASbGncsZIfxrgRjEmqdqxVsiGmLRDt5DSHL0209v1I9mRSgEqvQbjgfpN3I8XzU1kz5
	m/MBEr5NvHeCs6o80NU2RrVjONUzQ7BGY4SzNz0oxKZuaeUgaZyAd+vikWf/EKly/LyTueXy6T9
	jSan3K4a8mdtJJm8UI1dYdY3jq6yqB5cbJ+NEb6tMs637R6Ift6QhJkvb2tcMU52nINli1DpR+6
	4WdcAjRY23aPpRLPJJO6ahGxZtLaNEdRMt0eNkQNZWvfm34uza4NZRZC+p/TrXSzgLPpqgc63TQ
	xiPbmXoCuYA9MpfItP0Xhe/WMHpYSVcCw3J6V+c+TtstYZoaLg1Of5AZ/YOpWeZx60XMCNRny1I
	EIFWf+fmkqYlnHD0I8AYGtQTXFfaynjGt8FupNV7vYK2l7ToqFR1vjZRX
X-Google-Smtp-Source: AGHT+IFH4mCbB8Mnz2KZz0nPpaJC0TAPdqbeGBiJXfrxVSiIKaTmawcfA8u+K9lUm/1qkWkfI7jWJw==
X-Received: by 2002:a05:600c:5486:b0:45f:29eb:2148 with SMTP id 5b1f17b1804b1-46fa9e98810mr47289835e9.7.1760002426259;
        Thu, 09 Oct 2025 02:33:46 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9d62890sm73517555e9.14.2025.10.09.02.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:33:45 -0700 (PDT)
Message-ID: <af9c5819-becd-4f51-a379-ec62dc08d8b0@linaro.org>
Date: Thu, 9 Oct 2025 10:33:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/25] perf arm_spe: Report memset and memcpy in records
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
References: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
 <20250929-perf_support_arm_spev1-3-v1-14-1150b3c83857@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250929-perf_support_arm_spev1-3-v1-14-1150b3c83857@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_023348_248482_8CF6442D 
X-CRM114-Status: GOOD (  15.71  )
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



On 29/09/2025 5:37 pm, Leo Yan wrote:
> Expose memset and memcpy related info in records.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe-decoder/arm-spe-decoder.c | 4 ++++
>   tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 4 +++-
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> index 5b214fc4ca9f67cf11700a18939f37f4a5400b84..6f0390d4089599cd6bbf1357fa4cd6ec8190a58c 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> @@ -224,6 +224,10 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
>   						decoder->record.op |= ARM_SPE_OP_PRED;
>   					if (payload & SPE_OP_PKT_SVE_SG)
>   						decoder->record.op |= ARM_SPE_OP_SG;
> +				} else if (SPE_OP_PKT_LDST_SUBCLASS_MEMCPY(payload)) {
> +					decoder->record.op |= ARM_SPE_OP_MEMCPY;
> +				} else if (SPE_OP_PKT_LDST_SUBCLASS_MEMSET(payload)) {
> +					decoder->record.op |= ARM_SPE_OP_MEMSET;
>   				}
>   
>   				break;
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> index 87d45c11ad7483c167b4d9cb2e481a001f54e5cc..565458a7a6cbd94d67803cc122154cb5cab4f308 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> @@ -43,7 +43,9 @@ enum arm_spe_op_type {
>   	ARM_SPE_OP_NV_SYSREG		= 1 << 10,
>   	ARM_SPE_OP_SIMD_FP		= 1 << 11,
>   	ARM_SPE_OP_MTE_TAG		= 1 << 12,
> -	ARM_SPE_OP_SVE			= 1 << 13,
> +	ARM_SPE_OP_MEMCPY		= 1 << 13,
> +	ARM_SPE_OP_MEMSET		= 1 << 14,
> +	ARM_SPE_OP_SVE			= 1 << 15,

Same comment as patch 11

>   
>   	/* Assisted information for memory / SIMD */
>   	ARM_SPE_OP_LD			= 1 << 20,
> 


