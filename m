Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F150C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 10:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfW5BGT5pTjwhGTP5m8htmZ9lluyeh+guldKWayNHGg=; b=ZfqemZdxx0Mqfv3e+dzRIRA+Vr
	7P393o7A4Ny1tCjhEb9qW86md2onugrEGJMpngFD3X1hc+N+YhTP7R2N02YAzo5iiEKfTZ29cuB6k
	aafVWy+QPRYAlT/g1DM7qN3Jb4+u8FTGReIGI3u4/G5OiAO8KV3yUgLUzMV+0loXXNAkXYYTy7xQi
	uykHDkuoWttzS/38nMJQJ7oW4weuIndZaREVWRb5TzZF2M3pNsJUds1ATIdQlAaDZn1srI1FxzT0d
	/Wg8jCwR7TrfKA+jI0/dr8D5+5Ty9q1LsyJwg2vQa9LUtsX9qpODDMjplO6GI79LQdGnK/Dvn5eu/
	lNzK/Lng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWqi-0000000AjOh-42JK;
	Thu, 13 Feb 2025 10:53:40 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWpH-0000000Aj7O-1xWh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 10:52:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so7833045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 02:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739443929; x=1740048729; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TfW5BGT5pTjwhGTP5m8htmZ9lluyeh+guldKWayNHGg=;
        b=FevMrc5+WJlfwX6Q84+ZgG3qt8Wjx03j/y60UCBE6ZAFRG4kzEhvMerut+i4VhouZO
         erD0q5gt6On5EDnbwfWVvnC063OYKpe1qeyVicUy6Svu6X2OjXwlxCrJo9lcSo4ms0tu
         Br900xtHROOI2VBN2VHqcGg0JJn2QP0pu0wnshypVVSPvq1HTjhq5w+U6QK5J1eBDtGu
         sL2JGTvx46bxJT14AaP01gGI09wX6uCYjwby1u/hXs+cmft6TSxuZ8x8Cnu+LPby1Qjt
         Ln9ikqEK76qy9Rme4dJ2+HTL5AlmbdBelbC7crdYXXI2TskI9PJXE5hWd5fjUN+MiOXd
         Kgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739443929; x=1740048729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TfW5BGT5pTjwhGTP5m8htmZ9lluyeh+guldKWayNHGg=;
        b=c2TrclZpoLXlhS2Wxt4ME2VJ4yFuiy7JBINRuWnRIFO4NH2AOwpdhbxp0mzMbTjL8e
         LkU1cu4iae2sI5yJfg6hxUPkfgqjkNGQ0zUXFxSijOM3/gclviERIDtq3UGUDGBZC+Vo
         w0TAIMVsEGu2GlluGzJVL48pBcsYdqQcMnmSXZ0AwA2UXKjvZ8X1EEPbv1qtnW58pCoz
         0g3R+WJezHirw0eg3FVQfBYvoV5fHnXTLvNI2Fexx9uUUFW2z67F28ehyva8arOVCZaj
         ou7is/tVetjqd2/dERbkFNH75pfr8o3j6dHZslWYTNaT9wTyK3dJrV14FAZ//QRW8otK
         JMHg==
X-Forwarded-Encrypted: i=1; AJvYcCW9ciDwk7LAxmWKtogNwS1t8yh1l1A2bQ7sMXLzc4PA2Oc5jk06OHpHvw3Q1QuxhHr5gFjqz2JBQ+TsGJ+yi0Ea@lists.infradead.org
X-Gm-Message-State: AOJu0YzJIPKQ1yPYqAmmykxCAX+qIupu1Ika5F0PnSZOYF1Ujay3pVnm
	sTomMfxk4CDD7ILet5dlKm6GCZPtLDexSe6+BDB5hCV/Ru6vARxjqjBulwdm1Y8=
