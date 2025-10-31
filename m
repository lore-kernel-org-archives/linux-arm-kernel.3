Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E72CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXkLRXL/09XSTQrXWbf80a0LR0KorpKiDD0bgtjB+w0=; b=brc/DFiaHBzpWFZHZHuNWIiYyW
	J2hoYsDNhCZyTB9f2y/2WmGVJ2YMpsgOHJZBTm66/jQjQ6TzZbkwlUTYXdv48KWZMxqwgLqSR450s
	hQdYVmy4CfiIscFquU8VE8cU6GAcEUO64qTTACCgQj0PIiJw3YaC0epwgDKgeMEM1kZMSK5OTVfvx
	x59ifBd4M39K/qAzICAEEqQITJRIK3ajuYRGKx0F/URx+yh3PSK+9Tjz2154P9SI3/h5ir73ZNdGh
	gN5jNztTn9F3OTgpSTCqPpNbOokR+MeNsl0YBr/ai1mxt+fBlFkARHuR32mUDbHTP27/nUPsY3VpB
	4fhPZogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElwo-00000005qoF-3uIc;
	Fri, 31 Oct 2025 10:01:30 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElwl-00000005qly-21YW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:01:28 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4283be7df63so1023720f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761904885; x=1762509685; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXkLRXL/09XSTQrXWbf80a0LR0KorpKiDD0bgtjB+w0=;
        b=EDsvGIr+8Pntyld0Hfnmem23N+TnEBM0Xir3H0X8o4GAlnfYwPc2duxhTabFBGqeLV
         3amlbFLrPWd63ZSgc9f45FAX/OvYYcHnnbv8v/Asygb59d590qYDGTEhnx9ELXudXk0Z
         Fg8Bx1adQA3a1tjtAk6FJhHUaqmGZAgNJ5xodzqRFPU/kgSwUxaqMgAc1OCbEYdmDZS5
         ngjM5XwnBUK1Cl89ex/G9zUk38/OjmjF7E8JEnd/Sg0zDmQwZLgtLC0nV5ANPwUcbSQy
         7QT+d1+Ghm5DyuqMy6VFclvk9MtO6Y4g2AZSCejbws2ZBEIlGc12Mx8xVV8ZfBvBycRa
         mm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761904885; x=1762509685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WXkLRXL/09XSTQrXWbf80a0LR0KorpKiDD0bgtjB+w0=;
        b=alG0A9Rx6VE8gtqbRP48apF2MDe+seELMEI0mGhFq1WCUSR/5M8ZJAxFs1X7Mx2Pxk
         LyWBlkwNT8O0iuqYhuNKRuOZ+kutDQjtTkoBuBxXIfCcS9UMsx9Eajg7u3pmrTpQCqX7
         IAMyEZ93LyqDvCL3Ms/q/BHZI4jCZ8Zb6TJXPQ9KNJc/hlxFZr/RxEr2vQvBtbSu0Ft+
         e4DBidEnHr4NeKK3m8F2HYseaTVvo2ibNrGDiWTKIJE9QpWdeYTfs01i8y50a0/sQjrT
         zL4S9yt8mq+UJZ+xqj9CvGb9pamPaHRpHkm7OSTgwSNEu6nTqA5ORe0QjfmtpNaIMAMO
         Mwyw==
X-Gm-Message-State: AOJu0Yy+XGGpuECyG6ztggYfpmyQQABe6UlzrTdAcRnbS2FLXXAoBtHS
	1sE58duQMjShW32XzqXyBTC8t84uOuD2PztDDB//zmNICTPx0I96vqXTK0kSLQAh+Ck=
X-Gm-Gg: ASbGncuUlMGIVysO4iCQ9FqiHR5ETKTz2EVdRbV8hVc9WDubjuo/jT+adxMWJqh39Ll
	xMEZdViUi/Xu9fu59PpOP9M+VI7QdvDhfrNwI9E18eAhei1o9Jlb97RN+bbA7UunveuxgM1c81A
	0L3q6mjaXMPmcqckfVUlkHHqy8BtYl9PbTDwJ18eUSyeBdz0hRWqJXeYU6qhyUObHyGFUMiRmHt
	T0FkhKRoyDiXqoXW0lQm4szvWFy1O+TEx13gFH43n305k07CJdFEqkB+05A3V2XMMEREDpEaOKC
	+qcCPCgjfXUCJRXRO/heGe8BvRY37q07AqRdIUZ+W5cVFAKRvUyPUZPqBNvra4geCTOwItkJUcr
	NAwRwf+gx75DaQdB7VRZPKEi9RaVkMdrUO5inmS30oIQz0yk+YBeeqMZrRjOLcO1KAnmF+1+oM7
	cxm37fzA==
