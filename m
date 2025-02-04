Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1343DC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 12:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lm1f7OfEgAMnPWwSwXhdT5L0CeflR0dthgCr6GhCV78=; b=YfpbRDupRrpMoQdeu8Ol4aPIlf
	dd7OCpyBCg67j/Qo6yVIQSKatDlDYDWVsKJAdfB9nuDUIvb09ZQohBVKK0BGXDpTRL3blm/6vPalQ
	c43n3aLWy8wOE7KLyZq4dwOGh+6j/2Q7KnD71jTLH2fkl1phfVttAd3ahI5gq3qq/jCs13dU9cNur
	SdnZ8vXgdFOR/4wiyFGWXPEwpNqItnu2SttM/kw15HDO0Q+vRsNXFkRypZT8/jk10DDeuz/5I277W
	20laaFbcyKofqqeHPNGT8uw8CQNpZzcXLK64up/AXYdWHuq8FVKEzjI2SHh6B9AkJJQwPaFKlr03U
	SE0NhypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHhI-00000000Lbo-0Vdj;
	Tue, 04 Feb 2025 12:06:34 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHdt-00000000KUz-0FfV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 12:03:02 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43622267b2eso54919135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 04:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738670579; x=1739275379; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lm1f7OfEgAMnPWwSwXhdT5L0CeflR0dthgCr6GhCV78=;
        b=c0nUbtJkFBsWhVHibg38efzNv42KLGeQhklVOSgaQv0HTqxHSoUGk4dMP0WYbel7R8
         yKOsF/Qfr5yOcqMGIxQl4K1/3psnZftu2JmtwehTID6/Hp0/lq27C/HuvvBAZbTyaxIv
         ncF+jDN18GpSA7u8biqymi+zTchGVLiYi4ycy98zP2papgLlv/rcZ8JS6rkRtLzStJHI
         gQPcMYPxY1XSN/jmMdJccc+ohiowjSbVd7pXoCQ+PZQqROSEL7ccV/9YZlRU1KUaXIFd
         vG4ethAUp+JtCQvZ+6WJU1kK7dR/xkI5ocLuFtO3Yr5DAOhrOY4TW5K8A4+XNgKfin3F
         2kkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738670579; x=1739275379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lm1f7OfEgAMnPWwSwXhdT5L0CeflR0dthgCr6GhCV78=;
        b=pvgs2OA8ZpdqQgFgWVdYjHP/blX2owoFOqAytTsFm4qHVxlyNM63zWAv3ft/4Xbjt0
         yI57uqyZtN9ACCYZ6Ug69A6vUlRLj904DNDe4CwsscFcj53M3eJbG56FcJce+qNc7FMD
         tu1hI2/3mlFA3n6iemlE/u7Y2+RuAcVAbT+MqNPpl0nq5M+lkGNHF+SLQnm6whuIhAa+
         htxr3E6HwfD9a7ZD4ybq4s4vT200gCjZxcUuX4Dgio3+Plj70nVRGslERyUxVelJdtYc
         CloAECm5YaW+6uR74hGqEqamCQMZUmyLzABlw8tz/TJsKg7w/zsCSHNJJWhCvCvAG1jk
         lEMA==
X-Gm-Message-State: AOJu0Ywntij2+NiNwrSxBF9vBrf5qPCCNmV+3j4G7Te9R4haIBWUcJbz
	QEsVaWxFD2caMYDNW3KqoU4xUqiJ5tMU296ike0HFuwrx7ovxSRDThqYuDU/ieM=
X-Gm-Gg: ASbGncuL/whlPo2dZzdfwiDMms2T+6aprd3ZXOykfS4gAsMfBR8HAElVqOoS3viU2De
	SYibUnrESdyjWChPsV90TsnVCVL9RkXDUsgI9zCNiu5TSXq5Zw+7SiArqSd13UNUL7C0iB7eaTU
	Yz04NAzaX6hmBJ3d1lBtVP9sUGIyYMCuCIbB6VyMGLJOW8A4VXVhGdvgS/qp3K0Ps9NK8GwQhQt
	VShfzD5UtQsKsY46EucgPvaKaC2GqJOoKW3RIlIVWAYvUywM84minx7ef69ULT2XJLM6x1f4NL1
	3X2EriCZ85kw9FgvHueGz62w
X-Google-Smtp-Source: AGHT+IFNpmw2gpoiWETBy4Xo67o3V5Wg8UfFAcJzqucXT9kmrVYel/4cPyhmyC5e+MRiOEQe62ehJg==
X-Received: by 2002:a05:600c:cc8:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-438dc3c8367mr214669535e9.13.1738670578541;
        Tue, 04 Feb 2025 04:02:58 -0800 (PST)
