Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2102C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 22:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=CRgSmV2/Mlq0/0RFaXlCT6VkbcpoQhhxjZNhjQH02WQ=; b=NmS1bg0v5qSnQB
	RSgW5W0DYK8I65ekYpKwAxQDwl/m/VAU0QMjBcxSxW+cVdIH9UKXD/w0KgxnI2NJtuUHaFaaimWo3
	hTK2mIgbMavpTismQ+2qoP26bCZ+2lQEjSz+EikrwKI2ECzD3V4DSdWMDisWLWysgOYqvfKxwWExp
	rkiXAK8lNGGSJ8waGkz4snv4mwMsOEJKfxg7k5qdyrTWxsMiKrzeASv1/+BF5MWVCqaeqigR90Czv
	U8bau58C+ctmWztWhgCb0qOzdVNS5wR6QBrRWNOreLI3sQfnQt2hO6soNfQQk6Lhv6rDIxSzKtnfm
	ZbiRvLjzk2K4xYYAOFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5lF-00000006ux6-2BTA;
	Mon, 17 Aug 2026 22:24:53 +0000
Received: from mail-oi1-x247.google.com ([2607:f8b0:4864:20::247])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5lD-00000006uwd-0ELj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 22:24:52 +0000
Received: by mail-oi1-x247.google.com with SMTP id 5614622812f47-4a7de733fa9so5661269b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 15:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787005489; x=1787610289; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CRgSmV2/Mlq0/0RFaXlCT6VkbcpoQhhxjZNhjQH02WQ=;
        b=Bge5lLg3SLqx4zjRA/Au1ADPyzfKW68d57FS5jGu2zfpUChptKFDRXpWhklPy/r0Lq
         SUiq+jh43tTzIXIzk6D2W2LUud7p/IsbCl8saQniiRgjywQMOthiOykKMQW29xeio8ye
         gVhTClBZmDno+2CMwqkudJJfOM6WZrhUAOO/42f9YDvO3JXH5VbNQLbtUGyWk980RnVH
         /ByDk8CICPnHKD0AcuJMLaU8G/FNpsLv9SlrZtzAFI3ccSt8SfTO/vdyejN8v6xcI0lJ
         oELI8WgUgJyjFv8o49/4CbC8zpeknH1wsTJqdz+4SsIxTopXA7Flep9y94mjsHFZea2e
         ifPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787005489; x=1787610289;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRgSmV2/Mlq0/0RFaXlCT6VkbcpoQhhxjZNhjQH02WQ=;
        b=NRriSAxFBh0gPPaimUJS90jGSSJXx3wG9qo2/xaau2moa2xPKtxEZUOmA9m59iVEs9
         jUZNyRakbf7Ge92y0pxuLDi8vs+aWmALWCQj5WbvL5ERUWrKL+K/kE/7CwFvTl+LmDVU
         1HV9jaPHxgpjI9kblZNPcJBBHhlHU3GxnDC24RmNrO9EkyNt9fnVJKkpzY4lS0mtB3WP
         SNd5Znv53rMs3F6zTwuIpg3qcJSHq781SnzZy7y04yJD/thV316buaGS3upeW1mvLNTF
         ILB7+iFk4HMK8a9i1Vr+82qOMhLod4uU/yEEyPSW+yLPuw2W4lF22LaqMDzGFcBrcBRF
         qKRA==
X-Forwarded-Encrypted: i=1; AHgh+RppuFfhX56rpsBmMNqUaVTAIFxoaDgFF0AmEFHH+b64iBDbjdAbJY55qIOoaZoAeVixfhN66aetL7GI3DYdkcyQ@lists.infradead.org
X-Gm-Message-State: AOJu0YytE81bAlww/OOk4vmvuOz1xee+pza2tBNK4/JhPaI0/sKhgsGC
	WdeBYUuUaPbbOSxdt8FTrwYoheTt9StJ83Dv874XICjZ4+5hnCaBTG5daimjwhP8wz2CujxQt8K
	T4CXUjOBXI6SV/sy3Dj/LlwjVEQ==