X-Google-Smtp-Source: AGHT+IHILJYq01/jPqFwMyYGkOIuHAOSQvgFVwRuLZ95ODjEyBBLX/lDvwSOY0yg1h/riowuUMPwIg==
X-Received: by 2002:a05:6000:471c:b0:429:c4ce:eeaa with SMTP id ffacd0b85a97d-429c4ceefd6mr167558f8f.60.1761904885065;
        Fri, 31 Oct 2025 03:01:25 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13e1d8bsm2600821f8f.25.2025.10.31.03.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 03:01:24 -0700 (PDT)
Message-ID: <7fbec952-dfbc-4d6d-a6af-819ec9c81dd5@linaro.org>
Date: Fri, 31 Oct 2025 10:01:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/perf: Fix spelling typo in tools/perf
To: Chu Guangqing <chuguangqing@inspur.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, john.g.garry@oracle.com, will@kernel.org,
 mike.leach@linaro.org, leo.yan@linux.dev, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com
References: <20251031025810.1939-1-chuguangqing@inspur.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251031025810.1939-1-chuguangqing@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_030127_550048_2F53FAF6 
X-CRM114-Status: GOOD (  12.81  )
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



On 31/10/2025 2:58 am, Chu Guangqing wrote:
> The json file incorrectly used "acceses" instead of "accesses".
> 
> Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>

Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   .../arch/arm64/ampere/ampereonex/metrics.json    | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> index 6817cac149e0..a29aadc9b2e3 100644
> --- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> +++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> @@ -388,55 +388,55 @@
>           "MetricExpr": "L1D_CACHE_RW / L1D_CACHE",
>           "BriefDescription": "L1D cache access - demand",
>           "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>       },
>       {
>           "MetricName": "l1d_cache_access_prefetches",
>           "MetricExpr": "L1D_CACHE_PRFM / L1D_CACHE",
>           "BriefDescription": "L1D cache access - prefetch",
>           "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>       },
>       {
>           "MetricName": "l1d_cache_demand_misses",
>           "MetricExpr": "L1D_CACHE_REFILL_RW / L1D_CACHE",
>           "BriefDescription": "L1D cache demand misses",
>           "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>       },
>       {
>           "MetricName": "l1d_cache_demand_misses_read",
>           "MetricExpr": "L1D_CACHE_REFILL_RD / L1D_CACHE",
>           "BriefDescription": "L1D cache demand misses - read",
>           "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>       },
>       {
>           "MetricName": "l1d_cache_demand_misses_write",
>           "MetricExpr": "L1D_CACHE_REFILL_WR / L1D_CACHE",
>           "BriefDescription": "L1D cache demand misses - write",
>           "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>       },
>       {
>           "MetricName": "l1d_cache_prefetch_misses",
>           "MetricExpr": "L1D_CACHE_REFILL_PRFM / L1D_CACHE",
>           "BriefDescription": "L1D cache prefetch misses",
>           "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>       },
>       {
>           "MetricName": "ase_scalar_mix",
>           "MetricExpr": "ASE_SCALAR_SPEC / OP_SPEC",
>           "BriefDescription": "Proportion of advanced SIMD data processing operations (excluding DP_SPEC/LD_SPEC) scalar operations",
>           "MetricGroup": "Instructions",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>       },
>       {
>           "MetricName": "ase_vector_mix",
>           "MetricExpr": "ASE_VECTOR_SPEC / OP_SPEC",
>           "BriefDescription": "Proportion of advanced SIMD data processing operations (excluding DP_SPEC/LD_SPEC) vector operations",
>           "MetricGroup": "Instructions",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>       }
>   ]


