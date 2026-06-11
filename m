Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3E7CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JsKqgp1n6AXmb14SRj6QHkb3JGSi6WYvxFs7FRLG/FY=; b=UoeUnSvBDdwXF5MWuALxIiryMs
	9oAurgyi3veJqzeKPMFCKbOmOna+/XUEnDd46TTFJs+0UOBtJ/6w1muind1JWO1QTbw9FQQBDesLP
	REbEKh205mTAbezWLSsI3S5ARnhCpG7by3TGnTFBtW0zjcjhUOt5RP3QLQgJ2X2lf5u6XVIuJJNNQ
	gHtB6MLhiAqU6AApqkWnokh8PJtEOCNfMKLT6K8Ci9XUX7WXVk6zicVajh9pOSSzBusq5Syq4SrfC
	gA8G9kVs40InRUiREh/kx+4ebOoFr7EeZP4WY9XVPMfZ+hNmWvXHIsA0w5oSDcGCt2PwbuOpAOPFa
	ps9iOPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbFU-000000094bN-32o0;
	Thu, 11 Jun 2026 08:58:52 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbFS-000000094Yl-1kgW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:58:51 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6930f7e83b1so483695a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 01:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781168328; x=1781773128; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JsKqgp1n6AXmb14SRj6QHkb3JGSi6WYvxFs7FRLG/FY=;
        b=ASeBWp7YzrcDi3Yze4QH8Z6T7FwSbFtmO2Lbv7N/eTzOUGL5MszLocCIz5aTi1xjax
         BxP+lm5UT2CU77FUl7wIWtBP/+MyZ6JrPkKjMlZj+cltCcYXx/izshrg9FKVbvO7whNj
         Cghk5ogBVf/gL9U2kLSgV1XHvwqzsfznpGeBup4jjMdUada6Jc/gfnL0hmksVn/wBfbX
         JGl9SPuqZ0ORoYOm9d5CYbVKBnbKX4D7NRB0x3FBo1x+onqRHrsD6S2tW+AZCgFO/tXx
         TkaTrNRlu8IQKCs+qMQ/l4sjtBoZVR1OmPZsD9c9N52NeaYzk1EnZa8464m5mxgGRLg4
         6KJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168328; x=1781773128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JsKqgp1n6AXmb14SRj6QHkb3JGSi6WYvxFs7FRLG/FY=;
        b=K+qUTLHk0If6C+OpP3S5tg7UQLGd4VTuvdpVm4wiJda7CiaR0LcghlPEV3WTe9Mbw5
         a3bcvRTrFRO5yFAihxWp7ogylVX61IHHhOabrl+xWv5944TsRvnfo3Fko03eFPKQKg56
         wOkg6hodYyyUqhMgpL7h8iJnRTrgJCZn1wkwx9mfc1U7k/z0gZWrBPnUigAlW45Slmlm
         lz6wE7NjLpTmTQocKAvxm7GEUwgZm9Eu0pNgLcZC9fU9Gz+k0nr1HQ2qa1pSWSi9FSwf
         2eJwy+cD5nK0XdlkO0hOLet0zz8XkSgRLL/jPca08LVyYT3365peGuGyVylJ3a71SrQz
         58qA==
X-Gm-Message-State: AOJu0YyG3Lp/MWlVIs8h/pt36/nb6NLSbJrK/R5VsA0T69A4Ffaa3+6u
	IhxjYx9ABZGRdnfo2bU4EOrZp79ZftGyFwKY6S/G2G9NufgY2jndFYj/nUAUxjDDmFI=
X-Gm-Gg: Acq92OEsPsJ53Nhw+VoehutrMlk+AZeiRdiMVQCM2eljNm0RdfBCsPPOh6LeNpyuc7x
	1lyfeFCZrhlaxJpBk6g+0rXpCEcyk6kgIKy4HZftx44PRymZfBMiFCBSPlAZEJCBAh8UsrWlkJ3
	1DOQ7HeakAMZUxVaayp5hZFYtoZDZL14YyQH3JHHze24Y4FV7xqo8Ez4ghJb0AktlhPFS36+U+l
	a/do7v1DcomVd81BmTB/kreDKWCHd3xohDI/OiQov36Fb3iLobtpo7MZFJtHiA0VK5j0CxzLGcE
	A5DH+8x7YT7AqPjlIGNpwn5XbEvfoDi5sYUnpZM2MuFUnLPKepYtY56HxRUlVAYBC9KEgNxeiDk
	Cq0VMwxh4G8w85RamxUKvovEYIIHD6oR29rE2MMSbDRIK67lHQOplzpTTXzguv25mMqDxj3q6Cf
	4vHZQO0bWDi85B10fawwcaN9UN8B4enDSiNexdhY0=
X-Received: by 2002:a17:907:3d4e:b0:bdf:b9fa:6683 with SMTP id a640c23a62f3a-bfc77004697mr82172666b.14.1781168328106;
        Thu, 11 Jun 2026 01:58:48 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm10683893a12.0.2026.06.11.01.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:58:47 -0700 (PDT)
Message-ID: <81db69cb-ca86-45c2-b768-cf588c634270@linaro.org>
Date: Thu, 11 Jun 2026 09:58:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] perf cs-etm: Filter synthesized branch samples
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
References: <20260611-b4-arm_cs_callchain_support_v1-v7-0-1ba770c862ae@arm.com>
 <20260611-b4-arm_cs_callchain_support_v1-v7-1-1ba770c862ae@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260611-b4-arm_cs_callchain_support_v1-v7-1-1ba770c862ae@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_015850_508889_BA8B553A 
