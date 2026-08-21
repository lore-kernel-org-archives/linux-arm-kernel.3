Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEECC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irmyV/0eSa9w7db6iLa2bBa2VlGeL5F1eUiaUcSYjjA=; b=dvTtWWiYlYZY5v1XZOBjefsh4y
	yFT0CdFHvZo7aCAIjKCUuK1yMvHFoXQ5ciy2AgF4OGqptt2R2Db2yj6tFmw/aTW/df8To3qi4LYU9
	AOtaH6X9JJRI6a4mgOJwQVpSNQ9D9yJxbdL2QrsB6ngYmmVVwAE9XwKcXsovogZjlS0XnWy+VPrM0
	cGHbRlvCi57btm8e1hZyeI/r3AaVYMGGm0UIII4x1pM9TT5UWWxqqO+Fcnyq/m6wFJbERf3CI+1rC
	A8L6y2Twtl59Zn6MR9xZqDrIWD9eIDJz3JkMWYSTs7npKgBWhTGbreO1ZNYmaLab4YgTI3RR8Cwau
	wi14cfrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxM45-0000000D02g-1k4C;
	Fri, 21 Aug 2026 10:01:33 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxM42-0000000D025-22eU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 10:01:32 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so432498f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 03:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787306489; x=1787911289; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=irmyV/0eSa9w7db6iLa2bBa2VlGeL5F1eUiaUcSYjjA=;
        b=utLBWE68lig/SqKIRQos5J75s09IOWc7yJk90WPvyFkTgLOOPIrxxzf2IEfBOnGPP5
         dT8jze+wqcLLfiHdXih8Hdn2FZ7yGon0dfsrtQ4Miz8TINZFnXJDAscthA2prjA819Sb
         xUIe3GAwWMKjxeWYITKXNFowOLQZuDxCtMHn6VmKj/AGEHxaX6/5m1P/k1qXUiGyzcnv
         +BRmX9YFx5GpN0FfSOL0cK/3TZZNmWZdf+q6D0CrUmoQVzzqfamTF/pomlguFI8VVIRP
         wF9Cz08LsfRCgTQkKhie6jjRvdMCD6UcnpnSCDK+EG2jxjRL9E4zSN9p7OXqOVLOYohN
         MzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787306489; x=1787911289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irmyV/0eSa9w7db6iLa2bBa2VlGeL5F1eUiaUcSYjjA=;
        b=D9SYAeIo0jdCKlf7azjcEI9OmWQzNovntHnL+/XzqBxdRPMzQUK2fKmJNPdLxv2IEx
         pXEHVzHOqbe1RvJUbh/S25EpgxM6mWDHPxMkQlsXdLUmiRBEVok9oBSY8TuI/vtQX8bK
         rKarnYvIlhBmdr8wLptYSTFMZQ3sLwoq51Xlf8x3e1db5W4dqRZ5YZ35SBx/F3Dcb2nu
         h+LmMgRLib3lqzghP89yuZzej0TsK968SjYpgP5Vx0Lq+MZXtCNjyXq+41qtwTIVL3Lg
         MhmuVKK2GvaPukh4mO36boFSnKEHqheasUem32LUGGQEXVX7cIsnzuMITvp8MVygKrez
         IT8w==
X-Forwarded-Encrypted: i=1; AHgh+Rrs37kPxcmleWiQYMrUYndQYuim2Rh3LQZh0xy+Kssqk4LNcey/b4QUFOEqnhwO6YtocjbjXDRkWAm5Iy2BYFqK@lists.infradead.org
X-Gm-Message-State: AOJu0YyP7iUWRsrH2iHUuP4FJayuyoPt50if7grp9j+Gas4DsH3QGn1B
	cV4tKOL4tTVYLfnPpgyfnwitxCiAH3gSKmKMUYJCL4zJl0XYPZHz7BJjiStZOZLxWrc=
X-Gm-Gg: AR+sD12RJnrSa+nZ8oUILtD+6lGjOXOssGg6j7LhwxmHnO5YpE76PRnXbhW+TMqDD7w
	mj2cO5IPucP3dlOvndnE8KqxRBlRyLY5CvR5liD/zIhhxiy0uohDdASGX/s8B5hRSxxSQ+8z3ZF
	6kTg6F4ZzUfBEcuWHOZUAiLhFZAo4BMSZUSkzT9gQNVj2Wg/LActehGXNSnK/ZkqJii7+uOmpNB
	GUwZY8Ztfc5f+lcU3kmg/QGUXPJzFudgXotbBm9mt+q83fcTYv1wQfe1BZFXY7Q7Q5Ff32kgshm
	Gk9YYcxtOXpZ/3BqIlM/FafemvnUEuPjqvuw/Bb9PMlZrzhP44afPqnq/ELx/jZs8P2rFenCtSm
	0Z1E6GasHzQ4D8s0S2oQvgtf7a7aXqUAsulUEHeg2DtCjyxZxNd67AySp7nDBznLliqntNsrn92
	GOJMFOVs3YNeth+se+gaZ9eagtt2l8ttLqQi6JpnWjJgcyAZpSNLIAOUMAoIrE3vr4vA==
