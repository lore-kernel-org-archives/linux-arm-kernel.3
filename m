Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FBACCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rj7uwc+EKzyLJl2slhVkFCcJ8uKjGpCu+rX2woYwvYU=; b=nuCX+ajPDtkSl7BKw1FAnnYOP4
	w0nWiR8cbt6hN5VHUYPDiPPl1othJEYIWfGqExJqrFM4HPxdBC9HIeTyfXmdGX4ZJsfLK4jgWKtOT
	IfdxGPmALhrmmJo5/GYHBSKwDyGqNUcBWVGdzl/OsfaxdnqvRiv2HS2w3fX/Cp95hptJxx0r/RukF
	n4b2ojXXZc0silmDe5IpChLS3npFzEujfBFsCxEnKIBeE7iTLYhLkb+PEPvZBzoncNxROVbNmV5wO
	A8MeVv06f1VODj+UDN/0cG2GAVqvk6vYKTh2gjT8KlBNbaATOqEuxd4aw0+6cjbrWKhuC2/3dbdl1
	9bj8Cjmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjcc-00000006zbl-2VTJ;
	Mon, 19 Oct 2026 09:25:34 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjcZ-00000006zYa-0dFd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 09:25:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so11551305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 02:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792401929; x=1793006729; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rj7uwc+EKzyLJl2slhVkFCcJ8uKjGpCu+rX2woYwvYU=;
        b=Edfq0J8ns41mzfFtaGyLXgU9XDhNX6fBEDIbOm+hhpieixTG3QwvzYIwAVfup941XY
         5NVUsVPWjify4W582pE12djRiSS05tnz3rJJQuvs3ql6uedPb0qKLcsXjmLeFtLlzmEF
         ilMvbH3zWZBUz64Uk/Sj7qLW6wf7ZiiI8IsfXt6mo9O2YtVVV99FU+SBA7o9YEPVY901
         h7bejzqRVPEnDaC1ZWjbB4BETUhN0h2NhQoIKdn4theIOa09Tt6SdIU02hHz+oXcEYIF
         aPaSiV3MIIlbiFWX97T1I6OfhDSnRQSK1zCGvah7B0d58U0iq1OVFSs+CZIwApyJj4UZ
         wnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401929; x=1793006729;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rj7uwc+EKzyLJl2slhVkFCcJ8uKjGpCu+rX2woYwvYU=;
        b=k9RFxCL3tjUtMFltUeeQUCxzsxEXRSYKuH4R6EZMJ8JJNuVZkxSAPY3KbXb5q7gSG3
         JK/4RM5auKq9fSiD+NxOWV35AKClGKYEYT267M5o5Z9jU0UJLOhikwEAQwCP+ewEFcHh
         5t1qZXY7wH3oA+sOIzwCwOLcfvuA8oEgKg/z3ykW0eyG8e/8hwYecsdwZ/CQq5U+X+38
         PJF1sFS0Dz6xu/TDvSPW0/80taLUpBbrW7UpQxlklTZOK6j1TJOWMPocqPS9p7jWa12V
         elZ5r7qeDOxkODDAA3u1q1+0DnLswTChCjzfohft+CdH2LkUsx9RNAeIJ6HEBetPV1fB
         AB3A==
X-Forwarded-Encrypted: i=1; AKwUvByDZfB5qj3NZS/5y7XUbOs+D3uee5LCgaMnj001k+EzNQ3bjWGQtmwAzyo8e4OEYQbZ3dV7AFQnP73hfUFkCswo@lists.infradead.org
X-Gm-Message-State: AFq9FYL2j5GdD+9HrLy3i6gKMkyV6DoD5pzuNEm8appBqmumKdioXh45
	HPcgyi5oZkj4qeZq3snDTH7UnrBt+WEl2r8yzDOJFwMu9pciMqsnXRDyhEFa7nn6zu0=
