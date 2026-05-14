Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392A7CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zJBoYCXvN5LO7DBit1Ku7VesIuEtdWFZWxNt6CCQH0=; b=T3nnxm1UupRcf/AKxv/Bet+EBm
	BTjdllgD8KLDKlBXtEg0qiIK98jCtTsiEU5r7LVd6qs29FhzF+zcTOZRB+QySbxekmF5YPVQ/U1UF
	6blYGCGGnyRDGlP3jNOIA7HJi0ka3kyVzIrFmDQ7XK5RDPK++XUUeeIPnkB3YGrqEJVmgGrqyBD1d
	jnPUAv+oG0UuYtDjIMhTSqPYen0XlI8dRP8hjiNBOhTNlDPXCymk+KW7dsizecL6L5NOgFJnPicCO
	pmmJkZUT+OHoN9Sa1jhXyANyTdNUDYMjHMiU7l9X2Yrh4+p/hIj2NURCyV0LjHdJhBwunExJAxSxQ
	w8QJ25CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNS52-0000000512O-3xJZ;
	Thu, 14 May 2026 09:10:08 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNS50-0000000511l-1GE6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:10:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48909558b3aso75089945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 02:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778749804; x=1779354604; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/zJBoYCXvN5LO7DBit1Ku7VesIuEtdWFZWxNt6CCQH0=;
        b=xxZNKmCpvw9IV00VzmeHAQJK+AmI4bEdu6/UqHKTIivhSg9VqoAeJlsuRTBmRumkPc
         fcZg6e/oKvu7kaoPOZ9Un1lPD5EdaO0ktasxKbEaWeqMWJ616l9IB4BXuVbZ2SNDIy1c
         inURf7dIMVMWj/LmjkezwYS8ysmy6cUPGhNYbdQf4Zf9jvZTw9wlnRSxTVt4uxS6XBC+
         IsPbFLvSzg0OuBfRjib8cEU5ffUzgsZt/ZGm1QmrDONuK/8pXcae47IZ+JrcM7N1WK3W
         3CwqBy70VbBJZ+uKAcXCRXnH4gLan4N66FhHirL89f4xeHeNACnzTi9zIr4JBsxy9Am0
         onaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778749804; x=1779354604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zJBoYCXvN5LO7DBit1Ku7VesIuEtdWFZWxNt6CCQH0=;
        b=Kb4kE7uHD9xUgkzG7ebMav3netF3JX/wyiSZuXxXvCZEfiPhlzAqx2Zs+n57/3gO1t
         P+a0MfcthO73sc1qxUPZdGKLl4Fk1lm73lHDqYKc+8aMuob1shlqVL2c4GCpZyF9zX73
         qK0ju3DCVswo/uOiBZ0UYjKgHku/wcSy3ycJQRaI58ks8nshxLOb7IuWfSXr6Pu221c1
         bpzMWlnfYLDzpNtgWWHDrNo2PfzdFmQm9e8d1FJLC5nyrdQSWZBT3yG+rYD8b+eBWVLU
         sJucVDeEliBu0/U82KV4Qhmc/FgzdHJQtIR+dKdA6uUcTChYJsIsah+ybgIc8pgHi8x3
         9aaw==
X-Forwarded-Encrypted: i=1; AFNElJ8LZwuIojv5WHmY8wCgIczua7Km1IF9YCbOXUOAJAW3XkCTh14G2I9Kp82F3ZSShE7LcDkC6S5QEVEz1G8VtEI4@lists.infradead.org
X-Gm-Message-State: AOJu0YzA8s2g0nfgpn+Hro5UVkx4gaoheUBrVgsQlMiVOM2PtGAY+Dfq
	YyAjK4c96Fyb+xEWB/wAPWutWiSqbhehLmSORDEPM1yWhfiHJX8KC+zeXinzIjynXrI=
