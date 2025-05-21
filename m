Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6326CC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 09:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1U/V/pptvlg57Kczg+Lkuu1Qt02bcOyKWsKyvW1O56U=; b=HQyemZrPPBzuCoARfJIeg5xBtI
	ozPLrvNUOkL08XcZP0IJcdBwOfjqaUsiugz0opcN06JLJFgxt1zNnJdAtjdD1STrDx2DkgspfrTAk
	P800el/m0suDLf3Zga4yB6hcHie+Zk12zF4PwH8nVFeRk7PlwE6xIm9WEvTWT7QUJaxNaH7cZ63HD
	sYr3jffL3/kOAZCw2C/5/LIlqMevbWrXb1bptdwnYVIeV6X2Qi5ZjDBsleWURReBBiP2MITA9jXwf
	8I225PwVvZieUaK4itUvVf2E8MRgeFMsaQzAzylJ5MzrThrr3xvf4+akeh26RS70fqAoTcA09tXf5
	3pBAzLuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfeJ-0000000FIBh-33om;
	Wed, 21 May 2025 09:22:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfTR-0000000FGOl-2AT9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 09:10:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00AC91515;
	Wed, 21 May 2025 02:10:39 -0700 (PDT)
Received: from [10.57.23.70] (unknown [10.57.23.70])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3955D3F6A8;
	Wed, 21 May 2025 02:10:48 -0700 (PDT)
Message-ID: <c6ae4a77-6477-4e37-bca7-1ddfdfbce803@arm.com>
Date: Wed, 21 May 2025 10:10:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 20/43] arm64: RME: Runtime faulting of memory
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
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
 <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-21-steven.price@arm.com>
 <3a04995a-524c-4d07-8c8b-82930f9bca72@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <3a04995a-524c-4d07-8c8b-82930f9bca72@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_021053_646030_EA1001B8 
X-CRM114-Status: GOOD (  42.53  )
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

