Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020B6CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdvqeZMK5w1lKZujswSnwY8+jqdl1ezeQur89I8qWvU=; b=Kun9AYm1VSKURV6/SqVnPhMRET
	NVe5skhPLp6PL2TdssynoCHnREEOSMXbzc7DpD7oLWWGYhLiEjAT7P18oy7qxKAwa4bnZSahsdihm
	/vDFw7l6+L1p9k6R4nLfJ9t3tvD229UwAoOH2Tl8zssWDCuvFC4I8GBxnjmx7OMYcTZgab7HTkgsK
	PsIrOfcMNL7yDoThJfNfEXcfbRU2WtMZ1vJzzLZvgX1PC45RPrb6AFW/GokVuthvz7ySxlRe3XXAJ
	oSNmKQg28lxagwUZaM0Dz2rc37CVz8+1cSn22IMIvhp7zzEl6rOWFQmv0hVeiq9Hg1/1Q4HqtO5GV
	guupyo/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPK9R-00000001aKs-1NCs;
	Tue, 19 May 2026 13:06:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPK9P-00000001aJv-1dSj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:06:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9725922FA;
	Tue, 19 May 2026 06:06:16 -0700 (PDT)
Received: from [10.57.21.217] (unknown [10.57.21.217])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C7CB3F632;
	Tue, 19 May 2026 06:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779195981; bh=xLPJibyadtzOM1pTh6JInl7Mk9kkuekiMc1uaVO9Ptw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qr5mAB5eXoSwYaoR8jeyFV8m7SEterH8WGOoY/HjQtGBKkOieCBccTuo8zj852r4u
	 GhJQ8HLKYysL78fYWKdGviuhIlIRCQmVbzsZzxe+SouMjtAgWZEzDtzXedu2jQIMnY
	 q+zPOeZr7cBbMZhgOgIEcPj8tpfpk4znM5pd39MQ=
Message-ID: <63bcd82b-4efa-417c-9c36-782c6e13ebb1@arm.com>
Date: Tue, 19 May 2026 14:06:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 27/44] arm64: RMI: Set RIPAS of initial memslots
Content-Language: en-GB
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
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
 Alper Gun <alpergun@google.com>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-28-steven.price@arm.com> <yq5av7cjsonr.fsf@kernel.org>
 <6681f10b-0966-42e2-ae04-4e1aef47ec4d@arm.com> <yq5ajyszsgmf.fsf@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <yq5ajyszsgmf.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_060623_514315_8FD8C1B0 
X-CRM114-Status: GOOD (  19.88  )
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

On 19/05/2026 13:55, Aneesh Kumar K.V wrote:
> Suzuki K Poulose <suzuki.poulose@arm.com> writes:
> 
>> On 19/05/2026 11:02, Aneesh Kumar K.V wrote:
>>> Steven Price <steven.price@arm.com> writes:
>>>
>>>> The memory which the realm guest accesses must be set to RIPAS_RAM.
>>>> Iterate over the memslots and set all gmem memslots to RIPAS_RAM.
>>>>
>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>> ---
>>>    
>>>    ...
>>>    
>>>> +static int set_ripas_of_protected_regions(struct kvm *kvm)
>>>> +{
>>>> +	struct kvm_memslots *slots;
>>>> +	struct kvm_memory_slot *memslot;
>>>> +	int idx, bkt;
>>>> +	int ret = 0;
>>>> +
>>>> +	idx = srcu_read_lock(&kvm->srcu);
>>>> +
>>>> +	slots = kvm_memslots(kvm);
>>>> +	kvm_for_each_memslot(memslot, bkt, slots) {
>>>> +		if (!kvm_slot_has_gmem(memslot))
>>>> +			continue;
>>>> +
>>>> +		ret = realm_init_ipa_state(kvm, memslot->base_gfn,
>>>> +					   memslot->npages);
>>>> +		if (ret)
>>>> +			break;
>>>> +	}
>>>> +	srcu_read_unlock(&kvm->srcu, idx);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>>    int kvm_arm_rmi_populate(struct kvm *kvm,
>>>>    			 struct kvm_arm_rmi_populate *args)
>>>>    {
>>>> @@ -890,6 +922,10 @@ int kvm_activate_realm(struct kvm *kvm)
>>>>    			return ret;
>>>>    	}
>>>>    
>>>> +	ret = set_ripas_of_protected_regions(kvm);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>>    	ret = rmi_realm_activate(virt_to_phys(realm->rd));
>>>>    	if (ret)
>>>>    		return -ENXIO;
>>>
>>> relam guest already does.
>>> 	for_each_mem_range(i, &start, &end) {
>>> 		if (rsi_set_memory_range_protected_safe(start, end)) {
>>> 			panic("Failed to set memory range to protected: %pa-%pa",
>>> 			      &start, &end);
>>> 		}
>>> 	}
>>>
>>> if so why is host required to do this ?
>>
>> Ideally this should be a call from the VMM (i.e., user). Irrespective of
>> what the guest does (which the host has no knowledge about), the VMM/
>> user is better aware of what to do for a given guest. We have done this
>> implicitly in the KVM as a start, to keep the initial implementation
>> simple. This could be moved out to the VMM as UABI, if there is
>> sufficient demand for it.
>>
>> TL,DR: This should be a host/deployer decision, not the Guest. There
>> may other guest OS, which do not do RIPAS_RAM early enough.
>>
> 
> Are we suggesting that when the guest is running out of DRAM initialized
> via rmi_rtt_data_map_init(), it may need to access memory outside that
> range before it gets a chance to set the RIPAS as RAM?

It may. This was one of the review comments we got when we published
the Linux Guest patches. In fact, this is in the Linux booting
requirements. See :

Documentation/arch/arm64/booting.rst: Section 1


> 
> Does that mean the guest now has to trust the host for that?

No, this has been the case. We added the code in Linux to convert memory
as a back stop. The worse could happens is Guest crashing, without it
having any secrets receving from the Remote entity.

> rmi_rtt_init_ripas() is not added to the measurement details, right?

It is not (at least for now). It doesn't matter for security much.

Suzuki

> 
> -aneesh


