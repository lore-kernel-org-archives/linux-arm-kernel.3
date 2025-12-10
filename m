Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB354D3C523
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 02:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDmj9JJmBP0rG5uJ/PHMrWcB3q12qg0xSbzj/K5K/vo=; b=MkLTd7tQwnNqYwduuUHzYcRzIX
	IA23dmAO2NofTexKNVSIRvpCOxkzHD5ruWj4GSNKbAiphybEMzFIybmqsRiZwd/tTK1zvAMRA+8O3
	WYIjDeqAuSPFG4v4c++yb4VzIyr+J90NWU3sd/mx6Ku/UZ6a0G9ETP0QMNJo/zdXFUX0sAploajce
	0SnnKZUbgqq3p82kWbDZNa75ucR2aoqJXtZVW91JjWoH9+Rssg8CMFiAGMaR3eJ1j0PtD5jl1jLIj
	ZMXwwLJXWh2wdyl/w8S6h18rvaf8/HnXeXeKtrzI1gjwPLyh/jfba2af+SMtA42ELz2r8CWENJgmW
	1AwVBiuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT9rA-0000000F0FE-3WL7;
	Wed, 10 Dec 2025 02:23:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT9r6-0000000F0EK-3NfR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 02:23:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDD36175D;
	Tue,  9 Dec 2025 18:22:52 -0800 (PST)
Received: from [10.164.18.52] (unknown [10.164.18.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7E383F7A6;
	Tue,  9 Dec 2025 18:22:54 -0800 (PST)
Message-ID: <d39d633c-a009-41ba-8546-1137509cf678@arm.com>
Date: Wed, 10 Dec 2025 07:52:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/19] perf: cs-etm: Set watermark for AUX trace
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-19-7da32b076b28@arm.com>
 <c22b084b-3853-405d-8b43-397786af7be9@arm.com>
 <5ebf1743-b01c-4664-961c-9e1e2aa7ffce@linaro.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <5ebf1743-b01c-4664-961c-9e1e2aa7ffce@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_182305_390544_34F3F107 
X-CRM114-Status: GOOD (  20.70  )
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



On 09/12/25 8:24 PM, James Clark wrote:
> 
> 
> On 05/12/2025 4:48 am, Anshuman Khandual wrote:
>> On 01/12/25 4:52 PM, Leo Yan wrote:
>>> The default watermark is half of the total buffer size. In many cases,
>>> the tool can not be notified with sufficient free space, especially when
>>> profiling with small AUX buffer (e.g., 64KiB).
>>
>> Could not smaller AUX buffer be prevented for TRBE instead ?
>>
> 
> It's not really about the size of the buffer but where the wakeup points are. With only two wakeup points (middle and end) once you pass the first one you are immediately into the last chance end section.
> 
> Now the driver is writing into the end section, but Perf is still reading from the first one. Once the end one fills up, you end up with no space left without Perf having a chance to say it's finished reading.

Understood.

> 
> To guarantee free space, there needs to be at least one additional section as a buffer zone. Ideally we'd set the wakeup point at thirds so there were fewer wakeups and still have one free section, but it might not always divide by 3, so 4 is also fine.
> 
> The commit message could probably explain it a bit better though.

Agreed, the commit message should explain this problem in detail. Otherwise it appeared
as if the buffer sizing alone is impacting the perf records collection.

> 
> The reason this is different now is because we want to be able to enable wrap mode as much as possible. If you imagine the scenario where a half way watermark is hit, you can't enable wrap mode without wrapping into Perf's part of the buffer (the beginning) as it's all that's left after the second half.

Got it.

> 
>>>> Setting watermark to quarter of the buffer to notifies the tool to read
>>> data earlier and prevents the data loss.
>>>
>>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>>> ---
>>>   tools/perf/arch/arm/util/cs-etm.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
>>> index ea891d12f8f40beebf8dee1d3db71cad701f5666..649b8b0d0f92b4af45fb97db9da3c5ccf24a978b 100644
>>> --- a/tools/perf/arch/arm/util/cs-etm.c
>>> +++ b/tools/perf/arch/arm/util/cs-etm.c
>>> @@ -424,6 +424,13 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
>>>           pr_debug2("%s snapshot size: %zu\n", CORESIGHT_ETM_PMU_NAME,
>>>                 opts->auxtrace_snapshot_size);
>>>   +    if (!opts->auxtrace_snapshot_mode && !opts->auxtrace_sample_mode) {
>>> +        size_t aw = opts->auxtrace_mmap_pages * (size_t)page_size / 4;
>>> +        u32 aux_watermark = aw > UINT_MAX ? UINT_MAX : aw;
>>> +
>>> +        cs_etm_evsel->core.attr.aux_watermark = aux_watermark;
>>> +    }
>>> +
>>>       /*
>>>        * To obtain the auxtrace buffer file descriptor, the auxtrace
>>>        * event must come first.
>>>
>>
> 


