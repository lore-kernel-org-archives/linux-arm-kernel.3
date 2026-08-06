Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35209C561E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQobC6Rvh0rqg7UDJiuPykN9ziIbdxiVqIJhHHjDz7Y=; b=0nNwvgsGxYT6gvgUC0dyOrSiFU
	cRyEecuIgsHME0Zz3jn7RIdZTOG9zv0Eat4Mh/a66EZvLA8ivU6gPJ2u2OST73lD1JsCEmj1fdSAM
	EwnP0sZZ3dxfMyTcnHUnUI/hcBjMBzvE7WmO0BUX4cJ4ceb08NlDafbZJwVPHOzei4vSBsVWKEZTc
	o4LGWOgllbTKlfEUu1HWAMNpTlD47A8vGbgwYoaGxPuCtUUhFQOsQCGo5vmgqcJSJRxGx0OoiFOaA
	P01/i1KfCQAd/rmxAzd5ay6NilcaBi6+ZxIzvqP3zNqqUu3fp2xsioT/aiu3hZjbuL5JoWILcZnk0
	nOzt51sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtgd-00000005Gd2-49lF;
	Thu, 06 Aug 2026 08:42:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtga-00000005GcR-30Sw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:42:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01D3416F2;
	Thu,  6 Aug 2026 01:42:37 -0700 (PDT)
