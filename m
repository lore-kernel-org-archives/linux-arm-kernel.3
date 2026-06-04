Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C83CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 15:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzCx8oZtOKJy0MwZJ9vxD1WducBZjFeqqellDoQ+O60=; b=gnszJhtIWUoYEN71UITBOIpqHq
	TSHc/XKHIgtbkZ2fTPV9ZPbmsoJbBqYkhMoHcDLb8LNkH2eg/HKX5oU72E1OfzqVYq0RctoO8941s
	XSfZ2W0z845/qnAOVJ0epJmDFz6ZV05xMPL57Hlh4rWt3136gHZsOT28ySfBviSwDcL/Q0l1ziRic
	tWWrFV2HEEz+NPBqn/XClpPf+n8T2VeM+lMwYR+WRsmPf+VXMNSqFIlIckDsdbVeistUZYky6e0RG
	JRnwD/AG1YMVz3pcWG8YYXdc0LFSQ2MazbIHrTQt6IYGEtsD02FnI8sn8a/pZ7jYCAD91DxZtCpbX
	Bed4qEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9fC-0000000Gxg2-2NyX;
	Thu, 04 Jun 2026 15:07:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9fB-0000000Gxfs-1EN6
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Jun 2026 15:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EzCx8oZtOKJy0MwZJ9vxD1WducBZjFeqqellDoQ+O60=; b=ZVwnq1hWhQJcGTQJRGk3MPYsjp
	M+yMwAbMvWqcurl1weT+/S7t4VPPpUE/DeCOUAE6S1q3EBsm3uv/zwqbbX4MKYkx2msu50weXDW6t
	uJDQfvtB1l/gxYc6zlG/K1Fi2qK9BByeITNcNd+osVw1Q/lysY5GPgzRlfDDzM1UXKJyj9HaNWn/G
	l7Wv+qVtB16EHFw10YmCfeU1fbkqHtZ22x3crMvkMU85+nVN9Hk6XPa7WmTSxtiVs3HFf/W42gw1P
	ekYjDoFOU9Abzl9VqtOEz2upcYcWbDh7JepOdoA+Ksd3o5V5EG+gJThd39743goH9980+98ipYZbT
	i0CRgwzQ==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV9f6-0000000EU8V-002Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 15:07:14 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-45ef5146b56so1293427f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 08:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780585629; x=1781190429; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EzCx8oZtOKJy0MwZJ9vxD1WducBZjFeqqellDoQ+O60=;
        b=URm0q+WzN6zgekCz7K0Ot5qJK5ptFq9U+Genw5jEmDUKPwguHLpiTqXG0RaAFVFhJu
         SsaxcQyrKZ4i41g4i6U/K6BpPgYqlVdwAts1VIPmh8JucWyxmD/06YQz4ZB1jFNvebj8
         vxZrpi4qxUQVH/8T2E+BzqqNZxg7JR8FlNnlK0JaJ0vl5UFcdO9nGr76MbaO7+ykNH4a
         Hc5wgLPvD8i3GuNoTiejmzxv4mnphZAatY2IUWqWz6YR88zFILgOqu97O+KM07ldWWfX
         hZBMJpgLGaYnCiGPq57nUzEhKKRAlsFhk5sgRQzasCd425MivKiLpuf5ZrjTVb17YVej
         IU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585629; x=1781190429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzCx8oZtOKJy0MwZJ9vxD1WducBZjFeqqellDoQ+O60=;
        b=tLhcAKrDXYsZabm8FP42RYCr76B6AFJUfR1pIzqI5LhLHD4JkGB2Wyuq7r28j7p8c2
         0CIhGE5J80ytdGvT8c4LOOde0y7d6Xp+xjbuZEpb9UMh1zPkYgYWLnQotlLwWhqy8mXd
         P8MT9eEHwzDrSMBTOyl//6M+tRVy8osgt5me5RU2nBMbGTrwGJ34FhzF8sBOX6HNjWZv
         2Sf2piHSiq2iWZwZgw+/vMv9MwgcaD7vbHi8TwHd2iesb9M/tVUkVWXLWnM5ai0G4mQv
         l79xq4KoP4vDwTJR16Coea2z5XOmC/OrVdAAfOYsmDOshCQokCSlYGumhv5jBmKiuR2v
         2wOQ==
X-Gm-Message-State: AOJu0YzQZPMRUy6wTf2wDbKzx9WPAMvMstwHtT60ZzY/40HaqkkJcfqq
	KMAtvt4JmGjbmDySQNl+gXS7Dt8cKXnkxD2WJmvPW21MbPyVtxT17bgtOJWBgxCeJto=
