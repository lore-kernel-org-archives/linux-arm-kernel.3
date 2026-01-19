Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09407D29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFT4jUUaZz57bS1dfTSRz5ITsUWUla9JgvhGvj2LyF4=; b=jhsLIEtg1VSX13gYBHLqBFYTu0
	oQyQ8TTrF9+oZb3VGIckgt+7fkP3GQeqDDKBmfCvrOrPgf4T2xfCz1VBRxlm1RGyKAXzDsT7aFK66
	WcbvVO/esAChbAmCFx4iSr9fq0+PEix7g4ukY3jybVmsiWPLFYIDa91LvZgnPvwu1WDrhq7MkQwaZ
	u4FZWLRARr5/ZeW/RVvpx1CIFEOyqcH5ngSOn+syyoFVzWqjrO8TJgHjVokp+SbzkUT2ZQcGegrs9
	CH5sBPoGJoWBCG3cgLjPTlDy8iVUoRiZVwmHNL/kSe4OENOV8dFDgEPUqW6P6KclAwZLb8ldC5VjT
	xKdaP5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqzG-00000002KOF-2xCo;
	Mon, 19 Jan 2026 15:16:14 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqz7-00000002KN0-3J0d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:16:13 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43284ed32a0so2456641f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 07:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768835764; x=1769440564; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFT4jUUaZz57bS1dfTSRz5ITsUWUla9JgvhGvj2LyF4=;
        b=UZP2vbx845aUPq9rjPPq2niJqKRMXJY3/2O/2uqda6QboN0KwgmuDL1MTT+vf+bTZd
         KGbVRrvTaRF/eqcrIxVCH2c2rWLYsc70Cz8lwXL+tA9JMpKvPJJgD2d58PjfpLdg08Yo
         ZIaco9+7K523g7dcipeRbNQ8/VaOhq3FwfnMykzgb1VHG7U0MN2NNnYAjwo1BhIKdA+s
         tFlTKtrinSnelBcOQnnWKZdRT/CqPrlX8EC72lkF7V59Bw33UotdvIF+8ip+tW9mmZdL
         WevtxJ91wmCm4YwtNlifRRsbuqyd4LMBzMoAmIKNmXWhwMx1HdFDMYBG69kjhNlknqkE
         mgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768835764; x=1769440564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zFT4jUUaZz57bS1dfTSRz5ITsUWUla9JgvhGvj2LyF4=;
        b=a1NyFErSsC0vUIX+16BYRbfupbUfjqp+OUZItP5JxzTpZCgduK8qN6NRELoa/M6RAN
         K+tF0VIGoba7uspwR5CueXfhwrSXrbK46eaWySwHJQIoDE5Uh3jH/7wUTFZuNbCDx7L8
         D/1rP3eKrOTyUbAMnenTIoNml/PPy3J4WllOf2OPbkDrp9TlGwCZ9Vv1EE8KbEuVU5st
         LmBkatWi9avnU15nQ3Gijlc6Gmpa5zUpChoqgK6nMtIUEZvqAblh6l2OAn9zvhf5ixkA
         02+oY2XdeNyT6YjIzMqLS6G0Em9rj30hW26ZKz95RjMDiHoqQM8sj6Z4/Exrf21Baxdq
         TuCw==
X-Forwarded-Encrypted: i=1; AJvYcCUrXV/Hv/R6/A4tWpPDICUpXArYa2UlRSZlRmBubEP4168vek+o11kTkS9Gz//lZ31/L7RXWK//vh4He4mmYHP+@lists.infradead.org
X-Gm-Message-State: AOJu0YwKBN4Vl/pKfFNGkteotz605TZPrE5JZeMX6dHodGjOjLTsKZqS
	UwzT4HRvNLmSGH3l2Vjz8laaMyH6TqGAz/kDyF2rJ+SPpm0QNx12//pMaqOmkiTbOug=
X-Gm-Gg: AZuq6aIiKka2u6n9Nt+XmFeiVCQGRDtxvmh7TwTtz9RXo5rVLJ8ybt6GX8YtryfTBcG
	St1xYSDqy/kNK4Soxd5SMUaLB88R1J/VudjI8YAQ9z3+2WoiyBGNf+CDqtQnAVAj5qFEdMrpyv8
	z7NdVl3UUIBkYt0W4xjtCoEubn/AKJ8UAHh91WEx35Nc8PT21AwHOy72dVrhMgY5/zae3+HTIrr
	5+tZ16055x4XgGif+l/hK6v9wNGnPC6ktsBi8DKoUsm5+/wrhBWDZrU0k6bQCVPC4EguOaOq0Jr
	RGneeiy7+A/zAVlxA7cvFYUKXfkOXyp/KzNwU9rr466nMP8cJWxlazWD6O2nnYB0VSdKK8ObXMJ
	jUPmbbOZ8p5MDrzTnmAsGR9uuHe5jTfdiTPnxzQp95Pp+gCpo9RB5J8tz04l/yW8H6hQHCdR060
	EGbAMwAYA5I+CSE1ey
