Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F566C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 15:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TVboDbTS95QyZTgZm/sSOHGaAKi+IOHygPp3tuwMR8=; b=TTU/DOQKWLgiDqozI1zh8/G7xT
	Cu873FtdtF52yi3uSIK68YPp5kzJ12LTzNRp11irA22tOUydHg6aS3YGeY54GV6vAAkx7eo9IfdP9
	tByYluivh85eyVChe+1U8g2olsTyPniYvQCOIW1Sl+w8OQe3Bw470LVjJ3Fiw/7srxoxIRfibDlxH
	1HoTrFu4IEe3YRUC+4u/uRyqpwVGFaf1eP6F183+E1/fqbQu4xtgIqpUJBKhAb6NO/ku3iPnUJBUF
	UM3+X6iX7jPP+DJcAbR7OkfgjkgnmzPSTSpprZy2YTeioELKMxrwl01XC8/O1coWOFAOMCjSQjQIU
	tlbbRTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tklyn-0000000DXug-2EH5;
	Wed, 19 Feb 2025 15:27:17 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tklxH-0000000DXEs-24RU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 15:25:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43984e9cc90so6174395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 07:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739978742; x=1740583542; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2TVboDbTS95QyZTgZm/sSOHGaAKi+IOHygPp3tuwMR8=;
        b=Hf9328gM/N46UECBLWACbWhyHLzcOvzrqJ9bvc7FJuhNbewfYElfOL0z63pdObz5rF
         9vxfC5jBWBT30D6FckEpDZQatFAdceJ0WUOLlxS6irgNmX6rCsLjZZNyT64pwwBEs3sH
         QyGWw7CCGcZnstasaFrlLpYSEgO/Fnp/8kowR19NJNOfJ4DMxFRe/XMJY4CEbHtx05/6
         rm9JZM+I8BBN/Yht9He4hQK5YCzbe2dg73qMUyXglRGjAjTEYQoM3IQW5NncUCGzLPls
         9jC6eoOngs8i6KDegEwh7pmWfLxeUhPyp+fb03ahVyNH8wsV96aBMgGUeHsGpgRcEEFU
         CvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739978742; x=1740583542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2TVboDbTS95QyZTgZm/sSOHGaAKi+IOHygPp3tuwMR8=;
        b=P7Ge4dUctCOKPYVsImMdj8tgrjY+97Z+uvRfK/Mj1zQUgJzcd63ButwgDAjvutGTF7
         1U20PEvHSn3bWAI2DaaRUWjPkexjyOM146es+ksRzj2RqQew4zApm4E3sVB+ZU1d5zBh
         DHpGhERU6uE7RiNxtl0+Oip2VkfTUSxzYf1YKKcaBEYdk1ldBdRbkBWN4l8Q9lzgr7JI
         mCiFG921oe6DaNSabGnUdUqKWIB9aSO9uVSy0HxGj1GhoawWfTxlhHLxY9Uyl5xhc7N5
         UNhTcTQ6n2pVsPjGMi0K91Tk7+UMwIP1ZBUagsgQILt341LJWZG2oXn5Gro5iYM6iMqn
         D0KA==
X-Forwarded-Encrypted: i=1; AJvYcCWBMeepIoAxezA0QJN4sIbjjuQWvZlAnmC1UptiU83ZqxUoNUj7mGbsJn/8fgZ+M6tjLnwLrL/WFIdxa8GYDzjj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7LtoOAM4zZyx9vmXOcfQzH154VYpgoOGUj9NcrYa66zfxP/F4
	d6Q3urHXqLfAf2M0dS+57qS/a4nWxhKNyWSzg6HU2z2IJFM8o+9Gfv8iQaYjoEg=
X-Gm-Gg: ASbGnctNFWZbp5tx+xAIjLVcMc12lBvd39Sk8g2cQVe16WOXsCiJ+cKcDQ23UUN97QI
	P771DSdGgFhIy2cVHHfAvFAL+uMpYlfT3SWAgUTYiGNWDpAegTZA0DId4+3sDspg7OclvbPC4om
	m+qVKWZBZ0IA7rKQpQmQrieoxD5xwJo76aj0gBLAUUyIgKlATm+6S2U0G5+OikxrTJOOxeFq6ug
	WndO8qof2XNZH8/To4hkZ78Cq2uX+D8QE7nrjJsXNK4o5+/ECvYziv77ePFM/hfazTR4GcjRToP
	RQMAr3A0vS2P3wKGVwF/Vsx15g==
X-Google-Smtp-Source: AGHT+IHUdFK1lvkIKfQXed2a/KYhYlsDONXCYFg5p0+CqyAxqO1bS9PwbNrEGNiXbD3YDFKA1AvLhw==
X-Received: by 2002:a5d:5f49:0:b0:38f:2b52:f059 with SMTP id ffacd0b85a97d-38f57d95940mr3673454f8f.27.1739978741585;
        Wed, 19 Feb 2025 07:25:41 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ccd51sm18138198f8f.29.2025.02.19.07.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 07:25:41 -0800 (PST)
