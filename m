Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF9DE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 10:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9u8s/FXYIijQ9RtDony/lgbfJqNEodPUwkBuIae3j3U=; b=ECRlNPEpTOQhn1fskVylVAOkCn
	tfLcoI63GYK6eQlDCh4S0g5KDb3a+jqEM31JmMQB7AzQhtz3YvBfYKrcYh6bk/5/JuqfiZMlHwMzN
	djnMXhfcBW1Wb6zPlsV6n5kWc7OfKjHADw0DCpyGvYP6/3kGZDg/CIb6Ut0Icm18KQTEG57Td5R6F
	oToYiCCKwNtptdYduQ+FiAUuaVmgDWox0IRXkaLED6YnUsRcysUQYpVbIurr6D7OIexV6CopBHtKI
	vohblwCxgwmI4SvsVDph16OkN46hBwIzJl9PGNUUhXmsb7WRer2oT95t98/wmqC9BQkJLKLUTajxi
	hdv52ujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tODVv-00000001Vfk-0I7l;
	Thu, 19 Dec 2024 10:12:15 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tODUl-00000001VZV-1Q6N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 10:11:07 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso3908075e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 02:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734603061; x=1735207861; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9u8s/FXYIijQ9RtDony/lgbfJqNEodPUwkBuIae3j3U=;
        b=IxNh+zZhYG4hTAQU/dU6sfAQEWyuiWmz6gLb+usI4epfLeDGtcD8S0Onf6y0b04Nio
         q+usY5qAikGlrfHnphFgmehpZIJ0NjydcF8h7EC6bUoQq4BOowxij/vRWghHv1ciBmDD
         hQf+wG8ah23LU+aWx5sA4SmBr2kGDQPQtMO4iOIPTIr+XMzWZC5tNPiRQ0+F4sZLu76y
         J18Upvsr6vK0k60SW05JUaX4hh5l4Vvr8wOSxXj4EfSUvOqmIF6cMr79s3/1ZgAgQ3dX
         YPbXB3tJY25SGcSubzYUjLVAw7gC8WbpT8dGp55iq+eL6GJgqRf2mfY50c+2JF288Y9e
         nCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734603061; x=1735207861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9u8s/FXYIijQ9RtDony/lgbfJqNEodPUwkBuIae3j3U=;
        b=V6s0WECy6G6hSVGMuDZeqlQmtxL8Xcvf1DBSM0dnbd5pcXvfo6KEUjYRqCQm9sdv0Y
         0quRZAEWY9+2ykz+/LTSgOwGJr7g1slwDNm6E4renKcNNCsMK/zx/85mLPq02NM87PB4
         lcbq3t8UuhzCowBgsF8AiJfIuLvBsafaHNT/hQN9kVgWeaRKalf3/UbAnevLR5s1+L5X
         smAIgIDPPEODRT8qcwc88wVx4dZ+05dfJo8LT2LhSOWX7ok0BT1AUd9bbl2NC9EdMeC8
         427Wm+ddlO4NVnAgQAk15GZwG+b2y8536tmDGnmx7s07OV1vBW13e2etPiDMygG1jF/5
         u0eg==
X-Gm-Message-State: AOJu0YyFMzHnWdTY6C0ZUsXGGfp3vhSa1RgLPhOCEsG6JFNRRY5QJf2K
	lKSGDPwYDdvUDegPMzGg8hgpluPwuU3+euEepiC7Fo80JUcBImpNIskOPX13gtA=
X-Gm-Gg: ASbGncskpSFkVYPttOivhE56fyBPJsKEkZLJ3G/b7QRkl30THrdAakUgfY3lOxluQed
	VswG3EWL5ZkdDxjRvfUInfypiqrGa9EFeh27uZsReR3Cp0lZdWiD4trCg9UJNtQSpoN5nG6KVnN
	oTr8f1ET2YAE/ImTDhCmaYqUXpB7MYMNTeLcGRJQnzNWvqX/C372YbSDsdF/ygGA0mlxRXWkDD1
	ePaKydLlt97k1/iYne9QukBXLRzzXkIk4wIOhxfinYE2JuoPH5/LMrVbFFch8le9f8=
X-Google-Smtp-Source: AGHT+IHleph6k9/mQwCrpZsyxPVz/5yDa2XHM6jxz3peZNrApOtdEHBZH0tR130iLzOcT4cQ/NPTfg==
X-Received: by 2002:a05:600c:1c97:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-4365c7c8344mr21521065e9.21.1734603061157;
        Thu, 19 Dec 2024 02:11:01 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4364b14f241sm68213505e9.1.2024.12.19.02.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 02:11:00 -0800 (PST)
Message-ID: <4f0bcc19-807c-40b0-a30c-309ba775693b@linaro.org>
Date: Thu, 19 Dec 2024 10:10:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] perf docs: arm_spe: Document new discard mode
To: Ian Rogers <irogers@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 John Garry <john.g.garry@oracle.com>, Mike Leach <mike.leach@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Graham Woodward <graham.woodward@arm.com>,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org
References: <20241217115610.371755-1-james.clark@linaro.org>
 <20241217115610.371755-6-james.clark@linaro.org>
 <CAP-5=fU7RNzvzxBcAQy3RT9Ge3YtqPhDonupNWS7Wgb8HGQkGg@mail.gmail.com>
 <8c15786c-47b6-47ff-b1dc-ecbf32d582fb@linaro.org>
 <CAP-5=fXV6LXrUtvgRKuyurmu5SoSZLTf6MN=+BBXkqv7drvOjg@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fXV6LXrUtvgRKuyurmu5SoSZLTf6MN=+BBXkqv7drvOjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_021103_407976_908433CE 
