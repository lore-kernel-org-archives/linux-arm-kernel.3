Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2E5C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 13:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dp7BPKuB4zCs/+3PHXfcxNLJlisKEZ/RDTpAdSVNhe0=; b=OQi1Ir5rMcOWa8rZVtRf0l8XMX
	+SoFa5iTB8F2uEDO20UDugY3620voeNeAS9YVFoKrqsR86H1mnTTBrszZmhvrju17MjGxazvrM2cn
	6o7sQkuGw9gvcdZQwaPxq4SSokftpVuyKFXybZKtN9zt0faev0elo4T1YXm2gm3HHeG5AuCIYsGsr
	ZvH5cSIYG3FUZ7fP7ZYDi0LX+JLF2Zn3p5bz3e9sZF9VzdoKo7FcfZZYx2T1P1R5hvEhZS3l5MhHF
	CrwtfaWNv/L1MJwizIkAFPGKIsTleNLtsUQn59TYvTT4zzftmeW3EIYfSDK7CIWaxcgKk1XMv0BGJ
	h9tWh84A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbEJ-00000003NQm-31ih;
	Tue, 01 Apr 2025 13:00:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzb6P-00000003MFi-1c3i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 12:52:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED76A14BF;
	Tue,  1 Apr 2025 05:52:25 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E0933F694;
	Tue,  1 Apr 2025 05:52:21 -0700 (PDT)
Message-ID: <8d9ad64b-a5f7-4a44-a557-7edb83322fdf@arm.com>
Date: Tue, 1 Apr 2025 13:51:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] coresight: perf: Update buffer on AUX pause
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250311170451.611389-1-leo.yan@arm.com>
 <20250311170451.611389-6-leo.yan@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250311170451.611389-6-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_055225_525714_6DF46737 
X-CRM114-Status: GOOD (  24.89  )
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

On 11/03/2025 17:04, Leo Yan wrote:
> Due to sinks like ETR and ETB don't support interrupt handling, the
> hardware trace data might be lost for continuous running tasks.
> 
> This commit takes advantage of the AUX pause for updating trace buffer
> to mitigate the trace data losing issue.
> 
> The per CPU sink has its own interrupt handling.  Thus, there will be a
> race condition between the updating buffer in NMI and sink's interrupt
> handler.  To avoid the race condition, this commit disallows updating
> buffer on AUX pause for the per CPU sink.  Currently, this is only
> applied for TRBE.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   .../hwtracing/coresight/coresight-etm-perf.c  | 43 ++++++++++++++++++-
>   1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 2dcf1809cb7f..f1551c08ecb2 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -574,14 +574,53 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	return;
>   }
>   
> -static void etm_event_pause(struct coresight_device *csdev,
> +static void etm_event_pause(struct perf_event *event,
> +			    struct coresight_device *csdev,
>   			    struct etm_ctxt *ctxt)
>   {
> +	int cpu = smp_processor_id();
> +	struct coresight_device *sink;
> +	struct perf_output_handle *handle = &ctxt->handle;
> +	struct coresight_path *path;
> +	unsigned long size;
> +
>   	if (!ctxt->event_data)
>   		return;
>   
>   	/* Stop tracer */
>   	coresight_pause_source(csdev);
> +
> +	path = etm_event_cpu_path(ctxt->event_data, cpu);
> +	sink = coresight_get_sink(path);
> +	if (WARN_ON_ONCE(!sink))
> +		return;
> +
> +	/*
> +	 * The per CPU sink has own interrupt handling, it might have
> +	 * race condition with updating buffer on AUX trace pause if
> +	 * it is invoked from NMI.  To avoid the race condition,
> +	 * disallows updating buffer for the per CPU sink case.
> +	 */
> +	if (coresight_is_percpu_sink(sink))
> +		return;
> +
> +	if (WARN_ON_ONCE(handle->event != event))
> +		return;
> +
> +	if (!sink_ops(sink)->update_buffer)
> +		return;
> +
> +	size = sink_ops(sink)->update_buffer(sink, handle,
> +					     ctxt->event_data->snk_config);

I believe we keep the sink disabled/stopped in update_buffer. We need to
turn it back ON after the "buffer update". May be we could use a flag
to update_buffer() to indicate this is "pause" triggered update.

Cheers
Suzuki


> +	if (READ_ONCE(handle->event)) {
> +		if (!size)
> +			return;
> +
> +		perf_aux_output_end(handle, size);
> +		perf_aux_output_begin(handle, event);
> +	} else {
> +		WARN_ON_ONCE(size);
> +	}
>   }
>   
>   static void etm_event_stop(struct perf_event *event, int mode)
> @@ -595,7 +634,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	struct coresight_path *path;
>   
>   	if (mode & PERF_EF_PAUSE)
> -		return etm_event_pause(csdev, ctxt);
> +		return etm_event_pause(event, csdev, ctxt);
>   
>   	/*
>   	 * If we still have access to the event_data via handle,


