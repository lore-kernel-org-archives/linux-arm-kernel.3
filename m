Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7539ECA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAoykZR6asRmW0K7OS4CG9fLxAWwLUV9JiX7VJ+7PxE=; b=JGKIUMY6+29w3rhdJWAjMvu7iE
	qhu8Oxxkstt2+FGUjHhdjEP2b8CemxdrkAXIfhtZh87y2nKhHuxaD1YUExIoJpa0slvakSYT31lhX
	R5Bs/TplteF8d6b46Q8+XZgiOmgf1+ZGq7w9uRfXIv4QfP7mjvhiTsuYrBhFTth84NphFwR4yF88c
	CMoEA1QuTaxUlRUgZeLudd2ogtsr19U10Do+axTuP5KE+ukaKfTgk52UxKjUxKVS+zZ62ASOT7MZ3
	6qqZ3qC13W+thrR9VeTGSH1BnsQnTDOWcY1jCbPv20Ki7Sa5pJxZMBnruxxI8I03oa/QW67ImWbVA
	jjAcd9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWrP-00000003VzA-0WyG;
	Tue, 29 Sep 2026 12:23:03 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWrL-00000003Vy5-3R7X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 12:23:01 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so14952865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 05:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790684578; x=1791289378; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oAoykZR6asRmW0K7OS4CG9fLxAWwLUV9JiX7VJ+7PxE=;
        b=OodaUjvMfXgFAoDdz134Qwk1zgRcYWfUPym9DuZnx5NF9cPRhNv3DrfoY6xcORmtqh
         OFbxAIZ1IW39jEwxoVv1Fy9QPRx6+p69lWCADpT8thvKF/kC0+S0h+6mrkWJA6PnkVDX
         DZi/i1Uq9N/aaXvr0SZ0HclIKfU0lTKaO3qnd52vMa/5voc+kVuwrRhlBD0M+Ok8JJIs
         m/00WIlWomq79inxYdaOA6E63ketX5hKqZqc78crwZusXpolamIjLPxG9Ni0dgLxOHyx
         MdA1wRztjHcZXyecS4C+3om5uxI3e5lNsZ4gdt2u4V8jHMhontXD30ZY6alMjoEUx0tU
         6q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684578; x=1791289378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oAoykZR6asRmW0K7OS4CG9fLxAWwLUV9JiX7VJ+7PxE=;
        b=OgvyBieXiaV+r3fPQ+knGIBOc7nuFHIc17uka4g2yZE5pfEHjGWvYRdV/IK6q8yE59
         +nDO7gMaiQoeq/diQueY+aGypiv/PE66j46lxGsHwP9w3p12/ucdICzkNqBXR1Wzjgl3
         avWE46JkUl7g9VDTJrXKGBqKT1W0tEKkkQ8hvy2FmYQBhZvNSOIfk2pDQAbtBXSnzoQ0
         e4Yi/i0a886+sOy2A5Y4U9F+cR6w0xVe3PY3FNF3xhCEAf9lFx/g4n+m0fvDdC0dii27
         peIAMfPEmIS0CpTXlNUNQ2dyoHck5JsIZdJqPC3A/WLcP4PW8v0ljsibL7kR4Ztmyhlh
         tlzA==
X-Forwarded-Encrypted: i=1; AKwUvBzn5PbkdnVmK98s0HBLTwsSVHujWRve+qLypKp250dQvNtO+U7zwHeO+N0oaehRrVydJVeTbg7Je56RuV0ENySR@lists.infradead.org
X-Gm-Message-State: AFuF++lulfWtuclwbikbE+lfjFVduLs16d37Y+CkzUPEAvg7JaVJMsqQ
	akroSTLQrv5q6uUEgcMPIwDCLauPcgp+4bP7uwuG6AfdETVbp82sUDn4aAy098AEwOA=
