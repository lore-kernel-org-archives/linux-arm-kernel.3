Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78254CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5u1hd3MVH4854Wnbwnw1BZQepD7XiDLggdf6oqUpphg=; b=mD/heCBSpTn71c8aYY/QaffI0A
	8Pr4Rf1K9NLdRSUSH9hG/X/RLzXj/iytsp8g3jq532rMpykNXXcX/GHlEqbtz3yNPzeJ5r7jvvHS3
	JDe3QwaC0e2QgzdcJY2JGfBht8X9ebOKf6T833o4tFQ+QL9lOIxpPOQAcTe1/nx0oMkS4+cq893XA
	qGlj6H4rbxvfj+VFQshk4nG0VpTYiNyNLgsJ8L+XgoFoQhzBQaq5EMrlWLUwTwlfCyZo86yRDC6/s
	F6ttXB2udIoXJVYNQo5GxiXXp9q/tmNlsO0oLr1yfM0FiNmoBAAUnohm61AVYAo1FNvdNQmU8RkPF
	nYAP76Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiMy-000000034s0-35sE;
	Fri, 16 Oct 2026 13:53:12 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiMv-000000034rL-2uAx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:53:10 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a1d665a5efso415345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 06:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792158788; x=1792763588; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5u1hd3MVH4854Wnbwnw1BZQepD7XiDLggdf6oqUpphg=;
        b=W/evs+mQKnVcOvqhw7inh02iE0sqpDSdURD91Ny1FJ980IJdC/Ocb6M0fCExHYazhu
         l6d67Q/hWHYjgu5LGI/yxVeQI8D22sE+2NWmJawfEutXgv1D3LuX1PVQG5DTsyu/7GHK
         kNazpRPzyZBAXF+gDFGuKVBDD5Dn1mr6Ie36Qlrn5x9PbbMcsvNzh+7QDrxgEYqUrhsW
         W6eVYMp3DlNZnBENfYBrXcbbjgso8+YSAl8eClAPeToTKIiVAGXqcTKr6vVpa9aNMQNz
         LpKHDMjiNwkgQrXIVX0tcRn0csTVcUf5FyQoCXPKTiXHw6y9jivzgvjA12Dvn3QycUrM
         eoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158788; x=1792763588;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5u1hd3MVH4854Wnbwnw1BZQepD7XiDLggdf6oqUpphg=;
        b=y7ok4JUvTX1PN5rxAxyFD4AmVSfGoED1/REwqeg7qJt+6niDSYiCT9J1C430j/lk8S
         8ghXaVfGIP/wAaRr+dN1A30xZY6ntewAEjnKU5WSWcLWstmneCPdalSq8i9PPbVLERS7
         p9yyjC8kBM3F5yZQDQIv1iA6HYmWlDDuCWZPgGw2Q9lDutF8q/zVzcAj1UonmZFlKfMT
         sb1x0BFWD4icMqH95Jyjkr3iqBze6VUSbJxQbtcTPDTOutoAp9WCBFL5ACRKFI4A+1xo
         uaoISTRoLbH8thSdDVT1cMB75saYntQ2KHNZAWT5ESNExe1cYtvNagp53sOkPkBaWw/q
         oF8w==
X-Forwarded-Encrypted: i=1; AKwUvBzMqAttoRDId8szKWBHP/q38tX/03aW5W0/KR+5goNk8+WO+BqMlXjyU90kG0Sr/nYcxdf2ENJvu9DVuZ2Z3PGR@lists.infradead.org
X-Gm-Message-State: AFq9FYKD0YaS4ibESr3ePxF9SqY1Abv/EsCs56Jmt7r3A9cdlvKk9Szt
	r3bA57hQZQQQG4e4CP4Ja+iUxkZuO5395Oaz3Jr1jVrk1m4TKaF+B81T1aaB4CuGF1A=
X-Gm-Gg: AYBFou32aujurUs5EUnUx5nJdnBNOEFHGLuZ2oLAsSg5JE1EK35/marKPJ81FpFDKvg
	2hqSi6Pc1dB6DofPQrM4Y6mx+Pz61ZkUP2VU0YOatUqRXjyTp3JsefPd/7X2SVKMFuzn3pA/FfL
	q8P9FLIDWL01Qy8NjpkmpazlzE1dgQWaSj1WVLU1GSmZgWymipQUTwD78nkUNMWXPoBm8/G05FD
	tDoOuhaJs1mNiBJBxVzuS7E7hg90//CRMWDldrxIb8A1V8l6LSYcDUe2MzFsCPicWMdd/S4ORk0
	muhCDDvQQqZKyKlZ+jiPn449ChNz1vt5c5Dr29QuXcDJKi9usmF6ozxJ+50toAtgAo3zYOEnStf
	hRCaLYFx87gSkIW5iDcemYfyEzVvEQxTi1rUTLOB99HWLdMSNQq3s4JNGW1AiBrUE7NEbjJZ8Vt
	cv3BD4vBYutWFDYH2zZlvS1Sda3jXESKQPX1XlLxepjg5NwWhyQnvtmE9P/d/mXGeHotW7kJBPR
	p0=
X-Received: by 2002:a05:600c:6388:b0:4a1:ac66:5ffe with SMTP id 5b1f17b1804b1-4a1ac666396mr241877715e9.15.1792158787676;
        Fri, 16 Oct 2026 06:53:07 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d0e2bb8dsm35630445e9.2.2026.10.16.06.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:53:06 -0700 (PDT)
