Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5E8CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQ41yj00/XNv9YnqFd8MxyPQ2Or7W/eiTKmLpRiCxws=; b=48z46d08ELb58NKbGotf5x5qGH
	zM2QmUOB62wlwEuSToFdfQUOX2HNUE3HwW4wJbLLc3zeDI8FjoSfncwOi1EMM3l3GsfkG1mIfH6dH
	Ly4zmX+3i6SrlD8Wzzo5UMbOLTd0Bq0xNTuDNeJLax2w+4ViNopgGNF6NZ/2/VYg9qzEArv9pv1JO
	wvT327tbQu8PcunNBNwdVfMLas7VggScDoJCjK1JGHgQL1r+H00osI5yatbXPLGQ5yWx+Uoczc5NP
	srVq1BSuRHIRq6yYinnuip5tfwrH77LcOpvNdE9f+VktSSLPp1y43uOE+XOHwEXUpJpOfbUh49OgM
	Hbl8YBLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwEe-00000006ViK-3lO7;
	Wed, 30 Sep 2026 15:28:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwEd-00000006Vhu-3ucg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 15:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GQ41yj00/XNv9YnqFd8MxyPQ2Or7W/eiTKmLpRiCxws=; b=aBBd4iw+suAOM5Vg/7DMTg9lSY
	0GaImtN40o01hFMg6McoR6ZisdHOtPOvf8Fxn98j5YkPPeqo31kxmNsaUdvDP5dh9AFKwscLuUx47
	I4n1l4BVDXYPNCuAaEA3OfDxchA1DyKvKiKnCFqCxviNeQpjsqlmka2gVy+sRoEb3E2nMwYmrzPyj
	94D391a2W0BcFKd8QFkm8gHpJduzfjYzBRW0XddheN7cC4dWo+8Q4XB70ljk1DgHEHtQ8cQ2cisdr
	qBZZE5OO6q8nohdCpMD2Ukcn/nIQN+wzGXQiYkQUGE3E0qaI8P+7AMtWsfHLMz6nBWEv6obzzWZoq
	c/SsPJhw==;
Received: from mail-ed2-x20.google.com ([2a00:1450:4864:33::20])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwEb-00000003zxm-09hH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:28:42 +0000
Received: by mail-ed2-x20.google.com with SMTP id 4fb4d7f45d1cf-6abc27842b6so6760153a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790782119; x=1791386919; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQ41yj00/XNv9YnqFd8MxyPQ2Or7W/eiTKmLpRiCxws=;
        b=hz7b9THS1lS69ojcuhOS1RTtdwCuGGiYdLTNAJDE+kXKk5UOHePjU8aqWi75CdKcC2
         I9kOl/BB7+8XjQQVihvjbTAXaokqmmJXcL0ybtfaRyzZE3/Ae4XcwjeIqo2mCVILylaW
         vzbPBxJKJQMtqI8fFD5aRnJVnHyk5VcE6qs9kCE9AFS8XXJ8fJmF2EVvVjxZoFayVzyQ
         vcLKQvF14782ib9QImUxAFPnJWe00W46ua9ijr+hsNnAZkgAHGoT2F37/PLchGTiYi5P
         wLcTTCQGcZei1qUW4TiEilIHyzbg5rOxvMVVgDm9lLFIfbpwZ0+VX4TgocGWmpBUHFz0
         EVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782119; x=1791386919;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQ41yj00/XNv9YnqFd8MxyPQ2Or7W/eiTKmLpRiCxws=;
        b=WnLt5aCVrFqUUAB1U9CiI1Ebs6JOoUV5L/mpkWthB3bJmt7M2HdSSgw8E9a8LRqCn0
         unVEGnpkhG66cJbFx24IfAgkLqoytYMbb0+TAAErjMc2eEwm3Gi3KPn4L0U6NVXEc7IL
         2U3Qdxcxo6fFc924SBi3GFETV71L6QlyRESV12Tn3RXjlwB1crq5q1w6uNq07BcIfd6H
         Jv5wHA+T1GLdTeKFGAb1yKiyffGBafSWVoEZEkvfR4RT+rizrokHC4oxW7dfeq1faMXT
         ptfhdYldtTr9EQ+TA5GF9FhnwAnW4gG0PKdTVi/Of1YxS+lcwQ0zzTOS878Hv/ujTZCW
         QJHg==
X-Forwarded-Encrypted: i=1; AKwUvBymEDz5IiA6ojHoFEgfBwFIcPJoDTI/8OkrYGyn7rQEzdL5+11ouF7IDsGPaQiwkjX+eBq8V9NCVFh72tWw6SLO@lists.infradead.org
X-Gm-Message-State: AFq9FYJXnZKWMdWwrFlLzy9VmAqoQgHP5CscZs42fET370HgY0sy+Osi
	l7iyvFSkYcYR/pOr5LefHwT2fZ+eSFM/46hZV9aK1LAYXdHKwL+n8zW3Pzfm7+pgDu8=
