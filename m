Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC534CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/g8SN2WKb9PmJxIeGRbGVw4NTAI8lYKDRiQUVJJ/IV0=; b=ybdTOXLoNST8/v5+5M+az/ve6r
	vx9EI8SiCiwo6G3EGZR6T6LMXrP+O3LBgyTaAqCVdWYY0OoZSNqTuAL2WcAkCmbjLQJlJhO2Ht271
	33uYfytUfJ5HmFuSGhCt05mpeG6NqlCiTY92V0Hb3dYgrpUok1vvhOSvcDWbYp0Sj3eahN7703GO4
	ZOKM6IP9P2u5PcAYKYHwRISPZyLHHWu2spsL8wxfoSA/u+WAGXpp9CuJqWH5xmlsfo8o+vcGfh0J2
	z783p+b1epPiDXDSOgIqBtBlR19Cn4ByFBebKwKwYme5PkRFdk3kEQZUepIZAKqU0oCNVjHrA9VxY
	mtgdUYtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImlD-00000007Qbf-2PL5;
	Mon, 19 Oct 2026 12:46:39 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImlB-00000007Qb8-18ux
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 12:46:38 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c169ae1cb26so507061266b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 05:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792413995; x=1793018795; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/g8SN2WKb9PmJxIeGRbGVw4NTAI8lYKDRiQUVJJ/IV0=;
        b=R4OZL67ljb7+2gVbvxug/evUo8mtrRewp3e8nQyWzKv0Kvrkg+U8737iohupkOSINL
         duodRLlxgwoM4yTnxWrB+zgyvCSSESENvRpNbWRwniLUPAzI40OJCpvvhQHHeIYLAERt
         28CFffNdhypKcn5j34T+R7KnNKVdb+et0a32mB0cC7oIwcqdpLZoE25RmA5SSOCuHjsX
         PvId2LrofKlyyRwHNsoGSwMuqMpOMEWUVk39uYvQSgnUKF7Yk6Vxa2GBxaMoLd4RywYU
         Q4Q0UIIWSZIKSxJlOhELeQLQhXaMsFEKNdNyar2CutCdMZpgQW3heA2DezTPOgFIu100
         Uttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413995; x=1793018795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/g8SN2WKb9PmJxIeGRbGVw4NTAI8lYKDRiQUVJJ/IV0=;
        b=KPDWG1vJSPmADhpFp9dFu0hiUjv0HtaMmPnAK5hatib53MV1JYUcmBhCKbaoiVNqoc
         kLDXwbpdRtPHHINupDlNeCGBIheYoG+dVjOTfxPCvkq0onBFxTZZQ92aIEXwARb9lmG0
         arD66jaNEK35itW8LPpBoVPxY7+EX4OWdVWDcnIVNJoysHByCAnuWw/ntOjOPe3rvhpK
         dvxEVjkIeCgsg/LjQbCd+Mk1GQsd2+wL2OTBOVD1n2LLRW8XxAMFx5JoOgHytO0O8Y8h
         05ryEIbLlG52k9ElLToiVwI7OoL00QcPAWL4hGLZUuIT6Msm4vt39DKNHsZXE9f3d04n
         DbHg==
X-Forwarded-Encrypted: i=1; AKwUvBxPSDF/KPyyuJlG4fIKYTPbMPRMA2MjOXdqrFn8Pef8sxpOTCjRmjsARCGQ2niTWFhHFVjFwAsJVkhl7F4EZkw1@lists.infradead.org
X-Gm-Message-State: AFq9FYJZc6cSJ4zPenUFibwSVj1v0VXko0t/4i8NwEzivBNt1WcsLIUW
	kGnwAKsSYz7z1pw6acnQNYW113vQ1XO0TWk9RMv9Mi9TE4wRZrrzVqv8i+bOunM1BdM=
