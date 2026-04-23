Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE74F99351
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 08:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AENNTTd3R/9cLJM0CQS1RbWnKVbNQXFO4xjBrlLHig=; b=fiTnp1RW0Y7lLjfA1qgalafjEx
	ZGIEkCFYxwb+oYp88YsuE1Sp7132YkCo8KIVUSNecWm1QeCA7mni/Wnk8bHNMKoZk/SQ3bJa9VViC
	tNyKRx9z6MDP6HlBp5ELSyluq4JzMlCvXxm5vgF7mxV7iO3ibc41WX92d8TddFUF1bWYlzzm+313+
	xe21eoF22kmwG4GESWYT3ZgzKu5TeLjd2VP/WcJ5xJTR/0Vovg40lnlkP0WR+7aEVOgdWen40qiO8
	P13XL1wXu7niQG7FZpT1mwg733yHLi980742PHo1hkpt9GC45QwRl+Ard5GVdw3omJZOqVjnSin5Q
	SgNa8d8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpRT-0000000BFln-3ao8;
	Thu, 23 Apr 2026 08:29:47 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpRR-0000000BFlQ-3VgS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 08:29:47 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43cfce3a195so3707088f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 01:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776932984; x=1777537784; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5AENNTTd3R/9cLJM0CQS1RbWnKVbNQXFO4xjBrlLHig=;
        b=w1DdWbIXyIsKnh3829smNJXKNFd3hMXOVpbpNrh/EMdTP3ELUs75HacoC48nro96Rh
         RBcA8fDzcvXupbakkzSEfaCr5/dF8Z6beuJbo2v9X1h6GcT8FTYwLAclO2Tyx2oluYxi
         VCd6G/CGNszoVDOaOMoC0zverj+dGucPvSIWIPEbEgyMnwAESEmj4l97SLtSRcwHvI4Q
         THrHCnnEZJvNJha6ZhgR00449b5X46n68LpniTGra7sBMgf5ktXV1QjtDs7KFhmOTSvp
         2PWaaYPLotOuObV7ssRNptYHVaO0Htltpc/bJM4qvyLEqdJMR5uNaFOfI0FvQFPwas/n
         /P/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776932984; x=1777537784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AENNTTd3R/9cLJM0CQS1RbWnKVbNQXFO4xjBrlLHig=;
        b=X2AwNQKCMOYBEjR2aa+yg8rv+HkBzZzyyciIeGTFiFJkf5NTNukp+JZmZg4JVUUE0K
         f+7QdimMCzClBsCl6aceRnb91G4HD08LdxNytd4fmu4TKJh6QkA/sJ9ObCxJ+XvhX4g1
         JpNFNTVvpuknPhrC94UPPwfrlhqYp+dk4OcvY2GxzYrj9NcXRij8fFNV1Z0pKDa+Whzg
         ycHHjEaulI41jIT5lglExk0dUu6likYlyE83l1Bvrx7uTCgYiO53zA2b3i3zs+X/WCjt
         HdnSaUZ2ix4mf6PkoUKzSeplKMP2JGXflkpIo2U+uaL4sGAThd65mVtZUDUMkQRyF6l9
         PHJg==
X-Gm-Message-State: AOJu0YzJMJPqCGYq/3mr81Vj45QLSZMi3A+/+zZbAXL/q/kBluPKx1To
	skl0oSPVqOF8iVtEh3iMGNM0XkvcWWWDn+a5QyQ8/v/bYaU+nu6sdTaajYCzWdlI744=
X-Gm-Gg: AeBDievZxiQOFqgKm+mxbnTC+Hk6anbLbm9CLRqZ+/IR2af+DrKS3KoJ6YHcRMMwrNQ
	CXbQ0UXU/xYFY7zrfxO6d9D7aslQWllJsoSdGHA9HNhrzaYtqGyfkTOYnZO86/i4QgOB0Cd36F+
	mnn2HeaiYxhXz/ncRD/PumPDfm3zacg8DkRt0Ea95ZC97br4haaoRRNbTD1WAjjk+yt34ExXboM
	KmVa5UikoaSYlRhAQrICApio6CfOT7dDCX6QkH73MCmQhYf4VXJk88mv367YqOFmsZgWfZQmMj4
	BQlbvkyeHfuu0WOAeqVmtCFrunguTnWruHYotOQtHKAENCi93QwgNcBPSQZuYsr6naLjpZrPIIi
	q5AoShyXnUtAiU0BkzwHrs8fnmNS7W7FlVPMExMKxSJFmv3QCAaS+TdmdKWTWpOc6H9wH5UuXHg
	mCF+db/9LEBqKRcrvW+ZiA7QHhH/RrlNVbuMpFnebi8ac=
