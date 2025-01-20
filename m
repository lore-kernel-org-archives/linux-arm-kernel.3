Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208B4C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 10:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYfPY3uHWPDRjBBvUAyHNjZ+LPl2Pcpq4JSbzBPDOM8=; b=vksIMh6w5FhnRmUG7xhNaRwPfk
	77PsVVrabCocYn6MZancouLu+YX8DULb7midGAawy/RvTzg/K0KeXkSWKZT+s2lMUq0EB0reXvVC3
	N4wzr9lAtdWtM2Bx3GpvzSBryy518KJ8Tlne2D4noRzENJ036lq74+2hcdKZSX0E0exL6N60f/rWl
	0aIWSb4rHZypRzFCNZuv8wpkeKip3wAdpD+NLgOUVZPByaEbfZxpf3DRVUg+ELB6mZngZwCYADQg6
	lDG51TBO27dNgTxk1YgDuSfvZyoc1FqcwTrCBQCEDtNEVpmnNVSx6UrURlPTttzOqa0WeE76Ce0xH
	FfV4LHqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZood-00000005Jl7-0RcE;
	Mon, 20 Jan 2025 10:15:31 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZonK-00000005JU2-1NkC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 10:14:11 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385eed29d17so2304621f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 02:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737368048; x=1737972848; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYfPY3uHWPDRjBBvUAyHNjZ+LPl2Pcpq4JSbzBPDOM8=;
        b=OIr3ny6JoA/9HT4hpLUlGUTxsE4cR1/tsFvrkK9sXq35r7vVwsv904x2rDMLiFbGNs
         ltKav+C8xSfI/cKwWa//5TcYLbIwySeXWkzcoVJJfrnPYjKcLaMsOuDbCRv65xp3vz7E
         5/iCPgo/0RTwPNwa3CkiEExTAmO86soB36XZhvkAsK2wjqsuSyKFxe8JRsKG8bfdgAYg
         ZodaSh2SKgzniJ8wpmfanL7dYVietviXEbfp0po25nRHBkpq3GOGkjfQDxoKghO3RT/g
         kFL04rcZWhPmluzIlKy/sZq3lCKp9ZuiA2/TOjQLQuPzvwTXA28cQ5T9z1fIUNJHFOWK
         KI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737368048; x=1737972848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYfPY3uHWPDRjBBvUAyHNjZ+LPl2Pcpq4JSbzBPDOM8=;
        b=chIrMHrCL68LWyBwCiB+3pUqsxH3ShvzxZYJBAoBu9SCzT3ki1CUFRD3K5E6CF68Dn
         GIhLsOMoWTUM4bnRJivBYZaqhmaXIR1E2x6t4w4+NM6M/xlWRQEeyX3bflfFJk6nyMGR
         fYzNts9U0bPJuQqobPDztx9sxBu7EdM7uGdYAIuOTYKoqYCcLZEttFLZCYyORJ6GUFRZ
         o3rAt3YqTLiVLABMDO2Ts6Kkb04v6qvTWf4EGIakYp74xwc/p4hE8qIpXLBZurKV4sjS
         fbyBnKnOuEprCJd3WFCK21QtV4KIsQVz9Fho+1DgvNCTzQRy7DfLK/PoP+opxZhFl2aN
         DI0g==
X-Forwarded-Encrypted: i=1; AJvYcCWM+oO/DAsCrWpg7ThKcK/O7nntMRg2FvMel8v/JxDCPemWoJRh/Q44SnALORmQZu5vcGpoo9MwJHE7Ec/ikdFh@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq2+5vJWGM1U3VxrhmAbpOKiDXAsH+td0xCxFyY/0k9QHZeikk
	0xe6YA65VQ115v+PTcjkcao9rhZSeHJDl6lVsvAMSGnU7MS6NMclAoHzmsEzzY0=
X-Gm-Gg: ASbGnctD2i0Z+IsfBmgCmIYVOboovx3MO3j6mT7NynbqQ0qlKhpA4yqAnHQspT4yYW2
	ntEIcCOiAbO4CmcXuPsEc3yPrjRDeVXnyNALrW/deIbL9kYVo9WNNFqtJKBhJ6DbO8JodshmnRr
	j92ME/s96shdkD1xxYHrjzBEYt0+nl0TflFQVPBIxcWjPj7nI5UDaUx84RC9AlZlZbieYvErkQf
	PTJ5YH2ZH3hlsmC/ya/oRBMKKyoXb7kuntUKnUTqHEQLOchsvNYyAGlBf7LdGslJqzbBXxFyHUK
	m1w3
