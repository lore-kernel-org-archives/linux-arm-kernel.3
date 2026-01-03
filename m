Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8D4FC617C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 16:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEJdWzcgO1wWmrKO/GtACSCjJ2V1a5B/5oU/evmLnQc=; b=bMGD5659wSGbzi7lWdrh3nLy6U
	SqhSb2Yrkz+XjJwvr6R1CbYJTzIzNMIr5Pqm+XwRlBfGD5t9uAvR5TZKhtXE/13C5uFE38PIroi3t
	aB97d8wxK9IIanVPhtB93u10h/Wt9odiy7zilZo6OBZyJDDKNpeJk+AsIiCf69bA0tBiRFYaLb4Ao
	A+c/Ok9sp4JLiZdPwfKFl3iqLcJE5INMIGcn98QkHPvwcMV9TVJ9FCFJGtoH3TiTgfFS2Fa57LJyI
	MbO4QMfmkk28Ie7X3vnCSVhIAVtnKCmzH6ZysNM8TF3/Sufm5hISlrL8k0wx9sSIaQnQtyfcC1vIM
	/6PD3PmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc4dx-00000009cd8-2Hjo;
	Sat, 03 Jan 2026 16:38:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc4du-00000009caG-0byy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 16:38:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so83468565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 08:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767458294; x=1768063094; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FEJdWzcgO1wWmrKO/GtACSCjJ2V1a5B/5oU/evmLnQc=;
        b=eKL1fFrY8yAg4dakfjndAj3yFu+EDmSlStObAUmR1xO3JnjIgJcf52Kn21/UoRVJoE
         EXrfPI/Cxh3wnQxMYFpmULbdww2A7huNQ7bBuNj02aqqMyxzFKXRe4QvNf49AePxnTNV
         yiHGlpZajS875bCVYy5Fdse2rKzG1NPTrysjgkJ9eUM9KsSYiMJf5X4kgJitC7Ey4L+X
         0wsArYHn4BUqqeEOGcZd6q6VQQ1993xWfTq6z0uVJ4nr0zWTO65qjrftZvnkug9Bc9/J
         fSB2LqatUNr/bPlXRVwQnyfZ8qPvZZsoLQK6kVgPfva8D3rA8qTnyT+XBpSyPwfcsu1i
         lQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767458294; x=1768063094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FEJdWzcgO1wWmrKO/GtACSCjJ2V1a5B/5oU/evmLnQc=;
        b=J0vrI3YzKPXHLmBVnk54W/27oKH+/67d2TAHbwCvU/ONQEZ8GK3emab9V8otmG1H6D
         PWEVQAvn/wWo4SIkvPKrQN9Kxw+bGaEPGqmS8VKPsyaQCWO8pEoxEiWktK/YTNd8yNuU
         vXxCxvh+I39oE4LQla859/bItT4KdQDtE9XugG+3DDuAY7xrIDYNUkrUE8B9MxGY7i+K
         HUzmYa93gDnxwHOVsextbgVCZB4LhaX29194OOHvWt0vsrHtJjrKV4IP85sIzfxKLcPS
         TJNI3YfLRP8qvCZ2nqdLG9AgNsrWGor6no/ZgUHwObq09pa/GwVAzrSdr9IC8NLKR3hF
         2viQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQmcAKPSZf8KX54CIaK1BaOPFylFKa/yAqwWiTfjekwb/e47RaKywQztkMfecZPK6Hxjj7sGjo/6YZdK44heXO@lists.infradead.org
X-Gm-Message-State: AOJu0YwggkWnFqZIAQuJCzJpLrMjEqgkFFlTeaUrbpjdrClor+sIuWcX
	bAX3p1IpAhsiHjX8b7iQEI0GWFBWbeAoInam2cmDf21zT92AQFO7EQ0Sw133s/Tt9pQ=
X-Gm-Gg: AY/fxX7ptT0qCgeSv4kho1mDs7yKCVEIX23MeYrsEES5VZYOwR6KuLIfqgAiN8smTqB
	wutXx9YBuPnOAKMlLcaNE6x4mn+WImiwsQ9aJPo8h10ZB42zz8toRLOCVl5pqsOAJzYiG9qbazR
	1qqC7o+/JTBfnqqjGoxjXoczZf//j2LTrp/r9tdC1g/IeOqRnknsd+zpEeLRwFA/7AsA5C4VZNE
	MogUPBUUu5uN2q+/5HabzdfrHok5L02fplMCWEitpOqtWqaAYGGdE0OYSSzrbwrxiyIpYOGeF5b
	cReGIDYnx2NSXT3abWyWsl/NEZ4Twv2gwNYQ4nxylqf5Dh6PLkBM3KLNHIlw36zMi+WahPl8zzy
	hLGxVkAN296Sm9e9KTK5JeYJYa0vv+HbmzI9vS0eCwNabyWbm02K4mO45qr1ZwPH3IXYZK4TjbT
	KBVIuzEmxlC1ay82jl
X-Google-Smtp-Source: AGHT+IG4JAdlO0U8i+J5bpIjo4ekwqJRiQzRTsLhZBn+ylFbVsnbcAn7FdWwOfpr/LkRch/vZBHwDw==
X-Received: by 2002:a05:600c:540e:b0:479:2651:3f9c with SMTP id 5b1f17b1804b1-47d1955794dmr485976865e9.14.1767458294378;
        Sat, 03 Jan 2026 08:38:14 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6be5e2eesm19201905e9.5.2026.01.03.08.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jan 2026 08:38:13 -0800 (PST)
