Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDEECD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KuvofJTVdKGjF8OMwu2IM/hqW0q9P4uX9PFDtDS7yE=; b=4MqVHYYA2FS8D0VcpST26aQAtM
	053Ar3MKKEJRil3t6fOMj+aBkvv15/PXrr7PVMvDnumcIEzCqnLlJrBuaAcTCVpqh61lirwGGMV3j
	xBjmYSWT+KkqRZpk7Xo2IjyKQNzsP3fjwh2lAcEdtWX9gBm3ovTjBWpm3S/HYiMmJkc3qclZdVAI/
	0ADNbz6hveA6nskka9Jhuc94es+Nz5JLjAOhItr4P5h2NNJAJ36gMP5JQd+VsGUTliP32WtFWRFWN
	M+VTNYzJUfC263C4P8YReswpaf8MSAFCTI7TGhZTwTN4nXo9KI6WISK5IZiPiLONCzXOfAnZ1ctoM
	76rkM2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXeh-00000003NZA-16BI;
	Mon, 08 Jun 2026 10:56:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXee-00000003NYl-084K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:56:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0C5E2403;
	Mon,  8 Jun 2026 03:56:21 -0700 (PDT)
Received: from [10.57.28.93] (unknown [10.57.28.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 772D13F62B;
	Mon,  8 Jun 2026 03:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780916186; bh=YiDGG7CHXUTmXurpXnEp7Eug0LknXY49k10HXPKeZJA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l2tKcBHtN22HEBYkyF9eas29Ok7K7enrfcXJrmNxTNP69xUM1PFfQNwwDI4moEp0s
	 aWZLn7nCsLIWgoamOul93CvbCEaa3mC5EuUK2WA55D/PEuhCtcZt6nhZRrFWwWoo8/
	 OrboRDjmkubvwhXlUXtFqPw6NCluhUX4r7TjZv/s=
Message-ID: <21abf014-a68c-49b6-a113-4ec59c520a30@arm.com>
Date: Mon, 8 Jun 2026 11:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 29/44] arm64: RMI: Runtime faulting of memory
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Gavin Shan <gshan@redhat.com>,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-30-steven.price@arm.com>
 <3359f788-07fa-41a1-9ac7-45c58577c1fa@redhat.com>
 <cecbd148-5d33-49c8-928f-572f71b3dd69@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <cecbd148-5d33-49c8-928f-572f71b3dd69@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_035628_175689_F68ADFE3 
X-CRM114-Status: GOOD (  30.49  )
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

On 08/06/2026 10:30, Suzuki K Poulose wrote:
> On 05/06/2026 07:23, Gavin Shan wrote:
>> Hi Steve,
>>
>> On 5/13/26 11:17 PM, Steven Price wrote:
>>> At runtime if the realm guest accesses memory which hasn't yet been
>>> mapped then KVM needs to either populate the region or fault the guest.
>>>
>>> For memory in the lower (protected) region of IPA a fresh page is
>>> provided to the RMM which will zero the contents. For memory in the
>>> upper (shared) region of IPA, the memory from the memslot is mapped
>>> into the realm VM non secure.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes since v13:
>>>   * Numerous changes due to rebasing.
>>>   * Fix addr_range_desc() to encode the correct block size.
>>> Changes since v12:
>>>   * Switch to RMM v2.0 range based APIs.
>>> Changes since v11:
>>>   * Adapt to upstream changes.
>>> Changes since v10:
>>>   * RME->RMI renaming.
>>>   * Adapt to upstream gmem changes.
>>> Changes since v9:
>>>   * Fix call to kvm_stage2_unmap_range() in kvm_free_stage2_pgd() to set
>>>     may_block to avoid stall warnings.
>>>   * Minor coding style fixes.
>>> Changes since v8:
>>>   * Propagate the may_block flag.
>>>   * Minor comments and coding style changes.
>>> Changes since v7:
>>>   * Remove redundant WARN_ONs for realm_create_rtt_levels() - it will
>>>     internally WARN when necessary.
>>> Changes since v6:
>>>   * Handle PAGE_SIZE being larger than RMM granule size.
>>>   * Some minor renaming following review comments.
>>> Changes since v5:
>>>   * Reduce use of struct page in preparation for supporting the RMM
>>>     having a different page size to the host.
>>>   * Handle a race when delegating a page where another CPU has
>>> faulted on
>>>     a the same page (and already delegated the physical page) but not
>>> yet
>>>     mapped it. In this case simply return to the guest to either use the
>>>     mapping from the other CPU (or refault if the race is lost).
>>>   * The changes to populate_par_region() are moved into the previous
>>>     patch where they belong.
>>> Changes since v4:
>>>   * Code cleanup following review feedback.
>>>   * Drop the PTE_SHARED bit when creating unprotected page table
>>> entries.
>>>     This is now set by the RMM and the host has no control of it and the
>>>     spec requires the bit to be set to zero.
>>> Changes since v2:
>>>   * Avoid leaking memory if failing to map it in the realm.
>>>   * Correctly mask RTT based on LPA2 flag (see rtt_get_phys()).
>>>   * Adapt to changes in previous patches.
>>> ---
>>>   arch/arm64/include/asm/kvm_emulate.h |   8 ++
>>>   arch/arm64/include/asm/kvm_rmi.h     |  12 ++
>>>   arch/arm64/kvm/mmu.c                 | 128 ++++++++++++++++----
>>>   arch/arm64/kvm/rmi.c                 | 173 +++++++++++++++++++++++++++
>>>   4 files changed, 301 insertions(+), 20 deletions(-)
>>>

[...]

>>> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>>> index cae29fd3353c..761b38a4071c 100644
>>> --- a/arch/arm64/kvm/rmi.c
>>> +++ b/arch/arm64/kvm/rmi.c
>>> @@ -597,6 +597,179 @@ static int realm_data_map_init(struct kvm *kvm,
>>> unsigned long ipa,
>>>       return ret;
>>>   }
>>> +static unsigned long addr_range_desc(unsigned long phys, unsigned
>>> long size)
>>> +{
>>> +    unsigned long out = 0;
>>> +
>>> +    switch (size) {
>>> +    case P4D_SIZE:
>>> +        out = 3 | (1 << 2);
>>> +        break;
>>> +    case PUD_SIZE:
>>> +        out = 2 | (1 << 2);
>>> +        break;
>>> +    case PMD_SIZE:
>>> +        out = 1 | (1 << 2);
>>> +        break;
>>> +    case PAGE_SIZE:
>>> +        out = 0 | (1 << 2);
>>> +        break;
>>> +    default:
>>> +        /*
>>> +         * Only support mapping at the page level granulatity when
>>> +         * it's an unusual length. This should get us back onto a
>>> larger
>>> +         * block size for the subsequent mappings.
>>> +         */
>>> +        out = 0 | ((MIN(size >> PAGE_SHIFT, PTRS_PER_PTE - 1)) << 2);
>>> +        break;
>>> +    }
>>> +
>>> +    WARN_ON(phys & ~PAGE_MASK);
>>> +
>>> +    out |= phys & PAGE_MASK;
>>> +
>>> +    return out;
>>> +}
>>> +
>>> +int realm_map_protected(struct kvm *kvm,
>>> +            unsigned long ipa,
>>> +            kvm_pfn_t pfn,
>>> +            unsigned long map_size,
>>> +            struct kvm_mmu_memory_cache *memcache)
>>> +{
>>> +    struct realm *realm = &kvm->arch.realm;
>>> +    phys_addr_t phys = __pfn_to_phys(pfn);
>>> +    phys_addr_t base_phys = phys;
>>> +    phys_addr_t rd = virt_to_phys(realm->rd);
>>> +    unsigned long base_ipa = ipa;
>>> +    unsigned long ipa_top = ipa + map_size;
>>> +    int ret = 0;
>>> +
>>> +    if (WARN_ON(!IS_ALIGNED(map_size, PAGE_SIZE) ||
>>> +            !IS_ALIGNED(ipa, map_size)))
>>> +        return -EINVAL;
>>> +
>>> +    if (rmi_delegate_range(phys, map_size)) {
>>> +        /*
>>> +         * It's likely we raced with another VCPU on the same
>>> +         * fault. Assume the other VCPU has handled the fault
>>> +         * and return to the guest.
>>> +         */
>>> +        return 0;
>>> +    }
>>> +
>>> +    while (ipa < ipa_top) {
>>> +        unsigned long flags = RMI_ADDR_TYPE_SINGLE;
>>> +        unsigned long range_desc = addr_range_desc(phys, ipa_top -
>>> ipa);
>>> +        unsigned long out_top;
>>> +
>>> +        ret = rmi_rtt_data_map(rd, ipa, ipa_top, flags, range_desc,
>>> +                       &out_top);
>>> +
>>> +        if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
>>> +            /* Create missing RTTs and retry */
>>> +            int level = RMI_RETURN_INDEX(ret);
>>> +
>>> +            WARN_ON(level == KVM_PGTABLE_LAST_LEVEL);
>>> +            ret = realm_create_rtt_levels(realm, ipa, level,
>>> +                              KVM_PGTABLE_LAST_LEVEL,
>>> +                              memcache);
> 
> Could we give the RMM a chance to make use of the Block mappings by
> creating the Missing RTTs to the level that may work for the current
> range_desc ? i.e., if the range_desc is a 2M block size, we could create
> tables upto L2 in the first go and if the RMM still needs RTT, we could
> go further down to the KVM_PGTABLE_LAST_LEVEL. I understand this is
> kind of an optimisation, so may be we could defer it. (Same applies for
> the non_secure map below).

A simple change would be just to create one level at a time like this:

diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index b79b96f7dffb..3f3ade1d3895 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -767,15 +767,15 @@ static int realm_map_protected(struct kvm *kvm,
 			/* Create missing RTTs and retry */
 			int level = RMI_RETURN_INDEX(ret);
 
-			WARN_ON(level == KVM_PGTABLE_LAST_LEVEL);
+			if (WARN_ON(level >= KVM_PGTABLE_LAST_LEVEL))
+				goto err_undelegate;
 			ret = realm_create_rtt_levels(realm, ipa, level,
-						      KVM_PGTABLE_LAST_LEVEL,
+						      level + 1,
 						      memcache);
 			if (ret)
 				goto err_undelegate;
 
-			ret = rmi_rtt_data_map(rd, ipa, ipa_top, flags,
-					       range_desc, &out_top);
+			continue;
 		}
 
 		if (WARN_ON(ret))

Thanks,
Steve


