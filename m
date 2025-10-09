Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FA7CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 10:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKkXJ5cBog1kSb9Pudqeky3E5aFn1OojC4INJ8laWnQ=; b=vINTGPk4lJ+0Y8prC5HZDo7vVv
	Wmbb5Be8A/ilhAlzRPOunHAiXMkw1HzA/b/Cy4b8Bv4EoV/eYlcu6dz0oVoLLM9zDtgmOv/irWfwp
	TkyRKqqfzuYccoMLZuJepWlEzQHuTelGGb5Mf6H2kPJba3T52tsXvgqBEs78i1UkLHnjpOJW1Mha3
	hJ4nLRblQPx5Ay18pryEy38HyAzLMPQfR2Li0yZq2ai2BxYThl0vXgVYq89mZJDjAkj2A+xP1eHKl
	NCfcfB+6t66F+yXv7LX4Fbv7OkBi6bkB4mUINls8oe590BO7EHbRAufMAz94X7zFCBGFR2dZSnJxo
	2Ayjhx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nRl-00000005if8-3qYc;
	Thu, 09 Oct 2025 10:00:29 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nRj-00000005idK-2xIK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 10:00:29 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso723495f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 03:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760004026; x=1760608826; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FKkXJ5cBog1kSb9Pudqeky3E5aFn1OojC4INJ8laWnQ=;
        b=jJDHlhqCN/PAaGaHYiiXjrOMMbb0ewiKcWI0l01d7e4fmsvsoAOaNHCFPi/HytjL/R
         LxhowEh2D6alcjsgPM25quop6gvBx/ROEBYVe2qRQy3KDJCIrCd5I7pDpmBpNI474BlV
         BX0brSH747EqX8eNqSCj/p0mgiUBS1nI8ZESf+WOwl386Irrlay4+k6qttPa6tvlCr+a
         HIuzlp4pOLMyPQzhMsu53euqEhmQVPxRGONzUMYd0n5WrDWtOEsX+KWe6w9qqoZfZs5c
         ujUaACgWH5G1RMjUK3U+VqGoRkgDdEPnTdJ5JlN20pKxtw8TqmPh+dwovYZmFJDP+t8f
         wBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760004026; x=1760608826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKkXJ5cBog1kSb9Pudqeky3E5aFn1OojC4INJ8laWnQ=;
        b=C92wS/AVOkRMWNNKaVHSWapIghb1w+FzN03wEidBw6djJ/oOvudE2PgIqCvTCbSrDn
         0N5M4G18QGOb4XbkVttmtyt9AAWcbtmA4jVVzi1CrY78TsnxR3yGtMltY+Qs4LBg+gzc
         Ag0a2YOhctZXkD0lLQQDYVZ/osfMsyU6B6pduZ6nOm3rNRvmS5xEHOa3xLyEgkySCC0q
         TvMBmfcGIoNhhk3Tk4LydxcdpScHhj7AeTg/X1SpM8ljPyqrnglAsIZ4hjQZu56ZsyPp
         voiL+7onF7XI+ynxIwNDRAzz8pN6aPEQT02fa2LBnK7ohmq/HIe3HfY3AVFUDhDI8SrZ
         KPqg==
X-Forwarded-Encrypted: i=1; AJvYcCWhI9dD71Xp+GcUxiu5zUIdi5JckmAukWDMjCBCyatuOjmDbdFX42+wQQpIU3Cd6FACJ9rLJSAxRzpnaKfHAEFS@lists.infradead.org
X-Gm-Message-State: AOJu0YzGov1W4qvLP44hYqKhUHGb6d6flMc/l02+RauIQqS16fKdh3fC
	8HkmItDTKH1AW2QlTRy2ygEBbnj7rM3d6qcGg7FXHwBw7jWARfFBvH3JwaVa+YfCxHQ=
X-Gm-Gg: ASbGnctceKdhiJ+qdXmaqYJCjGol9pDbgBkDQvyf0oYAPfDXdLUwxB/QD3fjLHdB74r
	Ei2bVUos4Q4qXooIMAoIbq0fy83A0ozvHw6UmDIjOaRZPCLmMdancxWg7a5x92OdkfUNNlLC2Vc
	cytmuoeueYwgViI7IEUJptb5nzBBK9xZVcBI+9brq45SrP5FgsIggqPcJqNARY7ZhPOH7zz/P8G
	T+ozSqa1G9KhGIerbNl3UKItbmluaOd3Rp0S6UDI1AAdPMWPi9joLHhYuvZfXKjCWLKKAh2LnGl
	iogBonKw21fx7cQfjKDQwMGdioBjBhCE6/PsqtJgdviwprPOfuKlQzR7Uh57ncxZkmNOoy3XY7Q
	870kyW81AtwdRiLC1FXedF04QJ4z/QJ+Yck8RF+AqS7owUQ8GvnfVI+9GD4PfISehg1AJgL93wx
	4k2g==
X-Google-Smtp-Source: AGHT+IEsrDwu3DirvSWaVTjPOm5CTQSm/UpPiKu3gsx0vMLrCdo1k15jqFRws3Md9ryGIXqK4Pz8cQ==
X-Received: by 2002:a05:6000:1447:b0:407:d776:4434 with SMTP id ffacd0b85a97d-42582a05718mr7614451f8f.30.1760004025773;
        Thu, 09 Oct 2025 03:00:25 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9c07992sm91103655e9.5.2025.10.09.03.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 03:00:25 -0700 (PDT)
