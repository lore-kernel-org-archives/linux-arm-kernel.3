Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E64C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9HUjuvS0qbMkBXP42R+8x2GNjJS6p1fMH+ZmxGUJ7g=; b=rif0S3ft6MYGY3h2IVHeX8Umqi
	oZO9bUORrdxLt3+cxkjzeJGJIF4PaOzp/GkcVPzbjtfFZaG2qbDrUUuBh4H2PiVrSjr24gfIyeW9v
	LfOOJy5rvQzYz2kXL0vaz38L1RqreFZVSxYoaXyP13pghFAnUMP9Ayre3jRiU4XvwDMEFZ4B3BMEK
	kXYhMXVczY5a/EqqiayPPOj67c20MsBOkTVRn3qZJeu09ESWRFUW5jIFvBlsi8G8YdIBZlj42E739
	8JyInaeNi1MtgrpluQQ8F1ODovs6U8bzsWcZgP4pfC3eXOUE+FL4h9zIv8hX95Mg73bC59xM54bOP
	w6BkvoJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7r5-00000001P09-18UZ;
	Thu, 20 Feb 2025 14:48:47 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7g5-00000001Ly9-1Rxj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 14:37:26 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38f403edb4eso581320f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 06:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740062243; x=1740667043; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K9HUjuvS0qbMkBXP42R+8x2GNjJS6p1fMH+ZmxGUJ7g=;
        b=ZwYsjoXXOXrlnAbYOgI3EZDP0qMgES/Ln7ghPXPK9LUfNvxcknh6SyVaqG4s5HrWca
         7eoLhfpq+yj6oihhfHy4oRbtBk0mfjztJwgm9EvxhZ6b+GOb5BPodTRNtnq65Z9G/0kT
         bWFeYqMF5RVqBIm4S5y54qAHENy5W8ZAfkEw5fcgQyODFtTx+KMNJpRQDMhQY1v35zdm
         2z/sD5Z8lg9Cd0eNcZPAFT0qKF32yPPS/8hiq0sKLgDAa2nqFLsBgECx9r6Y3iQEyYaC
         xoEjfsvW5V91tG9sbwiB5QdZN0i639clP2/5r7oxblXlCEC1WSL/TTwoXHs7VdFTtj3A
         IOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740062243; x=1740667043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K9HUjuvS0qbMkBXP42R+8x2GNjJS6p1fMH+ZmxGUJ7g=;
        b=G9XvtkBkEAZ/6zs3LycVOi+PT0+bxlsM50cy54m4E996L8trXJPClPMpNNt9o6pd9B
         VeqG//eWTNLUFQO4brO3VyjWftKyA+dS/gGNRrKZGII65g7mc8qmfllRYTPMEj1Lji/P
         y9nZWMw37JB5FSnr3ebeNm3X+XeE3WDuaYnJfifLiQnr6CDVAVqrmUefunImbJ/Keqm6
         2Hg1gNHhsI12ApQ34e9Zvafv6Ip5iVImq5v8bK/juZ/yfHHp8f/JAoWT3XX7V2/vWozY
         npRW+DgMzDCejk5ajTKsX9e0CS/viMZ6APC/X3Z6ZnqdHDsYUsqQ5OG4JL7C10HhMLTS
         NOQA==
X-Forwarded-Encrypted: i=1; AJvYcCVHVZCrpmsPQBTwXzTSwXTl631uw7sSkTGMjT+YGM1vjMaEdyQwUZWxb0UmKnosMVw6Y45fLYi/T8YYdDOVki31@lists.infradead.org
X-Gm-Message-State: AOJu0YyjaBe2VirOpC9Ci13G+ZbCOZZpX35TT3RqsS41Ag+Yxln7VY/3
	jZ7QRviMVCmQi4Uylvq8x9/l8uZBSXcIMs6rLdzDRTiVP3xZcNv//fPPq2d5ksM=
