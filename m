Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEDEC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 14:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASEcelLFoJ/llNSS4zb7EhEiRbhth5Y9y6EoNChT3gY=; b=wfDSJ96FMD4+DsmoXcZwtHmcZX
	v5w/xvpzL4vEdoKGYrQTMFcn5Zc/7VXLDpaE6Xaezh1aua62w1EpsaBD3a7g8QIpcHG9TPcQEhv1N
	oSfLW+GZkNBXyhIV62dKjHC7IMrWnbdsqH/WQsq+DgpiSVQJEGqrcP0ITnsCf3kcyfJbklcdXV0A4
	6dCrc41lW+9GeoYTfW8PDhJz3IqHqTbEBozsdna0XGUgAx+aAFt0c38LxoIxkH2onqcpaIo7uhS8L
	rC6B1O49lDQT4cZ0CcYP++txgj+7+VBuMTnnfmdVe78QiLp6VRiy9UHheAlSVTLiS0n9MtcNHK7bh
	CFMSIDSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9v5-0000000GO9c-2nfk;
	Wed, 12 Aug 2026 14:27:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9v2-0000000GO8x-4BzH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 14:27:02 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a18180so1668407a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 07:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786544819; x=1787149619; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASEcelLFoJ/llNSS4zb7EhEiRbhth5Y9y6EoNChT3gY=;
        b=x8NMaGHUDYag9FsZeCLa5q74KucV/A+4ZkoQkut05o/8fyDYcWdVbrn1LxtpQFE9ez
         Im80zelXSfwVOHAfuPt4aAoeKUfpmLqRIO/2bOBMbbtE+y7PYRO6qpeRBjb+oPAXW6q9
         XCI38DkudQTgcGGlxMCnXmXOIZRQxB4uDKVmVXu18lK1Qpj8wCi/xRAuttY5HTohu4CQ
         9tEK/h3nouRzqJP/zMYSoXEh3xofBV1rCaLHCdE0Xy8zvSJRhyk6Rw4+CN3cDTart4fM
         H0azTA7OIFHSqjcLrwnwGPrGOrG59GDfUZlGzkRhOu8wo2oTSEvN9YEn5b77JZLlNgPE
         FS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544819; x=1787149619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ASEcelLFoJ/llNSS4zb7EhEiRbhth5Y9y6EoNChT3gY=;
        b=lvI3w4GTJc22PSK32dBZ1bc474rLaJkyfNrKRZeUltl3CKeh0wyNXutpc8BB8OC56w
         GhVT3/wTZEc8yzBcM8Eo9VrdzYHNXlL0/2axdIjEzSsONYb2bE05pQFJCP5EthPTmat6
         yS4ebSKbvY50sAAFsuu2f6FYYeKpmA7uduvxJl2qlymJee6lDiKixJbVGJ9x9wxNSvWX
         qa25LOG8Iawb8tU4SqV2bro3SRMIUeGOMQJgtO8IT1mgbozHhBfik08kR3eCrW3ln2on
         dMIu6YdZWzJ6lonIRroMvTwOyYCZw8k7QZbQQTNnL/gkJCV7UUopJkZAUZh3HR59EA9w
         9aDg==
X-Forwarded-Encrypted: i=1; AHgh+RrnOaJqaVx+Bh83LwZiiiGVGJReG2iSPuZ+UVDQQudaloxBjfTCvVIftV4IrOhpLtz1dn8lISYBjU/Ko9+Mv9XE@lists.infradead.org
X-Gm-Message-State: AOJu0YxupE/o284guLksqUuMzVK15sqiAEi+LZJCMz8sQrMwivs+/csU
	B/asaN62GeizG3aPRgpxzRZxDrs+eOEPmtBjBezekfeWUQEye05Po6ZfuyRpwzz+EJU=
