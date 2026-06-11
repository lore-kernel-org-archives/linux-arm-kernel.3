Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6039CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 15:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zH+WauEJRnn29mFkuxDi5zkNVPgEDldOxkiXAzSEtw=; b=S6mtOjK3evzv0O4tCYPYO2g+bP
	mM8lvP1X+oA4aNpN8T6AVu3znBjwNAoTWrmLFeaslS2lnh3wvtCZXsH0z27HnqttuuiBOAjbVBDNW
	ulW7XE9z0bRNtpduT7zJJ5CmQxsACN2G9bXUxfA3PklBjeu67HCY0BKYW/8RS+EsllaUrQgTwBstY
	Rsuw23YSkCWoTQhRKHniHbHqT+DPuTf/ZbqROK00R5gsq3fGkW67nkKiXD04Qfo9cbxTSQ/Tx+Mi+
	j5juZWX7UJODZxCuGv2goYYtEwk19PBoeh040BnC4ObI52hCjJ/3uKgstgpJO/ut7CeJTTNPcH/zm
	uh0tO2Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXgz2-00000009egJ-44TY;
	Thu, 11 Jun 2026 15:06:17 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXgyy-00000009ef3-2VqY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 15:06:15 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-68ced97b6eeso11059710a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 08:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781190371; x=1781795171; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8zH+WauEJRnn29mFkuxDi5zkNVPgEDldOxkiXAzSEtw=;
        b=d7fv5v80vd53iWcHJznCXj2T2uJCIUg4noL8DBEEGkl/aaqBB6si/mqDtZ5JwZ+t1v
         sxnSQbEJe0I//m9IqtTDeOHy8Vy3q5XI8eU3wBclvgnKOFkwmgVL6jz3p7G/jPTZJStm
         YrJAWW2hz1BA55vbmhDd3aV5hkOZ060wN9v0/X0mfRlpiV+wJSQTs1RA7vwbaPsFtauq
         zsv1dWEcMCDU268unipidYXxDxvpQP7728+a4tG63zNOevPodhLKPuksMcO+UJgCzZQz
         VR/GMOMCaA9w5Ggk8g5kRdPwIjCNvbl2sDxnXVUCaBNgSq8NBqqNT2fzW0Svx5ItyRuR
         tGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781190371; x=1781795171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zH+WauEJRnn29mFkuxDi5zkNVPgEDldOxkiXAzSEtw=;
        b=fUmkyJH0fPMDPLxsshPm1se/GS7MNFM+eqt5Lj24b2wZVKDCZ3JBtnAo+WZwb/Q10U
         g/WUuNGenKTmEEAaN/HV2jqAELodIMP8N15Sp4betN91tZ8YRYVDqecpfUvzu0+FqMys
         niXoQ3ta66+jxQKrYhY6xcB/+r2J/gAI0tj7y87/JJ9Pqt2+eHIptOIGncX7kz56zM5Q
         ZOi2MVgYi//n3m99nJDkpQQ4ggG5OcoNpw3MW5KkM9Qs7r7o/O5SOKcBIWlWcJLjREIY
         1UJVFBgHudZDhWegT6uAytRRxeKUHkW3FBSVMUdY/DnXHR8P0fsuPqmsMY4ST/ecjxmR
         w2tQ==
X-Gm-Message-State: AOJu0Yz50d/TmZFZ7AiXbcsNLYOrhsvxbAKs6BQKSuSVgw5+77djvs7E
	ocPwHgWhWb/upjXe00jdp7n59AKhwDpKgzB2rQEtt9cJnjyDhAZtNS82aNAdd24V5kPkXPnYb6z
	Sb4oE9yg=
X-Gm-Gg: Acq92OEswqLrm0dPnJyj/WP/jSTuI8cqDD7Az4iFV4to2DKvuADccAEiqTmcd4cMl0+
	kj8Bu8DqyfOkYT4AE3MvkDXhL2W8pXSaluaIBwn8/W6j/SjbUcMXCpEdSMG7fCpn2P8TVb1E6EO
	GB6lk7mdXTCs3dSnwp5uXss5jrrbqOAUQY1UKmVhMBn9aH5zDeUGaaDBfn1k+TEThoJKEaf+XeS
	QzR+I51YBz/t55hgEtAaxP3PHNW8uWDmfk7FR8GMojqgZo+7sqnLsSHPaUBilZwWjqf1Mk11Q3Y
	gnYyf9eUt8A/LwyvP/n6VsLxDNUMnjXZHoalRLyLueywyqJXbmVjUVAmeLBUnyHj7t8ihStM67X
	C1gYanms25dJwK3lwIlCaFO+KyBXE0qBqbbs99P/2ZcYYPG0XQTZDHSt+78XeszraG/uHwXlT1p
	ebk668Bp6XrbBcLxCor292LdgrcL5E1tLPJwWlKn0=
X-Received: by 2002:a17:907:1c96:b0:bfb:b43a:b084 with SMTP id a640c23a62f3a-bfc889277a2mr158861866b.40.1781190370479;
        Thu, 11 Jun 2026 08:06:10 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb5abe4a9sm78991466b.46.2026.06.11.08.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 08:06:08 -0700 (PDT)
Message-ID: <e0a1133e-dc95-47c4-bcc3-c1c2248dae54@linaro.org>
Date: Thu, 11 Jun 2026 16:06:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/8] perf test: Add Arm CoreSight callchain test
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
References: <20260611-b4-arm_cs_callchain_support_v1-v8-0-737948584fea@arm.com>
 <20260611-b4-arm_cs_callchain_support_v1-v8-8-737948584fea@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260611-b4-arm_cs_callchain_support_v1-v8-8-737948584fea@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_080614_121827_6F5C5AA8 
X-CRM114-Status: GOOD (  30.87  )
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



On 11/06/2026 3:50 pm, Leo Yan wrote:
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

Reviewed-by: James Clark <james.clark@linaro.org>

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
> index afc06cec49546d29d86b94840c7021c5bf5c88e3..8994488cc206863ba77f7e7e5803e62f18e151ba 100644
> --- a/tools/perf/tests/builtin-test.c
> +++ b/tools/perf/tests/builtin-test.c
> @@ -166,6 +166,7 @@ static struct test_workload *workloads[] = {
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
> index 75b377934a0e62b9ac1fec245520ea0978ac957e..dfdf9a2720b22f67a3d7b53d0ed14e0654059c8f 100644
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
> @@ -26,3 +27,4 @@ CFLAGS_datasym.o          = -g -O0 -fno-inline -U_FORTIFY_SOURCE
>   CFLAGS_traploop.o         = -g -O0 -fno-inline -U_FORTIFY_SOURCE
>   CFLAGS_inlineloop.o       = -g -O2
>   CFLAGS_deterministic.o    = -g -O0 -fno-inline -U_FORTIFY_SOURCE
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


