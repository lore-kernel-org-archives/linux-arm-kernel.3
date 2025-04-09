Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DF9C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 00:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNddaKzNbdSe+8ksA8KcJkLM4w4kGgEVBgKegQ6RNTI=; b=39tS8mhZtH42ZpOWnP/rkp7GKv
	1iXDgmsu8thhHAPAjZx7wg9JIqxjqf5hdqfKcp8nYW+qVX4dz3MdeNfPO+gEy+4aetags4MMDckAx
	ROcZXTQXf/WGmb0UhKzZQPeHo2JkZ33rV2esqoj5JegtNAx0tyBIBTrJ11WrhYOtc+74OPBK2SipF
	D/1nBlzR7eukuV5x+jnMJqbuhH+hDtKNzgh5Q5v2T+m/fQ+Ly4MUd4lAxKg3UrGTBM/4bVBhSlqhN
	uOYGZ0O9lKQsTJiEhYcO4QrxN5lLlLxrBWd/41Q5tuHPplyquakYiXM5HMbCYM/nhoqcRrTCG4g07
	YgGzQ4/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2JDd-00000005lp8-1JGY;
	Wed, 09 Apr 2025 00:23:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2J4n-00000005l2u-2aTA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 00:13:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744157636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNddaKzNbdSe+8ksA8KcJkLM4w4kGgEVBgKegQ6RNTI=;
	b=g5/aCN2I6s4TCf4OCCX/aco/fq7V/ZzIswAlvY1gp+w0ucdhR8nFo5QKL3zOsrXTAL+cnQ
	PeJ3H6SP18+fLBZigCtQp2n4U/nn31TsE/sRkFmY/7U512zWbtkUe3SnnMIqGVjwCepmMp
	2FmTjOnWsj/40w3YMiSTAuoD1+ERlhk=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-xrJE-vnIOqO3G0v56nR_Ug-1; Tue, 08 Apr 2025 20:13:52 -0400
X-MC-Unique: xrJE-vnIOqO3G0v56nR_Ug-1
X-Mimecast-MFC-AGG-ID: xrJE-vnIOqO3G0v56nR_Ug_1744157632
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2242ade807fso97481085ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 17:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744157632; x=1744762432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bNddaKzNbdSe+8ksA8KcJkLM4w4kGgEVBgKegQ6RNTI=;
        b=kGV+C6tkDRmaIvVquNOOkUwEa5GcXXxV9uJgayfpkNMryEGkpqPpxe96FXLjqSapMO
         eV/BP8NxzaWrvwiOenrXzfxRZ031e0Mb1/WJdm+ZHEvSbUdk0hsKDd2Dv2rynGIWzHxi
         w5lZiNB0b3zN5+/QdijUvTKeeb3iOeUZz33Q1l/joJQkhuRM0OA5jd70qW1eN146qEBz
         Mv1jACrAfIhS73gNH/FzMBLuP81Ca71oGp46eSXGySheonNmoRueREBkiOrwZH48p5sp
         NtWS2aQlYQz85STCNY7SbamubIW4R5gaH/xm6UlUNWwgqpU2k0S8ADiY+EDGxJw/8Qfe
         TyHg==
X-Forwarded-Encrypted: i=1; AJvYcCU3xA3FuAcayP+dchB4M07RCEBPLXlZWynXG6KlhtLi3fmZZSQ6aU3YSXI5UJZCP7SU4+6FZQAQL/AyF0pC5iaR@lists.infradead.org
X-Gm-Message-State: AOJu0YxOwGpA5/mLqGkFYm29PjosVH3EEFbH4cVGIhsDnKEaQoh1pAC1
	sUw9/ZOAqNfe/4nZ/vkWqq5rkauoNq4SGFGxxPvAi4mHH4o7/yZuZyAzrx5H7sIfhGqPG5Xhale
	aDaZRetFqnsBOFFeHdFabXbVWmUdx1F1zZkuAPOc/2zuhTZCRuRUwEOvMBq7oFTAc6z63kADU