X-Received: by 2002:a5d:64e9:0:b0:432:c37c:d831 with SMTP id ffacd0b85a97d-43569972cd7mr14273632f8f.1.1768835763612;
        Mon, 19 Jan 2026 07:16:03 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926648sm24570224f8f.10.2026.01.19.07.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 07:16:03 -0800 (PST)
Message-ID: <dd9a3cde-ea9f-4c53-b537-f15767bf4d99@linaro.org>
Date: Mon, 19 Jan 2026 15:16:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] perf cs-etm: Fix decoding for sparse CPU maps
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thomas Falcon <thomas.falcon@intel.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260119-james-perf-coresight-cpu-map-segfault-v2-0-56b956a629ee@linaro.org>
 <20260119-james-perf-coresight-cpu-map-segfault-v2-1-56b956a629ee@linaro.org>
 <20260119111509.GD1286628@e132581.arm.com>
 <3b06ea25-2516-406c-8b78-c359d3fb2aa6@linaro.org>
 <20260119145337.GB2732125@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260119145337.GB2732125@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_071611_744549_3FD6E632 
X-CRM114-Status: GOOD (  31.55  )
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



On 19/01/2026 2:53 pm, Leo Yan wrote:
> On Mon, Jan 19, 2026 at 11:55:53AM +0000, James Clark wrote:
> 
> [...]
> 
>>>>     0 0 0x200 [0x90]: PERF_RECORD_ID_INDEX nr: 4
>>>>     ... id: 771  idx: 0  cpu: 2  tid: -1
>>>>     ... id: 772  idx: 1  cpu: 3  tid: -1
>>>>     ... id: 773  idx: 0  cpu: 2  tid: -1
>>>>     ... id: 774  idx: 1  cpu: 3  tid: -1
>>>
>>> Seems to me that this patch works around the issue by using the CPU ID
>>> instead, but event->auxtrace.idx is broken.
>>
>> I don't think it's a workaround, I think it should have been written this
>> way in the first place.
> 
> Agree.  Sorry for confusion in my rely.
> 
> [...]
> 
>>>> @@ -3086,7 +3086,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
>>>>    	if (aux_offset >= auxtrace_event->offset &&
>>>>    	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
>>>> -		struct cs_etm_queue *etmq = etm->queues.queue_array[auxtrace_event->idx].priv;
>>>> +		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, auxtrace_event->cpu);
> 
> During decoding, cs_etm allocates its own AUX queues and needs to
> convert the AUX records into a cs_etm-specific format.
> 
> For example:
> 
>    event_id=405 idx=0 cpu=0 tid=6673
>    event_id=406 idx=1 cpu=1 tid=6673
>    event_id=407 idx=2 cpu=3 tid=6673
>    event_id=408 idx=3 cpu=4 tid=6673
>    event_id=409 idx=4 cpu=5 tid=6673
>    `            `      `> CPU ID
>     `> Event ID  `> Generic buffer IDs
> 
> In this case, I deliberately hotplugged off CPU2.  As a result, the
> buffer IDs are consecutive from 0 to 4, while the CPU ID for CPU2 is
> missing.  When adding AUX records to the cs_etm queues, we need to
> convert from the generic buffer index to the corresponding CPU ID.
> 
> So the above change makes sense to me.
> 
>>>>    		/*
>>>>    		 * If this AUX event was inside this buffer somewhere, create a new auxtrace event
>>>> @@ -3095,6 +3095,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
>>>>    		auxtrace_fragment.auxtrace = *auxtrace_event;
>>>>    		auxtrace_fragment.auxtrace.size = aux_size;
>>>>    		auxtrace_fragment.auxtrace.offset = aux_offset;
>>>> +		auxtrace_fragment.auxtrace.idx = etmq->queue_nr;
> 
> I am still confused about this.  Because above auxtrace will be queued
> on cs_etm queues, should we convert from the generic buffer index to the
> cs_etm specific one?  E.g.,
> 
>    auxtrace_fragment.auxtrace.idx = auxtrace_event->cpu;
> 

This is basically what the change is already doing. etmq->queue_nr == 
CPU because cs_etm__setup_queue() is called for every CPU up to max_cpu, 
not only for ones that were recorded so it has a 1:1 mapping. Using 
etmq->queue_nr also works in per-thread mode where queue 0 is used, 
which your suggestion doesn't handle. Otherwise they would be equivalent.

To be honest the whole decoder has become hacks on top of hacks. I think 
we might want to do a full from scratch re-write when we come to do the 
proper timestamp to MMAP event correlation or the change to not keep 
resetting the decoder for TRBE wrap mode.

> BTW, if my understanding above is valid, it is good to go through the
> cs_etm.c file for the "idx <-> CPU ID" conversion.
> 

Do you mean there are other mistakes? I did check the rest and did some 
testing and didn't see any issues.

> Thanks,
> Leo
> 
>>>>    		file_offset += aux_offset - auxtrace_event->offset + auxtrace_event->header.size;
>>>>    		pr_debug3("CS ETM: Queue buffer size: %#"PRI_lx64" offset: %#"PRI_lx64
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>> _______________________________________________
>>>> CoreSight mailing list -- coresight@lists.linaro.org
>>>> To unsubscribe send an email to coresight-leave@lists.linaro.org
>>


