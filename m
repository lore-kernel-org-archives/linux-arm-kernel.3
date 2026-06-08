Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B32DCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 12:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oFATbLGkQWkwCipjQpmUUujF+3Rvcq+brYRvNSnEek=; b=iGukc8tQ37bt+Rp0E1Elt+xMEl
	TjNSu0H4nIAdh+8wuNWUkRS3Gc6bk6mHo3uktsLjcO4Bcr7T3rwp/lejpJ/FTAVkn7lCYcYBH3ui7
	iKosdiAQe0fxrTucq8ocl87GKPqI464bMuvrrtoXbJMojcXIalUJj17JJNXb1hRrMRp6HOegPP4ZM
	gnyQoU++usyplFybqOcx1ZqattM2+wiys8KzEU2u0UdWupQgo96KnR3JPfUfjR0Dt2wCl+0O9fvG5
	EtvDDk7tAJtiO6mUbnrA4OPP0NIQPPMVMHKqg0SSvQh+0vESVPtEpY50217AvcUy3Iv0ms9IdR3DY
	7dF8aBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZCa-00000003WVh-1k4H;
	Mon, 08 Jun 2026 12:35:36 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZCW-00000003WUh-3gFr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 12:35:34 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-bebb72b845aso627144066b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 05:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780922130; x=1781526930; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8oFATbLGkQWkwCipjQpmUUujF+3Rvcq+brYRvNSnEek=;
        b=hjIn8TUeB71xVOF3A09690uVbCM33tNIzl7d+JQcDg1QiacZ9dtuKydvK2NiImh1Ew
         br5mhL+SEW+frZJAzG10z/bYCby/WHp3NcPMfqgpJCC0ukaVgGR1Q7SFx6nrGvY9ajX+
         B48ROUrxpUvv/Qr4f9GMuEZh5JsFA88IUL8jGRxvsBJdCWtm5qIHEwe6hHNUJK2zxnAa
         Juy0ILEuWTFGrKz4H0o/W+iX9E2AzbT1mwOSlQuKsfmhdY5uj+9zxqq1Zp3jiFTEXqxi
         xzGquc16nK84XZ4q63l6+4J69olUlG69SiCxiViwA+PuWZ56PQ2FzkFzcBZDn3LlqeTT
         PDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780922130; x=1781526930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oFATbLGkQWkwCipjQpmUUujF+3Rvcq+brYRvNSnEek=;
        b=lxc2aIodRDkmWHUfbkIH+PmLbP4ba8Q8tar/g2+rv4evcDmZ91X36Onkv4CooZAmWf
         JcqxkQ12HOpyjML0v0tnjkEv7RIjgFG0L/6i298Sf77wIiq15ytYcc9I/inLiw62gOEN
         kmj3iri6IaRU/bFTGDNMrw5ccZar+iXZCgY4D5iN99ZGRalaT0Gw8wyHilu1R5P5h1ta
         TnMkOBk0Z8IwOpwX/TyDl2hdIhXponK5GWcQmT3e5yN6qdgejNZmQj8GKXLGb+oaX2yN
         jqahOt6mnKaJzaXGCh9zXV0QG7i52MaJn1b9NO2a/Nz3DYDsvN+TPvuv2ZaOs1tqATUq
         g3KA==
X-Gm-Message-State: AOJu0YzLm4X7fbePo3CTcF6f4BJxbbCu4yG9C8vulVlKP1EpLhlI+erc
	i7LXHaV+IURhOwxu092Hh7nHm/rxq7cElHFC3IPr+Oi7+U7evWluPFQjc1OX6AZluZBwxxMXsuX
	ZrAkHesI=
X-Gm-Gg: Acq92OFK4/POZQq1+Yh0/dF1jTAqEG4sQphm5p9jb2hpnzRGJWf27NFc/Koedel3dmq
	j00fAM7qjjC1Optx82VtH4vjAaOirDzN+IVyw+CCQUbEm/QIhqjyDcm4Kb69B8iV+FFMolYEAna
	nU9PVeIARLM1HmYAEqqu57xpqRy52Vn5PiRNxNUtVXvG8WjqOmhOhJgu1FS6nyw/0zhja2uQIeI
	14ay6AhRfI6ipivNDLMX+hbQoujmmlPP+q2ktgEIBwQ1V/zbNjJujctas1Pa1b0BhD8Rbz9YDXm
	j3mhp6RAIntTQrghTdyDwXoacXyFz8guQcURkZPq1lSA8m5xHbPro6Q5HFUUogaS6P3GXnMN6dm
	SdZ8bDYkoZEbs1GGdbFDXkz0m75kT5j3VkR38Cv3+JN2WlLoxtKUsNll0cYDkHnUexeM43Ju76a
	r+jwX1OuRko96zmoRbSkMRs62o+MvA+EtjQ873q50=
