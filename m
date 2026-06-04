Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3ADCD6E6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 14:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSVB+NeLUKsDZxroUTRNw7PnqK1gg8UhLVVWefTCNJI=; b=YxYUN9HoDpS/7R0bv/hA/0TtnT
	dONArbizJZFEyVAPmkR8JBKumOcMY3HIiPmWZ4su2F45MLlR6xZzFFXYPnV90qEEmf/900fegmphc
	Nxr33TI/f1g8zxVtxC1d/MTkBGV3mG1nY9cEwpbPf9ZWVT/0EnD7RMgE5rbYO5rNkpPvZhwuh2Z8I
	xsO06+0CElRD16Jc1PHAK7oe9scPiT0HbYhvXWnmN2fuulaxhGeukGu3vKEY0PHBZ+Nn/oG4STTJZ
	Os8IgPW+ssgy77UnAAqrSTuEyxuiRMbXTLQ5ymouOCQpn52nD10mziv2aaA1ICi4bbnPwZa5dZiM4
	Luq7++mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV90F-0000000GtHJ-3QdU;
	Thu, 04 Jun 2026 14:24:59 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV90D-0000000GtGz-27IB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 14:24:59 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-68d2342c5e6so1276211a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 07:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780583095; x=1781187895; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TSVB+NeLUKsDZxroUTRNw7PnqK1gg8UhLVVWefTCNJI=;
        b=ZH8dpFoUBc1ewwwz8/4aD5HwnjzNABxkGhtBvRoLgm/xPWAWuIMxEfFB+aR4mkq7xu
         4SoqcanM4wJZlqXvZxktK4UvRT9cPQtqj3WErF3FdAMhClJx9pRTD7VmnpkXUOWoCJlH
         zevwhr8hXygOPfEOH8/u1SUkMicKsBNNwVJRUJvW48+PmZ/Kr45L+AilXa35tN53a9xm
         /bE2zecrtz2tYbabnr5RIccTLO1t21c5ZLbHeHRCmQ/hYUK4yH6jbAd9XmFbOGEdJon6
         vQUqk47a5jCJyKwiFDpQ3qa/VspB8DVp/zzN766XPDWw/McGO8Skc74JhWRCWAzSkfjs
         fYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780583095; x=1781187895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSVB+NeLUKsDZxroUTRNw7PnqK1gg8UhLVVWefTCNJI=;
        b=Sn4Uo4YX0Docr2yqb/a+U8KlxT5zS8lPt8BRp9Y8W8tJhcXwet6afg19b4f1G5Y55m
         KlKW2K/xWq4KlKKjOleu+VWAf/RdA1vECM98KIB/83+jgKcQTngM/BazQZVWhoOcTqwD
         QvJ3uNDROZjinEMY3ONviuO94apFXl5d0LGTQCKrgQoXo7hPX4/XOzjO3uJtusRNGONX
         CPGiJTQ2bnnnMXMbfBIcBmlb8QKgF9BLYrBD/9xJSHWejzyCEhX5hPGbDXTh2kJOJGXL
         JPOPdQQ6uzXEQINDuBRlWi11vGLWffeeglLQGnQ4pP1thwlgKeSfKK5a6pOOu5bhDHpz
         XZ/g==
X-Gm-Message-State: AOJu0YxlB6a3fl2LI1QpBa0RhIAe4UNIsCY7T4Je5v2XN1vNgsBiiCwi
	pvPTtJAihlisdHR9QDKHChlJnD76MInuLFj/QKf5H+WgVvRNchh/r9J7CPkGxmminNk=
X-Gm-Gg: Acq92OHXpdV18aG3qkjGEsmiCeyrG5P4bJ+W6Ay6K+UCuGhBF4Tusllo+toPKZbXknW
	Qd2DL2BZUZz8MUKP94jFWzw8p9w9PmOWmzYAVcHbr6qWCpFc78G0DoBOMLKeCTn+akqXLiXmFyZ
	/JjC4bFGF87K/bGpgSomkcGV83sdDsQY+FsvEvvD1QkIvjpkx8PkpCh07MHHYmZKW9xnsPlb/0a
	U1BMDMFdm/WifZqAGfPUGXnWt13Me7fScN+F12lnFeo1xpispxIWaltfmOyoYcObYHTUaXJBTUp
	N7zag6vE+YRWt/sq+0E3h4pSyOKh1Yq0NCiyCXHWJ+O2tpTBGkp9oRdcErcoSh2xAO1RjlCJPPp
	B/CBrL3PcA1eMAUdYZb6/cWFQPibGxXGGgk6HS0DpU723F5s2W0a1t00WsBfNG1wttC4+eopXaM
	umzxHEFjBOzBAK4/dFVi4lz/BWFW/dly0BpC2tCl8=
X-Received: by 2002:a17:907:aac:b0:bee:875d:af12 with SMTP id a640c23a62f3a-bf0a5a47089mr294470566b.0.1780583095348;
        Thu, 04 Jun 2026 07:24:55 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054dfe3aesm309536866b.37.2026.06.04.07.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 07:24:55 -0700 (PDT)
Message-ID: <a16868a5-c42d-4432-bc91-74778b789ab6@linaro.org>
Date: Thu, 4 Jun 2026 15:24:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] perf cs-etm: Support call indentation
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
 <20260526-b4-arm_cs_callchain_support_v1-v6-5-f9f49f53c9dd@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260526-b4-arm_cs_callchain_support_v1-v6-5-f9f49f53c9dd@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_072457_629821_44D49DA4 
