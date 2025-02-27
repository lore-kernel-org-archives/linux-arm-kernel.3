Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7D4C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 10:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNCv9VF2wwi5tDdk8D6Rf4AjfaKu6G8KXM9TyLJSQ84=; b=CQZdgLFKM9YgebeePJ9KLaH2u2
	OXZb7SibHW0eFmVjw2UyysqRWRAx1gW+JIxeuVvizPuEmUbRD0vpHzcbNMHukXWfBPZWmdsRakN0K
	qtqqKhnrx3HusxszMh9qRae+3boWM2bQMhiMBwXhh576Bd9Jz3PINxWI0FHsrLkW5gkygDSz+54fy
	uOB88GQ9I7Ugw4vYRu7FmVX/gDZPczJf0n1S5nYe0GQf2b0t8iGqffdDQLjj9RCe9g/gzMxtNyHrL
	KSXD9DOtU1bvlgLYrG+QPTjdNu/tCqQ1KxpMs8iyTBdmSs0OozIIQfpWaxekQd5+nO/LF0yaQHayu
	TuFsstsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbYD-000000073Y1-2YbH;
	Thu, 27 Feb 2025 10:55:33 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbWf-000000073L8-02HG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 10:53:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43690d4605dso4965675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 02:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740653635; x=1741258435; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SNCv9VF2wwi5tDdk8D6Rf4AjfaKu6G8KXM9TyLJSQ84=;
        b=Vq/q1PsuYapp1fIpkxXrLAa1oCpI8n40j3Coa3IcLyuwevx9OHkttAw9EEiEeAnH+1
         C9T0j5HLzFQ4Lm4Z655eek+c9A2qkxmCQ1Qf3290RGdLTD2rhPD798QHp8qwntLpLr7N
         2U6vD1iMlUGTAl9rDyfpPY2DlgPHdOGk8Gp/Fl9psv+NwbUMYsKi3cvk0k38oqqYGC82
         VWBwNY0qDVyTsxDCikzad3wwu6itA+tFXoDHGmuLk8E1FA5Mabz0dc8H97RjE2ODBzfe
         FByDwv8R70AafzPR2yN9jeVq7vkBehNvvXH6KTOQ6Hu0tS8I8WG+++fKUGKXZHFEqKdO
         4SDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740653635; x=1741258435;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SNCv9VF2wwi5tDdk8D6Rf4AjfaKu6G8KXM9TyLJSQ84=;
        b=Z+hGRyGFpUpZJDO1fNH4t4amJYlh49pegsuZJV7UX4k5v+xq89sfyvGL/s5/3uhOi0
         Mhg2TU3AL8pND3zZrS1fkresqSIvXl4dZj6D7a2iJKL6SaA5MVquTIuaej4eH4mMIISR
         4qcxzti73P8dNVr4bfLrR9tvghgPMM0jjW1vdyOC/+kMpgU4J6vRg5/D44mVYwgEtOTI
         CZAm+0gFjCU2/JX7M/gF3SfkKd7PX2Se0odSMhRrTLHEHdDCfKnktWipP2yyLhIjFFlz
         71CbKQechh+qZLBfvmahqtgsyaaW90JqYsqh7CwAwRs/q6mrNS5nCqoezAcV3P1Oa+cV
         xPVA==
X-Forwarded-Encrypted: i=1; AJvYcCX8XrHd3z578iSHsngDe29+6HLxfMLTPfcgPdh6+nQ2Di+MJ6b8o9fR+pD1oK5XXmrA2ENJQkwGyK3v8qL2Z7dp@lists.infradead.org
X-Gm-Message-State: AOJu0YzNDW2H2uk1IL8/UzV5AIjc2fxX6Rpk9D2yv0c62Bix+9c2tYmv
	cu6bAJsUZKGH7rLkyfRT4+/AmqS7/zmZGzaARBZ6dMOhmnGEXCqmA9JThkEJ4vE=
