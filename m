Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148F6CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 08:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmswRsDV85LAGSgZM1TnGtsRJLjTs07m6UjoRfbX1i8=; b=SW7ZlUYe+8pNu+rb+/0PDyLCH8
	dQTRFCqtLIuR5GXSfrYrt1JpUzIy4WJbDa9MfUKqwWH/1/W/d2RH5zRXcKqx35Sw96DgokRrJ2+do
	fjG6J0WbQKJA+AbsFHTm58pJrbeOjqSmCNYFFvUEbAcafoCJfB11aajjIfnCV9QkFcFy6y13Cl2sy
	4FdXnTG0isdAnOnYF9yPuAHG3skOZOAjn1t+HoDjRXLhrRPqIVWO16KU8/39RbK3HNv1CXAX02Oy4
	+9THsm4baQtj1K+oiLGg/oO3xZQnDHBEAbN2D/c9eV7hLwxEpW8EodjsZ0KSGeOUDMprrPYnvYRad
	/miFSlcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcdp-00000001oPs-2v5e;
	Thu, 11 Sep 2025 08:26:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcdm-00000001oOO-2O7g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 08:26:51 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso2612815e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 01:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757579209; x=1758184009; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QmswRsDV85LAGSgZM1TnGtsRJLjTs07m6UjoRfbX1i8=;
        b=Ou/bYkJ47f+GIbnuReFDU6+bcv0qekQNGcxnIr1Qz7hHTqIWZ00td7w1UYXUtdU6/F
         pFV/ficZo4efvQwJLefc1ptygODXPVLkvDMI3nd1vDDIUpVO5RcgxnhpZpg0OP6FQ+LP
         rhKMoAO0OZo72CT1gy/8z2/pupiaSruIflgDRFUER+LaooNcJLxAZVmjs16bNcwmDta1
         1/7/uifqNqyEz3Kwpprb+kJFTy2VLy7ZapRyT6O36704FwCClYbZPR6k+JPnHRKbQ5fx
         hh3M67rr8fRDNx8dQ0Bs2slAGStdEL88itmcBlSqx0pPXh5JE0cJAWH01E4R/ypg6H4p
         W18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757579209; x=1758184009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QmswRsDV85LAGSgZM1TnGtsRJLjTs07m6UjoRfbX1i8=;
        b=f+VVzWv9rI7AxOgkHfWsWt0WVDs/P/Fx83hPX2D8sSw2D6Qq7/E9shmmVX44+UdXIB
         AR6cnipZXDAvV7ZrkVXmFQXi2t3441W8sDp18/jMi80X1NkIBYR9viBpx/3LC5pF1aD8
         NUZBP7BRyYOdKXvdMJrwCh+gccEAD553qb2K4GYRLiYuzcivJ3DsCyj9JM4BP/QCoaH0
         iT9pE5DhfZ3FplIt3Zj9veMdUywBlP8b3YaGsQf+AEFE3F44RFjbP1ye33mSpAzibUsM
         MDJUlOgW9QaXm5KOqKbv7T9h2wJoKy9n6VxH8EY+9oTe8PbpJXS7BbL/IPunNcmyigHw
         7Vzw==
X-Gm-Message-State: AOJu0YxfpaMdgb9Na3qKxy9LeKClQjfucijP+Ty4xHq3XdhMWptVOf7x
	boLPlH1bUfAyE9menKDfU0tSgESm4Yr5Pp34otVevqNVdgF/Az/4N/L+nN/mDZqs4PE=
X-Gm-Gg: ASbGncu0WjltrK5FUzxx1b28KXGs5y8mbCobSnOz11fq2CeJ2Et3WGLI2j63Zw2LU6F
	/uqHGeiIX5adH6smNjuHG5m2nfwIzE8O2H88Nd2I4AAsubM2l4QGIvCKcv0Y6iU5GO1BfWijsPl
	+dLK6nTHMVfDYeA9MSfQ4qZoyPlIoHPd0F54TcOpL3/tZGUl2iZ/TPAcIyVF6cB9DafWvCCaUC3
	l2iDhY7E5dIaEZDffDyPReA4i/sOXk14fDGigB6c6YtebLMZegbZPPzi1zgkS6twIaVgoBPt2Gh
	B6UMQzrw5RybaHUGmtPcHenG9LY5u14PzEmC7AhnOcM71/kEimBQyxgi1jkGGvBry6sQ5K3zcAO
	AzQk96ESHaGqdOqZ9HgyX/Y76uQ8=
