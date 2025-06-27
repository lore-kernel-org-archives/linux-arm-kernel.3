Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5226AC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 20:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=vCwkQeNvJFmRc91Gk8T3YA4HoLg8Wg847EVfC3MKwm0=; b=KPw71swrygt+fv
	4p0MYuO9Cg+Ps/aDH+zNG2faEz6qcaPFwIDKIZMZrKkg7T+oBwA2GUx57vYCYq1yrROOAnuincv7y
	0/2KjksrZP2ZUJX10CObitCyT32niGZooYzIgG3mtbJn0Ej3WNVuRkpPIluJu4893BIbEY0kNkm5E
	ES0WNVzzmEoxRPgoqqucormsNTccxioiDzt9GaNCNxbY9q+mpHsTJs8HS55ciyQJMwm4kYlW+xNHN
	woCdhgOAb3sOjRHeSDMI5r20Gx8qE4o+2JHMV9vmE3q4XrtsIkcozHwqNjL5VROOkseppQVRndubV
	fC4TLu0EaOwVmAA5L/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVG3z-0000000Fndo-2QM7;
	Fri, 27 Jun 2025 20:52:47 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFxQ-0000000Fmhb-1a06
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 20:46:01 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-72e90e6e171so77201a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 13:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751057159; x=1751661959; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vCwkQeNvJFmRc91Gk8T3YA4HoLg8Wg847EVfC3MKwm0=;
        b=hhYMJSZx38VekDJ6UXxEjLRgxggwWme5IjIYSL/70bUhKfpQ84e8neFljVRiEMBdl9
         0k6vwP9+DrVVxmMh2mSORiSqB2FmzO6GW5ViNcyvhVKiqEV5SZijGFB/musMmvnDQIMj
         HLIejgutxmnoEBCEQGHZMd0n3K+GqXa+bft65mrteMKEabJ//kL6ENM8QvV2wtdoqEXX
         +qLCHlTUT3Rf0vwGK8PPur7z2WgACmju4hgM66EOTFZOwK1E4o25vscdrwc5R9PzV15h
         ImFIHdZrmtt+boi5u9//C+uXuLgvdPPWkJJS5o0s3krASFcUtSt4sJDGfMyUAkFrnm6Q
         UHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751057159; x=1751661959;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vCwkQeNvJFmRc91Gk8T3YA4HoLg8Wg847EVfC3MKwm0=;
        b=NkOAxO+wFq41zpSW6C62Cu3SszSE8AmqD18S6K7eDPLHjxG429SR+BVzjkee7dzve3
         tivRglGCnNJ0Lj93C9d/LnGSkvaop0G87uidKN8mPM8Iagm9vQABOW8bFsSXZHB954gv
         hVp3L2hBVzQv3TLbPupaXN+gXUX5wvMw49e+22+HpaTi7sdxaTxUFRD+DXUmw4ptlBET
         JZ3VYgiOXJM57Q1Fxteen8KtZSpCkRoTp+BCmtmjH2R4oLGopEfVb4bmALuCrn/Iuv9u
         zomZf2J///Jp5wRz47L8nxDuHjujxT5vmJjFPPsONHrd6RNhw8CFecwK4uikGEo9aXYv
         7XLw==
X-Forwarded-Encrypted: i=1; AJvYcCVAp+C8vJFBFDeUGRMFIEuT2QbDAJrXLcIEai/lKRefsI1ffceUMStfdAR3Mc+WWxCJEfgKcEbIORkM2h5r9Dpc@lists.infradead.org
X-Gm-Message-State: AOJu0YwKJoXX1M/9EtG+7pbxsrMNX9R4vv7NpEX5weu09K6F3ZiKHEcN
	fsxVpBDQ4k5/TqlCuuAs7soJ15tFddVcUoXqJYPTXgVMmXwwEseb8qn623qkzCpRgmP6RhIgW/b
	2Llfm4hJRNAorXkNuTf3xkDAHrw==
