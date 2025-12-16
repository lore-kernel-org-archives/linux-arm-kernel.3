Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87955D609CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 16:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJ1e1P6F4CyulVnt004SCDge6FBFbgLQSB8l5Ftm9W0=; b=R0ZOq6F8WsfDseE+dsrq5gcz9E
	ARHJ+uuFRFMLV5lLq30EgQPRkgAtfA6yytjDFSDTDgkbJiXLeC7ams1cqYog+Tp+qJvOzEisvpzqe
	dM9Wc9kVtr9f2vBCJRgEm2GqtQCfs2tTdCZYC8XdzlMJwAJgWSzsB8A2gIqgUDcxpQMKUfJK+FngE
	zrN2wSYL5UOJINmZtZGsPdJ01wz3KIPQuuAxge59RzdOqc7f29M8ZhbKYF5Sx2zht73WGUxeWZXAj
	cYQnpzILskunj1JXfNi2TKWd1hWkF+hIVIpIPSvhQcmwiCQvmWdiGkIjqmLtwRGZ5lLX2VdUBfMKf
	LKVCIqCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXte-00000005Wcm-1jXv;
	Tue, 16 Dec 2025 16:27:34 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXtb-00000005WcN-3e4h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 16:27:33 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b7355f6ef12so927024566b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 08:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765902450; x=1766507250; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rJ1e1P6F4CyulVnt004SCDge6FBFbgLQSB8l5Ftm9W0=;
        b=En6ryr0eckHzCeQ6L4dPQGyEVIIAwagm/Zo3wjASBfmEl76pGm6qply5sxgnx9e3ba
         AE3Q6HQp4xqfRkcRdVbyoZNhS60hhtKXPlKxl8dX5ZEsJ0Sj/yORLmOyfDnMmBmg35kD
         UuK7Y1iRveWkR5paxrMt8tgg2/Vt+eVIY7cqSWxT0WJhcH05LT78UwPw7QnqT7PbtBEI
         ohyDwk8+w9avt1Kn3GXWhPrydtzlVzMU/7RJeGo2dVGZ8V/OXQjdd/2H6TmmMcEBhnfD
         Gfc1MFcGDvvx+q5nkPlH3VwTWiClZPSNU1z0LelCAGNKPHAAM3GFHMVInE1NdifYM0j/
         cNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765902450; x=1766507250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJ1e1P6F4CyulVnt004SCDge6FBFbgLQSB8l5Ftm9W0=;
        b=dEUxoe/+SxWsWhSYk8K6r3NY3W9gBPwWo9lA7nxZQPrnT/uLMV5Eu6tMr2fcxbKDQR
         fXXhh0jF4WsImrKrgnDM3dxwufa5fmFyrUNqG/vxbhmCc2mhO9cEjoWuQcnJ+YPNvEC4
         un9adIOYhhreDpXc2uYxb+c7qtiB1F/3+YRqGwOCes7GSQjC9D546uH/hOju1OPphVSc
         bhHrHfYeFOg0LLXYr7ZpQfRNZOzoUYxbZMgKL77r1NGr9bqov6s3kRMRose4GIBNIS3E
         vpUDKssRHchlo+w8d+9COWjgWSp1nKR9ZAnkDlwP+WkbQUKWLRWsOEH9PphCUUEAANnB
         0SXw==
X-Forwarded-Encrypted: i=1; AJvYcCVM4qMMsRpPdBApPikuAta419EqrRj5NmihKtq60dhJL/ZiZD2ohpulE4q/Bf9k7/NHZCMuQyTl8q7LYlsRE8oS@lists.infradead.org
X-Gm-Message-State: AOJu0YxAeE8+JyGkaYZURdqvrypfrQhx3opm4fZEiakyg0W+YIYBKZTS
	Bwj7DlzopY5WfNbHwB9WvA/vawSTOR/HkHkZ6S6z65R1OIda/YefWTJ6efxr5I2wiAk=
X-Gm-Gg: AY/fxX7pyz/mcIdANQ/mU6IkOEwEkYlBqid9uwSn2/Ox/vg6Y3FPzDxJfuF/46DzYad
	zEwDYztqO+pk6r9BnQQ9L/syuzjgQSmUtIrgSOkwTyekx6tRWd5j9xSElzIhIgUpxODePjTlwPJ
	2lt14r7j0WmiD3FqNyfjXNLDfAC2KoN7s5yFqNEna7bOoe3XPe9g8fJY72UG45l9yFDEvOqpyTW
	ANgK3RJTqiFUEC1mxgOI8Qm0NFDI0UlGuHq3UKNwbfcgdT5oUZ/tnGdA4UbETRlnA6WALceYllP
	gw4qYm/3WdkPCc2O4dBqBabHGONnu9erv8vySvJ48PYFW59JhM/dsf8VOeV3MD8P4J2Ux2/pMpt
	gcdHaIiMnJAesKxR02++atrHoe/CJWb/yfMc6JSbsqAVOzDsxSb5VCZF9L7uAJGXmX7mV+0xDSG
	8aKBAMTc72PK68jblC3pYs
