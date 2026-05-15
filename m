Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E97CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 08:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9sH8Q4QjX83trp+YQQ6QbWlIhiR2CnSj4K2FVOvEtA=; b=W7ORhTyhDxlYR3HaHsOP0T4318
	eVWHTdxYsQU+Nd1VcX4BNUPnLTt1aGrgv5hH/WERFgXpKef2WVSvC3c1N5MKuE5xwyxzPmVjOaSeL
	zhlfHM3gPt5heIolETcS5/4Xzt61xYHYAJN+BIVN9Hwm0nBHAJXzHY2RnA7h48BOPDPCLPcSFVFJz
	8ttJee3hF/vXIohWVd1DvR9+2br8+9CPdDlj7s+curWgPPsQyjFn4LWvf0ic1/BrVG+bw84riVVRQ
	NdHxq9TVtC0pNStLd3/4d0sw2KrsnFI498G+U8blPLXT4GifLtTzlNAiMEhVKuC5fNekzt9RSl8W5
	S8yq/pUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnuZ-00000007jgz-0anC;
	Fri, 15 May 2026 08:28:47 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnuW-00000007jgQ-26Mo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 08:28:45 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-45d96d21e82so1046364f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 01:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778833722; x=1779438522; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9sH8Q4QjX83trp+YQQ6QbWlIhiR2CnSj4K2FVOvEtA=;
        b=XhXwo8nDjYEdhdM6y2kQv1F7yBmbQeuUZz4bfPQK0YcaaAvzbpveW8AQXD0vsqkCaS
         4sfEAn/IDqoFvJXborNEfX43wQE9cKbBTjpJG6iKGqVGnJmlSCFQxOOo1eTffcmIp/iu
         3MJRp7Uey3/a7t7La5O62tEf+C/jTwf7vVQdXX8KbhiJANNQMT4f36y2yA8XJguTu6LB
         px2QtuyrH8AsOp6DrY+ASltIypyQVafmtgVSoKX+od6FT9lXeDy+SwktDSgddMPLyfvX
         rQo2KBQTXGWcCFWAlQGXuI/H34rfasY/U11mP9kQ6xmRh3z5NEPd1Es+moInbHORgEG1
         Yp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778833722; x=1779438522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9sH8Q4QjX83trp+YQQ6QbWlIhiR2CnSj4K2FVOvEtA=;
        b=gORoB+V07tnw/jbHLxGrdy7yryzfu9pq29N5pAa1G+ItSJin6XO5CLKlXvair6PYPv
         W7DdvVGL4PxUOfEJnRnbIcex9X0JajnPCBP6e/GbTq+IEnJtsj5w9RhYNpScKYy3tRxf
         mUWw+SyLz52wK6RyweqMhJZP1Fa8c1ZR0QuDA56MXNfetoeG0OWkLBdUJGj0yY9IKhc8
         7gY80BWZYapeN90sALrQi/hQPDfTwCwRKGfrV2tPn2dWna725vesF2alqJq8KkuF+PHK
         5Tf1Z1ABxLITVlqNbrzedJznbtMshph+ePGrkzpGXaZCBb267q3ezT5edT7YnIUzFpm7
         98oQ==
X-Forwarded-Encrypted: i=1; AFNElJ82mVpjxfzZOIPPdHQJji/RAvR6yeDQ3EuYMVoxGWAfz0X4t470PdfU6IKTDTI6bZGpMpDL7oAuK6L9kix2KJzW@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ6X46BEPoaYF28w+5exWwYD9YgGDSVBf/L7lbrlGzKwlHvHLw
	Pcu9h2gjm2gRKs1lUEMwysK6AEZ9e+EJ7ROfYbCBSnGfQunWGU+htbImtDmKgZCAzVo=
X-Gm-Gg: Acq92OEuNX0MtEczw0/Hw/TKuqxSz5ySiOsYGn/ITTTslYoFFB0Bl6cof7/DGgViAXT
	TbAsYs1ttCMo8+GjlrbEkS3iyKPCKOXTgSslAyX6RSOfEhSjc0vsis2KKaASxby/MUhmZVlsxcZ
	Xbnw0SMhjErfewdrbSSIlAbA7BfgU+Md3s7qDmQhJm40VMLrHIhQqh27i7RUsu1ydjIFnxjOw9l
	pjQPPS4mtG4vU4/a0fBsmMXjGv0azrSzlMxjHrSBwEfvjnMhOBkXOLaLcaM8zYLbv2+58T6oc2W
	RyftAxAQMNmSw3YMPDxcrwwJOAYvdYaUOdfi0N8OTzGlYbhuVyNa9JIeLt1sJv6unXK53Ip/X3K
	wTJzHpaZvGX82uMBtWJxvFIm+t0bRyor5Jme+4FsUw6yMkLui0w2N9DQ4kHj0x373sCUow1+YS9
	zpVpK7ugSnXOM/TNmU6bWHf1kgOS/r
