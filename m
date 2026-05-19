Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC25CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+dO0trv41tpEYlC9GXFlLRMexK8/u40t/Gzd0IBg7w=; b=FPUG6rL5I7Yb+Hj2mN5C6SpUAj
	IkERWoSyV47hXxz1eSIc2sZW27Y2jRp6HLM7x8aM1rB7tfmYCMAL1GDeVfHihLHwHYkEsMrThC1jX
	0IrpbSTwNtpDl6gV6+/SCgXaFaETCAhMD3vS7pSFFTCJ/pymt6L8srBk2R4UGzIMbU91pj5n0MPBp
	yDDv/yPF08cSLKZZ8YDrtgsZdm4LfSa6qjN5LPV87Rq4lYWj2lByLOA3aO4t6prMAoSVh5DQRSnD+
	VyRwATE9Gf5JXAQHUArbn58hxXFFF8NpKqZQQdR+yCEnsYA0oY2Py4QyTfOPtB8uhEIdtkRS+gx4B
	p4uNwVKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHSh-000000013P0-2w5d;
	Tue, 19 May 2026 10:14:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHSf-000000013Nz-0H5n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:14:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 115AF2008;
	Tue, 19 May 2026 03:13:56 -0700 (PDT)
Received: from [10.57.21.217] (unknown [10.57.21.217])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97A693F85F;
	Tue, 19 May 2026 03:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779185641; bh=ShfBiW+vq91XcTgWSa/la50XGXIbPtfnzFO4ifOfID4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WCodZuKBHSvv0Lw3fiVNW9WTrXE9xTWRcDndU3xAfxrCnmh1baSZ9JZ66xgPSc+qB
	 TCRqox8LoUDgWZQ3zD+MpXFsov7Di1fQzBYbxn0svpwebaQ2WTmTuAaIsjVlRToUJS
	 GGa82phRLTPjd17dP+cJV0/D72gpzEOxokO9qGfU=
Message-ID: <6681f10b-0966-42e2-ae04-4e1aef47ec4d@arm.com>
Date: Tue, 19 May 2026 11:13:55 +0100
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
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <yq5av7cjsonr.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_031405_183772_A95EF8F7 
X-CRM114-Status: GOOD (  17.14  )
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

On 19/05/2026 11:02, Aneesh Kumar K.V wrote:
> Steven Price <steven.price@arm.com> writes:
> 
>> The memory which the realm guest accesses must be set to RIPAS_RAM.
>> Iterate over the memslots and set all gmem memslots to RIPAS_RAM.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>   
>   ...
>   
>> +static int set_ripas_of_protected_regions(struct kvm *kvm)
>> +{
>> +	struct kvm_memslots *slots;
>> +	struct kvm_memory_slot *memslot;
>> +	int idx, bkt;
>> +	int ret = 0;
>> +
>> +	idx = srcu_read_lock(&kvm->srcu);
>> +
>> +	slots = kvm_memslots(kvm);
>> +	kvm_for_each_memslot(memslot, bkt, slots) {
>> +		if (!kvm_slot_has_gmem(memslot))
>> +			continue;
>> +
>> +		ret = realm_init_ipa_state(kvm, memslot->base_gfn,
>> +					   memslot->npages);
>> +		if (ret)
>> +			break;
>> +	}
>> +	srcu_read_unlock(&kvm->srcu, idx);
>> +
>> +	return ret;
>> +}
>> +
>>   int kvm_arm_rmi_populate(struct kvm *kvm,
>>   			 struct kvm_arm_rmi_populate *args)
>>   {
>> @@ -890,6 +922,10 @@ int kvm_activate_realm(struct kvm *kvm)
>>   			return ret;
>>   	}
>>   
>> +	ret = set_ripas_of_protected_regions(kvm);
>> +	if (ret)
>> +		return ret;
>> +
>>   	ret = rmi_realm_activate(virt_to_phys(realm->rd));
>>   	if (ret)
>>   		return -ENXIO;
> 
> relam guest already does.
> 	for_each_mem_range(i, &start, &end) {
> 		if (rsi_set_memory_range_protected_safe(start, end)) {
> 			panic("Failed to set memory range to protected: %pa-%pa",
> 			      &start, &end);
> 		}
> 	}
> 
> if so why is host required to do this ?

Ideally this should be a call from the VMM (i.e., user). Irrespective of
what the guest does (which the host has no knowledge about), the VMM/
user is better aware of what to do for a given guest. We have done this
implicitly in the KVM as a start, to keep the initial implementation
simple. This could be moved out to the VMM as UABI, if there is
sufficient demand for it.

TL,DR: This should be a host/deployer decision, not the Guest. There
may other guest OS, which do not do RIPAS_RAM early enough.

Suzuki






