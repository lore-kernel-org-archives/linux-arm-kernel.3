Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7CECA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePoRKVjqV7PHpfS0OClfbnUSDKUm6s/VziiFV4/sSfk=; b=FOQS8j3js7z01yGRim6MvwSbp5
	p0qfYJvQOHTirgyQTPYamnFXI9WX9L9UoESN20dnVIbRD/z+mvO5fW2ke8LKglWO2OdWM/YqdSOPW
	aVobzkzf9lOT3Tj0xQKuAoky950Gu1bSHEuiXgNTgMRb408/4t3GOdkKmqUGE58VJ9SpqtUZj7zKr
	vTYC32KRWgjYN3UWDt6IuWksrZM11X+C+3C0pWe3jJJSd0+r1wEFSyew6dXd6arRS59wUQ5/06l5b
	BX1sbnlKkNFxcqBDTE0vLirjxCJxcUq86kv0iGGe/aY/312jUzTU73yhR2RvZURNMT6ymlJcTIYc4
	tLMdrbXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulriR-0000000BIKm-1bxD;
	Tue, 12 Aug 2025 16:19:11 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulmHm-0000000AVsg-0gkT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 10:31:19 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b77b8750acso3263648f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 03:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754994676; x=1755599476; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePoRKVjqV7PHpfS0OClfbnUSDKUm6s/VziiFV4/sSfk=;
        b=MT9qwo1h2AuZaeWxAABnzrgNYJjJwPHdjDhqjtXSpffDWsT6du2bhZfmgr84OOxHaG
         0x49M01Oed/YgPKJcbDHQKDrnCzo4nzQ2wLNORP2Jx8DDdntF/ssuVdD1ia6Y+bcHQMx
         0KPELmaVHg9HvaxIRL6pKobm2q8Bl71EgfvA74SqX13AVAt0JAGdtGZouwN0ISZ9+430
         uFQrFbxSYRi7VmHylqSpX7ce/ZL9rLluBZc+m9+Sh31Gg7sh+oAsw6J8iFY89v6gQF9c
         Erl7XIhSIROuFdO1RjZAM92j0wXodLUnzmV2rDYH2BhDJqCGHvNjwdhWxJK9PT+/X9g1
         1EDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754994676; x=1755599476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePoRKVjqV7PHpfS0OClfbnUSDKUm6s/VziiFV4/sSfk=;
        b=WQj8EcMUjTQBhu1L18GhfcA/p90yk1SKNifz1pwDv/5CBSYszBew1kPAHuqUKdTl1d
         JMV2xb0zOxO5G4EBNWzIsB+3G50/3QpOW7jvFVxfTUnoVVim1Khm/Ida8pqxpugo/nhU
         HzmTGuNdPHrlzr6L2TzAqLIJuIAjY9R5J05fOWc/y7yo/Gj7rzz7xQ4So2ohEvoT+GDc
         jFJR0VYOTTpIQmemLonwwoWYopyQpvfcLRK/NHOsCRAtmX9vogsZPWqMI67zMiKV3T6A
         HA9wYfEVNoRgV6zK5BERvEteRjxoq2bbtOIRk8C45WAwNBlka3i3SOu6a3DGrhBTmWVI
         bu6A==
X-Forwarded-Encrypted: i=1; AJvYcCWKXPz7YJeH1mXH/sgk574dTfsZtylAkfWVFOlPkwUYYw3+9S62kHbHoD8ROS5Hk7Oq791m0ANleCy0X1aphWSB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3IcgECqDzx5kqWLnUwZzZ8Oh01wzrIUgcB5/X9x0weqFKCCwW
	RaQ8CAP/x7PvaExFtIAVMSnY+nx9VqEIGdVaM4Ua2bYQ7D/WRo95tYqGOcJYnetyRd0=
X-Gm-Gg: ASbGnctoniK+jGls1yFm032/5tVr9l2dKm4usZ6UPIs9cg8L5zjRQLKHi8mf3e8dO9C
	1EytK5uhNgJQJViZkVMCXliv97v/2dV6U80rpwx2RbucREDomTyJbDhWmVqMj2bDjv8Q4kfJlPe
	eDeSqkqITmGx1GdSv4PVzZLvF6W1uLr73g5CweI6oysQbWqYMIPqk0xtZ3kg6nahJWzSlNEQW1Y
	92locsZFSgWH9Tv+dJidssac5Mzkun3e+/fwj+A8DVZLueIBxwq+diBDIUZUw4PkjfFECDBQoHw
	Xg7oftvgo0MsJp9PNRjss1X8nWPLEAMuyeLivk+zfVLswxE0aHhzXOpwvuDr/AOzx0i3D4qgJ4f
	5z3bWE5vt46KKfYYtCAFQrB3ul/M=
X-Google-Smtp-Source: AGHT+IFk461rjqf9Sy5Ozfd0nKQpirAwscVYxWE8T/XoLyB3vjQ8Z2+jonu7inhQXB+ew7K8DjrJNw==
X-Received: by 2002:a5d:5f53:0:b0:3b8:de54:6e64 with SMTP id ffacd0b85a97d-3b9111b5fb8mr2505460f8f.26.1754994676141;
        Tue, 12 Aug 2025 03:31:16 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0b2d2fasm33199647f8f.50.2025.08.12.03.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 03:31:15 -0700 (PDT)
