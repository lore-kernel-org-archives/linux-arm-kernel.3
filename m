Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EF5C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 10:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wfB7k7gMEQrYDY7VtPxjD0ttrzFbn4Ekh8A5LusVLg=; b=nKh5jU9APlwFXkJh341vlddq2l
	2EuNeJjWlz/SZaEFQRwUwpcZHq6O1+c49Fl9qNWW0h7Tpf6SQfZDnSdq9kgy4/74qPXbRyRe+C+IS
	RgyVu6NA+djdDjcx/RRnuFBXiz9v8DGLRiFYbHl/uKjq9i9BQHppRiBsPWLqzuJLrTxJxsoGnUV6K
	sZO7FpBXvbVMtYn2RVlkziqCBB7CAqgts7RxQEgcJSRwqumWNfM7kUO5DRQFHxA16fwkGy/VP7tu7
	pjvS+EUOxPMRS5/g1bhI+fNqFpu1jsDeKlF2nQgdpO9tx7ih7dsIcOL4vYIMODhfKFhLmapg/C4b/
	rdt9K3Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUW9-00000005bLx-2vmX;
	Tue, 18 Mar 2025 10:49:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUTS-00000005amH-07b3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 10:47:07 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-390effd3e85so4493324f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 03:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742294824; x=1742899624; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2wfB7k7gMEQrYDY7VtPxjD0ttrzFbn4Ekh8A5LusVLg=;
        b=RsymGh47FRI/Ju1z5IIsltDOI1GVP9luUqzLETgl4QaswPzFlNOn3GrKOpgbzXaJKF
         XLFxT5B7UP9i6WZlHKbnoBLnhD7yz/zw7rX9KLpxjqd5b8209P//Dj8DBOCDjacvR4Dx
         G0ywxFPmjmmg0pcTxy04AHJGJ1iIMeePXlWFfSL61WoIKTpl1m+HryKuMCofFZJUhNZj
         tdErvXm3qt/VX9hV9vj9fOc9Ef06Z4or0PAPhUuAL8lew4s+tfu/dWP0vJ5oKqFFchqZ
         IGqanswDQoLQ3TGvimX7zMnO5xL6ZfTkek0Cdr/gYOdJeaAGg81NcMNWydWVMpZn/R8O
         bS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742294824; x=1742899624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2wfB7k7gMEQrYDY7VtPxjD0ttrzFbn4Ekh8A5LusVLg=;
        b=P/mMvWIjRjl0rZ/Z/YADELIniAlQreuNToZAOIa9uCTZgR5cmjje6Kduu13HkX4+yN
         0Meo3BV1Yanxs7keIIaoqtJ4gV/QQ8oWIF1JDJHRvzUx1uVApuju4sziC3Q/HAmnBrxR
         9DNPmCFBrFFkRSe5gjrcjVbmEbXWS3hJ+O9ZQKxMqT7z9uUhCkrfmXRxyeBD9xuyqFiM
         ulqvMT66/xALAVYDTSuJmr27rJBGLIxwitDCx6UmbFSpmwt//Kvh8B1TFLanV94ZkIIL
         jKQ9DvWQlyt8GZ0a2AcOUgqxxpYu0Z7ywi4JLa3lZeSoiQIiSWcM6YNo15VLXolxbuNl
         qYAg==
X-Gm-Message-State: AOJu0YxuazYapcp9oP0KyxCnKRyUgEDckWqjnoDuSOeKyn7xsLtslmLP
	q+xSGcXlHPFwFvcDWUtMI74Y51kDoiyiy7sH84xUAUtdaMf9kcPXjsb9W6ftv6U=
X-Gm-Gg: ASbGncvQQnpGg8P4fG46aQi6oDA/aTFTqxdv/VH2MASAJxcmQ39Rg3QlQK7v6ud0y0o
	G4jbzg0YrKvgoVtC0TmpLPRHiYd5BzCK9HT6yboXWu0gUlC/Z6b4m4LsAFDcMh1mlB2BiNkh/Gk
	b5IkrUsnwSD/lkD3cG2np1RUEHCs/EyERtyuVuOGd3WTzPhamM4VWi/xuHTnsoG/1QG17FCE9wU
	xg0QszjIAXwTB2PsJW5SXrUVZE8L3+Mh3EcKZVCZG9U4BykzQhVFsOpQMZ7QVS1YVOS/rElCv4m
	jNqPItAs1TonKixCPCUwq86yVYpxoHvu+gO5JfsgvHz69XkrW+NZYw==
X-Google-Smtp-Source: AGHT+IG0L+hGt6w3IZk92zDd4DNaC/NC9eZTtg+wTxtfM4mV6V6YpzKmb5xSvPPVdoJTGLTCbNMaHQ==
X-Received: by 2002:a5d:6c6c:0:b0:38d:e6b6:508b with SMTP id ffacd0b85a97d-3971d23508dmr14129706f8f.9.1742294824127;
        Tue, 18 Mar 2025 03:47:04 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb40cdafsm17880141f8f.62.2025.03.18.03.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 03:47:03 -0700 (PDT)
Message-ID: <880bebc4-5a59-451e-beb2-60cee9a3efd5@linaro.org>
Date: Tue, 18 Mar 2025 10:47:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] perf vendor events arm64 AmpereOneX: Fix
 frontend_bound calculation
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>
References: <20250313201559.11332-1-ilkka@os.amperecomputing.com>
 <20250313201559.11332-3-ilkka@os.amperecomputing.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250313201559.11332-3-ilkka@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_034706_118175_E79C31B8 
X-CRM114-Status: GOOD (  16.47  )
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



On 13/03/2025 8:15 pm, Ilkka Koskinen wrote:
> frontend_bound metrics was miscalculated due to different scaling in
> a couple of metrics it depends on. Change the scaling to match with
> AmpereOne.
> 
> Fixes: 16438b652b46 ("perf vendor events arm64 AmpereOneX: Add core PMU events and metrics")
> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> ---
>   .../arch/arm64/ampere/ampereonex/metrics.json          | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> index c5d1d22bd034..5228f94a793f 100644
> --- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> +++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> @@ -229,19 +229,19 @@
>       },
>       {
>           "MetricName": "slots_lost_misspeculation_fraction",
> -        "MetricExpr": "(OP_SPEC - OP_RETIRED) / (CPU_CYCLES * #slots)",
> +        "MetricExpr": "100 * (OP_SPEC - OP_RETIRED) / (CPU_CYCLES * #slots)",
>           "BriefDescription": "Fraction of slots lost due to misspeculation",
>           "DefaultMetricgroupName": "TopdownL1",
>           "MetricGroup": "Default;TopdownL1",
> -        "ScaleUnit": "100percent of slots"
> +        "ScaleUnit": "1percent of slots"
>       },
>       {
>           "MetricName": "retired_fraction",
> -        "MetricExpr": "OP_RETIRED / (CPU_CYCLES * #slots)",
> +        "MetricExpr": "100 * OP_RETIRED / (CPU_CYCLES * #slots)",
>           "BriefDescription": "Fraction of slots retiring, useful work",
>           "DefaultMetricgroupName": "TopdownL1",
>           "MetricGroup": "Default;TopdownL1",
> -        "ScaleUnit": "100percent of slots"
> +        "ScaleUnit": "1percent of slots"

I never considered that ScaleUnit could be an issue when the metric was 
included in other metrics with different scales. Seems like an easy trap.

Reviewed-by: James Clark <james.clark@linaro.org>


