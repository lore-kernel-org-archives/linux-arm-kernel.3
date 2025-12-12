Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18C1D59F51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 22:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=kTtJNntNErDibGFF1qkwnsYLDpE8m9agPY4m5XiEmeI=; b=Mn9GxuHxvh3oNd
	0BKBOpY3+Ff5oCEfL/QiyQpESpglwIfsN176I/s2w8miih7h9/ishU3pOC29cYUjJCER+gqz3rqKA
	gH+q8q3o1LuagPNDk6iN3uubhSqsHKm6Gg6qysg5dlmO2LHd3/DqmnViH2mwy1hpdMF4VDvh/BfoS
	i7niIgXJH9y947KxzoS1jnnqKBqjj6v5p73yn0qqr+CtPWWj0qEN6sPsdGq0cqbFJwUMHIVFtJBJ3
	ysEsOZh92l/vFx2SsQqC4i7qLRKOJjlr88GY6P2hOw0+n7gAS+hCaOkBUJkfHvHNUEJk6yFC7TDzS
	uhOB8QILxcTVWK1NS+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUBaC-000000019nV-3fjo;
	Fri, 12 Dec 2025 22:25:52 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUBa6-000000019dO-3ail
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 22:25:49 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-65b342ac488so1405247eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 14:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765578345; x=1766183145; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kTtJNntNErDibGFF1qkwnsYLDpE8m9agPY4m5XiEmeI=;
        b=Eu9PyeRxY+JplgpwgJwt5b7A5aKBuRtwpqAyjgJiQHlV1eBY5NGyhcmMSTeLASC2oo
         AfuOtVJk6DBWwVpxkGM3ARSYBidz0YQUpUtmMobAJ14AqbtuF9MnlGjZKZqGZd5C8efA
         juCWu1/llxIHR+TDf5s1dXK3WGT84tesR4s7gSK5bX5rsO7k0o5hpzbgtyaHAcbY7Qp8
         IeoAfS7rk/TkgPNHyAM9M4mIGPQRXhQLgjTDSAcui+tEA8nENwMyAYtIHooIJ0nxNPL1
         IP2zypeMbcSaBC46+MIiYNYtihUP1PHW4TyEB78u1kugKZvEv/6AA8WUAC0Jryt0XmIH
         F2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765578345; x=1766183145;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kTtJNntNErDibGFF1qkwnsYLDpE8m9agPY4m5XiEmeI=;
        b=bA0bfpPzGhWuh5n5dFmTC64VjMWgJ8nPNXpVXO8nE8DAh7flZMBngm8mWg09dL0DZu
         sLP/2Mjeqt/HPtlh2s7Tl5DygaZ2/DYvOKBxIwQv0O/LVGtn55dNrDqZJFvyaA2FglOW
         coYDsJhGJpykdQ7J/SfH5ShCchC5fV8WNQ9kSl2lwebyWtSHZuajCsjR18sNvXL6cdn7
         ssvxH3IV68txgeUK7NfsIluGyiWe0NXlyvEkIWmDBekq5qIW079QxXADKEH5s4Qn9xVE
         xnbJ8nD0a/rKdb7vGsqqVNFBhAR/F8/Q+Y1atsOlIyuDOOiWZqS6P/i/fhhwx7L0u+2B
         AD5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXClpqljlsJPHOGapfThAfrfwntVMi4mjpXA850RfOrv75swscekwncMSUeb9CRmyv/hwfM+wRo1t2agnxqB+B2@lists.infradead.org
X-Gm-Message-State: AOJu0YxBo+pg0/qpag4W9sXK7Qy37D4SwUR6qS6OQdET5UTNMjhL7qJo
	R58rwfPmVFNTWqQqE28QBeI+8UaiFW3CZMi0jL/TcnJ5Y/1EM0VQhakjqBAd6dGREXlwiY3NCE6
	gGxgcSmEjRyI7CD0rllWe6FXBfA==