X-Gm-Gg: ASbGncvtQnJItGCJvy4VFcbX066aiLhDETn+7fqLh0hCtw05fj6l+aESxQ6JPaoMF7J
	jn3cA16gwXesThXil/SmKjCqPGRdN9pqzzaVlhJTaaRKsgbt4clBDS01mRfuOx9FXN4cAQoftCA
	qk2KvzInUR8epVQw3ImdKl/bQCzDrvu20kGpXOX9WKutxQ3OecSBSU6HcjVyegavIyeqjwDjtwT
	54+kqC1JHPGxA5OFcgTIpe4Cs+f4c9S+3PP1IRGRLHO79gBxAKjjKYOdNoa19AUrA0ELglsWLno
	qV0MsUEGk71WLQV6ARSjq309ug==
X-Google-Smtp-Source: AGHT+IG4/tsIyjrhWQ2f7/l6PUHnt4yI3yRHElMiAEjZoOcEi2BaOaUdkOVnBjz6wi5f+ZTsWTsGtg==
X-Received: by 2002:a05:6000:1541:b0:38f:3b9b:6f91 with SMTP id ffacd0b85a97d-38f3b9b7389mr15460928f8f.12.1740062243451;
        Thu, 20 Feb 2025 06:37:23 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5b40sm21059070f8f.68.2025.02.20.06.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 06:37:22 -0800 (PST)
Message-ID: <a498f6ea-abee-4b5a-b426-40aa60a15fc8@linaro.org>
Date: Thu, 20 Feb 2025 14:37:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] perf vendor events arm64: Add A720/A520
 events/metrics
To: Yangyu Chen <cyy@cyyself.name>, Ian Rogers <irogers@google.com>
Cc: Namhyung Kim <namhyung@kernel.org>, linux-perf-users@vger.kernel.org,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Liang Kan <kan.liang@linux.intel.com>,
 Yoshihiro Furudera <fj5100bi@fujitsu.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <tencent_5360DA048EE5B8CF3104213F8D037C698208@qq.com>
 <Z66YjGvjD_yzEHUg@google.com>
 <tencent_45B4E91CA370C563D6420A1A25F992056D09@qq.com>
 <1b8b234f-6435-45cf-83e7-8e86c84f075f@linaro.org>
 <CAP-5=fVAhLLH-a0_wLo8dPoMLOb6rOJiTgGh-OFZJJoaLFE-8Q@mail.gmail.com>
 <fe46069e-c52e-45ee-b4b3-8b929fb83b31@linaro.org>
 <Z7UHieRRnvRb5_oU@google.com>
 <CAP-5=fWXmNoFLyWv+vo7hhLSqTDy7hf+-huKRD9OUWnO-GESRw@mail.gmail.com>
 <tencent_EDA4AFD185EF51104EDBCEB109D720862B05@qq.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <tencent_EDA4AFD185EF51104EDBCEB109D720862B05@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_063725_404689_47C1F452 
X-CRM114-Status: GOOD (  32.81  )
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



