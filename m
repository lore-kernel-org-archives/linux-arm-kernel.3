Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C1BC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Np9yEDd+Fd0yibinPh7hdB9+c/izEVyAROGDkoU/Abk=; b=yrORT/3BAv+KJEnVydypYJGAhG
	BR9FLece/7rikpp/vSbGXWrHCcNA2yAtw0xTH59Z7MU/XTkRxglano9z/BaSXPfDHb+sr19zL77EJ
	5ew+YPrpjhr1BtAqK1eR/HVtJP39Q0K94Y1gNkGZqGIPgLe6DAeITj1BtWfaM6s+M/IAcFQWSJ4Cm
	89y9RlpbX5dsXCtZxazrQbuxqd/t7c2o1Q8X1Adozi6B6qHlLrTdt1rLGTmBmcNEZ4sFhCcJvtf0b
	f5eScTGP/XlujumexxQKWJo0r0zbqf7PQeoz4mpspsEEIE5xqwK8YgRSqkH8+98zlcHBmemYfBJIU
	fv5awTQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLRw-00000008Eap-3s8h;
	Tue, 18 Aug 2026 15:10:00 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLRt-00000008EZr-3x6b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 15:09:59 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c2020421077so772897266b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 08:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787065796; x=1787670596; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Np9yEDd+Fd0yibinPh7hdB9+c/izEVyAROGDkoU/Abk=;
        b=N2rhVoXubGC6jwid88JqPAPi5NBfNFfojYjzB9en905exZ8fYKJClFiECUhx6CdVqK
         OPSQ3jxszu/+CiEPyAuqxG3re4co5ahnjNiyFKzANW9UwdmbBdYj9A8ntsoZPcvVoLbH
         jKDDDe27h9NTRgzQecIHRpjAB9fPlvEc6Oj2pVtzT/vYOZFjxTVMcbH4ZZzn8u6Ts8kV
         gzb3jJ9WKdpgoZNM40IvgRfKJba/+LLBBU08zsPOf9upwVxwmKOPT7uM/6XPGdSoHdt+
         MJ7RB6/zRT7Eqx9uHMzOTZgXDfxn0+w0S55KlSAdp9c0CFLe8wPw88uvocXYgboNX6zX
         v7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787065796; x=1787670596;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Np9yEDd+Fd0yibinPh7hdB9+c/izEVyAROGDkoU/Abk=;
        b=ZXKP1cu+ObezDtMyDvHCVRNyJBo9yVxXEdWMF5pTSIiSvyaNi3xcatql4qKEjIUunl
         nYm91NkZlxYCxzagk7H4QADBN/puxYGubWn1buBQhcRdNfkgfu1h5LrhbHOqqsNsEJah
         ev/PuICvxCV5eUG2ree2TaEsRfqid2A6VMgI6v6if7lngS/F07k7OU+gL4L5qZgjq6zI
         3t468jWpc/sktVopNa33Ll+6DKdUnciG6l7R2e/gYgq7SFChHx48sAQSMeaf7AOSqvT4
         66NU9RYVdlerOYxqi56Pm0aAxjgctNy9WC98slVgUy3PBNaoaVxFZg8u4dqG76vfOrlC
         xoXw==
X-Forwarded-Encrypted: i=1; AHgh+Rpb1+wmGSZR+/SNbAOiZfCC7Utc/J0UKIsp0dfKRcpd6L/C94PCE8+aR5X5FSexFv1Sz+uXnc6MRmm/SO4KHv3v@lists.infradead.org
X-Gm-Message-State: AOJu0YyloCEbEbFb6w4cDxLfEzFHZ4VhERtP75D+WPAigaAWwgbEJv/D
	wk0YGvVW4anYljqaQGEKTv5cUt1g+ddM+AORcblmI2Xs5B27ReI8L6tWOYt+fFJ3E0w=