Received: from [10.57.44.180] (unknown [10.57.44.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F4E33F632;
	Thu,  6 Aug 2026 01:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786005761; bh=83n8BDtca7EQ88qdbSJ2gpj0nr/DMadQjUZ4VfwaO44=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sjOrRNgUN88fiAM3TDTEbTO1yg7wwti4XXHueQck1WbKnYrcUhpdIFGu41LIcuwC3
	 7KmTRbbVN2X3flXHvUe48ckBB1uwP2b41Q5aLZI9x9sF7MTnD2tJ48ggcbX/F5beez
	 noWb7zNYsZ1fQdtzPJ/9OtOeGn/Mmd1+f1YKPVwo=
Message-ID: <9dabf79b-92e6-4bd3-9fd6-15c4ff5e9ef6@arm.com>
Date: Thu, 6 Aug 2026 09:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 22/45] KVM: arm64: CCA: Handle RMI_EXIT_RIPAS_CHANGE
Content-Language: en-GB
To: Ackerley Tng <ackerleytng@google.com>, Steven Price
 <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-23-steven.price@arm.com>
 <CAEvNRgH+HWHgf26XDHN6aMLYjRh4M8okntBfjDFCBreXRXL=TA@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CAEvNRgH+HWHgf26XDHN6aMLYjRh4M8okntBfjDFCBreXRXL=TA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_014245_130884_90475058 
X-CRM114-Status: GOOD (  35.32  )
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

On 05/08/2026 16:59, Ackerley Tng wrote:
> Steven Price <steven.price@arm.com> writes:
> 
>> The guest can request that a region of its protected address space is
>> switched between RIPAS_RAM and RIPAS_EMPTY (and back) using
>> RSI_IPA_STATE_SET. This causes a guest exit with the
>> RMI_EXIT_RIPAS_CHANGE code. We treat this as a request to convert a
>> protected region to unprotected (or back), exiting to the VMM to make
>> the necessary changes to the guest_memfd and memslot mappings. On the
>> next entry the RIPAS changes are committed by making RMI_RTT_SET_RIPAS
>> calls.
>>
>> The VMM may wish to reject the RIPAS change requested by the guest. For
>> now it can only do this by no longer scheduling the VCPU as we don't
>> currently have a usecase for returning that rejection to the guest, but
>> by postponing the RMI_RTT_SET_RIPAS changes to entry we leave the door
>> open for adding a new ioctl in the future for this purpose.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v15:
>>   * Propagate negative error returns.
>> Changes since v14:
>>   * Use addition rather than bitwise OR for adding the shared_bit in
>>     realm_unmap_shared_range(), this handles the case where the region
>>     includes the last address (which means 'end' already has the bit
>>     set).
>> Changes since v13:
>>   * Switch to the new RMI_RTT_UNPROT_UNMAP range-based API.
>>   * Drop ugly hack for RMM bug which errored when the RIPAS was already
>>     set to the desired value.
>> Changes since v12:
>>   * Switch to the new RMM v2.0 RMI_RTT_DATA_UNMAP which can unmap an
>>     address range.
>> Changes since v11:
>>   * Combine the "Allow VMM to set RIPAS" patch into this one to avoid
>>     adding functions before they are used.
>>   * Drop the CAP for setting RIPAS and adapt to changes from previous
>>     patches.
>> Changes since v10:
>>   * Add comment explaining the assignment of rec->run->exit.ripas_base in
>>     kvm_complete_ripas_change().
>> Changes since v8:
>>   * Make use of ripas_change() from a previous patch to implement
>>     realm_set_ipa_state().
>>   * Update exit.ripas_base after a RIPAS change so that, if instead of
>>     entering the guest we exit to user space, we don't attempt to repeat
>>     the RIPAS change (triggering an error from the RMM).
>> Changes since v7:
>>   * Rework the loop in realm_set_ipa_state() to make it clear when the
>>     'next' output value of rmi_rtt_set_ripas() is used.
>> New patch for v7: The code was previously split awkwardly between two
>> other patches.
>> ---
>>   arch/arm64/include/asm/kvm_rmi.h |   6 +
>>   arch/arm64/kvm/mmu.c             |   8 +-
>>   arch/arm64/kvm/rmi.c             | 473 +++++++++++++++++++++++++++++++
>>   3 files changed, 484 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
>> index 1e5026039458..751659a48be3 100644
>> --- a/arch/arm64/include/asm/kvm_rmi.h
>> +++ b/arch/arm64/include/asm/kvm_rmi.h
>> @@ -107,6 +107,12 @@ int kvm_rec_exit(struct kvm_vcpu *vcpu, int rec_run_status);
>>   int kvm_rec_handle_request(struct kvm_vcpu *vcpu);
>>   bool kvm_rec_handle_hvc(struct kvm_vcpu *vcpu, int *ret);
>>
>> +void kvm_realm_unmap_range(struct kvm *kvm,
>> +			   unsigned long ipa,
>> +			   unsigned long size,
>> +			   bool unmap_private,
>> +			   bool may_block);
>> +
>>   static inline bool kvm_realm_is_private_address(struct realm *realm,
>>   						unsigned long addr)
>>   {
> 
> Coming here from guest_memfd, would like to look more closely at the
> conversions-related stuff, and learn more about ARM CCA in the process :)
> 
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index cd06881c1497..dcc2ab08d0e4 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -319,6 +319,7 @@ static void invalidate_icache_guest_page(void *va, size_t size)
>>    * @start: The intermediate physical base address of the range to unmap
>>    * @size:  The size of the area to unmap
>>    * @may_block: Whether or not we are permitted to block
>> + * @only_shared: If true then protected mappings should not be unmapped
>>    *
>>    * Clear a range of stage-2 mappings, lowering the various ref-counts.  Must
>>    * be called while holding mmu_lock (unless for freeing the stage2 pgd before
>> @@ -326,7 +327,7 @@ static void invalidate_icache_guest_page(void *va, size_t size)
>>    * with things behind our backs.
>>    */
>>   static void __unmap_stage2_range(struct kvm_s2_mmu *mmu, phys_addr_t start, u64 size,
>> -				 bool may_block)
>> +				 bool may_block, bool only_shared)
>>   {
> 
> Why convert attr_filter to a boolean, why not pass the filter through? I
> think that might allow all the 3 states - unmapping private, unmapping
> shared, and unmapping both. (Assuming unmapping none == not even calling
> this function).

You're absolutely right, we should use the attr_filter as it is if we go
down this route (like I alluded to in [1]) . I think this was really
from the original Guest memfd support (without inplace conversion).

> 
> Also, perhaps it's better to add this parameter to
> __unmap_stage2_range() together with the patch that uses the only_shared
> information :)

> 
> I see that in [1] not changing __unmap_stage2_range() was going to be
> explored, did that work out?

I haven't got to it yet, I will be taking a look at this.

Cheers
Suzuki

> 
> [1] https://lore.kernel.org/all/3b8d49be-f031-4134-bd20-a8c51632f4ad@arm.com/
> 
>>   	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
>>   	phys_addr_t end = start + size;
>> @@ -343,7 +344,7 @@ void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
>>   	if (kvm_vm_is_protected(kvm_s2_mmu_to_kvm(mmu)))
>>   		return;
>>
>> -	__unmap_stage2_range(mmu, start, size, may_block);
>> +	__unmap_stage2_range(mmu, start, size, may_block, false);
>>   }
>>
>>
>> [...snip...]
>>


