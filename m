Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B31CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXKQCpYuYiPcndIbQaX7IVVokjA341dpStjQTn3hjd0=; b=gwOpbgVR8GpmK8oY5Lj0Isvhzu
	Mkv4KmD60WzclnElpMtGfaBkyyFnXJa8fELjzIWZTYjBUUFMjvJhlynMFs/a0WlMihxpZ9KexdQt1
	mceBaobtQdPdwb6dTtRS5BrgbgrDpgaGkF+iPe/dvAFyfQjuTooQ/CwkVTqCW6ICtoKV2StdOWA7l
	BvhvL6+gYk9VVBE72iXcXCEzmgZOOV64oAVJZzkyYoC9lgLeC2yaCL+LjtzAarC3/Vr8dqEpqrL8q
	QWNCTQp6zBprwAi8A1wfMmzAdh0x/KRKPmucgKc8xtuvVMdL8DjYLfmUUINy7xi3rOq996nb5wQzH
	2BP0bhvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnAT-0000000H1Pg-1Jy9;
	Wed, 17 Jun 2026 10:06:45 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnAP-0000000H1Oz-3wkO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:06:43 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6924a68e3f3so8907865a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781690800; x=1782295600; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VXKQCpYuYiPcndIbQaX7IVVokjA341dpStjQTn3hjd0=;
        b=pxwUvL2HC/yBHF0zfeIjytyVB+cvvg0c8FzksuntPJTx9UJY6gM83PMbRWhnWiv4qu
         HWIS773Z36FVTSKflYnw47lQ5p3P9fEIcUorhRo1CXzajtE4QelnDevxLyHoBa0nCT8b
         l4KmyPN/Ci5/LcLAs0ZQc2kw5DCvya8z84sJTTEIIomkeWJ/K0niJ9qBdJrT99zTmIPj
         9wawbRhVoonQN+vl7oqfcP7wrZ8kPfulalMS16MHhjVcSMQjIXOwERAzlWtIwOxFl0Yj
         +Iho1PBdM+4/F5pZCc4Z10iHF8wU0woP/ejFg+6G6xyq8YdgYiqVkq3NwOtF4mv0OjgQ
         HOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690800; x=1782295600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXKQCpYuYiPcndIbQaX7IVVokjA341dpStjQTn3hjd0=;
        b=FU1WNaWEp/FhRe0Ftaous9v8Ei0ramRfuitH5VsFwsHzZLaJGo9uFv+W/v7cDp0yHD
         4Jr7Vj1NOXsTR5MXiK3o6oLRqLqqCaEJatC+XAJStbJPunqP9DBSb7Rh2s+Tl6nd4cIE
         0YxktSH9F4Cq7O6U5jn/L81fzdVHPaI+MC8uNTakZLkSq3x0V1ybGB91htQy2zBKWDkI
         i8cYfUAdnQgXFAfRu9D0ynjfJC8NrAnxVuqy/nOuwSpYSZhpfUvGbAxrw+zJkM9L2fup
         lyl0JsFa6KWwLQVYeKWa6bUm+dyjnv5b52p1pMxKZyZdpQPUwWiBESNmbyBs2gfCgMO4
         oj9w==
X-Gm-Message-State: AOJu0YylT2jvV7BsBe82a0xPuZxHGh/KIXKd+M/dpQWa72Alfr0zX38l
	7kayn/ChWkRc9yh2md1luHrXs5zPALa6HFWZ5IJYMIDtTIpX6dTSbf+m9AAl42pGLpM=
X-Gm-Gg: AfdE7clxuKkhMUWZlcEwL0xyROrLlW1wRW6cCcGvlHDqbZfuI9kG6RVBXY7RmWUXGci
	jIczo1w7ljka/jGRZDiFtyb0/sG0n1FvqgCvQPph/rf5jU5FFDUvejlt+Zgmhr+oy1rBqLaa8z6
	91sUvwOJASD9lQGNm/pTCCYjRZDvnj1HYO+ua5arCDVGyPaL/Ssr0bDhR6iUdacJF1RNt4D1SP/
	Kz29DICf+2tq1pnuMxtWP23zwsZbrqrHczAOtv0s65WwD/2Icn/n3yx8aruhiCiVvHNLI+hpSbb
	7zqrzrc3NbDJ62DDoVl5fBleUXxg9r3pMQfNpNsh+3ErRC4UckCTdSEYBLpTiWjJLaiWMrau4FA
	+ajglLCBXmtq3bO5DELut8Kn2P+VvTxoKx4ljxu2NvPcsgI/9PKtQkPfxYn0ROlmWeeYsM209R0
	XTc+bB+sigZcv78LQQgg==
