Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89FC606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nmwE7zP3;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lLm0qyXW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7VYDYvW+CwD5vPnIuKuoUcZjw7zRDhgYDMBwsljH6Ms=; b=nmwE7zP3tDWZmt
	rSSdE10aBe8F+6hN1Ypujv656giQPSaTGNJt7dzHdz3UT27p88s8J7HSzfJzSrncBz+e42uo/FkLh
	v3M+7gehQNqc6CL/55OurMRkrgB8wYWw7JvPH3aT8lrA3MSTEGYEAX6Obn4Ih00YOhCIw3Jj48oc+
	ruIZyF7ccfXMaCFpDdTJDE0/nCLzR17AiFu55aIebDQqshlyWjnJrtmBhPbiTfgts20rq6xwkoYSi
	WM137Pm3JxV3KaGq9rmp3ncCrTQ2N60qSepX545h5Ald0jOBudIDs9wbw3NyFLMuxIN1lhpo5WnOF
	dPQ2jiYgwmSjIRd7L45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcaJ-00000005j4o-1owg;
	Wed, 04 Nov 2026 15:07:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcaG-00000005j3p-3x2G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 15:07:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso5662775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 07:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793804846; x=1794409646; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VYDYvW+CwD5vPnIuKuoUcZjw7zRDhgYDMBwsljH6Ms=;
        b=lLm0qyXWBbUFTz/eaNFff8e6iramWEEHadrptTl8m+dh8YHHTojdb04FTNuGPqu6i7
         L1j9Z9ZVJpp1p5bf9V4CyYyl4m0pk5UnW9kUlLV5+3r8wYlZxeTGVjFDgATRwoGCnT/t
         kHdwDpahwoxSgNZLVV57PjmATeCRZpCkwv6iY8JXcrvtaQCvM3wvF8oi2rcIxifLzIGn
         AeBfetYEmM98Q2WHwoColOfgXl0isW5+lpIiplaMg4EFeomzpfUyiQTWF3MRJXZbxX68
         C9Rcio50WSdYncJGnODL8967NiASw20r19K++dX9B/AbWwEYbj1rgQfxVq5uJP4sqnrP
         a3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804846; x=1794409646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VYDYvW+CwD5vPnIuKuoUcZjw7zRDhgYDMBwsljH6Ms=;
        b=QY94HVt76ylCupdK3qG80hhgurdVlG3H9b/2BUPjJoMZ+bOKPqYRHpuWADnXc+d7tO
         Oj8xh79C+SYLJfoCp7cZWGXEv2sfwfYwFGP7B4ajp2fcJ3KijpbzCFFaVLALLWBSS+6M
         2zz2kp2RMbeDMUWCRSAIOg0RrsfMmA1uVCweck2Zk3GTT0AwwQY+9u7gTC5RThMgPd0G
         BbCLiHPUddJQMbvP88bzbKaYVK9nEeE3sO7cylg5pZ4y4Pren0hi2U+ddJ2W2vsMn4Hm
         HM2FDGg4g3sUCuHB2ujOZ/74TbUsm2vyqag9OoiyXtAofqkYWxbFiA6u86VAxN3ddL+C
         LM7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxkDhNOYRnIPQE7hiXNVX8sCK6PrbbL6rw/RgFvhq3IlGIiWM5lGfUenU6MfV4kWOM/HkVT8RHYR3HTwyIvtNMZ@lists.infradead.org
X-Gm-Message-State: APuU4Z8edyU6xUzZcu8v2i/zZ+MTrpmCDw3wyb+1EKPQhZE26avHE2nn
	XJj5gOw+eG/NDBf0K7EF3pflYFEHw5/z+Yk6nYbdu9aDzexOAo0yG+KvawzUq0b+oSQ=
X-Gm-Gg: AYBFou10leMI93HKo+Wnh+710zdL+h7NtRie0D7iudA/V9aSKVJa2gdcgYVLZjxw8Dg
	tHplIGSPUKHmxMvHFPPAVLkqvTWPYahCPfFRInaBx5tmPcJgADEj+yvClz6oPd7MlOE0x+CZY7c
	yxrBB5y3oc6EyZLCruC429CDx87UIigBSDyHn/Ns+FCWrkyv8wHmWtYKrOE2e/hQ/WEsDmGnOA9
	mbbZiFIaahk+fSlEgsXsyuKNZonZzJKwGIQFcDUH+NRR6ctLoazVrq4+lVXWum1i8+18L3awhoZ
	6/0juzVA48/PdMMdpb2/HOLCcDWGFlXtmKOuEgNlph8zlCVr/dl4wpgXOxi8LVUXgdqOUW4L9fY
	HpHA0LszpjHOOJDGrMolBbgzTCu9/XT5PqycHtjUZRd7XnVbZoxzvpM+b5H27MnylUPKf96+J3h
	31RyllTqr046su7wt/h0HZp+MY1CtKkrw2blFKJFSPIN/Zi+v5WD4IEGAdxtk51JX2cUiBG4H80
	eaaqEiWdjolSc96Qy9Xt3/A4BzLo8aK62AnRrs8V8qcgDehAN3jt5H/UejMpA+r42WFEhRI2+0Q
	Pn0eN9RzhhaTesauOdCx6C/NPGaLm8ILjRdigXAz8XcPurKeLkio7wU=