X-Gm-Gg: AR+sD12gXYj2OkTfhWPtMvALONpRr5Mz4h/rAsveSn62oKNVLqJegxznVyLtm/JIH4n
	cV8Pvu6MObCFetCA1y1nCzwicI2t/Nsz5uqJLjJDiXZCdh7F1c3Ko3rDR8c4k8idRLMym/BhXBX
	Tb8ZHOppiCLB+dwbbU5wiaxKZ644pN0WMW0r8lGbVg6DyLhmID6wgoZQisEzgowoMNoa7qKEUId
	DzAOTdmEKmqbTfatLta+h6JyrUELnDtdyVPsOCzsehSLk+U5hmGaEMKkbwCqn642b2i3JOrVK2y
	TvhT42bQ9pVD7t1Lqay5Ta5QB43opmYJxwgq4WHlLlbc2+zyjbDHCsaRSE26GvnyWltV/l59DsE
	ABQ/S81wZphUS8HhVPAHXp/Ile9nH5YYUu++EJbwBDv42qGi/DUuCkx33gOcT+j0BSJSJpyyZcA
	NcpTFO+SVPmV+NpAoL9D9SxC5mMGkduoUYqd03Fwjc+qb/Hu4ytvdBOcF9mCBi8uLeNQ==
X-Received: by 2002:a05:6938:a08d:20b0:c21:49df:1650 with SMTP id a640c23a62f3a-c2149df299fmr965482666b.8.1787065795586;
        Tue, 18 Aug 2026 08:09:55 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea1e64sm211199866b.21.2026.08.18.08.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 08:09:55 -0700 (PDT)
Message-ID: <f40e4f98-d6eb-44d6-8229-0afdfcc0caf6@linaro.org>
Date: Tue, 18 Aug 2026 16:09:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] perf cs-etm: Add branch history to existing
 samples
To: Amir Ayupov <aaupov@fb.com>
Cc: linux-doc@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Swapnil Sapkal <swapnil.sapkal@amd.com>, linux-perf-users@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, John Garry
 <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>
References: <cover.1787005265.git.aaupov@fb.com>
 <454bc49f51eeef9f758fc2d2c7af75889d8aff46.1787005265.git.aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <454bc49f51eeef9f758fc2d2c7af75889d8aff46.1787005265.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_080958_147759_02AB5A3B 
X-CRM114-Status: GOOD (  45.28  )
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



