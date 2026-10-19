Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE375CCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okjHac9HA8yNuFEbyuUJm7e15weplnoREC6dmkLj8fw=; b=W7TwiCLzi8epy1C1QVEiOBsakS
	K7Vu/6GhnF5ufqfZft4b3toSriVHz9mvgRUWF36bT0rRG3INxDMkD7wb3iCpja4z6e2t1KDq/yJ3p
	GpjFlB+UzF/2KDuOYWYXsvL2cf3asrmG34dho3ZM3HNGUNN5+AP9H60pcrd846hyJAP3Omns6dXEZ
	1t/FBzaZHu/hHg3oj0artjDKmZ3IdNfwSRP7yrJiBJjJpPbhOD3ecD5ewYV8fIuyp64c+NH0C8eqL
	SJWlA4DcrVmojSrvFzS2aXaOL7yFe5i1x6DnxIZe1KWygiDmVxcCVks7NNoNzjYFxXpYxfrMvKs1t
	V5yitiJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjkO-0000000713B-0tuk;
	Mon, 19 Oct 2026 09:33:36 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjkG-000000070yg-0GOl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 09:33:29 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48b060ec084so1221268f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 02:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792402406; x=1793007206; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=okjHac9HA8yNuFEbyuUJm7e15weplnoREC6dmkLj8fw=;
        b=pof7h5A2YQHwJHXzxcJl1/yg3XbOMigM1LQ9iJlo4Sh+4THkAqyE5bo0Pts9Vb3ljS
         Zkw/GfW6Ng05FIQ0w6xqhSyQCW5lpR0OhwPyFTB8SZhI3IUChCxOGghESS1v36qWqhpv
         kp74Vv13Y7mXN4aJmR1ii8LnPDovUxQ22OJIVn+dt/FFsQ6jl0FxiJPqOUjQv2yLsNZq
         1fXgEI/MXHjAPQkxYaE+P06G4GissdOc/kL5r41vq5TO2NqGW1jZkgmGIzb5KmGwNEKl
         r24JyT5oBB4/OflOXvtcA7swch6YmiywtQBj+Tthr3GUne/C/9Sg0VZkInkSYb3xmpJI
         vdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402406; x=1793007206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okjHac9HA8yNuFEbyuUJm7e15weplnoREC6dmkLj8fw=;
        b=iRAXSo1PqOumqGtBFUbM2CTlEluqhtA6ulKU4mVIZXHcrQnP67bkx6M74XamqvziNU
         x/Apl+ETSegcQ6Ph2rqdvO84wIg2jzP0Z6HZzgUzxEdqaANxTrVTdoZYd9BjGvF+Fzsx
         DoeaI6S0vsVDVYhpm5DbV8g3oUHfA1s+luDQ5iFuwWw6pQAgnJxqrNTP1pALOT9XSuB+
         1aERacKksWGHikDza+ZvQzam5cbkD//rD5pf44fvz3sz6eSiFtc2x+s7gtv8m0lmoAsU
         tzrHzVpRkDRr6XGO1XbX5xF6KjNlhKqEliFc2TXj0cxylIlutIh/PJ3c5AQvHZMPJZC3
         PYPw==
X-Forwarded-Encrypted: i=1; AKwUvBy6eObs7+qZZNLjuLfs6mGMzxJVcSWFNuZS1zWvTt4Wf1QbTVZJX9e0/a6wWQNX7RnzbaqTwUkp8tv/qED2RbBk@lists.infradead.org
X-Gm-Message-State: AFq9FYJvGqbDIbURxuwgJp1nca+pLFnhlJOTePYzvw528yZ8Vh7zUEaR
	fWwc7tEQB+F1dpoENkuH8B75aA6uVExgAXO6Tqf76jyfQXsN3wlFVQUHZe0m5rir5sYKt2IjmjT
	GZrE0p2A=