X-Google-Smtp-Source: AGHT+IH2HpfAlrvSBQPMk62/RIc0nWzkxCoCzJycTm56dna3SUVLdeLNxUVR8JHlvZrOyIvBaFCfMBXjvOwVdkFbjg==
X-Received: from otbby6.prod.google.com ([2002:a05:6830:6086:b0:72c:10e4:a953])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:2710:b0:727:4356:9f07 with SMTP id 46e09a7af769-73afc67b661mr3036914a34.14.1751057158815;
 Fri, 27 Jun 2025 13:45:58 -0700 (PDT)
Date: Fri, 27 Jun 2025 20:45:57 +0000
In-Reply-To: <86plepb54f.wl-maz@kernel.org> (message from Marc Zyngier on Fri,
 27 Jun 2025 16:01:36 +0100)
Mime-Version: 1.0
Message-ID: <gsntbjq89am2.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v3 10/22] KVM: arm64: Set up FGT for Partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	oliver.upton@linux.dev, mizhang@google.com, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	shuah@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_134600_416582_7D02E0B5 
X-CRM114-Status: GOOD (  20.51  )
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

Marc Zyngier <maz@kernel.org> writes:

> On Thu, 26 Jun 2025 21:04:46 +0100,
> Colton Lewis <coltonlewis@google.com> wrote:

>> In order to gain the best performance benefit from partitioning the
>> PMU, utilize fine grain traps (FEAT_FGT and FEAT_FGT2) to avoid
>> trapping common PMU register accesses by the guest to remove that
>> overhead.

>> There should be no information leaks between guests as all these
>> registers are context swapped by a later patch in this series.

>> Untrapped:
>> * PMCR_EL0
>> * PMUSERENR_EL0
>> * PMSELR_EL0
>> * PMCCNTR_EL0
>> * PMINTEN_EL0
>> * PMEVCNTRn_EL0

>> Trapped:
>> * PMOVS_EL0
>> * PMEVTYPERn_EL0
>> * PMCCFILTR_EL0
>> * PMICNTR_EL0
>> * PMICFILTR_EL0

>> PMOVS remains trapped so KVM can track overflow IRQs that will need to
>> be injected into the guest.

>> PMICNTR remains trapped because KVM is not handling that yet.

>> PMEVTYPERn remains trapped so KVM can limit which events guests can
>> count, such as disallowing counting at EL2. PMCCFILTR and PMCIFILTR
>> are the same.

> I'd rather you explain why it is safe not to trap the rest.

Okay, I will reverse my explanation.


>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm64/include/asm/kvm_pmu.h        | 23 ++++++++++
>>   arch/arm64/kvm/hyp/include/hyp/switch.h | 58 +++++++++++++++++++++++++
>>   arch/arm64/kvm/pmu-part.c               | 32 ++++++++++++++
>>   3 files changed, 113 insertions(+)

>> diff --git a/arch/arm64/include/asm/kvm_pmu.h  
>> b/arch/arm64/include/asm/kvm_pmu.h
>> index 6328e90952ba..73b7161e3f4e 100644
>> --- a/arch/arm64/include/asm/kvm_pmu.h
>> +++ b/arch/arm64/include/asm/kvm_pmu.h
>> @@ -94,6 +94,21 @@ u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
>>   void kvm_pmu_host_counters_enable(void);
>>   void kvm_pmu_host_counters_disable(void);

