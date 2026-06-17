Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC20FCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77m7XmxZxoMZ+hJVVcRi6NTPfR6X7G0M3uaxyWlQVUo=; b=dw2qH8MJZkP5tX74sopPXs/fQW
	NcCp14gRENrpoYtOxIsO7jcgtGPnhj1Br3FyLQ9NkVDjzOrkvZIYDfPmml75RqP3mYKsztc2JK36C
	opx5cHEhvHG0o4+cURgvrl0TT/L56nixcvj6GQ57ZImgk7fzDaa6E3Y5lxvWyV5rAxquWEbnEGAa3
	rsKPy6m6d4a44mNw2RYnsa1pHtP05iFRZjhD2RZI4rDSICvOvjefKJM+IRlKnynQOzc4Yojz1Onlz
	vRKVhr2Tnzm/85aD5fpVtCD4PGTsusN+kc1H7Iouu/mc6WNSMhB274PYmqG5RIlHSdSHqqfaZXTeB
	m4hoS8QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZn74-0000000H10L-2jnD;
	Wed, 17 Jun 2026 10:03:14 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZn71-0000000H0zv-0zqq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:03:12 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c03a466c96aso476584766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781690589; x=1782295389; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=77m7XmxZxoMZ+hJVVcRi6NTPfR6X7G0M3uaxyWlQVUo=;
        b=PcziyZIDbuQdfN6pKGiq+HfjBWd3hvf8s+6DjX9nW8YjU+9ubXvsDIgB4f69xj2q58
         /opNLcmhT5sWFYDCUv5uNSdQb/lwMlmPZXnNTty00felAa+ZdI7iTzl9opsazxcJyT7i
         xeB+ReVeEz5fni85iiCt5yehWBGa0BVB/62oXZEKGVzKkzqFG/WOl3u8FIRwnnZhgzL7
         1IEmu2f+EqbOpkKCU2bN6QLqEtjYbEw72fRW2RozkzTs7vbR8V2HsKGPyBs3rtvNIhdO
         95iv4ikf0P3bRV6bMf1GF2BnZRV+tTcjLj9RqUZRFkiqREfJkD5ybnW+8qTiKKl3qvTq
         EMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690589; x=1782295389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77m7XmxZxoMZ+hJVVcRi6NTPfR6X7G0M3uaxyWlQVUo=;
        b=sH4MNdBbm1h2qkxbf7l5r1QcffcFEZme7fMJRC16ymT56RTVVscB8Psj+akNfFkmWZ
         eAeXeqr7g1JYANYT7T751hobkcs9c67+pvuwlf3sEC0jRFZQ/Qq7O1W7Tg9b/XEohWKY
         8p54oXWiI1sF/Q3FrJ8Je7Mc+eaqcRfvQMEbDOewOgjPgLdlZh2gVT5CwRVaZ+nssrel
         40bEh+hzr7ZcIMXlthcA6oFQHYuKUorrN6y3tM6fRkcsVSwMOEqA+3Sv4Dsn+dhHPUXX
         10dkDPGMgJwZmZX7yzcOhFKPpfF97QsTqlXH3UVn7wZNDuJtxPI+XvjjEGnCHUxvqdjp
         YNXQ==
X-Gm-Message-State: AOJu0YwADBeavVBjIeynPbqml5HFvtYccLVICOjFLMiYSlg/UykY6J/c
	vhBhknJKVhssTYyNkODLIp6S6Qgvy488C5Qigzcy5f7gC2LXWmGNyBq67TrFznz16tQ=
X-Gm-Gg: Acq92OG1cCX32QRfc2B3lLru4hCLNTKEwnQdeSvUUO3BRSyg3tZxIIvk1P7miwQ/hGA
	QQ6n0EQ3QawKA7Q/7uihidK3/mOe+t56EkjSIg+5N5lqSOJLqC2KtcK5cXwkByzYDEF6pyxMWLe
	R0+cJeJHxHH8atkFfbqX8iG9cJEDMOkYo8W7nHNle3qs+orSzNvMdQ3medQ4+fiecCWUk7sj248
	CbdPIJ0wXthE2lJJ3+Ex/sgFmWkjzq5DKcABioPtPK1/dHNY6dgaEJ2g2KB0lxUF6899+28WHqi
	ppc9qwSXamwgAIE/DrhdzVG1h+SNH4RCiE0Sw7P9a7hzNQWrVC1QPDSEUSMQ4tEaYeYvVjmw+e0
	QwUkrweZ0zYHy+nxCTng5IiRqr06ks1kUd48Lcma80N0J6KewW3K4TGFTiLWhpOHyP0WSnRkzok
	FhK50cIhM96CWi19jTJA==
