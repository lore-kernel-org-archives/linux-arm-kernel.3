Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C41BCCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZ7aNbjQZUrQzNKHssers5+AZqgNNYh0ssOAYLIZWvc=; b=f6/G6BReMNA+FF0fCE4B7JNjhI
	fIPpACo/G65oIaOTHmIY8zCT0OgrBYF2P8oA9xhe/0945dgBL99Omk2cbGZHYJcGNe05rGCHhXTT0
	/dV0wntbBFfJ6RyrV+v8FapshKH+ZSaVUmQym3py5IeDGO6ismsw2OcI0hLaF+swPEtsa+uQXT4mI
	2Xu91+tI0ct6dxeS4Le3PdAFOoFtYEMhkwBiHOanKVh2vuKAZZSyjqaV0yyDGQvt/c3kEC4IIne7d
	ykWMqjpOnbTCN4Ofq71FjSvGKgRAhunm0BK5Fd2bO/MlyWZq+yUj7iXQZ7pOj3U8mLuTCo7939Xs/
	t70lDDMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiT0-000000035Qu-2mgs;
	Fri, 16 Oct 2026 13:59:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiSz-000000035QT-17X1
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 13:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kZ7aNbjQZUrQzNKHssers5+AZqgNNYh0ssOAYLIZWvc=; b=kRbuXSO5r5ruALuH2HEfKrCVdw
	3p1/esHRWpqz5c0FugIQzfWdbpIPvlR5FZvrUYuTpcpNQmSZ3RYtmc/fJpIS1ZEo6xqPP2V80fAq0
	MBdBPGALN/sTXD+5/N03QCsDnTLcXD2kNLpTuwsKwMWj3oKhIvDVlwCAXKFpykmaBkZElMo5EuXCR
	Zs0K5jSlIgX7cgLIaCE1UQQW994sNw0Vh2NkSA+wlrv6rZS5y6sbCZiHuegL18APrclke4T5g360d
	hK2j3PwFDWydPm7oVjD7cEUsFxdPC/8J1l4owS4zJ7lRwl04oYZswfokwYM5U7uVgsRK1slA7aRd/
	j1OsNAAQ==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHiSw-00000001ZaI-1whO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:59:24 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48b042c0759so4710655f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 06:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792159161; x=1792763961; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZ7aNbjQZUrQzNKHssers5+AZqgNNYh0ssOAYLIZWvc=;
        b=tk5/W+TKcGG/FBTn0yi715KT+ldr88gs+kM2FKP6p/zWq+ZeFC4zkc3V4QkZ/hhZvN
         xdi007rPwjwFNeFH/S+Emk41o+MGrFPaVwpterXiyP4A3cP3bhoQEPg7sRwtvWXLt9wz
         7oE291nnID2vv2foSJVzYnaPaJSFNdJtjSXmXfKyg522MqkX1hsqu6BS/b6piNfkQC9N
         X+aT7074/uqypfStYWCRbKisj9wXaguP9yDgNlVo3IL+QzU2NpKQIBNdiiuKN36DWBUg
         Nz0mc7K8ZXG1lfsuSMQMkSLq5/ugu2/xuPPjU90JSXv1WLvxBLBnUP21qeELPkZtK46I
         3Bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159161; x=1792763961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZ7aNbjQZUrQzNKHssers5+AZqgNNYh0ssOAYLIZWvc=;
        b=ygZgh3g0mTAB0erlGQPAZUzMR3qu3dyFE4CeQdnnwElOxDFf6fa9d0+HxRPkuit3IN
         I/3cCXhPiVjc7qCwqLF7n9jAYhS00l4PHkoiJVAblMNgEwYrpMNzz14Ut75YG+c28WhN
         37E7FwuCUKsK8ca+d43gWUlymHlZ7mbv+WGlyaiUgqVUhDOMwiCuKjMF0TOZGiNPmGuq
         9E3MLBJkeTDRTTMz6sEgah9iyCWvS6YntzMOpT/6QjGFY2QKBpi1hKMNPSWlcabvJGvA
         r+ppZEMMAQmsrCgOBQdHy/V0TJydpMiC3NF6aOjeE3q6GKOEqVFNPju36FKIkZRzcdAw
         eW+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzACPaDb4qF2GWCmYzoy8grbpSlZmYa1F0ynkuow2ehWqs4miW7nO2lig2f01RfCSznHiOP5LcyqSPVmBWI7RCW@lists.infradead.org
X-Gm-Message-State: AFq9FYJM9R4gWbL08SCdv+EpEVlYp+M9rDVtZOV49OCek9bOObnzKck8
	S2AcKyDduk+60VAFHT3iapEvronBbhxhD+ss5pHLShxn4C5rBOk4EG5n5LmlPomIus4=
