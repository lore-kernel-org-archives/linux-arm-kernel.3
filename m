Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2272C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hliszru8I65AnPHW7tmPd8zU3hebz8wd15dEVYUIRXU=; b=qJ5/wueaIfB/vUTiENj8zA9gMd
	8zIpKqrpknMO4IAcAUl/QFUWSmk18ORYMHhsXB6SM9PULk3ymtOWYlB4OdGYCN0e9DP1ZseytsdIa
	SF4hGeP85JOEA7xjNr+juo+w1HOZIc1VBLsklrHiqgIbvMJsxSlTDhCE8kK7uLn1yQO5Da2IXGCmF
	rhXDVu6vqunbv8iB2ogvx9XWX/bAwmSndrax+gD9DwdRapsO5oeJUaioq8mWL8JWLeupnBLMntDox
	KVY+GPreRisjS7JMOJL/jKpwg6YquBIr8Q+uRDgJb8eWwqiCyDCEmGsoLOvXWvqeKgxkNXGeDn7wH
	WGNxshGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk57N-00000005UUM-2mqF;
	Mon, 17 Feb 2025 17:41:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3rh-00000005F0A-0Mji
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 16:21:02 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4396a4d5e3bso30237865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 08:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739809259; x=1740414059; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hliszru8I65AnPHW7tmPd8zU3hebz8wd15dEVYUIRXU=;
        b=eDLt3c2vNdFH12ZMG+uSG1erUh7HvDUe9lj/Y0Vje9nK3PZi9CoRDe3jvSSRQK7xmf
         +aWoHhis9LBXOWpCKVHxxTTow94ZEXrcVf5WQA0BGfha9HhLM6c8kudj4KKTqwaLyVFV
         XJy552fhSroe2EYM8EDCeNostAV5Ph7upBeBU+eIZvbOZGVnHOTCh/9syKQ4v2YBfz31
         7AbWQ5a6SQsW+nBKbe3dxTHgPHY4kyUajy17pckcFXjodI+yykobH0i9H1Nf7F2cK4MR
         BokuyMTFoalXw2uAg+OCk1wv746Ofaxh5LiQy3SYSjUkmpurOlZdfy3aB8JQEAACP0VX
         4CNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739809259; x=1740414059;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hliszru8I65AnPHW7tmPd8zU3hebz8wd15dEVYUIRXU=;
        b=xVbpG1Xh4OJs8ERnx55C0BwDuqaxTGMCPXe9bXHm7OMteBz4zOW1u3cLsfA8SRLZ8A
         h7Zym6l0nrEEz+EPYjj+9vV/7FYwr8XAos8iOTNNLTWwCYDphnhInlM7vTEktLnG4K93
         rXUQdCZXQNWFGNKHged/Xzflo/nTMMph55YG5uBGgn4qsE8BKdyAB+sZEaEwSwqGYpNv
         4kuh84AoOgioKOM7dgL9I5XL09SQkQ/sMI+rKrtf3NRI0pJ0GHS7zncpcSTDl8PaSLlR
         Rr5WS+DVxh1Z8zKV8fRuTAJoHE8JcyH5rKfzOovOtvtEZ933qsTlMxPNAfyNgFlX0CFb
         Is+w==
X-Forwarded-Encrypted: i=1; AJvYcCUMfkrVBmNGsi2lKQq2ihtXlctg+i+4Bjs5Bmwt3pm2hFgEKRzV0A7trEwnnlFHUvk2ouPqvi5AxoT5Pu3OI6ok@lists.infradead.org
X-Gm-Message-State: AOJu0YybZkVBRCtNSk+83fb7e24EdauXWGVIohnP8Am42Z8hEEquqKBD
	mZ6sk/NBlDMcO/heK+P8ZU2puDHBAOZr6A2Swq718WXLAStlxF67Ihai2lPYkB8=
X-Gm-Gg: ASbGncvslFI5w4XJ/KpLLQlKmql+l77eg/VgLAho1SDGV5eu1CoI/WGuimuCiNb5HMj
	N4hW4q3G/KHuOQt7zg81LSP8JnW82YQ9c1xEpP3CmsslQbB4TSShbva84NwaTrcBk4fiAeJ1vFU
	/D/VoQ0exG/pkWpYDY+MjYsOG+4z0HOhhOpkQx/SfTgJfLjDyPxwgczvcH/kHtVFGXhdpTWtDTa
	uw6jxq+vNp5aZODaEQ9c9I5xm4efgyXVjO40MipzP0K4wIoJiN6tI2BO8KmW/sr1zfGNz30WE6t
	pTZBoOnIkRRwa9whNknK3kg5rQ==
X-Google-Smtp-Source: AGHT+IGdNrAgcV9AT4395Oyj88ssWQXJfojFnIpoXQA8wy4Csu5ENmq+Sh9avVfhPt2Ol9bspdhIfg==
X-Received: by 2002:a05:600c:1d23:b0:439:6b57:c68 with SMTP id 5b1f17b1804b1-4396e6df8bemr92447005e9.17.1739809259341;
        Mon, 17 Feb 2025 08:20:59 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a06d22csm157199225e9.22.2025.02.17.08.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 08:20:58 -0800 (PST)
