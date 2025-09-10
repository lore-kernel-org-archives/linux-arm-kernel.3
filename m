Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2104CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZBBmutpjOIPvfZmjaAjseI7obq3YWyXTkmlz+MKTww=; b=UpxDr2uERoE2BxBKHPP8L1S1EW
	dJgY9S7YfAPVrIuxMh18x1BWAye8gvGfXeBfoNRkikw0Fn2WW9TZhBXQSYdpiDF5EJWy2n479dY7u
	nCicjLCZTMDAfgbbzf1KM4AE+2CWFPZ4Ph1/mhxmCKaAxD2WADvQt7v3/rV7WXWcwbPeAR3sr7iHE
	atzHuYea8sCJcqCYdC9MQKTXM4RkG71nUhVabNuGZe/JDPJSSQFZUG8tojANih130udPscJzqeNEd
	iZM5dMu+nSzOXZJ4rlFWa1Ek7nlwUKiH/dozBtci4yNX3SWgOS0CKazXj2SrSP9rX6Q3GolFjbwFf
	dQ5onEEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGo0-0000000D835-1xl5;
	Wed, 10 Sep 2025 09:07:56 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGny-0000000D81l-1al1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 09:07:55 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45de60d39b7so21746315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 02:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757495272; x=1758100072; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XZBBmutpjOIPvfZmjaAjseI7obq3YWyXTkmlz+MKTww=;
        b=ElO5XFYLQMHX4gOnCVWKtGanp4t50OagJGAqbDr5Kz5XR0KvvFzqGd71oHXzLDmLUY
         mgpftht6w+MnUo1QyriLL+7BOnuKsy1719oVLk9MV8TyHmxdArtDnS/EHUi3t5t3+G6G
         20KU1ZVbRk3AGoZC0FR5hn22uwtz0G1Ll2usodlAUHpWDmFrFsvxVJ6iz9BzCmhYyww3
         79qZ4D1Y4ps9dBffwB8OBaiTZsbUQcsz+jd/fdKsmZlKLimlmeYgsP0h4ecdiOmlGQHw
         Bxl7JZrGR/Pd+VrmHS5Jk1l24lBoBp9FKoVOD7+GMHrOKWTIZ1E+e2/pTRwMMaZG2VDQ
         /mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757495272; x=1758100072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XZBBmutpjOIPvfZmjaAjseI7obq3YWyXTkmlz+MKTww=;
        b=hGG708rh9SFfmzxY7+fxAtbEZ2NseUH+/3Yst0xzvB9mLhmeCjwHktqjXVprjSXcvN
         btipjDIHCV1NRSFqyD58Y6xHqorMlL00+gjuXAEq5kbHyofPdQv6k0GnZob9KIqYX7gf
         N6VBdCQoiA3IbJUZAEhuz5etBFXpTe/5Wcnsw/lwdbyR7lMOhTEZxd/V4qpOGd4txHad
         tNjDNVv6QnHF24RyJS5P0B9ClGltQWvQYOK5eq0ZgScTOMc10AVWDYgtQXktSzObS9zG
         gn+szza+BoMsWuq7Wo05nIp4QOhQT7tW8BV7fM9v4RZvcMT6vRSfKbAUCJgoKl07gIEZ
         TmDw==
X-Gm-Message-State: AOJu0Ywp7xcUPJQhBSZVl4hFQYgYrxNaPZfc2cMRd7ghDmuT1SvCDi4h
	WZkvw1dUbNtk8acMiuSNMBUcF4M6PrUEFSC3seC9m1LxIcX/O6iST+J9dm5v5t01H53KfeeI3R4
	msAGg1KQ=
X-Gm-Gg: ASbGncvUhIFCRHdbiokQ2yEuze8wnBGkkpVno4MPmA1CdAszMUZiBEkEUT6KhUpd7cI
	J2kIxCU/33EyS6zuS5GxWf4sivxuP3Zz84Ko6ve8cSkg7TXb0v8wRmxby3zluEj7VG4sLsMPUQF
	F7gRoXKOEZV2kUiPP1Buq9fgUCKvqCE9QIRLb2bvTBAAINXXHQ2GQmvSfUWRwEU5vde1qUMFraa
	UJN8AEHWtiU89vuiSWh9lwnynetuHqo3fHqI/L+9DeBDColgBWjcULhGzIhamrOtbNRbu+K/mq4
	ht/h34R+J1nyTbowy4o9fzvAQxVszweB4AJEm+ZJp9sNgER6AcUj3RN++QmtVqQ6EqH3pOtS77j
	wk28QA1lJtPvJDy7zB2gUoDrJdCBfiFGq5L1zyw==
