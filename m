Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579A6C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/o2uYaPaSasZ8MEDQ2eIcDiLGsa5Fqsp2iOXFF4vDM=; b=azmZ8tNGFme7t5b8Af3NhFQCNP
	+tBpdxo+B1SCQ/jva0H9f86z8X1+FQaJSFFuDRuP7r8/96sRQlE9DPLIVejzobwHNVV9i45i5kTn/
	1TMpB6TwD3VxM3Qcmu2boGVJ0lNA34K/DoxaDZxcoc2Dcpx2PDa72INA681WKBLKe07ZKhCZv4yxv
	ExbahHKhQHp7ti1rsycooqtsK28ut8jvkxjq1ulH1b1vqf1n9lV6Q5k9hcP0jxmMEPA+71IqFg699
	6A2sszs43sZce9JCiAckjq9JboK35px48rBQVdWTtY6M2XxLy95ZFHwjQswMc7Td/ZXzEMI02TuKC
	hHMQKUNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKjZ-00000008A8E-1lw5;
	Tue, 18 Aug 2026 14:24:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKjW-00000008A7W-3Krg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:24:08 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49557167508so47883175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787063045; x=1787667845; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/o2uYaPaSasZ8MEDQ2eIcDiLGsa5Fqsp2iOXFF4vDM=;
        b=rXJHAsMQ+AoGwvfFNegS//yMXa3VbhooeJ8xd7x+TF1i9WP9iVNyVt52ZwtOgwRLaj
         KhtW2iR9sedIEneQMl1HqHflTwB/ZVPHoMAlN8JYnL2QFkVvsLzolIxXDEq946dROZfZ
         vQ3Y1Lay/UmNDnp40BPAsMhhCXw1tXLZDfkoClt+OLpmaSshNBLjughY2xN997ROgfP0
         67+UNH6/lZ62jrAkKQaGDjeI4rj84P8g563Y5RnK4W2LxHLzL6f27M7pN+BbbIkqxj/E
         lW7rS0EBhmf8EcP7mV5HUoRGKObK1OiNK3ISbtUB4PWtws5yAJEFF/sSTSvVLpkViFSv
         sqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063045; x=1787667845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/o2uYaPaSasZ8MEDQ2eIcDiLGsa5Fqsp2iOXFF4vDM=;
        b=KAxqwhogT6FCInoXOGe62+hnq0LJ9f+6MRPf8qFsOWH9mOmMoPgsPTG0ce2U4dQthg
         BLn8DfO8V1z2rIP9w+9izZsobBELQiUQooleCAZf8hCJeW0o6v8R7rF050Fr56jEygZ1
         rlVSp8DUg/tFjEVO36UsLCS0z2uff6dnuuionJjQvoEJwrg2rCsFoJ/XzVz3bauD76Ge
         J7dZ5l2HlPzy2hMWWxGJM4OyD6VcyBnGDDQduv2OoU8DCwn16vhacgaQ0plk0++3UQxB
         l+04e1/pqeOnt4uuohTRtRbUzbKDil6SDTg/lGcD8xdJMCf17U1g2CGdKi627p5B3TmZ
         91Iw==
X-Forwarded-Encrypted: i=1; AHgh+Ro4rCK4UvXWsnNEQHFOEW18VK7y0crDlhd0DUhjxMq+/hAyuG9SoVMLBsPaZd7nLnUhCJn29o2fVKAka04PuOtJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yye6Sq/RWMGrqNPoc5je3YfWNMr05R9WDhWmmjSHhuAkmShNpAX
	0AzIjGMt4v5Pl8EwCCjXSTadnDeYfWWo4qW9tZvLu3U46k0as5BPpxU/EiGx8XCySS8=
X-Gm-Gg: AR+sD10V1fGda7eBfTQg2HGn7ekiqODVnoTEF6hATQRMVD12tZzkC7nnBsXDaMIYJxP
	oi1qYWIuAP60D6BaDVuyc0f4aQ5vG3PRIWJhyzZ66scC0wxwjW96LBWmpF0Lyd9yNb2ImBA499g
	5gD7UG/5GoZk7GI3YAceYqHHA989pmqTR3vOVOCycCFmmBEG6m7NVsxRxMU4Q7Vuhhfg06ALnHK
	VYnX3Uc7FGzjMAfujBFzHI0kMhAqm4+PpGbaUdQRj0loz2UKeKB2x/91+tjWxuVTzC1hb4Dglt3
	PaaZJx8ARVVajq7bYQ7kFKRw5aPFKI9N29n4yT7trc8kXyN84CMbemR+AkYLahLboybAY65eder
	v0s1PStD34sXLm3cF3CDGqoEp/2qGi9dbM9hAhxOOZCr6OT+44cTeDjiPu9B5n29gK4a2Zzl09I
	X9je5Rhji+xP9Ncy7dPTmudMgYWqo+aMVdZOhFMJcWti3g6kWJZOwGWsR0O1nq1YmekSawkSGAB
	ZnI