X-Gm-Gg: AYBFou1Zeza9b+RMWjHGR4L1NE6Xi9LP0GnIcxvDUCUouV/giDrwJqDNOtlcJcGCoot
	bwTevr5yHSGDQujZjC+XQPwIJr1TAL5BwLXhQXghBDBF/WjEKGn0wRKQaWnTFDAdzLTyCKfNBom
	mNdb7wYRQtoSN2weFeuDc5b2kW5b9Rh0tG44MOmPtsNbzuwiZp5rumHeppZVGWO2XNkodMUEV5C
	rWTZIheCwTxc1AYBWCG3TePSzJwM8x46VnETV5SAB3OqKWlZ/SJ7vh/YmpVeC5gwxCyV5HMVOpS
	EgL+7f8A0zRO3BzEUKIs32LuLvxHR5+icW7/Qmfw0EGyURHE3Bzlv2wzKWDOJbVbHJifaVjMpJQ
	qdnTiplnKtYdFUYRCt5NfFOri0UOJ+AiwRZf+TNXce/xGcRbZwFJ31ye21pEJMQ35Un3MrEKyve
	3U3aNwvh62hFNrIdWFfG+wCeYwejmvOaLxttcAni9qIXjZzp2gr6pzdQ8RxC5wx4GJpUzrH9TaY
	rDNXZCDq3yZsXSUYacTBIfN8DlK3zoURTjVpulmLnXDj0tiVJIbJOygki73Yw==
X-Received: by 2002:a5d:5f82:0:b0:48d:ff0b:9b52 with SMTP id ffacd0b85a97d-48dff0b9cf2mr4016547f8f.19.1792159160653;
        Fri, 16 Oct 2026 06:59:20 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm5181686f8f.42.2026.10.16.06.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:59:20 -0700 (PDT)
Message-ID: <73a053af-9c07-4d09-be30-66778b5f433d@linaro.org>
Date: Fri, 16 Oct 2026 14:59:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/25] coresight: perf: Simplify flow for CPUs without a
 path
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
 <20260915-arm_cs_support_aux_sample-v1-6-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-6-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_145922_620200_7FFC1BFB 
X-CRM114-Status: GOOD (  33.12  )
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
> etm_setup_aux() removes a CPU from the event mask when it cannot build a
> path from that CPU's ETM to the selected sink. The start nevertheless
> allocates buffer handle and keeps event data active until the
> corresponding stop callback.
> 
> End the newly acquired handle immediately when the current CPU is not in
> the mask, and do not publish event data in the per-CPU context. The
> event remains logically active so that a task event can trace after
> migrating to an eligible CPU. A stop on the unsupported CPU then has no
> CoreSight modules to disable or trace data to synchronize. Mark its
> hardware state stopped and up to date.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 38 +++++++++++-------------
>   1 file changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 13d865ca86f1161b2e21174f096473c4829afc8c..afd22fd4a851e600ab69fd5b6883e6f8518b2cab 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -572,13 +572,15 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	 * the sink was specified or hinted to the driver. For
>   	 * now, simply don't record anything on this ETM.
>   	 *
> -	 * As such we pretend that everything is fine, and let
> -	 * it continue without actually tracing. The event could
> -	 * continue tracing when it moves to a CPU where it is
> -	 * reachable to a sink.
> +	 * In that case, leave the event logically active but stop AUX
> +	 * output on this CPU. The event could continue tracing when
> +	 * it moves to a CPU where it is reachable to a sink.
>   	 */
> -	if (!cpumask_test_cpu(cpu, &event_data->mask))
> -		goto out;
> +	if (!cpumask_test_cpu(cpu, &event_data->mask)) {
> +		perf_aux_output_end(handle, 0);
> +		event->hw.state = 0;
> +		return;
> +	}
>   
>   	path = etm_event_cpu_path(event_data, cpu);
>   	path->handle = handle;
> @@ -613,7 +615,6 @@ static void etm_event_start(struct perf_event *event, int flags)
>   		perf_report_aux_output_id(event, hw_id);
>   	}
>   
> -out:
>   	/* Tell the perf core the event is alive */
>   	event->hw.state = 0;
>   	/* Save the event_data for this ETM */
> @@ -709,7 +710,6 @@ static void etm_event_pause(struct coresight_path *path,
>   
>   static void etm_event_stop(struct perf_event *event, int mode)
>   {
> -	int cpu = smp_processor_id();
>   	struct coresight_device *source, *sink;
>   	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
>   	struct perf_output_handle *handle = &ctxt->handle;
> @@ -719,6 +719,15 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	if (mode & PERF_EF_PAUSE)
>   		return etm_event_pause(path, event, ctxt);
>   
> +	/*
> +	 * With no path enabled, there is no hardware to stop or trace data
> +	 * to synchronize. Mark the event stopped and up to date.
> +	 */
> +	if (!path) {
> +		event->hw.state = PERF_HES_STOPPED | PERF_HES_UPTODATE;
> +		return;
> +	}
> +
>   	/*
>   	 * If we still have access to the event_data via handle,
>   	 * confirm that we haven't messed up the tracking.
> @@ -738,19 +747,6 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	if (WARN_ON(!event_data))
>   		return;
>   
> -	/*
> -	 * Check if this ETM was allowed to trace, as decided at
> -	 * etm_setup_aux(). If it wasn't allowed to trace, then
> -	 * nothing needs to be torn down other than outputting a
> -	 * zero sized record.
> -	 */
> -	if (handle->event && (mode & PERF_EF_UPDATE) &&
> -	    !cpumask_test_cpu(cpu, &event_data->mask)) {
> -		event->hw.state = PERF_HES_STOPPED;
> -		perf_aux_output_end(handle, 0);
> -		return;
> -	}
> -
>   	source = coresight_get_source(path);
>   	sink = coresight_get_sink(path);
>   	if (!source || !sink)
> 

Reviewed-by: James Clark <james.clark@linaro.org>



