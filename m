Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013B6CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axC4LDVOJsVlW/fdoP4BPdGRq/gYDshEFRg+pfkCn2A=; b=3g8KZtXVO0BVnD9R9/9ttA1mj9
	F5WIf38hjdVqjzkPIelRtVXc81ikn4BszmX303PLb3nuQk8+rkYoTjdiA3pjgBFeP3vIzCIiUAb56
	7M4TyLq4XF02DcQfNb+GqA43V5lbQVKM9kqyePceVdLTd8KUxJW6y1juZk89ao5C+uEaQPm3rt4Wv
	KH7mhA/xF/jZyL+ODfMhraNVOJ7c4OVIdv9y1jFqO6g9FGF3wWL7V/XgseCkc4IFWH8bWtFmIEO+z
	heCo7v800jI6rsP9/qY++2ja2a31WaWWTc+xxDQgY+o3KQl0mTgS/jq8fsD2v9kFg0Sy8zi9UzOHI
	tKf4iJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfPe-0000000By6i-1lZ2;
	Fri, 02 Oct 2026 15:43:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfPY-0000000By4a-2HMk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:43:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AFC2169C;
	Fri,  2 Oct 2026 08:42:56 -0700 (PDT)
Received: from [10.57.8.170] (unknown [10.57.8.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 288203F882;
	Fri,  2 Oct 2026 08:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790955779; bh=r8+UnxmyfA5EDSuksv2pnxeyK5XiuiA24DSSA+ymriQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dzh5F1AKrpbHWa673YlUnb+QaPBv+ryTwN2qA0v7GExcq5nJEtJAKOdiFHBJNPEFP
	 pFwajcDOxIV5F67JsKcpzvdtetsme/gidZj8IvCCmDJwCBdfv+qHhDNUFcqS9aqjss
	 UiKs9r9V+zuQQ5J1dugVGegGFqHZdLdg0ZgZZMCw=
Message-ID: <87659487-6a77-4b04-907a-859e1738395e@arm.com>
Date: Fri, 2 Oct 2026 16:42:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 05/23] KVM: arm64: Track the type of VM in kvm_arch
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 gshan@redhat.com, joey.gouly@arm.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <20261001210703.1597150-6-suzuki.poulose@arm.com>
 <CA+EHjTxtatPyGcyvEyR129cqUiAYcO_cxRVtwZO0ckZsOnD7TA@mail.gmail.com>
 <86se2o2rbs.wl-maz@kernel.org>
 <CA+EHjTwHuJ0u_TTP46zNFKFmBP124XHHLUVhkAUSyfhe92=41w@mail.gmail.com>
 <86pkxs2npx.wl-maz@kernel.org> <10563362-5964-4ef7-b5d7-fe1d67ce4adb@arm.com>
 <86mrsw2jrn.wl-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <86mrsw2jrn.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_084300_670080_7728F7C3 
X-CRM114-Status: GOOD (  16.47  )
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

On 02/10/2026 16:40, Marc Zyngier wrote:
> On Fri, 02 Oct 2026 16:15:07 +0100,
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>>> index 0f4e8b71fa85d..9ba86450fe4af 100644
>>> --- a/arch/arm64/kvm/mmu.c
>>> +++ b/arch/arm64/kvm/mmu.c
>>> @@ -2624,7 +2624,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>>>    	hva_t hva, reg_end;
>>>    	int ret = 0;
>>>    -	if (kvm_vm_is_protected_pkvm(kvm)) {
>>> +	if (kvm_vm_is_protected(kvm)) {
>>
>> We have slightly different handling for Realms. The final code for this
>> looks like :
>>
>> 	if (kvm_vm_is_protected(kvm)) {
>> 		if (new &&
>> 		    new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)) {
>> 			return -EPERM;
>> 		}
>> 	}
>>
>> 	if (kvm_vm_is_protected_pkvm(kvm)) {
>> 		/* Cannot modify memslots once a pVM has run. */
>> 		if (pkvm_hyp_vm_is_created(kvm) &&
>> 		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE)) {
>> 			return -EPERM;
>> 		}
>> 	} else if (kvm_realm_is_created(kvm)) {
>> 		/*
>> 		 * Once the Realm is created, we cannot modify any slots that
>> 		 * could be providing private memory. i.e., guest_memfd backed
>> 		 * slots.
>> 		 * TODO: Handle trusted device private memory slots
>> 		 */
>> 		if (kvm_slot_has_gmem(old) || kvm_slot_has_gmem(new))
>> 			return -EPERM;
>> 	}
>>
>>
>> Of course we could invert the checks to detect vm_is_protected_pkvm()
> 
> This is how I expect this stuff to be written.
> 
> 	if (kvm_vm_is_protected(kvm) && new &&
> 	    new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY))
> 		return -EPERM;
> 
> 	switch (kvm->vm_flavor) {
> 	case VM_PROTECTED_PKVM:
> 		/* Cannot modify memslots once a pVM has run. */
> 		if (pkvm_hyp_vm_is_created(kvm) &&
> 		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE)) {
> 			return -EPERM;
> 		break;
> 	case VM_CCA:
> 		/*
> 		 * Once the Realm is created, we cannot modify any slots that
> 		 * could be providing private memory. i.e., guest_memfd backed
> 		 * slots.
> 		 * TODO: Handle trusted device private memory slots
> 		 */
> 		if (kvm_realm_is_created(kvm) &&
> 		    (kvm_slot_has_gmem(old) || kvm_slot_has_gmem(new)))
> 			return -EPERM;
> 		break;
> 	default:
> 		break;
> 	}
> 

Yep, we can do that.

Cheers
Suzuki


> We have an enumeration. Make use of it. And the whole "is_created"
> crap needs to be sorted one way or another.
> 
> 	M.
> 