X-Received: by 2002:a05:6000:1787:b0:455:fbb:28bb with SMTP id ffacd0b85a97d-45e5c5dd6famr3551750f8f.35.1778833722379;
        Fri, 15 May 2026 01:28:42 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm12770884f8f.21.2026.05.15.01.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:28:41 -0700 (PDT)
Message-ID: <c7a68965-88e5-4808-9a75-d58c4986a3b6@linaro.org>
Date: Fri, 15 May 2026 09:28:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/20] KVM: arm64: Apply dynamic guest counter
 reservations
To: Colton Lewis <coltonlewis@google.com>
Cc: alexandru.elisei@arm.com, pbonzini@redhat.com, corbet@lwn.net,
 linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
 maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kvm@vger.kernel.org
References: <gsntlddlbylw.fsf@coltonlewis-kvm.c.googlers.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <gsntlddlbylw.fsf@coltonlewis-kvm.c.googlers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_012844_627371_9B9F363C 
X-CRM114-Status: GOOD (  23.73  )
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



On 14/05/2026 8:05 pm, Colton Lewis wrote:
> James Clark <james.clark@linaro.org> writes:
> 
>> On 13/05/2026 5:45 pm, Colton Lewis wrote:
>>> James Clark <james.clark@linaro.org> writes:
> 
>>>> On 04/05/2026 10:18 pm, Colton Lewis wrote:
>>>>> Apply dynamic guest counter reservations by checking if the requested
>>>>> guest mask collides with any events the host has scheduled and calling
>>>>> pmu_perf_resched_update() with a hook that updates the mask of
>>>>> available counters in between schedule out and schedule in.
> 
>>>>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>>>>> ---
>>>>>    arch/arm64/kvm/pmu-direct.c  | 69 ++++++++++++++++++++++++++++++++
>>>>> ++++
>>>>>    include/linux/perf/arm_pmu.h |  1 +
>>>>>    2 files changed, 70 insertions(+)
> 
>>>>> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
>>>>> index 2252d3b905db9..14cc419dbafad 100644
>>>>> --- a/arch/arm64/kvm/pmu-direct.c
>>>>> +++ b/arch/arm64/kvm/pmu-direct.c
>>>>> @@ -100,6 +100,73 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
>>>>>        return *host_data_ptr(nr_event_counters);
>>>>>    }
> 
>>>>> +/* Callback to update counter mask between perf scheduling */
>>>>> +static void kvm_pmu_update_mask(struct pmu *pmu, void *data)
>>>>> +{
>>>>> +    struct arm_pmu *arm_pmu = to_arm_pmu(pmu);
>>>>> +    unsigned long *new_mask = data;
>>>>> +
>>>>> +    bitmap_copy(arm_pmu->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * kvm_pmu_set_guest_counters() - Handle dynamic counter reservations
>>>>> + * @cpu_pmu: struct arm_pmu to potentially modify
>>>>> + * @guest_mask: new guest mask for the pmu
>>>>> + *
>>>>> + * Check if guest counters will interfere with current host events 
>>>>> and
>>>>> + * call into perf_pmu_resched_update if a reschedule is required.
>>>>> + */
>>>>> +static void kvm_pmu_set_guest_counters(struct arm_pmu *cpu_pmu, u64
>>>>> guest_mask)
>>>>> +{
>>>>> +    struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
>>>>> +    DECLARE_BITMAP(guest_bitmap, ARMPMU_MAX_HWEVENTS);
>>>>> +    DECLARE_BITMAP(new_mask, ARMPMU_MAX_HWEVENTS);
>>>>> +    bool need_resched = false;
>>>>> +
>>>>> +    bitmap_from_arr64(guest_bitmap, &guest_mask, 
>>>>> ARMPMU_MAX_HWEVENTS);
>>>>> +    bitmap_copy(new_mask, cpu_pmu->hw_cntr_mask, 
>>>>> ARMPMU_MAX_HWEVENTS);
>>>>> +
>>>>> +    if (guest_mask) {
>>>>> +        /* Subtract guest counters from available host mask */
>>>>> +        bitmap_andnot(new_mask, new_mask, guest_bitmap,
>>>>> ARMPMU_MAX_HWEVENTS);
>>>>> +
>>>>> +        /* Did we collide with an active host event? */
>>>>> +        if (bitmap_intersects(cpuc->used_mask, guest_bitmap,
>>>>> ARMPMU_MAX_HWEVENTS)) {
>>>>> +            int idx;
>>>>> +
>>>>> +            need_resched = true;
>>>>> +            cpuc->host_squeezed = true;
>>>>> +
>>>>> +            /* Look for pinned events that are about to be 
>>>>> preempted */
>>>>> +            for_each_set_bit(idx, guest_bitmap, 
>>>>> ARMPMU_MAX_HWEVENTS) {
>>>>> +                if (test_bit(idx, cpuc->used_mask) && cpuc-
>>>>> >events[idx] &&
>>>>> +                    cpuc->events[idx]->attr.pinned) {
>>>>> +                    pr_warn_ratelimited("perf: Pinned host event
>>>>> squeezed out by KVM guest PMU partition\n");
> 
>>>> Hi Colton,
> 
>>>> I get "perf: Pinned host event squeezed out by KVM guest PMU partition"
>>>> even with arm_pmuv3.reserved_host_counters=3 for example. I would have
>>>> expected any non zero value to stop the warning.
> 
>>>> I think armv8pmu_get_single_idx() needs to be changed to allocate from
>>>> the high end host counters first. A more complicated option would be
>>>> checking to see if there are any non-pinned counters in the host
>>>> reserved half when a new pinned counter is opened, then swapping the
>>>> places of the new pinned and existing non-pinned counters so pinned
>>>> always prefer being put into the host half. But it's probably not worth
>>>> doing that.
> 
>>>> James
> 
> 
>>> I agree it makes the most sense to allocate from the top, but I'm happy
>>> the basic idea works.
> 
> 
>> Another thing I forgot to mention is that even with the ratelimited
>> warning, this spams the logs any time the host and guest are both using
>> the PMU and I'm not sure how useful that is.
> 
> I'm sure it does. I'll delete it.
> 

A warn_once might save someone a few hours of debugging, but we probably 
don't need more than that.

>>>>> +                    break;
>>>>> +                }
>>>>> +            }
>>>>> +        }
>>>>> +    } else {
>>>>> +        /*
>>>>> +         * Restoring to hw_cntr_mask.
>>>>> +         * Only resched if we previously squeezed an event.
>>>>> +         */
>>>>> +        if (cpuc->host_squeezed) {
>>>>> +            need_resched = true;
>>>>> +            cpuc->host_squeezed = false;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    if (need_resched) {
>>>>> +        /* Collision: run full perf reschedule */
>>>>> +        perf_pmu_resched_update(&cpu_pmu->pmu, kvm_pmu_update_mask,
>>>>> new_mask);
>>>>> +    } else {
>>>>> +        /* Host was never using guest counters anyway */
>>>>> +        bitmap_copy(cpu_pmu->cntr_mask, new_mask, 
>>>>> ARMPMU_MAX_HWEVENTS);
>>>>> +    }
>>>>> +}
>>>>> +
>>>>>    /**
>>>>>     * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved
>>>>> counters
>>>>>     * @pmu: Pointer to arm_pmu struct
>>>>> @@ -218,6 +285,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
> 
>>>>>        pmu = vcpu->kvm->arch.arm_pmu;
>>>>>        guest_counters = kvm_pmu_guest_counter_mask(pmu);
>>>>> +    kvm_pmu_set_guest_counters(pmu, guest_counters);
>>>>>        kvm_pmu_apply_event_filter(vcpu);
> 
>>>>>        for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
>>>>> @@ -319,5 +387,6 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
>>>>>        val = read_sysreg(pmintenset_el1);
>>>>>        __vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);
> 
>>>>> +    kvm_pmu_set_guest_counters(pmu, 0);
>>>>>        preempt_enable();
>>>>>    }
>>>>> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/ 
>>>>> arm_pmu.h
>>>>> index f7b000bb3eca8..63f88fec5e80f 100644
>>>>> --- a/include/linux/perf/arm_pmu.h
>>>>> +++ b/include/linux/perf/arm_pmu.h
>>>>> @@ -75,6 +75,7 @@ struct pmu_hw_events {
> 
>>>>>        /* Active events requesting branch records */
>>>>>        unsigned int        branch_users;
>>>>> +    bool host_squeezed;
>>>>>    };
> 
>>>>>    enum armpmu_attr_groups {


