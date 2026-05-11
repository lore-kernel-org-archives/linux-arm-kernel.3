Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4023CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaxiXYaFYeaH8Qp4J3ioh2j1XsATKbSVhM9o5LlP7fw=; b=aTjLffE9zgZZ2jucmWTvjfJ/ST
	A1WtC1YJx/kwMi3ChENATqB3+NaeYlL9v5tWR3X0ngV0NPUtIHyWBXswL8/wsVlthOfu470ad2kXo
	YfeVMUI2S8YWov8fE1DCCWPs61HaIBA3sJ6WsnN0BobPQaKcve4iDTRYmSMvGz/d7QQjmqNJvS7sn
	+5LLbPxthEJo6LfYq+lV2OfQq17EZqENYmfMNA2M0AdSxCdFNqmmFH3MZM1A7lmQ84zhvKNwF5dxr
	oHEd9lViIJLrtJ7mOB4lB59Rn/CTH1AFD1OCGrQQQW4ECRpZt9v/ItMkIVK1jRnaLC+isQXmMpbNH
	Xi5WMZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRvO-0000000DwpL-34RE;
	Mon, 11 May 2026 14:48:02 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRvL-0000000Dwoh-1u5I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:48:00 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43d73352cf2so3618292f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778510877; x=1779115677; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iaxiXYaFYeaH8Qp4J3ioh2j1XsATKbSVhM9o5LlP7fw=;
        b=hhV7Vbzcf6lQlMJLSd/yNdMzQC+LRCo6q7uY9qkdaaAPztcZST9yALJiRmbCFH3Ajp
         eYpD7Naj5BlGwaPnSKslLh93LUdzIlv2ze1hQYMS2W6pZ+y2yxdgdEEurwMsFYMvMoj/
         RVH5hB0/QK4fUsSbpYit2hVj2F4mWjnz933pM08SmblVKmub+QnLxKwYyaAQe9kcVGpE
         3JhwlgkZiMtPtay6f0QTb9PK8lceA84eZY3jYAGn6OyYavw/HB8scpn9nhVwjnSXPtdP
         BSEwB12kl380FPzrHRIuy1152yetGwWhdTIZaDQ8VW422swiYI1n7hX1L1cwsSQmAAeV
         mojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510877; x=1779115677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaxiXYaFYeaH8Qp4J3ioh2j1XsATKbSVhM9o5LlP7fw=;
        b=ly/nQFORwM0BlKolln5Q5KNMOUGjhDsvn/CpkKok2e2V4UHWUZL8JRUu/YhNqf/kAS
         LtADWLoO0b4xa99pzZPRzGNtUOn1Eohf3PBhN89+mBcSj1AFkk9XshV/nrInEEL5NLKt
         Osqwj/E8Lo0frB0vLD/h4J3KscikF13kyJAKBvz9Kq5xXeX60RVaCAJBCG4CTLCNT1Kl
         WluP3u3KGcKPgAoZ5hQQk5/t/7ptv5IgdCKNnDUj+zeKFDP9UXOtfk7whO7kDqMsHPs6
         cHxVufQnUzSZxUVV/mhHp4rBWpLZuw9fP+U9dJvK9mkNgzF9gkmaHqkXrXiG3A8bnOug
         4dxw==
X-Forwarded-Encrypted: i=1; AFNElJ92dAZIxEqnUcfBbYvpnTv7vaGsEQ2GBtoKzjmenM87c824t5T2WVps1FCtLbNUTAEQX3vOjIm2hAkuZWH7jk2E@lists.infradead.org
X-Gm-Message-State: AOJu0YwTRj+yMqb5UZ7s9Ix1MHB3nWfBmhdjXCMsoFa66t+L4Yi1HMpa
	75x1SquzArB2DLMYY4hnAo06miHgiDX+1d6K76sBNY/mR1DKtTvPvzk0CN48pumC5rU=
X-Gm-Gg: Acq92OF6sNKW+YL0eGLM076PknQkGlPZbZkG0OqD+9M7adtyL+r6pvy8F+W9lJ3JMKz
	21Pz9+YukdUapXxXQGnlJuPclzzdGYY1Ktc8RWjBVyqSOZrErQaLgd/Nnw8pIIYCt9sik3d1t99
	ri+lI3rL9O0W7Ixo/+iiAAp/7sz0ww0Dgo3Z9RxQdHCNqw5ACyZQm7c1pNirHfbSIRa9mRYNVx+
	jLv3z3r21N0W1bW+hbhslDwilFulnod27JG3+5hCPmhKOWT9iQUcmU0BLa6iwj4A2ORuvULWH2P
	O3lm/tb8LotVZ9FzhHcy8dr2x0SavxhonAJzfuIYocrqA8E0gxcsvHaT4HxhoO3U/TDSPSIOr74
	+mh4+ZQICJyBkjZSgf/Dx+gszQrpxtmVJGaX+MmA9P1DPkCac0mZdvlgkMPvmrhzt/aUwRGDnEP
	baTUHSCvyX/ldgAVds9nlOXLMocN9b/eL8oFm7QMzvPw4nGBc2Tw==
