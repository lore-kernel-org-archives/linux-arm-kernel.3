Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B83CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 22:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BX1nDoHfY9wIaK7n+kTY5G9GqR52mFVKGv7vDMVDhYE=; b=4hAUh5ZMd3iasR95SzqX0V/BfT
	AHPBllIisvPNf3+9UU5852KfEFFwS4pN3e9P86xB7bz8Ky21tScKn7aHcWJpc/2ionmWvoiYVn9gZ
	ZSt93sZxW+fdDI9KQmPdqImwwiY/zyckmlICBtzof1fGHe4iSIihXRulUbLx7AjcHxuQPKxQLYpND
	bYhn3J3eggO5vApEldZJ1GCWmAoP+9eVoUaikMbyrBUM1I4gYuzAzQaBwBofx+GdL0RYAwNTM/mEJ
	gxylDcLx/+RujGrAEm97eqjwgJ7wPq1jk/3BjLBSu5f3SLjH/nxvoYr3H42Z4u56v/uDBAi3NMEep
	mk1vpW4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEDDj-00000001Qku-2hAk;
	Tue, 06 Oct 2026 22:01:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEDDh-00000001QkZ-1RWD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 22:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791324067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BX1nDoHfY9wIaK7n+kTY5G9GqR52mFVKGv7vDMVDhYE=;
	b=NXyzRBp1ckiIDcObA5THYAq6MH+VihOJAsMvUdk8x9OH50qv7dx1/X64naQFIUkwJbKDF3
	Gt9ZZoO2SifkkEvsai+++Zo8phWSJJH5NCopVSMuRr9fTxAZQaQwxth1LXeUKbF6qpnJ9W
	Y1Co1I4RAnkJhAFkEdKzNkyKGz0C/5Y=
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com
 [74.125.82.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-T5zNeQlPPmSc_mjbk8J4YQ-1; Tue, 06 Oct 2026 18:01:06 -0400
X-MC-Unique: T5zNeQlPPmSc_mjbk8J4YQ-1
X-Mimecast-MFC-AGG-ID: T5zNeQlPPmSc_mjbk8J4YQ_1791324065
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso6962202c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 15:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791324065; x=1791928865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BX1nDoHfY9wIaK7n+kTY5G9GqR52mFVKGv7vDMVDhYE=;
        b=ySoXfa48smNfqQMVYKkaOknnxxPaO/dqVjc839Ouic8xnJKKxAZBwpFQi/ycH9S8QG
         RM6ZPtf5WMoqBXxJRlW7RPiyNtms/zVm8SLx/f7X+NG+gVoaHmraTtWzH3NnQTliznbv
         z/xsFzDhWLlZUXdlDiKWWSrOuBxBg025Al2e8eKSig64R3oJqS9fGNxSRhMiHfAwrsNp
         l2cFa1GzXWeGlfviXXVHIU0gboLMbuUf/Uil9GqcH0UqGXItBNSP3EfDpp5C4mpGqJrK
         uyZcRGTkaiqZWrHSM5HoqvAZbwL2juwiwGs05qKW/NEGuxYE7ED9z1M9WQVl5SUuloZS
         B2sQ==
X-Forwarded-Encrypted: i=1; AKwUvByJ0slI5AJ15Ylv5I+XO5Tfovh5yjQ+g4AOGZi2atzZ5DI6OVXpURJhv4o6w4uXu2eL9COyhhmxofJqFFXuRpiJ@lists.infradead.org
X-Gm-Message-State: AFuF++ksOWYBQx6Q9951bGiEU6PBdRRD8EpO4L/TYxS9vxxvtFnDF2iO
	/Pk2hAeZWU7NBYOsX/bkANJxA4AwwtpLOhQKXtiKS++pf9hB7r/4rcClB3xN2N05Y9R4Ny4tCAS
	62p34CAdiWeHFYzSK5QLyVV4U8gP0tNFz5HWX+oMQf4lBrCtKOa5pg0jUhqh4vJCI5ljK37mL2J
	BW
X-Gm-Gg: AYBFou0ANc5HrozF//YnWgARmGIPguQFsQMhnoZWJSd1DLueSPvIdzdh9CIV0xvjciy
	SDmFJc8Hp3V3FV6hm5z0VvMkZALYbhyuXgmPlzcDhJgjTy6FV/nq/9wMjJNTI3sjqhbwNf4YREv
	7ZvJhl/DNgNtmge3/Q16DKJFRYLzBbk0HYufnOBhdPALJdIaxDOpwLRTiAdMePPqjEQLDyjrn2B
	vwK5YRl9dC4K374sXABExot6b+EZW3N8V+BCtapjcu3XvvGh9pVLBF4Yd/YbfH1YhRjiWmfFTl+
	/0yJL4fgDOZm293OdY5/tpn1iJ2+k/Mmawo9bmibOo2cFMoH0qeirqGZcQfFlJ8v27edhT1zzQC
	aaZaBSB1jXS6DgEEjRmB3B90T5x5p7wFQPUa+ksiyhA==
X-Received: by 2002:a05:701b:2618:b0:145:7a:7765 with SMTP id a92af1059eb24-162092950d9mr130473c88.36.1791324064796;
        Tue, 06 Oct 2026 15:01:04 -0700 (PDT)
X-Received: by 2002:a05:701b:2618:b0:145:7a:7765 with SMTP id a92af1059eb24-162092950d9mr130376c88.36.1791324062351;
        Tue, 06 Oct 2026 15:01:02 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16167463910sm1401330c88.9.2026.10.06.15.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 15:01:01 -0700 (PDT)
Message-ID: <e854517f-b364-4c64-b542-7546afadbda3@redhat.com>
Date: Wed, 7 Oct 2026 08:00:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 23/23] KVM: arm64: CCA: Control user register access
 for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-24-suzuki.poulose@arm.com>
 <52e3e45a-751e-40b2-8dd3-3db589ddebee@redhat.com>
 <7b6ed626-eca4-41f2-ae56-0af59a931b29@arm.com>
 <6bd785aa-4693-407d-b70a-39b1d0eda63e@redhat.com>
 <71ceb680-e168-450e-99e0-7a8cf4160bba@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <71ceb680-e168-450e-99e0-7a8cf4160bba@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FC1xEQ0Ct-RtmUZ5vFA_0_GwSoddnpY7TFkjyXDhe5k_1791324065
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_150109_467715_23FB2D82 
X-CRM114-Status: GOOD (  22.94  )
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