X-CRM114-Status: GOOD (  32.96  )
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



On 18/12/2024 7:47 pm, Ian Rogers wrote:
> On Wed, Dec 18, 2024 at 2:07 AM James Clark <james.clark@linaro.org> wrote:
>>
>> On 18/12/2024 12:54 am, Ian Rogers wrote:
>>> On Tue, Dec 17, 2024 at 3:56 AM James Clark <james.clark@linaro.org> wrote:
>>>>
>>>> Document the flag, hint what it's used for and give an example with
>>>> other useful options to get minimal output.
>>>>
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>> ---
>>>>    tools/perf/Documentation/perf-arm-spe.txt | 11 +++++++++++
>>>>    1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/tools/perf/Documentation/perf-arm-spe.txt b/tools/perf/Documentation/perf-arm-spe.txt
>>>> index de2b0b479249..588eead438bc 100644
>>>> --- a/tools/perf/Documentation/perf-arm-spe.txt
>>>> +++ b/tools/perf/Documentation/perf-arm-spe.txt
>>>> @@ -150,6 +150,7 @@ arm_spe/load_filter=1,min_latency=10/'
>>>>      pct_enable=1        - collect physical timestamp instead of virtual timestamp (PMSCR.PCT) - requires privilege
>>>>      store_filter=1      - collect stores only (PMSFCR.ST)
>>>>      ts_enable=1         - enable timestamping with value of generic timer (PMSCR.TS)
>>>> +  discard=1           - enable SPE PMU events but don't collect sample data - see 'Discard mode' (PMBLIMITR.FM = DISCARD)
>>>>
>>>>    +++*+++ Latency is the total latency from the point at which sampling started on that instruction, rather
>>>>    than only the execution latency.
>>>> @@ -220,6 +221,16 @@ Common errors
>>>>
>>>>       Increase sampling interval (see above)
>>>>
>>>> +Discard mode
>>>> +~~~~~~~~~~~~
>>>> +
>>>> +SPE PMU events can be used without the overhead of collecting sample data if
>>>> +discard mode is supported (optional from Armv8.6). First run a system wide SPE
>>>> +session (or on the core of interest) using options to minimize output. Then run
>>>> +perf stat:
>>>> +
>>>> +  perf record -e arm_spe/discard/ -a -N -B --no-bpf-event -o - > /dev/null &
>>>> +  perf stat -e SAMPLE_FEED_LD
>>>
>>> Perhaps clarify this should be an ARM SPE event? It seems strange to
>>> have one perf command affect a later one, the purpose of things like
>>> event multiplexing is to hide the hardware limits. I'd prefer if the
>>> last bit was like:
>>> ```
>>> Then run perf stat with an SPE event on the same PMU:
>>>
>>> perf record -e arm_spe/discard/ -a -N -B --no-bpf-event -o - > /dev/null &
>>> perf stat -e arm_spe/SAMPLE_FEED_LD/
>>> ``
>>>
>>> Thanks,
>>> Ian
>>
>> Hi Ian,
>>
>> Confusingly this isn't an SPE event, it is a normal PMU event. The fact
>> that one Perf command affects the other is because these events only
>> count when SPE is enabled. When it's enabled it has an effect on a
>> per-core level which is why in the example I made it simpler by enabling
>> SPE system wide.
>>
>> SPE is an exclusive PMU like Coresight and some others so it can't be
>> affected by multiplexing or anything like that. The SAMPLE_FEED_LD PMU
>> would be, but as long as SPE stays enabled it will count the right thing
>> regardless of multiplexing.
> 
> Thanks James, sorry for my SPE ignorance. I'm smiling about the use of
> the word exclusive. When I was trying to make the tests run in
> parallel I used a file lock - so shared and exclusive. There were a
> lot of issues with that, hence switching to 2 phases in the test,
> parallel then sequential but I kept the "exclusive" tag for want of a
> better word. Perhaps the notion of an exclusive PMU existed previously

Yeah, see PERF_PMU_CAP_EXCLUSIVE. Hopefully it doesn't cause too much 
confusion, the context of test vs PMU should make it clear.

> but maybe I've accidentally invented the term by way of a failed file
> lock experiment :-)
> 
> Presumably the two PMUs side-effecting each other is a known thing. I
> wonder if we can capture this in the documentation. When you say
> "normal PMU event" you mean core PMU events?
> 
> Thanks,
> Ian

It should be a known thing yes, discard mode doesn't change this 
behavior anyway but just makes one use case of it better. I can add 
another section to this SPE manpage about it in a v2, that's probably 
the best place for it.

And yes, I meant core PMU event. I can clarify that the second example 
command is for a core PMU to avoid any doubt.

Thanks
James