X-Google-Smtp-Source: AGHT+IE7vzlr91GTWyVQ2uFuiGjH2pXvFzm6Et3XtZumjCMhoeA+okGxgS/WDqvFvtDygaCrq/tOqQ==
X-Received: by 2002:a5d:6c63:0:b0:385:fdc2:1808 with SMTP id ffacd0b85a97d-38bf57a65b6mr12761968f8f.40.1737368047070;
        Mon, 20 Jan 2025 02:14:07 -0800 (PST)
Received: from [192.168.68.163] ([212.105.145.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3275755sm9797579f8f.80.2025.01.20.02.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 02:14:06 -0800 (PST)
Message-ID: <1db0c4db-5e63-46f3-9bb9-898cb8312aae@linaro.org>
Date: Mon, 20 Jan 2025 10:14:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] perf vendor events arm64: Add N3 events/metrics
To: Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Nick Forrington <nick.forrington@arm.com>
References: <20250110172006.680753-1-irogers@google.com>
 <da5792c3-8f53-4be8-8f53-e1cf6660feab@linaro.org>
 <CAP-5=fXyVtZChi1fkochiyKw6AztdhEE_rfpJUsz_P9po5bhXA@mail.gmail.com>
 <d0ebae42-99b6-42be-beaa-947160da3b88@linaro.org>
 <Z4vxZj2YzfwU-m46@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <Z4vxZj2YzfwU-m46@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_021410_371889_4249A446 
X-CRM114-Status: GOOD (  26.13  )
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



On 18/01/2025 6:22 pm, Namhyung Kim wrote:
> Hello,
> 
> On Mon, Jan 13, 2025 at 04:48:06PM +0000, James Clark wrote:
>>
>>
>> On 13/01/2025 3:51 pm, Ian Rogers wrote:
>>> On Mon, Jan 13, 2025 at 4:35 AM James Clark <james.clark@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On 10/01/2025 5:20 pm, Ian Rogers wrote:
>>>>> Using the scripts at:
>>>>> https://gitlab.arm.com/telemetry-solution/telemetry-solution/
>>>>>
>>>>> Generate perf json for neoverse-n3 using the following command:
>>>>> ```
>>>>> $ telemetry-solution/tools/perf_json_generator/generate.py \
>>>>>      tools/perf/ --telemetry-files \
>>>>>      telemetry-solution/data/pmu/cpu/neoverse/neoverse-n3.json:neoverse-n3
>>>>> ```
>>>>>
>>>>> Signed-off-by: Ian Rogers <irogers@google.com>
>>>>> ---
>>>>>     .../arm64/arm/neoverse-n3/core-imp-def.json   | 930 ++++++++++++++++++
>>>>
>>>> I assume you got warnings about missing groups, if one is missing that
>>>> results in everything being dumped in core-imp-def.json. I have an
>>>> internal ticket open about it which is why I didn't post N3 and V3 jsons
>>>> yet, I'll check on it again.
>>>
>>> I was testing with JEVENTS_ARCH=all. I'm not sure what the group
>>> warning is, do you have a link?
>>>
>>
>>  From the perf_json_generator:
>>
>>   $ telemetry-solution/tools/perf_json_generator/generate.py \
>>     tools/perf/ --telemetry-files \
>>     telemetry-solution/data/pmu/cpu/neoverse/neoverse-n3.json:neoverse-n3
>>
>>   Warning: Not writing events which do not have a group (note that the
>>   mnemonic printed may differ to the one in the source json if it differs
>>   in the common Perf files):
>>
>>   IMP_CT_FLUSH: Counts flushes including architectural,
>>   microarchitectural, and branch redirects.
>>   ...
>>
>>>> Up to you whether you want to continue with it like this and I can send
>>>> a fix up later but there's also a conflict with the recent Fujitsu
>>>> Monaka events.
>>>
>>> I'm happy to let you push the updates. An alternative, that may work
>>> around the group issue, is just to push the event updates. Any chance
>>> on an ETA?
>>>
>>> Thanks,
>>> Ian
>>
>> Can't say on an eta. There was a fix already done but not made live yet, but
>> now it turns out maybe we don't want to put these particular events into
>> Perf because they're not in the TRM. Could be several weeks before anything
>> goes live.
>>
>> It's a bit of a hack but I can regenerate them without these particular
>> events in a V2, and then whatever the outcome is from above will be an
>> incremental change later.
>   
> So what's the final decision?
> 
> James, do you want to publish the metrics later at once or are you ok
> with this patch for now (and do the incremental change later)?
> 
> Thanks,
> Namhyung
> 

I'm just finishing off some changes to the generator script and the 
change will end up a bit different. Turns out it wasn't updating the 
common events properly either.

I think it's best to leave this one out and I'll send a v2 this week.



