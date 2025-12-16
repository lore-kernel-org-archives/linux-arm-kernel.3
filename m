Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A246D609B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Yc98cLWDNy1eXBoIHvdNFSymFwWhrfu5YKysH37ymk=; b=rpVypO6ty/0E6X7ikG9lcsplcr
	fTj7OcKWh4FkBw5cUHV9hsjZJaTtbhclIEzHUD90l2SNj5bvMGn5vZESS5mxU1QptyIEBs7rv+kbi
	lsP2d37ukFz2GuwgtxE4IPgN06SPYlYTLumsX05eTEV4j6XOaTYjFcvHswZ37eR4fcM03/KO6JGr6
	W1gFTN5477mLGHkTeh2gBSirIWdTYVysVbQ1EJfiSK0J8kmE33Ck3aWlBr9NNcVJiLWeOLiIENbko
	OQuv6xqM2lDlJN9SLlbGq2c5rwH4XqZDvYFrNLRstssqXlPKG6UHhiJGNAPQVmmlhfR7ptNJB8Zjt
	W+pG94AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXbD-00000005VkW-2A7v;
	Tue, 16 Dec 2025 16:08:31 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXb8-00000005Vjn-1Jon
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 16:08:27 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so9552551a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 08:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765901304; x=1766506104; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Yc98cLWDNy1eXBoIHvdNFSymFwWhrfu5YKysH37ymk=;
        b=rKhcL8P8M+WFKdt78Hv7yXJ9CtDjp6RUIB5mbVuXCoxh3k3HuTOQQxMewoLc6NcxCz
         XesYOw9Zkq4x8xJjdOhvBOYTvl8CgnCkW4mf/0MtRMGeyoopo70CYX33xC+WRUo22jbg
         4b0R5RD59wy4JsH9EclQSPF5WCM8H7PgR8TGyV6v3sEbytUks6W4s+D2wLapNOo70EA1
         pTF6BTPedITyx4K0LfwvGtxZViSyML0TWs2V0P3dc0rGiKJFmE7xEQ/qnpekndQy15xz
         7oDEUJm8eiorx5kb1F1jv9kIXDtkFTwlKO1pq8q/fU305R9c5Hvp9cQVq7Ar4pPRBbTt
         0yqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765901304; x=1766506104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Yc98cLWDNy1eXBoIHvdNFSymFwWhrfu5YKysH37ymk=;
        b=dZEdjd0jTmEcRRMNDzAEn2nS/4Tx1xz2r8kHIR8GzqQiXh/GsFuUmCBHCS9XlHS5Xx
         auOInmdQuetTTtdL3/EGpWPBJ+867G8NfHVatAS1L7W6oFfimk8x+gbzd0cwCSGRENaJ
         nv1C3AHT8UsEfEOHCd//zoMYSFGYFGJllERV2jnnXLFkxQoj9RKE2joaB6vhhURDzHLP
         nu9ZBcJQ4aqa5fPoKBo44x8BaNqM0imz4hnNh6y9v7iGRj+avfEcsmjWdS/s59UtW5He
         SpLVwua73kTqW0pF8xEtzillzA2hW8AjUklYjC5GXmnBrnikGZD1VKZZM71IjGNMF6HG
         KR+w==
X-Forwarded-Encrypted: i=1; AJvYcCU0YjBUy2pfNF7bplwEF87mulHqD3LLsDgNlW+GVgUpVbVDb2Ld+Gj/vjBHEJ+MGqCe9I72J81dVJlkxi1/BI61@lists.infradead.org
X-Gm-Message-State: AOJu0YzQfEHpUbztURpYO+i7scujoKpM+exVvVHr7H7p5z+wKLaNqGwM
	/ee4KytYzBSvCKUe2molhhM+8p4NB5//OOuzhf0fG/M/x8B7b73N2x31qX9tmSn/Rru/K77amSU
	Knm28CFajLkAc
X-Gm-Gg: AY/fxX74j6TauTKpg1WDDpYVi0Z+n3IzX2sNR9ISxeksnKW/VF/J0lnGlpmVAG2K3z5
	NGlEpDsYK5Ft285p4w9uhI+ssE5yPewnTN9egAozNtQN6Ee2jJERYTgLno4vpsivuQqifd8xNbE
	ObaQ9sJlzdlAd+jiT3YlL2Q0yfE0MzEPQvRgQqvphmgUDemJPl6cLuMJCft27lm0nxfTs9YtNm/
	PVkIAtkHparL2wuQZDjCdoZ2ublwdmiMH2CH7aT4XCrMwszJD/ak4Z4RD1FDcYgOTDPZu08iqtk
	oKnSmVNgwRKrFofRH587JsFUTsZYILZMToOdg3StWuyGMTEOF9I7K+2U1edmiX84J+GCy/8b8H/
	FvLLQmB6I+buijqEwpGMvgzDjeXywVwltumh7V37q2/TfrXdNbJGaNRWQZbHO+Na6bSQQ36mIWZ
	s9fyG49V4ndWi3LqARhybz