X-CRM114-Status: GOOD (  20.42  )
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
> From: Leo Yan <leo.yan@linaro.org>
> 
> The itrace 'c' and 'r' options request synthesized branch events for
> calls and returns only. For perf script the default itrace options are
> "--itrace=ce", so CS ETM should emit call branches and error events by
> default.

You need to update test_arm_coresight_disasm.sh to pass --itrace=b for 
both tests now because it needs every branch, not just calls. Should 
probably update the documentation and examples in arm-cs-trace-disasm.py 
too.

With that,

Reviewed-by: James Clark <james.clark@linaro.org>

> 
> CS ETM currently synthesizes a branch sample for every decoded taken
> branch whenever branch synthesis is enabled. This produces redundant
> jump and conditional branch samples.
> 
> Add a branch filter derived from the itrace calls and returns options.
> When neither option is set, keep the existing behavior and synthesize all
> branch samples. When calls or returns are requested, emit only branch
> samples whose flags match the selected branch type, while preserving trace
> begin/end markers.
> 
> Before:
> 
>    perf script -F,+flags
> 
>    callchain_test    6114 [005] 331519.825214:          1 branches:   tr strt jmp                           0 [unknown] ([unknown]) => ffff8000803a3a68 perf_report_aux_output_id+0x50 ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   call                   ffff8000803a3a74 perf_report_aux_output_id+0x5c ([kernel.kallsyms]) => ffff8000817f4d88 memset+0x0 ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   jmp                    ffff8000817f4d8c memset+0x4 ([kernel.kallsyms]) => ffff8000817f4c00 __pi_memset_generic+0x0 ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   jcc                    ffff8000817f4c1c __pi_memset_generic+0x1c ([kernel.kallsyms]) => ffff8000817f4c44 __pi_memset_generic+0x44 ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   jcc                    ffff8000817f4c4c __pi_memset_generic+0x4c ([kernel.kallsyms]) => ffff8000817f4c5c __pi_memset_generic+0x5c ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   jcc                    ffff8000817f4c5c __pi_memset_generic+0x5c ([kernel.kallsyms]) => ffff8000817f4cf0 __pi_memset_generic+0xf0 ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   jcc                    ffff8000817f4d30 __pi_memset_generic+0x130 ([kernel.kallsyms]) => ffff8000817f4d68 __pi_memset_generic+0x168 ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   jcc                    ffff8000817f4d78 __pi_memset_generic+0x178 ([kernel.kallsyms]) => ffff8000817f4d6c __pi_memset_generic+0x16c ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   jcc                    ffff8000817f4d78 __pi_memset_generic+0x178 ([kernel.kallsyms]) => ffff8000817f4d6c __pi_memset_generic+0x16c ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   jcc                    ffff8000817f4d78 __pi_memset_generic+0x178 ([kernel.kallsyms]) => ffff8000817f4d6c __pi_memset_generic+0x16c ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   return                 ffff8000817f4d84 __pi_memset_generic+0x184 ([kernel.kallsyms]) => ffff8000803a3a78 perf_report_aux_output_id+0x60 ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   jcc                    ffff8000803a3a98 perf_report_aux_output_id+0x80 ([kernel.kallsyms]) => ffff8000803a3b04 perf_report_aux_output_id+0xec ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   call                   ffff8000803a3b1c perf_report_aux_output_id+0x104 ([kernel.kallsyms]) => ffff8000803a38f8 __perf_event_header__init_id+0x0 ([kernel.kallsyms])
> 
> After:
> 
>    callchain_test    6114 [005] 331519.825214:          1 branches:   tr strt jmp                           0 [unknown] ([unknown]) => ffff8000803a3a68 perf_report_aux_output_id+0x50 ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   call                   ffff8000803a3a74 perf_report_aux_output_id+0x5c ([kernel.kallsyms]) => ffff8000817f4d88 memset+0x0 ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   call                   ffff8000803a3b1c perf_report_aux_output_id+0x104 ([kernel.kallsyms]) => ffff8000803a38f8 __perf_event_header__init_id+0x0 ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   call                   ffff8000803a39c0 __perf_event_header__init_id+0xc8 ([kernel.kallsyms]) => ffff800080105258 __task_pid_nr_ns+0x0 ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   call                   ffff80008010528c __task_pid_nr_ns+0x34 ([kernel.kallsyms]) => ffff8000801d5610 __rcu_read_lock+0x0 ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   call                   ffff8000801052b0 __task_pid_nr_ns+0x58 ([kernel.kallsyms]) => ffff800080192078 lock_acquire+0x0 ([kernel.kallsyms])
>    callchain_test    6114 [005] 331519.825214:          1 branches:   call                   ffff8000801923f4 lock_acquire+0x37c ([kernel.kallsyms]) => ffff8000801d6da0 rcu_is_watching+0x0 ([kernel.kallsyms])
> 
> Fixes: b12235b113cf ("perf tools: Add mechanic to synthesise CoreSight trace packets")
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/cs-etm.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 5e92359f51a7cb87a26866ae71466fcce809d551..c2b0f98ceee7671d0e98cfe5673c6f4ec19707a5 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -70,6 +70,7 @@ struct cs_etm_auxtrace {
>   	int num_cpu;
>   	u64 latest_kernel_timestamp;
>   	u32 auxtrace_type;
> +	u32 branches_filter;
>   	u64 branches_sample_type;
>   	u64 branches_id;
>   	u64 instructions_sample_type;
> @@ -1681,6 +1682,10 @@ static int cs_etm__synth_branch_sample(struct cs_etm_queue *etmq,
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
> @@ -3517,6 +3522,16 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
>   		etm->synth_opts.callchain = false;
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
>   	etm->session = session;
>   
>   	etm->num_cpu = num_cpu;
> 


