Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9FAC43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VzBTGZrdgpQvGtlKCw94HtWGY2NhejYI3ygK47bEVw=; b=PMcAOzK+qBCcazpOhioO669S+u
	1P/ZiCBhAmSwMPdQt4DU8H3bFU+ETTF+rPsseWpU/Fsn25nKRJHla5QDgQgyb23flcc9tEnqvHsLA
	RqmGXexfWuyTOIAUKKzqBYaJcACAqAfGDYqWH2bHgWcCVdbNJOg2NovszXO3nCM+lzgxMKcXwDlep
	9E9ezJZ5ZVUm8YO6Fh+1l2eP5SMLDIscX9LC3QncEDSChewfKseXklMmIT0eqzpUL7HVCpJFVoDfa
	LHJ/876boHnYNhvkl4ZsGeL/AZM3EJB3qKtYy3vfPTpUiZ1lW/Un15UVM9G/fg3F8xafgFKEQS5LA
	9EgorcGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8JW-0000000EAEm-00pG;
	Mon, 29 Jun 2026 09:30:02 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8JT-0000000EADu-15Sw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:30:00 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so21699885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 02:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782725396; x=1783330196; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5VzBTGZrdgpQvGtlKCw94HtWGY2NhejYI3ygK47bEVw=;
        b=GryF9Y9RlH6AJ6lbWEj+IRoHYP5fScyxgCjbk/8ahYswIPRFKkeHOVIBLqKJhzsGub
         TYiwuvtYVca+owzjoMPyfmnuKAovfz8Hb4Dzhuf9GKfZYmwkEdfF1fTS75sBJ4mUtLjf
         xUjQvZh/7W899etDOjdVts9Mw+mIdhjhGsrDbDDoUbY7wrdfDZasMAw4SwOjIYNp/ABL
         +E58TD/qnU0z1flU6WWy5edARuNs2qh84QopC6UtG6vcXRpNTESfjMGBgazlZUnEyLBt
         G8LR7bcgCMFVNWM57mpg1cUR16YPa0aMD9pvICIzfzOPi3wV6UNml21JUpADJZfWCOgA
         8CTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725396; x=1783330196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VzBTGZrdgpQvGtlKCw94HtWGY2NhejYI3ygK47bEVw=;
        b=Yf4jwbIrsCNy7M3nrVKD3isKPbNRK0bhUtfJQDYdsslkokm5KAwGnR6bMl5PdfbDZQ
         U6eR7N0pW1FJ26hjMai7dyW6uwZY+8MBqyfheKIsTxQ9uH2v0u4JaLuBDp1kQTUy6c4d
         jJYc4W+JDWfR5Ce91ukoY7tviIo/gp4Z011gRbrogIkdz8y3SrPPiI/2BXMgPIo3qxFI
         StfIu6awIfCGgKgaLZQpBCASGb/NbjUUjag4xe4mDgjTrmEDZ3e8G32XxnLS5p0NWiGX
         O2g+hyU8OSZ556pPbQrdaaKRckXG1ZBcCmrCBM8LYxPo1MwZ5i9kVEV3COyZs5YwVtqK
         Dfgw==
X-Gm-Message-State: AOJu0Yye6FTq1xjT6Fgf5hTJmxySznNW4EZHBoDvC/rOMxIHKFejh39z
	wzyEZrEnZdh6LpebYUN35ZuP+vwpMo/vrFTH957NR8CxnLXx5TtZuoahAENmZGLACoUTfgw3sLV
	fdUy/I/4gng==
X-Gm-Gg: AfdE7cmSTP9ews+BuHZUv9wxC4d+ZxJi32dlt0TWszq0qOlhCLxO7bjw7F8HDkhPoYt
	HUzG6pTNbEPbfX2MciB6bA1jpEeWy8kzSzAw+P8K4ckZ4KEhd+KuYlQ4MMw0voa2R+b+tUr5ZnJ
	VyJbhtujCJioE40FRvDXicjopy2uAj605TxLo9JKlakGqLlQS6Lucbw+c9hKLSaGq+GvLByYi8L
	WxIKWg4rZwXjDhCo59whbPsv9JWTgA5+vJnnsRPM/8JqForf5q2bpzU3ex/XqZsCbckX8rWtBBs
	UIAYQWRyPD8HLWTtjvQjqixUqLCAkDGK1/MJe6OLrj/MB1gl1OwL1oMc8SdaL8j0uwMaiF+2xBX
	SZ385H69zyLnMFOPrLr/Nbv2umaf/h+kNOmQnHPZHFUtimzNpGwRfNTzfMPbQeK0mDJdOefxJaH
	OaaDe2HC4cuBz2Bzjz2g==
X-Received: by 2002:a05:600c:4e4b:b0:490:b724:5085 with SMTP id 5b1f17b1804b1-4926689ab05mr226507435e9.33.1782725396228;
        Mon, 29 Jun 2026 02:29:56 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492690100c7sm331873245e9.12.2026.06.29.02.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:29:55 -0700 (PDT)
Message-ID: <9918583c-30c0-44c6-9a3f-26b02654b53b@linaro.org>
Date: Mon, 29 Jun 2026 10:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/9] perf cs-etm: Support thread stack and callchain
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
References: <20260617-b4-arm_cs_callchain_support_v1-v10-0-e8b6e5d63db5@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260617-b4-arm_cs_callchain_support_v1-v10-0-e8b6e5d63db5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_022959_362196_B2501B56 
X-CRM114-Status: GOOD (  29.04  )
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



On 17/06/2026 4:08 pm, Leo Yan wrote:
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
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20200220052701.7754-1-leo.yan@linaro.org/
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
> Changes in v10:
> - Change to syscall(SYS_gettid) for build failure on x86 (James).
> - Extracted sample thread stack into cs_etm__sample_branch_stack().
> - Link to v9: https://lore.kernel.org/r/20260616-b4-arm_cs_callchain_support_v1-v9-0-f8fad931c413@arm.com
> 
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
>   tools/perf/util/cs-etm.c                           | 377 +++++++++++++--------
>   9 files changed, 454 insertions(+), 151 deletions(-)
> ---
> base-commit: 8c214ad8cb8d692c82c6466b8e88973dbfa8e064
> change-id: 20260521-b4-arm_cs_callchain_support_v1-2c2a70719bcc
> 
> Best regards,

Reviewed-by: James Clark <james.clark@linaro.org>