X-Gm-Gg: Acq92OH499wtW/JdlT0UvQVT4BPgGkv3TP5mtRN2xFPCXRZymFLQb+lr7zeADKs6rFq
	vkgqjrUeKqxRtYX/7V3XGMBTxS61fMxIQ2M6WVAhPiZR5/ru9R1XGshucexhq2GfxnM2vVjDxVm
	ULWnKIKp+VJUaeXK7qdPbE/6DL/ZL73G7zqkwurZgn5ouzA9KC3JmIHuYAm37V4u+0uZQPpu0ac
	9iQ9dHfi1Y5H+Em2HeOWU3iy6dfDaKFICe6dmkb/EvreaHWAmCbN7u2gr07yW4iXOKlPI4dO0aV
	Tm2TQyz6+SLoTBCATuasdci5fVosN2U/Ct0E3ALyfhNSoRhtvDfrnJw7h+mYxyj5Xws//OKJAeO
	ESzquruS0sy4HHvWlWV3HtGR/ddJ78uK1xUgNK7J4ysFmA7qPMVcKt43BDcQR45Oe99dQ8sPXZP
	ccjQdyPLn3SU9vM24Sw5SCEzSzhIoPnK2AiZaa1J0=
X-Received: by 2002:adf:f1ce:0:b0:45e:f7ae:d599 with SMTP id ffacd0b85a97d-460276257eamr4375838f8f.25.1780585629481;
        Thu, 04 Jun 2026 08:07:09 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3529e0sm16840516f8f.28.2026.06.04.08.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 08:07:09 -0700 (PDT)
Message-ID: <ba6008d5-930e-466a-ade8-7a3fe9f4e306@linaro.org>
Date: Thu, 4 Jun 2026 16:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] perf cs-etm: Synthesize callchains for instruction
 samples
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@linux.dev>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>,
 Paschalis Mpeis <paschalis.mpeis@arm.com>, Amir Ayupov <aaupov@fb.com>
References: <20260526-b4-arm_cs_callchain_support_v1-v6-0-f9f49f53c9dd@arm.com>
 <20260526-b4-arm_cs_callchain_support_v1-v6-7-f9f49f53c9dd@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260526-b4-arm_cs_callchain_support_v1-v6-7-f9f49f53c9dd@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_160712_157733_AE044599 
X-CRM114-Status: GOOD (  25.86  )
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