X-Gm-Gg: AYBFou1rhHTdYZTNu+GG2EBq14byP/WCCat6vI2s639GlL/Hkit57Q7vZ9I4yBUWxwK
	91bRJKjyGJYn9Z+guwr/YYaVIZHuSfclLnTXSPNzI/f2BPj/i6cBqAhlXp1Kvj2O9e9cs3spciS
	gefj+1+Ooppv7Wa+fepheea0APe1ArPs9e40kMyayq29jPZrjCyIKmwWbyaiJGYZCB9B3ykrQQF
	uEULBpUU1OCbJWK1uDJKBgDnrKlQkLRFidfsiT5WhL/kpV4dpoxWHSKQIfpA4Enskm468PVZ9jy
	ceX3PPveGBTKXiISdUVtojQ6fKFgpWAgKiKng4Fa3eBezz/myHe0w2Lmo7OB1iI7k+RL39Zmxvk
	R84PVJ+nr8xICp33yTWdaneQv6u875HUeFDW5GCzE6LJiUvjUoA6zzsTpSdopy9gLLaTvfHJkBc
	pfGqdMUXDlUZNO1UG3pw3KUT8qPCCOTcXzoOY7+sTt53GpJMAUaHlYX+GTWlEde5kAtcwoMdSTb
	WM=
X-Received: by 2002:a05:6402:4543:b0:6ab:bafd:260e with SMTP id 4fb4d7f45d1cf-6ae199672d1mr1029959a12.44.1790782119271;
        Wed, 30 Sep 2026 08:28:39 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae156a2082sm1010321a12.30.2026.09.30.08.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 08:28:38 -0700 (PDT)
Message-ID: <f54b9ea6-48b1-4f6c-92cc-b0a9249c2fb0@linaro.org>
Date: Wed, 30 Sep 2026 16:28:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/22] KVM: arm64: Apply dynamic guest counter
 reservations
To: Colton Lewis <coltonlewis@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Zide Chen <zide.chen@intel.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Mingwei Zhang <mizhang@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260924172928.2110956-1-coltonlewis@google.com>
 <20260924172928.2110956-17-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260924172928.2110956-17-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_162841_176417_950643A3 
X-CRM114-Status: GOOD (  35.30  )
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