X-Gm-Gg: AYBFou25l2BzylBs7Agl/QaqdTHzt1PWoz7nUjTSiP34h2WNLiTEz29kQ/4zvKjJiyY
	hb/YxvxilPqXta18VieMaC9MH0ya9RyLNffw8BqbnlMUfweRkCxZb67b06y42Hrcmz6jMHEmnd4
	UsKB4HXOaI1Qiazb/BJHGzzGkNHquC8ztAD8xxPeuVvCIvFlS4iFgSV5NjsKgf0u7ghtFgTDxPr
	jl8veubdLO9JyBxw/CPb+k0cejVcr8r2eGSlvMKgTC+pt3Z1mE2BkhXviECcKXILS2qpnD43lhK
	sw6rgWKIwX+MGrEzrTj6W8TlDo++vfDKWT/gXlAARR+Q4MiW961uhJ62nhlq7pQiWh+INFnYgsR
	kEREcpFnFi2EMYLoMXjswLFPSI9BxO/hRwNPURIZhtF1VIbkWY6YxYAJGU1x6RuXlzWsWCdR5wK
	0fub2FophVvPTfKuF1eqqIwucwjJ5n8lr59XyUNH5e+OjhowrJBD3Sxlk1RHtyKQbdadq5YW1xf
	mA=
X-Received: by 2002:a05:600c:4ecf:b0:4a0:108:3b54 with SMTP id 5b1f17b1804b1-4a001e8c316mr100957425e9.32.1790684577698;
        Tue, 29 Sep 2026 05:22:57 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013b8f6f5sm5072545e9.10.2026.09.29.05.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 05:22:57 -0700 (PDT)
Message-ID: <d371220f-9ad2-41ca-a2a5-930c46801c31@linaro.org>
Date: Tue, 29 Sep 2026 13:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] perf tests: Check CoreSight IRQ entry and exit
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Mike Leach <mike.leach@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
 <20260923-perf_cs_etm_fix_non_taken-v2-11-6ab8c07a5455@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260923-perf_cs_etm_fix_non_taken-v2-11-6ab8c07a5455@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_052259_910475_4D107005 
X-CRM114-Status: GOOD (  30.44  )
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



On 23/09/2026 16:21, Leo Yan wrote:
> Add an AArch64 branch_not_taken_loop workload and a CoreSight shell test
> checking IRQ entry and exit PCs. Use cpu-clock generates timer
> interrupts.
> 
> Retry at different timer frequencies and skip if no complete pair is
> captured.

Maybe we need to look into storing existing recordings somewhere or 
committing small ones into the repo again. This test took 3 minutes to 
run on my N1SDP, which is 3x longer than the entire Coresight suite, and 
then it skipped anyway:

173: CoreSight IRQ entry and exit:
---- start ----
test child forked, pid 6804
Recording timer IRQs at 1000 Hz
No complete exception entry/exit pair
No complete IRQ pair in this recording
Recording timer IRQs at 4000 Hz
No complete exception entry/exit pair
No complete IRQ pair in this recording
Recording timer IRQs at 10000 Hz
No complete exception entry/exit pair
No complete IRQ pair in this recording
[Skip] No complete IRQ pair after three recordings
---- end(-2) ----
173: CoreSight IRQ entry and exit


Really this test is only looking for how a single exception on a single 
branch is decoded, it shouldn't be affected by how it was recorded. Even 
a few bytes of trace would be enough to test it. Or maybe we could add 
some kind of unit test framework that mocks out OpenCSD and allows us to 
script how different packets affect the decoder?

But we have to be careful to not add slow tests because it means they're 
much less likely to be run, or results ignored as it's so hard to 
iterate quickly. Or also in this case, silently skipped if something 
regresses.

