Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F04C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lK/sGdx2GchoWjuY7/UAUK1Wnr5nxXmBgtlEaIgFQCk=; b=naIxqcF/WOu23BEFlSYqdjKKnf
	DLutyrwxqCKaKTt+IWIBVaSGLpZW5qfcd/CZu5p8ROLt7rON4XVxVv9W2q8XiEAgeMMy0eR6BrFHe
	/yR+U3m8HiIzd2JBsqD0kwCDmBdss71YBo4s7Rl7xN28QsY/VlEa6laY53vazXcfW14bkAQ0w7ULz
	QBsp5tqUsFVfzkRs451bkfMAuM3KFvlJNoyUPIU8BBw4DlJ3P1IsUUZtJLlFR7Rx+oblmLEYhjuwU
	6TOkhm0oMBrpTDe1NkvcTH9gF0GmpL++ZshSusC8P73Sf9kgEJ7WX44VQ9Ak0K4PkKGW1jICX+sS/
	CqRF6z9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKxA-00000008Bap-3O2l;
	Tue, 18 Aug 2026 14:38:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKx7-00000008BaO-41Ik
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:38:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49800c6a846so55089755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 07:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787063888; x=1787668688; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lK/sGdx2GchoWjuY7/UAUK1Wnr5nxXmBgtlEaIgFQCk=;
        b=lhAWB3XXLGSlL4mmrPpst+tsgHnnAaSlNQqRCVVMAxXlzRalJ6LEzFYZy1fzuko+8e
         mnXFhvY1baFcckZmjFQn30085R8oDUvBVgtNkClrvkXjfwOj3EDKV5Ei3O5zcPlLo5Sy
         1kM2ar9a7Y8uc0bD4qIFr14jfd0fenVcuLzcANXVQnm8d740Z/j4kr6BiUrzdEqxK6it
         N4OqJMomic491tfMR5ewaDoMkExAeRgYpAt3wZDPFCjCjC1v7oSoO8uWAx8Fe8+/+mu9
         mwdGv3eQCy4riRhLGxFBiRDjgxyU05CRpvkLatNCglgzocD9FLjfz9SGzCYNHdjvzgGy
         covQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063888; x=1787668688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lK/sGdx2GchoWjuY7/UAUK1Wnr5nxXmBgtlEaIgFQCk=;
        b=YcBxEVkY078WhXFRHkwobAVW7IgGpnUi47Uar+A7cBje/hn41925C6rO9JULSa6x99
         YWNXadbXsFxOXvftOVGSe03s4ZJQx6Xs6PwRfQlQelzrdcb7AEoRO5ru4vI7HZjV1M8A
         IEOqWe38lJ460D6zrctAMPmuKgQCBTG1gMBrBZwYgOz7M5BaRoaghDbkATEMMzN8SkjC
         bOJjpB0o7Snb/WYJgC9Bz6XGYz7MfbIf/Ti2FJk5h1x/F1NqMLfT6xEO6xNlHWQpgT/6
         9fi8mcWj+07Xv1u/qqXbMzs1Fl004OYmR5iWVYthr0gQPpJ+tvafAI/oXu3jIIEynVIi
         vL3g==
X-Forwarded-Encrypted: i=1; AHgh+RqdHCuVPQRbOIem17VSxcT9vZD5+NiHJNYJ8pLHuur16PMCMPF9kxIK/et61/Jt7C36m6dQ9UbV/0Mj3uBTAgUA@lists.infradead.org
X-Gm-Message-State: AOJu0YxHv7hPmbi55hdTrKuip3l8opXU8qXs3Q9OGI5C2zkoWHn0D8l9
	+hHp3JhfvArJ2AcAe55JmZUGfdmmuMvGvDYsq2aApvIH6qU5gFGzeha4iCAYpP5LfaY=