X-Gm-Gg: Acq92OFWp8k7/8A8EwLdzhWzi8zNTh4M/dZ2hHXXtMQGVbmcIC5cQB5uWyRSwkUWlR5
	lwZiOEEzTAkp12p0MvthtyNt6xVi+/esbeIej0EzxV1vfdbflaT7GUpnW4hIHE13eCIVTqYKEQB
	ApDexNXVq5sQvjA80yh9np23SRQQJi86uLbKxOd9RgW/n8D6qzlhT0cK4TvHb+1BMtreT7KoiaB
	rfB8+d3FjUuiFrDmaWCdec8bbCZ8wrGzkrU9KmCExYgWSfPXMH1iNk5yPiB8oFlUvhxcsrgtV4/
	piUovmczJI/rZNmll4f+ZQo/r6kG6tkgSlY8GBYAKJg5kR00S02kmV1xyiHvrRA+5PxbNV4b06w
	BkPfjyBhK8igXo+BpesxZUZgLc3pHdD1SntoRXxz7vI59odzGHlg3P+tyjzL4dTq25BesaxCLyD
	7XiezcMtQzd3OvywNoObSz24NcXZjA
X-Received: by 2002:a05:600c:19d1:b0:48e:8499:4be0 with SMTP id 5b1f17b1804b1-48fdc714b8amr23783895e9.15.1778749804059;
        Thu, 14 May 2026 02:10:04 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fdb2788eesm34097965e9.7.2026.05.14.02.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 02:10:03 -0700 (PDT)
Message-ID: <66797cb2-18f7-4782-9370-68d0c10c35f4@linaro.org>
Date: Thu, 14 May 2026 10:10:02 +0100
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
References: <gsntzf23b6m2.fsf@coltonlewis-kvm.c.googlers.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <gsntzf23b6m2.fsf@coltonlewis-kvm.c.googlers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_021006_391892_BFD1452E 
X-CRM114-Status: GOOD (  24.20  )
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