> 
> For example, an expected hw int/iret pair is:
> 
>    hw int           5cc928 => ffff800080010c80 insn: 63 04 00 f1
>    ...
>    iret   ffff800080012284 =>           5cc928 insn: e0 03 9f d6
> 
> The entry PC is the architectural resume address, here SUBS X3, X3, #1
> at 0x5cc928. After the IRQ is handled, ERET returns to the same PC to
> continue execution.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/tests/builtin-test.c                    |   1 +
>   tools/perf/tests/shell/coresight/irq_entry_exit.sh |  37 +++++
>   tools/perf/tests/shell/lib/coresight_exception.sh  | 165 +++++++++++++++++++++
>   tools/perf/tests/tests.h                           |   1 +
>   tools/perf/tests/workloads/Build                   |   2 +
>   tools/perf/tests/workloads/branch_not_taken_loop.c |  33 +++++
>   6 files changed, 239 insertions(+)
> 
> diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
> index 6259ed805c5f75799d52ac742b77cf278f98bd9d..8eab221f115e75a3ef90be975d4ed0558ceb2b16 100644
> --- a/tools/perf/tests/builtin-test.c
> +++ b/tools/perf/tests/builtin-test.c
> @@ -171,6 +171,7 @@ static struct test_workload *workloads[] = {
>   	&workload__datasym,
>   	&workload__landlock,
>   	&workload__traploop,
> +	&workload__branch_not_taken_loop,
>   	&workload__inlineloop,
>   	&workload__jitdump,
>   	&workload__context_switch_loop,
> diff --git a/tools/perf/tests/shell/coresight/irq_entry_exit.sh b/tools/perf/tests/shell/coresight/irq_entry_exit.sh
> new file mode 100755
> index 0000000000000000000000000000000000000000..f164daa222b0550ceb106aa6a1215740a1432017
> --- /dev/null
> +++ b/tools/perf/tests/shell/coresight/irq_entry_exit.sh
> @@ -0,0 +1,37 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# CoreSight IRQ entry and exit (exclusive)
> +
> +# shellcheck source=../lib/coresight_exception.sh

No need for these anymore, see 
https://lore.kernel.org/linux-perf-users/20260921-james-perf-shellcheck-source-v1-1-adcfc107c997@linaro.org/

> +. "$(dirname "$0")/../lib/coresight_exception.sh"
> +
> +test_irq_entry_exit()
> +{
> +	# IRQs must return to the interrupted PC. Retry at different timer
> +	# frequencies if trace gaps leave no complete entry/exit pair.
> +	for freq in 1000 4000 10000; do
> +		echo "Recording timer IRQs at $freq Hz"
> +		if ! record_trace_with_cpu_clock "$freq" branch_not_taken_loop; then
> +			cat "$tmpdir/record.log"
> +			echo "Failed to record the IRQ workload"
> +			return 1
> +		fi
> +
> +		decode_trace || return 1
> +
> +		check_exception_pairs "hw int" "iret" 0
> +		result=$?
> +		case $result in
> +		0) return 0 ;;
> +		1) cat "$tmpdir/script.log"; return 1 ;;
> +		2) echo "No complete IRQ pair in this recording" ;;
> +		*) return "$result" ;;
> +		esac
> +	done
> +
> +	echo "[Skip] No complete IRQ pair after three recordings"
> +	return 2
> +}
> +
> +setup_exception_test || exit $?
> +test_irq_entry_exit
> diff --git a/tools/perf/tests/shell/lib/coresight_exception.sh b/tools/perf/tests/shell/lib/coresight_exception.sh
> new file mode 100644
> index 0000000000000000000000000000000000000000..f0133c258625147405ba4641ff7e442437fc66b8
> --- /dev/null
> +++ b/tools/perf/tests/shell/lib/coresight_exception.sh
> @@ -0,0 +1,165 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Common helpers for CoreSight exception entry and return tests.
> +
> +cleanup()
> +{
> +	case $? in
> +	0|2) rm -rf "$tmpdir" ;;
> +	*) echo "Test files retained in $tmpdir" ;;
> +	esac
> +}
> +
> +record_trace_with_cpu_clock()
> +{
> +	local clock_opts=()
> +
> +	record_freq=$1
> +	shift
> +
> +	# A zero frequency omits the cpu-clock event.
> +	if [ "$record_freq" -gt 0 ]; then
> +		# Generate timer IRQs without delivering a signal to the workload.
> +		clock_opts=(-e cpu-clock:u -F "$record_freq")
> +	fi
> +
> +	# FIFO control bounds the trace to the workload.
> +	# --kcore supplies the running kernel's instructions for decoding.
> +	taskset -c "$cpu" perf record -B --no-bpf-event --per-thread --kcore \
> +		-e cs_etm/timestamp=0/uk "${clock_opts[@]}" \
> +		-m,4M -D -1 --control fifo:"$tmpdir/ctl","$tmpdir/ack" \
> +		-o "$tmpdir/data" -- \
> +		perf test --record-ctl fifo:"$tmpdir/ctl","$tmpdir/ack" -w "$@" \
> +		> "$tmpdir/record.log" 2>&1

There's a shellcheck warning here:

   (warning): Word is of the form "A"B"C" (B indicated). Did you mean 
"ABC" or "A\"B\"C"?

You can avoid it by passing the whole path as "$cf" and "$af" like the 
other coresight tests.



