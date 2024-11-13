Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0025CD41C33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 11:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpKNnFSJuu8mX4fv2nmuYeZ5VRhQuVqxMggvr0piqwA=; b=a2hkoK06B+jxcHVUQR5l3Y/ONI
	5Y+GdIyIwX+7Ro8syG+WskO9As8hpNpHwM81lX+9HLce7pALFdAgzNx5XAkAODLyoG1K+NKZLIpFN
	W66ahkD9FWuMbSACsj0IZI/5uO0CFog02EvTBNovDtJFC7fTBhfQkC5nqVG9xvo3OhqaOw6Vj8Ku0
	ttFrvXCABilSIQQpPg+yyCvQKbtB+p8Gh94VHECUN+8yvNasMhrnP2273opPnMvLeLQEIsqcxJiYW
	iUQbKWa5qineoUjYuL6CsBkXcikIxVCxYLqGL5L1OKb01U1OOBH897R7f9TTCOko22jJDI0/vcZkf
	edO9I+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBpH-00000006dEE-48W9;
	Wed, 13 Nov 2024 11:46:23 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAp7-00000006Txk-00vX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 10:42:10 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a9e44654ae3so930221266b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 02:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731494527; x=1732099327; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BpKNnFSJuu8mX4fv2nmuYeZ5VRhQuVqxMggvr0piqwA=;
        b=jZ6v8JdQIri9ErDpH+XRnbvKIdsHKp/IvxoORPEPNbryi/JYIQlhJN52I9ixV8LgK0
         XRo6psduf+LegDbGACLwt5oJzIpcG84wcUg6yJY1n6In6wFEK/Vh2SCZa/oZMo0WOvws
         BFKviF0bjksPaNxCCQAuz/7llXRNYmXcvAmQaF3w4ABpj1YP8Al3C3v8+QqCNfBKDwgl
         zFjxpantFGRy3gtvUkSa5anDL9SK2hn/1J1xNmXXs+B71vwHsVVX/3DvRlRh+zG558uQ
         cuxnL3ZLXkgH1xnbLC7XnLwFtbGzC4gANqxVfJ8TyZEPdOq4jFrBj6eckLPlDhwvOcTD
         OC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731494527; x=1732099327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BpKNnFSJuu8mX4fv2nmuYeZ5VRhQuVqxMggvr0piqwA=;
        b=lYVnhxREEByLqcI/h7o3A54xBPcbMCiFciugUdxGT9uKoFvZzqa2M0ciePc49jAbcq
         78ZIQu74AQmxr++YBWOyhdDxmHGchEOiUjk5551j+zRE4sLZchFgNbRedG68VBfVQknx
         21+MYUoJed0KooM2wXdKi8QJXmdgsZZmQ+s72nwEIhO3TQE1BEKvSsr0CAWuwj5XKGeS
         +GEY2Thh5hl+9n4PJcbpvgqfLJq4ScAICUQGpM4QG0B0DzHizp1qsTfdDCzI1JDPjYNC
         TR8OEwZHSVhXnEtdyWw6VqAyjCONosxemf1SVDXLxSgwADQICyD3FyGtLITWq24HfkZ2
         j/Wg==
X-Gm-Message-State: AOJu0YyrePPX0x8preNlrfAX7P47YqrN14R6oZ4y1TktSGyUk0R/sae9
	IaA9JbUCb9B/y2ehZqPt9pgN8NetWkqQTu5nVPX94hheofP/hjMxL+0OFfkHMUwf0hL2v3hQB3T
	/Du0=
X-Google-Smtp-Source: AGHT+IGkvSzEORJMBip4kLqyw4g2XZQP9hZKEvJR8NJ1wbFa9hcYRPzrgSUKiBVjVht7VAmBjdnAUQ==
X-Received: by 2002:a17:907:5ca:b0:a99:ee1c:f62f with SMTP id a640c23a62f3a-aa1f8075b6amr218093766b.34.1731494525232;
        Wed, 13 Nov 2024 02:42:05 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a4a452sm845869366b.51.2024.11.13.02.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 02:42:04 -0800 (PST)
Message-ID: <e81bcabd-11fc-45f7-abfd-05b569b1c18f@linaro.org>
Date: Wed, 13 Nov 2024 10:42:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] [PATCH v4 0/2] perf arm-spe: Add support for SPE
 Data Source packet on AmpereOne
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 Graham Woodward <graham.woodward@arm.com>
References: <20241108202946.16835-1-ilkka@os.amperecomputing.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241108202946.16835-1-ilkka@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_024209_112609_1115D5D0 
X-CRM114-Status: GOOD (  13.48  )
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



On 08/11/2024 8:29 pm, Ilkka Koskinen wrote:
> v1:
> 	* https://lore.kernel.org/all/20241024233035.7979-1-ilkka@os.amperecomputing.com/
> 
> v2:
> 	* Doesn't use read_cpuid_implementor() anymore as that was broken and
> 	  unnecessary.
> 	* Convert AmpereOne source field to matching common source fields to
> 	  avoid duplicating the code.
> 	* Rebased on top of perf-tools-next/perf-tools-next (ba993e5ada1d)
> 	* https://lore.kernel.org/all/20241031213533.11148-1-ilkka@os.amperecomputing.com/
> 
> v3:
> 	* Changed source mapping to simple switch statement
> 	* Dropped is_xyz() stuff
> 	* Added table to map midr to data source decoding function
> 	* https://lore.kernel.org/all/20241106193740.6159-1-ilkka@os.amperecomputing.com/
> 
> v4:
> 	* Split midr/decoding function table
> 	* Made AmpereOne DS decoding function to ignore unknown sources
> 	* https://lore.kernel.org/all/20241108010911.58412-1-ilkka@os.amperecomputing.com/
> 
> v5:
> 	* Moved data_source_handles[] to fix the build issue
> 
> Ilkka Koskinen (2):
>    perf arm-spe: Prepare for adding data source packet implementations
>      for other cores
>    perf arm-spe: Add support for SPE Data Source packet on AmpereOne
> 
>   .../util/arm-spe-decoder/arm-spe-decoder.h    |  9 ++
>   tools/perf/util/arm-spe.c                     | 86 ++++++++++++++++---
>   2 files changed, 83 insertions(+), 12 deletions(-)
> 

Reviewed-by: James Clark <james.clark@linaro.org>



