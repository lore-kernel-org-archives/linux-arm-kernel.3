Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D7CC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 17:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Upxs0eolX3bE6dRsPWc13CKdlnx9VgCXOXIrYLb1tE=; b=k8Yk3SpNtNzJojCXmHnoJhmt4A
	DTE6+bKiTFkDNj8NR3FHtwoVfkm+Xe+5KbqD63VSY5DTkKOJB1LuILqMDvvYymLNet5bySSJ4f+Zz
	mbfIqJNoi+wJNCfvYe3Ad/Su+Byv34JjSb2vqsL4Si2UuE98OGj2Qz8XHz4BGAObkdcQHgDRnbW2g
	+TpsILOhfK8MueXGE6gH2w2IBxu347UXsEiSC7GMCeAWcERRmz3SOdeJDO/G2lG418tIkICCITwB8
	veXSqIeOCisAFuzZHY/AAcMI9z2GJP+WLkWV1OLP/JapD7M9IAZOUVENjxLVEkjGkvpkWp3IFNBTU
	saaEFjQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQWC-0000000Defz-0HVS;
	Tue, 20 May 2025 17:12:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQT0-0000000DeBc-1sQi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 17:09:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA7B15C596D;
	Tue, 20 May 2025 17:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82013C4CEE9;
	Tue, 20 May 2025 17:09:18 +0000 (UTC)
Date: Tue, 20 May 2025 18:09:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: ankita@nvidia.com
Cc: jgg@nvidia.com, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	will@kernel.org, ryan.roberts@arm.com, shahuang@redhat.com,
	lpieralisi@kernel.org, david@redhat.com, aniketa@nvidia.com,
	cjia@nvidia.com, kwankhede@nvidia.com, kjaju@nvidia.com,
	targupta@nvidia.com, vsethi@nvidia.com, acurrid@nvidia.com,
	apopple@nvidia.com, jhubbard@nvidia.com, danw@nvidia.com,
	zhiw@nvidia.com, mochs@nvidia.com, udhoke@nvidia.com,
	dnigam@nvidia.com, alex.williamson@redhat.com,
	sebastianene@google.com, coltonlewis@google.com,
	kevin.tian@intel.com, yi.l.liu@intel.com, ardb@kernel.org,
	akpm@linux-foundation.org, gshan@redhat.com, linux-mm@kvack.org,
	ddutile@redhat.com, tabba@google.com, qperret@google.com,
	seanjc@google.com, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	maobibo@loongson.cn
Subject: Re: [PATCH v4 1/5] KVM: arm64: Block cacheable PFNMAP mapping
Message-ID: <aCy3OwBe1HLa4O-7@arm.com>
References: <20250518054754.5345-1-ankita@nvidia.com>
 <20250518054754.5345-2-ankita@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518054754.5345-2-ankita@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_100926_833007_1BE62DF9 
X-CRM114-Status: GOOD (  18.23  )
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

On Sun, May 18, 2025 at 05:47:50AM +0000, ankita@nvidia.com wrote:
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 2feb6c6b63af..eaac4db61828 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1466,6 +1466,15 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
>  	return vma->vm_flags & VM_MTE_ALLOWED;
>  }
>  
> +/*
> + * Determine the memory region cacheability from VMA's pgprot. This
> + * is used to set the stage 2 PTEs.
> + */
> +static unsigned long mapping_type(pgprot_t page_prot)
> +{
> +	return FIELD_GET(PTE_ATTRINDX_MASK, pgprot_val(page_prot));
> +}
> +
>  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  			  struct kvm_s2_trans *nested,
>  			  struct kvm_memory_slot *memslot, unsigned long hva,
> @@ -1612,6 +1621,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  
>  	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
>  
> +	if ((vma->vm_flags & VM_PFNMAP) &&
> +	    mapping_type(vma->vm_page_prot) == MT_NORMAL)
> +		return -EINVAL;
> +
>  	/* Don't use the VMA after the unlock -- it may have vanished */
>  	vma = NULL;
>  
> @@ -2207,6 +2220,12 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>  				ret = -EINVAL;
>  				break;
>  			}
> +
> +			/* Cacheable PFNMAP is not allowed */
> +			if (mapping_type(vma->vm_page_prot) == MT_NORMAL) {
> +				ret = -EINVAL;
> +				break;
> +			}

Should we capture MT_NORMAL_TAGGED as well? Presumably no driver sets
VM_MTE_ALLOWED but the same could be set about MT_NORMAL in the
vm_page_prot.

That said, we might as well invert the check, allow if MT_DEVICE_* or
MT_NORMAL_NC (the latter based on VM_ALLOW_ANY_UNCACHED).

-- 
Catalin

