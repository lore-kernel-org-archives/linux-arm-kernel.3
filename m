Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF12CCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 15:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQKCc3o8CpOmEjXqvj1OmhWFZYzGoBkXsANUxN2NNQk=; b=mJ1xSd3xg/yTKCBIxXbfjJL/VR
	kIwGpetsjFvM1m2t2sirVbeMs6WiKOXVpD9klf9eqMDbwm+yVAsnf3+1d3Fh9fjZxNU1W3FKBVdGV
	PNpnStNxcwfXiGL7UQxZOXLiws0NewYVaO6bdxHak4gvZdFgjso2ePSWLIK4Udl5gbC36HUsD4/LI
	e5WjnrgH7MOymbJcXFUkYK4EZTKonAv7lC77gpY9wLlPZfkiRJ9DFoXCF0lE1hkgU/hgrPEDgNQN6
	aKQ021YuThQDKI51kmOZLCOyyPjgORc5SQVqFRBC2kLNh/xOBN6ZNVS7UAEakzIQab5VCByPWhy11
	N9qI0mGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBb58-00000003RyS-3NR7;
	Wed, 22 Oct 2025 15:48:58 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBb56-00000003Rwt-2CIo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 15:48:58 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4270a3464caso3033728f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 08:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761148135; x=1761752935; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nQKCc3o8CpOmEjXqvj1OmhWFZYzGoBkXsANUxN2NNQk=;
        b=k4FJ6PjLUM7xMiHiv6DPyMw5qjl1/NovHRcVSs8itlIBTWCZvi3tmDSiJh06A03YAU
         do/vHh+LKNRUWt9IQbQCIP0pzl68/gAb/EXS7qIT10x5edOGXGpA9V9ruFqYCeItBhbx
         dgv8M2UMoMlrgUnnHGKG7XLJJBWoqTRXj42hcu0MTCB/aN49UeJMS1CCQsN4VhzpvUcp
         MR3vLFdJYIVm1RlOZqBaiMNVO5KUbbJcRooOy8rwen56ra5d7fxb3Jbow3w3ThOjCn6Q
         NTG9H37PRAZmM4pya3Lpcjoiv2X+WiNiQ5ql3lqPCqRrXglFCd+M1n5TimH8/bH1f2x2
         SziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761148135; x=1761752935;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQKCc3o8CpOmEjXqvj1OmhWFZYzGoBkXsANUxN2NNQk=;
        b=XeihBxTwq1hyBbbXVcP4wRfCKieG62O0Bn8J7UwR32Gh0mkHSpLULsJK4Qt7YbXnRr
         rfW0IOY/J6QKq9z8BTd44Sakdm8cw0Sm4iJVZQaHLUvoZJ/FSHhWFJhxiJQrRwkbDBfw
         j13UQyGvRNoXagvxgTBjSU62xJj+ndIjyrodkOaXHWgwxjYwI/LLY7CqqxYLrvvPttqE
         DUB4JxXLvIbHdDaLYrc7BMfEx2cuFa34EvfQmbIwzevXPYDj0lBJo7igf+peiRPiuaM0
         /N0RgDLcMnzTLVkeWjNd0mavdQ9mp/USMLGAWJFxYA2kyb20pfSuT/yU3sPlwrq6YHaE
         s7Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUecVwmJULzTv+DssvH0aXz6TfqqgOlq2lZp8eqFZ0tGi0PonD714JzgJl+Dz5bFU4AkbzZ/Q0yZufHqrr3vHn5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+E9/dF/KM9IqGU+ybMujbbXyPKtfiPHizigTzdnoGsv5q6yWm
	uzsgEGSgCG71b6jQF0Eds27rqnePDpvIsNtT8rd+u8jH7zgaVggYX93azRcKAuS9N6U=
X-Gm-Gg: ASbGncuzP0ZgxceUgFbVFRbmkC1uUaeTNJPMYDG2AN3AhLJ+NeTYhe+yAY5453PTTxX
	D9tSngYd/rim70is8WmHtrexeIwGJK8Esyy6dNfbYP3kbRLfO52PCT5qsLXiBckBWmwz+MbYkrW
	m486/imlp86zevefBn6+J3l4xIbI9U6/18pWVJiyh3zWB/mKWYnK0UwOKPRGTtyfIvCOiunX3Eu
	kIMkmizVMNB2hLQg3nBK6j8hiXuwa8ZTN5GJvLqpjYbdWQsLYLSu0oKLrGTKgtRUIAQ8h1C9/Ja
	RZ/mJZMDnlGnlo/YXetqcBpO79uKnUNXN+u9glfSF7kjgU+CVpFxPqFZQqAzphtv7x5kU0KbTXO
	dCEszkvJ0ZHJX1a/jM7vz/J4kFFpWVigvGlYC92q+5nZfeWGzLKxr2RLn5XK6DUSR99zfUI1ogH
	N05jRX+g==
X-Google-Smtp-Source: AGHT+IHOKlM9ZXbVarUrdxd9Z6TXrWDN7PTBigcURwaaklRyyWxBtRFHep1+wcz22TEjatLqlseBVg==
X-Received: by 2002:a5d:5886:0:b0:428:1475:6a17 with SMTP id ffacd0b85a97d-42814756be9mr12100399f8f.53.1761148134341;
        Wed, 22 Oct 2025 08:48:54 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3ae9sm25465267f8f.13.2025.10.22.08.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 08:48:53 -0700 (PDT)
