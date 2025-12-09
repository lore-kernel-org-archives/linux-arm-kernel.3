Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C1FD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 13:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIKjv/DlcA/ThInIs54WwElR7N7WTwnMgJg790nkIxY=; b=h8q7E3h4CennmuEqRhpvbPcgvf
	ifptknMgQ7M65Tw464IJ0M4Sk1CRoakI4VsLUNIJagXFBxVK25el22ewONyMBp95pBaO0R7lZqEji
	RpdBxsmk2FAvUbrs/hG5Su74/a3DIDyJAj8SqtvYce4z+Y+214ubPtfufyNv58LAxmVppwckIEX1s
	VCQ3uH6o3BgiJI5qXxgMPvDnKd3LJFN2HWdjsYVAMi9YdhYVUjhDu3GUNORBe8AV7CQC7o0PaWtva
	vewvvyH+5TRSbbtKXTmkz72F6NWA0OFij/bgCEH6YTWDqRQHl+xn6LZMUvQs2DDf7B6BV9n8y+ukb
	/v4Yjd1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSxuU-0000000EK9i-1qlP;
	Tue, 09 Dec 2025 13:37:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSxuR-0000000EK8k-1PuG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 13:37:44 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42e2e77f519so3628686f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 05:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765287461; x=1765892261; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qIKjv/DlcA/ThInIs54WwElR7N7WTwnMgJg790nkIxY=;
        b=SyUtuZZ0ROkW0NVBqelO1et7WfGWywQ+I3N6DckAW8dV8k/mW75Udlq0X2z1IkoNVk
         8HMTj20c5drWvx7Zuy4GXHAiHCKECQB6rJBx1N5holvcSUcZeDj+j+JKhFl7mKI5nNu4
         urVvkZY4dxItWjr4wxZWBMch38F6wpE1rRdozLocJCGV6DlkMMVUiAE1iWO4kzfGxcw6
         3T+myeC6+YJCIGYr5w378itwZflyWywe2O1p2P8vQvCPWLEVv2dAjE9uiwqlk8Bg7KDn
         s964wnuLKj2w7V3a5lzctj3/TLGQsAgjte9E0d5Kb8j/h46FdHpcdxJA2rhVm6jr7YHg
         JkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765287461; x=1765892261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIKjv/DlcA/ThInIs54WwElR7N7WTwnMgJg790nkIxY=;
        b=BM1yu5wL2Z2Hh669wkl5VHZCnOm4IGWc5yJ1RmHoOJ12S/ZiUGbbT0SVYD+vviHVfY
         jLwDYj9htdfEpS/AgHsifLAXUVWzKFdYsPh9hzwfhQsFFdhKtXCEMWQYCOW7iF+fv6Ad
         CETe2CNCQox02Zcgm7Xs50D3wm4CcwtVWSZJBh0h/JXJppogyXXhjbW+WWgl/gPoRM9D
         9O4NcbMq5j6uSNwTo3aTRi8oxATe7wniLC7UZJ5WJVmc4qj2X97EAft2e98RlqXv0ije
         iMY6zBLjcgL7u88fYYhsCZAkehlprrnIVmvtUwTl0Nz9vDHN0ph97acq01/UOup67tZY
         q8/w==
X-Forwarded-Encrypted: i=1; AJvYcCXJqm+S+x4GIrYG7dbpm+iR9o0y/bN/+9HfGfWSUwBjy1In1aFBON7SjHvCm0w4jjS78koyHHvGIqtpPH7swkE0@lists.infradead.org
X-Gm-Message-State: AOJu0YyVd7MWupdni/DW+lljRaUDtyJWrddnjipRTwKFhqsUJYUzF610
	4m5/dz9wBHNHdI/k6V4q/atE7aWjD8nXRIyRtXWdA742QQjN3wmtVse7nuWWtjnnSro=
X-Gm-Gg: AY/fxX5hQ4h+c7ZN1mIUs86elI1eOiT3leE6TsZYVoPZsXpe+5nbp/tqOr7BhlBUy6p
	vc7bVnE1CiENFdj+AsIoT1CuBRm8UEd5Syj+CvWZQ9lpjnkVZbaKVD+HHpt8lFwMfR0E7vcJ0CP
	bUsawQW73RTS+bnkM2T7EbUbivt+QBG3EKEWhu/+EAX0F4FAg8ruTfDaqb4BhFQlDhfKnY50bTK
	VkP/eNlAsOWk+75Uf35VSRhlaxLU9RIY0t0ySsfy9n6XmtQtIsnpK1d9lCl/Twl3HUJeBRC8UMV
	GjLUlu5KNPFtfnflVg0zUHopVB3XxeOurW8UkFfc6mjxDiCm1Ec6uZTHR1M4gAVHD10QfbVId5y
	CZ4iLjRS1N49UtprfPbYrfsqLb5uNtpRy/amDOFvBddeKi/4P4dHge0lUIcSFG8590XZ/sEGdWC
	V1Xi/fYEGThbDyuvyiLVa+JFbObg0=
