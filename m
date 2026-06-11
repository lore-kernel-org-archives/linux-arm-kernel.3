Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A2DCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4jYOI1ytBaH/KvrNBwszKXOejxemu3+HMwBrWYzf4Q=; b=KR5mkckbk3N/YjMOgbpqMGSVfV
	skefYXK0Pi8wBPI/yTF/O3UvVD8n9BS3lYOtjuUHaHcwNhXnBvsQIUiQ+B6MMMpmS0anETfOLqTwe
	skO/uZwpTB54TlMN8cqjUN45LyskUvsx9LUQVK8rAF9+0EOMrlp9cmh5/z8ixjPWUXXDCYYg6SwbG
	eZYe52QHFXBBC1Rcs5FDQ0lEW3AEf1aIUxo6AMurHNk1jGRtvshuH746id8ItZpbGeUvUvOEM54L8
	MUj9T96U+CkmN8HTZalAkO5Su9k+AVVvqGeO4LlNRgqw5A/OMPDCneXVZ3tzc05P5b/KCCvQRT9jB
	HUbR5nwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbIC-0000000953a-051O;
	Thu, 11 Jun 2026 09:01:40 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbI9-0000000953D-28mW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 09:01:38 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so1780625a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 02:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781168495; x=1781773295; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x4jYOI1ytBaH/KvrNBwszKXOejxemu3+HMwBrWYzf4Q=;
        b=nENKJBS/H5tN/ucP0wMXe/SjnBu7vn2bb19Wp6Go/TRc2x4joGzHudS+3KLRxTieLB
         8vaFn/zZqtOFIInCoZufaTLpEqOjHi6FSfJkMUuFUzIJ27HybMFapMPnUepve+hyZItt
         qsvQG/sUMKKme2l8XFMQ2nBi8mhR0y7nJhkav3wITTbPLuqZeuR8qmpXEBLYbWmrQYG1
         B5wqZCWoIPZr8YDtfhf/tk7rYR46XqpHP7bx420nRIog5bBYbZZvSSufDQSZRbbwr3Fm
         yxVr9UKq8XoFvcGPkU03xbOsx4+VIUl4wPsZYihYvoQ3WK6N14aURmabo9JeUfd3TyNW
         kGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168495; x=1781773295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4jYOI1ytBaH/KvrNBwszKXOejxemu3+HMwBrWYzf4Q=;
        b=T5B8RUC7yg4gtS/aPRjiU+S1IF/14uFSSxd53h5Y412oAndAY6Ff5eejKmkML8NZiR
         1jWrom5/qNbcwNxbIvKnaePsNY1QhFqNjLSfK4H8LE9LDS338VowfzD+m5OC67Cz0wH2
         OJFWwZphJMHBH+/XK1+GttiS+54UGw3QquxPfszPb/Q4O50IdZDcuaDvkFLJ19GJzDMx
         n1lUlWI8c7Q6SGibpG6sMoT0ISGKjF6Fvp2cBaD+hZVc9AsINjcjOyzbk55edwy8S2tL
         WGjVN08nyCCMK0sNQKu2zstRhW8Q6QLRy50cMEWS5iDtdzZ/YrDf37s5c7ctYFFWB3Vr
         8y2Q==
X-Gm-Message-State: AOJu0YzbbFVex1P1DoN8k+ydmEd2YkRh+DJxJrjRdVYludwEtznIY4yy
	oOtYqjywNzYqaKBmBBvaVwa/RAN0J2stYxRc2suWkAQpHH9w0CNqzkjNGa+TTlNI44k=
X-Gm-Gg: Acq92OEQBZjQ63QkEO0KekNeTHGFgS2tnPpaYvUz/aRL1gVQ0K2/mfYtYio8uAxf6Ub
	zGHNyXa40fghtDcMCh9jdLl2tW4iEFzEdwGDr9tF0NJ90uPAfwaT6My0TSC/LPkDldDBjgaU1rl
	thV9HH4ZHHdXLuyfKubswenoMZtcDcHYMKUpqJiNEfA8r9XHh/r4yc9nbUKE20z4fMCX/e6PF5c
	CU/lx45KBudghoSvVmZug5p3rWpncxl9LoLEGeIY2958Tqn1BiJ15Go3nJkqaZHB8GpQb8kD7Zg
	Z7qg/TQzg7CyKi205lXJAr/8xKA8FGqtay96jJkhXmJKndmXFjm77fER/wYstIVBxCZ+gUpiBPE
	ZxJJNiSlmco+5whUvzxn2tJOlmbWnyaq86lAPh4tYxXcw8tGfY7a0t1J4VwGX3e0y5Jzp2K4cG0
	CcRzQwayO+z9Hlioy/gzMb/0E+acGkAGvUmXJK21A=