On 26/05/2026 5:59 pm, Leo Yan wrote:
> From: Leo Yan <leo.yan@linaro.org>
> 
> CS ETM already records branches into the thread stack, but instruction
> samples do not carry synthesized callchains. It misses to support the
> callchain and no output with the itrace option 'g'.
> 
> Allocate a callchain buffer per queue and use thread_stack__sample()
> when synthesizing instruction samples. Advertise PERF_SAMPLE_CALLCHAIN
> on the synthetic instruction event.
> 
> Allocate the callchain stack with one more entry than requested, as the
> first entry is reserved for storing context information.
> 
> After:
> 
>    perf script --itrace=g16l64i100
> 
>    callchain_test    9187 [002] 599611.826599:          1 instructions:
>                aaaae3ed0774 do_svc+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>                aaaae3ed0798 print+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>                aaaae3ed07b0 foo+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>                aaaae3ed07c8 main+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>                ffff8331225c __libc_start_call_main+0x7c (/usr/lib/aarch64-linux-gnu/libc.so.6)
>                ffff8331233c call_init+0x9c (inlined)
>                ffff8331233c __libc_start_main_impl+0x9c (inlined)
>                aaaae3ed0670 _start+0x30 (/home/kernel/leoy/test_cs_callchain/callchain_test)
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/cs-etm.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 8d98e772ecb307381b5ed1b4bbc4056e8779b261..90e0beb910156093d8bd0f320bb0210aca95dd26 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -17,6 +17,7 @@
>   #include <stdlib.h>
>   
>   #include "auxtrace.h"
> +#include "callchain.h"
>   #include "color.h"
>   #include "cs-etm.h"
>   #include "cs-etm-decoder/cs-etm-decoder.h"
> @@ -85,6 +86,7 @@ struct cs_etm_auxtrace {
>   struct cs_etm_traceid_queue {
>   	u8 trace_chan_id;
>   	u64 period_instructions;
> +	u64 kernel_start;
>   	union perf_event *event_buf;
>   	struct thread *thread;
>   	struct thread *prev_packet_thread;
> @@ -92,6 +94,7 @@ struct cs_etm_traceid_queue {
>   	ocsd_ex_level el;
>   	unsigned int br_stack_sz;
>   	struct branch_stack *last_branch;
> +	struct ip_callchain *callchain;
>   	struct cs_etm_packet *prev_packet;
>   	struct cs_etm_packet *packet;
>   	struct cs_etm_packet_queue packet_queue;
> @@ -640,6 +643,16 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
>   		tidq->br_stack_sz = etm->synth_opts.last_branch_sz;
>   	}
>   
> +	if (etm->synth_opts.callchain) {
> +		size_t sz = sizeof(struct ip_callchain);
> +
> +		/* Add 1 to callchain_sz for callchain context */
> +		sz += (etm->synth_opts.callchain_sz + 1) * sizeof(u64);
> +		tidq->callchain = zalloc(sz);

You can use struct_size() to get the size for a flexible array struct:

   zalloc(struct_size(tidq->callchain, ips,
                      etm->synth_opts.callchain_sz + 1));

> +		if (!tidq->callchain)
> +			goto out_free;
> +	}
> +
>   	tidq->event_buf = malloc(PERF_SAMPLE_MAX_SIZE);
>   	if (!tidq->event_buf)
>   		goto out_free;
> @@ -647,6 +660,7 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
>   	return 0;
>   
>   out_free:
> +	zfree(&tidq->callchain);
>   	zfree(&tidq->last_branch);
>   	zfree(&tidq->prev_packet);
>   	zfree(&tidq->packet);
> @@ -939,6 +953,7 @@ static void cs_etm__free_traceid_queues(struct cs_etm_queue *etmq)
>   		thread__zput(tidq->thread);
>   		thread__zput(tidq->prev_packet_thread);
>   		zfree(&tidq->event_buf);
> +		zfree(&tidq->callchain);
>   		zfree(&tidq->last_branch);
>   		zfree(&tidq->prev_packet);
>   		zfree(&tidq->packet);
> @@ -1431,6 +1446,7 @@ static void cs_etm__set_thread(struct cs_etm_queue *etmq,
>   		tidq->thread = machine__idle_thread(machine);
>   
>   	tidq->el = el;
> +	tidq->kernel_start = machine__kernel_start(machine);
>   }
>   
>   int cs_etm__etmq_set_tid_el(struct cs_etm_queue *etmq, pid_t tid,
> @@ -1561,6 +1577,25 @@ static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,
>   		sample.branch_stack = tidq->last_branch;
>   	}
>   
> +	if (etm->synth_opts.callchain) {
> +		if (tidq->kernel_start)
> +			thread_stack__sample(tidq->thread, tidq->packet->cpu,
> +					     tidq->callchain,
> +					     etm->synth_opts.callchain_sz + 1,
> +					     sample.ip, tidq->kernel_start);
> +		else
> +			/*
> +			 * Clear the callchain when the kernel start address is
> +			 * not available yet. The empty callchain can then be
> +			 * consumed by cs_etm__inject_event().
> +			 */
> +			memset(tidq->callchain, 0,
> +			       sizeof(struct ip_callchain) +
> +			       (etm->synth_opts.callchain_sz + 1) * sizeof(u64));

Ditto, but the rest looks good:

Reviewed-by: James Clark <james.clark@linaro.org>

> +
> +		sample.callchain = tidq->callchain;
> +	}
> +
>   	if (etm->synth_opts.inject) {
>   		ret = cs_etm__inject_event(etm, event, &sample,
>   					   etm->instructions_sample_type);
> @@ -1724,6 +1759,9 @@ static int cs_etm__synth_events(struct cs_etm_auxtrace *etm,
>   		attr.branch_sample_type |= PERF_SAMPLE_BRANCH_HW_INDEX;
>   	}
>   
> +	if (etm->synth_opts.callchain)
> +		attr.sample_type |= PERF_SAMPLE_CALLCHAIN;
> +
>   	if (etm->synth_opts.instructions) {
>   		attr.config = PERF_COUNT_HW_INSTRUCTIONS;
>   		attr.sample_period = etm->synth_opts.period;
> @@ -3457,6 +3495,14 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
>   					PERF_IP_FLAG_TRACE_BEGIN |
>   					PERF_IP_FLAG_TRACE_END;
>   
> +	if (etm->synth_opts.callchain && !symbol_conf.use_callchain) {
> +		symbol_conf.use_callchain = true;
> +		if (callchain_register_param(&callchain_param) < 0) {
> +			symbol_conf.use_callchain = false;
> +			etm->synth_opts.callchain = false;
> +		}
> +	}
> +
>   	etm->session = session;
>   
>   	etm->num_cpu = num_cpu;
> @@ -3508,7 +3554,8 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
>   	}
>   
>   	etm->use_thread_stack = etm->synth_opts.thread_stack ||
> -				etm->synth_opts.last_branch;
> +				etm->synth_opts.last_branch ||
> +				etm->synth_opts.callchain;
>   
>   	err = cs_etm__synth_events(etm, session);
>   	if (err)
> 


