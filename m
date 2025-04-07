Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF13C369A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irGaKVT9+XA4nCM/0Thqc3JUvEeLWJjpImy/ePnSuvw=; b=sPdf//z37LGvjq8gU2JWptsNwV
	YQLrwdU+/qegH3Cj58FqERI7IXMEA9MrG0z41NExiQbDqsw5Ok37pgdj9vljEwFgQ8AVFbTsPr7+R
	cjY6sIyaVsHcNDx9BEJSnVP9eksIN8KKmFicXYepy7dYkxTR38oo3pyqxoqgtC8XSaWnGWKa3mU7K
	8N0/siaP6PeTY1DjesFdWAt0AM2M8tkHrGfg92oZFPuIzuSOEqD6qQSsiKxY+uhZkzm17PW8K/cwS
	w+DlR7XVMyg7lebbrrTDxPuxik2iwNB6MBTEVjy/gUGbWnulI38iDm53wpPMZra0BO2vccrdLDMpF
	c6HEy0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYG-00000001chF-15up;
	Mon, 07 Apr 2025 18:50:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pQf-00000001EAw-2DkV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 16:34:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB54B106F;
	Mon,  7 Apr 2025 09:34:33 -0700 (PDT)
Received: from [10.57.17.31] (unknown [10.57.17.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6B343F694;
	Mon,  7 Apr 2025 09:34:28 -0700 (PDT)
Message-ID: <3b563b01-5090-4c9d-a47c-a0aaa13c474b@arm.com>
Date: Mon, 7 Apr 2025 17:34:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 18/45] arm64: RME: Handle RMI_EXIT_RIPAS_CHANGE
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
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
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <b89caaaf-3d26-4ca4-b395-08bf3f90dd1f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_093433_656598_9C56C5C9 
X-CRM114-Status: GOOD (  34.79  )
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

On 04/03/2025 04:35, Gavin Shan wrote:
> On 2/14/25 2:13 AM, Steven Price wrote:
>> The guest can request that a region of it's protected address space is
>> switched between RIPAS_RAM and RIPAS_EMPTY (and back) using
>> RSI_IPA_STATE_SET. This causes a guest exit with the
>> RMI_EXIT_RIPAS_CHANGE code. We treat this as a request to convert a
>> protected region to unprotected (or back), exiting to the VMM to make
>> the necessary changes to the guest_memfd and memslot mappings. On the
>> next entry the RIPAS changes are committed by making RMI_RTT_SET_RIPAS
>> calls.
>>
>> The VMM may wish to reject the RIPAS change requested by the guest. For
>> now it can only do with by no longer scheduling the VCPU as we don't
>> currently have a usecase for returning that rejection to the guest, but
>> by postponing the RMI_RTT_SET_RIPAS changes to entry we leave the door
>> open for adding a new ioctl in the future for this purpose.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> New patch for v7: The code was previously split awkwardly between two
>> other patches.
>> ---
>>   arch/arm64/kvm/rme.c | 87 ++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 87 insertions(+)
>>
> 
> With the following comments addressed:
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 
>> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
>> index 507eb4b71bb7..f965869e9ef7 100644
>> --- a/arch/arm64/kvm/rme.c
>> +++ b/arch/arm64/kvm/rme.c
>> @@ -624,6 +624,64 @@ void kvm_realm_unmap_range(struct kvm *kvm,
>> unsigned long start, u64 size,
>>           realm_unmap_private_range(kvm, start, end);
>>   }
>>   +static int realm_set_ipa_state(struct kvm_vcpu *vcpu,
>> +                   unsigned long start,
>> +                   unsigned long end,
>> +                   unsigned long ripas,
>> +                   unsigned long *top_ipa)
>> +{
>> +    struct kvm *kvm = vcpu->kvm;
>> +    struct realm *realm = &kvm->arch.realm;
>> +    struct realm_rec *rec = &vcpu->arch.rec;
>> +    phys_addr_t rd_phys = virt_to_phys(realm->rd);
>> +    phys_addr_t rec_phys = virt_to_phys(rec->rec_page);
>> +    struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
>> +    unsigned long ipa = start;
>> +    int ret = 0;
>> +
>> +    while (ipa < end) {
>> +        unsigned long next;
>> +
>> +        ret = rmi_rtt_set_ripas(rd_phys, rec_phys, ipa, end, &next);
>> +
> 
> This doesn't look correct to me. Looking at RMM::smc_rtt_set_ripas(),
> it's possible
> the SMC call is returned without updating 'next' to a valid address. In
> this case,
> the garbage content resident in 'next' can be used to updated to 'ipa'
> in next
> iternation. So we need to initialize it in advance, like below.
> 
>     unsigned long ipa = start;
>     unsigned long next = start;
> 
>     while (ipa < end) {
>         ret = rmi_rtt_set_ripas(rd_phys, rec_phys, ipa, end, &next);

I agree this might not be the clearest code, but 'next' should be set if
the return state is RMI_SUCCESS, and we don't actually get to the "ipa =
next" line unless that is the case. But I'll rejig things because it's
not clear.

>> +        if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
>> +            int walk_level = RMI_RETURN_INDEX(ret);
>> +            int level = find_map_level(realm, ipa, end);
>> +
>> +            /*
>> +             * If the RMM walk ended early then more tables are
>> +             * needed to reach the required depth to set the RIPAS.
>> +             */
>> +            if (walk_level < level) {
>> +                ret = realm_create_rtt_levels(realm, ipa,
>> +                                  walk_level,
>> +                                  level,
>> +                                  memcache);
>> +                /* Retry with RTTs created */
>> +                if (!ret)
>> +                    continue;
>> +            } else {
>> +                ret = -EINVAL;
>> +            }
>> +
>> +            break;
>> +        } else if (RMI_RETURN_STATUS(ret) != RMI_SUCCESS) {
>> +            WARN(1, "Unexpected error in %s: %#x\n", __func__,
>> +                 ret);
>> +            ret = -EINVAL;
> 
>             ret = -ENXIO;

Ack

>> +            break;
>> +        }
>> +        ipa = next;
>> +    }
>> +
>> +    *top_ipa = ipa;
>> +
>> +    if (ripas == RMI_EMPTY && ipa != start)
>> +        realm_unmap_private_range(kvm, start, ipa);
>> +
>> +    return ret;
>> +}
>> +
>>   static int realm_init_ipa_state(struct realm *realm,
>>                   unsigned long ipa,
>>                   unsigned long end)
>> @@ -863,6 +921,32 @@ void kvm_destroy_realm(struct kvm *kvm)
>>       kvm_free_stage2_pgd(&kvm->arch.mmu);
>>   }
>>   +static void kvm_complete_ripas_change(struct kvm_vcpu *vcpu)
>> +{
>> +    struct kvm *kvm = vcpu->kvm;
>> +    struct realm_rec *rec = &vcpu->arch.rec;
>> +    unsigned long base = rec->run->exit.ripas_base;
>> +    unsigned long top = rec->run->exit.ripas_top;
>> +    unsigned long ripas = rec->run->exit.ripas_value;
>> +    unsigned long top_ipa;
>> +    int ret;
>> +
> 
> Some checks are needed here to ensure the addresses (@base and @top)
> falls inside
> the protected (private) space for two facts: (1) Those parameters
> originates from
> the guest, which can be misbehaving. (2) RMM::smc_rtt_set_ripas() isn't
> limited to
> the private space, meaning it also can change RIPAS for the ranges in
> the shared
> space.

I might be missing something, but AFAICT this is safe:

 1. The RMM doesn't permit RIPAS changes within the shared space:
    RSI_IPA_STATE_SET has a precondition [rgn_bound]:
    AddrRangeIsProtected(base, top, realm)
    So a malicious guest shouldn't get passed the RMM.

 2. The RMM validates that the range passed here is (a subset of) the
    one provided to the NS-world [base_bound / top_bound].

And even if somehow a malicious guest managed to bypass these checks I
don't see how it would cause harm to the host operating on the wrong region.

I'm happy to be corrected though! What am I missing?

Thank,
Steve

>> +    do {
>> +        kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_page_cache,
>> +                       kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu));
>> +        write_lock(&kvm->mmu_lock);
>> +        ret = realm_set_ipa_state(vcpu, base, top, ripas, &top_ipa);
>> +        write_unlock(&kvm->mmu_lock);
>> +
>> +        if (WARN_RATELIMIT(ret && ret != -ENOMEM,
>> +                   "Unable to satisfy RIPAS_CHANGE for %#lx - %#lx,
>> ripas: %#lx\n",
>> +                   base, top, ripas))
>> +            break;
>> +
>> +        base = top_ipa;
>> +    } while (top_ipa < top);
>> +}
>> +
>>   int kvm_rec_enter(struct kvm_vcpu *vcpu)
>>   {
>>       struct realm_rec *rec = &vcpu->arch.rec;
>> @@ -873,6 +957,9 @@ int kvm_rec_enter(struct kvm_vcpu *vcpu)
>>           for (int i = 0; i < REC_RUN_GPRS; i++)
>>               rec->run->enter.gprs[i] = vcpu_get_reg(vcpu, i);
>>           break;
>> +    case RMI_EXIT_RIPAS_CHANGE:
>> +        kvm_complete_ripas_change(vcpu);
>> +        break;
>>       }
>>         if (kvm_realm_state(vcpu->kvm) != REALM_STATE_ACTIVE)
> 
> Thanks,
> Gavin
> 


