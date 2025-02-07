Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD573C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFkOJ1cCG0ZLzORzGTja0yFqMwsd+Y48rK9vqqRK8tY=; b=ZxKKs59lxnIGKfqvpDIUOIdeSI
	l/q9XGH9s8Vg+NcHYZK5MrbjE6J1F+64itK12NFzTtzRCq3WBPKZNjaDIB0IRNU9ZbnYV3+aG4Ook
	80VXJLTXkBmQHnIwRDtLRTS2cQW2ZdVkNqc0cx1nutaAf85W2eMdmeshv+Bs67j3qdgJt2oPnXFRp
	OsaFUgQdRVeI9tBlXjsas2ZwtTfy3iK59BjlEVUTlQhOxkEMSP6n87j8oQkXOHjvXMmnNfGc7hvII
	MYjbXES0Y2EPueWkHKh/o9rbmbtxmU5Dtw2xLF9/1q9mBJec6JJaaRiEngaObFCt+TDZzqDXDeYFi
	rnpxEQ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSBM-0000000AUoM-3ldg;
	Fri, 07 Feb 2025 17:30:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRmk-0000000APW0-40bt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 17:05:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17653113E;
	Fri,  7 Feb 2025 09:05:18 -0800 (PST)
Received: from [10.1.26.24] (e122027.cambridge.arm.com [10.1.26.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD7CB3F63F;
	Fri,  7 Feb 2025 09:04:50 -0800 (PST)
Message-ID: <f4411830-067e-448e-b43b-1418bb264e11@arm.com>
Date: Fri, 7 Feb 2025 17:04:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 20/43] arm64: RME: Runtime faulting of memory
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
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-21-steven.price@arm.com>
 <3f0caace-ee05-4ddf-ae75-2157e77aa57c@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <3f0caace-ee05-4ddf-ae75-2157e77aa57c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_090459_091833_41DBD1CC 
X-CRM114-Status: GOOD (  32.21  )
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

On 30/01/2025 05:22, Gavin Shan wrote:
> On 12/13/24 1:55 AM, Steven Price wrote:
[...]
>> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
>> index d4561e368cd5..146ef598a581 100644
>> --- a/arch/arm64/kvm/rme.c
>> +++ b/arch/arm64/kvm/rme.c
>> @@ -602,6 +602,162 @@ static int fold_rtt(struct realm *realm,
>> unsigned long addr, int level)
>>       return 0;
>>   }
>>   +int realm_map_protected(struct realm *realm,
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
>> +    if (WARN_ON(!IS_ALIGNED(ipa, map_size)))
>> +        return -EINVAL;
>> +
>> +    switch (map_size) {
>> +    case PAGE_SIZE:
>> +        map_level = 3;
>> +        break;
>> +    case RMM_L2_BLOCK_SIZE:
>> +        map_level = 2;
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
> 
> The same block of code, to return the RTT level according to the map
> size, has been
> used for multiple times. It would be nice to introduce a helper for this.

I have some changes to support larger host (and guest) page sizes which
rework this code which should help clean this up.

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
> 
> This block of code could be dropped. If the RTTs have been existing,
> realm_create_rtt_levels()
> doesn't nothing, but several RMI calls are issued. RMI calls aren't
> cheap and it can cause
> performance lost.

As mentioned in the patch 19 this is to prevent the first call to
rmi_data_create_unknown() failing when we know we're going to need to
create the RTTs. So this should generally reduce the number of RMIs
calls not increase.

>> +    for (size = 0; size < map_size; size += PAGE_SIZE) {
>> +        if (rmi_granule_delegate(phys)) {
>> +            /*
>> +             * It's likely we raced with another VCPU on the same
>> +             * fault. Assume the other VCPU has handled the fault
>> +             * and return to the guest.
>> +             */
>> +            return 0;
>> +        }
> 
> We probably can't bail immediately when error is returned from
> rmi_granule_delegate()
> because we intend to map a region whose size is 'map_size'. So a
> 'continue' instead
> of 'return 0' seems correct to me.

The logic here is that two (or more) vCPUs have faulted on the same
region. So if we get a failure here it means that we're the second vCPU
to hit the fault. While we could continue, it's highly likely that the
other vCPU will be faulting in the later parts of the region so we
expect to hit more delegation failures.

Returning to the guest and letting the guest retry the access means:
a) The access might now continue because the other vCPU has completed
(enough of) the mapping, or
b) We fault a second time, but give the other vCPU some more time to
progress in creating the mapping (and prevent the other vCPU being
tripped up by continued attempts by this vCPU from delegating the pages).

"continue" would work, but it's likely to waste CPU time with the two
vCPUs fighting each other to complete the mapping.

>> +
>> +        ret = rmi_data_create_unknown(rd, phys, ipa);
>> +
>> +        if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
>> +            /* Create missing RTTs and retry */
>> +            int level = RMI_RETURN_INDEX(ret);
>> +
>> +            ret = realm_create_rtt_levels(realm, ipa, level,
>> +                              RMM_RTT_MAX_LEVEL,
>> +                              memcache);
>> +            WARN_ON(ret);
>> +            if (ret)
>> +                goto err_undelegate;
> 
>             if (WARN_ON(ret))

ack

>> +
>> +            ret = rmi_data_create_unknown(rd, phys, ipa);
>> +        }
>> +        WARN_ON(ret);
>> +
>> +        if (ret)
>> +            goto err_undelegate;
> 
>         if (WARN_ON(ret))

ack

>> +
>> +        phys += PAGE_SIZE;
>> +        ipa += PAGE_SIZE;
>> +    }
>> +
>> +    if (map_size == RMM_L2_BLOCK_SIZE)
>> +        ret = fold_rtt(realm, base_ipa, map_level);
>> +    if (WARN_ON(ret))
>> +        goto err;
>> +
> 
> The nested if statements are needed here because the WARN_ON() only
> take effect on the return value from fold_rtt().
> 
>     if (map_size == RMM_L2_BLOCK_SIZE) {
>         ret = fold_rtt(realm, base_ipa, map_level);
>         if (WARN_ON(ret))
>             goto err;
>     }

Technically to get here then ret==0 so there's no need to nest like
this. But I agree it makes the intent much clearer so I'll update.

Thanks,
Steve