X-Received: from ilgj3.prod.google.com ([2002:a05:6e02:6343:b0:507:fa97:693c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:17a1:b0:4aa:d5f:123e with SMTP id 5614622812f47-4b241726ef4mr26959054b6e.9.1787005489082;
 Mon, 17 Aug 2026 15:24:49 -0700 (PDT)
Date: Mon, 17 Aug 2026 22:24:48 +0000
In-Reply-To: <16296d40-67f3-4e50-923c-5b26fc122121@intel.com> (zide.chen@intel.com)
Mime-Version: 1.0
Message-ID: <gsntv798tmfj.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 14/21] KVM: arm64: Apply dynamic guest counter reservations
From: Colton Lewis <coltonlewis@google.com>
To: "Chen, Zide" <zide.chen@intel.com>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	james.clark@linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_152451_157334_542F8721 
X-CRM114-Status: GOOD (  22.57  )
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

Hi Zide, thanks for the review.

"Chen, Zide" <zide.chen@intel.com> writes:

> On 6/12/2026 2:29 PM, Colton Lewis wrote:
>> Apply dynamic guest counter reservations by checking if the requested
>> guest mask collides with any events the host has scheduled and calling
>> pmu_perf_resched_update() with a hook that updates the mask of
>> available counters in between schedule out and schedule in.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm64/kvm/pmu-direct.c  | 69 +++++++++++++++++++++++++++++++++++-
>>   include/linux/perf/arm_pmu.h |  1 +
>>   2 files changed, 69 insertions(+), 1 deletion(-)

>> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
>> index 49f1feb5d280c..044f011c9c84b 100644
>> --- a/arch/arm64/kvm/pmu-direct.c
>> +++ b/arch/arm64/kvm/pmu-direct.c
>> @@ -87,6 +87,73 @@ u64 kvm_pmu_direct_pmcr_read(struct kvm_vcpu *vcpu)
>>   		ARMV8_PMU_PMCR_N);
>>   }

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
>> +	bitmap_copy(new_mask, cpu_pmu->hw_cntr_impl, ARMPMU_MAX_HWEVENTS);
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
>> +					pr_warn_once("perf: Pinned host event squeezed out by KVM guest  
>> PMU partition\n");
>> +					break;
>> +				}
>> +			}
>> +		}
>> +	} else {
>> +		/*
>> +		 * Restoring to hw_cntr_impl.
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
>>   /**
>>    * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved  
>> counters
>>    * @pmu: Pointer to arm_pmu struct
>> @@ -209,6 +276,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)

>>   	pmu = vcpu->kvm->arch.arm_pmu;
>>   	guest_counters = kvm_pmu_guest_counter_mask(pmu);
>> +	kvm_pmu_set_guest_counters(pmu, guest_counters);
>>   	kvm_pmu_apply_event_filter(vcpu);

>>   	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
>> @@ -317,7 +385,6 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
>>   	/* Stop guest counters and disable interrupts in hardware. */
>>   	write_sysreg(mask, pmcntenclr_el0);
>>   	write_sysreg(mask, pmintenclr_el1);
>> -
>>   	kvm_pmu_set_guest_counters(pmu, 0);

> I must have missed something.

> Here, vcpu->kvm->arch.arm_pmu->cntr_mask is restored to cntr_mask_impl.
> Is this same struct shared with the perf driver
> (to_arm_pmu(event->pmu)), and shared across other vCPUs as well?

> If so, if another pCPU still has a PMU-partition-enabled vcpu loaded
> with guest-owned counters (MDCR_EL2.HPMN is set), could a host event be
> scheduled onto one of those guest-owned counters, conflicting with the
> guest?

You're correct that is shared more widely than appropriate and could
cause such a conflict.

cntr_mask should be moved to the per-CPU struct pmu_hw_events inside
struct arm_pmu.

>>   	preempt_enable();
>>   }

