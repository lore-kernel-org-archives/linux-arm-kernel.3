Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24919C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfVwBRBTF0jPp/yG8QTZc+4bKOm0do5X3TsF0PgtG70=; b=UH7owqDKcqzQ51aA5un7Uw1/Z4
	4GRHAHrHcSTRoQlABscT/96vTz0T0g11vFCmb09YicXqz1uLuBI9KaefzE10g7a9kUSISaHglL7d+
	EznY/ghRkqL+BWuP9E6vAA4wvIUSAlzAGr0AfrgBtxNhv9AgAcPQBx44G3pKjmnAlTdIC0QWLQGQh
	amJ7v3o8fexNJ/r/qQIOwwI42PhujbTL/4tT3yh8oWaLE9xs16/1gz68U5UQptVAcshJkiBzz0uBE
	/Zqt2MCD2fPBlVJuMvCifl7+HdHsLNuQYqPqtDhy3k5RarMKFWQKVObcbN7EvJoNGq/8xfp40mJzs
	OqNdMzgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKIj-000000084mg-4BOD;
	Tue, 18 Aug 2026 13:56:26 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKIh-000000084lv-37CL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 13:56:25 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so845335266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787061381; x=1787666181; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BfVwBRBTF0jPp/yG8QTZc+4bKOm0do5X3TsF0PgtG70=;
        b=Dq6OAITxRDhUtHh8sPQDS6I1ngD3IFwwA1KK7bJu/KvNpYHJxBgQvr9Nc9zOqefKCH
         FHnHCkNLiUhTlpVPdY84g48pAgF3fnQvUJ5nXZQ2swuo4KCKquiXJpRUJg808KY4TACY
         l09znDjyy6C/XHTP+Tq/yL8VMeJSE898wZR7NDP3sIXrNj8Ojn2t2me+njMwTWcMIxYm
         KNk1yMR4Paij8TQXCoRtenTj2XV6y8Cl9hBsMmQFaloPE/9r9onKOLof1TEmjR/nDYZ1
         tWEbTLFIYIf9Y4yt/3DEm6JjWSsL0b6YnhAB7L+julrxRG0yhFB5f8msu4CSDey7j2ov
         OeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787061381; x=1787666181;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfVwBRBTF0jPp/yG8QTZc+4bKOm0do5X3TsF0PgtG70=;
        b=MKxGY/iIS0YHfrW54jiP2F6KiowErDxlAGoOJ6gPYfWEE0PvkuXMmRN3EK9gv/8yZB
         LMZfxIOq7XBQSY4kOvcxFcwNrkLv2HhgQ8m9B/rZcGzsMz+eVgAK3fNthmyeNydBLWJU
         JklUsHquHxkT9zAniVryMDzDs6nc5pEeiuefYAw6/7eTUetseojirqOhbzYZt/pPYChb
         2kzZ2NyjPVbymzjZrsvsErx3uqJAMS0Abo9MootmVSRicQ8PQTj0eXsaYPTvxtvOx8u2
         OGvD6hgfVhMZaP5a7o4XLCBsrRpU6LC2dH3Ki8dImLBEBKO5e6cpYY8m16VT96qhHtlR
         YBwg==
X-Forwarded-Encrypted: i=1; AHgh+RpydlEjaNTa1L2ZEFncXSQkxOtjeuITXs9NiqXMabqXEPeLA1Db2VYed0AaR449pogHssF5iVnQuUWUhVlHUls9@lists.infradead.org
X-Gm-Message-State: AOJu0YwK2axhytjSLHJtrU6xot5woWeuuYEcxwoqTqzKUinPaM9HRuxw
	JkP3YzrZIYAWX52IjQAVhwU2+s2Wjvprrbwh7HOkaL3cC4SoGTDzM2YXfZw3qWWlYV0=
X-Gm-Gg: AR+sD10MKw4b/bx1u17o38aNENitNCD+AMlC+Z0iPPzuvobvqlbcW67UvfoknSOHpfi
	f56xtjq3Zad6EHpUZ7IP+EqBX7sht9OXyJPRtjsWT2nZ754X1RinPfAJlqAY7acy+F5CcbYWJ7u
	Bd8aPekOq0exg+/1bDt1pBCGJVKFKfOIJTXxHBiwqTqKKUq0nSLV3LBedVybdgSi3susyr8/7HE
	Df2u6rF1y5n/jmzvuUr1BiPiHAMBLncq1bnJI6egIHdA/Dgne74PjeuWgUohIrIU8+Ji7GSKx4d
	Xf+gkCQ7v24aTdpjGR3Z9005727qCLNd8AR1O+NTqnECZzpVvFQ2lA8HS7q/xQkaR5cZdoP1Uyg
	J1p4QNNJf2aGWERyeEXyqJ734G3Sp5SbEAlkyFIRMlugEs9u5PAceucsTNCir8bh3y4NcTCXG84
	bGL5OZuJ9kkjPK5REM559NKqH/HTH3+GIKXwzJ1GLB65ZFyA4FuV/Fu54DaghWoHnANA==