On 10/6/26 10:36 PM, Suzuki K Poulose wrote:
> On 06/10/2026 07:16, Gavin Shan wrote:
>> On 10/6/26 4:01 PM, Suzuki K Poulose wrote:
>>> On 06/10/2026 06:47, Gavin Shan wrote:
>>>> On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
>>>>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>>>>
>>>>> The RMM restricts the access to the register states that the host can
>>>>> read/modify for a given Realm.
>>>>>
>>>>> e.g., At VCPU creation, can modify GPRS (x0-x30) and PC.
>>>>>        While servicing SMCCC calls via RSI_HOST_CALL or servicing PSCI
>>>>>        requests.
>>>>>        MMIO emulation in the unprotected space.
>>>>>
>>>>> Additionally we use the sysreg configuration to advertise/configure the
>>>>> following Realm parameters, which are required before the Realm Descriptor
>>>>> is created:
>>>>>   - SVE Vector Length
>>>>>   - Number of HW Breakpoints/Watchpoints
>>>>>   - PMU Counters.
>>>>>
>>>>> Thus KVM also additionally allows access to ID_AA64DFR0_EL1 and SVE_VLS for
>>>>> the configuration of Realm creation parameters. We don't support PMUs for
>>>>> the Realm VMs yet, so PMCR is not exposed.
>>>>>
>>>>> The RMM makes similar restrictions for reading of the guest's registers
>>>>> (this is *confidential* compute after all), however we don't impose the
>>>>> restriction here. This allows the VMM to read (stale) values from the
>>>>> registers which might be useful to read back the initial values even if
>>>>> the RMM doesn't provide the latest version. For migration of a realm VM,
>>>>> a new interface will be needed so that the VMM can receive an
>>>>> (encrypted) blob of the VM's state.
>>>>>
>>>>> Reflect the above in KVM_GET_REG_LIST, KVM_SET_ONE_REG calls.
>>>
>>>>>   static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
>>>>>   {
>>>>>       int size;
>>>>> @@ -553,6 +572,9 @@ static int copy_core_reg_indices(const struct kvm_vcpu *vcpu,
>>>>>           u64 reg = KVM_REG_ARM64 | KVM_REG_ARM_CORE | i;
>>>>>           int size = core_reg_size_from_offset(vcpu, i);
>>>>> +        if (vcpu_is_rec(vcpu) && !kvm_realm_validate_core_reg(i))
>>>>> +            continue;
>>>>> +
>>>>>           if (size < 0)
>>>>>               continue;
>>>>> @@ -598,6 +620,9 @@ static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
>>>>>       if (!vcpu_has_sve(vcpu))
>>>>>           return 0;
>>>>> +    if (kvm_vm_is_realm(vcpu->kvm))
>>>>> +        return 1; /* KVM_REG_ARM64_SVE_VLS */
>>>>> +
> 
> This could be vcpu_is_rec().

vcpu_is_rec() is preferred here.

>>>>>       if (!kvm_arm_vcpu_sve_finalized(vcpu))
>>>>>           return 1; /* KVM_REG_ARM64_SVE_VLS */
>>>>>
>>>>
>>>> Aren't above two checks conflicting to each other?
>>>
>>> Do they? We allow SVE_VLS only for the Realms and we allow that
>>> before the vCPUs are finalized. For normal VMs, depending on
>>> whether the vcpus are finalized, we either send 1 or the full list.
>>>
>>
>> num_sve_regs() can be called for 3 cases: (a) non-finalized RECs; (b) finalized
>> RECs; (c) Other finalized vCPUs, correct? "if (kvm_vm_is_realm(vcpu-  >kvm))", which
>> would be "if (vcpu_is_rec(vcpu))", covers (a) and (b). We needn't the excessive
>> check "if (!kvm_arm_vcpu_sve_finalized(vcpu))". So the check would be something
>> as below after this series is applied:
>>
>>      /*
>>       * KVM_REG_ARM64_SVE_VLS is visible on realm vCPU no matter if it
>>       * has been finalized.
>>       */
>>      if (vcpu_is_rec(vcpu))
>>          return 1;
>>
>> This check "if (vcpu_is_rec(vcpu))" belongs to PATCH[22]. Hope I make myself
>> clear this time :)
> 
> Sure, these two patches are closely related and may be even could be
> folded in. I split it out to make it easier to review.
> 
> 22: Allow exposing SVE_VLS for unfinalized VCPU RECs
> 23: Control register accesses includingthe SVE_VLS, but prevent
> everything else
> 
> Does it help ?
> 

I would suggest to fold PATCH[22] into PATCH[23].

Thanks,
Gavin

> Cheers
> Suzuki
> 
> 
>>
>>>>
>>>>> @@ -625,6 +650,10 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
>>>>>           return -EFAULT;
>>>>>       ++num_regs;
>>>>> +    /* For Realms only support SVE_VLS */
>>>>> +    if (kvm_vm_is_realm(vcpu->kvm))
>>>>> +        return num_regs;
>>>>> +
>>>>>       if (!kvm_arm_vcpu_sve_finalized(vcpu))
>>>>>           return num_regs;
>>>>
>>>> Same question here.
>>>
>>> As above.
>>>
>>> Suzuki
>>
>> Thanks,
>> Gavin
>>
> 