Message-ID: <a5d99e7f-1d8d-41f1-976d-7d67a0d5decb@linaro.org>
Date: Mon, 17 Feb 2025 16:20:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] perf arm-spe: Fill branch operations and events
 to record
To: Leo Yan <leo.yan@arm.com>
References: <20250214111936.15168-1-leo.yan@arm.com>
 <20250214111936.15168-9-leo.yan@arm.com>
Content-Language: en-US
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Graham Woodward
 <graham.woodward@arm.com>, Paschalis.Mpeis@arm.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250214111936.15168-9-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_082101_121641_0D4C2614 
X-CRM114-Status: GOOD (  19.81  )
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



On 14/02/2025 11:19 am, Leo Yan wrote:
> The new added branch operations and events are filled into record, the
> information will be consumed when synthesizing samples.
> 
> Reviewed-by: Ian Rogers <irogers@google.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   .../util/arm-spe-decoder/arm-spe-decoder.c     | 18 ++++++++++++++++++
>   .../util/arm-spe-decoder/arm-spe-decoder.h     | 10 ++++++++--
>   2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> index ba807071d3c1..52bd0a4ea96d 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> @@ -207,6 +207,18 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
>   				break;
>   			case SPE_OP_PKT_HDR_CLASS_BR_ERET:
>   				decoder->record.op |= ARM_SPE_OP_BRANCH_ERET;
> +				if (payload & SPE_OP_PKT_COND)
> +					decoder->record.op |= ARM_SPE_OP_BR_COND;

I think this results in memory events being synthesised for these 
samples because of a bug in arm_spe__synth_data_source(). 
ARM_SPE_OP_BR_COND overlaps with bits from other packet types like 
ARM_SPE_OP_LD:

	if (record->op & ARM_SPE_OP_LD)
		data_src.mem_op = PERF_MEM_OP_LOAD;

arm_spe__synth_data_source() needs to only interpret that as a data 
source packet if ARM_SPE_OP_LDST is set. This was reported by Mike 
Williams but you have the privilege of hitting it for real first.

> +				if (payload & SPE_OP_PKT_INDIRECT_BRANCH)
> +					decoder->record.op |= ARM_SPE_OP_BR_INDIRECT;
> +				if (payload & SPE_OP_PKT_GCS)
> +					decoder->record.op |= ARM_SPE_OP_BR_GCS;
> +				if (SPE_OP_PKT_CR_BL(payload))
> +					decoder->record.op |= ARM_SPE_OP_BR_CR_BL;
> +				if (SPE_OP_PKT_CR_RET(payload))
> +					decoder->record.op |= ARM_SPE_OP_BR_CR_RET;
> +				if (SPE_OP_PKT_CR_NON_BL_RET(payload))
> +					decoder->record.op |= ARM_SPE_OP_BR_CR_NON_BL_RET;
>   				break;
>   			default:
>   				pr_err("Get packet error!\n");
> @@ -238,6 +250,12 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
>   			if (payload & BIT(EV_MISPRED))
>   				decoder->record.type |= ARM_SPE_BRANCH_MISS;
>   
> +			if (payload & BIT(EV_NOT_TAKEN))
> +				decoder->record.type |= ARM_SPE_BRANCH_NOT_TAKEN;
> +
> +			if (payload & BIT(EV_TRANSACTIONAL))
> +				decoder->record.type |= ARM_SPE_IN_TXN;
> +
>   			if (payload & BIT(EV_PARTIAL_PREDICATE))
>   				decoder->record.type |= ARM_SPE_SVE_PARTIAL_PRED;
>   
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> index 4bcd627e859f..85b688a97436 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> @@ -24,6 +24,8 @@ enum arm_spe_sample_type {
>   	ARM_SPE_REMOTE_ACCESS		= 1 << 7,
>   	ARM_SPE_SVE_PARTIAL_PRED	= 1 << 8,
>   	ARM_SPE_SVE_EMPTY_PRED		= 1 << 9,
> +	ARM_SPE_BRANCH_NOT_TAKEN	= 1 << 10,
> +	ARM_SPE_IN_TXN			= 1 << 11,
>   };
>   
>   enum arm_spe_op_type {
> @@ -52,8 +54,12 @@ enum arm_spe_op_type {
>   	ARM_SPE_OP_SVE_SG		= 1 << 27,
>   
>   	/* Second level operation type for BRANCH_ERET */
> -	ARM_SPE_OP_BR_COND	= 1 << 16,
> -	ARM_SPE_OP_BR_INDIRECT	= 1 << 17,
> +	ARM_SPE_OP_BR_COND		= 1 << 16,
> +	ARM_SPE_OP_BR_INDIRECT		= 1 << 17,
> +	ARM_SPE_OP_BR_GCS		= 1 << 18,
> +	ARM_SPE_OP_BR_CR_BL		= 1 << 19,
> +	ARM_SPE_OP_BR_CR_RET		= 1 << 20,
> +	ARM_SPE_OP_BR_CR_NON_BL_RET	= 1 << 21,
>   };
>   
>   enum arm_spe_common_data_source {


