Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4CDCCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQaS45ib1uYNqWgIS/krAmhGoRTZgg0tky+KTZ6OzjU=; b=UFzy6/HggHsSUafXM23wvfbsBb
	Sj72vV3fB8HZbXuMsvJFO7yQ15x7nR7mXgsyNlxtDGenmmLvyh4lEbuVbRIYBgJIlOlXxNPfE3c5+
	ITlrRIhh0vPms4bOHwrMVk//AxbpxA0LPznQlA4Cr7K6+mI3PJ8utxqfioqgQ3ntBXCbRYE+zyhQm
	o8ucpznMB+YC4p010M5phSa8VWvW1Z8MKcCC/wIAqBj3px9EHYTP0NJx//2Wv2pjwjH1VUf+bUZz8
	sLrqSkrU056+Vr90AN0qWhgcvZ6PxtOPXvWKuhyLjyIEOclPpGHS7+bH0L2s2taT4W8NPQvLf8dOo
	HtwaS2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkMu-000000078ZI-2HW4;
	Mon, 19 Oct 2026 10:13:24 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkMr-000000078Yx-2OcN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 10:13:22 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1143974f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792404800; x=1793009600; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQaS45ib1uYNqWgIS/krAmhGoRTZgg0tky+KTZ6OzjU=;
        b=CCGwTnrznnt5XK34mfIzNxfZlsGQgvJkO1vSGjUVXLaeJAVNem35xIWsv2xCrAbI02
         VNpecZVM5PrTS/s5dVLzPMUgcRWk2U1aLTH604ehwMux+sYqVMT2EcFppV0ZChQBZQ0f
         LNICnO3f7wyvNtracNQq4eAnJpYC5OcZ4Bd/Zxzimky8zoU1jQuB6GYAXw/7Y4ntOCNm
         8KDmuFrAY7HM3n8dNk+8kGjdQA0UIn7/wXgBv42yqB3NzjBbjIwOMJZo3A+kRCpDEq9k
         xvgj8Kqea7oG1ID4k0/3bRAngQUyMZJRm+plmYJmllieEk4jEmWE+g8bmbPEtN9GBG7u
         Tl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404800; x=1793009600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQaS45ib1uYNqWgIS/krAmhGoRTZgg0tky+KTZ6OzjU=;
        b=ZrIC116QCtcSq6gJaDPuF/t4u5dzxibZLF0A0eWOCkzZe+9vOGaq+MlDAGhdI/LlkF
         MmgPUtfQhh4CIw2KKWOiDs7AdWzaju1LOAW5IGN/jnG7pAyXNqgTaMzB/uGAFjyI3CJU
         sy8N8sxISnpmZpgtqoVcg7U848MsXDZtlDQfUDwzmpqPapRmh1Wa6ikzzCF73dYcL7LX
         5+JAzbKYEs3aSbCtHbT+Vn95zEH62kGnGwuDCSseklxvtZO8izSkpYmA0I9ojGMgkTow
         vkwTYuCF2pgtKX/wlo9cee8ST73v7p/JGHO5/E9NzY5tuasMwbBWAYLW4O3SZqnO1Psm
         Z0QQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgqO4u4lsumDJmN6r0JoHnqZHNq6RoXqJznIxskP/5gYNOaCdKYNbCWFSmEvw12ijxU03NIhfmkI9XZKC/5YT9@lists.infradead.org
X-Gm-Message-State: AFq9FYI1xfkGKKtH+kIE+gyJz0xUSbPszGWnUrwTHI4n6aZpIXjFO8GA
	k8WAOxtDcXdXYM145wsxJdyJaE0CTq7NZIMCzMzKASynG/ykRp/cdZEdtaVzAMxp0H4=
X-Gm-Gg: AYBFou3yPcuVIko6JGQk72zwJ8ik871AfS1cJ5Uc6YTcj6TI0wJPdMlztvtEhOGCZkz
	Nz/Gdz1mX6xZWR4CrTr5HqkVcK0aqqX80bKxOGmAxedgEcpF+9E3IZOEZKwpVwjJu6mHw47Ohov
	rrFc7LhFlJAExMawSV9MVKLoP1PNLOYRctJdQ6wSCwMI9k6lmR83Kuc0xu/SbE6MjtFNutNfpEx
	yZAZ7jLnRUBt+WgdtyG9KS9Fmmgxha1bHAuHEqoX7cImSbh7tc/W5vqWFf4EoeDi5vI/musNNsr
	AwHW7CFGLFx/DmM7VXu6MYIBqgkhUb4a2sQP81c8Z4jwtHa0T/K8E1eVc7AnPjsRI3mqJ432o7p
	Q03gCmGWMZ3+TbXHAbE9juBAeJhKhfZ8jK+ELsRhm61NOQoi/D7Al5fJnDEdYcx1kRlkKxxca+0
	A1C78BcWtf8waqoqM6BXfyjB1mGH51+M5SdXd70rnpyldfx/HbXIrb/+9J9NKGbUsBjWNRkiurn
	Wc=