X-Received: by 2002:a05:6000:4287:b0:43f:e7c9:2402 with SMTP id ffacd0b85a97d-43fe7c9254bmr41064062f8f.3.1776932983879;
        Thu, 23 Apr 2026 01:29:43 -0700 (PDT)
Received: from [192.168.178.64] ([84.246.200.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4412e36ff8bsm3135708f8f.26.2026.04.23.01.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 01:29:43 -0700 (PDT)
Message-ID: <5cc2f7b0-852d-4feb-8d47-39aac44e0093@linaro.org>
Date: Thu, 23 Apr 2026 09:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Nirmoy Das <nirmoyd@nvidia.com>, Sean Kelley <skelley@nvidia.com>,
 "will@kernel.org" <will@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>
References: <20260421203856.3539186-1-bwicaksono@nvidia.com>
 <b1458bc3-0449-4f0f-b346-d25547dd4c97@linaro.org>
 <SN7PR12MB722693E924425893F4A62D54A02D2@SN7PR12MB7226.namprd12.prod.outlook.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <SN7PR12MB722693E924425893F4A62D54A02D2@SN7PR12MB7226.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_012945_953915_5DD71DC6 
X-CRM114-Status: GOOD (  30.14  )
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



On 22/04/2026 21:17, Besar Wicaksono wrote:
> 
> 
>> -----Original Message-----
>> From: James Clark <james.clark@linaro.org>
>> Sent: Wednesday, April 22, 2026 5:33 AM
>> To: Besar Wicaksono <bwicaksono@nvidia.com>; will@kernel.org;
>> mark.rutland@arm.com
>> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
>> tegra@vger.kernel.org; Thierry Reding <treding@nvidia.com>; Jon Hunter
>> <jonathanh@nvidia.com>; Vikram Sethi <vsethi@nvidia.com>; Rich Wiley
>> <rwiley@nvidia.com>; Shanker Donthineni <sdonthineni@nvidia.com>; Matt
>> Ochs <mochs@nvidia.com>; Nirmoy Das <nirmoyd@nvidia.com>; Sean Kelley
>> <skelley@nvidia.com>
>> Subject: Re: [PATCH v2] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA
>> Olympus
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 21/04/2026 21:38, Besar Wicaksono wrote:
>>> The PMCCNTR_EL0 in NVIDIA Olympus CPU may increment while
>>> in WFI/WFE, which does not align with counting CPU_CYCLES
>>> on a programmable counter. Add a MIDR range entry and
>>> refuse PMCCNTR_EL0 for cycle events on affected parts so
>>> perf does not mix the two behaviors.
>>>
>>> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
>>> ---
>>>
>>> Changes from v1:
>>>     * add CONFIG_ARM64 check to fix build error found by kernel test robot
>>>     * add explicit include of <asm/cputype.h>
>>> v1: https://lore.kernel.org/linux-arm-kernel/20260406232034.2566133-1-
>> bwicaksono@nvidia.com/
>>>
>>> ---
>>>    drivers/perf/arm_pmuv3.c | 44
>> ++++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 44 insertions(+)
>>>
>>> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
>>> index 8014ff766cff..7c39d0804b9f 100644
>>> --- a/drivers/perf/arm_pmuv3.c
>>> +++ b/drivers/perf/arm_pmuv3.c
>>> @@ -8,6 +8,7 @@
>>>     * This code is based heavily on the ARMv7 perf event code.
>>>     */
>>>
>>> +#include <asm/cputype.h>
>>>    #include <asm/irq_regs.h>
>>>    #include <asm/perf_event.h>
>>>    #include <asm/virt.h>
>>> @@ -978,6 +979,41 @@ static int armv8pmu_get_chain_idx(struct
>> pmu_hw_events *cpuc,
>>>        return -EAGAIN;
>>>    }
>>>
>>> +#ifdef CONFIG_ARM64
>>> +/*
>>> + * List of CPUs that should avoid using PMCCNTR_EL0.
>>> + */
>>> +static struct midr_range armv8pmu_avoid_pmccntr_cpus[] = {
>>> +     /*
>>> +      * The PMCCNTR_EL0 in Olympus CPU may still increment while in
>> WFI/WFE state.
>>> +      * This is an implementation specific behavior and not an erratum.
>>> +      *
>>> +      * From ARM DDI0487 D14.4:
>>> +      *   It is IMPLEMENTATION SPECIFIC whether CPU_CYCLES and PMCCNTR
>> count
>>> +      *   when the PE is in WFI or WFE state, even if the clocks are not stopped.
>>> +      *
>>> +      * From ARM DDI0487 D24.5.2:
>>> +      *   All counters are subject to any changes in clock frequency, including
>>> +      *   clock stopping caused by the WFI and WFE instructions.
>>> +      *   This means that it is CONSTRAINED UNPREDICTABLE whether or not
>>> +      *   PMCCNTR_EL0 continues to increment when clocks are stopped by
>> WFI and
>>> +      *   WFE instructions.
>>> +      */
>>> +     MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
>>> +     {}
>>> +};
>>> +
>>> +static bool armv8pmu_is_in_avoid_pmccntr_cpus(void)
>>> +{
>>> +     return is_midr_in_range_list(armv8pmu_avoid_pmccntr_cpus);
>>> +}
>>> +#else
>>> +static bool armv8pmu_is_in_avoid_pmccntr_cpus(void)
>>> +{
>>> +     return false;
>>> +}
>>> +#endif
>>> +
>>>    static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>>>                                     struct perf_event *event)
>>>    {
>>> @@ -1011,6 +1047,14 @@ static bool armv8pmu_can_use_pmccntr(struct
>> pmu_hw_events *cpuc,
>>>        if (cpu_pmu->has_smt)
>>>                return false;
>>>
>>> +     /*
>>> +      * On some CPUs, PMCCNTR_EL0 does not match the behavior of
>> CPU_CYCLES
>>> +      * programmable counter, so avoid routing cycles through PMCCNTR_EL0
>> to
>>> +      * prevent inconsistency in the results.
>>> +      */
>>> +     if (armv8pmu_is_in_avoid_pmccntr_cpus())
>>> +             return false;
>>> +
>>
>> Hi Besar,
>>
>> This is called from armpmu_event_init() before the event is scheduled on
>> the CPU so I don't think reading the MIDR at this point is safe.
>>
>> When the PMU is probed you probably need to do an SMP call to get the
>> MIDR of CPUs in that PMU's mask and then cache the "avoid pmccntr"
>> result like has_smt. Or even rename has_smt to avoid_pmccntr and combine
>> the two results there.
>>
>> I don't know what will happen if none of those CPUs are online when the
>> PMU is probed though...
>>
> 
> Hi James,
> 
> has_smt, iiuc, is common to all the supported CPUs of the PMU context.
> It is configured based on the first CPU in supported cpu list.
> 
>      pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
> 
> Is it okay to use same approach? Can we assume all CPUs in supported_cpus have same midr?
> 

They should have the same MIDR otherwise it would be misconfigured, or 
at least the PMUs should behave exactly the same way for all CPUs in the 
mask. I think the whole point of separate PMUs is for heterogeneous systems.

As long as all CPUs in that mask behave the same way, then reading the 
MIDR from any CPU in that mask should be ok. We do it that way for SPE 
as well:

   /* Make sure we probe the hardware on a relevant CPU */
   ret = smp_call_function_any(mask,  __arm_spe_pmu_dev_probe, spe_pmu, 1);


> Thanks,
> Besar
> 
> 
> 
> 