X-Gm-Gg: AR+sD12NR6g+/FsXg261Z9tjKU1eCaIY2GrJ5uKScSemXiZJJ4hIZAw9tw/2WDOOnFx
	wcUxfCGq6rj9uYs5Gom3J/NN7WOWV8UDXqFlNZINZ9sn9XDgCqax57Ti+1XAKpFwGM64Lr/aSjC
	uc6VEgnx1DO3j2MDQi0W5XHN2Xvnbg2cu5P98eLb9nEosuFLhE8YNa6BoBzDVKU/GqPtWuWUJ+2
	PuBzmqZuFLWQy5Qo1n1LuTfuB/GI63bC8UiQztZ6v0NjGgNcXV29J3gO0A93KdE1GN1BieO7gM0
	7uAfQnqKk8cXfQ7Pr/+xxqNfHmeUrkp7ZZZdzyiIqwfhXy2ZiM3zRpX57ce3WoT/aZxr6y46LKS
	JcVLpVDcScHajiOJj42yv9DC60vNE2G4asjpxJKuTDS4dwByxJHvri+aMRPHoo+iReWrZBUw/lq
	To3lwRY+FV7LTr568KtucOUWHNQr6IEqqn460WFJZVXmvPR9Yo2WdzeEII5fz3VMxqSEaXIflIb
	7h+
X-Received: by 2002:a05:600c:8714:b0:499:8704:242c with SMTP id 5b1f17b1804b1-499878ca13bmr616077415e9.0.1787063887786;
        Tue, 18 Aug 2026 07:38:07 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960988c6sm264146625e9.0.2026.08.18.07.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 07:38:07 -0700 (PDT)
Message-ID: <18a23572-5383-4b21-ba7c-ebafa8d0f08c@linaro.org>
Date: Tue, 18 Aug 2026 15:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] perf cs-etm: Split up
 cs_etm__process_timestamped_queues()
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
 <ac33d12949419373516ca02f2972c7e0af01c069.1787005265.git.aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <ac33d12949419373516ca02f2972c7e0af01c069.1787005265.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_073810_053754_2B68B808 
X-CRM114-Status: GOOD (  35.13  )
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
> cs_etm__process_timestamped_queues() currently does three things: it seeds
> the auxtrace heap with one entry per queue, it decodes until the heap is
> empty, and it then walks every traceID queue to flush whatever is left in
> the branch stacks. That is fine while the only caller is
> cs_etm__flush_events(), which runs once, but it does not survive the
> function being called repeatedly.
> 
> Seeding cannot be repeated because a queue that still holds a heap slot
> would be seeded again, adding duplicate entries and growing the heap
> without bound. Flushing cannot be repeated either, because ending a block
> finalises state that later trace still needs.
> 
> Move both out. Seeding becomes cs_etm__update_queues(), gated on
> queues.new_data so it only runs when new AUX data has been queued, with
> etmq->on_heap tracking whether a queue currently occupies a heap slot;
> this mirrors intel_pt_update_queues() and intel_pt_queue::on_heap.
> Flushing becomes cs_etm__flush_timestamped_queues(). What remains is the
> decode loop on its own, which a later patch can then drive incrementally.
> 
> No functional change: the sole caller performs the same three steps in the
> same order.
> 
> Assisted-by: Devmate:GPT-5.6
> Signed-off-by: Amir Ayupov <aaupov@fb.com>

LGTM but I'd still like to run the test.

