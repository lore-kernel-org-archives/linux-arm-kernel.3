Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85082C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 00:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=CXinvutFgPziM7RxPNDr3Edga1bpxeAp0Ov8Puttle0=; b=rqJwzIdnET+2QX
	Q+WVczpSkLAnlcajDezXVyPQV3nl7DgfaURQNcx5YtRz+4rkfLXxkuM7bVq4GD6IG5Pvfwjrj8VwX
	st5tAgwpQLKwkL/AoSXZRR/WqXdJveFWUsJQUpHErgW4GyHSkI5hXrLSEErkRYIp88k0iHNYF2+RT
	eFVYweqLaIXVCrona/CAMNILFSIP3dGYNZukF7yj9tq1+jaciX0ui4XrVTkjTXg4yLDU/Bw4Aa1MC
	CzL2ga12Twt/riKQqd1fkkdMweGCFbnd+wJnSbpTZ78rpYcYoSU1ZZ68Xys5f+LMS4x4CGY1bIDq7
	sz4u/R5gdvjqgMiFk+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1the61-00000001yIm-48Xt;
	Tue, 11 Feb 2025 00:25:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcsy-00000001n6L-2Fyy
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 23:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:References;
	bh=CXinvutFgPziM7RxPNDr3Edga1bpxeAp0Ov8Puttle0=; b=phZIv9RK9spifzaYGXDn56k5v2
	EyZjtDESh/NyXSNb/CIAPeVDwweOb9VFnMoHtrVHVDMcCgHVTCt0SMPzibqVYxK8U1GKlFA5Lb7jJ
	8rNYMYKVXiBLyVkgLuEILXf4Iqwj57pJUbMwN41tc8KvjSqlPHtIOl97ZMZOQ40edsNYZDhPQ1zwd
	fe0/tt09cB2Ni88cNNc7w7uoDALToogHBvQQydEJ994vQynmMtKJyuUIqqhYArRQncOPgWzQMTKQ4
	GMD7cvbEkfzFQdaxtz8s+pO0DaRcPioZyuMZD+GmFDmbzLZoW8J/U+VFpWmdp9rSwi9ISFSjcbSJT
	UCLJXwyg==;
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcsv-00000000M4T-2W0u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 23:08:15 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3d14a235594so18733315ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 15:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739228892; x=1739833692; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CXinvutFgPziM7RxPNDr3Edga1bpxeAp0Ov8Puttle0=;
        b=oyd7bV8g7Vlw4DGruIXnhcC9r0rlmkB9l9UtjoKoE7ddYj3Hy/9u5PTz8CwXHOaJGS
         updAxafu2LxsyP0x8nJKKrsL346Alq93eDfcYYNWFxm4e4/lgyh/QKHme+W+cxj+n125
         BJT1sBugVY7Jk0JBdM7fnK5EhQGg8713iyInLcCu0SogqGr0PFzN5n2116K20kVuWLI+
         bg6Vkrdu/4teP6lYcl9ww0St15hQbJOs7BqR81QEEU/emrlNdJMMhQIRPv2Y1x7PKWIQ
         IxrXxbtuJKoe0Yb61l2D2vdNJp2f21MtgNjs5Ve5U9XUmDr2UMP+DxCwwAWBa3WHWM2P
         KTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739228892; x=1739833692;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CXinvutFgPziM7RxPNDr3Edga1bpxeAp0Ov8Puttle0=;
        b=ffTwT0WBasM2oh0Spl6e31qtWvpOjlBWavvbC5Uv2ico/Rq6v1u/hNRZHuj4R3pZ8g
         uIyFgA+Rh+bquiEdLskbQN9R3MNkbk8/eTR1ZnPx4m4i18i4iALU9onwLaGW9D56nfWQ
         ++94vC7GeRLAHPzPIF8CEqCbMAg0Y0QiHGkYg7hacc+zGGiWfN53dbDMW5NFK7NnHIAX
         8rGKs7tyEuiYCJ9n0Cv1MWWYHAPuVv1DLztUCbcXycBCx5WyDNpZhu1G099uNJfpb1KV
         5IyPMi2C0v5aQBAJ80eJQzIk6lc5MHCDAzXZk71o9HGa+qy94UXitxfgmUNpB8M+8iS7
         MWKw==
X-Forwarded-Encrypted: i=1; AJvYcCUk1y0xFKUnk6lv7738UdDJpoLPMQ7r+l1Mb4auxJ5Hc/1gkfKxY8mwlhAIVnWEg97V6pe7b0htI8S7mWt8iOxd@lists.infradead.org
X-Gm-Message-State: AOJu0YxKHfbkJD47r+k5NGJ3zmOKrYalFxi3P3QimqDy4vLX5dLWkPWC
	8M02VMAcj33kc0sAHuVjaFt2UL/Pf6mZ1AZUm1NTuZKGGiA99wlKOFACO3pCpKMy8sZVEyYYlTE
	vhRXYwmWsyTokkGZnsPq5XQ==