X-Gm-Gg: AYBFou3GohLCgkBZIyavchDk8t6C1ETKcdbpsMQiWlaTurK9gbep86SFdzyuSfOc2SO
	KRqks2jlXtXzTo4bUgeZu4mf/cosnaCqlDKTYQ4sWLNzxGnxEsgvIco/dWBzSdZ35xhJdgb4r1e
	q0lFW4CNXjwU/ehOVW/otxlxCQsC7Z5xM6p1j78mqaKpI/wCFcp/Y/7r8Tvhw44mKqcN9tHf820
	aH5lDvB3djzkoakoC7aP2YF3YWJGX+6Z3gXfyEifW3tvigEWKbR4G3vjOVIzov1ppvto4FNtQy+
	hUcXeSaE2yzMcoLG7c+4KEBag3nrx9SiX/JcgSjrNqRyUTV9ucHn/mFf9UBJZugSaiEBHeQ5koi
	/FCY3VAiYhCVq0+Euwc1joF3n93onntg6mAymiRDJvzQMM/cG3gfE2ZbuXoycJYsoUCsfUrs65l
	sHq6nMZbIacVrrJSCNUSATwIa4gRv9EsoX0MQ8uDGurZ+sfzFBDLZyeNDhc2Z2BHMvJNUBmQKHF
	EM=
X-Received: by 2002:a05:600c:5488:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a1d75fd4d0mr152515455e9.16.1792401928632;
        Mon, 19 Oct 2026 02:25:28 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf983b88sm258881895e9.7.2026.10.19.02.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:25:28 -0700 (PDT)
Message-ID: <76c6cc56-08bd-455e-bd32-63cb024924dc@linaro.org>
Date: Mon, 19 Oct 2026 10:25:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/25] coresight: perf: Validate the live context through
 its path
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
 <20260915-arm_cs_support_aux_sample-v1-7-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-7-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_022531_222500_A86515C0 
X-CRM114-Status: GOOD (  24.71  )
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
> etm_event_get_ctxt_path() returns a path only when the per-CPU
> context has published event data and that data contains a path for the
> current CPU. Perf PMU callbacks run on the same CPU in atomic context,
> and only the normal stop clears the event data. A returned path therefore
> establishes that the pause and stop callbacks have a live ETM context.
> 
> The AUX handle has a separate lifetime. It can be absent after an AUX
> transaction could not be restarted while the CoreSight path still needs
> to be paused or disabled. The handle is acquired for the callback event
> before event data is published, and another ETM event cannot replace it
> while the published context remains live. Thus any active handle belongs
> to that context, and etm_event_update_buffer() uses perf_get_aux() to
> determine whether it remains valid.
> 
> Remove the redundant comparisons of the handle with the event and event
> data, together with the redundant event_data check. Use the path to
> validate the ETM context lifetime and perf_get_aux() to validate the AUX
> handle lifetime.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 15 ---------------
>   1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index afd22fd4a851e600ab69fd5b6883e6f8518b2cab..c7454da5c881c4a8eea5cc77902c9113c297096e 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -698,9 +698,6 @@ static void etm_event_pause(struct coresight_path *path,
>   	if (coresight_is_percpu_sink(sink))
>   		return;
>   
> -	if (WARN_ON_ONCE(handle->event != event))
> -		return;
> -
>   	event_data = READ_ONCE(ctxt->event_data);
>   	etm_event_update_buffer(handle, event_data, sink, PERF_EF_UPDATE);
>   
> @@ -728,14 +725,6 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   		return;
>   	}
>   
> -	/*
> -	 * If we still have access to the event_data via handle,
> -	 * confirm that we haven't messed up the tracking.
> -	 */
> -	if (handle->event &&
> -	    WARN_ON(perf_get_aux(handle) != ctxt->event_data))
> -		return;
> -
>   	event_data = READ_ONCE(ctxt->event_data);
>   	/* Clear the event_data as this ETM is stopping the trace. */
>   	WRITE_ONCE(ctxt->event_data, NULL);
> @@ -743,10 +732,6 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	if (event->hw.state == PERF_HES_STOPPED)
>   		return;
>   
> -	/* We must have a valid event_data for a running event */
> -	if (WARN_ON(!event_data))
> -		return;
> -
>   	source = coresight_get_source(path);
>   	sink = coresight_get_sink(path);
>   	if (!source || !sink)
> 
Reviewed-by: James Clark <james.clark@linaro.org>