On 20/02/2025 3:33 am, Yangyu Chen wrote:
> 
> 
>> On 19 Feb 2025, at 06:33, Ian Rogers <irogers@google.com> wrote:
>>
>> On Tue, Feb 18, 2025 at 2:19 PM Namhyung Kim <namhyung@kernel.org <mailto:namhyung@kernel.org>> wrote:
>>>
>>> On Tue, Feb 18, 2025 at 09:30:23AM +0000, James Clark wrote:
>>>>
>>>>
>>>> On 18/02/2025 12:41 am, Ian Rogers wrote:
>>>>> On Fri, Feb 14, 2025 at 2:02 AM James Clark <james.clark@linaro.org> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 14/02/2025 5:49 am, Yangyu Chen wrote:
>>>>>>>
>>>>>>>
>>>>>>>> On 14 Feb 2025, at 09:12, Namhyung Kim <namhyung@kernel.org> wrote:
>>>>>>>>
>>>>>>>> Hello,
>>>>>>>>
>>>>>>>> On Thu, Feb 13, 2025 at 11:11:01PM +0800, Yangyu Chen wrote:
>>>>>>>>> This patchset adds the perf JSON files for the Cortex-A720 and Cortex-A520
>>>>>>>>> processors. Some events have been tested on Raxda Orion 6 with Cix P1 SoC
>>>>>>>>> (8xA720 + 4xA520) running mainline Kernel with ACPI mode.
>>>>>>>>
>>>>>>>> I'm curious how the name of PMUs look like.  It is cortex_a720 (or a520)?
>>>>>>>
>>>>>>> The name of PMUs comes from Arm's documentation. I have included these
>>>>>>> links in each patch.
>>>>>>>
>>>>>>>> I remember there's a logic to check the length of hex digits at the end.
>>>>>>>>
>>>>>>>
>>>>>>> Could you provide more details about this?
>>>>>>>
>>>>>>>> Ian, are you ok with this?
>>>>>>>>
>>>>>>
>>>>>> I think they wouldn't be merged because they're core PMUs, so should be
>>>>>> fine? Even though they would otherwise be merged because they're more
>>>>>> than 3 hex digits.
>>>>>
>>>>> Do we know the PMU names? If they are cortex_a520 and cortex_a720 then
>>>>
>>>> It will be "armv9_cortex_a720" from this line:
>>>>
>>>>   PMUV3_INIT_SIMPLE(armv9_cortex_a720)
>>>
>>> I see, thanks!
>>>
>>>>
>>>>> this comment at least reads a little stale:
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/util/pmus.c?h=perf-tools-next#n76
>>>>> ```
>>>>> /*
>>>>> * There is a '_{num}' suffix. For decimal suffixes any length
>>>>> * will do, for hexadecimal ensure more than 2 hex digits so
>>>>> * that S390's cpum_cf PMU doesn't match.
>>>>> */
>>>>> ```
>>>>> James is right that core PMUs aren't put on the same list as uncore/other PMUs.
>>>
>>> Ok, then I guess we're good.
>>
>> I think you may be able to do things that look odd, like today the
>> "i915" PMU can be called just "i", I think the a520/a720 naming will
>> allow "armv9_cortex/cycles/" as an event name, then open it on two
>> PMUs if they are present. We may only show one PMU in perf list as
>> that code I think assumes they're the same PMU as they only differ by
>> suffix:
>> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/util/pmus.c?h=perf-tools-next#n384
>> I can imagine aggregation possibly being broken, but I think that
>> works off the number of PMUs not the names of the PMUs, so it should
>> be okay. Probably the only thing broken that matter is perf list when
>> you have a BIG.little system with a520 and a720, this may be broken
>> with say a a53 and a72 today as both of those suffix lengths are >2,
>> but maybe they use the "armv8._pmuv3_0", "armv8._pmuv3_1", etc. naming
>> convention. I suspect the >2 here:
>> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/util/pmus.c?h=perf-tools-next#n80
>> would still work and be correct if it were >4. If that changes then
>> this will also need to change:
>> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/Documentation/ABI/testing/sysfs-bus-event_source-devices?h=perf-tools-next#n12
>>
>> Thanks,
>> Ian
>>
> 
> On my system, the names of PMUs are `armv8_pmuv3_0` and
> `armv8_pmuv3_1`:
> 
> ```
> $ ls /sys/bus/event_source/devices/
> armv8_pmuv3_0  armv8_pmuv3_1  breakpoint  kprobe  software  tracepoint  uprobe
> ```
> 
> I searched for ACPI DSDT on my platform, but there's no mention of
> a720 or a520. I haven't delved into the PMU kernel driver yet.

Ah yeah, with ACPI you get those names instead.

> 
> Additionally, there's a more significant problem for aarch64
> BIG.little platforms when two or more types of cores don't have the
> same PMUs. The perf list can only display the core PMUs on core0
> unless we use the PERF_CPUID env to override it. This is because
> perf will only probe the first MIDR here:
> https://github.com/torvalds/linux/blob/87a132e73910e8689902aed7f2fc229d6908383b/tools/perf/arch/arm64/util/header.c#L60
> 
> However, I think this doesn't block this patch for adding events and metrics?
> 
> 
> Thanks,
> Yangyu Chen
> 

I don't think that's an issue because events are listed per PMU rather 
than per CPU and that MIDR function does take a CPU struct. From my 
testing the only thing stopping all PMUs from being listed was the 
numeric suffix de-duplication.

Either way, no, it shouldn't affect your patch. But I'm also looking 
into Ian's suggestion to improve it anyway.

>>>
>>> Thanks,
>>> Namhyung
> 
> 