X-Gm-Gg: ASbGnct2RTEg3LeyNpXaClv3oByi1nYsPqGHMG/gSNan2v8TX9InN9L9VzKXXG/wohB
	Undr1yJsYCAcWZAuXusgLfgQoyxI9WhEeI8jmMyXE4v9fl7mcuoCHNgBDv2ZfKX/ujVbOJ82bZ1
	I98yp77tt9tzslTlVmKattNWZn4akLx5a6DRHG6BB9A08ZbM0NWAZne1keLU0k4zHFv8rydih9Z
	4vBnMciZq7eW8VtH5ikw/iuFWSJ3UBm+VFLdS7s+k3lxsP/Hfu9dF71lanaw3zurBpGFMV5A0wS
	AulTvpzu8QNPZUEaUi6l//+ALQ==
X-Google-Smtp-Source: AGHT+IE3cVCMFeTiplAdl6oIol2hwK+z0KRfMjE6tnhaJF9qrn7yWiTvmVjpIcI0wTDSh3lcSVhCfg==
X-Received: by 2002:a05:600c:19cf:b0:439:5573:9348 with SMTP id 5b1f17b1804b1-439581b88ccmr64782085e9.22.1739443929479;
        Thu, 13 Feb 2025 02:52:09 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617ffa28sm13991045e9.14.2025.02.13.02.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 02:52:08 -0800 (PST)
Message-ID: <5f4e90f2-1956-4f12-b2f4-b355012beb6e@linaro.org>
Date: Thu, 13 Feb 2025 10:52:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf vendor events arm64: Fix incorrect CPU_CYCLE in
 metrics expr
To: Yangyu Chen <cyy@cyyself.name>, linux-perf-users@vger.kernel.org,
 irogers@google.com, namhyung@kernel.org
Cc: acme@kernel.org, adrian.hunter@intel.com,
 alexander.shishkin@linux.intel.com, fj3333bs@aa.jp.fujitsu.com,
 fj5100bi@fujitsu.com, john.g.garry@oracle.com, jolsa@kernel.org,
 kan.liang@linux.intel.com, leo.yan@linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, mike.leach@linaro.org, mingo@redhat.com,
 peterz@infradead.org, will@kernel.org
References: <tencent_D4ED18476ADCE818E31084C60E3E72C14907@qq.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <tencent_D4ED18476ADCE818E31084C60E3E72C14907@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_025211_524988_25A5967B 
X-CRM114-Status: GOOD (  17.73  )
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



On 13/02/2025 8:44 am, Yangyu Chen wrote:
> Some existing metrics for Neoverse N3 and V3 expressions use CPU_CYCLE
> to represent the number of cycles, but this is incorrect. The correct
> event to use is CPU_CYCLES.
> 
> I encountered this issue while working on a patch to add pmu events for
> Cortex A720 and A520 by reusing the existing patch for Neoverse N3 and
> V3 by James Clark [1] and my check script [2] reported this issue.
> 
> [1] https://lore.kernel.org/lkml/20250122163504.2061472-1-james.clark@linaro.org/
> [2] https://github.com/cyyself/arm-pmu-check
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