On 17/08/2026 23:22, Amir Ayupov wrote:
> Implement --itrace=L for CoreSight ETM: decode timestamped trace up to
> each existing PMU sample and attach the branch history that led to it.
> The sample keeps its own ip, callchain and event identity, and a sample
> that already carries a branch stack is left alone.
> 
> Samples are correlated with the trace by time, so this requires virtual
> ETM timestamps that are correlated to perf time; timeless decoding is
> rejected. The decode loop, which the previous patch left on its own in
> cs_etm__process_timestamped_queues(), grows a timestamp argument and
> stops once the decode frontier reaches it, so on return the
> thread stack holds the branches that executed before the sample and none
> that executed after. Attaching then reduces to the same
> thread_stack__br_sample_late() call intel-pt uses.
> 
> No explicit sample-to-queue matching is needed:
> thread_stack__br_sample_late() keys on the thread, and the thread stack
> is already emptied whenever the decoder reports a discontinuity. The one
> case that was not covered is a queue whose trace runs out: flush the
> thread stack there too, otherwise samples recorded after the last trace
> would pick up stale history.
> 
> Take the branch history when attaching it rather than leaving it in the
> thread stack. With AUX pause and resume, a pause sample ends a completed
> trace window and that window belongs to the sample. Execution while AUX
> is paused is not traced, so retaining the window would let a later sample
> reuse branches from before the untraced gap. Consuming it ensures that a
> sample with no newly decoded trace gets an empty branch stack instead.
> 
> As with intel-pt, the internal reconstruction ring is kept deeper than
> the requested output depth to cover branches decoded between the sampled
> ip and the point at which the sample time was recorded, so --itrace=L<n>
> can actually return n entries. Kernel-inclusive trace gets the same
> conservative 1024-entry headroom that intel-pt uses.
> 
> Assisted-by: Devmate:GPT-5.6
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   tools/perf/util/cs-etm.c       | 185 +++++++++++++++++++++++++++++++--
>   tools/perf/util/thread-stack.c |  17 +++
>   tools/perf/util/thread-stack.h |   1 +
>   3 files changed, 195 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 4d895f11deb7f..00407a80933e1 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -72,6 +72,11 @@ struct cs_etm_auxtrace {
>   	bool use_callchain;
>   
>   	int num_cpu;
> +	/* Output depth requested with --itrace=L<n> */
> +	unsigned int br_stack_sz;
> +	/* Internal reconstruction depth, see cs_etm__br_stack_init() */
> +	unsigned int br_stack_sz_plus;> +	struct branch_stack *br_stack;
>   	u64 latest_kernel_timestamp;
>   	u32 auxtrace_type;
>   	u32 branches_filter;
> @@ -91,6 +96,7 @@ struct cs_etm_traceid_queue {
>   	u64 kernel_start;
>   	union perf_event *event_buf;
>   	unsigned int br_stack_sz;
> +	unsigned int br_stack_sz_plus;
>   	struct branch_stack *last_branch;
>   	struct ip_callchain *callchain;
>   	struct cs_etm_packet *prev_packet;
> @@ -141,7 +147,8 @@ struct cs_etm_queue {
>   };
>   
>   static int cs_etm__update_queues(struct cs_etm_auxtrace *etm);
> -static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm);
> +static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm,
> +					      u64 timestamp);
>   static int cs_etm__flush_timestamped_queues(struct cs_etm_auxtrace *etm);
>   static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
>   					   pid_t tid);
> @@ -165,6 +172,7 @@ static int cs_etm__metadata_set_trace_id(u8 trace_chan_id, u64 *cpu_metadata);
>   #define TO_QUEUE_NR(cs_queue_nr) (cs_queue_nr >> 16)
>   #define TO_TRACE_CHAN_ID(cs_queue_nr) (cs_queue_nr & 0x0000ffff)
>   #define SINK_UNSET ((u32) -1)
> +#define MAX_TIMESTAMP (~0ULL)
>   
>   static u32 cs_etm__get_v7_protocol_version(u32 etmidr)
>   {
> @@ -674,7 +682,8 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
>   		if (!tidq->last_branch)
>   			goto out_free;
>   
> -		tidq->br_stack_sz = etm->synth_opts.last_branch_sz;
> +		tidq->br_stack_sz = etm->br_stack_sz;
> +		tidq->br_stack_sz_plus = etm->br_stack_sz_plus;
>   	}
>   
>   	if (etm->synth_opts.callchain) {
> @@ -794,7 +803,7 @@ static void cs_etm__packet_swap(struct cs_etm_auxtrace *etm,
>   	struct cs_etm_packet *tmp;
>   
>   	if (etm->synth_opts.branches || etm->synth_opts.last_branch ||
> -	    etm->synth_opts.instructions) {
> +	    etm->synth_opts.add_last_branch || etm->synth_opts.instructions) {
>   		/*
>   		 * Swap PACKET with PREV_PACKET: PACKET becomes PREV_PACKET for
>   		 * the next incoming packet.
> @@ -963,7 +972,7 @@ static int cs_etm__flush_events(struct perf_session *session,
>   	if (ret)
>   		return ret;
>   
> -	ret = cs_etm__process_timestamped_queues(etm);
> +	ret = cs_etm__process_timestamped_queues(etm, MAX_TIMESTAMP);
>   	if (ret)
>   		return ret;
>   
> @@ -1060,6 +1069,7 @@ static void cs_etm__free(struct perf_session *session)
>   		zfree(&aux->metadata[i]);
>   
>   	zfree(&aux->metadata);
> +	zfree(&aux->br_stack);
>   	zfree(&aux);
>   }
>   
> @@ -1597,7 +1607,8 @@ static void cs_etm__add_stack_event(struct cs_etm_queue *etmq,
>   	u64 from, to;
>   	int size;
>   
> -	if (!etm->synth_opts.branches && !etm->synth_opts.instructions)
> +	if (!etm->synth_opts.branches && !etm->synth_opts.instructions &&
> +	    !etm->synth_opts.add_last_branch)
>   		return;
>   
>   	if (!cs_etm__packet_has_taken_branch(tidq->prev_packet))
> @@ -1614,7 +1625,7 @@ static void cs_etm__add_stack_event(struct cs_etm_queue *etmq,
>   				    tidq->prev_packet->flags, from, to, size,
>   				    etmq->buffer->buffer_nr + 1,
>   				    etmq->etm->use_callchain,
> -				    tidq->br_stack_sz, 0);
> +				    tidq->br_stack_sz_plus, 0);
>   	} else {
>   		thread_stack__set_trace_nr(tidq->frontend_thread,
>   					   tidq->prev_packet->cpu,
> @@ -2817,7 +2828,8 @@ static int cs_etm__update_queues(struct cs_etm_auxtrace *etm)
>   	return ret;
>   }
>   
> -static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
> +static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm,
> +					      u64 timestamp)
>   {
>   	int ret = 0;
>   	unsigned int cs_queue_nr, queue_nr;
> @@ -2831,6 +2843,9 @@ static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
>   		if (!etm->heap.heap_cnt)
>   			break;
>   
> +		if (etm->heap.heap_array[0].ordinal >= timestamp)
> +			break;
> +
>   		/* Take the entry at the top of the min heap */
>   		cs_queue_nr = etm->heap.heap_array[0].queue_nr;
>   		queue_nr = TO_QUEUE_NR(cs_queue_nr);
> @@ -2878,8 +2893,25 @@ static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
>   		 * No more auxtrace_buffers to process in this etmq, simply
>   		 * move on to another entry in the auxtrace_heap.
>   		 */
> -		if (!ret)
> +		if (!ret) {
> +			/*
> +			 * The trace for this physical queue is exhausted. Drop
> +			 * branch history for every trace ID it carried so that
> +			 * samples arriving later cannot pick up entries decoded
> +			 * before the gap.
> +			 */
> +			if (etm->synth_opts.add_last_branch) {
> +				struct int_node *inode;
> +
> +				intlist__for_each_entry(inode, etmq->traceid_queues_list) {
> +					int idx = (int)(intptr_t)inode->priv;
> +
> +					tidq = etmq->traceid_queues[idx];
> +					thread_stack__flush(tidq->frontend_thread);
> +				}
> +			}
>   			continue;
> +		}
>   
>   		ret = cs_etm__decode_data_block(etmq);
>   		if (ret)
> @@ -3011,6 +3043,116 @@ static int cs_etm__process_switch_cpu_wide(struct cs_etm_auxtrace *etm,
>   	return 0;
>   }
>   
> +static bool cs_etm__tracing_kernel(struct cs_etm_auxtrace *etm,
> +				   struct perf_session *session)
> +{
> +	struct evsel *evsel;
> +
> +	evlist__for_each_entry(session->evlist, evsel) {
> +		if (evsel->core.attr.type == etm->pmu_type &&
> +		    !evsel->core.attr.exclude_kernel)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int cs_etm__br_stack_init(struct cs_etm_auxtrace *etm,
> +				 struct perf_session *session)
> +{
> +	struct evsel *evsel;
> +
> +	evlist__for_each_entry(session->evlist, evsel) {
> +		/*
> +		 * Only timestamped events can be matched against the decoded
> +		 * trace, so do not advertise a branch stack on any other.
> +		 */
> +		if (!(evsel->core.attr.sample_type & PERF_SAMPLE_TIME))
> +			continue;

Do you not also want to check for the coresight virtual timestamp option 
here for the same reason? Although I do see that checked somewhere else 
below.

> +		if (!(evsel->core.attr.sample_type & PERF_SAMPLE_BRANCH_STACK))
> +			evsel->synth_sample_type |= PERF_SAMPLE_BRANCH_STACK;
> +	}
> +
> +	/*
> +	 * Additional branch stack depth to cater for the branches decoded
> +	 * between the sampled ip and the point at which the sample time was
> +	 * recorded. Those are trimmed by thread_stack__br_sample_late(), so

How does the trimmer know what branches came after an IP? I could 
understand trimming between two timestamps, but not between one IP and 
one timestamp.

> +	 * the extra depth keeps the requested output depth achievable. If
> +	 * kernel space is not traced, only the branch into the kernel needs
> +	 * to be accounted for.
> +	 */

I'm not sure if this description is missing something, but I can't 
understand why this needs to be done. Or how kernel tracing affects it.

> +	if (cs_etm__tracing_kernel(etm, session))
> +		etm->br_stack_sz_plus += 1024;
> +	else
> +		etm->br_stack_sz_plus += 1;
> +
> +	etm->br_stack = zalloc(sizeof(struct branch_stack) +
> +			       etm->br_stack_sz * sizeof(struct branch_entry));
> +	if (!etm->br_stack)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +/*
> + * Add decoded branch history to an existing sample. The sample keeps its own
> + * ip, callchain and event identity; only an absent branch stack is filled in.
> + */
> +static int cs_etm__process_sample(struct cs_etm_auxtrace *etm,
> +				  struct perf_session *session,
> +				  struct perf_sample *sample)
> +{
> +	struct machine *machine = &session->machines.host;
> +	struct thread *thread;
> +	int err;
> +
> +	if (!etm->synth_opts.add_last_branch || sample->branch_stack ||
> +	    !sample->ip || !sample->time || sample->time == (u64)-1)
> +		return 0;
> +
> +	/* Adding branch history to existing samples supports the host only */
> +	if (sample->cpumode == PERF_RECORD_MISC_GUEST_KERNEL ||
> +	    sample->cpumode == PERF_RECORD_MISC_GUEST_USER)
> +		return 0;
> +
> +	err = cs_etm__update_queues(etm);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * Decode every queue up to this sample's time. Afterwards the thread
> +	 * stack holds the branches that executed before the sample, and
> +	 * nothing that executed after it.
> +	 */
> +	err = cs_etm__process_timestamped_queues(etm, sample->time);
> +	if (err)
> +		return err;
> +
> +	thread = machine__findnew_thread(machine, sample->pid, sample->tid);
> +	if (!thread)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Take the branch history rather than copying it. The trace window
> +	 * belongs to the sample that ends it, so once it has been attached a
> +	 * later sample with nothing newly decoded finds an empty stack rather
> +	 * than being given an earlier window's branches. That is the common
> +	 * case whenever the trace is duty cycled, by AUX pause/resume or by
> +	 * ETM strobing.
> +	 */
> +	thread_stack__br_sample_late(thread, sample->cpu, etm->br_stack,
> +				     etm->br_stack_sz, sample->ip,
> +				     machine__kernel_start(machine));
> +	thread_stack__br_stack_consume(thread, sample->cpu);
> +
> +	if (etm->br_stack->nr)
> +		sample->branch_stack = etm->br_stack;

How does this work? We have a queue for each CPU, and decoding happens 
in parallel (kind of), but when a Perf sample arrives we just attach the 
stack from the global br_stack? Shouldn't we look at the CPU of the 
sample and use cs_etm__get_queue() to get the right queue and branch stack?

Maybe it's not functionally different if br_stack always happens to be 
set from the queue related to the last Perf sample, but it would be 
nicer to not have to assume.

You might want to check "[PATCH 00/14] perf cs-etm: Per-thread mode 
fixes and snapshot wrap support" because it changes to a per-CPU queue 
even for per-thread mode which could help.

> +
> +	thread__put(thread);
> +
> +	return 0;
> +}
> +
>   static int cs_etm__process_event(struct perf_session *session,
>   				 union perf_event *event,
>   				 struct perf_sample *sample,
> @@ -3049,6 +3191,9 @@ static int cs_etm__process_event(struct perf_session *session,
>   	case PERF_RECORD_SWITCH_CPU_WIDE:
>   		return cs_etm__process_switch_cpu_wide(etm, event);
>   
> +	case PERF_RECORD_SAMPLE:
> +		return cs_etm__process_sample(etm, session, sample);
> +

Don't we want to generalise this and process trace up to the timestamp 
of _any_ event. Can we move the cs_etm__process_timestamped_queues() 
call into cs_etm__process_event().

Surely we want to always decode up to any event if coresight virtual 
timestamps are enabled? That way we access the right mmaps too and the 
decode order doesn't change depending on the branch stack options.

>   	case PERF_RECORD_AUX:
>   		/*
>   		 * Record the latest kernel timestamp available in the header
> @@ -3752,11 +3897,34 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
>   
>   	etm->use_thread_stack = etm->synth_opts.thread_stack ||
>   				etm->synth_opts.last_branch ||
> +				etm->synth_opts.add_last_branch ||
>   				etm->synth_opts.callchain;
>   
>   	etm->use_callchain = etm->synth_opts.thread_stack ||
>   			     etm->synth_opts.callchain;
>   
> +	if (etm->synth_opts.last_branch || etm->synth_opts.add_last_branch) {
> +		etm->br_stack_sz = etm->synth_opts.last_branch_sz;
> +		etm->br_stack_sz_plus = etm->br_stack_sz;
> +	}
> +
> +	if (etm->synth_opts.add_last_branch) {
> +		/*
> +		 * Existing samples are matched to decoded trace by time, so
> +		 * the trace must carry timestamps that are correlated to perf
> +		 * time and the queues must be decoded in time order.
> +		 */
> +		if (etm->timeless_decoding || !etm->has_virtual_ts) {
> +			pr_err("CS ETM Trace: --itrace=L requires virtual timestamped trace\n");
> +			err = -EINVAL;
> +			goto err_free_queues;
> +		}
> +
> +		err = cs_etm__br_stack_init(etm, session);
> +		if (err)
> +			goto err_free_queues;
> +	}
> +
>   	err = cs_etm__synth_events(etm, session);
>   	if (err)
>   		goto err_free_queues;
> @@ -3812,6 +3980,7 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
>   	auxtrace_queues__free(&etm->queues);
>   	session->auxtrace = NULL;
>   err_free_etm:
> +	zfree(&etm->br_stack);
>   	zfree(&etm);
>   err_free_metadata:
>   	/* No need to check @metadata[j], free(NULL) is supported */
> diff --git a/tools/perf/util/thread-stack.c b/tools/perf/util/thread-stack.c
> index 1360f44421ef8..2713a2ad70b69 100644
> --- a/tools/perf/util/thread-stack.c
> +++ b/tools/perf/util/thread-stack.c
> @@ -614,6 +614,23 @@ void thread_stack__sample_late(struct thread *thread, int cpu,
>   	}
>   }
>   
> +/*
> + * Branch history belongs to the sample that ends the trace window, so a
> + * decoder that attaches it to an existing sample should take it rather than
> + * copy it. A later sample with no newly decoded trace then finds an empty
> + * branch stack instead of the previous window's branches.
> + */
> +void thread_stack__br_stack_consume(struct thread *thread, int cpu)
> +{
> +	struct thread_stack *ts = thread__stack(thread, cpu);
> +
> +	if (!ts || !ts->br_stack_rb)
> +		return;
> +
> +	ts->br_stack_pos = 0;
> +	ts->br_stack_rb->nr = 0;
> +}
> +
>   void thread_stack__br_sample(struct thread *thread, int cpu,
>   			     struct branch_stack *dst, unsigned int sz)
>   {
> diff --git a/tools/perf/util/thread-stack.h b/tools/perf/util/thread-stack.h
> index b3cd09beb62f0..2aec292bd1bcb 100644
> --- a/tools/perf/util/thread-stack.h
> +++ b/tools/perf/util/thread-stack.h
> @@ -88,6 +88,7 @@ void thread_stack__sample(struct thread *thread, int cpu, struct ip_callchain *c
>   void thread_stack__sample_late(struct thread *thread, int cpu,
>   			       struct ip_callchain *chain, size_t sz, u64 ip,
>   			       u64 kernel_start);
> +void thread_stack__br_stack_consume(struct thread *thread, int cpu);
>   void thread_stack__br_sample(struct thread *thread, int cpu,
>   			     struct branch_stack *dst, unsigned int sz);
>   void thread_stack__br_sample_late(struct thread *thread, int cpu,