X-Google-Smtp-Source: AGHT+IGhwhSlHWOdHiYNzV9FksIu24P3urR9RfAnI9PHJHO/oofMWeWBwj21tpDMdRbsZ5qCySgnl+QY1Z9IQMTNWA==
X-Received: from ioyp8.prod.google.com ([2002:a05:6602:3048:b0:948:6160:f5b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:a05:b0:659:9a49:8e64 with SMTP id 006d021491bc7-65b45253071mr1578654eaf.52.1765578344930;
 Fri, 12 Dec 2025 14:25:44 -0800 (PST)
Date: Fri, 12 Dec 2025 22:25:44 +0000
In-Reply-To: <aTidfRwYLYwTfmK_@kernel.org> (message from Oliver Upton on Tue,
 9 Dec 2025 14:06:53 -0800)
Mime-Version: 1.0
Message-ID: <gsntecoz2v87.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 19/24] KVM: arm64: Implement lazy PMU context swaps
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_142547_066289_37CF2B25 
X-CRM114-Status: GOOD (  21.91  )
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

Oliver Upton <oupton@kernel.org> writes:

> On Tue, Dec 09, 2025 at 08:51:16PM +0000, Colton Lewis wrote:
>> +enum vcpu_pmu_register_access {
>> +	VCPU_PMU_ACCESS_UNSET,
>> +	VCPU_PMU_ACCESS_VIRTUAL,
>> +	VCPU_PMU_ACCESS_PHYSICAL,
>> +};

> This is confusing. Even when the guest is accessing registers directly
> on the CPU I'd still call that "hardware assisted virtualization" and
> not "physical".

It was what I thought described the access pattern. Do you have another
naming suggestion?

>> +#endif /* _ASM_ARM64_KVM_TYPES_H */
>> diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
>> index 0ab89c91e19cb..c2cf6b308ec60 100644
>> --- a/arch/arm64/kvm/debug.c
>> +++ b/arch/arm64/kvm/debug.c
>> @@ -34,7 +34,7 @@ static int cpu_has_spe(u64 dfr0)
>>    *  - Self-hosted Trace Filter controls (MDCR_EL2_TTRF)
>>    *  - Self-hosted Trace (MDCR_EL2_TTRF/MDCR_EL2_E2TB)
>>    */
>> -static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
>> +void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
>>   {
>>   	int hpmn = kvm_pmu_hpmn(vcpu);

>> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h  
>> b/arch/arm64/kvm/hyp/include/hyp/switch.h
>> index bde79ec1a1836..ea288a712bb5d 100644
>> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
>> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
>> @@ -963,6 +963,8 @@ static bool kvm_hyp_handle_pmu_regs(struct kvm_vcpu  
>> *vcpu)
>>   	if (ret)
>>   		__kvm_skip_instr(vcpu);

>> +	kvm_pmu_set_physical_access(vcpu);
>> +
>>   	return ret;
>>   }

>> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
>> index 8d0d6d1a0d851..c5767e2ebc651 100644
>> --- a/arch/arm64/kvm/pmu-direct.c
>> +++ b/arch/arm64/kvm/pmu-direct.c
>> @@ -73,6 +73,7 @@ bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
>>   	u8 hpmn = vcpu->kvm->arch.nr_pmu_counters;

>>   	return kvm_vcpu_pmu_is_partitioned(vcpu) &&
>> +		vcpu->arch.pmu.access == VCPU_PMU_ACCESS_PHYSICAL &&
>>   		cpus_have_final_cap(ARM64_HAS_FGT) &&
>>   		(hpmn != 0 || cpus_have_final_cap(ARM64_HAS_HPMN0));
>>   }
>> @@ -92,6 +93,26 @@ u64 kvm_pmu_fgt2_bits(void)
>>   		| HDFGRTR2_EL2_nPMICNTR_EL0;
>>   }

>> +/**
>> + * kvm_pmu_set_physical_access()
>> + * @vcpu: Pointer to vcpu struct
>> + *
>> + * Reconfigure the guest for physical access of PMU hardware if
>> + * allowed. This means reconfiguring mdcr_el2 and loading the vCPU
>> + * state onto hardware.
>> + *
>> + */
>> +
>> +void kvm_pmu_set_physical_access(struct kvm_vcpu *vcpu)
>> +{
>> +	if (kvm_vcpu_pmu_is_partitioned(vcpu)
>> +	    && vcpu->arch.pmu.access == VCPU_PMU_ACCESS_VIRTUAL) {
>> +		vcpu->arch.pmu.access = VCPU_PMU_ACCESS_PHYSICAL;
>> +		kvm_arm_setup_mdcr_el2(vcpu);
>> +		kvm_pmu_load(vcpu);
>> +	}

> It isn't immediately obvious how this guards against preemption.

> Also, the general approach for these context-loading situations is to do
> a full load/put on the vCPU rather than a directed load.

Understood. Will fix.

>> +static void kvm_pmu_register_init(struct kvm_vcpu *vcpu)
>> +{
>> +	if (vcpu->arch.pmu.access == VCPU_PMU_ACCESS_UNSET)
>> +		vcpu->arch.pmu.access = VCPU_PMU_ACCESS_VIRTUAL;

> This is confusing. The zero value of the enum should be consistent with
> the "unloaded" state.

That's the way I initially wrote it but it had a problem on a different
kernel. I forget the exact issue, but I never saw the problem on
upstream so I'm happy to go back to it.

>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index f2ae761625a66..d73218706b834 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -1197,6 +1197,8 @@ static bool access_pmu_evtyper(struct kvm_vcpu  
>> *vcpu, struct sys_reg_params *p,
>>   		p->regval = __vcpu_sys_reg(vcpu, reg);
>>   	}

>> +	kvm_pmu_set_physical_access(vcpu);
>> +
>>   	return true;
>>   }

>> @@ -1302,6 +1304,8 @@ static bool access_pmovs(struct kvm_vcpu *vcpu,  
>> struct sys_reg_params *p,
>>   		p->regval = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
>>   	}

>> +	kvm_pmu_set_physical_access(vcpu);
>> +
>>   	return true;
>>   }

> Aren't there a ton of other registers the guest may access before
> these two? Having generic PMU register accessors would allow you to
> manage residence of PMU registers from a single spot.

Yes but these are the only two that use the old trap handlers. I also
call set_physical_access from my fast path handler that handles all the
other registers when partitioned.

Agree on having some generic accessors which you mention in an earlier
patch.