Message-ID: <6cb692cf-cb7a-4d47-9694-e3db4478fa4c@linaro.org>
Date: Wed, 22 Oct 2025 16:48:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf cs-etm: Mute enumeration value warning
To: Leo Yan <leo.yan@arm.com>
References: <20251022142849.1537706-1-leo.yan@arm.com>
Content-Language: en-US
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251022142849.1537706-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_084856_597143_227A7797 
X-CRM114-Status: GOOD (  18.93  )
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



On 22/10/2025 3:28 pm, Leo Yan wrote:
> When the OpenCSD library introduces a new enumeration value (for example,
> in the v1.7.1 release), the perf build fails with an error:
> 
>    util/cs-etm-decoder/cs-etm-decoder.c:600:10: error: enumeration value 'OCSD_GEN_TRC_ELEM_ITMTRACE' not explicitly handled in switch [-Werror, -Wswitch-enum]
>      600 |         switch (elem->elem_type) {
> 	|                 ^~~~~~~~~~~~~~~
>    1 error generated.
> 
> Convert to if-else sentences to mute the enumeration value warning,
> which can avoid build failures whenever the lib is updated.
> 
> No functional change.
> 
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   .../perf/util/cs-etm-decoder/cs-etm-decoder.c | 44 +++++--------------
>   1 file changed, 11 insertions(+), 33 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> index b85a8837bddc..3050fe212666 100644
> --- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> +++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> @@ -588,6 +588,7 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
>   				const ocsd_generic_trace_elem *elem)
>   {
>   	ocsd_datapath_resp_t resp = OCSD_RESP_CONT;
> +	ocsd_gen_trc_elem_t type;
>   	struct cs_etm_decoder *decoder = (struct cs_etm_decoder *) context;
>   	struct cs_etm_queue *etmq = decoder->data;
>   	struct cs_etm_packet_queue *packet_queue;
> @@ -597,52 +598,29 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
>   	if (!packet_queue)
>   		return OCSD_RESP_FATAL_SYS_ERR;
>   
> -	switch (elem->elem_type) {
> -	case OCSD_GEN_TRC_ELEM_UNKNOWN:
> -		break;
> -	case OCSD_GEN_TRC_ELEM_EO_TRACE:
> -	case OCSD_GEN_TRC_ELEM_NO_SYNC:
> -	case OCSD_GEN_TRC_ELEM_TRACE_ON:
> +	type = elem->elem_type;
> +
> +	if (type == OCSD_GEN_TRC_ELEM_EO_TRACE ||
> +	    type == OCSD_GEN_TRC_ELEM_NO_SYNC ||
> +	    type == OCSD_GEN_TRC_ELEM_TRACE_ON)
>   		resp = cs_etm_decoder__buffer_discontinuity(etmq, packet_queue,
>   							    trace_chan_id);
> -		break;
> -	case OCSD_GEN_TRC_ELEM_INSTR_RANGE:
> +	else if (type == OCSD_GEN_TRC_ELEM_INSTR_RANGE)
>   		resp = cs_etm_decoder__buffer_range(etmq, packet_queue, elem,
>   						    trace_chan_id);
> -		break;
> -	case OCSD_GEN_TRC_ELEM_EXCEPTION:
> +	else if (type == OCSD_GEN_TRC_ELEM_EXCEPTION)
>   		resp = cs_etm_decoder__buffer_exception(etmq, packet_queue, elem,
>   							trace_chan_id);
> -		break;
> -	case OCSD_GEN_TRC_ELEM_EXCEPTION_RET:
> +	else if (type == OCSD_GEN_TRC_ELEM_EXCEPTION_RET)
>   		resp = cs_etm_decoder__buffer_exception_ret(etmq, packet_queue,
>   							    trace_chan_id);
> -		break;
> -	case OCSD_GEN_TRC_ELEM_TIMESTAMP:
> +	else if (type == OCSD_GEN_TRC_ELEM_TIMESTAMP)
>   		resp = cs_etm_decoder__do_hard_timestamp(etmq, elem,
>   							 trace_chan_id,
>   							 indx);
> -		break;
> -	case OCSD_GEN_TRC_ELEM_PE_CONTEXT:
> +	else if (type == OCSD_GEN_TRC_ELEM_PE_CONTEXT)
>   		resp = cs_etm_decoder__set_tid(etmq, packet_queue,
>   					       elem, trace_chan_id);
> -		break;
> -	/* Unused packet types */
> -	case OCSD_GEN_TRC_ELEM_I_RANGE_NOPATH:
> -	case OCSD_GEN_TRC_ELEM_ADDR_NACC:
> -	case OCSD_GEN_TRC_ELEM_CYCLE_COUNT:
> -	case OCSD_GEN_TRC_ELEM_ADDR_UNKNOWN:
> -	case OCSD_GEN_TRC_ELEM_EVENT:
> -	case OCSD_GEN_TRC_ELEM_SWTRACE:
> -	case OCSD_GEN_TRC_ELEM_CUSTOM:
> -	case OCSD_GEN_TRC_ELEM_SYNC_MARKER:
> -	case OCSD_GEN_TRC_ELEM_MEMTRANS:
> -#if (OCSD_VER_NUM >= 0x010400)
> -	case OCSD_GEN_TRC_ELEM_INSTRUMENTATION:
> -#endif
> -	default:
> -		break;
> -	}
>   
>   	return resp;
>   }