X-Google-Smtp-Source: AGHT+IGoXFodqKaN2YW+blhloOPWonYoIEfQwookHr2zJuDPQoF57J1VfykD2dCWz+T56g8wMnyRng==
X-Received: by 2002:a05:6402:42c8:b0:647:a127:7c1e with SMTP id 4fb4d7f45d1cf-6499b1fa9demr14895891a12.20.1765901304181;
        Tue, 16 Dec 2025 08:08:24 -0800 (PST)
Received: from [192.168.0.108] ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210fd0csm16496547a12.25.2025.12.16.08.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 08:08:23 -0800 (PST)
Message-ID: <0b381f5b-66a4-4407-9b91-18ecc28b3695@linaro.org>
Date: Tue, 16 Dec 2025 18:08:21 +0200
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
X-CRM114-CacheID: sfid-20251216_080826_437941_D5C677E6 
X-CRM114-Status: GOOD (  50.54  )
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

I think some of the existing comments and diagrams need to be updated 
for wrap mode. For example this one isn't true anymore:

   neither an wrap around nor an IRQ is expected while being enabled.

It's quite hard to make sense of the comments in __trbe_normal_offset() 
because they don't even mention the new mode of operation because they 
were written before it. But when reading them they appear to describe 
definitively how the buffer works.

Also these diagrams in the commit message are inconsistent with the 
existing ones that use #### for free instead of blank. Personally I 
prefer blank for free as I don't have to keep going back to the legend 
to see which one is free. Same for the kunit tests.

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
>   
> +out:
>   	/*
>   	 * There is a situation when this can happen i.e limit is before
>   	 * the head and hence TRBE cannot be configured.
> @@ -518,6 +525,39 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
>   	return 0;
>   }
>   
> +static u64 __trbe_normal_trigger_count(struct perf_output_handle *handle)
> +{
> +	struct trbe_buf *buf = etm_perf_sink_config(handle);
> +	struct trbe_cpudata *cpudata = buf->cpudata;
> +	u64 limit, head, wakeup;
> +	u64 count = 0;
> +
> +	if (static_branch_unlikely(&trbe_trigger_mode_bypass))
> +		return 0;
> +
> +	limit = buf->trbe_limit - buf->trbe_base;
> +	head = PERF_IDX2OFF(handle->head, buf);
> +	wakeup = PERF_IDX2OFF(handle->wakeup, buf);
> +
> +	/* Set the count to guard the end of free buffer after wrap around */
> +	if (limit == buf->nr_pages * PAGE_SIZE && (head + handle->size) > limit)
> +		count = handle->size;
> +
> +	/*
> +	 * If the watermark is less than the limit, use the trigger count for
> +	 * the watermark maintenance.
> +	 */
> +	if (handle->wakeup < (handle->head + handle->size) && head <= wakeup) {
> +		u64 wakeup_count =
> +			round_up(wakeup - head, cpudata->trbe_hw_align);
> +
> +		if (head + wakeup_count < limit)
> +			count = wakeup_count;
> +	}
> +
> +	return count;
> +}
> +
>   static int trbe_normal_offset(struct perf_output_handle *handle)
>   {
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
> @@ -542,6 +582,7 @@ static int trbe_normal_offset(struct perf_output_handle *handle)
>   		return -ENOSPC;
>   
>   	buf->trbe_limit = buf->trbe_base + limit;
> +	buf->trbe_count = __trbe_normal_trigger_count(handle);
>   	return 0;
>   }
>   
> @@ -594,24 +635,40 @@ static void set_trbe_limit_pointer_enabled(struct trbe_buf *buf)
>   	trblimitr &= ~TRBLIMITR_EL1_TM_MASK;
>   	trblimitr &= ~TRBLIMITR_EL1_LIMIT_MASK;
>   
> -	/*
> -	 * Fill trace buffer mode is used here while configuring the
> -	 * TRBE for trace capture. In this particular mode, the trace
> -	 * collection is stopped and a maintenance interrupt is raised
> -	 * when the current write pointer wraps. This pause in trace
> -	 * collection gives the software an opportunity to capture the
> -	 * trace data in the interrupt handler, before reconfiguring
> -	 * the TRBE.
> -	 */
> -	trblimitr |= (TRBLIMITR_EL1_FM_FILL << TRBLIMITR_EL1_FM_SHIFT) &
> -		     TRBLIMITR_EL1_FM_MASK;
> +	if (!buf->trbe_count ||
> +	    buf->trbe_write + buf->trbe_count == buf->trbe_limit) {
> +		/*
> +		 * Fill trace buffer mode is used here while configuring the
> +		 * TRBE for trace capture. In this particular mode, the trace
> +		 * collection is stopped and a maintenance interrupt is raised
> +		 * when the current write pointer wraps. This pause in trace
> +		 * collection gives the software an opportunity to capture the
> +		 * trace data in the interrupt handler, before reconfiguring
> +		 * the TRBE.
> +		 */
> +		trblimitr |= FIELD_PREP(TRBLIMITR_EL1_FM_MASK, TRBLIMITR_EL1_FM_FILL) |
> +			     FIELD_PREP(TRBLIMITR_EL1_TM_MASK, TRBLIMITR_EL1_TM_IGNR);

I thought there were only two modes required: Wrap with trigger stop or 
Fill with trigger IRQ. What's this first one for? Is this to support the 
errata cases where the trigger counter isn't used?

> +	} else if (buf->trbe_write + buf->trbe_count < buf->trbe_limit) {
> +		/*
> +		 * Fill mode is used here to stop trace collection and prevent
> +		 * the buffer from being overwritten. Trigger mode continues
> +		 * trace collection and raises a maintenance interrupt on a
> +		 * trigger event, which acts as a watermark for notifying
> +		 * userspace.
> +		 */
> +		trblimitr |= FIELD_PREP(TRBLIMITR_EL1_FM_MASK, TRBLIMITR_EL1_FM_FILL) |
> +			     FIELD_PREP(TRBLIMITR_EL1_TM_MASK, TRBLIMITR_EL1_TM_IRQ);
> +	} else if (buf->trbe_write + buf->trbe_count > buf->trbe_limit) {
> +		/*
> +		 * Wrap buffer mode continues trace collection and raises
> +		 * maintenance interrupt on buffer wrap. Trigger mode stops
> +		 * trace on trigger event to guard the buffer from being
> +		 * overwritten.
> +		 */
> +		trblimitr |= FIELD_PREP(TRBLIMITR_EL1_FM_MASK, TRBLIMITR_EL1_FM_WRAP) |
> +			     FIELD_PREP(TRBLIMITR_EL1_TM_MASK, TRBLIMITR_EL1_TM_STOP);
> +	}