>> +#if !defined(__KVM_NVHE_HYPERVISOR__)
>> +bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
>> +bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu);
>> +#else
>> +static inline bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
>> +{
>> +	return false;
>> +}
>> +
>> +static inline bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
>> +{
>> +	return false;
>> +}
>> +#endif
>> +
>>   /*
>>    * Updates the vcpu's view of the pmu events for this cpu.
>>    * Must be called before every vcpu run after disabling interrupts, to  
>> ensure
>> @@ -133,6 +148,14 @@ static inline u64 kvm_pmu_get_counter_value(struct  
>> kvm_vcpu *vcpu,
>>   {
>>   	return 0;
>>   }
>> +static inline bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
>> +{
>> +	return false;
>> +}
>> +static inline bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
>> +{
>> +	return false;
>> +}
>>   static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
>>   					     u64 select_idx, u64 val) {}
>>   static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
>> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h  
>> b/arch/arm64/kvm/hyp/include/hyp/switch.h
>> index 825b81749972..47d2db8446df 100644
>> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
>> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
>> @@ -191,6 +191,61 @@ static inline bool cpu_has_amu(void)
>>                  ID_AA64PFR0_EL1_AMU_SHIFT);
>>   }

>> +/**
>> + * __activate_pmu_fgt() - Activate fine grain traps for partitioned PMU
>> + * @vcpu: Pointer to struct kvm_vcpu
>> + *
>> + * Clear the most commonly accessed registers for a partitioned
>> + * PMU. Trap the rest.
>> + */
>> +static inline void __activate_pmu_fgt(struct kvm_vcpu *vcpu)
>> +{
>> +	struct kvm_cpu_context *hctxt = host_data_ptr(host_ctxt);
>> +	struct kvm *kvm = kern_hyp_va(vcpu->kvm);
>> +	u64 set;
>> +	u64 clr;
>> +
>> +	set = HDFGRTR_EL2_PMOVS
>> +		| HDFGRTR_EL2_PMCCFILTR_EL0
>> +		| HDFGRTR_EL2_PMEVTYPERn_EL0;
>> +	clr = HDFGRTR_EL2_PMUSERENR_EL0
>> +		| HDFGRTR_EL2_PMSELR_EL0
>> +		| HDFGRTR_EL2_PMINTEN
>> +		| HDFGRTR_EL2_PMCNTEN
>> +		| HDFGRTR_EL2_PMCCNTR_EL0
>> +		| HDFGRTR_EL2_PMEVCNTRn_EL0;
>> +
>> +	update_fgt_traps_cs(hctxt, vcpu, kvm, HDFGRTR_EL2, clr, set);
>> +
>> +	set = HDFGWTR_EL2_PMOVS
>> +		| HDFGWTR_EL2_PMCCFILTR_EL0
>> +		| HDFGWTR_EL2_PMEVTYPERn_EL0;
>> +	clr = HDFGWTR_EL2_PMUSERENR_EL0
>> +		| HDFGWTR_EL2_PMCR_EL0
>> +		| HDFGWTR_EL2_PMSELR_EL0
>> +		| HDFGWTR_EL2_PMINTEN
>> +		| HDFGWTR_EL2_PMCNTEN
>> +		| HDFGWTR_EL2_PMCCNTR_EL0
>> +		| HDFGWTR_EL2_PMEVCNTRn_EL0;
>> +
>> +	update_fgt_traps_cs(hctxt, vcpu, kvm, HDFGWTR_EL2, clr, set);
>> +
>> +	if (!cpus_have_final_cap(ARM64_HAS_FGT2))
>> +		return;
>> +
>> +	set = HDFGRTR2_EL2_nPMICFILTR_EL0
>> +		| HDFGRTR2_EL2_nPMICNTR_EL0;
>> +	clr = 0;
>> +
>> +	update_fgt_traps_cs(hctxt, vcpu, kvm, HDFGRTR2_EL2, clr, set);
>> +
>> +	set = HDFGWTR2_EL2_nPMICFILTR_EL0
>> +		| HDFGWTR2_EL2_nPMICNTR_EL0;
>> +	clr = 0;
>> +
>> +	update_fgt_traps_cs(hctxt, vcpu, kvm, HDFGWTR2_EL2, clr, set);

> This feels wrong. There should be one place to populate the FGTs that
> apply to a guest as set from the host, not two or more.

> There is such a construct in the SME series, and maybe you could have
> a look at it, specially if the trap configuration is this static.

> 	M.

> --
> Without deviation from the norm, progress is not possible.

I'm assuming you are referring to Mark Brown's series [1], specifically
patches 5 and 18 and I see what you mean.

You are probably thinking configuration should happen from
sys_regs.c:kvm_calculate_traps or thereabout and should be setting bits
in the existing kvm->arch.fgt array.

Correct me if I'm mistaken.

[1]  
https://lore.kernel.org/kvm/20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org/