X-Received: by 2002:a05:6402:530e:b0:68b:d82b:fbf with SMTP id 4fb4d7f45d1cf-695474906e1mr1572175a12.26.1781690799915;
        Wed, 17 Jun 2026 03:06:39 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-695647013acsm582858a12.11.2026.06.17.03.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:06:39 -0700 (PDT)
Message-ID: <6446f782-8a31-4455-8d33-a1219bb02981@linaro.org>
Date: Wed, 17 Jun 2026 11:06:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/9] perf cs-etm: Support thread stack and callchain
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
References: <20260616-b4-arm_cs_callchain_support_v1-v9-0-f8fad931c413@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260616-b4-arm_cs_callchain_support_v1-v9-0-f8fad931c413@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_030642_045002_F93AC148 
X-CRM114-Status: GOOD (  29.70  )
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



On 16/06/2026 3:51 pm, Leo Yan wrote:
> This series adds thread-stack and synthesized callchain support for Arm
> CoreSight, which comes from older series [1] but heavily rewritten.
> 
> CS ETM previously kept last-branch state in a per-trace-queue buffer.
> That effectively makes the state per CPU, while the call/return history
> belongs to a thread. This series moves branch tracking to the common
> thread-stack code.
> 
> The series records CoreSight branches with thread_stack__event(), uses
> thread_stack__br_sample() for last branch entries, flushes thread stacks
> after decoder resets.
> 
> A decoder reset between AUX trace buffers is treated as a global trace
> discontinuity, so all thread stacks are flushed, so avoids carrying
> stale call/return history across a trace discontinuity.
> 
> One limitation remains for instructions emulated by the kernel. In that
> case the exception return address may not match the return address
> stored in the thread stack, because after exception return can be one
> instruction ahead. The stack can still recover when a later return
> matches an upper caller. Given emulated instructions are not the common
> target for performance callchain analysis. Supporting this would require
> extending the common thread-stack path to accept both the real target
> address and an adjusted address for stack matching, so this series
> leaves that extra complexity out.
> 
> The series has been tested on Orion6 board:
> 
>    perf test 136 -vvv
>    136: CoreSight synthesized callchain:
>    --- start ---
>    test child forked, pid 3539
>    ---- end(0) ----
>    136: CoreSight synthesized callchain			: Ok
> 
>    perf script --itrace=g16i10il64
> 
>    callchain_test   17468 [005] 1031003.229943:         10 instructions:
>                aaaac32507c4 main+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>                ffff90bd225c __libc_start_call_main+0x7c (/usr/lib/aarch64-linux-gnu/libc.so.6)
>                ffff90bd233c call_init+0x9c (inlined)
>                ffff90bd233c __libc_start_main_impl+0x9c (inlined)
>                aaaac3250670 _start+0x30 (/home/kernel/leoy/test_cs_callchain/callchain_test)
> 
>    callchain_test   17468 [005] 1031003.229943:         10 instructions:
>                aaaac3250774 do_svc+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>                aaaac3250798 print+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>                aaaac32507b0 foo+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>                aaaac32507c8 main+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>                ffff90bd225c __libc_start_call_main+0x7c (/usr/lib/aarch64-linux-gnu/libc.so.6)
>                ffff90bd233c call_init+0x9c (inlined)
>                ffff90bd233c __libc_start_main_impl+0x9c (inlined)
>                aaaac3250670 _start+0x30 (/home/kernel/leoy/test_cs_callchain/callchain_test)
> 
>    callchain_test   17468 [005] 1031003.229944:         10 instructions:
>            ffff800080010c20 vectors+0x420 ([kernel.kallsyms])
>                aaaac3250784 do_svc+0x1c (/home/kernel/leoy/test_cs_callchain/callchain_test)
>                aaaac3250798 print+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>                aaaac32507b0 foo+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>                aaaac32507c8 main+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>                ffff90bd225c __libc_start_call_main+0x7c (/usr/lib/aarch64-linux-gnu/libc.so.6)
>                ffff90bd233c call_init+0x9c (inlined)
>                ffff90bd233c __libc_start_main_impl+0x9c (inlined)
>                aaaac3250670 _start+0x30 (/home/kernel/leoy/test_cs_callchain/callchain_test)
> 
> Note, the test fails on Juno board which is caused by many discontinuity
> packets (mainly caused by NO_SYNC elem). This is likely caused by the
> FIFO overflow on the path.