X-Google-Smtp-Source: AGHT+IHc36kDCLFzZcSvL7RNGxI5IvpysYdqJXouT0/1Mp64sv0XpKo/zZqEWK1kRSMjpMtCqyMjgA==
X-Received: by 2002:a05:6000:1a8d:b0:429:d19f:d959 with SMTP id ffacd0b85a97d-42f89f0c5c4mr12265909f8f.15.1765287461412;
        Tue, 09 Dec 2025 05:37:41 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e62sm31622167f8f.35.2025.12.09.05.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 05:37:40 -0800 (PST)
Message-ID: <a638f74f-94bc-4052-b8e1-e940aca2d4ce@linaro.org>
Date: Tue, 9 Dec 2025 13:37:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/19] coresight: trbe: Refactor AUX flag setting
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
 <20251201-trbe_buffer_refactor_v1-1-v1-7-7da32b076b28@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-7-7da32b076b28@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_053743_440078_60065D6A 
X-CRM114-Status: GOOD (  31.65  )
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



On 01/12/2025 11:21 am, Leo Yan wrote:
> Rather than spreading AUX flag setting in different functions, use
> trbe_get_fault_act() as a central place for setting the flag.
> 
> Later we will support WRAP mode with continuous trace, so the WRAP
> event does not necessarily cause the trace discontinuity, change to
> check the stop status instead.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 38 +++++++++++++---------------
>   1 file changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 28e2bfa68074f19ccaa4a737d00af577aea818fe..b06885a08e082fd34f68d9588518807b5c47c86e 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -265,25 +265,6 @@ static void trbe_reset_local(struct trbe_cpudata *cpudata)
>   	write_sysreg_s(0, SYS_TRBSR_EL1);
>   }
>   
> -static void trbe_report_wrap_event(struct perf_output_handle *handle)
> -{
> -	/*
> -	 * Mark the buffer to indicate that there was a WRAP event by
> -	 * setting the COLLISION flag. This indicates to the user that
> -	 * the TRBE trace collection was stopped without stopping the
> -	 * ETE and thus there might be some amount of trace that was
> -	 * lost between the time the WRAP was detected and the IRQ
> -	 * was consumed by the CPU.
> -	 *
> -	 * Setting the TRUNCATED flag would move the event to STOPPED
> -	 * state unnecessarily, even when there is space left in the
> -	 * ring buffer. Using the COLLISION flag doesn't have this side
> -	 * effect. We only set TRUNCATED flag when there is no space
> -	 * left in the ring buffer.
> -	 */
> -	perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
> -}
> -
>   static void trbe_truncate_event(struct perf_output_handle *handle)
>   {
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
> @@ -687,6 +668,23 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   		goto out_fatal;
>   	}
>   
> +	/*
> +	 * Mark the buffer to indicate that there was a WRAP event by
> +	 * setting the COLLISION flag. This indicates to the user that
> +	 * the TRBE trace collection was stopped without stopping the
> +	 * ETE and thus there might be some amount of trace that was
> +	 * lost between the time the WRAP was detected and the IRQ
> +	 * was consumed by the CPU.
> +	 *
> +	 * Setting the TRUNCATED flag would move the event to STOPPED
> +	 * state unnecessarily, even when there is space left in the
> +	 * ring buffer. Using the COLLISION flag doesn't have this side
> +	 * effect. We only set TRUNCATED flag when there is no space
> +	 * left in the ring buffer.
> +	 */
> +	if (!is_trbe_running(trbsr))
> +		perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
> +

Do we need the complexity of COLLISION (changed to PARTIAL in a later 
commit) and TRUNCATED at the same time?

 From my understanding, TRUNCATED would be when Perf is too slow and we 
want to disable the event for it to catch up, and PARTIAL is when there 
was some buffer error so technically we don't need the event to be 
disabled, but Perf still needs to be notified if we want to start only 
resetting the decoder when a flag is set rather than on all aux records?

There is no happy path where there is a buffer error, so I'm not sure 
why we need the complexity of an extra case? There's no harm in 
disabling the event on a buffer error. Also it's hard to see what the 
exact scenario for PARTIAL is, because we set truncated anyway for fatal 
statuses. The comment in the later commit for the PARTIAL change just 
says "trace was stopped", but not why.

>   	if (is_trbe_wrap(trbsr))
>   		return TRBE_FAULT_ACT_WRAP;
>   
> @@ -878,7 +876,6 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   			goto done;
>   		}
>   
> -		trbe_report_wrap_event(handle);
>   		wrap = true;
>   	}
>   
> @@ -1099,7 +1096,6 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
>   	if (buf->snapshot)
>   		handle->head += size;
>   
> -	trbe_report_wrap_event(handle);
>   	perf_aux_output_end(handle, size);
>   	event_data = perf_aux_output_begin(handle, event);
>   	if (!event_data) {
> 