Message-ID: <647299e8-26e4-4b6c-b655-a072a3c8ee72@linaro.org>
Date: Tue, 12 Aug 2025 11:31:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
To: Yicong Yang <yangyicong@huawei.com>, will@kernel.org,
 mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org
Cc: yangyicong@hisilicon.com, robh@kernel.org, anshuman.khandual@arm.com,
 jonathan.cameron@huawei.com, hejunhao3@huawei.com, linuxarm@huawei.com,
 prime.zeng@hisilicon.com, xuwei5@huawei.com, wangyushan12@huawei.com
References: <20250812080830.20796-1-yangyicong@huawei.com>
 <20250812080830.20796-3-yangyicong@huawei.com>
 <3d37844a-63c5-49c2-9d6d-7c3665a95466@linaro.org>
 <931e26ef-bdc6-5f9e-8976-d5a4b8e6e81f@huawei.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <931e26ef-bdc6-5f9e-8976-d5a4b8e6e81f@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_033118_211668_90D75A61 
X-CRM114-Status: GOOD (  26.78  )
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



On 12/08/2025 11:14 am, Yicong Yang wrote:
> On 2025/8/12 18:00, James Clark wrote:
>>
>>
>> On 12/08/2025 9:08 am, Yicong Yang wrote:
>>> From: Yicong Yang <yangyicong@hisilicon.com>
>>>
>>> CPU_CYCLES is expected to count the logical CPU (PE) clock. Currently it's
>>> preferred to use PMCCNTR_EL0 for counting CPU_CYCLES, but it'll count
>>> processor clock rather than the PE clock (ARM DDI0487 L.b D13.1.3) if
>>> one of the SMT siblings is not idle on a multi-threaded implementation.
>>> So don't use it on SMT cores.
>>>
>>> When counting cycles on SMT CPU 2-3 and CPU 3 is idle, without this
>>> patch we'll get:
>>> [root@client1 tmp]# perf stat -e cycles -A -C 2-3 -- stress-ng -c 1
>>> --taskset 2 --timeout 1
>>> [...]
>>>    Performance counter stats for 'CPU(s) 2-3':
>>>
>>> CPU2           2880457316      cycles
>>> CPU3           2880459810      cycles
>>>          1.254688470 seconds time elapsed
>>>
>>> With this patch the idle state of CPU3 is observed as expected:
>>> [root@client1 ~]#  perf stat -e cycles -A -C 2-3 -- stress-ng -c 1
>>> --taskset 2 --timeout 1
>>> [...]
>>>    Performance counter stats for 'CPU(s) 2-3':
>>>
>>> CPU2           2558580492      cycles
>>> CPU3               305749      cycles
>>>          1.113626410 seconds time elapsed
>>>
>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>>> ---
>>>    drivers/perf/arm_pmuv3.c | 9 +++++++++
>>>    1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
>>> index 95c899d07df5..ed3149632b71 100644
>>> --- a/drivers/perf/arm_pmuv3.c
>>> +++ b/drivers/perf/arm_pmuv3.c
>>> @@ -1002,6 +1002,15 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>>>        if (has_branch_stack(event))
>>>            return false;
>>>    +    /*
>>> +     * The PMCCNTR_EL0 increments from the processor clock rather than
>>> +     * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
>>> +     * counting on a WFI PE if one of its SMT silbing is not idle on a
>>> +     * multi-threaded implementation. So don't use it on SMT cores.
>>> +     */
>>> +    if (cpumask_weight(topology_sibling_cpumask(smp_processor_id())) > 1)
>>> +        return false;
>>> +
>>
>> Isn't this something that's static to the PMU? If all CPUs in each PMU are always the same then this doesn't need to be probed every time and can be set once.
>>
> we can make use of PMCCNTR_EL0 if the SMT is runtime disabled, e.g. by /sys/devices/system/cpu/smt/control
> if set this at probe time then we permanently lose the chance to use PMCCNTR_EL0.
> 

Is that a valuable usecase though? I don't actually know the answer to 
this. How common is disabling SMT on SMT cores and then also using PMU 
events in a way that you would miss having the extra cycles counter, 
despite not minding that you didn't have it when SMT was enabled?

And would it correctly handle enabling and disabling SMT after the event 
has already started? Feels like it wouldn't if you start the event with 
it disabled and it puts it onto PMCCNTR_EL0 then you enable it and the 
counts become wrong again.

> 
>> Also you can't call smp_processor_id() from here because this is also called in armpmu_event_init() -> __hw_perf_event_init() -> validate_group() before the event is actually scheduled on a CPU. With CONFIG_DEBUG_PREEMPT you'd see the error.
> 
> ok, will use raw_smp_processor_id() instead. it won't affect the validation checking in pmu::event_init().
> in pmu::add() the cpu id is always stable so it'll also be fine.
> 
> Thanks.
> 
> 

That feels a bit wrong but I suppose it will work. Maybe the real 
problem is that validation is doing too much. I know it's to re-use 
code, but then we're doing things as part of the validation that don't 
make sense. That can confuse the reader or it's just wasted effort. Also 
using raw removes the safety check which might mean it gets refactored 
into somewhere were it isn't valid to call it in the future.