Thanks for the fix. I'll report this issue on the source data.

Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   .../perf/pmu-events/arch/arm64/arm/neoverse-n3/metrics.json | 6 +++---
>   .../perf/pmu-events/arch/arm64/arm/neoverse-v3/metrics.json | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/metrics.json b/tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/metrics.json
> index 1f7c9536cb88..eb3a35f244e7 100644
> --- a/tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/metrics.json
> +++ b/tools/perf/pmu-events/arch/arm64/arm/neoverse-n3/metrics.json
> @@ -169,7 +169,7 @@
>       },
>       {
>           "MetricName": "fp_ops_per_cycle",
> -        "MetricExpr": "(FP_SCALE_OPS_SPEC + FP_FIXED_OPS_SPEC) / CPU_CYCLE",
> +        "MetricExpr": "(FP_SCALE_OPS_SPEC + FP_FIXED_OPS_SPEC) / CPU_CYCLES",
>           "BriefDescription": "This metric measures floating point operations per cycle in any precision performed by any instruction. Operations are counted by computation and by vector lanes, fused computations such as multiply-add count as twice per vector lane for example.",
>           "MetricGroup": "FP_Arithmetic_Intensity",
>           "ScaleUnit": "1operations per cycle"
> @@ -383,7 +383,7 @@
>       },
>       {
>           "MetricName": "nonsve_fp_ops_per_cycle",
> -        "MetricExpr": "FP_FIXED_OPS_SPEC / CPU_CYCLE",
> +        "MetricExpr": "FP_FIXED_OPS_SPEC / CPU_CYCLES",
>           "BriefDescription": "This metric measures floating point operations per cycle in any precision performed by an instruction that is not an SVE instruction. Operations are counted by computation and by vector lanes, fused computations such as multiply-add count as twice per vector lane for example.",
>           "MetricGroup": "FP_Arithmetic_Intensity",
>           "ScaleUnit": "1operations per cycle"
> @@ -421,7 +421,7 @@
>       },
>       {
>           "MetricName": "sve_fp_ops_per_cycle",
> -        "MetricExpr": "FP_SCALE_OPS_SPEC / CPU_CYCLE",
> +        "MetricExpr": "FP_SCALE_OPS_SPEC / CPU_CYCLES",
>           "BriefDescription": "This metric measures floating point operations per cycle in any precision performed by SVE instructions. Operations are counted by computation and by vector lanes, fused computations such as multiply-add count as twice per vector lane for example.",
>           "MetricGroup": "FP_Arithmetic_Intensity",
>           "ScaleUnit": "1operations per cycle"
> diff --git a/tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/metrics.json b/tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/metrics.json
> index d022ae25c864..4a671f55eaf3 100644
> --- a/tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/metrics.json
> +++ b/tools/perf/pmu-events/arch/arm64/arm/neoverse-v3/metrics.json
> @@ -169,7 +169,7 @@
>       },
>       {
>           "MetricName": "fp_ops_per_cycle",
> -        "MetricExpr": "(FP_SCALE_OPS_SPEC + FP_FIXED_OPS_SPEC) / CPU_CYCLE",
> +        "MetricExpr": "(FP_SCALE_OPS_SPEC + FP_FIXED_OPS_SPEC) / CPU_CYCLES",
>           "BriefDescription": "This metric measures floating point operations per cycle in any precision performed by any instruction. Operations are counted by computation and by vector lanes, fused computations such as multiply-add count as twice per vector lane for example.",
>           "MetricGroup": "FP_Arithmetic_Intensity",
>           "ScaleUnit": "1operations per cycle"
> @@ -383,7 +383,7 @@
>       },
>       {
>           "MetricName": "nonsve_fp_ops_per_cycle",
> -        "MetricExpr": "FP_FIXED_OPS_SPEC / CPU_CYCLE",
> +        "MetricExpr": "FP_FIXED_OPS_SPEC / CPU_CYCLES",
>           "BriefDescription": "This metric measures floating point operations per cycle in any precision performed by an instruction that is not an SVE instruction. Operations are counted by computation and by vector lanes, fused computations such as multiply-add count as twice per vector lane for example.",
>           "MetricGroup": "FP_Arithmetic_Intensity",
>           "ScaleUnit": "1operations per cycle"
> @@ -421,7 +421,7 @@
>       },
>       {
>           "MetricName": "sve_fp_ops_per_cycle",
> -        "MetricExpr": "FP_SCALE_OPS_SPEC / CPU_CYCLE",
> +        "MetricExpr": "FP_SCALE_OPS_SPEC / CPU_CYCLES",
>           "BriefDescription": "This metric measures floating point operations per cycle in any precision performed by SVE instructions. Operations are counted by computation and by vector lanes, fused computations such as multiply-add count as twice per vector lane for example.",
>           "MetricGroup": "FP_Arithmetic_Intensity",
>           "ScaleUnit": "1operations per cycle"