X-Received: by 2002:a05:600c:468c:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-4999fb6d4d8mr126865575e9.11.1787063044086;
        Tue, 18 Aug 2026 07:24:04 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d0fb867sm156785215e9.10.2026.08.18.07.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 07:24:03 -0700 (PDT)
Message-ID: <a96a5b96-707f-4a98-bd84-1aa919b9bccb@linaro.org>
Date: Tue, 18 Aug 2026 15:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] perf test cs-etm: Test branch history on existing
 samples
To: Amir Ayupov <aaupov@fb.com>
Cc: linux-doc@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Swapnil Sapkal <swapnil.sapkal@amd.com>, linux-perf-users@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, John Garry
 <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>
References: <cover.1787005265.git.aaupov@fb.com>
 <70f7ccb31e81282212161177124dfc3beff24ad9.1787005265.git.aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <70f7ccb31e81282212161177124dfc3beff24ad9.1787005265.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_072406_902309_EB7172C5 
X-CRM114-Status: GOOD (  41.09  )
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



On 17/08/2026 23:22, Amir Ayupov wrote:
> Add a CoreSight shell test for --itrace=L. Record timestamped ETM trace
> with explicit -T sample timestamps and AUX pause/resume events, then
> check that the pause samples carry both a multi-frame callchain and a
> non-empty branch stack for each of the workload's two processes.
> 
> Decode the same recording with L4 and L64 and reject any branch stack
> deeper than the requested depth.
> 
> The test skips when cs_etm is absent, when not run as root, or when the
> recording turns out to lack virtual timestamps. It exercises the
> timestamp-gated path and the requested-depth bound; it does not attempt
> to verify that the attached history is correlated to the sample.
> 
> Assisted-by: Devmate:GPT-5.6
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   .../tests/shell/coresight/add_last_branch.sh  | 203 ++++++++++++++++++
>   1 file changed, 203 insertions(+)
>   create mode 100755 tools/perf/tests/shell/coresight/add_last_branch.sh
> 
> diff --git a/tools/perf/tests/shell/coresight/add_last_branch.sh b/tools/perf/tests/shell/coresight/add_last_branch.sh
> new file mode 100755
> index 0000000000000..6f09e720abe80
> --- /dev/null
> +++ b/tools/perf/tests/shell/coresight/add_last_branch.sh
> @@ -0,0 +1,203 @@
> +#!/bin/bash -e
> +# SPDX-License-Identifier: GPL-2.0
> +# CoreSight branch history on existing samples (exclusive)
> +
> +perf list pmu | grep -q 'cs_etm//' || exit 2
> +
> +if [ "$(id -u)" != 0 ]; then
> +	echo "[Skip] No root permission"
> +	exit 2
> +fi
> +
> +tmpdir=$(mktemp -d /tmp/perf-cs-add-last-branch.XXXXX)
> +
> +cleanup()
> +{
> +	rm -rf "$tmpdir"
> +	trap - EXIT TERM INT
> +}
> +
> +# shellcheck disable=SC2317 # Called through trap.
> +trap_cleanup()
> +{
> +	cleanup
> +	exit 1
> +}
> +trap trap_cleanup EXIT TERM INT
> +
> +record_data()
> +{
> +	local cf="$tmpdir/ctl"
> +	local af="$tmpdir/ack"
> +
> +	mkfifo "$cf" "$af"
> +
> +	# Pin to one CPU so proc1 and proc2 alternate in one per-CPU trace
> +	# buffer. Start disabled and use the control FIFO to record only the
> +	# workload, not perf test setup and teardown.

This is more of a what comment than a why. I got that we were doing 
that, but the reason I left the comment on V1 was because I couldn't see 
why context switching is related to branch history. Doesn't the test 
still test the same thing if you record a single process without -C?

It's a bit hard to see what behavior the test is exercising. I see it 
also adds call-graph=fp, but it doesn't look for symbol names. How is 
testing for any non zero callchain related to coresight unless we also 
check the coresight branch stack matches it exactly via symbol names? 
Seems like it's just testing some other part of Perf here.

I would expect some references to the named symbols 
"context_switch_loop_proc2" from the workload, but I don't see them. It 
also seems to be very interested in timestamps as per the commit 
message. But how do you know it's not attaching the branch stack from 
proc1 to proc2 because it gets the timestamps wrong?

If it's easier to add a new workload with a deterministic branch history 
written in asm after a deterministic call chain we can do that. Then the 
test can test if a fragment of the branch history appears after an end 
fragment of the callchain.

> +	if perf record -T -o "$tmpdir/data" -C 0 -D -1 \
> +		--control fifo:"$cf","$af" \
> +		-e cs_etm/aux-action=start-paused/u \
> +		-e cycles/aux-action=resume,period=550019/u \
> +		-e cycles/aux-action=pause,period=100003,call-graph=fp/u -- \
> +		taskset --cpu-list 0 perf test --record-ctl fifo:"$cf","$af" \
> +		-w context_switch_loop 10000 \
> +		>/dev/null 2>"$tmpdir/stderr"; then
> +		return 0
> +	fi
> +
> +	echo "Failed to record ETM trace with AUX pause/resume" >&2
> +	cat "$tmpdir/stderr" >&2
> +	return 1
> +}
> +
> +decode()
> +{
> +	local size=$1
> +	local output=$2
> +
> +	if perf script -i "$tmpdir/data" --itrace="L$size" \
> +		-F comm,pid,tid,event,ip,brstack >"$output" \
> +		2>"$tmpdir/stderr"; then
> +		return 0
> +	fi
> +
> +	if grep -q "itrace=L requires virtual timestamped trace" \
> +		"$tmpdir/stderr"; then
> +		echo "[Skip] Virtual CoreSight timestamps are not available"
> +		cleanup
> +		exit 2
> +	fi
> +
> +	cat "$tmpdir/stderr" >&2
> +	return 1
> +}
> +
> +check_process_samples()
> +{
> +	local output=$1
> +	local comm
> +
> +	# Expect each process to have a pause-event sample followed by at least
> +	# one branch entry in 0xFROM/0xTO/... form.

Can we have an exact copy paste of the output instead of the text 
description? I still can't tell if what I'm seeing is expected based on 
this.

For example I get this, which you could paste verbatim into the test:

   proc2 
armv8_pmuv3_0/cycles,aux-action=pause,period=100003,call-graph=fp/u:
	ffff800080021440
	ffff8000813a6a04

(This is output from V1, I couldn't run V2 because of the invalid group 
desc issue)

> +	for comm in proc1 proc2; do
> +		awk -v comm="$comm" '
> +			$1 == comm && /cycles\/aux-action=pause/ {
> +				in_sample = 1
> +				next
> +			}
> +			!NF {
> +				in_sample = 0
> +				next
> +			}
> +			in_sample && /0x[[:xdigit:]]+\/0x[[:xdigit:]]+\// {
> +				found = 1
> +			}
> +			END { exit !found }
> +		' "$output" || {
> +			echo "No pause-event branch stack found for $comm" >&2
> +			grep -A 4 "^$comm .*cycles/aux-action=pause" "$output" \
> +				| head -n 20 >&2 || true
> +			return 1
> +		}
> +	done
> +}
> +
> +check_callchains()
> +{
> +	local output="$tmpdir/script-callchain"
> +	local comm
> +
> +	if ! perf script -i "$tmpdir/data" -F comm,event,ip >"$output" \
> +		2>"$tmpdir/stderr"; then
> +		echo "Failed to dump pause-event callchains" >&2
> +		cat "$tmpdir/stderr" >&2
> +		return 1
> +	fi
> +
> +	# Expect a pause-event header for each process followed by at least two
> +	# indented instruction-pointer frames.

Ditto

> +	for comm in proc1 proc2; do
> +		awk -v comm="$comm" '
> +			$1 == comm && /cycles\/aux-action=pause/ {
> +				in_sample = 1
> +				frames = 0
> +				next
> +			}
> +			!NF {
> +				if (in_sample && frames >= 2)
> +					found = 1
> +				in_sample = 0
> +				next
> +			}
> +			in_sample && /^[[:space:]]+[[:xdigit:]]+([[:space:]]|$)/ {
> +				frames++
> +			}
> +			END {
> +				if (in_sample && frames >= 2)
> +					found = 1
> +				exit !found
> +			}
> +		' "$output" || {
> +			echo "No multi-frame pause-event callchain found for $comm" >&2
> +			grep -A 8 "^$comm .*cycles/aux-action=pause" "$output" \
> +				| head -n 40 >&2 || true
> +			return 1
> +		}
> +	done
> +}
> +
> +check_branch_stacks()
> +{
> +	local output=$1
> +	local max_entries=$2
> +
> +	local ret
> +
> +	if awk -v max="$max_entries" '
> +		/0x[[:xdigit:]]+\/0x[[:xdigit:]]+\// {
> +			entries = 0
> +			for (i = 1; i <= NF; i++)
> +				if ($i ~ /^0x[[:xdigit:]]+\/0x[[:xdigit:]]+\//)
> +					entries++
> +			if (entries)
> +				found = 1
> +			if (entries > max) {
> +				status = 2
> +				exit
> +			}
> +		}
> +		END {
> +			if (status)
> +				exit status
> +			if (!found)
> +				exit 1
> +		}
> +	' "$output"; then
> +		return 0
> +	else
> +		ret=$?
> +	fi
> +
> +	case $ret in
> +	1) echo "No ETM branch stacks found" >&2 ;;
> +	2) echo "Branch stack exceeds requested L$max_entries depth" >&2 ;;
> +	esac
> +	# Expected decoded pause-event lines contain at most L<n> branch entries.
> +	grep 'cycles/aux-action=pause' "$output" | head -n 5 >&2 || true
> +	return 1
> +}
> +
> +record_data
> +check_callchains
> +
> +decode 4 "$tmpdir/script-L4"
> +check_process_samples "$tmpdir/script-L4"
> +check_branch_stacks "$tmpdir/script-L4" 4
> +
> +decode 64 "$tmpdir/script-L64"
> +check_process_samples "$tmpdir/script-L64"
> +check_branch_stacks "$tmpdir/script-L64" 64
> +
> +cleanup
> +exit 0