Message-ID: <43db2ca6-27be-416b-83f8-131676e5d444@linaro.org>
Date: Fri, 16 Oct 2026 14:53:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/25] coresight: perf: Extract AUX buffer update helper
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
 <20260915-arm_cs_support_aux_sample-v1-5-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-5-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_065309_771912_0B769C0F 
X-CRM114-Status: GOOD (  32.31  )
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
> The pause and stop callbacks duplicate the sequence that updates a sink
> buffer and finishes the current AUX output transaction. Move the common
> sequence into etm_event_update_buffer() for a single implementation.
> 
> The helper first verifies that perf handle is active. It updates the
> buffer when PERF_EF_UPDATE is requested and otherwise ends the
> transaction without data. The pause callback can then start a new perf
> handle for resuming trace.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 89 ++++++++++--------------
>   1 file changed, 36 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index a45f69f39f175f3044322b25fe5413fb97154496..13d865ca86f1161b2e21174f096473c4829afc8c 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -637,6 +637,38 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	return;
>   }
>   
> +static void etm_event_update_buffer(struct perf_output_handle *handle,
> +				    struct etm_event_data *event_data,
> +				    struct coresight_device *sink,
> +				    int mode)
> +{
> +	unsigned long size;
> +
> +	/*
> +	 * Make sure the handle is still valid, as the sink may close it from
> +	 * the IRQ handler. E.g., the sink driver may fail to restart the
> +	 * handle during interrupt handling due to insufficient buffer space.
> +	 * The sink driver must serialize update_buffer() with IRQ handling,
> +	 * so this should return either a valid handle with a valid size
> +	 * (which may be 0), or no handle at all.
> +	 */
> +	if (!perf_get_aux(handle))
> +		return;
> +
> +	if (!sink_ops(sink)->update_buffer)
> +		goto out;
> +
> +	if (mode & PERF_EF_UPDATE) {
> +		size = sink_ops(sink)->update_buffer(sink, handle,
> +						     event_data->snk_config);
> +		perf_aux_output_end(handle, size);
> +		return;
> +	}
> +
> +out:
> +	perf_aux_output_end(handle, 0);
> +}
> +
>   static void etm_event_pause(struct coresight_path *path,
>   			    struct perf_event *event,
>   			    struct etm_ctxt *ctxt)
> @@ -644,7 +676,6 @@ static void etm_event_pause(struct coresight_path *path,
>   	struct perf_output_handle *handle = &ctxt->handle;
>   	struct coresight_device *source, *sink;
>   	struct etm_event_data *event_data;
> -	unsigned long size;
>   
>   	if (!path)
>   		return;
> @@ -669,27 +700,16 @@ static void etm_event_pause(struct coresight_path *path,
>   	if (WARN_ON_ONCE(handle->event != event))
>   		return;
>   
> -	if (!sink_ops(sink)->update_buffer)
> -		return;
> -
>   	event_data = READ_ONCE(ctxt->event_data);
> -	size = sink_ops(sink)->update_buffer(sink, handle,
> -					     event_data->snk_config);
> -	if (READ_ONCE(handle->event)) {
> -		if (!size)
> -			return;
> +	etm_event_update_buffer(handle, event_data, sink, PERF_EF_UPDATE);
>   
> -		perf_aux_output_end(handle, size);
> -		perf_aux_output_begin(handle, event);
> -	} else {
> -		WARN_ON_ONCE(size);
> -	}
> +	/* Prepare the handle for resuming trace */
> +	perf_aux_output_begin(handle, event);
>   }
>   
>   static void etm_event_stop(struct perf_event *event, int mode)
>   {
>   	int cpu = smp_processor_id();
> -	unsigned long size;
>   	struct coresight_device *source, *sink;
>   	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
>   	struct perf_output_handle *handle = &ctxt->handle;
> @@ -742,45 +762,8 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	/* tell the core */
>   	event->hw.state = PERF_HES_STOPPED;
>   
> -	/*
> -	 * If the handle is not bound to an event anymore
> -	 * (e.g, the sink driver was unable to restart the
> -	 * handle due to lack of buffer space), we don't
> -	 * have to do anything here.
> -	 */
> -	if (!handle->event)
> -		goto out;
> -
> -	if (mode & PERF_EF_UPDATE) {
> -		if (WARN_ON_ONCE(handle->event != event))
> -			goto out;
> -
> -		/* update trace information */
> -		if (!sink_ops(sink)->update_buffer)
> -			goto out;
> +	etm_event_update_buffer(handle, event_data, sink, mode);
>   
> -		size = sink_ops(sink)->update_buffer(sink, handle,
> -					      event_data->snk_config);
> -		/*
> -		 * Make sure the handle is still valid as the
> -		 * sink could have closed it from an IRQ.
> -		 * The sink driver must handle the race with
> -		 * update_buffer() and IRQ. Thus either we
> -		 * should get a valid handle and valid size
> -		 * (which may be 0).
> -		 *
> -		 * But we should never get a non-zero size with
> -		 * an invalid handle.
> -		 */
> -		if (READ_ONCE(handle->event))
> -			perf_aux_output_end(handle, size);
> -		else
> -			WARN_ON(size);
> -	} else {
> -		perf_aux_output_end(handle, 0);
> -	}
> -
> -out:
>   	/* Disabling the path make its elements available to other sessions */
>   	coresight_disable_path(path);
>   }
> 
Reviewed-by: James Clark <james.clark@linaro.org>

