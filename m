Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA2DC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 10:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUHKQpxTCLmGn74czB9zdVmL8GuztD+1m1BAWrqdpyw=; b=zbF+AVoU3dfS7TKwV6RXalczI0
	wmU57iCAzmyj586k2BxMcvPOQLjP/o1TT/h6mKuVAmxijx6xvIMwyStCaqlyooUZ+eh27PzYnFCcQ
	40luG0LjMrt7GGyNM2FBqylsyr7yInTDmofC/8zOxh5vhf6+L5Ora7k03MxRydRg0bh3XRyCGMRdK
	PU5D7dFNZWkG973FgYyc9fPmwYBEk4w9wBIRjDg6bYNJIZ38VkYmIwYTyoEDjjci//KoF1XsXsWfr
	sXFrmlw8X00w7YHfMqG/VRbP/DbQct5kFIS8qhI1ml7amJWXiCMU1AnyOBfv0Lbb4NT7oN3TQjUTQ
	LlI5F0vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIxy-000000084DF-1QeQ;
	Wed, 12 Mar 2025 10:05:34 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIv7-000000083u7-2EmZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 10:02:38 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso3140860f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 03:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741773756; x=1742378556; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pUHKQpxTCLmGn74czB9zdVmL8GuztD+1m1BAWrqdpyw=;
        b=cqbWi4l5iN2DrSx6F5FxI0ObNNj4z9l6D5AC2GETLrx72nX6XqKfH16Shp5ij2Lpvj
         mOJ68uw6UKZw6FC8UvnNX//+YTcl4ijEmOA5ny8gussPQyX1HcVpqF0jibuWxlPHYseC
         Y1h9SqmctNWR2omWMlHUiU1mOuBNRRLmOKjbwmMFo7gX6NJNLX41Nc/Iy+FQtwi/BQFq
         zwuRDeXCFXytFzKS07ycBJW71IbtSWADiAFzciCe/bKVVPWsJ8jFxsY/Iub2ZdvqueLt
         Y1TUXhd7s+NnFDFm1WV4kx92vnC3aeBMZpq1YMJw/sHm8sPy5VTFARKBxGrma5NG3Kfd
         AkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741773756; x=1742378556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pUHKQpxTCLmGn74czB9zdVmL8GuztD+1m1BAWrqdpyw=;
        b=N8AJGoDSgmySvjUI3WNlYayLGwZKbR8jgx2NvGzVM0eMSg1AEI9SOeMVqp6+V6TN+7
         qvHPHynB3wWEhfWyYwAQq9hJis03cVWR5/LruqLMQQ5kMLY9dA+yWdHuyUFKgGXIT8Bs
         jHhLZcXs62IC4r33kldB+e21xFouw3vZ07lO7AEHQolzIQzhvJsz3S6Znq5mwQCJA+fq
         /UMCfgxnITjHzT9mYTH4oZYYkUFwLYdL3XHncQzqwi7S1WYJv7nr5s5IgDU1dh3KkV5y
         CX8fPnsHhTYB1Ei2Agd0EEcFb6uwZvQQrBbmxXsSby/p2jU82a/edl5pIwRhnuGWTI5R
         W3sA==
X-Forwarded-Encrypted: i=1; AJvYcCVnrylucReslbbClzZXUDWwRg6vXWwCo1oXAoN3wc7Zt5gs/Y9PMnSxUV4hHKzuCKau33W938mhMKmoc4LZGdgJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzItFglv+76BJ7thUclIUp6/zNdmqIFS3fjNjhpndqw33+U+Y4T
	X406HG/clSrp/ujpuffI4qBjtycXrupDkxWJepP9uoUehr/yjaZHILcu0lR8CBU=
X-Gm-Gg: ASbGncvm4Dy7ZBle2x3OPxq9hTo9U4njfPf2VXWUYZ2583UsL+3tRX/o6bFJG73xkrH
	usiyVgOaVaIklleOmEYwmJ2/sZqmYPaWFwdcucBDnGpPhbpl89IVKAkkhs/GfDcD918WHBklQ3X
	b7cqEUWfBRxh0nGH8kYGr3XLHQJQXi1AusfYHbB1rP7yd1n7YWS7rbfRm0xTF6ENWbuqDC4kkHB
	XnNTDnbwHa12LvJB/csV0BvITAs5L19Kj7/TYM7/ozOkygDSWlcl5q8d/Fc8PrHk/SgUPo8BN+n
	Zx602OzeGYWNO/5qPULGJo6C+5F0FYzABiXPHBwSwahLd3lkvmjAtg==