> ---
>   tools/perf/util/cs-etm.c | 71 ++++++++++++++++++++++++++++++++++------
>   1 file changed, 61 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 114b3cd2da495..4d895f11deb7f 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -136,9 +136,13 @@ struct cs_etm_queue {
>   	 */
>   	struct intlist *own_traceid_list;
>   	u32 sink_id;
> +	/* Whether this queue currently occupies a slot in etm->heap */
> +	bool on_heap;
>   };
>   
> +static int cs_etm__update_queues(struct cs_etm_auxtrace *etm);
>   static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm);
> +static int cs_etm__flush_timestamped_queues(struct cs_etm_auxtrace *etm);
>   static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
>   					   pid_t tid);
>   static int cs_etm__get_data_block(struct cs_etm_queue *etmq);
> @@ -939,6 +943,8 @@ static int cs_etm__flush_events(struct perf_session *session,
>   	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
>   						   struct cs_etm_auxtrace,
>   						   auxtrace);
> +	int ret;
> +
>   	if (dump_trace)
>   		return 0;
>   
> @@ -953,7 +959,15 @@ static int cs_etm__flush_events(struct perf_session *session,
>   		return cs_etm__process_timeless_queues(etm, -1);
>   	}
>   
> -	return cs_etm__process_timestamped_queues(etm);
> +	ret = cs_etm__update_queues(etm);
> +	if (ret)
> +		return ret;
> +
> +	ret = cs_etm__process_timestamped_queues(etm);
> +	if (ret)
> +		return ret;
> +
> +	return cs_etm__flush_timestamped_queues(etm);
>   }
>   
>   static void cs_etm__free_traceid_queues(struct cs_etm_queue *etmq)
> @@ -1330,6 +1344,8 @@ static int cs_etm__queue_first_cs_timestamp(struct cs_etm_auxtrace *etm,
>   	 */
>   	cs_queue_nr = TO_CS_QUEUE_NR(queue_nr, trace_chan_id);
>   	ret = auxtrace_heap__add(&etm->heap, cs_queue_nr, cs_timestamp);
> +	if (!ret)
> +		etmq->on_heap = true;
>   out:
>   	return ret;
>   }
> @@ -2767,23 +2783,30 @@ static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
>   	return 0;
>   }
>   
> -static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
> +/*
> + * Seed the heap with one entry from each queue that is not already
> + * represented in it, so that decoding proceeds in time order across all
> + * queues. Only queues that have newly queued data need to be considered.
> + */
> +static int cs_etm__update_queues(struct cs_etm_auxtrace *etm)
>   {
>   	int ret = 0;
> -	unsigned int cs_queue_nr, queue_nr, i;
> -	u8 trace_chan_id;
> -	u64 cs_timestamp;
> -	struct auxtrace_queue *queue;
> +	unsigned int i;
>   	struct cs_etm_queue *etmq;
> -	struct cs_etm_traceid_queue *tidq;
> +
> +	if (!etm->queues.new_data)
> +		return 0;
> +
> +	etm->queues.new_data = false;
>   
>   	/*
>   	 * Pre-populate the heap with one entry from each queue so that we can
> -	 * start processing in time order across all queues.
> +	 * start processing in time order across all queues. Skip queues that
> +	 * already occupy a heap slot, otherwise they would be added twice.
>   	 */
>   	for (i = 0; i < etm->queues.nr_queues; i++) {
>   		etmq = etm->queues.queue_array[i].priv;
> -		if (!etmq)
> +		if (!etmq || etmq->on_heap)
>   			continue;
>   
>   		ret = cs_etm__queue_first_cs_timestamp(etm, etmq, i);
> @@ -2791,6 +2814,19 @@ static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
>   			return ret;
>   	}
>   
> +	return ret;
> +}
> +
> +static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
> +{
> +	int ret = 0;
> +	unsigned int cs_queue_nr, queue_nr;
> +	u8 trace_chan_id;
> +	u64 cs_timestamp;
> +	struct auxtrace_queue *queue;
> +	struct cs_etm_queue *etmq;
> +	struct cs_etm_traceid_queue *tidq;
> +
>   	while (1) {
>   		if (!etm->heap.heap_cnt)
>   			break;
> @@ -2807,6 +2843,7 @@ static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
>   		 * to process it.
>   		 */
>   		auxtrace_heap__pop(&etm->heap);
> +		etmq->on_heap = false;
>   
>   		tidq  = cs_etm__etmq_get_traceid_queue(etmq, trace_chan_id);
>   		if (!tidq) {
> @@ -2874,7 +2911,21 @@ static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
>   		 */
>   		cs_queue_nr = TO_CS_QUEUE_NR(queue_nr, trace_chan_id);
>   		ret = auxtrace_heap__add(&etm->heap, cs_queue_nr, cs_timestamp);
> +		if (ret)
> +			goto out;
> +		etmq->on_heap = true;
>   	}
> +out:
> +	return ret;
> +}
> +
> +/* Flush any branch stack entries left over once all trace is decoded */
> +static int cs_etm__flush_timestamped_queues(struct cs_etm_auxtrace *etm)
> +{
> +	int ret = 0;
> +	unsigned int i;
> +	struct cs_etm_queue *etmq;
> +	struct cs_etm_traceid_queue *tidq;
>   
>   	for (i = 0; i < etm->queues.nr_queues; i++) {
>   		struct int_node *inode;
> @@ -2893,7 +2944,7 @@ static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
>   				return ret;
>   		}
>   	}
> -out:
> +
>   	return ret;
>   }
>   