X-Gm-Gg: ASbGnctlbfqncSX0zaPBucVgvsOoSDdOWiGnJzU0yFLfzYJ30grS0i7fsz8DPIv5UNE
	GmQwhRmSjjiaIFeq0CQot2kAlEi8AOMHhc+HRciyHye5Hr53tQuxHKqm+AWZSASl/zHOKe20HtM
	RXih1RJsvjZPEo6nh6SWdizufnxtFmJYM8NadOuGdmC3DYTFciiZ/ybFTK3NARDgZbtxUnW8wCs
	z8MHa3NWUx4ZKBQ66o76MvnQBAkd0EAV8XJaLSH2tis4PBPO09c7YNxdSLeuGvvWXEZm4V30uMC
	BwVA48X9oj4IMpuY
X-Received: by 2002:a17:902:f610:b0:21b:b3c9:38ff with SMTP id d9443c01a7336-22ac2a1a6abmr15803075ad.37.1744157631548;
        Tue, 08 Apr 2025 17:13:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq+iQbZRk3CBUAHj/H45YzBC+2eopn/nHrs+gAR5sUafqXx8zvscTJMIOvv07DM2mbfcEtQA==
X-Received: by 2002:a17:902:f610:b0:21b:b3c9:38ff with SMTP id d9443c01a7336-22ac2a1a6abmr15802675ad.37.1744157631156;
        Tue, 08 Apr 2025 17:13:51 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0dea8fsm11215481b3a.157.2025.04.08.17.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 17:13:50 -0700 (PDT)
Message-ID: <f87fa539-9abd-4a7e-8ce6-9515f26bed71@redhat.com>
Date: Wed, 9 Apr 2025 10:13:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 18/45] arm64: RME: Handle RMI_EXIT_RIPAS_CHANGE
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-19-steven.price@arm.com>
 <b89caaaf-3d26-4ca4-b395-08bf3f90dd1f@redhat.com>
 <3b563b01-5090-4c9d-a47c-a0aaa13c474b@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <3b563b01-5090-4c9d-a47c-a0aaa13c474b@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yZctkEWwPBrogRU_bUPerVAUeZMMh9W1wwXF0i2e3-A_1744157632
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_171357_822594_A3846034 
X-CRM114-Status: GOOD (  37.78  )
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

Hi Steve,