X-Google-Smtp-Source: AGHT+IEK6iaFERqvEdHq4Ged5LPvd31mh1w4HuC+BU0D8njB6TOveN15IML8gddkUz7RlIw6lJ98MQ==
X-Received: by 2002:a17:907:608d:b0:b77:1d75:8b78 with SMTP id a640c23a62f3a-b7d23cb3a2fmr1722671866b.53.1765902449781;
        Tue, 16 Dec 2025 08:27:29 -0800 (PST)
Received: from [192.168.0.108] ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210de23sm16756928a12.28.2025.12.16.08.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 08:27:29 -0800 (PST)
Message-ID: <c8fad013-b022-4037-94e8-1f0536535469@linaro.org>
Date: Tue, 16 Dec 2025 18:27:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] coresight: trbe: Support trigger mode
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>,
 Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-16-7da32b076b28@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-16-7da32b076b28@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_082731_967179_AF72892A 
X-CRM114-Status: GOOD (  30.69  )
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



On 01/12/2025 13:22, Leo Yan wrote:
> The buffer currently operates in fill mode, where tracing stops when it
> reaches the end of the buffer and a maintenance interrupt is raised.
> However, due to IRQ latency, trace data may be lost during the window in
> which tracing is halted but the program continues to run.
> 
> To mitigate the issue, this commit enables the trigger count to support
> buffer maintenance without disabling tracing.  This is fulfilled with
> two modes:
> 
> 1) Set a trigger count as a watermark and use fill mode to prevent the
>     buffer from being overwritten.  Once the count is decremented to
>     zero, an interrupt is raised for buffer maintenance, but the hardware
>     continues collecting trace data until limit.
> 
>            head            watermark tail
>       +----+---------------+---------+-------+
>       |$$$$|               |         |$$$$$$$|
>       +----+---------------+---------+-------+
>       base `---- count ----'         limit   base + nr_pages
> 
>       $$$ : Filled trace data
> 
> 2) Use wrap mode so that tracing continues when reach the top of the
>     buffer.  The trigger count is configured as "Stop on trigger" to
>     guard the trace data not to be overwritten.
> 
>                watermark   tail      head
>       +--------+-----------+---------+-------+
>       |        |           |$$$$$$$$$|       |
>       +--------+-----------+---------+-------+
>       base                                   base + nr_pages
>                                              limit
> 
>                                      `------->
>       >-- counter ---------'
> 
>       $$$ : Filled trace data
> 
> The modes are selected by comparing the limit with the trigger position.
> 
> An extra TRBE_FAULT_ACT_TRIG state is introduced for fault action, it is
> used to distinguish the trigger event from the WRAP event.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 101 +++++++++++++++++++++------
>   drivers/hwtracing/coresight/coresight-trbe.h |  14 ++++
>   2 files changed, 94 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 8390d0a8fe23d35945610df15f21751279ee37ee..0551ea9b4f8286c156e3c9c7ac94e2ecd3b9dc3f 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -48,6 +48,7 @@
>   #define TRBE_TRACE_MIN_BUF_SIZE		64
>   
>   enum trbe_fault_action {
> +	TRBE_FAULT_ACT_TRIG,
>   	TRBE_FAULT_ACT_WRAP,
>   	TRBE_FAULT_ACT_SPURIOUS,
>   	TRBE_FAULT_ACT_FATAL,
> @@ -67,6 +68,7 @@ struct trbe_buf {
>   	unsigned long trbe_hw_base;
>   	unsigned long trbe_limit;
>   	unsigned long trbe_write;
> +	unsigned long trbe_count;
>   	int nr_pages;
>   	void **pages;
>   	bool snapshot;
> @@ -478,6 +480,10 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
>   	if (head < tail)
>   		limit = round_down(tail, PAGE_SIZE);
>   
> +	/* If trigger mode is enabled, no need to use limit for watermark */
> +	if (!static_branch_unlikely(&trbe_trigger_mode_bypass))
> +		goto out;
> +
>   	/*
>   	 * Wakeup may be arbitrarily far into the future. If it's not in the
>   	 * current generation, either we'll wrap before hitting it, or it's
> @@ -495,6 +501,7 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
>   	if (handle->wakeup < (handle->head + handle->size) && head <= wakeup)
>   		limit = min(limit, round_up(wakeup, PAGE_SIZE));

I kept wondering how this limit was relvant now in wrap mode. But I see 
it's skipped from the goto above, but that only jumps over one 
statement. Can we have that static branch as a regular if statement 
guarding the limit calculation instead of the goto?

Negating "trigger_mode_bypass" and renaming it into just "trigger_mode" 
might help too. The double negative of "not trigger_trigger_mode_bypass 
goto" is a bit hard to understand.

>   
> +out:
>   	/*
>

