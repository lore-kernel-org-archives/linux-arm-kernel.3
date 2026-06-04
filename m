Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335E7CD6E6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 14:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzy4dDaqdwgJy1YaxSLyN1whQK6qSsoGcP13HMyFB64=; b=rUpkcPJAiGWDS3jH+oS/yIjXr8
	4yw5VtA9cYCBEgTDmWgqfxlwd4f8e0V/6ZyjK7ZtPuIZI+guISKMcKa4G31WCABc3n8W/zSdV9dGc
	bqEL0LY/MRKnnN6uUyf10TWZlg8srpsHJaxVeCNucCPDhZ6H3xk6SSv33n6JdCYaztCxe6GUSt8LP
	/HLkEEJ1xUHdyY69kYPD7heyTqggDso/9p54T2VWMj44psfmNWMrZ7AA24VMFpHWdSZ+ByYLEYdRy
	YZCToD52D6JihIM/CiSpncsITwxo1INxm98kxhXsniGw2km2EiDhwymNhOLFVisrvBwMQQJcLnpEC
	uE3jieqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9HK-0000000GvbS-2j6F;
	Thu, 04 Jun 2026 14:42:38 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9HI-0000000Gvax-1oC8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 14:42:37 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-bed19623d6eso98557266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780584154; x=1781188954; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wzy4dDaqdwgJy1YaxSLyN1whQK6qSsoGcP13HMyFB64=;
        b=AwDY+ziRBXQ09oGf5O8AnsD6/AbMmI4FlfwK7YnaVXtuIf+jPYFl4nlje03Ie3RcmT
         Nr3cKimloldRE01unTE4GZVYwl41nToVg9ZA5JVzP6qV2spU6AXJmmNJe2bM0G4hk/+q
         vIPRnvMzPvj9NM7HjBD+avzcGBcK0A1JDXcAC04ghBoqSMDClt5b1L8RejMiV8171hTm
         0YgM+vhUPm1foKocN/fAJKsD48xhSlSEcr5MHcFDnGIL459Z4JS/HtbJOg/yQ8ChrAdb
         3xNpP6cNVe1nzxIfb+UAmDgsvYPKNbCn4Gxvzq4doSr9xABkcn2FS1eVNr8vSfe55Zmb
         pJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584154; x=1781188954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzy4dDaqdwgJy1YaxSLyN1whQK6qSsoGcP13HMyFB64=;
        b=lCJsYBVOa4Cl15uqiILzqzl7MtBKqWJufvF2m+v/WMewlhsRobNELpWz0BsDvsNBuZ
         OAHp6tAbR2ZSgdzwSMNYdOZCuDXPwKflajrfGkr7FEeSlS148oZibByghzpnz6n36Dtq
         ahFmLMXSuiFTVbhtlr0t2AET3mMCYFUFm5Vnt52ivxaXIfre3LwJfpOxxH7L9sJdSztT
         R9oaap7ooNGsXdR3IatTCZpZob3uGPWCFjJ724IQO0TgVwvD/DxNQQlbHPwcoG3va9dM
         Mta+x+qEDGH67p+mRLYNwJSFLbkrOAEa7jFfAGNDnW4dzkqaBdYxKppRYB5vx1TOlenS
         sdTQ==
X-Gm-Message-State: AOJu0YwOFi6Em/NuE0qjUj19nbX5xzOkMddSXHG6LKHiDTf5HxZ1RgNs
	H9nuwZHmJcF7ZIicVb6mONhM7dGWiQEauJZsMhhknQzAOaIc2cnqzeP8sMs5X9Yhdj4=
X-Gm-Gg: Acq92OHBygNONlK/4oTMFCFM3SmYLZmm6wQW27G7nOdTzL1YXi1MavVLM0TRICkFAYJ
	zuOlc6h/+xoS2xN4Hh9lhBr14W7fRo6B+abP0WLTJxyy87sSYny4i1rB+DTuPp6Y9595yxdOktf
	hgiCHag93z8U67ccE6N5OkBFg0485I47glz84PKrpJ9kHkmfJxpr8glCT52+RJSLKSMQnf0vdfJ
	KJZtLfauLkgWY3dkLwJJep0pqHJmZGTchpc8r0BtmFuFIiVAVX9XoHzXTDKfXUg6bzrdJ67cd8d
	XFpBu4y/szEyBzFPDwmVj6I0ztJgXiG5PQQEW203h0riBa0OMZyZe3sEn7Q9WuZyXvsnWY505jD
	3BjPi1wi+cslQmS5R375vxjFvHGIZeYp03TXfQM5ZMoF8h+P7zGXwgOjnIpqQK3ShDBcgrTgxNY
	gseBGhx9QRyq/XthXg1R00cHmfFtl+Uo5GGZqrIBc=
X-Received: by 2002:a17:906:7950:b0:bee:c371:4f43 with SMTP id a640c23a62f3a-bf0aab1b743mr505787266b.26.1780584154501;
        Thu, 04 Jun 2026 07:42:34 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517721c2sm306900366b.3.2026.06.04.07.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 07:42:34 -0700 (PDT)
Message-ID: <fbe0a097-ced7-44c6-ada1-01c3e9c1d7e7@linaro.org>
Date: Thu, 4 Jun 2026 15:42:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] perf cs-etm: Filter synthesized branch samples
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
 <20260526-b4-arm_cs_callchain_support_v1-v6-6-f9f49f53c9dd@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260526-b4-arm_cs_callchain_support_v1-v6-6-f9f49f53c9dd@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_074236_526416_0E2799F1 