X-Google-Smtp-Source: AGHT+IFUZhu2OwBm9Xl4P9gAhtgSkcN1rVy5kcIM68xBXK4rcWyV4/0jaNvjvAieMThFeK6tg2McyqvG5JOCTsu70Q==
X-Received: from ilbec1.prod.google.com ([2002:a05:6e02:4701:b0:3d1:3d59:434b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1c01:b0:3d0:f2ca:65aa with SMTP id e9e14a558f8ab-3d16f40b648mr9951285ab.4.1739228891849;
 Mon, 10 Feb 2025 15:08:11 -0800 (PST)
Date: Mon, 10 Feb 2025 23:08:11 +0000
In-Reply-To: <Z6msyUG0HWM2EImQ@linux.dev> (message from Oliver Upton on Sun, 9
 Feb 2025 23:37:45 -0800)
Mime-Version: 1.0
Message-ID: <gsnted051jqc.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [RFC PATCH v2 4/4] KVM: arm64: Make guests see only counters they
 can access
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, pbonzini@redhat.com, 
	shuah@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_230813_822545_7D561F73 
X-CRM114-Status: GOOD (  29.55  )
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

Hi Oliver, thanks for the review.

Oliver Upton <oliver.upton@linux.dev> writes:

> On Sat, Feb 08, 2025 at 02:01:11AM +0000, Colton Lewis wrote:
>> The ARM architecture specifies that when MDCR_EL2.HPMN is set, EL1 and
>> EL0, which includes KVM guests, should read that value for PMCR.N.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm64/kvm/debug.c                                  | 3 +--
>>   arch/arm64/kvm/pmu-emul.c                               | 8 +++++++-
>>   tools/testing/selftests/kvm/arm64/vpmu_counter_access.c | 2 +-
>>   3 files changed, 9 insertions(+), 4 deletions(-)

>> diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
>> index 0e4c805e7e89..7c04db00bf6c 100644
>> --- a/arch/arm64/kvm/debug.c
>> +++ b/arch/arm64/kvm/debug.c
>> @@ -36,8 +36,7 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu  
>> *vcpu)
>>   	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
>>   	 * to disable guest access to the profiling and trace buffers
>>   	 */
>> -	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
>> -					 *host_data_ptr(nr_event_counters));
>> +	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, read_mdcr());

> Please avoid unnecessary accesses to MDCR_EL2 at all costs. This is a
> guaranteed trap to EL2 with nested virt.

I thought it was necessary when I wrote this, but I see it's not after
thinking about it for a while.

The intended value is accessible from vcpu->kvm->arch.arm_pmu.hpmn as
written, but could be somewhere else after addressing your suggestion to
lift all MDCR handling into KVM.

>>   	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
>>   				MDCR_EL2_TPMS |
>>   				MDCR_EL2_TTRF |
>> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
>> index 6c5950b9ceac..052ce8c721fe 100644
>> --- a/arch/arm64/kvm/pmu-emul.c
>> +++ b/arch/arm64/kvm/pmu-emul.c
>> @@ -993,12 +993,18 @@ static bool pmu_irq_is_valid(struct kvm *kvm, int  
>> irq)
>>   u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
>>   {
>>   	struct arm_pmu *arm_pmu = kvm->arch.arm_pmu;
>> +	u8 limit;
>> +
>> +	if (arm_pmu->partitioned)
>> +		limit = arm_pmu->hpmn - 1;
>> +	else
>> +		limit = ARMV8_PMU_MAX_GENERAL_COUNTERS;

>>   	/*
>>   	 * The arm_pmu->cntr_mask considers the fixed counter(s) as well.
>>   	 * Ignore those and return only the general-purpose counters.
>>   	 */
>> -	return bitmap_weight(arm_pmu->cntr_mask,  
>> ARMV8_PMU_MAX_GENERAL_COUNTERS);
>> +	return bitmap_weight(arm_pmu->cntr_mask, limit);
>>   }

> This isn't necessary and is likely to regress the existing behavior.

> When the architecture says the lower ELs should see PMCR_EL0.N have the
> same value as MDCR_EL2.HPMN, what it really means is direct reads from
> hardware will return the value.

> So my expectation would be that a VM using the partitioned PMU
> implementation would never reach any of the *emulated* PMU handlers, as
> we would've disabled the associated traps.

Understood. The change was here to see be able to read PMCR_EL0.N from
inside a VM since I haven't disabled the associated traps yet.

It shouldn't be in this patch.

> The partitioned PMU will not replace the emulated vPMU implementation in
> KVM, so it'd be good to refactor what we have today to make room for
> your work. I think that'd be along the lines of:

>   - Shared code for event filter enforcement and handling of the vPMU
>     overflow IRQ.

>   - Emulated PMU implementation that provides trap handlers for all PMUv3
>     registers and backs into host perf

>   - Partitioned PMU implementation that doesn't rely on traps and instead
>     saves / restores a portion of the PMU that contains the guest
>     context.

> These should be done in separate files, i.e. I do not want to see a
> bunch of inline handling to cope with emulated v. partitioned PMUs.

Agreed.

>>   static void kvm_arm_set_pmu(struct kvm *kvm, struct arm_pmu *arm_pmu)
>> diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c  
>> b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
>> index f16b3b27e32e..b5bc18b7528d 100644
>> --- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
>> +++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
>> @@ -609,7 +609,7 @@ static void run_pmregs_validity_test(uint64_t pmcr_n)
>>    */
>>   static void run_error_test(uint64_t pmcr_n)
>>   {
>> -	pr_debug("Error test with pmcr_n %lu (larger than the host)\n",  
>> pmcr_n);
>> +	pr_debug("Error test with pmcr_n %lu (larger than the host allows)\n",  
>> pmcr_n);

> NBD for an RFC, but in the future please do selftests changes in a
> separate patch.

Ok, I'll do that in the future.

