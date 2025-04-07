Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FE6C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nk+NCAHcg4JBvmzwCcPZcWCjL0/f2yMc6PoTFU9DwbY=; b=gYFrZK/l1sPzkwmDoOdRhCMB/h
	bJg57wkj8xR8ZdPeF8j3QulLIx8CMllqpFnWAVj+elHDbdxmA+JJGneVOm0fBWvrPktDdit5Sab8m
	FVLvluu+HGy9kUEFCaRncDj5bxAPArEuq1CEGmoVuVQeZNMzUVntVePIQiNwl3T27pZ+XcNIBFYre
	xXMAjer4E5ZMctSIp+5Nf0qYIT/qtpJ8jYbWyjF3rqE6hZLSNUT0tMptGljaqoU75cb+eVoDLbeKx
	6mzreZ+xkHzmgD4Wy/HQAWtB+iIreTlUYofz4/LbWAw/G1llboCCqPDAZxCPpdCmSTzq7lKhHvU5L
	Y06S3utA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYH-00000001cie-2YK2;
	Mon, 07 Apr 2025 18:50:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pQx-00000001EIl-3TZJ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 16:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nk+NCAHcg4JBvmzwCcPZcWCjL0/f2yMc6PoTFU9DwbY=; b=jEi8b76jYCL9JRec8p7Acxwb4V
	a2Y/m/SpHmhMnFF2CmObQCTU7wpYosRT0a+767BENEKUCOZ+kC+cNRTdabQ36DjbVW3f1aaKXc5Gz
	aGNK2uNUL+a6mIFGxbV1V4+D4CmnFwaKskKuEA4ssB//1yIbMqoZD51xT7El4G0JkQOHDhe5AzhGC
	5qlVkSERqQpBQV+3mdgdrznvhn2LX8ZSwGse09/G7VEXto8lZu51kZat3Dtco+r0sgltuZKn2aTWt
	nRGZ/zvKc2AWMp9A68UGna34ePoGXlDAjkpibKRDcumZb11HS/gp+BfwEvUNyxNE+8zKPYIlBYa9X
	KJIcbFUg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pQu-000000083xX-2tEj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 16:34:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AA4112FC;
	Mon,  7 Apr 2025 09:34:49 -0700 (PDT)
Received: from [10.57.17.31] (unknown [10.57.17.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD2023F694;
	Mon,  7 Apr 2025 09:34:43 -0700 (PDT)
Message-ID: <29103a40-bea4-4e00-a183-83d9c678a935@arm.com>
Date: Mon, 7 Apr 2025 17:34:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 30/45] arm64: RME: Always use 4k pages for realms
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
 <20250213161426.102987-31-steven.price@arm.com>
 <9d32bfed-31f2-49ad-ae43-87e60957ad74@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <9d32bfed-31f2-49ad-ae43-87e60957ad74@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_173449_185421_0D54F0EC 
X-CRM114-Status: GOOD (  26.37  )
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

On 04/03/2025 06:23, Gavin Shan wrote:
> On 2/14/25 2:14 AM, Steven Price wrote:
>> Always split up huge pages to avoid problems managing huge pages. There
>> are two issues currently:
>>
>> 1. The uABI for the VMM allows populating memory on 4k boundaries even
>>     if the underlying allocator (e.g. hugetlbfs) is using a larger page
>>     size. Using a memfd for private allocations will push this issue onto
>>     the VMM as it will need to respect the granularity of the allocator.
>>
>> 2. The guest is able to request arbitrary ranges to be remapped as
>>     shared. Again with a memfd approach it will be up to the VMM to deal
>>     with the complexity and either overmap (need the huge mapping and add
>>     an additional 'overlapping' shared mapping) or reject the request as
>>     invalid due to the use of a huge page allocator.
>>
>> For now just break everything down to 4k pages in the RMM controlled
>> stage 2.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>   arch/arm64/kvm/mmu.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
> 
> The change log looks confusing to me. Currently, there are 3 classes of
> stage2 faults,
> handled by their corresponding handlers like below.
> 
> stage2 fault in the private space: private_memslot_fault()
> stage2 fault in the MMIO space:    io_mem_abort()
> stage2 fault in the shared space:  user_mem_abort()
> 
> Only the stage2 fault in the private space needs to allocate a 4KB page
> from guest-memfd.
> This patch is changing user_mem_abort(), which is all about the stage2
> fault in the shared
> space, where a guest-memfd isn't involved. The only intersection between
> the private/shared
> space is the stage2 page table. I'm guessing we want to have enforced
> 4KB page is due to
> the shared stage2 page table by the private/shared space, or I'm wrong.
> 
> What I'm understanding from the change log: it's something to be
> improved in future due to
> only 4KB pages can be supported by guest-memfd. Please correct me if I'm
> wrong.

Yes that commit message is confusing - I'll have a go at rewriting.

The issues are:

 1. The RMM spec (as it stands) says the guest is free to request a
RIPAS change at 4k granularity.

 2. We have no reasonable allocator to allow mapping part of a huge page
in the protected half of the guest's and the other part in the shared half.

Issue (1) also causes problems with larger page size in the host. We
have plans for a RHI (Realm Host Interface) to allow the guest to
discover the host's page size so it can size RIPAS changes appropriately.

Issue (2) is (hopefully) going to be solved by guest_memfd in the
future. I'm hoping in the future guest_memfd will be able to allocate
from a suitable allocator (e.g. hugetlbfs) *AND* it allow mmap() of
pages which are transitioned to shared. The VMM can then provide the
same physical pages for use in the shared region as were originally
provided in the protected region. This means a share/unshare sequence
can get back to a situation where a huge page can once again be used in
the guest's stage 2 (RTTs in RMM speak).

Without a solution to issue 2 then it's hard for the VMM to get hold of
memory which is suitably contiguous/aligned and deal with the guest
potentially wanting to share any portion of it.

When the mmap() support that Fuad has been working on lands it might be
worth revisiting for an opportunistic support for huge pages. But we
really also need the integration with a suitable huge page allocator for
it to work well (i.e. guest_memfd supporting larger page sizes natively).

Thanks,
Steve

>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index 994e71cfb358..8c656a0ef4e9 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -1641,6 +1641,10 @@ static int user_mem_abort(struct kvm_vcpu
>> *vcpu, phys_addr_t fault_ipa,
>>       if (logging_active || is_protected_kvm_enabled()) {
>>           force_pte = true;
>>           vma_shift = PAGE_SHIFT;
>> +    } else if (vcpu_is_rec(vcpu)) {
>> +        // Force PTE level mappings for realms
>> +        force_pte = true;
>> +        vma_shift = PAGE_SHIFT;
>>       } else {
>>           vma_shift = get_vma_page_shift(vma, hva);
>>       }
> 
> Thanks,
> Gavin
> 