X-CRM114-Status: GOOD (  23.14  )
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
> CS ETM currently emits branch samples for every decoded branch when
> branch synthesis is enabled. This delivers redundant info when users
> request only call or return branches.
> 
> Add a branch filter derived from the itrace "calls" and "returns" options.
> When no filter is set, keep the existing behavior and emit all branch
> samples. When call or return filtering is requested, only synthesize branch
> samples whose flags match the selected branch types, including trace
> begin and end markers.
> 
> Before:
> 
>    perf script -F +callindent
> 
>    callchain_test    9187 [002] 599611.826599:          1 branches:             main                                                     ffff83312258 __libc_start_call_main+0x78 (/usr/lib/aarch64-linux-gnu/libc.so.6)
>    callchain_test    9187 [002] 599611.826599:          1 branches:                 foo                                                  aaaae3ed07c4 main+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>    callchain_test    9187 [002] 599611.826599:          1 branches:                     print                                            aaaae3ed07ac foo+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>    callchain_test    9187 [002] 599611.826599:          1 branches:                         do_svc                                       aaaae3ed0794 print+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>    callchain_test    9187 [002] 599611.826599:          1 branches:                                                                      aaaae3ed077c do_svc+0x14 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>    callchain_test    9187 [002] 599611.826599:          1 branches:                             vectors                                  aaaae3ed0780 do_svc+0x18 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>    callchain_test    9187 [002] 599611.826599:          1 branches:                                                                  ffff800080010c00 vectors+0x400 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826600:          1 branches:                                                                  ffff800080010c24 vectors+0x424 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826600:          1 branches:                                                                  ffff8000800114dc el0t_64_sync+0xd4 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826600:          1 branches:                                                                  ffff8000800114f8 el0t_64_sync+0xf0 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826600:          1 branches:                                                                  ffff800080011528 el0t_64_sync+0x120 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826600:          1 branches:                                                                  ffff800080011538 el0t_64_sync+0x130 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826601:          1 branches:                                                                  ffff800080011568 el0t_64_sync+0x160 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826601:          1 branches:                                 el0t_64_sync_handler             ffff80008001159c el0t_64_sync+0x194 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826601:          1 branches:                                                                  ffff800081829110 el0t_64_sync_handler+0x18 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826601:          1 branches:                                     el0t_64_sync_handler         ffff800081829140 el0t_64_sync_handler+0x48 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826601:          1 branches:                                     el0_svc                      ffff800081829194 el0t_64_sync_handler+0x9c ([kernel.kallsyms])
> 
> After:
> 
>    callchain_test    9187 [002] 599611.826599:          1 branches:             main                                                     ffff83312258 __libc_start_call_main+0x78 (/usr/lib/aarch64-linux-gnu/libc.so.6)
>    callchain_test    9187 [002] 599611.826599:          1 branches:                 foo                                                  aaaae3ed07c4 main+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>    callchain_test    9187 [002] 599611.826599:          1 branches:                     print                                            aaaae3ed07ac foo+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>    callchain_test    9187 [002] 599611.826599:          1 branches:                         do_svc                                       aaaae3ed0794 print+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>    callchain_test    9187 [002] 599611.826599:          1 branches:                             vectors                                  aaaae3ed0780 do_svc+0x18 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>    callchain_test    9187 [002] 599611.826601:          1 branches:                                 el0t_64_sync_handler             ffff80008001159c el0t_64_sync+0x194 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826601:          1 branches:                                     el0_svc                      ffff800081829194 el0t_64_sync_handler+0x9c ([kernel.kallsyms])
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/cs-etm.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index b31d0dd46a45dc365edd7c2f9e9b2eb077ca23db..8d98e772ecb307381b5ed1b4bbc4056e8779b261 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -71,6 +71,7 @@ struct cs_etm_auxtrace {
>   	int num_cpu;
>   	u64 latest_kernel_timestamp;
>   	u32 auxtrace_type;
> +	u32 branches_filter;
>   	u64 branches_sample_type;
>   	u64 branches_id;
>   	u64 instructions_sample_type;
> @@ -1596,6 +1597,10 @@ static int cs_etm__synth_branch_sample(struct cs_etm_queue *etmq,
>   	} dummy_bs;
>   	u64 ip;
>   
> +	if (etm->branches_filter &&
> +		!(etm->branches_filter & tidq->prev_packet->flags))
> +		return 0;
> +
>   	ip = cs_etm__last_executed_instr(tidq->prev_packet);
>   
>   	event->sample.header.type = PERF_RECORD_SAMPLE;
> @@ -3442,6 +3447,16 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
>   		etm->synth_opts.thread_stack = session->itrace_synth_opts->thread_stack;
>   	}
>   
> +	if (etm->synth_opts.calls)
> +		etm->branches_filter |= PERF_IP_FLAG_CALL |
> +					PERF_IP_FLAG_TRACE_BEGIN |
> +					PERF_IP_FLAG_TRACE_END;
> +
> +	if (etm->synth_opts.returns)
> +		etm->branches_filter |= PERF_IP_FLAG_RETURN |
> +					PERF_IP_FLAG_TRACE_BEGIN |
> +					PERF_IP_FLAG_TRACE_END;
> +

This changes the default "perf script" output quite significantly and 
will possibly break people's workflows. synth_opts.calls is true by 
default but synth_opts.returns is false so we lose all the returns that 
we used to have. Not sure if the new behavior is more consistent with 
other tools so we can justify changing it? Personally I think including 
returns by default made more sense, and it's a more literal 
representation of the flow.

itrace.txt says the default is "all events i.e. the same as 
--itrace=iybxwpe", but I thought the default was branches? At least for 
Coresight it is, so I'm a bit confused.

>   	etm->session = session;
>   
>   	etm->num_cpu = num_cpu;
> 