X-Gm-Gg: ASbGncvcptUNdpQmq/g8EEwgROYAxf0ZFOxOa638cmUZCR8ThIfuPoAuzxcsN3JyaH8
	Nxea7mP1hc9GrgW2ZhF9vcNP11LXtXPn4ehx319bdyxsYmhrs+UOQ5c1dzbXunLO9Fo0k/H31An
	kF83XSlvtEa/47d4wgAIDY1a+so90vyYHu721hfawNEtxM1WGL852lUD/JoqEOif3nsDVmKuXG7
	bDFj+Bz86ckOOivDErXI2iYUJKPD1Rb8iTDIByWX6W91vQ5ATvR5IFwPbrXwEKH1SOhlAacMHnh
	qKWR6lcEB8P/hs/vZvjPD60Vsu8KPG9piQ==
X-Google-Smtp-Source: AGHT+IE8DorXVbtCD9exKwh1tn38cojsz1Dpv/Llvugy6PqREcKYEgD8gQ8+TNIqagrt+TUmMtmKxQ==
X-Received: by 2002:a05:600c:198e:b0:439:9e53:49d8 with SMTP id 5b1f17b1804b1-43ab0f979cdmr103876275e9.30.1740653635355;
        Thu, 27 Feb 2025 02:53:55 -0800 (PST)