X-Received: by 2002:a05:600c:4e14:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4ac187a80bfmr378940895e9.30.1793804846351;
        Wed, 04 Nov 2026 07:07:26 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8648sm4578795f8f.9.2026.11.04.07.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 07:07:25 -0800 (PST)
Message-ID: <54182c51-8dfe-46fa-9369-5e4e31a63796@linaro.org>
Date: Wed, 4 Nov 2026 15:07:24 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/18] perf cs-etm: Use per-CPU queues for per-thread
 mode
To: Leo Yan <leo.yan@arm.com>
Cc: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org,
 John Garry <john.garry@linux.dev>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
 <20261102-james-cs-unformatted-per-thread-fix-v3-4-dbcb0c281b9b@linaro.org>
 <20261104142412.GI9176@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261104142412.GI9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_070729_017554_D327A056 
X-CRM114-Status: GOOD (  24.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 04/11/2026 14:24, Leo Yan wrote:
> On Mon, Nov 02, 2026 at 12:15:18PM +0000, James Clark wrote:
> 
> [...]
> 
>> @@ -2215,6 +2209,29 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
>>   	 */
>>   	cs_etm__flush_all_stack(etmq);
>>   
>> +	/*
>> +	 * Per-thread mode still uses a queue for each CPU, but that CPU can run
>> +	 * different threads. When the TID from the AUX record on a CPU changes,
>> +	 * re-initialize the thread using the AUX record/buffer fragment TID so
>> +	 * we can start decoding even if the context ID packet was cropped or
>> +	 * they're disabled.
>> +	 */
>> +	if (etm->per_thread_decoding) {
>> +		struct cs_etm_traceid_queue *tidq = cs_etm__etmq_get_traceid_queue(etmq,
>> +							CS_ETM_PER_THREAD_TRACEID);
>> +
>> +		if (thread__tid(tidq->decode_thread) != etmq->buffer->tid) {
>> +			thread__zput(tidq->frontend_thread);
>> +			thread__zput(tidq->decode_thread);
>> +			tidq->frontend_thread = machine__findnew_thread(
>> +				&etm->session->machines.host, -1,
>> +				etmq->buffer->tid);
>> +			tidq->decode_thread = machine__findnew_thread(
>> +				&etm->session->machines.host, -1,
>> +				etmq->buffer->tid);
>> +		}
>> +	}
> 
> Why not use PERF_RECORD_AUX events as an opportunity to update threads,
> similar to how we handle PERF_RECORD_SWITCH_CPU_WIDE?
> 

In cs_etm__queue_aux_fragment() we check if the TID from the AUX record 
is the same as the one on the buffer, so it doesn't make a difference. 
They're always the same:

		if (auxtrace_event->tid != sample->tid)
			return 1;

We can't use it directly in cs_etm__process_event() because we're not 
decoding in order with Perf events yet. In my WIP JIT patches we do, but 
it still makes sense to continue to use the TID from the buffer because 
you don't always have timestamps available to update threads when the 
AUX event comes.

>> +
>>   	return 1;
>>   }
>>   
>> @@ -3288,7 +3305,9 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
>>   
>>   	if (aux_offset >= auxtrace_event->offset &&
>>   	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
>> -		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, auxtrace_event->cpu);
>> +		/* Old per-thread files have no CPU (before v6.4) */
>> +		int queue_idx = sample->cpu == (u32)-1 ? 0 : sample->cpu;
>> +		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, queue_idx);
> 
> For per-thread mode, auxtrace_event->cpu is -1. So this is why we
> resort sample->cpu to retrieve CPU ID. This makes sense to me.

Yes, and it's only set on AUX records since we started always doing this:

   evsel__set_sample_bit(cs_etm_evsel, CPU);

Otherwise it was -1 there too, hence the condition for old files.