Message-ID: <9a5efa8f-f6a6-45c3-954a-bf8c516ac15c@linaro.org>
Date: Thu, 9 Oct 2025 11:00:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/25] perf/uapi: Extend data source fields
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
References: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
 <20250929-perf_support_arm_spev1-3-v1-19-1150b3c83857@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250929-perf_support_arm_spev1-3-v1-19-1150b3c83857@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_030027_785904_B1B8B8D5 
X-CRM114-Status: GOOD (  25.05  )
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
> Arm CPUs introduce several new types of memory operations, like MTE tag
> accessing, system register access for nested virtualization, memcpy &
> memset, and Guarded Control Stack (GCS).
> 
> For memory operation details, Arm SPE provides information like data
> (parallel) processing, floating-point, predicated, atomic, exclusive,
> acquire/release, gather/scatter, and conditional.
> 
> This commit introduces a field 'mem_op_ext' for extended operation type.
> The extended operation type can be combined with the existed operation
> type to express a memory type, for examples, a PERF_MEM_OP_GCS type can
> be set along with PERF_MEM_OP_LOAD to present a load operation for
> GCS register access.
> 
> Also use a field 'mem_aff' to store affiliate information.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   include/uapi/linux/perf_event.h | 28 ++++++++++++++++++++++++++--
>   1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
> index 78a362b8002776e5ce83a0d7816601638c61ecc6..51ab37d44ac31fcdc4bc919c14d5f97e560d9339 100644
> --- a/include/uapi/linux/perf_event.h
> +++ b/include/uapi/linux/perf_event.h
> @@ -1309,14 +1309,18 @@ union perf_mem_data_src {
>   			mem_snoopx  :  2, /* Snoop mode, ext */
>   			mem_blk     :  3, /* Access blocked */
>   			mem_hops    :  3, /* Hop level */
> -			mem_rsvd    : 18;
> +			mem_op_ext  :  6, /* Extended type of opcode */

Why have a 6 bit field containing 1 bit per thing when you can have 6 
named 1 bit fields? That way you don't have to do a load of bitwise 
magic to access it and you don't need separate #defines.

Also, when you set these, you never set more than one bit so they're 
exclusive. Would a 3 bit enum be better than a 6 bit bitfield in this case?

> +			mem_aff     :  8, /* Affiliate info */
> +			mem_rsvd    :  4;
>   	};
>   };
>   #elif defined(__BIG_ENDIAN_BITFIELD)
>   union perf_mem_data_src {
>   	__u64 val;
>   	struct {
> -		__u64	mem_rsvd    : 18,
> +		__u64	mem_rsvd    :  4,
> +			mem_aff     :  8, /* Affiliate info */
> +			mem_op_ext  :  6, /* Extended type of opcode */
>   			mem_hops    :  3, /* Hop level */
>   			mem_blk     :  3, /* Access blocked */
>   			mem_snoopx  :  2, /* Snoop mode, ext */
> @@ -1426,6 +1430,26 @@ union perf_mem_data_src {
>   /* 5-7 available */
>   #define PERF_MEM_HOPS_SHIFT			43
>   
> +/* Extended type of memory opcode: */
> +#define PERF_MEM_EXT_OP_MTE_TAG			0x0001 /* MTE tag */
> +#define PERF_MEM_EXT_OP_NESTED_VIRT		0x0002 /* Nested virtualization */
> +#define PERF_MEM_EXT_OP_MEMCPY			0x0004 /* Memory copy */
> +#define PERF_MEM_EXT_OP_MEMSET			0x0008 /* Memory set */
> +#define PERF_MEM_EXT_OP_SIMD			0x0010 /* SIMD */
> +#define PERF_MEM_EXT_OP_GCS			0x0020 /* Guarded Control Stack */
> +#define PERF_MEM_EXT_OP_SHIFT			46
> +
> +/* Affiliate info */

"Affiliate info" doesn't really describe what these are supposed to be, 
or why they are separate. Is it implying that they're always set in 
addition to another flag? Like "details" or "category"?

Either way, I feel that limitation might be a bit strict for the generic 
uapi, or it needs to be described in more detail. If we change this 
field to be individual bits like the other one, then maybe we can drop 
that it's a separate group and it's just a bunch of bits you can set 
however you like.

> +#define PERF_MEM_AFF_DP				0x0001 /* Data processing */
> +#define PERF_MEM_AFF_FP				0x0002 /* Floating-point */
> +#define PERF_MEM_AFF_PRED			0x0004 /* Predicated */
> +#define PERF_MEM_AFF_ATOMIC			0x0008 /* Atomic */
> +#define PERF_MEM_AFF_EXCLUSIVE			0x0010 /* Exclusive */
> +#define PERF_MEM_AFF_AR				0x0020 /* Acquire/release */
> +#define PERF_MEM_AFF_SG				0x0040 /* Gather/Scatter */
> +#define PERF_MEM_AFF_CONDITIONAL		0x0080 /* Conditional */
> +#define PERF_MEM_AFF_SHIFT			52
> +
>   #define PERF_MEM_S(a, s) \
>   	(((__u64)PERF_MEM_##a##_##s) << PERF_MEM_##a##_SHIFT)
>   
> 