X-Received: by 2002:a17:907:3cc2:b0:c12:3059:4071 with SMTP id a640c23a62f3a-c212a2b2dd8mr1933707366b.15.1787061381408;
        Tue, 18 Aug 2026 06:56:21 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc66bdsm163356166b.58.2026.08.18.06.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 06:56:20 -0700 (PDT)
Message-ID: <eecfa618-6bc8-451f-ac9e-9ae5b08e865b@linaro.org>
Date: Tue, 18 Aug 2026 14:56:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] perf: Add CoreSight branch history to existing
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <cover.1787005265.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_065623_848334_3CC690F9 
X-CRM114-Status: GOOD (  28.44  )
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
> CoreSight ETM can synthesize branch samples from an instruction trace, but
> context-sensitive PGO needs the branch history leading to an existing PMU
> sample together with that sample's event identity and callchain. This series
> implements that mode as --itrace=L, following the corresponding Intel PT
> behavior.
> 
> The series first separates timestamped queue setup and teardown from the ETM
> decode loop so decoding can stop at an existing sample's timestamp. It then
> reconstructs branch history in the thread stack and attaches it to eligible
> samples without replacing their IP, event, or callchain. The attached history
> is consumed after use so a later sample cannot reuse an earlier trace window.
> 
> This enables a context-sensitive PGO workflow where a cycles event supplies a
> frame-pointer callchain while duty-cycled ETM supplies the path leading to the
> sample. A dlfilter removes samples for which no ETM history was available, and
> the documentation describes the complete recording and decoding workflow.
> 
> Changes since v1:
> 
>    - Rebased onto perf-tools-next at d17c5b770972.
>    - Dropped the HEADER_GROUP_DESC reader workaround. The issue is in the writer
>      and should be fixed separately.

Doesn't it still need to be part of this patchset regardless of where 
the issue is? Running the new test is blocked on this. Also is this a 
regression? I noticed there was no fixes: tag on V1 for this commit.

>    - Dropped the branch-stack hw_idx patch after review established that zero is
>      appropriate for age-ordered CoreSight branch stacks.

This doesn't seem to match what happened. The original patch initialized 
all branch stacks to hw_idx = -1, which I think was a good fix so 
shouldn't have been dropped.

Coresight still sets -1 which I said should be changed to 0, but there 
doesn't seem to be a change for that in V2. So now we're missing both 
changes.

>    - Dropped the local wrapped branch-stack copy fix in favor of upstream commit
>      ab9c84d1cd59 ("perf thread-stack: Fix heap buffer overflow on branch stack
>      wrap copy").
>    - Added James Clark's Reviewed-by tag to the dlfilter patch.

>    - Consume branch history after attaching it so samples with no newly decoded
>      trace cannot reuse a window from before an untraced AUX pause interval.
>    - Flush all trace-ID frontend thread stacks when their physical ETM queue is
>      exhausted, preventing stale history from surviving a trace gap.
>    - Check every matching CoreSight event when deciding whether kernel trace is
>      enabled.

Were these changes due to my comment about the test not working? Might 
be worth some discussion about what the issue was on the V1 thread so 
it's easier to follow along with why these changes were made to V2.

>    - Reworked the shell test to use FIFO recording control, removed the invalid
>      bare timestamp option, reduced the workload to 10000 iterations, and check
>      proc1 and proc2 callchains independently with bounded failure diagnostics.
>    - Renamed decoded test outputs to script-L4 and script-L64.
> 
> Amir Ayupov (5):
>    perf dlfilter: Add non-empty branch stack filter
>    perf cs-etm: Split up cs_etm__process_timestamped_queues()
>    perf cs-etm: Add branch history to existing samples
>    perf test cs-etm: Test branch history on existing samples
>    Documentation: coresight: Document context-sensitive PGO workflow
> 
>   .../trace/coresight/coresight-perf.rst        |  62 +++++
>   tools/perf/Makefile.perf                      |   1 +
>   .../dlfilters/dlfilter-nonempty-brstack.c     |  26 ++
>   .../tests/shell/coresight/add_last_branch.sh  | 203 ++++++++++++++
>   tools/perf/util/cs-etm.c                      | 252 ++++++++++++++++--
>   tools/perf/util/thread-stack.c                |  17 ++
>   tools/perf/util/thread-stack.h                |   1 +
>   7 files changed, 546 insertions(+), 16 deletions(-)
>   create mode 100644 tools/perf/dlfilters/dlfilter-nonempty-brstack.c
>   create mode 100755 tools/perf/tests/shell/coresight/add_last_branch.sh
> 
> 
> base-commit: d17c5b770972854a4fe4cf5cc22e17eb21cdc787