On 4/8/25 2:34 AM, Steven Price wrote:
> On 04/03/2025 04:35, Gavin Shan wrote:
>> On 2/14/25 2:13 AM, Steven Price wrote:
>>> The guest can request that a region of it's protected address space is
>>> switched between RIPAS_RAM and RIPAS_EMPTY (and back) using
>>> RSI_IPA_STATE_SET. This causes a guest exit with the
>>> RMI_EXIT_RIPAS_CHANGE code. We treat this as a request to convert a
>>> protected region to unprotected (or back), exiting to the VMM to make
>>> the necessary changes to the guest_memfd and memslot mappings. On the
>>> next entry the RIPAS changes are committed by making RMI_RTT_SET_RIPAS
>>> calls.
>>>
>>> The VMM may wish to reject the RIPAS change requested by the guest. For
>>> now it can only do with by no longer scheduling the VCPU as we don't
>>> currently have a usecase for returning that rejection to the guest, but
>>> by postponing the RMI_RTT_SET_RIPAS changes to entry we leave the door
>>> open for adding a new ioctl in the future for this purpose.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> New patch for v7: The code was previously split awkwardly between two
>>> other patches.
>>> ---
>>>    arch/arm64/kvm/rme.c | 87 ++++++++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 87 insertions(+)
>>>
>>
>> With the following comments addressed:
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>
>>> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
>>> index 507eb4b71bb7..f965869e9ef7 100644
>>> --- a/arch/arm64/kvm/rme.c
>>> +++ b/arch/arm64/kvm/rme.c
>>> @@ -624,6 +624,64 @@ void kvm_realm_unmap_range(struct kvm *kvm,
>>> unsigned long start, u64 size,
>>>            realm_unmap_private_range(kvm, start, end);
>>>    }
>>>    +static int realm_set_ipa_state(struct kvm_vcpu *vcpu,
>>> +                   unsigned long start,
>>> +                   unsigned long end,
>>> +                   unsigned long ripas,
>>> +                   unsigned long *top_ipa)
>>> +{
>>> +    struct kvm *kvm = vcpu->kvm;
>>> +    struct realm *realm = &kvm->arch.realm;
>>> +    struct realm_rec *rec = &vcpu->arch.rec;
>>> +    phys_addr_t rd_phys = virt_to_phys(realm->rd);
>>> +    phys_addr_t rec_phys = virt_to_phys(rec->rec_page);
>>> +    struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
>>> +    unsigned long ipa = start;
>>> +    int ret = 0;
>>> +
>>> +    while (ipa < end) {
>>> +        unsigned long next;
>>> +
>>> +        ret = rmi_rtt_set_ripas(rd_phys, rec_phys, ipa, end, &next);
>>> +
>>
>> This doesn't look correct to me. Looking at RMM::smc_rtt_set_ripas(),
>> it's possible
>> the SMC call is returned without updating 'next' to a valid address. In
>> this case,
>> the garbage content resident in 'next' can be used to updated to 'ipa'
>> in next
>> iternation. So we need to initialize it in advance, like below.
>>
>>      unsigned long ipa = start;
>>      unsigned long next = start;
>>
>>      while (ipa < end) {
>>          ret = rmi_rtt_set_ripas(rd_phys, rec_phys, ipa, end, &next);
> 
> I agree this might not be the clearest code, but 'next' should be set if
> the return state is RMI_SUCCESS, and we don't actually get to the "ipa =
> next" line unless that is the case. But I'll rejig things because it's
> not clear.
> 

Yes, 'next' is always updated when RMI_SUCCESS is returned. However, 'next'
won't be updated when RMI_ERROR_RTT is returned. I've overlooked the code,
when RMI_ERROR_RTT is returned for the first iteration, 'ipa' is kept as
intact and the 'ipa' is retried after stage2 page-table is populated. So
everything should be fine.

>>> +        if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
>>> +            int walk_level = RMI_RETURN_INDEX(ret);
>>> +            int level = find_map_level(realm, ipa, end);
>>> +
>>> +            /*
>>> +             * If the RMM walk ended early then more tables are
>>> +             * needed to reach the required depth to set the RIPAS.
>>> +             */
>>> +            if (walk_level < level) {
>>> +                ret = realm_create_rtt_levels(realm, ipa,
>>> +                                  walk_level,
>>> +                                  level,
>>> +                                  memcache);
>>> +                /* Retry with RTTs created */
>>> +                if (!ret)
>>> +                    continue;
>>> +            } else {
>>> +                ret = -EINVAL;
>>> +            }
>>> +
>>> +            break;
>>> +        } else if (RMI_RETURN_STATUS(ret) != RMI_SUCCESS) {
>>> +            WARN(1, "Unexpected error in %s: %#x\n", __func__,
>>> +                 ret);
>>> +            ret = -EINVAL;
>>
>>              ret = -ENXIO;
> 
> Ack
> 
>>> +            break;
>>> +        }
>>> +        ipa = next;
>>> +    }
>>> +
>>> +    *top_ipa = ipa;
>>> +
>>> +    if (ripas == RMI_EMPTY && ipa != start)
>>> +        realm_unmap_private_range(kvm, start, ipa);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>>    static int realm_init_ipa_state(struct realm *realm,
>>>                    unsigned long ipa,
>>>                    unsigned long end)
>>> @@ -863,6 +921,32 @@ void kvm_destroy_realm(struct kvm *kvm)
>>>        kvm_free_stage2_pgd(&kvm->arch.mmu);
>>>    }
>>>    +static void kvm_complete_ripas_change(struct kvm_vcpu *vcpu)
>>> +{
>>> +    struct kvm *kvm = vcpu->kvm;
>>> +    struct realm_rec *rec = &vcpu->arch.rec;
>>> +    unsigned long base = rec->run->exit.ripas_base;
>>> +    unsigned long top = rec->run->exit.ripas_top;
>>> +    unsigned long ripas = rec->run->exit.ripas_value;
>>> +    unsigned long top_ipa;
>>> +    int ret;
>>> +
>>
>> Some checks are needed here to ensure the addresses (@base and @top)
>> falls inside
>> the protected (private) space for two facts: (1) Those parameters
>> originates from
>> the guest, which can be misbehaving. (2) RMM::smc_rtt_set_ripas() isn't
>> limited to
>> the private space, meaning it also can change RIPAS for the ranges in
>> the shared
>> space.
> 
> I might be missing something, but AFAICT this is safe:
> 
>   1. The RMM doesn't permit RIPAS changes within the shared space:
>      RSI_IPA_STATE_SET has a precondition [rgn_bound]:
>      AddrRangeIsProtected(base, top, realm)
>      So a malicious guest shouldn't get passed the RMM.
> 
>   2. The RMM validates that the range passed here is (a subset of) the
>      one provided to the NS-world [base_bound / top_bound].
> 
> And even if somehow a malicious guest managed to bypass these checks I
> don't see how it would cause harm to the host operating on the wrong region.
> 
> I'm happy to be corrected though! What am I missing?
> 

No, you don't miss anything, I did. I missed that the requested address range
is ensured to be part of the private space by RMM::handle_rsi_ipa_state_set().
So everything should be fine.

void handle_rsi_ipa_state_set(struct rec *rec,
                               struct rmi_rec_exit *rec_exit,
                               struct rsi_result *res)
{
         :
         if ((ripas_val > RIPAS_RAM) ||
             !GRANULE_ALIGNED(base)  || !GRANULE_ALIGNED(top) ||
             (top <= base)           || /* Size is zero, or range overflows */
             !region_in_rec_par(rec, base, top)) {
                 res->action = UPDATE_REC_RETURN_TO_REALM;
                 res->smc_res.x[0] = RSI_ERROR_INPUT;
                 return;
         }
         :
}


> Thank,
> Steve
> 
>>> +    do {
>>> +        kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_page_cache,
>>> +                       kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu));
>>> +        write_lock(&kvm->mmu_lock);
>>> +        ret = realm_set_ipa_state(vcpu, base, top, ripas, &top_ipa);
>>> +        write_unlock(&kvm->mmu_lock);
>>> +
>>> +        if (WARN_RATELIMIT(ret && ret != -ENOMEM,
>>> +                   "Unable to satisfy RIPAS_CHANGE for %#lx - %#lx,
>>> ripas: %#lx\n",
>>> +                   base, top, ripas))
>>> +            break;
>>> +
>>> +        base = top_ipa;
>>> +    } while (top_ipa < top);
>>> +}
>>> +
>>>    int kvm_rec_enter(struct kvm_vcpu *vcpu)
>>>    {
>>>        struct realm_rec *rec = &vcpu->arch.rec;
>>> @@ -873,6 +957,9 @@ int kvm_rec_enter(struct kvm_vcpu *vcpu)
>>>            for (int i = 0; i < REC_RUN_GPRS; i++)
>>>                rec->run->enter.gprs[i] = vcpu_get_reg(vcpu, i);
>>>            break;
>>> +    case RMI_EXIT_RIPAS_CHANGE:
>>> +        kvm_complete_ripas_change(vcpu);
>>> +        break;
>>>        }
>>>          if (kvm_realm_state(vcpu->kvm) != REALM_STATE_ACTIVE)
>>

Thanks,
Gavin


