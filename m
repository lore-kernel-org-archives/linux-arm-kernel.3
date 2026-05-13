Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD61CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=aW/nYEiFxMS2z4I6C0K281BV66W1OxrZ+NF6ey1g5Rg=; b=Z5y2QPSS4pfVCA
	td8h5/SlJ50fD7Pn04Y2s3Ur72DLgbzptDN+ZNX4/zMiU3DHuxhB0vPqm6h4Dbklfo2NqXhtzJLTK
	CVvZehLrSWfkTdo6lhcemmsAi3y2GuSR2Is1njvOs4n00dZmnzuz2NIZrff25clW/8BucmcC9VLxv
	0SH3ek0MDf219wSzrkOJH0efdUBDjhusQX4sHHzSQHzcowmj+dl+BKIPU1QRaYo4ECQOxJVKk92mg
	qMwuGfbzJaJTTsayNciTIZPzuSJaczdYBWZW7KVUoRlfpneM63rfPHye3WOdR3Yf+smAvlIOc6mEq
	lq4nKiOEWKPhPJ4mfzrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCig-00000003Fl4-06fn;
	Wed, 13 May 2026 16:46:02 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCie-00000003FjY-10Lk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:46:01 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-471618e2082so7214301b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 09:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778690758; x=1779295558; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aW/nYEiFxMS2z4I6C0K281BV66W1OxrZ+NF6ey1g5Rg=;
        b=HjkWwPnPpjX9XCE/oZZgNBxvvKayRxrD8DADB4iqlCp8M4kOHDBHkXcXuiXnxxzKmw
         esrI69DpM5nptEzBTox/BfXEjHM6LUV3td0rmbD5SpByIoA4q108v0QpcHo4SnBH57kw
         4NrVv65DEU2EPruVFpFt0QxxCqbJupLJ/PqzX1rjXxD9J+9pEC/QUcGJCT4nHyb/9WWl
         fcrKi2IKH0ow+QLgDuFnXZ86y4Y8oFqUsjSg+BOBqLyawc0pOb2mZrVl2xVgYEPjDa43
         o6y91dWzYSnC8B0F2WkQ+Qc71BNVcNjaF40LbU5gmHYwKsY22PcNuK42k9f0xVOYE4f4
         Awyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690758; x=1779295558;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aW/nYEiFxMS2z4I6C0K281BV66W1OxrZ+NF6ey1g5Rg=;
        b=V0pzH039UjDfx9mf5j01Bi2p6iGYvBrTdlZk+fYno7qMWNd4NPJyjRkGlHQjyl0yrR
         OUQEs+cnM3XTZHKmXDP7+b2MT299XRIKQFVHLfblVYX65Q2Rgmp8U7Mfw8FAafx9AjRQ
         LRQ2mwutuHwN/0yQHFP9L9Iu/ktiTECW6SqjOSNyp5jFADGry0lSbn2QLOjzslMTO9zh
         z1fS0g0Qpn4Sw4ilPE/DYO6UI0PR/g05kIQ6BrnYVtYojcPojK2mAbZ9WFOMNY6KjrEa
         9pJDFKO3S6WgxKSBT7spE3wq7kd4DiPtpS6FuOyD7k8StBhTENpSODAMOajIGvWY/csT
         iqmw==
X-Forwarded-Encrypted: i=1; AFNElJ8dsehknhdqidFilALGCBh3FKkG5rP9dCr8Q5OYmJDFuizakeXKA/N4vvMXahrGFe3eMPIhF74P0VhI22+obWNo@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmyn3uJ2wwkIAImXTzoGh82E7p5ZlH1598yD9TgESlOJpnU+Ug
	kRMPBHAfhXVJDVSgsQ4wM4ZfdIxbLWmd4pwhqJbw05TuXyfgwhUvx3l7w2SCAyqLYomrxNkkVkb
	BX1HEXpCfoWDflWLle+77YNlB2w==
X-Received: from jabfq5.prod.google.com ([2002:a05:6638:6505:b0:5de:63f7:b7f9])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:2113:b0:696:6440:9e2a with SMTP id 006d021491bc7-69b78dd2cf7mr2147234eaf.29.1778690757861;
 Wed, 13 May 2026 09:45:57 -0700 (PDT)
Date: Wed, 13 May 2026 16:45:57 +0000
In-Reply-To: <e2a7679d-e61a-43ac-a1d7-72f7e815c400@linaro.org> (message from
 James Clark on Mon, 11 May 2026 15:47:54 +0100)
Mime-Version: 1.0
Message-ID: <gsntzf23b6m2.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 13/20] KVM: arm64: Apply dynamic guest counter reservations
From: Colton Lewis <coltonlewis@google.com>
To: James Clark <james.clark@linaro.org>
Cc: alexandru.elisei@arm.com, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_094600_289832_7BE702C1 
X-CRM114-Status: GOOD (  24.31  )
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

James Clark <james.clark@linaro.org> writes:

> On 04/05/2026 10:18 pm, Colton Lewis wrote:
>> Apply dynamic guest counter reservations by checking if the requested
>> guest mask collides with any events the host has scheduled and calling
>> pmu_perf_resched_update() with a hook that updates the mask of
>> available counters in between schedule out and schedule in.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>    arch/arm64/kvm/pmu-direct.c  | 69 ++++++++++++++++++++++++++++++++++++
>>    include/linux/perf/arm_pmu.h |  1 +
>>    2 files changed, 70 insertions(+)

>> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
>> index 2252d3b905db9..14cc419dbafad 100644
>> --- a/arch/arm64/kvm/pmu-direct.c
>> +++ b/arch/arm64/kvm/pmu-direct.c
>> @@ -100,6 +100,73 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
>>    	return *host_data_ptr(nr_event_counters);
>>    }

>> +/* Callback to update counter mask between perf scheduling */
>> +static void kvm_pmu_update_mask(struct pmu *pmu, void *data)
>> +{
>> +	struct arm_pmu *arm_pmu = to_arm_pmu(pmu);
>> +	unsigned long *new_mask = data;
>> +
>> +	bitmap_copy(arm_pmu->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
>> +}
>> +
>> +/**
>> + * kvm_pmu_set_guest_counters() - Handle dynamic counter reservations
>> + * @cpu_pmu: struct arm_pmu to potentially modify
>> + * @guest_mask: new guest mask for the pmu
>> + *
>> + * Check if guest counters will interfere with current host events and
>> + * call into perf_pmu_resched_update if a reschedule is required.
>> + */
>> +static void kvm_pmu_set_guest_counters(struct arm_pmu *cpu_pmu, u64  
>> guest_mask)
>> +{
>> +	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
>> +	DECLARE_BITMAP(guest_bitmap, ARMPMU_MAX_HWEVENTS);
>> +	DECLARE_BITMAP(new_mask, ARMPMU_MAX_HWEVENTS);
>> +	bool need_resched = false;
>> +
>> +	bitmap_from_arr64(guest_bitmap, &guest_mask, ARMPMU_MAX_HWEVENTS);
>> +	bitmap_copy(new_mask, cpu_pmu->hw_cntr_mask, ARMPMU_MAX_HWEVENTS);
>> +
>> +	if (guest_mask) {
>> +		/* Subtract guest counters from available host mask */
>> +		bitmap_andnot(new_mask, new_mask, guest_bitmap, ARMPMU_MAX_HWEVENTS);
>> +
>> +		/* Did we collide with an active host event? */
>> +		if (bitmap_intersects(cpuc->used_mask, guest_bitmap,  
>> ARMPMU_MAX_HWEVENTS)) {
>> +			int idx;
>> +
>> +			need_resched = true;
>> +			cpuc->host_squeezed = true;
>> +
>> +			/* Look for pinned events that are about to be preempted */
>> +			for_each_set_bit(idx, guest_bitmap, ARMPMU_MAX_HWEVENTS) {
>> +				if (test_bit(idx, cpuc->used_mask) && cpuc->events[idx] &&
>> +				    cpuc->events[idx]->attr.pinned) {
>> +					pr_warn_ratelimited("perf: Pinned host event squeezed out by KVM  
>> guest PMU partition\n");

> Hi Colton,

> I get "perf: Pinned host event squeezed out by KVM guest PMU partition"
> even with arm_pmuv3.reserved_host_counters=3 for example. I would have
> expected any non zero value to stop the warning.

> I think armv8pmu_get_single_idx() needs to be changed to allocate from
> the high end host counters first. A more complicated option would be
> checking to see if there are any non-pinned counters in the host
> reserved half when a new pinned counter is opened, then swapping the
> places of the new pinned and existing non-pinned counters so pinned
> always prefer being put into the host half. But it's probably not worth
> doing that.

> James


I agree it makes the most sense to allocate from the top, but I'm happy
the basic idea works.

>> +					break;
>> +				}
>> +			}
>> +		}
>> +	} else {
>> +		/*
>> +		 * Restoring to hw_cntr_mask.
>> +		 * Only resched if we previously squeezed an event.
>> +		 */
>> +		if (cpuc->host_squeezed) {
>> +			need_resched = true;
>> +			cpuc->host_squeezed = false;
>> +		}
>> +	}
>> +
>> +	if (need_resched) {
>> +		/* Collision: run full perf reschedule */
>> +		perf_pmu_resched_update(&cpu_pmu->pmu, kvm_pmu_update_mask, new_mask);
>> +	} else {
>> +		/* Host was never using guest counters anyway */
>> +		bitmap_copy(cpu_pmu->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
>> +	}
>> +}
>> +
>>    /**
>>     * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved  
>> counters
>>     * @pmu: Pointer to arm_pmu struct
>> @@ -218,6 +285,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)

>>    	pmu = vcpu->kvm->arch.arm_pmu;
>>    	guest_counters = kvm_pmu_guest_counter_mask(pmu);
>> +	kvm_pmu_set_guest_counters(pmu, guest_counters);
>>    	kvm_pmu_apply_event_filter(vcpu);

>>    	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
>> @@ -319,5 +387,6 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
>>    	val = read_sysreg(pmintenset_el1);
>>    	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);

>> +	kvm_pmu_set_guest_counters(pmu, 0);
>>    	preempt_enable();
>>    }
>> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
>> index f7b000bb3eca8..63f88fec5e80f 100644
>> --- a/include/linux/perf/arm_pmu.h
>> +++ b/include/linux/perf/arm_pmu.h
>> @@ -75,6 +75,7 @@ struct pmu_hw_events {

>>    	/* Active events requesting branch records */
>>    	unsigned int		branch_users;
>> +	bool host_squeezed;
>>    };

>>    enum armpmu_attr_groups {

