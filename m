Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8B0C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjYTXGS1I+G3s2Zx0RzTXvGfd9gK/2FScJL9IfzQqtE=; b=O5N/5AIGxU9XMhngGZsUCxGpNV
	pd12RloHN7e2Ir84jLG/hUKCZ4KcWJhWbrujdAoYCUK7fY5O5wPZD5bqux4dc/eY7eMMC+v2AoRIu
	OjQhjeFmw1893W8siwXlKhfDzWFBHIlmlIxq9Q2I84MyaeJ6kcNtt/NTFqVSvpzhr5zaNGpj/Me6K
	8oql89eIL6iBJKEAi5IYdsbM2Qc2y3aJ4UFbAe+R4TJNjZlFgap6gC83+bCgySLHmL1zdPFHFXbAn
	f3T0MJh9gqBiGYS9a/QX8B8KWLWSKCLBbirriJNPKNf83FkLCnGLgJT2FjGv5EYVIoBheLrLArzp5
	rotjaHTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4qW-0000000FgsB-2I3V;
	Wed, 12 Aug 2026 09:02:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4qT-0000000FgrY-26nt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:01:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE1441596;
	Wed, 12 Aug 2026 02:01:51 -0700 (PDT)
Received: from [10.57.44.219] (unknown [10.57.44.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE2753F86F;
	Wed, 12 Aug 2026 02:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786525315; bh=fhi1CG9KJ7r5EFbdg94wZP9tdmI61cXorDFoinPpFvI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QGPEfFKybXe6rNomdv0fzgoUx1xUydEqGfiSseGhGVM9AgQ2oBiMSL++OZ1Z6BDei
	 +U9WxgtH3yQbk+rt/X7cx2cSz05c1xdVZ1kJ0xtqt3bmOl2mIEkr28sEjAiJ86XpQm
	 sXbjd99E1hsDc3d4VRdqy/3aroVUYRnmw2mUPcuo=
Message-ID: <b512db4b-793b-4dd1-baac-e873b39f5b0b@arm.com>
Date: Wed, 12 Aug 2026 10:01:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 29/45] KVM: arm64: CCA: Support runtime faulting of
 memory
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>,
 Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, Marc Zyngier
 <maz@kernel.org>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-30-steven.price@arm.com> <antC5JOxDPs7i876@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <antC5JOxDPs7i876@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_020157_671567_2DC1E715 
X-CRM114-Status: GOOD (  29.68  )
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

On 11/08/2026 16:42, Catalin Marinas wrote:
> On Mon, Aug 03, 2026 at 02:43:45PM +0100, Steven Price wrote:
>> At runtime if the realm guest accesses memory which hasn't yet been
>> mapped then KVM needs to either populate the region or fault the guest.
>>
>> For memory in the lower (protected) region of IPA a fresh page is
>> provided to the RMM which will zero the contents. For memory in the
>> upper (shared) region of IPA, the memory from the memslot is mapped
>> into the realm VM non secure.
> 
> Is this still true with in-place guestmem conversion?
> 
>> @@ -1693,7 +1709,14 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>>   	kvm_fault_lock(kvm);
>>   	if (mmu_invalidate_retry(kvm, mmu_seq)) {
>>   		ret = -EAGAIN;
>> -		goto out_unlock;
>> +		goto out_release_page;
>> +	}
>> +
>> +	if (kvm_is_realm(kvm)) {
>> +		prot &= ~KVM_PGTABLE_PROT_X;
>> +		ret = realm_map_ipa(kvm, s2fd->fault_ipa, pfn,
>> +				    PAGE_SIZE, prot, memcache);
>> +		goto out_release_page;
>>   	}
> 
> [...]
> 
>> +int realm_map_ipa(struct kvm *kvm, phys_addr_t ipa,
>> +		  kvm_pfn_t pfn, unsigned long map_size,
>> +		  enum kvm_pgtable_prot prot,
>> +		  struct kvm_mmu_memory_cache *memcache)
>> +{
>> +	struct realm *realm = &kvm->arch.realm;
>> +
>> +	ipa = ALIGN_DOWN(ipa, map_size);
>> +	if (!kvm_realm_is_private_address(realm, ipa)) {
>> +		return realm_map_non_secure(kvm, ipa, pfn, map_size, prot,
>> +					    memcache);
>> +	}
>> +
>> +	/* It's impossible to map protected pages read-only. */
>> +	if (WARN_ON(!(prot & KVM_PGTABLE_PROT_W)))
>> +		return -EFAULT;
>> +	return realm_map_protected(kvm, ipa, pfn, map_size, memcache);
>> +}
> 
> I was trying to understand (with the help of some LLMs) to understand
> whether we can end up on the do_gpf() path as a result of VMM actions.
> The above kvm_realm_is_private_address() only checks for the IPA but
> does not check against guestmem if the page is truly private. I probably
> miss something but the scenario would be something like:
> 
> 1. VMM creates the gmem region with GUEST_MEMFD_FLAG_MMAP |
>     GUEST_MEMFD_FLAG_INIT_SHARED, mmap()able and GUP-pinnable
> 
> 2. VMM starts an O_DIRECT write() from that mapping; the block layer
>     FOLL_PINs the shared folio
> 
> 3. VMM runs a vCPU so the realm touches the protected-IPA alias of the
>     same gfn. gmem_abort() delegates the pinned, still-shared page to
>     the RMM
> 
> 4. The in-flight I/O then reads the now-Realm page from the kernel
>     linear map. That access takes a GPF at EL1, so do_gpf() ->
>     die_kernel_fault()

This is correct. The fundamental issue is that we have a disconnect
between the "gmem attribute" changes (to private/shared) and the
RIPAS and this is something we want to fix.

e.g., the KVM CCA driver sets the entire DRAM to RIPAS_RAM for
the Realm before ACTIVATION and we expect that the VMM changes
the gmem to PRIVATE. They both are not in sync. his is something
we were discussing the other day with Aneesh.

Once they are in sync, we are protected. If the RIPAS=EMPTY
(gmem=shared) a stage2 fault doesn't come to the Host.

If the RIPAS=RAM, the gmem is private and there are no usespace
mappings.

The reason why it is disconnected at the moment is due to the
weird semantics for Guest triggered conversions in CCA
i.e., Realm requests via RSI_IPA_STATE_SET, triggering a RIPAS_CHANGE
exit to the KVM.

The KVM exits to VMM with MEMORY_FAULT_EXIT and the VMM can service this
by invoking GMEM(SET_ATTRIBUTES2). But, the KVM needs to invoke the
RMI_RTT_SET_RIPAS in the context of the "vcpu", which we don't have
from the "kvm" context. I guess we can fix it by running through the
vcpus and find the matching one with the "ipa" range and the "ripas".

And as for the VMM requests before the Realm is activated, we could
map that to RMI_RTT_INIT_RIPAS and removing the implicit change
from KVM arm64.


Thanks
Suzuki


> 
> x86, IIUC, also checks kvm_gmem_is_private(). They also have
> kvm_arch_gmem_make_private() triggered on the kvm_gmem_get_pfn() path
> but I got lost in the call sites, not sure whether that's strictly
> needed if we check both private IPA and kvm_gmem_is_private().
> 