X-Received: by 2002:a05:6000:543:b0:456:e591:4b84 with SMTP id ffacd0b85a97d-456e5914b94mr9935298f8f.3.1778510876575;
        Mon, 11 May 2026 07:47:56 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a5b65sm27064913f8f.8.2026.05.11.07.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 07:47:56 -0700 (PDT)
Message-ID: <e2a7679d-e61a-43ac-a1d7-72f7e815c400@linaro.org>
Date: Mon, 11 May 2026 15:47:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/20] KVM: arm64: Apply dynamic guest counter
 reservations
To: Colton Lewis <coltonlewis@google.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Shuah Khan <shuah@kernel.org>,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kvm@vger.kernel.org
References: <20260504211813.1804997-1-coltonlewis@google.com>
 <20260504211813.1804997-14-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260504211813.1804997-14-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_074759_527677_A1465808 
X-CRM114-Status: GOOD (  25.79  )
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



On 04/05/2026 10:18 pm, Colton Lewis wrote:
> Apply dynamic guest counter reservations by checking if the requested
> guest mask collides with any events the host has scheduled and calling
> pmu_perf_resched_update() with a hook that updates the mask of
> available counters in between schedule out and schedule in.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>   arch/arm64/kvm/pmu-direct.c  | 69 ++++++++++++++++++++++++++++++++++++
>   include/linux/perf/arm_pmu.h |  1 +
>   2 files changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
> index 2252d3b905db9..14cc419dbafad 100644
> --- a/arch/arm64/kvm/pmu-direct.c
> +++ b/arch/arm64/kvm/pmu-direct.c
> @@ -100,6 +100,73 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
>   	return *host_data_ptr(nr_event_counters);
>   }
>   
> +/* Callback to update counter mask between perf scheduling */
> +static void kvm_pmu_update_mask(struct pmu *pmu, void *data)
> +{
> +	struct arm_pmu *arm_pmu = to_arm_pmu(pmu);
> +	unsigned long *new_mask = data;
> +
> +	bitmap_copy(arm_pmu->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
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
> +	bool need_resched = false;
> +
> +	bitmap_from_arr64(guest_bitmap, &guest_mask, ARMPMU_MAX_HWEVENTS);
> +	bitmap_copy(new_mask, cpu_pmu->hw_cntr_mask, ARMPMU_MAX_HWEVENTS);
> +
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
> +					pr_warn_ratelimited("perf: Pinned host event squeezed out by KVM guest PMU partition\n");

Hi Colton,

I get "perf: Pinned host event squeezed out by KVM guest PMU partition" 
even with arm_pmuv3.reserved_host_counters=3 for example. I would have 
expected any non zero value to stop the warning.

I think armv8pmu_get_single_idx() needs to be changed to allocate from 
the high end host counters first. A more complicated option would be 
checking to see if there are any non-pinned counters in the host 
reserved half when a new pinned counter is opened, then swapping the 
places of the new pinned and existing non-pinned counters so pinned 
always prefer being put into the host half. But it's probably not worth 
doing that.

James

> +					break;
> +				}
> +			}
> +		}
> +	} else {
> +		/*
> +		 * Restoring to hw_cntr_mask.
> +		 * Only resched if we previously squeezed an event.
> +		 */
> +		if (cpuc->host_squeezed) {
> +			need_resched = true;
> +			cpuc->host_squeezed = false;
> +		}
> +	}
> +
> +	if (need_resched) {
> +		/* Collision: run full perf reschedule */
> +		perf_pmu_resched_update(&cpu_pmu->pmu, kvm_pmu_update_mask, new_mask);
> +	} else {
> +		/* Host was never using guest counters anyway */
> +		bitmap_copy(cpu_pmu->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
> +	}
> +}
> +
>   /**
>    * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
>    * @pmu: Pointer to arm_pmu struct
> @@ -218,6 +285,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
>   
>   	pmu = vcpu->kvm->arch.arm_pmu;
>   	guest_counters = kvm_pmu_guest_counter_mask(pmu);
> +	kvm_pmu_set_guest_counters(pmu, guest_counters);
>   	kvm_pmu_apply_event_filter(vcpu);
>   
>   	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
> @@ -319,5 +387,6 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
>   	val = read_sysreg(pmintenset_el1);
>   	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);
>   
> +	kvm_pmu_set_guest_counters(pmu, 0);
>   	preempt_enable();
>   }
> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
> index f7b000bb3eca8..63f88fec5e80f 100644
> --- a/include/linux/perf/arm_pmu.h
> +++ b/include/linux/perf/arm_pmu.h
> @@ -75,6 +75,7 @@ struct pmu_hw_events {
>   
>   	/* Active events requesting branch records */
>   	unsigned int		branch_users;
> +	bool host_squeezed;
>   };
>   
>   enum armpmu_attr_groups {