X-Gm-Gg: AR+sD118VHscXnHHo8lyCn8wiRNPL/gvAcE8zg3Ds+xSuMKF0EkfeZlw0PTMXRkqkSU
	yLIshopCX4gHgDVMcVd41jcwKxauMvrhFy7ZqtoPYw36tEeDWBHOKmc8AYCEjPQzw2SxiSgGIHu
	c4Bce5lD4MFjmudenyCfBg+mVv73UfKkDSuFoUM1OVUk4iQWhLiByO6M/AyCV2UXBtAS7iIw7E1
	T7M1LKmOetBWIhEQ33BrCYrW+BPjXNEHgUSdK8AsmujTCvo5qtrYPPCs9GxG+NDukaiZjiTz0tr
	dHud2lW268MOdnBVcQupc40JCW96KhLrSacsnzTCxqyOkEzN6OlxTve30TbCmFDcrYX3L8NuwuE
	ondHa61sQFQQ0h4YD6TjIzNMdnwJILE7SxjhIOAieXcCcd86OVnju63kIHY7JfRE2gndoBCwyi3
	j0321QE+82e9oE1UmaBXNqQ7YfZRi21eS2UqrlqukiFp27rQ/pmwo4fsXnE6n623q6AxNmrN6Fe
	RVb
X-Received: by 2002:a05:6402:5410:b0:6a1:da7a:917b with SMTP id 4fb4d7f45d1cf-6a375f7eff5mr2589534a12.20.1786544818890;
        Wed, 12 Aug 2026 07:26:58 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a376a0fb5csm817831a12.24.2026.08.12.07.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 07:26:58 -0700 (PDT)
Message-ID: <6ddc4d8d-b2f0-4df5-962c-f945e8fbf8f6@linaro.org>
Date: Wed, 12 Aug 2026 15:26:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] perf cs-etm: Add branch history to existing samples
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
References: <20260803090202.2324641-1-aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260803090202.2324641-1-aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_072701_086045_B67E5A98 
X-CRM114-Status: GOOD (  43.83  )
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



On 03/08/2026 10:01, Amir Ayupov wrote:
> This series implements --itrace=L for Arm CoreSight ETM: decoded branch

Hi Amir,

How did you send this? The cover letter seems to be on a different 
thread to the patches.

