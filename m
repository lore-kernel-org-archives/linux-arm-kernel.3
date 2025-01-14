Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04A7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 09:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZ2Ys4n7YpWJ+MkNI3A+iCHngSyL6MbGSCArR64zRwg=; b=ZYZpsTW32uRMkqTKkCoKbebtQ3
	ieIMCS4fV+C2U3Gc2lNs3zlLHAVCpG4H3+LxjaSoJhXarRKFGoWHtqUqMWKFAqF7UGVUMmaj2o5M7
	3Vj7ZlQRt0mMTRFbmNYdvBggkMr9IlmCOLBj85vtPh6HzCZV/rBYwr5Ha5gXJv7YmLT9FyUX/qiHO
	QCPLMyeWLNFdeA6w+/96GRiGhNBdIHRR57uegOXRwDPAD1TvT16Em8QxmdxaTnGIL8w6K7S73UId2
	vSVcAvxULKmZH+PrXrQBfMU/2wJQ/GEzmJbh4umfpmekCImNaKmgsDxTt/3zWmrX0GhBddCsj9qeB
	ff6MEyFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdgT-000000080ld-2oo2;
	Tue, 14 Jan 2025 09:58:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXde5-000000080EN-1Qb6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 09:55:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AD7D11FB;
	Tue, 14 Jan 2025 01:56:04 -0800 (PST)
Received: from [10.57.35.117] (unknown [10.57.35.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C9713F792;
	Tue, 14 Jan 2025 01:55:33 -0800 (PST)
Message-ID: <bfd6361b-1a6f-43e5-9ad1-80692c146d61@arm.com>
Date: Tue, 14 Jan 2025 09:55:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] KVM: arm64: MTE: Use stage-2 NoTagAccess memory
 attribute if supported
Content-Language: en-GB
To: Peter Collingbourne <pcc@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, Steven Price <steven.price@arm.com>,
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>
References: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
 <20250110110023.2963795-6-aneesh.kumar@kernel.org> <Z4Fk58k8YptDkVgm@arm.com>
 <yq5amsfxtrlw.fsf@kernel.org> <Z4Vk5gTnd8o7VKWL@arm.com>
 <CAMn1gO4huP4D_1mFdC8FsmvHkaQn+hC02ULcfBuS30VDM9=9gA@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CAMn1gO4huP4D_1mFdC8FsmvHkaQn+hC02ULcfBuS30VDM9=9gA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_015537_463383_D5774119 
X-CRM114-Status: GOOD (  27.87  )
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

Hi,


On 13/01/2025 20:47, Peter Collingbourne wrote:
> On Mon, Jan 13, 2025 at 11:09 AM Catalin Marinas
> <catalin.marinas@arm.com> wrote:
>>
>> On Sat, Jan 11, 2025 at 06:49:55PM +0530, Aneesh Kumar K.V wrote:
>>> Catalin Marinas <catalin.marinas@arm.com> writes:
>>>> On Fri, Jan 10, 2025 at 04:30:21PM +0530, Aneesh Kumar K.V (Arm) wrote:
>>>>> Currently, the kernel won't start a guest if the MTE feature is enabled
>>>
>>> ...
>>>
>>>>> @@ -2152,7 +2162,8 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>>>>>             if (!vma)
>>>>>                     break;
>>>>>
>>>>> -          if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
>>>>> +          if (kvm_has_mte(kvm) &&
>>>>> +              !kvm_has_mte_perm(kvm) && !kvm_vma_mte_allowed(vma)) {
>>>>>                     ret = -EINVAL;
>>>>>                     break;
>>>>>             }
>>>>
>>>> I don't think we should change this, or at least not how it's done above
>>>> (Suzuki raised a related issue internally relaxing this for VM_PFNMAP).
>>>>
>>>> For standard memory slots, we want to reject them upfront rather than
>>>> deferring to the fault handler. An example here is file mmap() passed as
>>>> standard RAM to the VM. It's an unnecessary change in behaviour IMHO.
>>>> I'd only relax this for VM_PFNMAP mappings further down in this
>>>> function (and move the VM_PFNMAP check above; see Suzuki's internal
>>>> patch, unless he posted it publicly already).

For the record, here is the patch Catalin was referring to.


--->8---

kvm: arm64: Allow device mappings with MTE

When a VM is configured to use MTE, we prevent mapping a "Device" to the VM.

e.g: with kvmtool (with additional debugging to dump error code and 
addresses)

$ lkvm run ... --vfio 0000:01:00.0 ...

  Info: Using IOMMU type 3 for VFIO container
    Error: 0000:01:00.0: failed to register region with KVM 
50020000-50022000: -22
       Warning: [0abc:aced] Error activating emulation for BAR 0
       Error: 0000:01:00.0: failed to configure regions
       Warning: Failed init: vfio__init

Only check for the MTE allowed for a VMA if it is not backed by "device"

Fixes: ea7fc1bb1cd1b ("KVM: arm64: Introduce MTE VM feature")
Cc: Steven Price <steven.price at arm.com>
Cc: Marc Zyngier <maz at kernel.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose at arm.com>
---
  arch/arm64/kvm/mmu.c | 8 +++-----
  1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 8b2d803e558a..7e084f22e185 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2295,17 +2295,15 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
  		if (!vma)
  			break;

-		if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
-			ret = -EINVAL;
-			break;
-		}
-
  		if (vma->vm_flags & VM_PFNMAP) {
  			/* IO region dirty page logging not allowed */
  			if (new->flags & KVM_MEM_LOG_DIRTY_PAGES) {
  				ret = -EINVAL;
  				break;
  			}
+		} else if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
+			ret = -EINVAL;
+			break;
  		}
  		hva = min(reg_end, vma->vm_end);
  	} while (hva < reg_end);
-- 
2.34.1


Suzuki


>>>
>>> But we want to handle memslots backed by pagecache pages for virtio-shm
>>> here (virtiofs dax use case).
>>
>> Ah, I forgot about this use case. So with virtiofs DAX, does a host page
>> cache page (host VMM mmap()) get mapped directly into the guest as a
>> separate memory slot? In this case, the host vma would not have
>> VM_MTE_ALLOWED set.
>>
>>> With MTE_PERM, we can essentially skip the
>>> kvm_vma_mte_allowed(vma) check because we handle all types in the fault
>>> handler.
>>
>> This was pretty much the early behaviour when we added KVM support for
>> MTE, allow !VM_MTE_ALLOWED and trap them later. However, we disallowed
>> VM_SHARED because of some non-trivial race. Commit d89585fbb308 ("KVM:
>> arm64: unify the tests for VMAs in memslots when MTE is enabled")
>> changed this behaviour and the VM_MTE_ALLOWED check happens upfront. A
>> subsequent commit removed the VM_SHARED check.
>>
>> It's a minor ABI change but I'm trying to figure out why we needed this
>> upfront check rather than simply dropping the VM_SHARED check. Adding
>> Peter in case he remembers. I can't see any race if we simply skipped
>> this check altogether, irrespective of FEAT_MTE_PERM.
> 
> I don't see a problem with removing the upfront check. The reason I
> kept the check was IIRC just that there was already a check there and
> its logic needed to be adjusted for my VM_SHARED changes.
> 
> Peter