On 24/09/2026 18:29, Colton Lewis wrote:
> Reserve and release guest PMU counters dynamically during vCPU load and
> put rather than statically at VM creation.
> 
> Add kvm_pmu_set_guest_counters() in arch/arm64/kvm/pmu-direct.c, called
> from kvm_pmu_load() and kvm_pmu_put(). When the requested guest counter
> mask collides with active host events in cpuc->used_mask (or when
> releasing counters after squeezing a host event), invoke
> perf_pmu_resched_update() with kvm_pmu_update_mask() to update the
> per-CPU cpuc->cntr_mask between scheduling host events out and back in;
> otherwise update cpuc->cntr_mask directly with interrupts disabled.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>   arch/arm64/kvm/pmu-direct.c  | 77 ++++++++++++++++++++++++++++++++++++
>   include/linux/perf/arm_pmu.h |  1 +
>   2 files changed, 78 insertions(+)
> 
> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
> index a22c9258c2452..31d5afc44f36e 100644
> --- a/arch/arm64/kvm/pmu-direct.c
> +++ b/arch/arm64/kvm/pmu-direct.c
> @@ -115,6 +115,77 @@ u64 kvm_pmu_direct_pmcr_read(struct kvm_vcpu *vcpu)
>   		ARMV8_PMU_PMCR_N);
>   }
>   
> +/* Callback to update counter mask between perf scheduling */
> +static void kvm_pmu_update_mask(struct pmu *pmu, void *data)
> +{
> +	struct arm_pmu *arm_pmu = to_arm_pmu(pmu);
> +	struct pmu_hw_events *cpuc = this_cpu_ptr(arm_pmu->hw_events);
> +	unsigned long *new_mask = data;
> +
> +	bitmap_copy(cpuc->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
> +}
> +
> +/**
> + * kvm_pmu_set_guest_counters() - Handle dynamic counter reservations
> + * @cpu_pmu: struct arm_pmu to potentially modify
> + * @guest_mask: new guest mask for the pmu
> + *
> + * Check if guest counters will interfere with current host events and
> + * call into perf_pmu_resched_update if a reschedule is required.
> + */
> +static void kvm_pmu_set_guest_counters(struct arm_pmu *cpu_pmu, u64 guest_mask)
> +{
> +	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
> +	DECLARE_BITMAP(guest_bitmap, ARMPMU_MAX_HWEVENTS);
> +	DECLARE_BITMAP(new_mask, ARMPMU_MAX_HWEVENTS);
> +	unsigned long flags;
> +	bool need_resched = false;
> +
> +	bitmap_from_arr64(guest_bitmap, &guest_mask, ARMPMU_MAX_HWEVENTS);
> +	bitmap_copy(new_mask, cpu_pmu->cntr_mask, ARMPMU_MAX_HWEVENTS);
> +
> +	local_irq_save(flags);
> +	if (guest_mask) {
> +		/* Subtract guest counters from available host mask */
> +		bitmap_andnot(new_mask, new_mask, guest_bitmap, ARMPMU_MAX_HWEVENTS);
> +
> +		/* Did we collide with an active host event? */
> +		if (bitmap_intersects(cpuc->used_mask, guest_bitmap, ARMPMU_MAX_HWEVENTS)) {
> +			int idx;
> +
> +			need_resched = true;
> +			cpuc->host_squeezed = true;
> +
> +			/* Look for pinned events that are about to be preempted */
> +			for_each_set_bit(idx, guest_bitmap, ARMPMU_MAX_HWEVENTS) {
> +				if (test_bit(idx, cpuc->used_mask) && cpuc->events[idx] &&
> +				    cpuc->events[idx]->attr.pinned) {
> +					pr_warn_once("perf: Pinned host event squeezed out by KVM guest PMU partition\n");

If you enable pseudo-NMIs, watchdog_hardlockup_enable() installs the 
watchdog using a pinned PMU event. If host userspace also has a pinned 
event on the mandatory 1 PMU counter assigned to the host, then a guest 
could potentially squeeze out the watchdog.

I'm wondering if we need to prioritise kernel owned events? Or we just 
treat them the same as any other event, and with PMU partitioning assume 
they can't be guaranteed to be running? I feel like you would expect a 
watchdog to be a bit more than best effort though, especially if there 
was always a guaranteed counter available to put it on.

I didn't follow it through completely, but it also looks like if the 
event gets squeezed it would enter an error state and then never be 
re-enabled, even after the guest stops running.

Note, that I think the current ordering means that the watchdog won't 
actually get squeezed out because it's created first. But I don't think 
we can rely on the ordering as a strong guarantee, and it might get 
broken by refactoring in the future.


> +					break;
> +				}
> +			}
> +		}
> +	} else {
> +		/*
> +		 * Restoring to full mask.
> +		 * Only resched if we previously squeezed an event.
> +		 */
> +		if (cpuc->host_squeezed) {
> +			need_resched = true;
> +			cpuc->host_squeezed = false;
> +		}
> +	}
> +	if (!need_resched)
> +		/* Host was never using guest counters anyway */
> +		bitmap_copy(cpuc->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
> +	local_irq_restore(flags);
> +
> +	if (need_resched) {
> +		/* Collision: run full perf reschedule */
> +		perf_pmu_resched_update(&cpu_pmu->pmu, kvm_pmu_update_mask, new_mask);
> +	}
> +}
> +
>   /**
>    * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
>    *
> @@ -255,6 +326,7 @@ static void kvm_pmu_apply_event_filter(struct kvm_vcpu *vcpu)
>    */
>   void kvm_pmu_load(struct kvm_vcpu *vcpu)
>   {
> +	struct arm_pmu *pmu;
>   	unsigned long guest_counters;
>   	u64 mask;
>   	u8 i;
> @@ -269,7 +341,9 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
>   
>   	preempt_disable();
>   
> +	pmu = vcpu->kvm->arch.arm_pmu;
>   	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
> +	kvm_pmu_set_guest_counters(pmu, guest_counters);
>   	kvm_pmu_apply_event_filter(vcpu);
>   
>   	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
> @@ -329,6 +403,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
>    */
>   void kvm_pmu_put(struct kvm_vcpu *vcpu)
>   {
> +	struct arm_pmu *pmu;
>   	unsigned long guest_counters;
>   	unsigned long flags;
>   	u64 mask;
> @@ -345,6 +420,7 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
>   
>   	preempt_disable();
>   
> +	pmu = vcpu->kvm->arch.arm_pmu;
>   	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
>   	mask = guest_counters;
>   
> @@ -395,5 +471,6 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
>   	write_sysreg(val & mask, pmovsclr_el0);
>   	local_irq_restore(flags);
>   
> +	kvm_pmu_set_guest_counters(pmu, 0);
>   	preempt_enable();
>   }
> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
> index be1e345e99a77..45658273ffa86 100644
> --- a/include/linux/perf/arm_pmu.h
> +++ b/include/linux/perf/arm_pmu.h
> @@ -76,6 +76,7 @@ struct pmu_hw_events {
>   
>   	/* Active events requesting branch records */
>   	unsigned int		branch_users;
> +	bool host_squeezed;
>   };
>   
>   enum armpmu_attr_groups {


