Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2279ED59D62
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzRmGTG4hV3KDyAaywOrTlQOkI9HCeXuDyrMklg3lMk=; b=g949skdHV6KQ1FbZavXRaK/BBm
	6CERt2kbAcrbpSMiYpcQi/x0jM1tdCBJPqPrO22pFDWhLiLyk2BXqgjtOvvSPE6CeSl7XoO/2CkhM
	Opj22zTkQVggMnV403psIBW9QutOO82L0te2QnzwdwIctU247IDcaK6LHYlbx0HjiH7N/M2HGXrxH
	/CH01VhkJCH+mL+yCEnuKlQfcSHOTjPNCk6cbHmKSfV5qzuYEzH0CSfpsaF03HslhRBf1Nevm0pb9
	XBKPOoVJ9h+mMZ7EpxWSgkKKFdqUnR+T0Yopt8Nswicc5QgjgpWXt1G7TB6EZA/qKGjK/nTOElQAT
	jYxXw5Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU4uC-00000000f2T-1tbv;
	Fri, 12 Dec 2025 15:18:04 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU4u9-00000000f20-1Lys
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:18:02 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b713c7096f9so227469966b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765552679; x=1766157479; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gzRmGTG4hV3KDyAaywOrTlQOkI9HCeXuDyrMklg3lMk=;
        b=qwpjjjUVSEzyjv83Zpl00qJ+bFI31z5RGawOifXVzO6+MqxnURt1/YniwTtl8MM/Uc
         ENOiCweIQqgN+60Rv7Og3RwVFA1uDX7RNEWIc+5AtBHWwuQNtO5Ja7fBgq4Oq+ucXzXI
         r+TJe7xRlnNjvjQniuunH0So0qxCXeKzWezoiOCcwuy04cK37IqzSG8eNtTrzniB5X+z
         WxBjRTAkokuxzTz7m8EjLPKRRjBmy+cHC57obYte53s4LBHF25fOWF7+HzUlG088LY0X
         NkBiu9D+sEHTxUe7lQZESKAkLqK+DHihPVtt4quCNARKdILnXlssoS2zTNzL2eQ02zQq
         2j8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765552679; x=1766157479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gzRmGTG4hV3KDyAaywOrTlQOkI9HCeXuDyrMklg3lMk=;
        b=TgVGdZDcEa9DRRCpVb/DLtpwNtk1P3ZtWRlJotk4If2thullLCPrORQBJ7b1IgBxhG
         VtCsDOIIgwUsKcDea7/r+NK3YlhhYJH+vYT1I2rpOlt2Hf2HegEGtzoWDECTfYTbMyyo
         MphUIADORy2mDSLhoWX/ychrSZduRTXyRPFMsLm2sYXtpIHCKrLjmnjUIL9lyd7g4YJu
         gBZ0rCLR4kphG64yVDlRGq+2tCqyzJtQpztGHQWkSmzv8wMm/XTMiemx2PZE6p0oIij2
         B8HNeuX/ihPmY8PL5FvRytyQuXm5dubpAWLLUqmbJzJbrKWwYKhl0yd8/5v06WfBft6D
         8EBA==
X-Gm-Message-State: AOJu0YyM56J/1hR8aoSSh3WzqTrC04NtYNJ8X4CAsU63bDUE9zBlUItv
	xMibSmMMdz0elzR8nsJ507QTVSLnXI6r09sPVvg8N+6Pxnq2J/JO5/3QrEhE0ApQiUM=
X-Gm-Gg: AY/fxX4ln1/lyp3tkivIKHxZGbv63iwwS91X5ftMxezHZ+YyTqC9dAzvxnNbYSlWkGw
	VhWNw3ar3OyE1OYMVnzkn6k9G0e1vNctOLytUYaTnKJrFZhQ9fZ3UGfaWVTEYRuG0WUZ1M2Rt6Q
	r5rZXqtkvhCMWkQ2vTQYlhy58KW1Sv30w//cezgjSu0gUMr+r7PwNjzUxzdGsG04ytYwGZ9P5Hc
	yDCfRz/K49Yos9psDgqEzFexrvdGh0rljXtM8mKqEAF+Y7akvxTbr65epJFEf3Xr82sX2hZBg8v
	cVnfQ/RY5bLVu4KN5lNv/aWO7h7u3JGgviXEheZvGs7Tqgy28CXXScDIXOMqI01hXJkf3mLSjQd
	W4jeP6Ex5eSiSkWAgn+dSgNfla/e1+8VgKsRA5MYGYqhrZPsgP3/7QnmO5qQBz83KZtMTQQOoRc
	WvjFoLG8LAX6V+7rXQJzNC
X-Google-Smtp-Source: AGHT+IFyH9NQdi8zctX5JPNwdCDSFYgXLMEEf2zE5iVW5H4jeALSU6wAPw7+q+bUPn5o1gI0VfjuwQ==
X-Received: by 2002:a17:906:c155:b0:b6d:6d66:e8e9 with SMTP id a640c23a62f3a-b7d23aa4010mr238075366b.61.1765552679280;
        Fri, 12 Dec 2025 07:17:59 -0800 (PST)
Received: from [192.168.0.108] ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa51754dsm604311066b.42.2025.12.12.07.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 07:17:58 -0800 (PST)
Message-ID: <6a642215-2834-4c27-b716-477d5444ad9c@linaro.org>
Date: Fri, 12 Dec 2025 17:17:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf mem: Simplify Arm SPE event config
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Mike Leach <mike.leach@linaro.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>
References: <20251212-perf_c2c_update_event-v1-0-29a26c7a949b@arm.com>
 <20251212-perf_c2c_update_event-v1-1-29a26c7a949b@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251212-perf_c2c_update_event-v1-1-29a26c7a949b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_071801_472988_755051F0 
X-CRM114-Status: GOOD (  14.50  )
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



On 12/12/2025 14:44, Leo Yan wrote:
> Since configuration fields default to zero, the zero assignments are
> redundant, remove them.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/arch/arm64/util/mem-events.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/arch/arm64/util/mem-events.c b/tools/perf/arch/arm64/util/mem-events.c
> index 9f8da7937255cc9b14c3c58a1119b40bd0c76f6b..eaf00e0609c6c1b7d939a02fe3794471d1ed119b 100644
> --- a/tools/perf/arch/arm64/util/mem-events.c
> +++ b/tools/perf/arch/arm64/util/mem-events.c
> @@ -6,7 +6,7 @@
>   #define E(t, n, s, l, a) { .tag = t, .name = n, .event_name = s, .ldlat = l, .aux_event = a }
>   
>   struct perf_mem_event perf_mem_events_arm[PERF_MEM_EVENTS__MAX] = {
> -	E("spe-load",	"%s/ts_enable=1,pa_enable=1,load_filter=1,store_filter=0,min_latency=%u/",	NULL,	true,	0),
> -	E("spe-store",	"%s/ts_enable=1,pa_enable=1,load_filter=0,store_filter=1/",			NULL,	false,	0),
> +	E("spe-load",	"%s/ts_enable=1,pa_enable=1,load_filter=1,min_latency=%u/",	NULL,	true,	0),
> +	E("spe-store",	"%s/ts_enable=1,pa_enable=1,store_filter=1/",			NULL,	false,	0),
>   	E("spe-ldst",	"%s/ts_enable=1,pa_enable=1,load_filter=1,store_filter=1,min_latency=%u/",	NULL,	true,	0),
>   };
> 

Reviewed-by: James Clark <james.clark@linaro.org>