X-Google-Smtp-Source: AGHT+IE7R9n09fdDc3gxKWMG8ZdQt1MVhy5CILGt7inGxYTFXeK21MqYcM9OgweBeDIjjRUpvgvRaA==
X-Received: by 2002:a05:600c:870f:b0:45b:8453:d7e with SMTP id 5b1f17b1804b1-45de072e865mr174352905e9.6.1757579208672;
        Thu, 11 Sep 2025 01:26:48 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037c3ce5sm13955765e9.16.2025.09.11.01.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 01:26:48 -0700 (PDT)
Message-ID: <fc2ee38c-b163-4b7e-9ba2-c2b93d0fc691@linaro.org>
Date: Thu, 11 Sep 2025 09:26:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] perf vendor events arm64 AmpereOne: Fix typos in
 metrics' descriptions
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>
References: <20250910195214.50814-1-ilkka@os.amperecomputing.com>
 <20250910195214.50814-3-ilkka@os.amperecomputing.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250910195214.50814-3-ilkka@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_012650_637379_0E75C7BB 
X-CRM114-Status: GOOD (  16.27  )
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



On 10/09/2025 8:52 pm, Ilkka Koskinen wrote:
> While fixing a typo in "l1d_cache_access_prefetches" in AmpereOneX,
> a few other typos were found in metrics' descriptions too. While AmpereOne
> doesn't have the metric, it did have the typos in the descriptions.
> 
> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> ---
>   .../pmu-events/arch/arm64/ampere/ampereone/metrics.json   | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereone/metrics.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereone/metrics.json
> index afcdad58ef89..324104438e78 100644
> --- a/tools/perf/pmu-events/arch/arm64/ampere/ampereone/metrics.json
> +++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereone/metrics.json
> @@ -113,7 +113,7 @@
>       {
>   	"MetricName": "load_store_spec_rate",
>   	"MetricExpr": "((LDST_SPEC / INST_SPEC) * 100)",
> -	"BriefDescription": "The rate of load or store instructions speculatively executed to overall instructions speclatively executed",
> +	"BriefDescription": "The rate of load or store instructions speculatively executed to overall instructions speculatively executed",
>           "MetricGroup": "Operation_Mix",
>           "ScaleUnit": "1percent of operations"
>       },
> @@ -132,7 +132,7 @@
>       {
>   	"MetricName": "pc_write_spec_rate",
>   	"MetricExpr": "((PC_WRITE_SPEC / INST_SPEC) * 100)",
> -	"BriefDescription": "The rate of software change of the PC speculatively executed to overall instructions speclatively executed",
> +	"BriefDescription": "The rate of software change of the PC speculatively executed to overall instructions speculatively executed",
>           "MetricGroup": "Operation_Mix",
>           "ScaleUnit": "1percent of operations"
>       },
> @@ -195,14 +195,14 @@
>       {
>   	"MetricName": "stall_frontend_cache_rate",
>   	"MetricExpr": "((STALL_FRONTEND_CACHE / CPU_CYCLES) * 100)",
> -	"BriefDescription": "Proportion of cycles stalled and no ops delivered from frontend and cache miss",
> +	"BriefDescription": "Proportion of cycles stalled and no operations delivered from frontend and cache miss",
>   	"MetricGroup": "Stall",
>           "ScaleUnit": "1percent of cycles"
>       },
>       {
>   	"MetricName": "stall_frontend_tlb_rate",
>   	"MetricExpr": "((STALL_FRONTEND_TLB / CPU_CYCLES) * 100)",
> -	"BriefDescription": "Proportion of cycles stalled and no ops delivered from frontend and TLB miss",
> +	"BriefDescription": "Proportion of cycles stalled and no operations delivered from frontend and TLB miss",
>   	"MetricGroup": "Stall",
>           "ScaleUnit": "1percent of cycles"
>       },

Reviewed-by: James Clark <james.clark@linaro.org>