On 13/05/2026 5:45 pm, Colton Lewis wrote:
> James Clark <james.clark@linaro.org> writes:
> 
>> On 04/05/2026 10:18 pm, Colton Lewis wrote:
>>> Apply dynamic guest counter reservations by checking if the requested
>>> guest mask collides with any events the host has scheduled and calling
>>> pmu_perf_resched_update() with a hook that updates the mask of
>>> available counters in between schedule out and schedule in.
> 
>>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>>> ---
>>>    arch/arm64/kvm/pmu-direct.c  | 69 ++++++++++++++++++++++++++++++++ 
>>> ++++
>>>    include/linux/perf/arm_pmu.h |  1 +
>>>    2 files changed, 70 insertions(+)
> 
>>> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
>>> index 2252d3b905db9..14cc419dbafad 100644
>>> --- a/arch/arm64/kvm/pmu-direct.c
>>> +++ b/arch/arm64/kvm/pmu-direct.c
>>> @@ -100,6 +100,73 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
>>>        return *host_data_ptr(nr_event_counters);
>>>    }
> 
>>> +/* Callback to update counter mask between perf scheduling */
>>> +static void kvm_pmu_update_mask(struct pmu *pmu, void *data)
>>> +{
>>> +    struct arm_pmu *arm_pmu = to_arm_pmu(pmu);
>>> +    unsigned long *new_mask = data;
>>> +
>>> +    bitmap_copy(arm_pmu->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
>>> +}
>>> +
>>> +/**
>>> + * kvm_pmu_set_guest_counters() - Handle dynamic counter reservations
>>> + * @cpu_pmu: struct arm_pmu to potentially modify
>>> + * @guest_mask: new guest mask for the pmu
>>> + *
>>> + * Check if guest counters will interfere with current host events and
>>> + * call into perf_pmu_resched_update if a reschedule is required.
>>> + */
>>> +static void kvm_pmu_set_guest_counters(struct arm_pmu *cpu_pmu, u64 
>>> guest_mask)
>>> +{
>>> +    struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
>>> +    DECLARE_BITMAP(guest_bitmap, ARMPMU_MAX_HWEVENTS);
>>> +    DECLARE_BITMAP(new_mask, ARMPMU_MAX_HWEVENTS);
>>> +    bool need_resched = false;
>>> +
>>> +    bitmap_from_arr64(guest_bitmap, &guest_mask, ARMPMU_MAX_HWEVENTS);
>>> +    bitmap_copy(new_mask, cpu_pmu->hw_cntr_mask, ARMPMU_MAX_HWEVENTS);
>>> +
>>> +    if (guest_mask) {
>>> +        /* Subtract guest counters from available host mask */
>>> +        bitmap_andnot(new_mask, new_mask, guest_bitmap, 
>>> ARMPMU_MAX_HWEVENTS);
>>> +
>>> +        /* Did we collide with an active host event? */
>>> +        if (bitmap_intersects(cpuc->used_mask, guest_bitmap, 
>>> ARMPMU_MAX_HWEVENTS)) {
>>> +            int idx;
>>> +
>>> +            need_resched = true;
>>> +            cpuc->host_squeezed = true;
>>> +
>>> +            /* Look for pinned events that are about to be preempted */
>>> +            for_each_set_bit(idx, guest_bitmap, ARMPMU_MAX_HWEVENTS) {
>>> +                if (test_bit(idx, cpuc->used_mask) && cpuc- 
>>> >events[idx] &&
>>> +                    cpuc->events[idx]->attr.pinned) {
>>> +                    pr_warn_ratelimited("perf: Pinned host event 
>>> squeezed out by KVM guest PMU partition\n");
> 
>> Hi Colton,
> 
>> I get "perf: Pinned host event squeezed out by KVM guest PMU partition"
>> even with arm_pmuv3.reserved_host_counters=3 for example. I would have
>> expected any non zero value to stop the warning.
> 
>> I think armv8pmu_get_single_idx() needs to be changed to allocate from
>> the high end host counters first. A more complicated option would be
>> checking to see if there are any non-pinned counters in the host
>> reserved half when a new pinned counter is opened, then swapping the
>> places of the new pinned and existing non-pinned counters so pinned
>> always prefer being put into the host half. But it's probably not worth
>> doing that.
> 
>> James
> 
> 
> I agree it makes the most sense to allocate from the top, but I'm happy
> the basic idea works.
> 

Another thing I forgot to mention is that even with the ratelimited 
warning, this spams the logs any time the host and guest are both using 
the PMU and I'm not sure how useful that is.

>>> +                    break;
>>> +                }
>>> +            }
>>> +        }
>>> +    } else {
>>> +        /*
>>> +         * Restoring to hw_cntr_mask.
>>> +         * Only resched if we previously squeezed an event.
>>> +         */
>>> +        if (cpuc->host_squeezed) {
>>> +            need_resched = true;
>>> +            cpuc->host_squeezed = false;
>>> +        }
>>> +    }
>>> +
>>> +    if (need_resched) {
>>> +        /* Collision: run full perf reschedule */
>>> +        perf_pmu_resched_update(&cpu_pmu->pmu, kvm_pmu_update_mask, 
>>> new_mask);
>>> +    } else {
>>> +        /* Host was never using guest counters anyway */
>>> +        bitmap_copy(cpu_pmu->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
>>> +    }
>>> +}
>>> +
>>>    /**
>>>     * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved 
>>> counters
>>>     * @pmu: Pointer to arm_pmu struct
>>> @@ -218,6 +285,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
> 
>>>        pmu = vcpu->kvm->arch.arm_pmu;
>>>        guest_counters = kvm_pmu_guest_counter_mask(pmu);
>>> +    kvm_pmu_set_guest_counters(pmu, guest_counters);
>>>        kvm_pmu_apply_event_filter(vcpu);
> 
>>>        for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
>>> @@ -319,5 +387,6 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
>>>        val = read_sysreg(pmintenset_el1);
>>>        __vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);
> 
>>> +    kvm_pmu_set_guest_counters(pmu, 0);
>>>        preempt_enable();
>>>    }
>>> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
>>> index f7b000bb3eca8..63f88fec5e80f 100644
>>> --- a/include/linux/perf/arm_pmu.h
>>> +++ b/include/linux/perf/arm_pmu.h
>>> @@ -75,6 +75,7 @@ struct pmu_hw_events {
> 
>>>        /* Active events requesting branch records */
>>>        unsigned int        branch_users;
>>> +    bool host_squeezed;
>>>    };
> 
>>>    enum armpmu_attr_groups {