X-Gm-Gg: AYBFou0vMHWSTcuVR0d1N7Z0lQ2z47sX5E5RQ8Sl89Das0sII5JB9nU7GQmSu5gMraK
	M6U+N+feQiKRdaKNplpUxsC75W11wdghS7iRoqtbgI/kaa5LeL8sYbpcVGg8eu61GaAFwjce2JX
	8/w8ShXTDvaPi79HJJET8DiPt30JXYbIOkUTOgKg7gBzzOyP1AdojdtRx/aZfGKt5cUanQUWQDC
	xcedvvq4hHt6H3SlEAy4/qdkkTpHWjICgn0wr+g4+CllmT+9fjUy8Hx6mlsvfUFmn6ZvvkEaiCh
	26E9s1Gfzj4aP+9/aJnCro5gsF4JGW4RdxzeDGRXMEaPD7GAb6aTifcG7KgExlwTVGonraxBgVF
	WlYwzwy7rG13qk8UhltaZOlr0nVuafwKCK0dtOFqIz9cfOL/SaY2s3FQgTgKyaQTFfzJ97Dvi1D
	2uTnS2u+9lWPzk6mtsVwdWG82AEaEoNM1F577oRCaKrth7lSocDrgRVLmkQZ9Jl49c8lVhkGBHj
	mQ=
X-Received: by 2002:a17:907:930c:b0:c2d:c060:160 with SMTP id a640c23a62f3a-c40223d9d7dmr819450866b.25.1792413995187;
        Mon, 19 Oct 2026 05:46:35 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eae235sm373825266b.67.2026.10.19.05.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:46:34 -0700 (PDT)
Message-ID: <95c31a70-81d9-4e77-9e77-0397c5252fa1@linaro.org>
Date: Mon, 19 Oct 2026 13:46:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/25] coresight: perf: Look up the trace path in
 etm_event_pause()
To: Leo Yan <leo.yan@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
 <20260915-arm_cs_support_aux_sample-v1-14-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-14-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_054637_456150_C4CA9189 
X-CRM114-Status: GOOD (  18.61  )
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



On 15/09/2026 16:49, Leo Yan wrote:
> Have etm_event_pause() retrieve the active path from the event context
> instead of passing the path from etm_event_stop(). Move the stop path
> lookup after the pause dispatch so each operation resolves its own path.
> 
> This prepares etm_event_stop() to coordinate hardware access before
> looking up the active context.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index f66c99b26e1862ab04105704276c901b21728207..8f803914e9abfb18e080ff68371ad8b32042f180 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -694,10 +694,10 @@ static void etm_event_update_buffer(struct perf_event *event,
>   	perf_aux_output_end(handle, 0);
>   }
>   
> -static void etm_event_pause(struct coresight_path *path,
> -			    struct perf_event *event,
> +static void etm_event_pause(struct perf_event *event,
>   			    struct etm_ctxt *ctxt)
>   {
> +	struct coresight_path *path = etm_event_get_ctxt_path(ctxt);
>   	struct perf_output_handle *handle = &ctxt->handle;
>   	struct coresight_device *source, *sink;
>   	struct etm_event_data *event_data;
> @@ -735,7 +735,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	struct coresight_device *source, *sink;
>   	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
>   	struct perf_output_handle *handle = &ctxt->handle;
> -	struct coresight_path *path = etm_event_get_ctxt_path(ctxt);
> +	struct coresight_path *path;
>   	struct hw_perf_event *hwc = &event->hw;
>   	struct etm_event_data *event_data;
>   
> @@ -744,7 +744,9 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   		return;
>   
>   	if (mode & PERF_EF_PAUSE)
> -		return etm_event_pause(path, event, ctxt);
> +		return etm_event_pause(event, ctxt);
> +
> +	path = etm_event_get_ctxt_path(ctxt);
>   
>   	/*
>   	 * With no path enabled, there is no hardware to stop or trace data
> 

Reviewed-by: James Clark <james.clark@linaro.org>