Message-ID: <951f10c5-e1ac-45d4-b7ca-56aa32e57cd6@linaro.org>
Date: Sat, 3 Jan 2026 16:38:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf vendor events arm64: Remove uncountable events
To: Ian Rogers <irogers@google.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Akio Kakuno <fj3333bs@aa.jp.fujitsu.com>,
 Yoshihiro Furudera <fj5100bi@fujitsu.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org
References: <20251231-james-perf-uncountable-events-v1-1-f2d9932999fd@linaro.org>
 <CAP-5=fUNJLoy25rS=diSXNR9h-h4m6EFPTy8M+KpTKxm6HtDSA@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fUNJLoy25rS=diSXNR9h-h4m6EFPTy8M+KpTKxm6HtDSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_083818_248496_454C665E 
X-CRM114-Status: GOOD (  21.87  )
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



On 02/01/2026 3:29 pm, Ian Rogers wrote:
> On Wed, Dec 31, 2025 at 4:13 AM James Clark <james.clark@linaro.org> wrote:
>>
>> These events are never countable by the PMU and are only intended to
>> be used as external inputs to trace. Therefore showing them in 'perf
>> list' is misleading so remove them.
> 
> What does "trace" mean in this context?
> 

CPU trace, Either ETE (Embedded Trace Extension) or ETM (Embedded Trace 
Macrocell). You can select PMU events as inputs to the trace block to 
make it do things like start and stop tracing.

> Thanks,
> Ian
> 
>> The generator script doesn't emit these events when used with the new
>> telemetry-solution input files [1].
>>
>> 'perf list' should only show countable events because there are events
>> that are sometimes implemented, sometimes countable and sometimes not,
>> for example TRB_TRIG. If we always include any implemented events
>> whether they are countable or not then it's not possible to tell whether
>> they are usable in perf without going to the docs, defeating the point
>> of 'perf list'.
>>
>> It's also not useful yet to display implemented events that are not
>> countable (for help in using trace rather than perf stat), because
>> PMU_OVFS and PMU_HOVFS are practically always implemented and TRB_TRIG
>> is always implemented when there is TRBE.
>>
>> [1]: https://gitlab.arm.com/telemetry-solution/telemetry-solution/-/tree/main/data/pmu/cpu
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json  |  8 --------
>>   tools/perf/pmu-events/arch/arm64/common-and-microarch.json | 12 ------------
>>   tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json   | 10 ----------
>>   3 files changed, 30 deletions(-)
>>
>> diff --git a/tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json b/tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json
>> deleted file mode 100644
>> index d8b7b9f9e5fa..000000000000
>> --- a/tools/perf/pmu-events/arch/arm64/arm/cortex-a510/pmu.json
>> +++ /dev/null
>> @@ -1,8 +0,0 @@
>> -[
>> -    {
>> -        "ArchStdEvent": "PMU_OVFS"
>> -    },
>> -    {
>> -        "ArchStdEvent": "PMU_HOVFS"
>> -    }
>> -]
>> diff --git a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
>> index 2416d9f8a83d..468cb085d879 100644
>> --- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
>> +++ b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
>> @@ -432,24 +432,12 @@
>>           "EventName": "TRB_WRAP",
>>           "BriefDescription": "Trace buffer current write pointer wrapped"
>>       },
>> -    {
>> -        "PublicDescription": "PMU overflow, counters accessible to EL1 and EL0",
>> -        "EventCode": "0x400D",
>> -        "EventName": "PMU_OVFS",
>> -        "BriefDescription": "PMU overflow, counters accessible to EL1 and EL0"
>> -    },
>>       {
>>           "PublicDescription": "Trace buffer Trigger Event",
>>           "EventCode": "0x400E",
>>           "EventName": "TRB_TRIG",
>>           "BriefDescription": "Trace buffer Trigger Event"
>>       },
>> -    {
>> -        "PublicDescription": "PMU overflow, counters reserved for use by EL2",
>> -        "EventCode": "0x400F",
>> -        "EventName": "PMU_HOVFS",
>> -        "BriefDescription": "PMU overflow, counters reserved for use by EL2"
>> -    },
>>       {
>>           "PublicDescription": "PE Trace Unit external output 0",
>>           "EventCode": "0x4010",
>> diff --git a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json b/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json
>> deleted file mode 100644
>> index 65bd6cdd0dd5..000000000000
>> --- a/tools/perf/pmu-events/arch/arm64/fujitsu/monaka/pmu.json
>> +++ /dev/null
>> @@ -1,10 +0,0 @@
>> -[
>> -    {
>> -        "ArchStdEvent": "PMU_OVFS",
>> -        "BriefDescription": "This event counts the event generated each time one of the condition occurs described in Arm Architecture Reference Manual for A-profile architecture. This event is only for output to the trace unit."
>> -    },
>> -    {
>> -        "ArchStdEvent": "PMU_HOVFS",
>> -        "BriefDescription": "This event counts the event generated each time an event is counted by an event counter <n> and all of the condition occur described in Arm Architecture Reference Manual for A-profile architecture. This event is only for output to the trace unit."
>> -    }
>> -]
>>
>> ---
>> base-commit: cbd41c6d4c26c161a2b0e70ad411d3885ff13507
>> change-id: 20251230-james-perf-uncountable-events-28adfb93b73f
>>
>> Best regards,
>> --
>> James Clark <james.clark@linaro.org>
>>