Received: from [192.168.68.163] ([145.224.67.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244ecd6sm192272465e9.28.2025.02.04.04.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 04:02:57 -0800 (PST)
Message-ID: <630f630d-241e-45f5-b449-243147fb888b@linaro.org>
Date: Tue, 4 Feb 2025 12:02:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 11/11] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-11-1c1300802385@kernel.org>
 <0415d354-0c44-4fff-b92b-b0f5c9c72b11@linaro.org>
 <CAL_JsqKTNDQn9omG3g=6Rb4Nwt6hG9Gw7-VXL_fjQeEQmmtJQg@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAL_JsqKTNDQn9omG3g=6Rb4Nwt6hG9Gw7-VXL_fjQeEQmmtJQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_040301_115295_67BFB99B 
X-CRM114-Status: GOOD (  56.62  )
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



On 03/02/2025 5:58 pm, Rob Herring wrote:
> On Mon, Feb 3, 2025 at 10:53 AM James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 03/02/2025 12:43 am, Rob Herring (Arm) wrote:
>>> From: Anshuman Khandual <anshuman.khandual@arm.com>
>>>
>>> The ARMv9.2 architecture introduces the optional Branch Record Buffer
>>> Extension (BRBE), which records information about branches as they are
>>> executed into set of branch record registers. BRBE is similar to x86's
>>> Last Branch Record (LBR) and PowerPC's Branch History Rolling Buffer
>>> (BHRB).
>>>
>>> BRBE supports filtering by exception level and can filter just the
>>> source or target address if excluded to avoid leaking privileged
>>> addresses. The h/w filter would be sufficient except when there are
>>> multiple events with disjoint filtering requirements. In this case, BRBE
>>> is configured with a union of all the events' desired branches, and then
>>> the recorded branches are filtered based on each event's filter. For
>>> example, with one event capturing kernel events and another event
>>> capturing user events, BRBE will be configured to capture both kernel
>>> and user branches. When handling event overflow, the branch records have
>>> to be filtered by software to only include kernel or user branch
>>> addresses for that event. In contrast, x86 simply configures LBR using
>>> the last installed event which seems broken.
>>>
>>> The event and branch exception level filtering are separately
>>> controlled. On x86, it is possible to request filtering which is
>>> disjoint (e.g. kernel only event with user only branches). It is also
>>> possible on x86 to configure branch filter such that no branches are
>>> ever recorded (e.g. -j save_type). For BRBE, events with mismatched
>>> exception level filtering or a configuration that will result in no
>>> samples are rejected. This can be relaxed in the future if such a need
>>> arises.
>>>
>>> The handling of KVM guests is similar to the above. On x86, branch
>>> recording is always disabled when a guest is running. However,
>>> requesting branch recording in guests is allowed. The guest events are
>>> recorded, but the resulting branches are all from the host. For BRBE,
>>> branch recording is similarly disabled when guest is running. In
>>> addition, events with branch recording and "exclude_host" set are
>>> rejected. Requiring "exclude_guest" to be set did not work. The default
>>> for the perf tool does set "exclude_guest" if no exception level
>>> options are specified. However, specifying kernel or user defaults to
>>> including both host and guest. In this case, only host branches are
>>> recorded.
>>>
>>> BRBE can support some additional exception, FIQ, and debug branch
>>> types, but they are not supported currently. There's no control in the
>>> perf ABI to enable/disable these branch types, so they could only be
>>> enabled for the 'any' filter which might be undesired or unexpected.
>>> The other architectures don't have any support similar events (at least
>>> with perf). These can be added in the future if there is demand by
>>> adding additional specific filter types.
>>>
>>> BRBE records are invalidated whenever events are reconfigured, a new
>>> task is scheduled in, or after recording is paused (and the records
>>> have been recorded for the event). The architecture allows branch
>>> records to be invalidated by the PE under implementation defined
>>> conditions. It is expected that these conditions are rare.
>>>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> Co-developed-by: Mark Rutland <mark.rutland@arm.com>
>>> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
>>> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>> v19:
>>> - Drop saving of branch records when task scheduled out. (Mark)
>>> - Got rid of added armpmu ops. All BRBE support contained within pmuv3
>>>     code.
>>> - Dropped armpmu.num_branch_records as reg_brbidr has same info.
>>> - Make sched_task() callback actually get called. Enabling requires a
>>>     call to perf_sched_cb_inc().
>>> - Fix freeze on overflow for VHE
>>> - The cycle counter doesn't freeze BRBE on overflow, so avoid assigning
>>>     it when BRBE is enabled.
>>> - Drop all the Arm specific exception branches. Not a clear need for
>>>     them.
>>> - Simplify enable/disable to avoid RMW and document ISBs needed
>>> - Fix handling of branch 'cycles' reading. CC field is
>>>     mantissa/exponent, not an integer.
>>> - Save BRBFCR and BRBCR settings in event->hw.branch_reg.config and
>>>     event->hw.extra_reg.config to avoid recalculating the register value
>>>     each time the event is installed.
>>> - Rework s/w filtering to better match h/w filtering
>>> - Reject events with disjoint event filter and branch filter
>>> - Reject events if exclude_host is set
>>>
>>> v18: https://lore.kernel.org/all/20240613061731.3109448-6-anshuman.khandual@arm.com/
>>> ---
>>>    drivers/perf/Kconfig         |  11 +
>>>    drivers/perf/Makefile        |   1 +
>>>    drivers/perf/arm_brbe.c      | 794 +++++++++++++++++++++++++++++++++++++++++++
>>>    drivers/perf/arm_brbe.h      |  47 +++
>>>    drivers/perf/arm_pmu.c       |  15 +-
>>>    drivers/perf/arm_pmuv3.c     |  87 ++++-
>>>    include/linux/perf/arm_pmu.h |   8 +
>>>    7 files changed, 958 insertions(+), 5 deletions(-)
>>>
>> [...]
>>> +bool brbe_branch_attr_valid(struct perf_event *event)
>>> +{
>>> +     u64 branch_type = event->attr.branch_sample_type;
>>> +
>>> +     /*
>>> +      * Ensure both perf branch filter allowed and exclude
>>> +      * masks are always in sync with the generic perf ABI.
>>> +      */
>>> +     BUILD_BUG_ON(BRBE_PERF_BRANCH_FILTERS != (PERF_SAMPLE_BRANCH_MAX - 1));
>>> +
>>> +     if (branch_type & BRBE_EXCLUDE_BRANCH_FILTERS) {
>>> +             pr_debug_once("requested branch filter not supported 0x%llx\n", branch_type);
>>> +             return false;
>>> +     }
>>> +
>>> +     /* Ensure at least 1 branch type is enabled */
>>> +     if (!(branch_type & BRBE_ALLOWED_BRANCH_TYPES)) {
>>> +             pr_debug_once("no branch type enabled 0x%llx\n", branch_type);
>>> +             return false;
>>> +     }
>>> +
>>> +     /*
>>> +      * No branches are recorded in guests nor nVHE hypervisors, so
>>> +      * excluding the host or both kernel and user is invalid.
>>> +      *
>>> +      * Ideally we'd just require exclude_guest and exclude_hv, but setting
>>> +      * event filters with perf for kernel or user don't set exclude_guest.
>>> +      * So effectively, exclude_guest and exclude_hv are ignored.
>>> +      */
>>> +     if (event->attr.exclude_host || (event->attr.exclude_user && event->attr.exclude_kernel))
>>> +             return false;
>>
>> Is there a reason to do the pr_debugs for the two cases above, but not
>> for the remaining ones? Seems like it should be all or nothing.
> 
> Shrug. Anshuman wrote the pr_debugs. I wrote this part. Honestly, I
> don't know why you'd want them only once if they are gated off by
> debug. I guess since other cases of rejecting events outside this
> function have pr_debug() we should do the same here.
> 
>>> +
>>> +     /*
>>> +      * Require that the event filter and branch filter permissions match.
>>> +      *
>>> +      * The event and branch permissions can only mismatch if the user set
>>> +      * at least one of the privilege branch filters in PERF_SAMPLE_BRANCH_PLM_ALL.
>>> +      * Otherwise, the core will set the branch sample permissions in
>>> +      * perf_copy_attr().
>>> +      */
>>> +     if ((event->attr.exclude_user != !(branch_type & PERF_SAMPLE_BRANCH_USER)) ||
>>> +         (event->attr.exclude_kernel != !(branch_type & PERF_SAMPLE_BRANCH_KERNEL)) ||
>>
>> I don't think this one is right. By default perf_copy_attr() copies the
>> exclude_ settings into the branch settings so this works, but if the
>> user sets any _less_ permissive branch setting this fails. For example:
>>
>>    # perf record -j any,u -- true
>>    Error:
>>    cycles:PH: PMU Hardware or event type doesn't support branch stack
>>    sampling.
>>
>> Here we want the default sampling permissions (exclude_kernel == 0,
>> exclude_user == 0), but only user branch records, which doesn't match.
>> It should be allowed because it doesn't include anything that we're not
>> allowed to see.
> 
> I know it is allowed(on x86), but why would we want that? If you do
> something even more restricted:
> 
> perf record -e cycles:k -j any,u -- true
> 
> That's allowed on x86 and gives you samples with user addresses. But
> all the events happened in the kernel. How does that make any sense?
> 
> I suppose in your example, we could avoid attaching branch stack on
> samples from the kernel. However, given how my example works, I'm
> pretty sure that's not what x86 does.
> 
> There's also combinations that are allowed, but record no samples.
> Though I think that was with guest events. I've gone with reject
> non-sense combinations as much as possible. We can easily remove those
> restrictions later if needed. Changing the behavior later (for the
> same configuration) wouldn't be good.
> 
> 

Rejecting ones that produce no samples is fair enough, but my example 
does produce samples. To answer the question "why would we want that?", 
nothing major, but there are a few small reasons:

  * Perf includes both user and kernel by default, so the shortest
    command to only gather user branches doesn't work (-j any,u)
  * The test already checks for branch stack support like this, so old
    Perf test versions don't work
  * You might only be optimising userspace, but still interested in the
    proportion of time spent or particular place in the kernel
  * Consistency with existing implementations and for people porting
    existing tools to Arm
  * It doesn't cost anything to support it (I think we just
    only check if exclude_* is set rather than !=)
  * Permissions checks should be handled by the core code so that
    they're consistent
  * What's the point of separate branch filters anyway if they always
    have to match the event filter?

Some of these things could be fixed in Perf, but not in older versions. 
Even if we can't think of a real use case now, it doesn't sound like the 
driver should be so restrictive of an option that doesn't do any harm.

>> This also makes the Perf branch test skip because it uses
>> any,save_type,u to see if BRBE exists.
> 
> Yes, I plan to update that if we keep this behavior.
> 
>>> +         (!is_kernel_in_hyp_mode() &&
>>> +          (event->attr.exclude_hv != !(branch_type & PERF_SAMPLE_BRANCH_HV))))
>>> +             return false;
>>> +
>>> +     event->hw.branch_reg.config = branch_type_to_brbfcr(event->attr.branch_sample_type);
>>> +     event->hw.extra_reg.config = branch_type_to_brbcr(event->attr.branch_sample_type);
>>> +
>>> +     return true;
>>> +}
>>> +
>> [...]
>>> +static const int brbe_type_to_perf_type_map[BRBINFx_EL1_TYPE_DEBUG_EXIT + 1][2] = {
>>> +     [BRBINFx_EL1_TYPE_DIRECT_UNCOND] = { PERF_BR_UNCOND, 0 },
>>
>> Does the second field go into 'new_type'? They all seem to be zero so
>> I'm not sure why new_type isn't ignored instead of having it mapped.
> 
> Well, left over from when all the Arm specific types were supported.
> So yeah, that can be simplified.
> 
>>> +     [BRBINFx_EL1_TYPE_INDIRECT] = { PERF_BR_IND, 0 },
>>> +     [BRBINFx_EL1_TYPE_DIRECT_LINK] = { PERF_BR_CALL, 0 },
>>> +     [BRBINFx_EL1_TYPE_INDIRECT_LINK] = { PERF_BR_IND_CALL, 0 },
>>> +     [BRBINFx_EL1_TYPE_RET] = { PERF_BR_RET, 0 },
>>> +     [BRBINFx_EL1_TYPE_DIRECT_COND] = { PERF_BR_COND, 0 },
>>> +     [BRBINFx_EL1_TYPE_CALL] = { PERF_BR_CALL, 0 },
>>> +     [BRBINFx_EL1_TYPE_ERET] = { PERF_BR_ERET, 0 },
>>> +     [BRBINFx_EL1_TYPE_IRQ] = { PERF_BR_IRQ, 0 },
>>
>> How do ones that don't map to anything appear in Perf? For example
>> BRBINFx_EL1_TYPE_TRAP is missing, and the test that was attached to the
>> previous versions fails because it doesn't see the trap that jumps to
>> the kernel, but it does still see the ERET back to userspace:
>>
>>     [unknown]/trap_bench+0x20/-/-/-/0/ERET/-
>>
>> In older versions we'd also have BRBINFx_EL1_TYPE_TRAP mapping to
>> PERF_BR_SYSCALL so you could see it go into the kernel before the return:
>>
>>     trap_bench+0x1C/[unknown]/-/-/-/0/SYSCALL/-
>>     [unknown]/trap_bench+0x20/-/-/-/0/ERET/-
> 
> My read of that was we should see a CALL in this case. Whether SVC
> generates a TRAP or CALL depends on HFGITR_EL2.SVC_EL0 (table D18-2).
> I assumed "SVC due to HFGITR_EL2.SVC_EL0" means when SVC_EL0 is set
> (and set has additional conditions). We have SVC_EL0 cleared, so that
> should be a CALL. Maybe the FVP has this wrong?
> 

The test is doing this rather than a syscall:

   asm("mrs %0, ID_AA64ISAR0_EL1" : "=r" (val));   /* TRAP + ERET */

So I think trap is right. Whether that should be mapped to SYSCALL or 
some other branch type I don't know, but the point is that it's missing now.