X-Received: by 2002:a05:6402:913:b0:662:ac7e:aac9 with SMTP id 4fb4d7f45d1cf-6930e2d0326mr857408a12.20.1781168495474;
        Thu, 11 Jun 2026 02:01:35 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b4d988sm10647298a12.25.2026.06.11.02.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:01:35 -0700 (PDT)
Message-ID: <896279e2-eded-4388-afb9-0a633404928b@linaro.org>
Date: Thu, 11 Jun 2026 10:01:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/8] perf cs-etm: Use thread-stack for last branch
 entries
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo
 <acme@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Mike Leach <mike.leach@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Namhyung Kim
 <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>,
 Paschalis Mpeis <paschalis.mpeis@arm.com>, Amir Ayupov <aaupov@fb.com>
References: <20260611-b4-arm_cs_callchain_support_v1-v7-0-1ba770c862ae@arm.com>
 <20260611-b4-arm_cs_callchain_support_v1-v7-4-1ba770c862ae@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260611-b4-arm_cs_callchain_support_v1-v7-4-1ba770c862ae@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_020137_621294_26D7E7CF 
X-CRM114-Status: GOOD (  41.12  )
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



On 11/06/2026 8:56 am, Leo Yan wrote:
> CS ETM maintains its own circular array for last branch entries, with
> local helpers to update, copy and reset the branch stack. This
> duplicates logic already provided by the common code.
> 
> Record taken branches with thread_stack__event() and synthesize
> PERF_SAMPLE_BRANCH_STACK data with thread_stack__br_sample(). This
> removes the private last_branch_rb buffer and its position tracking.
> 
> This also makes the branch history state belong to the thread rather
> than the trace queue. That is a better fit for CoreSight traces where
> a trace queue can effectively be CPU scoped, while call/return history
> is per thread.
> 
> Keep the buffer number updated via thread_stack__set_trace_nr(), which
> is used when exporting samples to Python scripts. Pass callstack=false
> for now; synthesized callchains are added by a later patch.
> 
> The output should remain same, except that be->flags.predicted is no
> longer set. Since CoreSight trace does not provide branch prediction
> information, clearing the flag avoids confusion.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>


Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   tools/perf/util/cs-etm.c | 159 ++++++++++++++---------------------------------
>   1 file changed, 46 insertions(+), 113 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 4127120459418389ca7aabb9a49dead2b50e7533..8798bf0471faf3b1813780b45c588263ff6b4416 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -84,10 +84,9 @@ struct cs_etm_auxtrace {
>   struct cs_etm_traceid_queue {
>   	u8 trace_chan_id;
>   	u64 period_instructions;
> -	size_t last_branch_pos;
>   	union perf_event *event_buf;
> +	unsigned int br_stack_sz;
>   	struct branch_stack *last_branch;
> -	struct branch_stack *last_branch_rb;
>   	struct cs_etm_packet *prev_packet;
>   	struct cs_etm_packet *packet;
>   	struct cs_etm_packet_queue packet_queue;
> @@ -644,9 +643,8 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
>   		tidq->last_branch = zalloc(sz);
>   		if (!tidq->last_branch)
>   			goto out_free;
> -		tidq->last_branch_rb = zalloc(sz);
> -		if (!tidq->last_branch_rb)
> -			goto out_free;
> +
> +		tidq->br_stack_sz = etm->synth_opts.last_branch_sz;
>   	}
>   
>   	tidq->event_buf = malloc(PERF_SAMPLE_MAX_SIZE);
> @@ -656,7 +654,6 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
>   	return 0;
>   
>   out_free:
> -	zfree(&tidq->last_branch_rb);
>   	zfree(&tidq->last_branch);
>   	zfree(&tidq->prev_packet);
>   	zfree(&tidq->packet);
> @@ -939,7 +936,6 @@ static void cs_etm__free_traceid_queues(struct cs_etm_queue *etmq)
>   		thread__zput(tidq->decode_thread);
>   		zfree(&tidq->event_buf);
>   		zfree(&tidq->last_branch);
> -		zfree(&tidq->last_branch_rb);
>   		zfree(&tidq->prev_packet);
>   		zfree(&tidq->packet);
>   		zfree(&tidq);
> @@ -1299,57 +1295,6 @@ static int cs_etm__queue_first_cs_timestamp(struct cs_etm_auxtrace *etm,
>   	return ret;
>   }
>   
> -static inline
> -void cs_etm__copy_last_branch_rb(struct cs_etm_queue *etmq,
> -				 struct cs_etm_traceid_queue *tidq)
> -{
> -	struct branch_stack *bs_src = tidq->last_branch_rb;
> -	struct branch_stack *bs_dst = tidq->last_branch;
> -	size_t nr = 0;
> -
> -	/*
> -	 * Set the number of records before early exit: ->nr is used to
> -	 * determine how many branches to copy from ->entries.
> -	 */
> -	bs_dst->nr = bs_src->nr;
> -
> -	/*
> -	 * Early exit when there is nothing to copy.
> -	 */
> -	if (!bs_src->nr)
> -		return;
> -
> -	/*
> -	 * As bs_src->entries is a circular buffer, we need to copy from it in
> -	 * two steps.  First, copy the branches from the most recently inserted
> -	 * branch ->last_branch_pos until the end of bs_src->entries buffer.
> -	 */
> -	nr = etmq->etm->synth_opts.last_branch_sz - tidq->last_branch_pos;
> -	memcpy(&bs_dst->entries[0],
> -	       &bs_src->entries[tidq->last_branch_pos],
> -	       sizeof(struct branch_entry) * nr);
> -
> -	/*
> -	 * If we wrapped around at least once, the branches from the beginning
> -	 * of the bs_src->entries buffer and until the ->last_branch_pos element
> -	 * are older valid branches: copy them over.  The total number of
> -	 * branches copied over will be equal to the number of branches asked by
> -	 * the user in last_branch_sz.
> -	 */
> -	if (bs_src->nr >= etmq->etm->synth_opts.last_branch_sz) {
> -		memcpy(&bs_dst->entries[nr],
> -		       &bs_src->entries[0],
> -		       sizeof(struct branch_entry) * tidq->last_branch_pos);
> -	}
> -}
> -
> -static inline
> -void cs_etm__reset_last_branch_rb(struct cs_etm_traceid_queue *tidq)
> -{
> -	tidq->last_branch_pos = 0;
> -	tidq->last_branch_rb->nr = 0;
> -}
> -
>   static inline int cs_etm__t32_instr_size(struct cs_etm_queue *etmq,
>   					 struct cs_etm_traceid_queue *tidq,
>   					 struct cs_etm_packet *packet, u64 addr)
> @@ -1419,38 +1364,6 @@ static inline u64 cs_etm__instr_addr(struct cs_etm_queue *etmq,
>   	return addr;
>   }
>   
> -static void cs_etm__update_last_branch_rb(struct cs_etm_queue *etmq,
> -					  struct cs_etm_traceid_queue *tidq)
> -{
> -	struct branch_stack *bs = tidq->last_branch_rb;
> -	struct branch_entry *be;
> -
> -	/*
> -	 * The branches are recorded in a circular buffer in reverse
> -	 * chronological order: we start recording from the last element of the
> -	 * buffer down.  After writing the first element of the stack, move the
> -	 * insert position back to the end of the buffer.
> -	 */
> -	if (!tidq->last_branch_pos)
> -		tidq->last_branch_pos = etmq->etm->synth_opts.last_branch_sz;
> -
> -	tidq->last_branch_pos -= 1;
> -
> -	be       = &bs->entries[tidq->last_branch_pos];
> -	be->from = cs_etm__last_executed_instr(tidq->prev_packet);
> -	be->to	 = cs_etm__first_executed_instr(tidq->packet);
> -	/* No support for mispredict */
> -	be->flags.mispred = 0;
> -	be->flags.predicted = 1;
> -
> -	/*
> -	 * Increment bs->nr until reaching the number of last branches asked by
> -	 * the user on the command line.
> -	 */
> -	if (bs->nr < etmq->etm->synth_opts.last_branch_sz)
> -		bs->nr += 1;
> -}
> -
>   static int cs_etm__inject_event(struct cs_etm_auxtrace *etm, union perf_event *event,
>   			       struct perf_sample *sample, u64 type)
>   {
> @@ -1614,6 +1527,42 @@ static inline u64 cs_etm__resolve_sample_time(struct cs_etm_queue *etmq,
>   		return etm->latest_kernel_timestamp;
>   }
>   
> +static bool cs_etm__packet_has_taken_branch(struct cs_etm_packet *packet)
> +{
> +	if (packet->sample_type == CS_ETM_RANGE &&
> +	    packet->last_instr_taken_branch)
> +		return true;
> +
> +	return false;
> +}
> +
> +static void cs_etm__add_stack_event(struct cs_etm_queue *etmq,
> +				    struct cs_etm_traceid_queue *tidq)
> +{
> +	u64 from, to;
> +	int size;
> +
> +	if (!cs_etm__packet_has_taken_branch(tidq->prev_packet))
> +		return;
> +
> +	if (etmq->etm->synth_opts.last_branch) {
> +		from = cs_etm__last_executed_instr(tidq->prev_packet);
> +		to = cs_etm__first_executed_instr(tidq->packet);
> +
> +		size = cs_etm__instr_size(etmq, tidq, tidq->prev_packet, from);
> +
> +		/* Enable callchain so thread stack entry can be allocated */
> +		thread_stack__event(tidq->frontend_thread, tidq->prev_packet->cpu,
> +				    tidq->prev_packet->flags, from, to, size,
> +				    etmq->buffer->buffer_nr + 1, false,
> +				    tidq->br_stack_sz, 0);
> +	} else {
> +		thread_stack__set_trace_nr(tidq->frontend_thread,
> +					   tidq->prev_packet->cpu,
> +					   etmq->buffer->buffer_nr + 1);
> +	}
> +}
> +
>   static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,
>   					    struct cs_etm_traceid_queue *tidq,
>   					    struct cs_etm_packet *packet,
> @@ -1644,8 +1593,11 @@ static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,
>   
>   	cs_etm__copy_insn(etmq, tidq, packet, &sample);
>   
> -	if (etm->synth_opts.last_branch)
> +	if (etm->synth_opts.last_branch) {
> +		thread_stack__br_sample(tidq->frontend_thread, tidq->packet->cpu,
> +					tidq->last_branch, tidq->br_stack_sz);
>   		sample.branch_stack = tidq->last_branch;
> +	}
>   
>   	if (etm->synth_opts.inject) {
>   		ret = cs_etm__inject_event(etm, event, &sample,
> @@ -1836,14 +1788,7 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
>   
>   	tidq->period_instructions += tidq->packet->instr_count;
>   
> -	/*
> -	 * Record a branch when the last instruction in
> -	 * PREV_PACKET is a branch.
> -	 */
> -	if (etm->synth_opts.last_branch &&
> -	    tidq->prev_packet->sample_type == CS_ETM_RANGE &&
> -	    tidq->prev_packet->last_instr_taken_branch)
> -		cs_etm__update_last_branch_rb(etmq, tidq);
> +	cs_etm__add_stack_event(etmq, tidq);
>   
>   	if (etm->synth_opts.instructions &&
>   	    tidq->period_instructions >= etm->instructions_sample_period) {
> @@ -1902,10 +1847,6 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
>   		u64 offset = etm->instructions_sample_period - instrs_prev;
>   		u64 addr;
>   
> -		/* Prepare last branches for instruction sample */
> -		if (etm->synth_opts.last_branch)
> -			cs_etm__copy_last_branch_rb(etmq, tidq);
> -
>   		while (tidq->period_instructions >=
>   				etm->instructions_sample_period) {
>   			/*
> @@ -1936,8 +1877,7 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
>   			generate_sample = true;
>   
>   		/* Generate sample for branch taken packet */
> -		if (tidq->prev_packet->sample_type == CS_ETM_RANGE &&
> -		    tidq->prev_packet->last_instr_taken_branch)
> +		if (cs_etm__packet_has_taken_branch(tidq->prev_packet))
>   			generate_sample = true;
>   
>   		if (generate_sample) {
> @@ -1985,10 +1925,6 @@ static int cs_etm__flush(struct cs_etm_queue *etmq,
>   	    etmq->etm->synth_opts.instructions &&
>   	    tidq->prev_packet->sample_type == CS_ETM_RANGE) {
>   		u64 addr;
> -
> -		/* Prepare last branches for instruction sample */
> -		cs_etm__copy_last_branch_rb(etmq, tidq);
> -
>   		/*
>   		 * Generate a last branch event for the branches left in the
>   		 * circular buffer at the end of the trace.
> @@ -2020,7 +1956,7 @@ static int cs_etm__flush(struct cs_etm_queue *etmq,
>   
>   	/* Reset last branches after flush the trace */
>   	if (etm->synth_opts.last_branch)
> -		cs_etm__reset_last_branch_rb(tidq);
> +		thread_stack__flush(tidq->frontend_thread);
>   
>   	return err;
>   }
> @@ -2044,9 +1980,6 @@ static int cs_etm__end_block(struct cs_etm_queue *etmq,
>   	    tidq->prev_packet->sample_type == CS_ETM_RANGE) {
>   		u64 addr;
>   
> -		/* Prepare last branches for instruction sample */
> -		cs_etm__copy_last_branch_rb(etmq, tidq);
> -
>   		/*
>   		 * Use the address of the end of the last reported execution
>   		 * range.
> 