X-Received: by 2002:a17:907:da3:b0:bed:afd6:9e07 with SMTP id a640c23a62f3a-bf370a64028mr736875166b.14.1780922129881;
        Mon, 08 Jun 2026 05:35:29 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e04a89sm862864566b.41.2026.06.08.05.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 05:35:26 -0700 (PDT)
Message-ID: <b122283d-f3a7-4174-8c13-2ae9f6d1e79b@linaro.org>
Date: Mon, 8 Jun 2026 13:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] perf cs-etm: Filter synthesized branch samples
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@linux.dev>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>,
 Paschalis Mpeis <paschalis.mpeis@arm.com>, Amir Ayupov <aaupov@fb.com>
References: <20260526-b4-arm_cs_callchain_support_v1-v6-0-f9f49f53c9dd@arm.com>
 <20260526-b4-arm_cs_callchain_support_v1-v6-6-f9f49f53c9dd@arm.com>
 <fbe0a097-ced7-44c6-ada1-01c3e9c1d7e7@linaro.org>
 <20260608112834.GM101133@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260608112834.GM101133@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_053532_948797_53FC1558 
X-CRM114-Status: GOOD (  25.05  )
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



On 08/06/2026 12:28 pm, Leo Yan wrote:
> On Thu, Jun 04, 2026 at 03:42:32PM +0100, James Clark wrote:
> 
> [...]
> 
>>> @@ -3442,6 +3447,16 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
>>>    		etm->synth_opts.thread_stack = session->itrace_synth_opts->thread_stack;
>>>    	}
>>> +	if (etm->synth_opts.calls)
>>> +		etm->branches_filter |= PERF_IP_FLAG_CALL |
>>> +					PERF_IP_FLAG_TRACE_BEGIN |
>>> +					PERF_IP_FLAG_TRACE_END;
>>> +
>>> +	if (etm->synth_opts.returns)
>>> +		etm->branches_filter |= PERF_IP_FLAG_RETURN |
>>> +					PERF_IP_FLAG_TRACE_BEGIN |
>>> +					PERF_IP_FLAG_TRACE_END;
>>> +
>>
>> This changes the default "perf script" output quite significantly and will
>> possibly break people's workflows. synth_opts.calls is true by default but
>> synth_opts.returns is false so we lose all the returns that we used to have.
>> Not sure if the new behavior is more consistent with other tools so we can
>> justify changing it? Personally I think including returns by default made
>> more sense, and it's a more literal representation of the flow.
> 
> Makes sense. I will add below chunk to enable return events for default
> option:
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index ab3aa76dddb3..bd9eb794cc07 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -3541,6 +3541,14 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
>                                  session->itrace_synth_opts->default_no_sample);
>                  etm->synth_opts.callchain = false;
>                  etm->synth_opts.thread_stack = session->itrace_synth_opts->thread_stack;
> +
> +               /*
> +                * By default, only call events are enabled but no return
> +                * events. Enable return events to better represent the
> +                * execution flow.
> +                */
> +               if (etm->synth_opts.calls)
> +                       etm->synth_opts.returns = true;
>          }
> 
>>
>> itrace.txt says the default is "all events i.e. the same as
>> --itrace=iybxwpe", but I thought the default was branches? At least for
>> Coresight it is, so I'm a bit confused.
> 
> "--itrace=iybxwpe" would be used for "perf report" command, the doc also
> mentions "--itrace=ce" for "perf script" specific.
> 
> Thanks,
> Leo

Ah I missed that. In that case maybe it makes sense to break it and 
treat it as a bug fix. 'c' is quite clearly documented as calls only, 
and the workaround you suggested above makes it impossible to get only 
calls so it makes separate options for call and return a bit useless.


