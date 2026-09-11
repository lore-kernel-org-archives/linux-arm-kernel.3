Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F37AC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 17:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muvJC7k8KTpjcFHhJ1hhTgBRd7/K/1cli/eVNkkhn5I=; b=n2i72nqjqaXTestkpUAogvxtHS
	1lP5izx9bOmFMLY3kyp+CnDM7ERK1rRtJVHu5JKKIlG878/YNLcw3hCKZyadBB3tsJaGhT6Fyxknq
	SJqcbfWm2m0q71LshoaOqPak0Yi3QDDeezQJXassEMd9HiP/MNV7rrVvvOEkbnsJifJPS+6wEfY7l
	CvCbS9xrzwUgnpkPPnXx37i12gM8g75DQDhTsIckVe/lHDsqouhUbA6kypIJUATNbr0YnneKRN/15
	jCSlFkmaWqQtLBPgS4+D4R02+N7CQCSheWKFMDshaLfiiBL9AqpSVtQA6L2X08Rc6ZAtv1H3yHqBy
	dLJRVBFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54iG-0000000HIcR-2gAx;
	Fri, 11 Sep 2026 17:06:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54iD-0000000HIbm-1FR9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 17:06:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B93052BC4;
	Fri, 11 Sep 2026 10:06:47 -0700 (PDT)
Received: from [10.0.129.245] (unknown [10.0.129.245])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D76C43F8C6;
	Fri, 11 Sep 2026 10:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789146411; bh=iYc224HVLNEwOM+E5VmwftikDmpBHmWPgmQEnoXMLfY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l4fT04OUrni6Z4HR+NgfvsLj68HjcJYmApfDq0mAvFgxabFySfElBUH4mCR083sZ2
	 0nQoOI7JZzc9g8pB/kNVXPDwrBmcOzVtK+EagOc6U6uFozqLOFWXSiow/zF+/TSTeC
	 pj7KXVu+1evZT8G8fEGH/2Jlg8opz98ZmrVhZIRk=
Message-ID: <06535dcb-265d-4602-a970-e6c584a01d1a@arm.com>
Date: Fri, 11 Sep 2026 18:06:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 03/20] KVM: arm64: Track the type of VM in kvm_arch
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, will@kernel.org,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-4-suzuki.poulose@arm.com>
 <86fqzf7okc.wl-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <86fqzf7okc.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_100653_422237_2E842716 
X-CRM114-Status: GOOD (  25.41  )
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

Hi Marc,

On 11/09/2026 17:14, Marc Zyngier wrote:
> On Tue, 08 Sep 2026 17:22:06 +0100,
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>> KVM arm64 has different types of VMs with all the different modes in which the
>> hypervisor code can be run. e.g., VHE, nVHE, PKVM etc. Then there is protected
>> VM and normal VMs with PKVM. We might soon add other types, e.g., Arm CCA Realm.
>> So in an effort to make the handling of these different types of VMs a bit more
>> friendlier to the eyes, add a VM flavor to the kvm_arch and we could then add
>> handlers for different operations based on the VM type.
>>
>> Keep the flavor initialisation at the beginning to allow for the detection
>> early enough and fail out on any unsupported requests. (e.g., protected on !PKVM)
>>
>> With that, use the vm_flavor to detect if a VM is protected VM on PKVM.
>>
>> Based on a patch by Marc Zyngier
>>
>> Suggested-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/include/asm/kvm_host.h | 12 ++++++++++--
>>   arch/arm64/kvm/arm.c              | 27 ++++++++++++++++++++++++---
>>   arch/arm64/kvm/hyp/nvhe/pkvm.c    |  2 +-
>>   arch/arm64/kvm/pkvm.c             |  1 -
>>   4 files changed, 35 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index 27fe0cd5b2d7a..d0dccc9ad6aa8 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -257,7 +257,6 @@ struct kvm_protected_vm {
>>   	pkvm_handle_t handle;
>>   	struct kvm_hyp_memcache teardown_mc;
>>   	struct kvm_hyp_memcache stage2_teardown_mc;
>> -	bool is_protected;
>>   	bool is_created;
>>   
>>   	/*
>> @@ -306,9 +305,18 @@ enum fgt_group_id {
>>   	__NR_FGT_GROUP_IDS__
>>   };
>>   
>> +enum kvm_arm_vm_flavor {
>> +	VM_NVHE,
>> +	VM_VHE,
>> +	VM_PKVM,		/* Normal guests on PKVM */
>> +	VM_PROTECTED_PKVM,	/* Protected VM */
>> +	VM_FLAVOR_MAX,
>> +};
>> +
> 
> My original design did introduce classes of VMs, which I definitely
> want to retain so that we don't pointlessly differentiate CCA VMs from
> pKVM protected guests when at all possible. Realms are protected VMs,
> full stop.
> 
> With that in mind, this should read:
> 
> enum kvm_arm_vm_flavor {
> 	VM_NVHE,
> 	VM_VHE,
> 	VM_PKVM,		/* Normal guests on PKVM */
> 	MARKER(__VM_FLAVOR_PROTECTED__),
> 	VM_PROTECTED_PKVM,	/* Protected VM */
> 	VM_REALM,		/* CCA */
> 	VM_FLAVOR_MAX,
> };

There is something similar later in the series, that adds : 
"Confidential" guests in Patch 8, which makes this :

  	VM_NVHE,
  	VM_VHE,
  	VM_PKVM,		/* Normal guests on PKVM */
+	MARKER(__VM_CONFIDENTIAL),
  	VM_PROTECTED_PKVM,	/* Protected VM */
  	VM_REALM,		/* CCA */
  	VM_FLAVOR_MAX,
@@ -1524,9 +1525,11 @@ struct kvm *kvm_arch_alloc_vm(void);

  #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE

+#define kvm_vm_is_confidential(kvm)	((kvm)->arch.vm_flavor >= 
__VM_CONFIDENTIAL)
  #define kvm_vm_is_protected(kvm)	((kvm)->arch.vm_flavor == 
VM_PROTECTED_PKVM)
  #define kvm_vm_is_realm(kvm)		((kvm)->arch.vm_flavor == VM_REALM)

+#define vcpu_is_confidential(vcpu)	kvm_vm_is_confidential((vcpu)->kvm)
  #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
  #define vcpu_is_rec(vcpu)		kvm_vm_is_realm((vcpu)->kvm)



> 
>>   struct kvm_arch {
>>   	struct kvm_s2_mmu mmu;
>>   
>> +	enum kvm_arm_vm_flavor vm_flavor;
>>   	/*
>>   	 * Fine-Grained UNDEF, mimicking the FGT layout defined by the
>>   	 * architecture. We track them globally, as we present the
>> @@ -1504,7 +1512,7 @@ struct kvm *kvm_arch_alloc_vm(void);
>>   
>>   #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
>>   
>> -#define kvm_vm_is_protected(kvm)	(is_protected_kvm_enabled() && (kvm)->arch.pkvm.is_protected)
>> +#define kvm_vm_is_protected(kvm)	((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM)
> 
> and this should read ((kvm)->arch.vm_flavor >= __VM_FLAVOR_PROTECTED__).

Ack.  Didn't want to change "kvm_vm_is_protected()" to broaden the 
scope, as it is widely used already for "Protected PKVM".  And if we
need to check Realm vs Protected VM, that might make it tricky.
  I will see how this is required in the end result (in my integration
branch), to see if we really need to distinguish Protected PKVM vs REALM
in any cases.


Cheers
Suzuki


> 
> Thanks,
> 
> 	M.
> 