X-Gm-Gg: AYBFou1vNJWP3fq6IaLPiSf5gpzd0s1oPgXw3qoZUzUq7hci3GKFYvir+Qd3cmx93Jz
	/qScK25Kafv4Yr/huHqWGwgPwgrEfm8U4MU+fa722cPC/1IVOMqdjiKBQRPrgbNgzJuswh4ZP/H
	5/p5VWIzUT1fekBTsWhUw9oFQx7lfMeKgsGuAH8DikrcJOsGwjk/xyo2lzSW9cVDOI18Yexg3rR
	Mkaor0FJHlzVPjvFKpUJZ+cYdPZbKa+MQggik5Owwl5ENdaAr8xQsVaj4TkKRjNDrdyBHhtU8Wz
	Ng4h99LEfDOkGtGkfX8TfA5QO/vYyvrUV9CEufXuL9l1iTJ3lZXToFKln6jzBLWz3TmLSYbfQQe
	gxRKWKUjxXAVYLpBng8mYm6j55B7aonwnuoGow49jBISfUAR/2BNCgyVCdU5YI26r2zTT8ryDWL
	aF8UsjzPGXeOewqwud0DKKTMmTB1ER6DLJNBI0pgGrDcsngRD3lguu13/nbjPHyTaFoRXmBbMJi
	fc=
X-Received: by 2002:a05:6000:490f:b0:48b:9d80:53a5 with SMTP id ffacd0b85a97d-48e07bbe5d5mr13361426f8f.10.1792402405652;
        Mon, 19 Oct 2026 02:33:25 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1afbf534sm323988f8f.35.2026.10.19.02.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:33:25 -0700 (PDT)
Message-ID: <ebf74a45-f406-4502-99e3-434e19feef6e@linaro.org>
Date: Mon, 19 Oct 2026 10:33:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/25] coresight: perf: Improve hardware state transitions
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
 <20260915-arm_cs_support_aux_sample-v1-9-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-9-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_023328_300403_3A14D104 
X-CRM114-Status: GOOD (  26.92  )
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