X-Google-Smtp-Source: AGHT+IHsfLVyBWcJIJmx03S34iaHHCTkfZVaBtu1xexwTvJTh2AWPtnReHSIE67a3DSyc4chYw5jdw==
X-Received: by 2002:a5d:5f8f:0:b0:391:2e0f:efec with SMTP id ffacd0b85a97d-39132d1faebmr14844096f8f.7.1741773755863;
        Wed, 12 Mar 2025 03:02:35 -0700 (PDT)
Received: from [192.168.1.247] ([209.198.129.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c015d2bsm20073216f8f.43.2025.03.12.03.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 03:02:35 -0700 (PDT)
Message-ID: <6b43a3e5-b76f-45fc-bb2a-6c47a0a7c511@linaro.org>
Date: Wed, 12 Mar 2025 10:02:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf script: Fix typo in branch event mask
To: Yujie Liu <yujie.liu@intel.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jiri Olsa <jolsa@kernel.org>,
 "Liang, Kan" <kan.liang@linux.intel.com>, Mark Rutland
 <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Graham Woodward
 <graham.woodward@arm.com>, Paschalis.Mpeis@arm.com
References: <20250312075636.429127-1-yujie.liu@intel.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250312075636.429127-1-yujie.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_030237_581642_8F45ABA3 
X-CRM114-Status: GOOD (  16.03  )
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



On 12/03/2025 7:56 am, Yujie Liu wrote:
> BRACH -> BRANCH
> 
> Fixes: 88b1473135e4 ("perf script: Separate events from branch types")
> Signed-off-by: Yujie Liu <yujie.liu@intel.com>
> ---
>   tools/perf/util/event.h                 | 2 +-
>   tools/perf/util/trace-event-scripting.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
> index c7f4b4b841ca..664bf39567ce 100644
> --- a/tools/perf/util/event.h
> +++ b/tools/perf/util/event.h
> @@ -91,7 +91,7 @@ enum {
>   	PERF_IP_FLAG_VMENTRY		|\
>   	PERF_IP_FLAG_VMEXIT)
>   
> -#define PERF_IP_FLAG_BRACH_EVENT_MASK	\
> +#define PERF_IP_FLAG_BRANCH_EVENT_MASK	\
>   	(PERF_IP_FLAG_BRANCH_MISS |	\
>   	 PERF_IP_FLAG_NOT_TAKEN)
>   
> diff --git a/tools/perf/util/trace-event-scripting.c b/tools/perf/util/trace-event-scripting.c
> index 29cc467be14a..72abb28b7b5a 100644
> --- a/tools/perf/util/trace-event-scripting.c
> +++ b/tools/perf/util/trace-event-scripting.c
> @@ -347,7 +347,7 @@ static int sample_flags_to_name(u32 flags, char *str, size_t size)
>   
>   	flags &= ~(PERF_IP_FLAG_TRACE_BEGIN | PERF_IP_FLAG_TRACE_END);
>   
> -	types = flags & ~PERF_IP_FLAG_BRACH_EVENT_MASK;
> +	types = flags & ~PERF_IP_FLAG_BRANCH_EVENT_MASK;
>   	for (i = 0; sample_flags[i].name; i++) {
>   		if (sample_flags[i].flags != types)
>   			continue;
> @@ -359,7 +359,7 @@ static int sample_flags_to_name(u32 flags, char *str, size_t size)
>   		break;
>   	}
>   
> -	events = flags & PERF_IP_FLAG_BRACH_EVENT_MASK;
> +	events = flags & PERF_IP_FLAG_BRANCH_EVENT_MASK;
>   	for (i = 0; branch_events[i].name; i++) {
>   		if (!(branch_events[i].flags & events))
>   			continue;
> 
> base-commit: b10f74308e1305275e69ddde711ec817cc69e306

Reviewed-by: James Clark <james.clark@linaro.org>