X-Google-Smtp-Source: AGHT+IEG71ndzP2J+YPiEtMfuV9I+O4GNXaDUWAmn6I8ie847qJ1Bh8O6y5TTlHM2Sn0Ba4AliZgNw==
X-Received: by 2002:a05:600c:a05:b0:45d:d5c6:97b4 with SMTP id 5b1f17b1804b1-45ded2fb475mr47976605e9.9.1757495272369;
        Wed, 10 Sep 2025 02:07:52 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm6457092f8f.19.2025.09.10.02.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 02:07:51 -0700 (PDT)
Message-ID: <6a24df18-832c-41b8-8226-5dc5b3c9995d@linaro.org>
Date: Wed, 10 Sep 2025 10:07:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf vendor events arm64 AmpereOneX: Fix typo - should be
 l1d_cache_access_prefetches
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
References: <20250909210120.9823-1-ilkka@os.amperecomputing.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250909210120.9823-1-ilkka@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_020754_458626_4BDFF796 
X-CRM114-Status: GOOD (  17.00  )
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



On 09/09/2025 10:01 pm, Ilkka Koskinen wrote:
> Add missing 'h' to l1d_cache_access_prefetces
> 
> Also fix a couple of typos and use consistent term in brief descriptions
> 
> Fixes: 16438b652b46 ("perf vendor events arm64 AmpereOneX: Add core PMU events and metrics")
> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> ---
>   .../arch/arm64/ampere/ampereonex/metrics.json          | 10 +++++-----

The same typos are in arch/arm64/ampere/ampereone/metrics.json as well.

Reviewed-by: James Clark <james.clark@linaro.org>

>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> index 5228f94a793f..6817cac149e0 100644
> --- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> +++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> @@ -113,7 +113,7 @@
>       {
>           "MetricName": "load_store_spec_rate",
>           "MetricExpr": "LDST_SPEC / INST_SPEC",
> -        "BriefDescription": "The rate of load or store instructions speculatively executed to overall instructions speclatively executed",
> +        "BriefDescription": "The rate of load or store instructions speculatively executed to overall instructions speculatively executed",
>           "MetricGroup": "Operation_Mix",
>           "ScaleUnit": "100percent of operations"
>       },
> @@ -132,7 +132,7 @@
>       {
>           "MetricName": "pc_write_spec_rate",
>           "MetricExpr": "PC_WRITE_SPEC / INST_SPEC",
> -        "BriefDescription": "The rate of software change of the PC speculatively executed to overall instructions speclatively executed",
> +        "BriefDescription": "The rate of software change of the PC speculatively executed to overall instructions speculatively executed",
>           "MetricGroup": "Operation_Mix",
>           "ScaleUnit": "100percent of operations"
>       },
> @@ -195,14 +195,14 @@
>       {
>           "MetricName": "stall_frontend_cache_rate",
>           "MetricExpr": "STALL_FRONTEND_CACHE / CPU_CYCLES",
> -        "BriefDescription": "Proportion of cycles stalled and no ops delivered from frontend and cache miss",
> +        "BriefDescription": "Proportion of cycles stalled and no operations delivered from frontend and cache miss",
>           "MetricGroup": "Stall",
>           "ScaleUnit": "100percent of cycles"
>       },
>       {
>           "MetricName": "stall_frontend_tlb_rate",
>           "MetricExpr": "STALL_FRONTEND_TLB / CPU_CYCLES",
> -        "BriefDescription": "Proportion of cycles stalled and no ops delivered from frontend and TLB miss",
> +        "BriefDescription": "Proportion of cycles stalled and no operations delivered from frontend and TLB miss",
>           "MetricGroup": "Stall",
>           "ScaleUnit": "100percent of cycles"
>       },
> @@ -391,7 +391,7 @@
>           "ScaleUnit": "100percent of cache acceses"
>       },
>       {
> -        "MetricName": "l1d_cache_access_prefetces",
> +        "MetricName": "l1d_cache_access_prefetches",
>           "MetricExpr": "L1D_CACHE_PRFM / L1D_CACHE",
>           "BriefDescription": "L1D cache access - prefetch",
>           "MetricGroup": "Cache",