On 15/09/2026 16:48, Leo Yan wrote:
> Keep hw.state consistent with event activation and AUX buffer updates.
> Initialize events as stopped and up to date, clear both flags after a
> successful start, and set UPTODATE after committing an AUX buffer
> update. On resume, clear UPTODATE only on success. Preserve state on
> resume failure and ignore duplicate stops.
> 
> Add helpers for setting and clearing state bits. Use READ_ONCE() and
> WRITE_ONCE() to prevent compiler merging or refetching of state
> accesses.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 58 ++++++++++++++++--------
>   1 file changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index e3c9d3cf84c502f357a430bc3bfa854a776618f1..f66c99b26e1862ab04105704276c901b21728207 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -150,6 +150,20 @@ etm_event_cpu_path(struct etm_event_data *data, int cpu)
>   	return *etm_event_cpu_path_ptr(data, cpu);
>   }
>   
> +static inline void etm_event_set_hw_state(struct perf_event *event, int mask)
> +{
> +	struct hw_perf_event *hwc = &event->hw;
> +
> +	WRITE_ONCE(hwc->state, READ_ONCE(hwc->state) | mask);
> +}
> +
> +static inline void etm_event_clear_hw_state(struct perf_event *event, int mask)
> +{
> +	struct hw_perf_event *hwc = &event->hw;
> +
> +	WRITE_ONCE(hwc->state, READ_ONCE(hwc->state) & ~mask);
> +}
> +
>   static void etm_event_read(struct perf_event *event) {}
>   
>   static int etm_addr_filters_alloc(struct perf_event *event)
> @@ -520,6 +534,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   static int etm_event_resume(struct etm_ctxt *ctxt)
>   {
>   	struct perf_output_handle *handle = &ctxt->handle;
> +	struct perf_event *event = handle->event;
>   	struct coresight_device *source;
>   	struct coresight_path *path;
>   	int ret;
> @@ -536,10 +551,13 @@ static int etm_event_resume(struct etm_ctxt *ctxt)
>   		return 0;
>   
>   	ret = coresight_resume_source(source);
> -	if (ret < 0)
> +	if (ret < 0) {
>   		dev_err(&source->dev, "Failed to resume ETM event.\n");
> +		return ret;
> +	}
>   
> -	return ret;
> +	etm_event_clear_hw_state(event, PERF_HES_UPTODATE);
> +	return 0;
>   }
>   
>   static void etm_event_start(struct perf_event *event, int flags)
> @@ -553,8 +571,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	u64 hw_id;
>   
>   	if (flags & PERF_EF_RESUME) {
> -		if (etm_event_resume(ctxt) < 0)
> -			goto fail;
> +		WARN_ON_ONCE(etm_event_resume(ctxt));
>   		return;
>   	}
>   
> @@ -583,7 +600,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	 */
>   	if (!cpumask_test_cpu(cpu, &event_data->mask)) {
>   		perf_aux_output_end(handle, 0);
> -		event->hw.state = 0;
> +		etm_event_clear_hw_state(event, PERF_HES_STOPPED);
>   		return;
>   	}
>   
> @@ -621,7 +638,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	}
>   
>   	/* Tell the perf core the event is alive */
> -	event->hw.state = 0;
> +	etm_event_clear_hw_state(event, PERF_HES_STOPPED | PERF_HES_UPTODATE);
>   	/* Save the event_data for this ETM */
>   	WRITE_ONCE(ctxt->event_data, event_data);
>   	return;
> @@ -639,11 +656,12 @@ static void etm_event_start(struct perf_event *event, int flags)
>   		perf_aux_output_end(handle, 0);
>   	}
>   fail:
> -	event->hw.state = PERF_HES_STOPPED;
> +	etm_event_set_hw_state(event, PERF_HES_STOPPED);
>   	return;
>   }
>   
> -static void etm_event_update_buffer(struct perf_output_handle *handle,
> +static void etm_event_update_buffer(struct perf_event *event,
> +				    struct perf_output_handle *handle,
>   				    struct etm_event_data *event_data,
>   				    struct coresight_device *sink,
>   				    int mode)
> @@ -668,6 +686,7 @@ static void etm_event_update_buffer(struct perf_output_handle *handle,
>   		size = sink_ops(sink)->update_buffer(sink, handle,
>   						     event_data->snk_config);
>   		perf_aux_output_end(handle, size);
> +		etm_event_set_hw_state(event, PERF_HES_UPTODATE);
>   		return;
>   	}
>   
> @@ -704,7 +723,8 @@ static void etm_event_pause(struct coresight_path *path,
>   		return;
>   
>   	event_data = READ_ONCE(ctxt->event_data);
> -	etm_event_update_buffer(handle, event_data, sink, PERF_EF_UPDATE);
> +	etm_event_update_buffer(event, handle, event_data, sink,
> +				PERF_EF_UPDATE);
>   
>   	/* Prepare the handle for resuming trace */
>   	perf_aux_output_begin(handle, event);
> @@ -716,8 +736,13 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
>   	struct perf_output_handle *handle = &ctxt->handle;
>   	struct coresight_path *path = etm_event_get_ctxt_path(ctxt);
> +	struct hw_perf_event *hwc = &event->hw;
>   	struct etm_event_data *event_data;
>   
> +	/* If we're already stopped, then nothing to do */
> +	if (READ_ONCE(hwc->state) & PERF_HES_STOPPED)
> +		return;
> +
>   	if (mode & PERF_EF_PAUSE)
>   		return etm_event_pause(path, event, ctxt);
>   
> @@ -726,7 +751,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	 * to synchronize. Mark the event stopped and up to date.
>   	 */
>   	if (!path) {
> -		event->hw.state = PERF_HES_STOPPED | PERF_HES_UPTODATE;
> +		etm_event_set_hw_state(event, PERF_HES_STOPPED | PERF_HES_UPTODATE);
>   		return;
>   	}
>   
> @@ -734,9 +759,6 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	/* Clear the event_data as this ETM is stopping the trace. */
>   	WRITE_ONCE(ctxt->event_data, NULL);
>   
> -	if (event->hw.state == PERF_HES_STOPPED)
> -		return;
> -
>   	source = coresight_get_source(path);
>   	sink = coresight_get_sink(path);
>   	if (!source || !sink)
> @@ -746,9 +768,9 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	coresight_disable_source(source, event);
>   
>   	/* tell the core */
> -	event->hw.state = PERF_HES_STOPPED;
> +	etm_event_set_hw_state(event, PERF_HES_STOPPED);
>   
> -	etm_event_update_buffer(handle, event_data, sink, mode);
> +	etm_event_update_buffer(event, handle, event_data, sink, mode);
>   
>   	/* Disabling the path make its elements available to other sessions */
>   	coresight_disable_path(path);
> @@ -759,12 +781,12 @@ static int etm_event_add(struct perf_event *event, int mode)
>   	int ret = 0;
>   	struct hw_perf_event *hwc = &event->hw;
>   
> +	etm_event_set_hw_state(event, PERF_HES_STOPPED | PERF_HES_UPTODATE);
> +
>   	if (mode & PERF_EF_START) {
>   		etm_event_start(event, 0);
> -		if (hwc->state & PERF_HES_STOPPED)
> +		if (READ_ONCE(hwc->state) & PERF_HES_STOPPED)
>   			ret = -EINVAL;
> -	} else {
> -		hwc->state = PERF_HES_STOPPED;
>   	}
>   
>   	return ret;
> 

Reviewed-by: James Clark <james.clark@linaro.org>


