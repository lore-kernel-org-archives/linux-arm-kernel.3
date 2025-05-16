Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A857EC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 14:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2EhZ3pJ/JwPlcrAeoyW+hiLBhB9l682Fgfw6iZC+EY=; b=BN9D0jdXx+UVIGZPq2L8gcqlpA
	e229utUpKoDDpt1Jrjrb6l7WhVrjEkJgBSOv+AA8R9K0XX7cN+k87lmL/RAIUOTKt+JHdgveHvCbw
	1W1Zmt2SVLeM1/PNl0VQ2ndWOb1sOJFW29caE+yCNOp29bXbZjMFJxjaSXSvTGhHIsjFD288Ci1mn
	CfxDufeN1gh3UAc9gyppqgg48OUYQDL78LxNPOsFjnvH4XW5jBueFbynVAc0aJMRbPUNorMzYAyxO
	NeYbMCjMZ04Ny6Hn5ErikA3SD5os5hGWd768QZFTvuUtsJw5Gj6j0uqmfteZFCULlnj+JWAjt202s
	OjSetqKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwD0-00000003gsp-24Ag;
	Fri, 16 May 2025 14:38:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvSC-00000003a1Y-16uE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:50:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB252169C;
	Fri, 16 May 2025 06:50:09 -0700 (PDT)
Received: from [10.1.27.17] (e122027.cambridge.arm.com [10.1.27.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73A8F3F673;
	Fri, 16 May 2025 06:50:17 -0700 (PDT)
Message-ID: <31bf9eac-a234-44dd-a4a3-0939092da66a@arm.com>
Date: Fri, 16 May 2025 14:50:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 17/43] arm64: RME: Handle RMI_EXIT_RIPAS_CHANGE
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
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-18-steven.price@arm.com>
 <b5770d9b-4f17-4be8-95a7-1549322debb2@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <b5770d9b-4f17-4be8-95a7-1549322debb2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_065024_399289_A684DDDD 
X-CRM114-Status: GOOD (  28.77  )
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

On 30/04/2025 13:11, Gavin Shan wrote:
> On 4/16/25 11:41 PM, Steven Price wrote:
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
>> Changes since v7:
>>   * Rework the loop in realm_set_ipa_state() to make it clear when the
>>     'next' output value of rmi_rtt_set_ripas() is used.
>> New patch for v7: The code was previously split awkwardly between two
>> other patches.
>> ---
>>   arch/arm64/kvm/rme.c | 88 ++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 88 insertions(+)
>>
> 
> One nitpick below, either way:
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 
>> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
>> index bee9dfe12e03..fe0d5b8703d2 100644
>> --- a/arch/arm64/kvm/rme.c
>> +++ b/arch/arm64/kvm/rme.c
>> @@ -624,6 +624,65 @@ void kvm_realm_unmap_range(struct kvm *kvm,
>> unsigned long start,
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
>> +        if (RMI_RETURN_STATUS(ret) == RMI_SUCCESS) {
>> +            ipa = next;
>> +        } else if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
> 
> --->
> 
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
> 
> <--- This block of code have been existing in multiple functions. I guess
> it would be worthy to introduce a helper for it if you agree.
> Alternatively,
> it's definitely something to do in the future, after this series is
> merged :)

I believe it's just two functions: realm_set_ipa_state() and
realm_init_ipa_state(). Those two functions are going basically the same
thing just at different stages (realm_init before the guest has started,
and realm_set when it's running).

I've had a go and combing the two functions, it's a little clunky
because of the differences, but I think it's an improvement over the
repeated code.

Thanks,
Steve

>> +            break;
>> +        } else {
>> +            WARN(1, "Unexpected error in %s: %#x\n", __func__,
>> +                 ret);
>> +            ret = -ENXIO;
>> +            break;
>> +        }
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
>> @@ -863,6 +922,32 @@ void kvm_destroy_realm(struct kvm *kvm)
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
>> @@ -873,6 +958,9 @@ int kvm_rec_enter(struct kvm_vcpu *vcpu)
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