X-Received: by 2002:a05:600c:4e47:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-499b8464503mr76563985e9.13.1787306488617;
        Fri, 21 Aug 2026 03:01:28 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b915c6ccsm21562555e9.13.2026.08.21.03.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 03:01:28 -0700 (PDT)
Message-ID: <c7c42471-d537-4196-b78d-9c9aa6c87570@linaro.org>
Date: Fri, 21 Aug 2026 11:01:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] coresight: perf: Retry failed HW_ID writes
To: "coresight@lists.linaro.org" <coresight@lists.linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
 <20260821-james-cs-hw_id-output-failure-v1-6-9d532ddabcc3@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260821-james-cs-hw_id-output-failure-v1-6-9d532ddabcc3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_030130_551922_A4725781 
X-CRM114-Status: GOOD (  24.03  )
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



On 21/08/2026 10:50, James Clark wrote:
> Don't set the aux_hwid_done bit when writes fail so that it can be
> retried later if the ring buffer was full.
> 
> Add a second attempt on stop in case this session only has one call
> to start. Otherwise there is no chance to retry and it isn't fixed by
> not setting aux_hwid_done.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 52 +++++++++++++++---------
>   1 file changed, 32 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 09b21a711a87..0ffc5cd9c88f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -536,6 +536,31 @@ static int etm_event_resume(struct coresight_path *path)
>   	return ret;
>   }
>   
> +static void etm_output_hw_id(struct perf_event *event,
> +			     struct etm_event_data *event_data,
> +			     struct coresight_path *path,
> +			     struct coresight_device *sink)
> +{
> +	int cpu = smp_processor_id();
> +	u64 hw_id;
> +
> +	/*
> +	 * output cpu / trace ID in perf record, once for the lifetime
> +	 * of the event.
> +	 */
> +	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
> +		hw_id = FIELD_PREP(CS_AUX_HW_ID_MAJOR_VERSION_MASK,
> +				CS_AUX_HW_ID_MAJOR_VERSION);
> +		hw_id |= FIELD_PREP(CS_AUX_HW_ID_MINOR_VERSION_MASK,
> +				CS_AUX_HW_ID_MINOR_VERSION);
> +		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, path->trace_id);
> +		hw_id |= FIELD_PREP(CS_AUX_HW_ID_SINK_ID_MASK, coresight_get_sink_id(sink));
> +
> +		if (!perf_report_aux_output_id(event, hw_id))
> +			cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
> +	}
> +}
> +
>   static void etm_event_start(struct perf_event *event, int flags)
>   {
>   	int cpu = smp_processor_id();
> @@ -544,7 +569,6 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	struct perf_output_handle *handle = &ctxt->handle;
>   	struct coresight_device *source, *sink;
>   	struct coresight_path *path;
> -	u64 hw_id;
>   
>   	if (flags & PERF_EF_RESUME) {
>   		path = etm_event_get_ctxt_path(ctxt);
> @@ -596,22 +620,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	if (coresight_enable_source(source, event, CS_MODE_PERF, path))
>   		goto fail_disable_path;
>   
> -	/*
> -	 * output cpu / trace ID in perf record, once for the lifetime
> -	 * of the event.
> -	 */
> -	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
> -		cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
> -
> -		hw_id = FIELD_PREP(CS_AUX_HW_ID_MAJOR_VERSION_MASK,
> -				CS_AUX_HW_ID_MAJOR_VERSION);
> -		hw_id |= FIELD_PREP(CS_AUX_HW_ID_MINOR_VERSION_MASK,
> -				CS_AUX_HW_ID_MINOR_VERSION);
> -		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, path->trace_id);
> -		hw_id |= FIELD_PREP(CS_AUX_HW_ID_SINK_ID_MASK, coresight_get_sink_id(sink));
> -
> -		perf_report_aux_output_id(event, hw_id);
> -	}
> +	etm_output_hw_id(event, event_data, path, sink);
>   
>   out:
>   	/* Tell the perf core the event is alive */
> @@ -630,7 +639,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	 */
>   	if (READ_ONCE(handle->event)) {
>   		perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
> -		perf_aux_output_end(handle, 0);
> +		perf_aux_output_end(path->handle, 0);

Accidentally left this in from hacking. It doesn't do anything so I'll 
remove it.