Message-ID: <2834c9d7-f401-4b29-8f92-22193eb9ce31@linaro.org>
Date: Wed, 19 Feb 2025 15:25:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] perf vendor events arm64: Add A720/A520
 events/metrics
To: Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>
Cc: Yangyu Chen <cyy@cyyself.name>, linux-perf-users@vger.kernel.org,
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fWXmNoFLyWv+vo7hhLSqTDy7hf+-huKRD9OUWnO-GESRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_072543_536482_698AA2CB 
X-CRM114-Status: GOOD (  34.26  )
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



On 18/02/2025 10:33 pm, Ian Rogers wrote:
> On Tue, Feb 18, 2025 at 2:19 PM Namhyung Kim <namhyung@kernel.org> wrote:
>>
>> On Tue, Feb 18, 2025 at 09:30:23AM +0000, James Clark wrote:
>>>
>>>
>>> On 18/02/2025 12:41 am, Ian Rogers wrote:
>>>> On Fri, Feb 14, 2025 at 2:02 AM James Clark <james.clark@linaro.org> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 14/02/2025 5:49 am, Yangyu Chen wrote:
>>>>>>
>>>>>>
>>>>>>> On 14 Feb 2025, at 09:12, Namhyung Kim <namhyung@kernel.org> wrote:
>>>>>>>
>>>>>>> Hello,
>>>>>>>
>>>>>>> On Thu, Feb 13, 2025 at 11:11:01PM +0800, Yangyu Chen wrote:
>>>>>>>> This patchset adds the perf JSON files for the Cortex-A720 and Cortex-A520
>>>>>>>> processors. Some events have been tested on Raxda Orion 6 with Cix P1 SoC
>>>>>>>> (8xA720 + 4xA520) running mainline Kernel with ACPI mode.
>>>>>>>
>>>>>>> I'm curious how the name of PMUs look like.  It is cortex_a720 (or a520)?
>>>>>>
>>>>>> The name of PMUs comes from Arm's documentation. I have included these
>>>>>> links in each patch.
>>>>>>
>>>>>>> I remember there's a logic to check the length of hex digits at the end.
>>>>>>>
>>>>>>
>>>>>> Could you provide more details about this?
>>>>>>
>>>>>>> Ian, are you ok with this?
>>>>>>>
>>>>>
>>>>> I think they wouldn't be merged because they're core PMUs, so should be
>>>>> fine? Even though they would otherwise be merged because they're more
>>>>> than 3 hex digits.
>>>>
>>>> Do we know the PMU names? If they are cortex_a520 and cortex_a720 then
>>>
>>> It will be "armv9_cortex_a720" from this line:
>>>
>>>    PMUV3_INIT_SIMPLE(armv9_cortex_a720)
>>
>> I see, thanks!
>>
>>>
>>>> this comment at least reads a little stale:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/util/pmus.c?h=perf-tools-next#n76
>>>> ```
>>>> /*
>>>> * There is a '_{num}' suffix. For decimal suffixes any length
>>>> * will do, for hexadecimal ensure more than 2 hex digits so
>>>> * that S390's cpum_cf PMU doesn't match.
>>>> */
>>>> ```
>>>> James is right that core PMUs aren't put on the same list as uncore/other PMUs.
>>
>> Ok, then I guess we're good.
> 
> I think you may be able to do things that look odd, like today the
> "i915" PMU can be called just "i", I think the a520/a720 naming will
> allow "armv9_cortex/cycles/" as an event name, then open it on two
> PMUs if they are present. 

I assumed that was the intended behavior. It seems fairly useful to be 
able to open on ones with common prefixes.

> We may only show one PMU in perf list as
> that code I think assumes they're the same PMU as they only differ by
> suffix:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/util/pmus.c?h=perf-tools-next#n384

Yeah that is the case. I didn't realise it when looking at the previous 
fixes to keep the suffixes in perf stat output.

> I can imagine aggregation possibly being broken, but I think that
> works off the number of PMUs not the names of the PMUs, so it should
> be okay. Probably the only thing broken that matter is perf list when
> you have a BIG.little system with a520 and a720, this may be broken
> with say a a53 and a72 today as both of those suffix lengths are >2,
> but maybe they use the "armv8._pmuv3_0", "armv8._pmuv3_1", etc. naming
> convention. I suspect the >2 here:

Also the case for a53 and a72 right now. Even "perf list --unit 
armv8_cortex_a57" doesn't work because we deduplicate before filtering. 
Adding -v fixes it though because that disables deduplication. Perhaps 
we can change it to disable it with the --unit argument?

> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/util/pmus.c?h=perf-tools-next#n80
> would still work and be correct if it were >4. If that changes then
> this will also need to change:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/Documentation/ABI/testing/sysfs-bus-event_source-devices?h=perf-tools-next#n12

That could be an easy fix. If >4 is enough to still get rid of all the 
uncore duplicates I can make the change?

> 
> Thanks,
> Ian
> 
>>
>> Thanks,
>> Namhyung
>>