X-Received: by 2002:a05:6000:1b8f:b0:487:72f:fb41 with SMTP id ffacd0b85a97d-48e07fa0e82mr10206523f8f.39.1792404799491;
        Mon, 19 Oct 2026 03:13:19 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510201sm23032525f8f.55.2026.10.19.03.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:13:19 -0700 (PDT)
Message-ID: <1a8321c1-f8de-4f6c-bf3c-78ccb23a6402@linaro.org>
Date: Mon, 19 Oct 2026 11:13:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/25] coresight: trbe: Use circular buffer mode for
 snapshots
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
 <20260915-arm_cs_support_aux_sample-v1-11-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-11-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_031321_659078_1E767A9B 
X-CRM114-Status: GOOD (  39.97  )
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
> TRBE uses Fill mode for snapshots, stopping trace collection and raising
> a maintenance interrupt at each wrap. Circular buffer mode retains the
> most recent trace without stopping collection or generating wrap
> interrupts.
> 
> Use circular buffer mode for snapshots unless the CPU requires the write
> out-of-range workaround. Keep Fill mode and its guard page on affected
> CPUs. Select the mode on each enable to handle task migration.
> 
> Calculate the minimum known trace advance from the write pointer and the
> WRAP flag, since additional complete laps cannot be counted. Advance the
> AUX head by this amount, then clamp the reported size to one buffer of
> retained trace.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 61 +++++++++++++++++++++-------
>   1 file changed, 47 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index a31f2ebc327cd681344a62de28c0b3840505a9cb..ab3c5c7d27f3d272b07eade1e6452559808b196c 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -69,6 +69,7 @@ struct trbe_buf {
>   	int nr_pages;
>   	void **pages;
>   	bool snapshot;
> +	bool circular;
>   	struct trbe_cpudata *cpudata;
>   };
>   
> @@ -324,9 +325,11 @@ static void trbe_stop_and_truncate_event(struct perf_output_handle *handle)
>    * When the write pointer reaches the address just before the limit pointer, it gets
>    * wrapped around again to the base pointer. This is called a TRBE wrap event, which
>    * generates a maintenance interrupt when operated in WRAP or FILL mode. This driver
> - * uses FILL mode, where the TRBE stops the trace collection at wrap event. The IRQ
> - * handler updates the AUX buffer and re-enables the TRBE with updated WRITE and
> - * LIMIT pointers.
> + * uses FILL mode for non-overwrite buffers, where the TRBE stops trace collection
> + * at a wrap event. The IRQ handler updates the AUX buffer and re-enables the TRBE
> + * with updated WRITE and LIMIT pointers. Snapshot buffers use Circular Buffer
> + * mode where possible, overwriting old trace without stopping or interrupting
> + * the CPU when the write pointer wraps.
>    *
>    *	Wrap around with an IRQ
>    *	------ < ------ < ------- < ----- < -----
> @@ -628,6 +631,7 @@ static void set_trbe_limit_pointer_enabled(struct trbe_buf *buf)
>   {
>   	u64 trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
>   	unsigned long addr = buf->trbe_limit;
> +	u64 mode = buf->circular ? TRBLIMITR_EL1_FM_CBUF : TRBLIMITR_EL1_FM_FILL;
>   
>   	WARN_ON(!IS_ALIGNED(addr, (1UL << TRBLIMITR_EL1_LIMIT_SHIFT)));
>   	WARN_ON(!IS_ALIGNED(addr, PAGE_SIZE));
> @@ -638,15 +642,11 @@ static void set_trbe_limit_pointer_enabled(struct trbe_buf *buf)
>   	trblimitr &= ~TRBLIMITR_EL1_LIMIT_MASK;
>   
>   	/*
> -	 * Fill trace buffer mode is used here while configuring the
> -	 * TRBE for trace capture. In this particular mode, the trace
> -	 * collection is stopped and a maintenance interrupt is raised
> -	 * when the current write pointer wraps. This pause in trace
> -	 * collection gives the software an opportunity to capture the
> -	 * trace data in the interrupt handler, before reconfiguring
> -	 * the TRBE.
> +	 * Circular mode keeps the most recent trace in a snapshot buffer
> +	 * without generating wrap interrupts. Use Fill mode otherwise so
> +	 * the IRQ handler can collect the trace before it is overwritten.
>   	 */
> -	trblimitr |= (TRBLIMITR_EL1_FM_FILL << TRBLIMITR_EL1_FM_SHIFT) &
> +	trblimitr |= (mode << TRBLIMITR_EL1_FM_SHIFT) &
>   		     TRBLIMITR_EL1_FM_MASK;
>   
>   	/*
> @@ -757,6 +757,26 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
>   	return size;
>   }
>   
> +static unsigned long trbe_get_circular_size(struct perf_output_handle *handle,
> +					    struct trbe_buf *buf, u64 status)
> +{
> +	u64 start = PERF_IDX2OFF(handle->head, buf);
> +	u64 write = get_trbe_write_pointer() - buf->trbe_base;
> +
> +	/*
> +	 * WRAP indicates at least one crossing of the limit. Any additional
> +	 * full laps cannot be determined, so account only for the trace
> +	 * known to have been collected. This also preserves the write offset
> +	 * when updating the head.
> +	 */
> +	if (is_trbe_wrap(status))
> +		write += (u64)buf->nr_pages << PAGE_SHIFT;

A wrap in snapshot mode only indicates a crossing of LIMIT, not when 
data past the tail pointer has been overwritten (which is what snapshot 
mode should actually consider as a wrap). For example for a buffer of 
100 bytes, if you write 120 bytes from [head - 10  .. 10] it's marked as 
"wrapped", then:

   size = write + buffer_size - start
   size = 10 + 100 - 90
   size = 20

So it only reports a snapshot size of 20 bytes and the rest of the trace 
is dropped.

The way to detect wraps for snapshot mode would be to set the trigger 
counter to buffer_size, and when it reaches zero you know there has been 
a wrap (overwriting data in the buffer) since the last snapshot, then 
you can use size = buffer_size, otherwise with no wrap detected do the 
calculation above.

I think this is technically a regression because the previous fill mode 
handled both 1x and 2x wrap scenarios properly.

> +	else if (WARN_ON_ONCE(write < start))
> +		return 0;
> +
> +	return write - start;
> +}
> +
>   static void *arm_trbe_alloc_buffer(struct coresight_device *csdev,
>   				   struct perf_event *event, void **pages,
>   				   int nr_pages, bool snapshot)
> @@ -887,14 +907,19 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   		wrap = true;
>   	}
>   
> -	size = trbe_get_trace_size(handle, buf, wrap);
> +	if (buf->circular)
> +		size = trbe_get_circular_size(handle, buf, status);
> +	else
> +		size = trbe_get_trace_size(handle, buf, wrap);
>   
>   done:
>   	local_irq_restore(flags);
>   
>   	if (buf->snapshot)
>   		handle->head += size;
> -	return size;
> +
> +	/* At most one full buffer of trace is available */
> +	return min(size, (unsigned long)buf->nr_pages << PAGE_SHIFT);
>   }
>   
>   
> @@ -973,7 +998,8 @@ static int trbe_apply_work_around_before_enable(struct trbe_buf *buf)
>   	 *  - At trace collection:
>   	 *     - Pad the 256bytes skipped above again with IGNORE packets.
>   	 */
> -	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE)) {
> +	if (!buf->circular &&
> +	    trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE)) {
>   		if (WARN_ON(!IS_ALIGNED(buf->trbe_write, PAGE_SIZE)))
>   			return -EINVAL;
>   		buf->trbe_hw_base = buf->trbe_write;
> @@ -1056,6 +1082,13 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
>   	cpudata->mode = mode;
>   	buf->cpudata = cpudata;
>   
> +	/*
> +	 * A CPU affected by the write out-of-range erratum cannot use circular
> +	 * mode, as the TRBE continues tracing after wrapping and may write out
> +	 * of range. Fall back to FILL mode so the IRQ handler can fix this up.
> +	 */
> +	buf->circular = buf->snapshot && !trbe_may_write_out_of_range(cpudata);
> +
>   	return __arm_trbe_enable(buf, handle);
>   }
>   
> 