X-CRM114-Status: GOOD (  21.24  )
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
> This commit supports the field "callindent" to reflect the call stack
> depth.
> 
> The branch stack is used by both call indentation and the last branch
> record, which are separate features. Use a new flag "use_br_stack" to
> track whether the branch stack needs to be recorded.
> 
> Before:
> 
>    perf script -F +callindent
> 
>    callchain_test    9187 [002] 599611.826599:          1 branches: main                                 ffff83312258 __libc_start_call_main+0x78 (/usr/lib/aarch64-linux-gnu/libc.so.6)
>    callchain_test    9187 [002] 599611.826599:          1 branches: foo                                  aaaae3ed07c4 main+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>    callchain_test    9187 [002] 599611.826599:          1 branches: print                                aaaae3ed07ac foo+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>    callchain_test    9187 [002] 599611.826599:          1 branches: do_svc                               aaaae3ed0794 print+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>    callchain_test    9187 [002] 599611.826599:          1 branches:                                      aaaae3ed077c do_svc+0x14 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>    callchain_test    9187 [002] 599611.826599:          1 branches: vectors                              aaaae3ed0780 do_svc+0x18 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>    callchain_test    9187 [002] 599611.826599:          1 branches:                                  ffff800080010c00 vectors+0x400 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826600:          1 branches:                                  ffff800080010c24 vectors+0x424 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826600:          1 branches:                                  ffff8000800114dc el0t_64_sync+0xd4 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826600:          1 branches:                                  ffff8000800114f8 el0t_64_sync+0xf0 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826600:          1 branches:                                  ffff800080011528 el0t_64_sync+0x120 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826600:          1 branches:                                  ffff800080011538 el0t_64_sync+0x130 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826601:          1 branches:                                  ffff800080011568 el0t_64_sync+0x160 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826601:          1 branches: el0t_64_sync_handler             ffff80008001159c el0t_64_sync+0x194 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826601:          1 branches:                                  ffff800081829110 el0t_64_sync_handler+0x18 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826601:          1 branches: el0t_64_sync_handler             ffff800081829140 el0t_64_sync_handler+0x48 ([kernel.kallsyms])
>    callchain_test    9187 [002] 599611.826601:          1 branches: el0_svc                          ffff800081829194 el0t_64_sync_handler+0x9c ([kernel.kallsyms])
> 
> After:
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
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/cs-etm.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index ea2424175558ddc0a6f20a9de6c30f377facdc52..b31d0dd46a45dc365edd7c2f9e9b2eb077ca23db 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -66,6 +66,7 @@ struct cs_etm_auxtrace {
>   	bool snapshot_mode;
>   	bool data_queued;
>   	bool has_virtual_ts; /* Virtual/Kernel timestamps in the trace. */
> +	bool use_thread_stack;
>   
>   	int num_cpu;
>   	u64 latest_kernel_timestamp;
> @@ -626,7 +627,7 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
>   	if (!tidq->prev_packet)
>   		goto out_free;
>   
> -	if (etm->synth_opts.last_branch) {
> +	if (etm->use_thread_stack) {
>   		size_t sz = sizeof(struct branch_stack);
>   
>   		sz += etm->synth_opts.last_branch_sz *
> @@ -1505,7 +1506,7 @@ static void cs_etm__add_stack_event(struct cs_etm_queue *etmq,
>   	    tidq->packet->sample_type != CS_ETM_RANGE)
>   		return;
>   
> -	if (etmq->etm->synth_opts.last_branch) {
> +	if (etmq->etm->use_thread_stack) {
>   		from = cs_etm__last_executed_instr(tidq->prev_packet);
>   		to = cs_etm__first_executed_instr(tidq->packet);
>   
> @@ -1914,7 +1915,7 @@ static int cs_etm__flush(struct cs_etm_queue *etmq,
>   	cs_etm__packet_swap(etm, tidq);
>   
>   	/* Reset last branches after flush the trace */
> -	if (etm->synth_opts.last_branch)
> +	if (etm->use_thread_stack)
>   		thread_stack__flush(tidq->thread);
>   
>   	return err;
> @@ -1977,7 +1978,7 @@ static void cs_etm__flush_all_stack(struct cs_etm_queue *etmq)
>   {
>   	enum cs_etm_pid_fmt pid_fmt = cs_etm__get_pid_fmt(etmq);
>   
> -	if (!etmq->etm->synth_opts.last_branch)
> +	if (!etmq->etm->use_thread_stack)
>   		return;
>   
>   	cs_etm__flush_machine_stack(etmq, HOST_KERNEL_ID);
> @@ -3438,6 +3439,7 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
>   		itrace_synth_opts__set_default(&etm->synth_opts,
>   				session->itrace_synth_opts->default_no_sample);
>   		etm->synth_opts.callchain = false;
> +		etm->synth_opts.thread_stack = session->itrace_synth_opts->thread_stack;
>   	}
>   
>   	etm->session = session;
> @@ -3489,6 +3491,10 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
>   		etm->tc.cap_user_time_zero = tc->cap_user_time_zero;
>   		etm->tc.cap_user_time_short = tc->cap_user_time_short;
>   	}
> +
> +	etm->use_thread_stack = etm->synth_opts.thread_stack ||
> +				etm->synth_opts.last_branch;
> +
>   	err = cs_etm__synth_events(etm, session);
>   	if (err)
>   		goto err_free_queues;
> 

Reviewed-by: James Clark <james.clark@linaro.org>