> history is attached to the PMU samples already present in the recording,
> rather than to synthesised instruction samples.
> 
> The motivating use case is context-sensitive PGO, which wants a callchain
> and a branch stack describing the same point in time. Recording a cycles
> event with call-graph=fp and aux-action=pause supplies the callchain, and
> the ETM trace leading up to that sample supplies the branch stack, without
> having to trace a long-running process continuously.
> 
> Intel PT has had this since commit f0a0251cee80 ("perf intel-pt: Add
> support for synthesizing branch stacks for regular events"), so this
> deliberately follows intel-pt: the same --itrace=L option and the same
> thread_stack__br_sample_late() call.
> 
> Patches 1 to 4 are independent fixes and infrastructure the feature needs:
> 
>    1  makes an inconsistent HEADER_GROUP_DESC non-fatal. AUX recordings
>       using aux-action pause/resume produce a group descriptor the strict
>       reader rejects, which makes an otherwise readable perf.data
>       unreadable, so without this the recipe in patch 9 cannot be decoded
>       at all. Useful on its own.
>    2  reports hw_idx as -1 rather than 0 in reconstructed branch stacks,
>       since they have no hardware index.
>    3  bounds a wrapped memcpy in thread_stack__br_sample(). Latent today,
>       reachable once a caller keeps a ring larger than the requested output
>       depth.
>    4  adds a dlfilter that drops samples with an empty branch stack.
> 
> Patch 5 is a no-functional-change refactor splitting
> cs_etm__process_timestamped_queues() into its three parts. Heap seeding
> moves to cs_etm__update_queues(), gated on queues.new_data and mirroring
> intel_pt_update_queues(); the end-of-session flush moves to
> cs_etm__flush_timestamped_queues(); and the decode loop is left on its own
> so patch 6 can drive it once per sample. Neither seeding nor flushing can
> be repeated, which is why they have to come out first. The moved code is
> unchanged, so both loops appear as context in the diff.
> 
> Patch 6 is the feature and patch 7 adds a shell test.
> 
> Patch 8 is where review attention is most useful. --itrace=L attaches
> whatever the thread stack holds when a sample is processed. With a duty
> cycled trace most samples fire while the trace is off; they have nothing
> newly decoded, but the thread stack still holds the previous window, so
> they were being given branches that ran an arbitrary amount of time
> earlier. On a 12 s capture with pause period 100003 and resume period
> 8350251, of 335291 samples that received branch history only 3371 were
> backed by trace decoded for that sample.
> 
> A trace window belongs to exactly one sample, and with AUX pause and
> resume the sample is what stops the trace, so the pairing is one to one by

What happens when aux-pause isn't used and there isn't a 1:1 pairing? 
There is a lot of description of that which implies that it doesn't work 
if there isn't. But as far as I can tell it works just as well by using 
the timestamps?

> construction. Patch 8 therefore takes the branch history when attaching it
> instead of copying it, and a later sample with nothing newly decoded finds
> an empty branch stack, which the dlfilter removes.
> thread_stack__br_sample() is unchanged, so lowercase --itrace=l keeps the
> overlapping branch stacks it produces today.
> 
> Patch 9 documents the workflow.
> 
> Because the sample is what stops the trace, the history attached to it
> lines up well with the callchain: on a brstack capture the leaf of the
> callchain matched the function containing the newest branch stack entry's
> target for 93.5% of attached samples. The residual comes from the decode
> loop stopping on interpolated timestamps, so a few branches that ran just
> after the sample can still be included. Trimming those with the sample ip
> raises it to 96.8%, but that matters far more for free-running ETM
> strobing than for pause and resume, so I have left it out of this series
> and will send it separately.
> 
> Patch 8 could be squashed into patch 6, since patch 6 on its own produces
> mostly stale history. I kept them apart so the decode mechanism and the
> attachment policy can be reviewed separately, but I am happy to fold them.
> 
> Testing
> -------
> 
> Built with:
> 
>    make -C tools/perf NO_LIBELF=1 NO_LIBTRACEEVENT=1 CORESIGHT=1
> 
> Every patch builds individually. checkpatch reports only "does MAINTAINERS
> need updating?" for the two new files and "quoted string split across
> lines" for the dlfilter description string, which matches how
> dlfilter-show-cycles.c already writes it.
> 
> Tested on Arm Neoverse V2 with CoreSight ETM:
> 
>    - perf test "CoreSight branch history on existing samples": Ok, 3 for 3
>    - captures from 5 MiB to 2.5 GiB decoded with --itrace=L64, no decode
>      errors
>    - the other CoreSight tests are unchanged by this series; four of them
>      fail identically at the base commit on this machine

Can you report or investigate these failures please. None of the tests 
should be failing on TRBE hardware, at least on the latest 
perf-tools-next branch. You can try applying "[PATCH 00/14] perf cs-etm: 
Per-thread mode fixes and snapshot wrap support" to be sure, but I don't 
think that fixes any current failures.

> 
> Amir Ayupov (9):
>    perf header: Tolerate inconsistent HEADER_GROUP_DESC
>    perf thread-stack: Report branch stack hw_idx as not available
>    perf thread-stack: Bound wrapped branch stack copy
>    perf dlfilter: Add non-empty branch stack filter
>    perf cs-etm: Split up cs_etm__process_timestamped_queues()
>    perf cs-etm: Add branch history to existing samples
>    perf test cs-etm: Test branch history on existing samples
>    perf cs-etm: Consume branch history when attaching it to a sample
>    Documentation: coresight: Document context-sensitive PGO workflow
> 
>   .../trace/coresight/coresight-perf.rst        |  62 +++++
>   tools/perf/Makefile.perf                      |   1 +
>   .../dlfilters/dlfilter-nonempty-brstack.c     |  26 ++
>   .../tests/shell/coresight/add_last_branch.sh  | 175 +++++++++++++
>   tools/perf/util/cs-etm.c                      | 242 ++++++++++++++++--
>   tools/perf/util/header.c                      |  42 ++-
>   tools/perf/util/thread-stack.c                |  21 +-
>   tools/perf/util/thread-stack.h                |   1 +
>   8 files changed, 544 insertions(+), 26 deletions(-)
>   create mode 100644 tools/perf/dlfilters/dlfilter-nonempty-brstack.c
>   create mode 100755 tools/perf/tests/shell/coresight/add_last_branch.sh
> 
> 
> base-commit: da85966dfd23a3b03e00ee3bce6ad301f0a2b229