Received: from [192.168.1.247] ([145.224.66.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab2ee361dsm51580975e9.0.2025.02.27.02.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 02:53:54 -0800 (PST)
Message-ID: <96b323eb-15b2-4b60-8522-83bf2f57694b@linaro.org>
Date: Thu, 27 Feb 2025 10:53:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Remove some PMU events for FUJITSU-MONAKA
To: Yoshihiro Furudera <fj5100bi@fujitsu.com>
References: <20250227054045.1340090-1-fj5100bi@fujitsu.com>
Content-Language: en-US
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akio Kakuno <fj3333bs@aa.jp.fujitsu.com>
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250227054045.1340090-1-fj5100bi@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_025357_055687_B7995030 
X-CRM114-Status: GOOD (  19.36  )
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



On 27/02/2025 5:40 am, Yoshihiro Furudera wrote:
> The following events are not counted properly:
> 
> 0x0037 LL_CACHE_MISS_RD
> 0x400B L3D_CACHE_LMISS_RD

These two are discoverable so will still appear in 
/sys/bus/event_source/devices/armv8_pmuv3_0/events/ if the hardware says 
they exist. It might be better to change the json strings of these two 
to warn that they don't work if that's the case, otherwise Perf will 
still list them and you'll be worse off.

> 0x0396 L2D_CACHE_REFILL_L3D_MISS
> 0x039A L2D_CACHE_REFILL_L3D_MISS_PRF
> 0x039B L2D_CACHE_REFILL_L3D_MISS_HWPRF
> 0x039C L2D_CACHE_REFILL_L3D_HIT
> 0x03A0 L2D_CACHE_REFILL_L3D_HIT_PRF
> 0x03A1 L2D_CACHE_REFILL_L3D_HIT_HWPRF
> 
> Specifically, these events are always counted as misses,
> regardless of whether the L3 prefetch is a hit or a miss.
> So I remove these events in l3_cache.json, ll_cache.json
> 
> Signed-off-by: Yoshihiro Furudera <fj5100bi@fujitsu.com>
> ---
>   .../arch/arm64/fujitsu/monaka/l3_cache.json   | 34 -------------------
>   .../arch/arm64/fujitsu/monaka/ll_cache.json   |  4 ---
>   2 files changed, 38 deletions(-)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/l3_cache.json b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/l3_cache.json
> index 3f3e0d22ac68..917b9b5bf8bb 100644
> --- a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/l3_cache.json
> +++ b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/l3_cache.json
> @@ -37,11 +37,6 @@
>           "EventName": "L2D_CACHE_REFILL_L3D_CACHE_HWPRF",
>           "BriefDescription": "This event counts L2D_CACHE_REFILL_L3D_CACHE caused by hardware prefetch access."
>       },
> -    {
> -        "EventCode": "0x0396",
> -        "EventName": "L2D_CACHE_REFILL_L3D_MISS",
> -        "BriefDescription": "This event counts operations that cause a miss of the L3 cache."
> -    },
>       {
>           "EventCode": "0x0397",
>           "EventName": "L2D_CACHE_REFILL_L3D_MISS_DM",
> @@ -57,21 +52,6 @@
>           "EventName": "L2D_CACHE_REFILL_L3D_MISS_DM_WR",
>           "BriefDescription": "This event counts L2D_CACHE_REFILL_L3D_MISS caused by demand write access."
>       },
> -    {
> -        "EventCode": "0x039A",
> -        "EventName": "L2D_CACHE_REFILL_L3D_MISS_PRF",
> -        "BriefDescription": "This event counts L2D_CACHE_REFILL_L3D_MISS caused by prefetch access."
> -    },
> -    {
> -        "EventCode": "0x039B",
> -        "EventName": "L2D_CACHE_REFILL_L3D_MISS_HWPRF",
> -        "BriefDescription": "This event counts L2D_CACHE_REFILL_L3D_MISS caused by hardware prefetch access."
> -    },
> -    {
> -        "EventCode": "0x039C",
> -        "EventName": "L2D_CACHE_REFILL_L3D_HIT",
> -        "BriefDescription": "This event counts operations that cause a hit of the L3 cache."
> -    },
>       {
>           "EventCode": "0x039D",
>           "EventName": "L2D_CACHE_REFILL_L3D_HIT_DM",
> @@ -87,16 +67,6 @@
>           "EventName": "L2D_CACHE_REFILL_L3D_HIT_DM_WR",
>           "BriefDescription": "This event counts L2D_CACHE_REFILL_L3D_HIT caused by demand write access."
>       },
> -    {
> -        "EventCode": "0x03A0",
> -        "EventName": "L2D_CACHE_REFILL_L3D_HIT_PRF",
> -        "BriefDescription": "This event counts L2D_CACHE_REFILL_L3D_HIT caused by prefetch access."
> -    },
> -    {
> -        "EventCode": "0x03A1",
> -        "EventName": "L2D_CACHE_REFILL_L3D_HIT_HWPRF",
> -        "BriefDescription": "This event counts L2D_CACHE_REFILL_L3D_HIT caused by hardware prefetch access."
> -    },
>       {
>           "EventCode": "0x03A2",
>           "EventName": "L2D_CACHE_REFILL_L3D_MISS_PFTGT_HIT",
> @@ -151,9 +121,5 @@
>           "EventCode": "0x03AC",
>           "EventName": "L2D_CACHE_REFILL_L3D_MISS_FR_L3",
>           "BriefDescription": "This event counts the number of L3 cache misses where the requests access L3 cache in the different socket from the requests."
> -    },
> -    {
> -        "ArchStdEvent": "L3D_CACHE_LMISS_RD",
> -        "BriefDescription": "This event counts access counted by L3D_CACHE that is not completed by the L3D cache, and  a Memory-read operation, as defined by the L2D_CACHE_REFILL_L3D_MISS events."
>       }
>   ]
> diff --git a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/ll_cache.json b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/ll_cache.json
> index a441b84729ab..c2325855eda3 100644
> --- a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/ll_cache.json
> +++ b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/ll_cache.json
> @@ -2,9 +2,5 @@
>       {
>           "ArchStdEvent": "LL_CACHE_RD",
>           "BriefDescription": "This event counts access counted by L3D_CACHE that is a Memory-read operation, as defined by the L2D_CACHE_REFILL_L3D_CACHE events."
> -    },
> -    {
> -        "ArchStdEvent": "LL_CACHE_MISS_RD",
> -        "BriefDescription": "This event counts access counted by L3D_CACHE that is not completed by the L3D cache, and a Memory-read operation, as defined by the L2D_CACHE_REFILL_L3D_MISS events."
>       }
>   ]


