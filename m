Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE922D58E48
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 16:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1u0ikuMZRgeVlFjG0fVn3f/YJeQoEzB4q9OdPimwIds=; b=eIghlHYyHQGka++KrD3xXeokxk
	CC5BfEBxa+A7MZrcxzewOlNMDpyy3vk2pqSwaAcSH5Blj/1IJVB9sRBBr0JgXb/w9RWFbChLsx2w9
	1c4Yd83lIf8Xu84WwkQ9U9BKzFcO2QnPTselFH1SalzAz5GcFASCaiypjuqfxbPeUIb1n0YxtqPGi
	dWDvfFRJdNwHvHWXgoErqgK0T4ZU1s3f7BIOhj6f4MQLgsummc4hX+dZs6LfEXa37v2Wqg7Y8eQQq
	pMo1RtPoWJawKfG5HbnNm4guxuIxFW1LhgvKcWtuW9ZNc5Rum398aPjKhrWmgbvY8izrWShJo8XKO
	lAxOJFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6QD-0000000DWd7-1Oxg;
	Mon, 02 Mar 2026 16:47:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6QA-0000000DWca-2Miy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 16:47:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67C6714BF;
	Mon,  2 Mar 2026 08:46:54 -0800 (PST)
Received: from [10.57.55.216] (unknown [10.57.55.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA0543F694;
	Mon,  2 Mar 2026 08:46:54 -0800 (PST)
Message-ID: <782ffcc2-1a72-46f0-a0c7-f1277fb84ced@arm.com>
Date: Mon, 2 Mar 2026 16:46:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 20/46] arm64: RMI: Allow populating initial contents
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20251217101125.91098-1-steven.price@arm.com>
 <20251217101125.91098-21-steven.price@arm.com> <86qzq28elj.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <86qzq28elj.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_084702_704311_B66B1050 
X-CRM114-Status: GOOD (  35.39  )
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

On 02/03/2026 14:56, Marc Zyngier wrote:
> On Wed, 17 Dec 2025 10:10:57 +0000,
> Steven Price <steven.price@arm.com> wrote:
>>
>> The VMM needs to populate the realm with some data before starting (e.g.
>> a kernel and initrd). This is measured by the RMM and used as part of
>> the attestation later on.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v11:
>>  * The multiplex CAP is gone and there's a new ioctl which makes use of
>>    the generic kvm_gmem_populate() functionality.
>> Changes since v7:
>>  * Improve the error codes.
>>  * Other minor changes from review.
>> Changes since v6:
>>  * Handle host potentially having a larger page size than the RMM
>>    granule.
>>  * Drop historic "par" (protected address range) from
>>    populate_par_region() - it doesn't exist within the current
>>    architecture.
>>  * Add a cond_resched() call in kvm_populate_realm().
>> Changes since v5:
>>  * Refactor to use PFNs rather than tracking struct page in
>>    realm_create_protected_data_page().
>>  * Pull changes from a later patch (in the v5 series) for accessing
>>    pages from a guest memfd.
>>  * Do the populate in chunks to avoid holding locks for too long and
>>    triggering RCU stall warnings.
>> ---
>>  arch/arm64/include/asm/kvm_rmi.h |   4 +
>>  arch/arm64/kvm/Kconfig           |   1 +
>>  arch/arm64/kvm/arm.c             |   9 ++
>>  arch/arm64/kvm/rmi.c             | 175 +++++++++++++++++++++++++++++++
>>  4 files changed, 189 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
>> index 8a862fc1a99d..b5e36344975c 100644
>> --- a/arch/arm64/include/asm/kvm_rmi.h
>> +++ b/arch/arm64/include/asm/kvm_rmi.h
>> @@ -99,6 +99,10 @@ int kvm_rec_enter(struct kvm_vcpu *vcpu);
>>  int kvm_rec_pre_enter(struct kvm_vcpu *vcpu);
>>  int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_status);
>>  
>> +struct kvm_arm_rmi_populate;
>> +
>> +int kvm_arm_rmi_populate(struct kvm *kvm,
>> +			 struct kvm_arm_rmi_populate *arg);
>>  void kvm_realm_unmap_range(struct kvm *kvm,
>>  			   unsigned long ipa,
>>  			   unsigned long size,
>> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
>> index 1cac6dfc0972..b495dfd3a8b4 100644
>> --- a/arch/arm64/kvm/Kconfig
>> +++ b/arch/arm64/kvm/Kconfig
>> @@ -39,6 +39,7 @@ menuconfig KVM
>>  	select GUEST_PERF_EVENTS if PERF_EVENTS
>>  	select KVM_GUEST_MEMFD
>>  	select KVM_GENERIC_MEMORY_ATTRIBUTES
>> +	select HAVE_KVM_ARCH_GMEM_POPULATE
>>  	help
>>  	  Support hosting virtualized guest machines.
>>  
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 7927181887cf..0a06ed9d1a64 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -2037,6 +2037,15 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>>  			return -EFAULT;
>>  		return kvm_vm_ioctl_get_reg_writable_masks(kvm, &range);
>>  	}
>> +	case KVM_ARM_RMI_POPULATE: {
>> +		struct kvm_arm_rmi_populate req;
>> +
>> +		if (!kvm_is_realm(kvm))
>> +			return -EPERM;
> 
> EPERM is odd. It isn't that the VMM doesn't have the right to do it,
> it is that it shouldn't have called that, because the ioctl doesn't
> exist for a normal VM. -ENOSYS?

Ack

>> +		if (copy_from_user(&req, argp, sizeof(req)))
>> +			return -EFAULT;
>> +		return kvm_arm_rmi_populate(kvm, &req);
>> +	}
>>  	default:
>>  		return -EINVAL;
>>  	}
>> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>> index fe15b400091c..39577e956a59 100644
>> --- a/arch/arm64/kvm/rmi.c
>> +++ b/arch/arm64/kvm/rmi.c
>> @@ -558,6 +558,150 @@ void kvm_realm_unmap_range(struct kvm *kvm, unsigned long start,
>>  		realm_unmap_private_range(kvm, start, end, may_block);
>>  }
>>  
>> +static int realm_create_protected_data_granule(struct realm *realm,
>> +					       unsigned long ipa,
>> +					       phys_addr_t dst_phys,
>> +					       phys_addr_t src_phys,
>> +					       unsigned long flags)
>> +{
>> +	phys_addr_t rd = virt_to_phys(realm->rd);
>> +	int ret;
>> +
>> +	if (rmi_granule_delegate(dst_phys))
>> +		return -ENXIO;
>> +
>> +	ret = rmi_data_create(rd, dst_phys, ipa, src_phys, flags);
>> +	if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
>> +		/* Create missing RTTs and retry */
>> +		int level = RMI_RETURN_INDEX(ret);
>> +
>> +		WARN_ON(level == RMM_RTT_MAX_LEVEL);
> 
> If this is unexpected, why do we still try to handle it? We should
> abort hard on anything that doesn't seem 100% correct, and mark the
> realm dead.

Well this is a "should never happen - the RMM (or Linux kerne) is buggy" 
situation - so it's not specifically the realm's fault. The "do nothing" 
error handling deals with things quite reasonably - the following 
realm_create_rtt_levels() call is a no-op, so we'll retry the 
rmi_data_create() call and bubble the error up.

I'll change this to KVM_BUG_ON so that the guest is killed just in case 
it turns out the guest can somehow trigger this maliciously.

>> +
>> +		ret = realm_create_rtt_levels(realm, ipa, level,
>> +					      RMM_RTT_MAX_LEVEL, NULL);
>> +		if (ret)
>> +			return -EIO;
>> +
>> +		ret = rmi_data_create(rd, dst_phys, ipa, src_phys, flags);
>> +	}
>> +	if (ret)
>> +		return -EIO;
>> +
>> +	return 0;
>> +}
>> +
>> +static int realm_create_protected_data_page(struct realm *realm,
>> +					    unsigned long ipa,
>> +					    kvm_pfn_t dst_pfn,
>> +					    kvm_pfn_t src_pfn,
>> +					    unsigned long flags)
>> +{
>> +	unsigned long rd = virt_to_phys(realm->rd);
>> +	phys_addr_t dst_phys, src_phys;
>> +	bool undelegate_failed = false;
>> +	int ret, offset;
>> +
>> +	dst_phys = __pfn_to_phys(dst_pfn);
>> +	src_phys = __pfn_to_phys(src_pfn);
>> +
>> +	for (offset = 0; offset < PAGE_SIZE; offset += RMM_PAGE_SIZE) {
>> +		ret = realm_create_protected_data_granule(realm,
>> +							  ipa,
>> +							  dst_phys,
>> +							  src_phys,
>> +							  flags);
>> +		if (ret)
>> +			goto err;
>> +
>> +		ipa += RMM_PAGE_SIZE;
>> +		dst_phys += RMM_PAGE_SIZE;
>> +		src_phys += RMM_PAGE_SIZE;
>> +	}
>> +
>> +	return 0;
>> +
>> +err:
>> +	if (ret == -EIO) {
>> +		/* current offset needs undelegating */
>> +		if (WARN_ON(rmi_granule_undelegate(dst_phys)))
>> +			undelegate_failed = true;
>> +	}
>> +	while (offset > 0) {
>> +		ipa -= RMM_PAGE_SIZE;
>> +		offset -= RMM_PAGE_SIZE;
>> +		dst_phys -= RMM_PAGE_SIZE;
>> +
>> +		rmi_data_destroy(rd, ipa, NULL, NULL);
>> +
>> +		if (WARN_ON(rmi_granule_undelegate(dst_phys)))
>> +			undelegate_failed = true;
>> +	}
>> +
>> +	if (undelegate_failed) {
>> +		/*
>> +		 * A granule could not be undelegated,
>> +		 * so the page has to be leaked
>> +		 */
>> +		get_page(pfn_to_page(dst_pfn));
>> +	}
>> +
>> +	return -ENXIO;
>> +}
>> +
>> +static int populate_region_cb(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>> +			      void __user *src, int order, void *opaque)
>> +{
>> +	struct realm *realm = &kvm->arch.realm;
>> +	unsigned long data_flags = *(unsigned long *)opaque;
>> +	phys_addr_t ipa = gfn_to_gpa(gfn);
>> +	int npages = (1 << order);
>> +	int i;
>> +
>> +	for (i = 0; i < npages; i++) {
>> +		struct page *src_page;
>> +		int ret;
>> +
>> +		ret = get_user_pages((unsigned long)src, 1, 0, &src_page);
>> +		if (ret < 0)
>> +			return ret;
>> +		if (ret != 1)
>> +			return -ENOMEM;
>> +
>> +		ret = realm_create_protected_data_page(realm, ipa, pfn,
>> +						       page_to_pfn(src_page),
>> +						       data_flags);
>> +
>> +		put_page(src_page);
>> +
>> +		if (ret)
>> +			return ret;
>> +
>> +		ipa += PAGE_SIZE;
>> +		pfn++;
>> +		src += PAGE_SIZE;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static long populate_region(struct kvm *kvm,
>> +			    gfn_t base_gfn,
>> +			    unsigned long pages,
>> +			    u64 uaddr,
>> +			    unsigned long data_flags)
>> +{
>> +	long ret = 0;
>> +
>> +	mutex_lock(&kvm->slots_lock);
>> +	mmap_read_lock(current->mm);
>> +	ret = kvm_gmem_populate(kvm, base_gfn, u64_to_user_ptr(uaddr), pages,
>> +				populate_region_cb, &data_flags);
>> +	mmap_read_unlock(current->mm);
>> +	mutex_unlock(&kvm->slots_lock);
>> +
>> +	return ret;
>> +}
>> +
>>  enum ripas_action {
>>  	RIPAS_INIT,
>>  	RIPAS_SET,
>> @@ -655,6 +799,37 @@ static int realm_ensure_created(struct kvm *kvm)
>>  	return -ENXIO;
>>  }
>>  
>> +int kvm_arm_rmi_populate(struct kvm *kvm,
>> +			 struct kvm_arm_rmi_populate *args)
>> +{
>> +	unsigned long data_flags = 0;
>> +	unsigned long ipa_start = args->base;
>> +	unsigned long ipa_end = ipa_start + args->size;
>> +	int ret;
>> +
>> +	if (args->reserved ||
>> +	    (args->flags & ~KVM_ARM_RMI_POPULATE_FLAGS_MEASURE) ||
>> +	    !IS_ALIGNED(ipa_start, PAGE_SIZE) ||
>> +	    !IS_ALIGNED(ipa_end, PAGE_SIZE))
>> +		return -EINVAL;
>> +
>> +	ret = realm_ensure_created(kvm);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (args->flags & KVM_ARM_RMI_POPULATE_FLAGS_MEASURE)
> 
> This flag isn't documented.

Indeed - that's an oversight! I'll add the following to the docs:

`flags` can be set to `KVM_ARM_RMI_POPULATE_FLAGS_MEASURE` to request that the
populated data is hashed and added to the guest's Realm Initial Measurement
(RIM).

>> +		data_flags |= RMI_MEASURE_CONTENT;
>> +
>> +	ret = populate_region(kvm, gpa_to_gfn(ipa_start),
>> +			      args->size >> PAGE_SHIFT,
>> +			      args->source_uaddr, args->flags);
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return ret * PAGE_SIZE;
> 
> Bits of the code works on PAGE_SIZE, other bits on RMM_PAGE_SIZE. It
> is pretty confusing. Are you in the middle of reworking this?

Yes, sorry about that - RMM_PAGE_SIZE will be completely gone when
this is updated to RMM v2.0.

Thanks,
Steve