It passes 20/20 times on my r0 Juno board. But I wonder if reducing the 
timestamp interval fixes it by reducing the rate of trace generation?

I'm just about to send patches that will change it to "timestamp=14" for 
--per-thread mode (only context packet timestamps). And "timestamp=7" 
for per-cpu mode (64 cycle interval).

> 
> [1] https://lore.kernel.org/linux-arm-kernel/20200220052701.7754-1-leo.yan@linaro.org/
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
> Changes in v9:
> - Added patch 01 to fixed thread leak during trace queue init (sashiko).
> - Added check in instruction and branch samples in
>    cs_etm__add_stack_event() (sashiko).
> - Released frontend_thread properly in cs_etm__context() (sashiko).
> - Refined cs_etm__flush_all_stack() to use switch (sashiko).
> - Gathered James' review tags.
> - Rebased on the latest perf-tools-next.
> - Link to v8: https://lore.kernel.org/r/20260611-b4-arm_cs_callchain_support_v1-v8-0-737948584fea@arm.com
> 
> Changes in v8:
> - Updated test_arm_coresight_disasm.sh to pass "--itrace=b" and updated
>    examples in arm-cs-trace-disasm.py (James).
> - Removed static annotation in callchain workload and renamed functions
>    with prefix "callchain_" to reduce naming conflict (James).
> - For callchain test pre-condition check, removed the aarch64 check and
>    added the root permission check (James).
> - Resolved the shellcheck errors (James).
> - Link to v7: https://lore.kernel.org/r/20260611-b4-arm_cs_callchain_support_v1-v7-0-1ba770c862ae@arm.com
> 
> Changes in v7:
> - Rebased on the latest perf-tools-next.
> - Used struct_size() for allocation callchain struct (James).
> - Added a helper cs_etm__packet_has_taken_branch() (James).
> - Minor improvements for the callchain test (used record-ctl FIFO and
>    reworked the validation callstack push / pop).
> - Link to v6: https://lore.kernel.org/r/20260526-b4-arm_cs_callchain_support_v1-v6-0-f9f49f53c9dd@arm.com
> 
> Changes in v6:
> - Heavily rewrote the patches since restarted the work after 6 years.
> - Changed to use the common thread-stack for branch stack and callchain
>    management.
> - Added a callchain test.
> - Link to v5: https://lore.kernel.org/linux-arm-kernel/20200220052701.7754-1-leo.yan@linaro.org/
> 
> Changes in v5:
> - Addressed Mike's suggestion for performance improvement for function
>    cs_etm__instr_addr() for quick calculation for non T32;
> - Removed the patch 'perf cs-etm: Synchronize instruction sample with
>    the thread stack' (Mike);
> - Fixed the issue for exception is taken for branch target address
>    accessing, for the branch sample and stack thread handling, the
>    related patches are 01, 02, 07;
> - Fixed the stack thread handling for instruction emulation and single
>    step with patches 08, 09.
> - Link to v4: https://lore.kernel.org/linux-arm-kernel/20200203020716.31832-1-leo.yan@linaro.org/
> 
> ---
> Leo Yan (9):
>        perf cs-etm: Fix thread leaks on trace queue init failure
>        perf cs-etm: Filter synthesized branch samples
>        perf cs-etm: Decode ETE exception packets
>        perf cs-etm: Refactor instruction size handling
>        perf cs-etm: Use thread-stack for last branch entries
>        perf cs-etm: Flush thread stacks after decoder reset
>        perf cs-etm: Support call indentation
>        perf cs-etm: Synthesize callchains for instruction samples
>        perf test: Add Arm CoreSight callchain test
> 
>   tools/perf/Documentation/perf-test.txt             |   6 +-
>   tools/perf/scripts/python/arm-cs-trace-disasm.py   |   9 +-
>   tools/perf/tests/builtin-test.c                    |   1 +
>   tools/perf/tests/shell/coresight/callchain.sh      | 172 ++++++++++
>   .../shell/coresight/test_arm_coresight_disasm.sh   |   4 +-
>   tools/perf/tests/tests.h                           |   1 +
>   tools/perf/tests/workloads/Build                   |   2 +
>   tools/perf/tests/workloads/callchain.c             |  33 ++
>   tools/perf/util/cs-etm.c                           | 367 +++++++++++++--------
>   9 files changed, 446 insertions(+), 149 deletions(-)
> ---
> base-commit: 44543bb53ebfecb5ce4e890053a666affab9e482
> change-id: 20260521-b4-arm_cs_callchain_support_v1-2c2a70719bcc
> 
> Best regards,


