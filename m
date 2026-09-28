Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE451C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ge0jtZOtdWzZExU51tpnSwFUmBlplbOktdbQBWDiyyQ=; b=iqKsPZfHkZVnkmNN6hnEToVATU
	AXYfO3pLiV0RTFQUVuIUGzh4r1uwelP2qSJBz1Kf5J73DrgkGcs+CT7Hou8Hn46V2CRqpLg4VSioq
	oLyYMr2Vi98HeUdGpOCJUpWX0qAYIwDB5evFTPtjQBG80s+YLmNGs29F2cq08eQ33Hgp18XinOQoq
	Y6C162re1tD6RL/YSzkCcDPJKHidSlsWBSbFK00EuNO4yX0KIU/3cW3G+KVyq4eFAavufvom5V3En
	6zWgOn6HskWDV3Rs55PXNW8ZVxOF2zpcxEnVWzFZN2F+MdLVPyWChpntndByI0vn1S/GnEaWwx5RT
	F+mwR4Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7rP-00000000FZ3-22rh;
	Mon, 28 Sep 2026 09:41:23 +0000
Received: from mail-ej2-x20.google.com ([2a00:1450:4864:34::20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7rM-00000000FYH-2ZVO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 09:41:21 +0000
Received: by mail-ej2-x20.google.com with SMTP id a640c23a62f3a-c2af3701927so388099766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 02:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790588478; x=1791193278; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ge0jtZOtdWzZExU51tpnSwFUmBlplbOktdbQBWDiyyQ=;
        b=KP6MUHIirkC4dT/AXHyDA32F7iOXCTRT/DmOfcdSAD0WMvANbQ4Us0zVUPYBMCWXMR
         9Dqwr2GkzzDsCLEfl6FJ61EPe0Spo2pBiGKq70x7qt9VeaYzNiuYarek2yyaG3JUDdUM
         LxB0FYy2fNfyuP6Ax10xQrNS9+ihbWInuytbulrfGNk6kbyjUcJvPqfPbrk1qsLevhVS
         1AxOhnZMju0l0fktpX7Ddfu19CuRaJGIIkEQbVF7FAb35W0Sun4ZvoV8mezI2bqLOPqB
         k6tS/JgneYj0FDMXNtx6vb+AFAwqj4PS4JbZ30xxkOhUWnUDvAlvZFhp5OxKNakfImLy
         X9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588478; x=1791193278;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ge0jtZOtdWzZExU51tpnSwFUmBlplbOktdbQBWDiyyQ=;
        b=SmcFdwsPggWnHjRXGtRRNZA5H1W6JlBEOJpgSNwfDOq4XhpWohs8ba31dcnA/97KkC
         +kcDVhHay94NTTcU+XBEGsAk31NkRc4E0u1Db4z5ZSb+HLFudiew8VOeaLPiIXfbaETn
         BcjjbrBWEd17ymBD6YoCog9wQj27Vk9WLHn/cgXiS1wVeFw01Twx2DGYZ2z9wQihxPds
         X6K4d3w8ByLksrVDkp2v9eQLjm9Ak1k8s8DVzFEAfxnnOwOTE4zjT89g1WUdPT2vufY6
         RSJwHZXNDTpnTbw33BhBg6ytrywjzSDQ+Pjx0cOTcVg74zZXg9s11YsOPKWaMJjqZD0v
         SvrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmkH3+7M56wCxFk0WbXOEp0D4nMsUVhP1Kai6MmGsUvjwnue0ropmoIcR4rfGv4zt3eWAu4PCpy7NgiRsTuxuB@lists.infradead.org
X-Gm-Message-State: AFuF++li2LKKjqLGKMadh7QvdCGR0CBJIYUZMcKQCijv12mqdG1CrJKK
	98brdsvnEoT+8qdXmt6AFf2PZOfQjd8OfBkOiIELyS5AM8ARGLBJICVEdeUSwLXNwxE=
X-Gm-Gg: AYBFou3koSyZZ5jM/ENm/XaLQTZnHLjCvTmSgdwu5BXM/01Yb7xtoHOFohmEjWlpH4h
	x9pgU9WxG/aflpUe1PzH4zrYBqgNDw7RLxr3gl643y+D4PWJlAHcAxqZ4Y6nfMWML5cdloBlgOr
	LFc76spgTQ6gQ00VY0BR48KhtJTXtqdVKDUR6KQmG1qBYqy2qhqgFD47xWpl6K2dlYAOPcy14QW
	djW1FuBpAnoiITVuK5bAVuQd7eJjAXZnV/D4JAFb9fjCZ1dMuBqLqeoSeT1EkrHolDCp6Jnrk6o
	x/Eo+s0P84e0fFeljfiLndKyoiHYsq6NkdTvJ8aAkBMW4mutEMUrDHdZ0nGuKHjpgnntXdTF2k+
	pvIhhethRUm5w8KoR0xnuoISimXDuhu/HNdQN0ARIUAzFqqmOx6e1q/Z06rkbB9qdUYMrCAEOSp
	/sBZt1ULHhfxwheBC/V4iH69o5mUQRsHHTNm9vwR2Qkdgf34jCmMCdB1mRkBVHTniMXa5sKtKDs
	Sg=
X-Received: by 2002:a17:906:6a04:b0:c2d:d89d:346a with SMTP id a640c23a62f3a-c2dd89d497amr199434166b.3.1790588478209;
        Mon, 28 Sep 2026 02:41:18 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2af3128c48sm370662566b.3.2026.09.28.02.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 02:41:17 -0700 (PDT)
Message-ID: <0e6c26a9-854f-42d8-9224-6e23937ad3f1@linaro.org>
Date: Mon, 28 Sep 2026 10:41:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] perf: Suppress redundant ITRACE start records for Arm
 SPE and CoreSight
To: Leo Yan <leo.yan@arm.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Adrian Hunter
 <adrian.hunter@intel.com>, Mike Leach <mike.leach@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>
References: <20260901-perf_suppress_itrace_start_records-v1-0-c4fbc6860859@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260901-perf_suppress_itrace_start_records-v1-0-c4fbc6860859@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_024120_679676_B8ABD74E 
X-CRM114-Status: GOOD (  16.54  )
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



On 01/09/2026 17:36, Leo Yan wrote:
> Thanks to Tamas Petz for noticing that Arm CoreSight perf data can contain
> many PERF_RECORD_ITRACE_START records.
> 
> PERF_RECORD_ITRACE_START provides the decoder with the initial thread
> context when that information is absent from the trace stream. Once
> tracing has started, Arm SPE and CoreSight decoders track subsequent
> context changes using context packets or recorded sched_switch events.
> 
> Have both drivers call perf_event_itrace_started() after successfully
> starting event. This prevents perf core from emitting redundant
> PERF_RECORD_ITRACE_START records when an event is scheduled in again.
> 
> Since the Arm SPE and CoreSight drivers can be built as modules, export
> perf_event_itrace_started() before using it in those drivers.
> 
> This series was verified with Arm CoreSight using the commands below.
> The perf data contains 100 sched_switch events but only one
> PERF_RECORD_ITRACE_START record:
> 
>    taskset -c 2 perf record -e cs_etm//u -e sched:sched_switch -- \
> 	  taskset -c 2 bash -c 'while true; do sleep 0.01; done'
>    ^C
> 
>    perf script -D 2>&1 | grep -c sched_switch
>    100
> 
>    perf script -D 2>&1 | grep -c PERF_RECORD_ITRACE_START
>    1
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
> Leo Yan (3):
>        perf/core: Export perf_event_itrace_started()
>        perf: arm_spe: Suppress redundant ITRACE start records
>        coresight: perf: Suppress ITRACE start records
> 
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 2 ++
>   drivers/perf/arm_spe_pmu.c                       | 2 ++
>   kernel/events/core.c                             | 1 +
>   3 files changed, 5 insertions(+)
> ---
> base-commit: 786262be6048deab760f68c8acc2c85607165894
> change-id: 20260901-perf_suppress_itrace_start_records-42faf45e9ce9
> 
> Best regards,

Reviewed-by: James Clark <james.clark@linaro.org>