Can you document what the case is for a final else here, even if there's 
no code? Or should it even be a WARN()?

>   
> -	/*
> -	 * Trigger mode is not used here while configuring the TRBE for
> -	 * the trace capture. Hence just keep this in the ignore mode.
> -	 */
> -	trblimitr |= (TRBLIMITR_EL1_TM_IGNR << TRBLIMITR_EL1_TM_SHIFT) &
> -		     TRBLIMITR_EL1_TM_MASK;
>   	trblimitr |= (addr & PAGE_MASK);
>   	set_trbe_enabled(buf->cpudata, trblimitr);
>   }
> @@ -623,6 +680,7 @@ static void trbe_enable_hw(struct trbe_buf *buf)
>   	WARN_ON(buf->trbe_write >= buf->trbe_limit);
>   	set_trbe_base_pointer(buf->trbe_hw_base);
>   	set_trbe_write_pointer(buf->trbe_write);
> +	set_trbe_trigger_count(buf->trbe_count);
>   
>   	/*
>   	 * Synchronize all the register updates
> @@ -639,8 +697,6 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   	int ec = get_trbe_ec(trbsr);
>   	int bsc = get_trbe_bsc(trbsr);
>   
> -	WARN_ON(is_trbe_running(trbsr));
> -
>   	if (is_trbe_abort(trbsr)) {
>   		err_str = "External abort";
>   		goto out_fatal;
> @@ -672,8 +728,7 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   	case TRBE_BSC_FILLED:
>   		break;
>   	case TRBE_BSC_TRIGGERED:
> -		err_str = "Unexpected trigger status";
> -		goto out_fatal;
> +		break;
>   	default:
>   		err_str = "Unexpected buffer status code";
>   		goto out_fatal;
> @@ -692,6 +747,9 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   	if (is_trbe_wrap(trbsr))
>   		return TRBE_FAULT_ACT_WRAP;
>   
> +	if (is_trbe_trg(trbsr))
> +		return TRBE_FAULT_ACT_TRIG;
> +
>   	return TRBE_FAULT_ACT_SPURIOUS;
>   
>   out_fatal:
> @@ -1180,6 +1238,7 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   		clr_trbe_status();
>   
>   	switch (act) {
> +	case TRBE_FAULT_ACT_TRIG:
>   	case TRBE_FAULT_ACT_WRAP:
>   		truncated = !!trbe_handle_overflow(handle, act);
>   		break;
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.h b/drivers/hwtracing/coresight/coresight-trbe.h
> index d7f7cd763c0c7139cf322b7336ee563073e3bea0..4c65d164a946ec9860825e7564196745b60d730b 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.h
> +++ b/drivers/hwtracing/coresight/coresight-trbe.h
> @@ -114,6 +114,20 @@ static inline void set_trbe_write_pointer(unsigned long addr)
>   	write_sysreg_s(addr, SYS_TRBPTR_EL1);
>   }
>   
> +static inline void set_trbe_trigger_count(unsigned long count)
> +{
> +	u64 trbsr;
> +
> +	write_sysreg_s(count, SYS_TRBTRG_EL1);
> +
> +	/* TRBSR_EL1.TRG has been cleared in clr_trbe_status() */
> +	if (!count)
> +		return;
> +
> +	trbsr = read_sysreg_s(SYS_TRBSR_EL1);
> +	write_sysreg_s(trbsr | TRBSR_EL1_TRG, SYS_TRBSR_EL1);
> +}
> +
>   static inline unsigned long get_trbe_limit_pointer(void)
>   {
>   	u64 trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
> 