On 19/05/2025 18:35, Suzuki K Poulose wrote:
> Hi Steven
> 
> On 16/04/2025 14:41, Steven Price wrote:
>> At runtime if the realm guest accesses memory which hasn't yet been
>> mapped then KVM needs to either populate the region or fault the guest.
>>
>> For memory in the lower (protected) region of IPA a fresh page is
>> provided to the RMM which will zero the contents. For memory in the
>> upper (shared) region of IPA, the memory from the memslot is mapped
>> into the realm VM non secure.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
> 
> Please find some comments below.
> 
> ...
> 
>> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
>> index f6af3ea6ea8a..b6959cd17a6c 100644
>> --- a/arch/arm64/kvm/rme.c
>> +++ b/arch/arm64/kvm/rme.c
>> @@ -714,6 +714,186 @@ static int
>> realm_create_protected_data_page(struct realm *realm,
>>       return -ENXIO;
>>   }
>>   +static int fold_rtt(struct realm *realm, unsigned long addr, int
>> level)
>> +{
>> +    phys_addr_t rtt_addr;
>> +    int ret;
>> +
>> +    ret = realm_rtt_fold(realm, addr, level, &rtt_addr);
>> +    if (ret)
>> +        return ret;
>> +
>> +    free_delegated_granule(rtt_addr);
>> +
>> +    return 0;
>> +}
>> +
>> +int realm_map_protected(struct realm *realm,
>> +            unsigned long ipa,
>> +            kvm_pfn_t pfn,
>> +            unsigned long map_size,
>> +            struct kvm_mmu_memory_cache *memcache)
>> +{
>> +    phys_addr_t phys = __pfn_to_phys(pfn);
>> +    phys_addr_t rd = virt_to_phys(realm->rd);
>> +    unsigned long base_ipa = ipa;
>> +    unsigned long size;
>> +    int map_level;
>> +    int ret = 0;
>> +
>> +    if (WARN_ON(!IS_ALIGNED(map_size, RMM_PAGE_SIZE)))
>> +        return -EINVAL;
>> +
>> +    if (WARN_ON(!IS_ALIGNED(ipa, map_size)))
>> +        return -EINVAL;
>> +
>> +    if (IS_ALIGNED(map_size, RMM_L2_BLOCK_SIZE))
>> +        map_level = 2;
> 
> minor nit : RMM_RTT_BLOCK_LEVEL
> 
>> +    else
>> +        map_level = 3;
> 
> minor nit:  RMM_RTT_MAX_LEVEL ?

Ack

>> +
>> +    if (map_level < RMM_RTT_MAX_LEVEL) {
>> +        /*
>> +         * A temporary RTT is needed during the map, precreate it,
>> +         * however if there is an error (e.g. missing parent tables)
>> +         * this will be handled below.
>> +         */
>> +        realm_create_rtt_levels(realm, ipa, map_level,
>> +                    RMM_RTT_MAX_LEVEL, memcache);
>> +    }
>> +
>> +    for (size = 0; size < map_size; size += RMM_PAGE_SIZE) {
>> +        if (rmi_granule_delegate(phys)) {
>> +            /*
>> +             * It's likely we raced with another VCPU on the same
>> +             * fault. Assume the other VCPU has handled the fault
>> +             * and return to the guest.
>> +             */
>> +            return 0;
>> +        }
>> +
>> +        ret = rmi_data_create_unknown(rd, phys, ipa);
>> +
>> +        if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
>> +            /* Create missing RTTs and retry */
>> +            int level = RMI_RETURN_INDEX(ret);
>> +
>> +            WARN_ON(level == RMM_RTT_MAX_LEVEL);
>> +
>> +            ret = realm_create_rtt_levels(realm, ipa, level,
>> +                              RMM_RTT_MAX_LEVEL,
>> +                              memcache);
>> +            if (ret)
>> +                goto err_undelegate;
>> +
>> +            ret = rmi_data_create_unknown(rd, phys, ipa);
>> +        }
>> +
>> +        if (WARN_ON(ret))
>> +            goto err_undelegate;
>> +
>> +        phys += RMM_PAGE_SIZE;
>> +        ipa += RMM_PAGE_SIZE;
>> +    }
>> +
>> +    if (map_size == RMM_L2_BLOCK_SIZE) {
>> +        ret = fold_rtt(realm, base_ipa, map_level + 1);
>> +        if (WARN_ON(ret))
>> +            goto err;
>> +    }
>> +
>> +    return 0;
>> +
>> +err_undelegate:
>> +    if (WARN_ON(rmi_granule_undelegate(phys))) {
>> +        /* Page can't be returned to NS world so is lost */
>> +        get_page(phys_to_page(phys));
>> +    }
>> +err:
>> +    while (size > 0) {
>> +        unsigned long data, top;
>> +
>> +        phys -= RMM_PAGE_SIZE;
>> +        size -= RMM_PAGE_SIZE;
>> +        ipa -= RMM_PAGE_SIZE;
>> +
>> +        WARN_ON(rmi_data_destroy(rd, ipa, &data, &top));
>> +
>> +        if (WARN_ON(rmi_granule_undelegate(phys))) {
>> +            /* Page can't be returned to NS world so is lost */
>> +            get_page(phys_to_page(phys));
>> +        }
>> +    }
>> +    return -ENXIO;
>> +}
>> +
>> +int realm_map_non_secure(struct realm *realm,
>> +             unsigned long ipa,
>> +             kvm_pfn_t pfn,
>> +             unsigned long size,
>> +             struct kvm_mmu_memory_cache *memcache)
>> +{
>> +    phys_addr_t rd = virt_to_phys(realm->rd);
>> +    phys_addr_t phys = __pfn_to_phys(pfn);
>> +    unsigned long offset;
>> +    int map_size, map_level;
>> +    int ret = 0;
>> +
>> +    if (WARN_ON(!IS_ALIGNED(size, RMM_PAGE_SIZE)))
>> +        return -EINVAL;
>> +
>> +    if (WARN_ON(!IS_ALIGNED(ipa, size)))
>> +        return -EINVAL;
>> +
>> +    if (IS_ALIGNED(size, RMM_L2_BLOCK_SIZE)) {
>> +        map_level = 2;
>> +        map_size = RMM_L2_BLOCK_SIZE;
> 
> Same here, stick to the symbols than digits.

Ack

>> +    } else {
>> +        map_level = 3;
>> +        map_size = RMM_PAGE_SIZE;
>> +    }
>> +
>> +    for (offset = 0; offset < size; offset += map_size) {
>> +        /*
>> +         * realm_map_ipa() enforces that the memory is writable,
> 
> The function names seems to be obsolete, please fix.

realm_map_ipa() is in arch/arm64/kvm/mmu.c and contains...

	/*
	 * Write permission is required for now even though it's possible to
	 * map unprotected pages (granules) as read-only. It's impossible to
	 * map protected pages (granules) as read-only.
	 */
	if (WARN_ON(!(prot & KVM_PGTABLE_PROT_W)))
		return -EFAULT;

...which is what this is referring to.
[And now I've read your follow up email ;) ]

>> +         * so for now we permit both read and write.
>> +         */
>> +        unsigned long desc = phys |
>> +                     PTE_S2_MEMATTR(MT_S2_FWB_NORMAL) |
>> +                     KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R |
>> +                     KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
>> +        ret = rmi_rtt_map_unprotected(rd, ipa, map_level, desc);
>> +
>> +        if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
> 
> Could we hit the following case and end up in failure ?
> 
> * Initially a single page is shared and the S2 is mapped
> * Later the Realm shares the entire L2 block and encounters a fault
>   at a new IPA within the L2 block.
> 
> In this case, we may try to L2 mapping when there is a L3 mapping and
> we could encounter (RMI_ERROR_RTT, 2).

Ugh! You are of course correct, this is broken. It turns out this is all
irrelevant as things stand because we don't currently support anything
bigger than (host) PAGE_SIZE mappings (forced in user_mem_abort()).

Given this I'm very much tempted to just delete the code supporting
block mappings for now (just set map_level to RMM_RTT_MAX_LEVEL).

Longer term, I'm not sure what is the best approach, the options are:

1. Drop down and map the region at L3 (ignoring conflicting entries),
   followed by attempting to fold.

2. Destroy the table and directly map at L2.

Option 2 is clearly the most performant, but is potentially racy. In
particular I'm not 100% sure whether you could end up with another
thread attempting to map at L3 between the destroy and map, and
therefore recreating the table.

Thanks,
Steve

> 
>> +            /* Create missing RTTs and retry */
>> +            int level = RMI_RETURN_INDEX(ret);
> 
> So we should probably go down the rtt create step, with the following
> check.
> 
>             if (level < map_level) {
> 
>> +
>> +            ret = realm_create_rtt_levels(realm, ipa, level,
>> +                              map_level, memcache);
>> +            if (ret)
>> +                return -ENXIO;
>> +
>> +            ret = rmi_rtt_map_unprotected(rd, ipa, map_level, desc);
> 
> 
>         } else {
> 
> Otherwise, may be we need to do some more hard work to fix it up.
> 
> 1. If map_level == 3, something is terribly wrong or we raced with
> another thread ?
> 
> 2. If map_level < 3 and we didn't race :
> 
>   a. Going one level down and creating the mappings there and then
> folding. But we could endup dealing with ERROR_RTT,3 as in (1).
> 
>   b. Easiest is to destroy the table at "map_level + 1" and retry the map.
> 
> 
> Suzuki
> 
> 
> 
>> +        }
>> +        /*
>> +         * RMI_ERROR_RTT can be reported for two reasons: either the
>> +         * RTT tables are not there, or there is an RTTE already
>> +         * present for the address.  The call to
>> +         * realm_create_rtt_levels() above handles the first case, and
>> +         * in the second case this indicates that another thread has
>> +         * already populated the RTTE for us, so we can ignore the
>> +         * error and continue.
>> +         */
>> +        if (ret && RMI_RETURN_STATUS(ret) != RMI_ERROR_RTT)
>> +            return -ENXIO;
>> +
>> +        ipa += map_size;
>> +        phys += map_size;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int populate_region(struct kvm *kvm,
>>                  phys_addr_t ipa_base,
>>                  phys_addr_t ipa_end,
> 