X-Received: by 2002:a17:907:3f83:b0:bce:80db:77ef with SMTP id a640c23a62f3a-c05a7db0e15mr179278266b.43.1781690589017;
        Wed, 17 Jun 2026 03:03:09 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b22136sm794143666b.15.2026.06.17.03.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:03:08 -0700 (PDT)
Message-ID: <6855d77f-d2f4-4dab-8481-a8c586e4872b@linaro.org>
Date: Wed, 17 Jun 2026 11:03:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 9/9] perf test: Add Arm CoreSight callchain test
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo
 <acme@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Mike Leach <mike.leach@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Namhyung Kim
 <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>,
 Paschalis Mpeis <paschalis.mpeis@arm.com>, Amir Ayupov <aaupov@fb.com>
References: <20260616-b4-arm_cs_callchain_support_v1-v9-0-f8fad931c413@arm.com>
 <20260616-b4-arm_cs_callchain_support_v1-v9-9-f8fad931c413@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260616-b4-arm_cs_callchain_support_v1-v9-9-f8fad931c413@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_030311_369640_0D46B84F 
X-CRM114-Status: GOOD (  35.65  )
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
> Add a CoreSight shell test for synthesized callchains.
> 
> The test uses the new callchain workload to generate trace and decodes
> it with synthesis callchain. It then verifies that the instruction
> samples show the expected callchain push and pop.
> 
> Use control FIFOs so tracing starts only around the workload, which
> keeps the trace data small. The test is limited to with the cs_etm
> event available and root permission.
> 
> After:
> 
>    perf test 138 -vvv
>    138: CoreSight synthesized callchain:
>    ---- start ----
>    test child forked, pid 35581
>    Callchain flow matched:
>      l1=4642868 l2=4642880 l3=4642895 l4=4642919 l5=4670494 l6=4670500 l7=4670520
>    ---- end(0) ----
>    138: CoreSight synthesized callchain                                                                           : Ok
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/Documentation/perf-test.txt        |   6 +-
>   tools/perf/tests/builtin-test.c               |   1 +
>   tools/perf/tests/shell/coresight/callchain.sh | 172 ++++++++++++++++++++++++++
>   tools/perf/tests/tests.h                      |   1 +
>   tools/perf/tests/workloads/Build              |   2 +
>   tools/perf/tests/workloads/callchain.c        |  33 +++++
>   6 files changed, 213 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/Documentation/perf-test.txt b/tools/perf/Documentation/perf-test.txt
> index 81c8525f594680d814f80e6f88bcce8d867bb350..859df74e62efc4b1e80da13ae8e053356f68ae54 100644
> --- a/tools/perf/Documentation/perf-test.txt
> +++ b/tools/perf/Documentation/perf-test.txt
> @@ -57,7 +57,8 @@ OPTIONS
>   --workload=::
>   	Run a built-in workload, to list them use '--list-workloads', current
>   	ones include: noploop, thloop, leafloop, sqrtloop, brstack, datasym,
> -	context_switch_loop, deterministic, named_threads and landlock.
> +	context_switch_loop, deterministic, named_threads, landlock and
> +	callchain.
>   
>   	Used with the shell script regression tests.
>   
> @@ -69,7 +70,8 @@ OPTIONS
>   	'named_threads' accepts the number of threads and the number of loops to
>   	do in each thread.
>   
> -	The datasym, landlock and deterministic workloads don't accept any.
> +	The datasym, landlock, deterministic and callchain workloads don't accept
> +	any.
>   
>   --list-workloads::
>   	List the available workloads to use with -w/--workload.
> diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
> index 7e75f590f225e3284980829707ca8d916c98cada..1d1f38127e05429a27f31beda814f2b5f5a75089 100644
> --- a/tools/perf/tests/builtin-test.c
> +++ b/tools/perf/tests/builtin-test.c
> @@ -168,6 +168,7 @@ static struct test_workload *workloads[] = {
>   	&workload__jitdump,
>   	&workload__context_switch_loop,
>   	&workload__deterministic,
> +	&workload__callchain,
>   
>   #ifdef HAVE_RUST_SUPPORT
>   	&workload__code_with_type,
> diff --git a/tools/perf/tests/shell/coresight/callchain.sh b/tools/perf/tests/shell/coresight/callchain.sh
> new file mode 100755
> index 0000000000000000000000000000000000000000..13cca7dc11184002e3ddc058c0d0ffa1c458c483
> --- /dev/null
> +++ b/tools/perf/tests/shell/coresight/callchain.sh
> @@ -0,0 +1,172 @@
> +#!/bin/bash
> +# CoreSight synthesized callchain (exclusive)
> +# SPDX-License-Identifier: GPL-2.0
> +
> +glb_err=1
> +
> +if ! tmpdir=$(mktemp -d /tmp/perf-cs-callchain-test.XXXXXX); then
> +	echo "mktemp failed"
> +	exit 1
> +fi
> +
> +cleanup_files()
> +{
> +	rm -rf "$tmpdir"
> +}
> +
> +trap cleanup_files EXIT
> +trap 'cleanup_files; exit $glb_err' TERM INT
> +
> +skip_if_system_is_not_ready()
> +{
> +	perf list | grep -Pzq 'cs_etm//' || {
> +		echo "[Skip] cs_etm event is not available" >&2
> +		return 2
> +	}
> +
> +	# Requires root for trace in kernel
> +	[ "$(id -u)" = 0 ] || {
> +		echo "[Skip] No root permission" >&2
> +		return 2
> +	}
> +
> +	return 0
> +}
> +
> +record_trace()
> +{
> +	local data=$1
> +	local script=$2
> +
> +	local cf="$tmpdir/ctl"
> +	local af="$tmpdir/ack"
> +
> +	mkfifo "$cf" "$af"
> +
> +	perf record -o "$data" -e cs_etm// --per-thread -D -1 --control fifo:"$cf","$af" -- \
> +		perf test --record-ctl fifo:"$cf","$af" -w callchain >/dev/null 2>&1 &&
> +
> +	# It is safe to use 'i3i' with a three-instruction interval, since the
> +	# workload is compiled with -O0.
> +	perf script --itrace=g16i3il64 -i "$data" > "$script"

Is there a reason we don't generate callstacks on branch samples and use 
--itrace=g16bl64? That removes the magic number 3 and reduces the output 
file size and test runtime a bit.

All I had to do was copy the same "if (etm->synth_opts.callchain) { ..." 
block to cs_etm__synth_branch_sample(). It seems like the grepping 
doesn't exactly match the branch sample format so the test fails, but 
I'm sure that could be fixed.

I suppose there is value in testing instruction output, but maybe we can 
add the option for users to add callstacks to branch samples, even if 
it's not tested.

> +}
> +
> +callchain_regex_1()
> +{
> +	printf '%s' \
> +'perf[[:space:]]+[0-9]+[[:space:]]+\[[0-9]+\][[:space:]]+([0-9.]+:[[:space:]]+)?[0-9]+ instructions:[[:space:]]*\n'\
> +'[[:space:]]+[[:xdigit:]]+ callchain_foo\+0x[[:xdigit:]]+ \(.*/perf\)\n'\
> +'[[:space:]]+[[:xdigit:]]+ callchain\+0x[[:xdigit:]]+ \(.*/perf\)\n'\
> +'([[:space:]]+[[:xdigit:]]+ .*\n)*'
> +}
> +
> +callchain_regex_2()
> +{
> +	printf '%s' \
> +'perf[[:space:]]+[0-9]+[[:space:]]+\[[0-9]+\][[:space:]]+([0-9.]+:[[:space:]]+)?[0-9]+ instructions:[[:space:]]*\n'\
> +'[[:space:]]+[[:xdigit:]]+ callchain_do_syscall\+0x[[:xdigit:]]+ \(.*/perf\)\n'\
> +'[[:space:]]+[[:xdigit:]]+ callchain_foo\+0x[[:xdigit:]]+ \(.*/perf\)\n'\
> +'[[:space:]]+[[:xdigit:]]+ callchain\+0x[[:xdigit:]]+ \(.*/perf\)\n'\
> +'([[:space:]]+[[:xdigit:]]+ .*\n)*'
> +}
> +
> +callchain_regex_3()
> +{
> +	printf '%s' \
> +'perf[[:space:]]+[0-9]+[[:space:]]+\[[0-9]+\][[:space:]]+([0-9.]+:[[:space:]]+)?[0-9]+ instructions:[[:space:]]*\n'\
> +'[[:space:]]+[[:xdigit:]]+ syscall(@plt)?\+0x[[:xdigit:]]+ \(.*\)\n'\
> +'[[:space:]]+[[:xdigit:]]+ callchain_do_syscall\+0x[[:xdigit:]]+ \(.*/perf\)\n'\
> +'[[:space:]]+[[:xdigit:]]+ callchain_foo\+0x[[:xdigit:]]+ \(.*/perf\)\n'\
> +'[[:space:]]+[[:xdigit:]]+ callchain\+0x[[:xdigit:]]+ \(.*/perf\)\n'\
> +'([[:space:]]+[[:xdigit:]]+ .*\n)*'
> +}
> +
> +callchain_regex_4()
> +{
> +	printf '%s' \
> +'perf[[:space:]]+[0-9]+[[:space:]]+\[[0-9]+\][[:space:]]+([0-9.]+:[[:space:]]+)?[0-9]+ instructions:[[:space:]]*\n'\
> +'[[:space:]]+[[:xdigit:]]+ .*\+0x[[:xdigit:]]+ \(\[kernel\.kallsyms\]\)\n'\
> +'[[:space:]]+[[:xdigit:]]+ syscall(@plt)?\+0x[[:xdigit:]]+ \(.*\)\n'\
> +'[[:space:]]+[[:xdigit:]]+ callchain_do_syscall\+0x[[:xdigit:]]+ \(.*/perf\)\n'\
> +'[[:space:]]+[[:xdigit:]]+ callchain_foo\+0x[[:xdigit:]]+ \(.*/perf\)\n'\
> +'[[:space:]]+[[:xdigit:]]+ callchain\+0x[[:xdigit:]]+ \(.*/perf\)\n'\
> +'([[:space:]]+[[:xdigit:]]+ .*\n)*'
> +}
> +
> +find_after_line()
> +{
> +	local regex="$1"
> +	local file="$2"
> +	local start="$3"
> +	local offset
> +	local line
> +
> +	# Search in byte offset
> +	offset=$(
> +		tail -n +"$start" "$file" |
> +		grep -Pzob -m1 "$regex" |
> +		tr '\0' '\n' |
> +		sed -n 's/^\([0-9][0-9]*\):.*/\1/p;q'
> +	)
> +
> +	if [ -z "$offset" ]; then
> +		echo "Failed to match regex after line $start" >&2
> +		echo "Regex:" >&2
> +		printf '%s\n' "$regex" >&2
> +		echo "Context from line $start:" >&2
> +		sed -n "${start},$((start + 100))p" "$file" >&2
> +		return 1
> +	fi
> +
> +	# Convert from offset to line
> +	line=$(
> +		tail -n +"$start" "$file" |
> +		head -c "$offset" |
> +		wc -l
> +	)
> +
> +	echo "$((start + line))"
> +}
> +
> +check_callchain_flow()
> +{
> +	local file="$1"
> +	local l1 l2 l3 l4 l5 l6 l7
> +
> +	# Callchain push
> +	l1=$(find_after_line "$(callchain_regex_1)" "$file" 1) || return 1
> +	l2=$(find_after_line "$(callchain_regex_2)" "$file" "$((l1 + 1))") || return 1
> +	l3=$(find_after_line "$(callchain_regex_3)" "$file" "$((l2 + 1))") || return 1
> +	l4=$(find_after_line "$(callchain_regex_4)" "$file" "$((l3 + 1))") || return 1
> +
> +	# Callchain pop
> +	l5=$(find_after_line "$(callchain_regex_3)" "$file" "$((l4 + 1))") || return 1
> +	l6=$(find_after_line "$(callchain_regex_2)" "$file" "$((l5 + 1))") || return 1
> +	l7=$(find_after_line "$(callchain_regex_1)" "$file" "$((l6 + 1))") || return 1
> +
> +	echo "Callchain flow matched:"
> +	echo "  l1=$l1 l2=$l2 l3=$l3 l4=$l4 l5=$l5 l6=$l6 l7=$l7"
> +
> +	return 0
> +}
> +
> +run_test()
> +{
> +	local data=$tmpdir/perf.data
> +	local script=$tmpdir/perf.script
> +
> +	if ! record_trace "$data" "$script"; then
> +		echo "perf record/script failed"
> +		return
> +	fi
> +
> +	check_callchain_flow "$script" || return
> +
> +	glb_err=0
> +}
> +
> +skip_if_system_is_not_ready || exit 2
> +
> +run_test
> +
> +exit $glb_err
> diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
> index 7cedf05be544ad79a99e86d30dfa4f7b01ca0837..cee9e6b62dcc838c864bbe76efe3b638ed75b134 100644
> --- a/tools/perf/tests/tests.h
> +++ b/tools/perf/tests/tests.h
> @@ -248,6 +248,7 @@ DECLARE_WORKLOAD(inlineloop);
>   DECLARE_WORKLOAD(jitdump);
>   DECLARE_WORKLOAD(context_switch_loop);
>   DECLARE_WORKLOAD(deterministic);
> +DECLARE_WORKLOAD(callchain);
>   
>   #ifdef HAVE_RUST_SUPPORT
>   DECLARE_WORKLOAD(code_with_type);
> diff --git a/tools/perf/tests/workloads/Build b/tools/perf/tests/workloads/Build
> index 7bb4b9829ba245740c8967e6bf3235614cdd55a3..048e371eb63e316453b6b46ebd0a02794c3d25d7 100644
> --- a/tools/perf/tests/workloads/Build
> +++ b/tools/perf/tests/workloads/Build
> @@ -13,6 +13,7 @@ perf-test-y += inlineloop.o
>   perf-test-y += jitdump.o
>   perf-test-y += context_switch_loop.o
>   perf-test-y += deterministic.o
> +perf-test-y += callchain.o
>   
>   ifeq ($(CONFIG_RUST_SUPPORT),y)
>       perf-test-y += code_with_type.o
> @@ -27,3 +28,4 @@ CFLAGS_traploop.o         = -g -O0 -fno-inline -U_FORTIFY_SOURCE
>   CFLAGS_inlineloop.o       = -g -O2
>   CFLAGS_deterministic.o    = -g -O0 -fno-inline -U_FORTIFY_SOURCE
>   CFLAGS_named_threads.o    = -g -O0 -fno-inline -U_FORTIFY_SOURCE
> +CFLAGS_callchain.o        = -g -O0 -fno-inline -U_FORTIFY_SOURCE
> diff --git a/tools/perf/tests/workloads/callchain.c b/tools/perf/tests/workloads/callchain.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..3951423d8115e9efb49af8ba2586001fc6f02761
> --- /dev/null
> +++ b/tools/perf/tests/workloads/callchain.c
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/compiler.h>
> +#include <sys/syscall.h>
> +#include <unistd.h>
> +#include "../tests.h"
> +
> +/*
> + * Mark as noinline to establish the call chain, and avoid the static
> + * annotation to prevent LTO from renaming the functions.
> + */
> +noinline void callchain_do_syscall(void);
> +noinline void callchain_foo(void);
> +noinline int callchain(int argc, const char **argv);
> +
> +noinline void callchain_do_syscall(void)
> +{
> +	syscall(SYS_getpid);
> +}
> +
> +noinline void callchain_foo(void)
> +{
> +	callchain_do_syscall();
> +}
> +
> +noinline int callchain(int argc __maybe_unused,
> +		       const char **argv __maybe_unused)
> +{
> +	callchain_foo();
> +
> +	return 0;
> +}
> +
> +DEFINE_WORKLOAD(callchain);
> 


