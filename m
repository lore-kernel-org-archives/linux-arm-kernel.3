Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC9BCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 08:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AEnsK/FD3KXyt2KNdoiyp75h33zTryYf8gCYYPzVxI=; b=ouEfe+XiCIKd6V2mkuKczghOoA
	b7uGhoCKm5oOZtlmmbl00g/x6kzDgJLTr24WmbxT3yn7zgexqV4rjjWGi2KPP0HBtggVDoQtmwc06
	sb3nx4+JFTbsFNzu/f3yJdARRvMvOTQnfyRXYbxEwnu55O1CLCAYa5YnrUA/AkzJi46M3B1ke7w5c
	CBrmoNVdWx/8vmTdfUiC2lYwuN9L8V+7IQQv8++9+vMq1bZbVfg1UVNsCZQhutn4fNzAXrUhW0+o6
	bsZu+rWRzlovK0bdNoxb7O2S915LksSrXr9bDmpDiDRzbYSQi3SW0TTu6PpxJ5TX41wWRwcoEmfnt
	1LX5MmFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPeO-00000000I8R-3wnS;
	Fri, 05 Jun 2026 08:11:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPeK-00000000I7w-2dc6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 08:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780647087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7AEnsK/FD3KXyt2KNdoiyp75h33zTryYf8gCYYPzVxI=;
	b=Dy6/z8ztiov9VFIBaRh6iRumwgcFOI2JS85L32eUf0q4LBPobYBi9tP8aOWlpIbJjhNReU
	i8PUD2Qvg5E1Hf80eVQaEeWZBFSx7G5QD2O6ZE/TdNoK/Wpk+Vfz+Cwhjpa/msdop9CKq/
	d2ftco3H5jfUd1uSaILoy8XRt/9PiFM=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-r5B9tun5OBWfviWpgpBHkg-1; Fri, 05 Jun 2026 04:11:25 -0400
X-MC-Unique: r5B9tun5OBWfviWpgpBHkg-1
X-Mimecast-MFC-AGG-ID: r5B9tun5OBWfviWpgpBHkg_1780647084
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c36f4b76so17528105ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 01:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780647084; x=1781251884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AEnsK/FD3KXyt2KNdoiyp75h33zTryYf8gCYYPzVxI=;
        b=NxLumxQtbE4TyPEvf1lzM+HaJlUZPadKWGJfbb8Zg4UDZ33A4JmCawYe6DZCr8dNa6
         LXANUns0c173YsvPnK3fmiMN/KBSioRQEpcV0tXql8DGSirqLWD4+i0tJutjCAm3mq89
         Fg/RBZz4d6Hbz0SD62Pw0L/SKX7IHzg5tXKxDgOxP8Xhtfych8WM2BqH1c/kiLojSL83
         sCShIzoBPrlglzv7ZgaLw7q6aLl7NqAgwBQtvVYHcfDew/ssBPxFROHHRBlQ5R45tvBL
         MB/u9bxT3o/cmBHSLYpbSderZ5g+uQHj1Hl6NNWo7EOQDhcxmV9Xgu/Z069jH9x3XtNC
         j3UA==
X-Forwarded-Encrypted: i=1; AFNElJ8DH6SnbE36BD3nRbhUDBeiOTYa6M/UjuLmXpcQBBzgqxNFsx2GhmmNtyZHU8Qe6m/vHVFwU5ThR22ndk6j7N6S@lists.infradead.org
X-Gm-Message-State: AOJu0YyOYCkLmuq2kS4I3c6i8re5pHUEtMAMdS0zJ3Oo7Q/MB93LDG9Q
	A9mADtEGyxKW+VtrCXnAhgBivJtEmrEL5NOTFqEGkbZUDKS/5W0ipknKj3OoN9p+uJrmMsHAPDJ
	XKQvKV1zLWyDU2DktkzbW9GDQXQ8GS3qxvm8tAheSBIDzoLe7CbthXzsXonTwU4/yGa+DFBqN40
	GC
X-Gm-Gg: Acq92OEKv1ENlI2KvoApKicwM+ulbihUCImTaLS2ZqxmKDNoFx0fXPHEHKOdH0ksExL
	C/RmGguQUMvfSxgsTwkd4AJjM6oxAg75izO3VS80mRoll+nzRJEPla0xCHIHT4VWS7+hyxdnAbi
	68P+U4LtfZTr+aGZRf5Emji8e22KtGwrT4Axs60IBI8okZugAaBzt4U56TEjWM7A+pOXVHx4Kbs
	skPfv13iLuf/Moeeeh6lG4uR2b7/U9AdhGlJ2Uo5t0kkO5TVcIOFs5cXviEx5EutPLDnWPw2eWU
	23LZHq1ZIT4WlihcTgkMdQPkRTUHm9jCLbCXKWcbaeyHL6twlduOq+VGs5wDPbN1/0yweK8KfMB
	U6fc+bnE6m+iOQswb1cA4j2MIzlPw83V+ccTgq4TQzh7Uco0EA0cfkw3UVhXD0IE8mSi9dNZNKM
	0=
X-Received: by 2002:a17:902:f611:b0:2c0:bd28:bed5 with SMTP id d9443c01a7336-2c1e8214337mr26908295ad.10.1780647084221;
        Fri, 05 Jun 2026 01:11:24 -0700 (PDT)
X-Received: by 2002:a17:902:f611:b0:2c0:bd28:bed5 with SMTP id d9443c01a7336-2c1e8214337mr26907875ad.10.1780647083614;
        Fri, 05 Jun 2026 01:11:23 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6ce98sm74137225ad.10.2026.06.05.01.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 01:11:22 -0700 (PDT)
Message-ID: <ecef952b-e8c6-4102-933b-c99c46f14431@redhat.com>
Date: Fri, 5 Jun 2026 18:11:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 29/44] arm64: RMI: Runtime faulting of memory
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-30-steven.price@arm.com>
 <3359f788-07fa-41a1-9ac7-45c58577c1fa@redhat.com>
 <aiJ6u83O0nVUtPyv@lpieralisi>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <aiJ6u83O0nVUtPyv@lpieralisi>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -ALCbhF846CLlA6YmOC5wrZdq11knmTWb_hG92Ry518_1780647084
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_011128_853437_D3DD47E0 
X-CRM114-Status: GOOD (  28.68  )
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

On 6/5/26 5:28 PM, Lorenzo Pieralisi wrote:
> On Fri, Jun 05, 2026 at 04:23:15PM +1000, Gavin Shan wrote:
> 
> [...]
> 
>>> +static int realm_map_ipa(struct kvm *kvm, phys_addr_t ipa,
>>> +			 kvm_pfn_t pfn, unsigned long map_size,
>>> +			 enum kvm_pgtable_prot prot,
>>> +			 struct kvm_mmu_memory_cache *memcache)
>>> +{
>>> +	struct realm *realm = &kvm->arch.realm;
>>> +
>>> +	/*
>>> +	 * Write permission is required for now even though it's possible to
>>> +	 * map unprotected pages (granules) as read-only. It's impossible to
>>> +	 * map protected pages (granules) as read-only.
>>> +	 */
>>> +	if (WARN_ON(!(prot & KVM_PGTABLE_PROT_W)))
>>> +		return -EFAULT;
>>> +
>>
>> I'm a bit concerned with this. We don't have KVM_PGTABLE_PROT_W set in @prot
>> if the stage2 fault is raised due to memory read. With -EFAULT returned to VMM
>> (e.g. QEMU), the vCPU continuous execution is stopped and system won't be
>> working any more.
>>
>>> +	ipa = ALIGN_DOWN(ipa, PAGE_SIZE);
>>> +	if (!kvm_realm_is_private_address(realm, ipa))
>>> +		return realm_map_non_secure(realm, ipa, pfn, map_size, prot,
>>> +					    memcache);
>>> +
>>> +	return realm_map_protected(kvm, ipa, pfn, map_size, memcache);
>>> +}
>>> +
>>>    static bool kvm_vma_is_cacheable(struct vm_area_struct *vma)
>>>    {
>>>    	switch (FIELD_GET(PTE_ATTRINDX_MASK, pgprot_val(vma->vm_page_prot))) {
>>> @@ -1604,27 +1641,52 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>>>    	bool write_fault, exec_fault;
>>>    	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
>>>    	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
>>> -	struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
>>> +	struct kvm_vcpu *vcpu = s2fd->vcpu;
>>> +	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
>>> +	gpa_t gpa = kvm_gpa_from_fault(vcpu->kvm, s2fd->fault_ipa);
>>>    	unsigned long mmu_seq;
>>>    	struct page *page;
>>> -	struct kvm *kvm = s2fd->vcpu->kvm;
>>> +	struct kvm *kvm = vcpu->kvm;
>>>    	void *memcache;
>>>    	kvm_pfn_t pfn;
>>>    	gfn_t gfn;
>>>    	int ret;
>>> -	memcache = get_mmu_memcache(s2fd->vcpu);
>>> -	ret = topup_mmu_memcache(s2fd->vcpu, memcache);
>>> +	if (kvm_is_realm(vcpu->kvm)) {
>>> +		/* check for memory attribute mismatch */
>>> +		bool is_priv_gfn = kvm_mem_is_private(kvm, gpa >> PAGE_SHIFT);
>>> +		/*
>>> +		 * For Realms, the shared address is an alias of the private
>>> +		 * PA with the top bit set. Thus if the fault address matches
>>> +		 * the GPA then it is the private alias.
>>> +		 */
>>> +		bool is_priv_fault = (gpa == s2fd->fault_ipa);
>>> +
>>> +		if (is_priv_gfn != is_priv_fault) {
>>> +			kvm_prepare_memory_fault_exit(vcpu, gpa, PAGE_SIZE,
>>> +						      kvm_is_write_fault(vcpu),
>>> +						      false,
>>> +						      is_priv_fault);
>>> +			/*
>>> +			 * KVM_EXIT_MEMORY_FAULT requires an return code of
>>> +			 * -EFAULT, see the API documentation
>>> +			 */
>>> +			return -EFAULT;
>>> +		}
>>> +	}
>>> +
>>> +	memcache = get_mmu_memcache(vcpu);
>>> +	ret = topup_mmu_memcache(vcpu, memcache);
>>>    	if (ret)
>>>    		return ret;
>>>    	if (s2fd->nested)
>>>    		gfn = kvm_s2_trans_output(s2fd->nested) >> PAGE_SHIFT;
>>>    	else
>>> -		gfn = s2fd->fault_ipa >> PAGE_SHIFT;
>>> +		gfn = gpa >> PAGE_SHIFT;
>>> -	write_fault = kvm_is_write_fault(s2fd->vcpu);
>>> -	exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu);
>>> +	write_fault = kvm_is_write_fault(vcpu);
>>> +	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
>>>    	VM_WARN_ON_ONCE(write_fault && exec_fault);
>>> @@ -1634,7 +1696,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>>>    	ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, gfn, &pfn, &page, NULL);
>>>    	if (ret) {
>>> -		kvm_prepare_memory_fault_exit(s2fd->vcpu, s2fd->fault_ipa, PAGE_SIZE,
>>> +		kvm_prepare_memory_fault_exit(vcpu, gpa, PAGE_SIZE,
>>>    					      write_fault, exec_fault, false);
>>>    		return ret;
>>>    	}
>>> @@ -1654,14 +1716,20 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>>>    	kvm_fault_lock(kvm);
>>>    	if (mmu_invalidate_retry(kvm, mmu_seq)) {
>>>    		ret = -EAGAIN;
>>> -		goto out_unlock;
>>> +		goto out_release_page;
>>> +	}
>>> +
>>> +	if (kvm_is_realm(kvm)) {
>>> +		ret = realm_map_ipa(kvm, s2fd->fault_ipa, pfn,
>>> +				    PAGE_SIZE, KVM_PGTABLE_PROT_R | KVM_PGTABLE_PROT_W, memcache);
>>> +		goto out_release_page;
>>>    	}
>>>    	ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
>>>    						 __pfn_to_phys(pfn), prot,
>>>    						 memcache, flags);
>>> -out_unlock:
>>> +out_release_page:
>>>    	kvm_release_faultin_page(kvm, page, !!ret, prot & KVM_PGTABLE_PROT_W);
>>>    	kvm_fault_unlock(kvm);
>>> @@ -1847,7 +1915,7 @@ static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
>>>    	 * mapping size to ensure we find the right PFN and lay down the
>>>    	 * mapping in the right place.
>>>    	 */
>>> -	s2vi->gfn = ALIGN_DOWN(s2fd->fault_ipa, s2vi->vma_pagesize) >> PAGE_SHIFT;
>>> +	s2vi->gfn = kvm_gpa_from_fault(kvm, ALIGN_DOWN(s2fd->fault_ipa, s2vi->vma_pagesize)) >> PAGE_SHIFT;
>>>    	s2vi->mte_allowed = kvm_vma_mte_allowed(vma);
>>> @@ -2056,6 +2124,9 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>>>    		prot &= ~KVM_NV_GUEST_MAP_SZ;
>>>    		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, gfn_to_gpa(gfn),
>>>    								 prot, flags);
>>> +	} else if (kvm_is_realm(kvm)) {
>>> +		ret = realm_map_ipa(kvm, s2fd->fault_ipa, pfn, mapping_size,
>>> +				    prot, memcache);
>>>    	} else {
>>>    		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, gfn_to_gpa(gfn), mapping_size,
>>>    							 __pfn_to_phys(pfn), prot,
>>
>> For the case kvm_is_realm(), need we adjust 's2fd->fault_ipa' for the sake of
>> huge pages. In kvm_s2_fault_map(), @gfn and @pfn may have been adjusted by
>> transparent_hugepage_adjust() to be aligned with huge page size. If the
>> adjustment happened in transparent_hugepage_adjust(), we need to align
>> s2fd->fault_ipa down to the huge page size either.
> 
> All of the above + some RMM changes are needed to get QEmu VMM going
> with anon pages guest memory backing - currently testing various
> configurations in the background.
> 

I tried to rebase Jean's latest QEMU series [1] to upstream QEMU, and found
that memory slots backed by THP are broken. With THP disabled on the host and
other fixes (mentioned in my prevous replies) applied on the top of this (v14)
series, I'm able to boot a realm guest with rebased QEMU series [2], plus more
fxies on the top.

[1] https://git.codelinaro.org/linaro/dcap/qemu.git  (branch: cca/latest)
[2] https://git.qemu.org/git/qemu.git                (branch: cca/gavin)

Lorenzo, You may be saying there is someone making QEMU to support ARM/CCA?
If so, I'm not sure if there is a QEMU repository for me to try?

Thanks,
Gavin

> Thanks,
> Lorenzo
> 
>>> @@ -2214,6 +2285,13 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
>>>    	return 0;
>>>    }
>>> +static bool shared_ipa_fault(struct kvm *kvm, phys_addr_t fault_ipa)
>>> +{
>>> +	gpa_t gpa = kvm_gpa_from_fault(kvm, fault_ipa);
>>> +
>>> +	return (gpa != fault_ipa);
>>> +}
>>> +
>>>    /**
>>>     * kvm_handle_guest_abort - handles all 2nd stage aborts
>>>     * @vcpu:	the VCPU pointer
>>> @@ -2324,8 +2402,9 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>>>    		nested = &nested_trans;
>>>    	}
>>> -	gfn = ipa >> PAGE_SHIFT;
>>> +	gfn = kvm_gpa_from_fault(vcpu->kvm, ipa) >> PAGE_SHIFT;
>>>    	memslot = gfn_to_memslot(vcpu->kvm, gfn);
>>> +
>>>    	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
>>>    	write_fault = kvm_is_write_fault(vcpu);
>>>    	if (kvm_is_error_hva(hva) || (write_fault && !writable)) {
>>> @@ -2368,7 +2447,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>>>    		 * of the page size.
>>>    		 */
>>>    		ipa |= FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(vcpu));
>>> -		ret = io_mem_abort(vcpu, ipa);
>>> +		ret = io_mem_abort(vcpu, kvm_gpa_from_fault(vcpu->kvm, ipa));
>>>    		goto out_unlock;
>>>    	}
>>> @@ -2396,7 +2475,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>>>    				!write_fault &&
>>>    				!kvm_vcpu_trap_is_exec_fault(vcpu));
>>> -		if (kvm_slot_has_gmem(memslot))
>>> +		if (kvm_slot_has_gmem(memslot) && !shared_ipa_fault(vcpu->kvm, fault_ipa))
>>>    			ret = gmem_abort(&s2fd);
>>>    		else
>>>    			ret = user_mem_abort(&s2fd);
>>> @@ -2433,6 +2512,10 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>>>    	if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
>>>    		return false;
>>> +	/* We don't support aging for Realms */
>>> +	if (kvm_is_realm(kvm))
>>> +		return true;
>>> +
>>>    	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
>>>    						   range->start << PAGE_SHIFT,
>>>    						   size, true);
>>> @@ -2449,6 +2532,10 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>>>    	if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
>>>    		return false;
>>> +	/* We don't support aging for Realms */
>>> +	if (kvm_is_realm(kvm))
>>> +		return true;
>>> +
>>>    	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
>>>    						   range->start << PAGE_SHIFT,
>>>    						   size, false);
>>> @@ -2628,10 +2715,11 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>>>    		return -EFAULT;
>>>    	/*
>>> -	 * Only support guest_memfd backed memslots with mappable memory, since
>>> -	 * there aren't any CoCo VMs that support only private memory on arm64.
>>> +	 * Only support guest_memfd backed memslots with mappable memory,
>>> +	 * unless the guest is a CCA realm guest.
>>>    	 */
>>> -	if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
>>> +	if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new) &&
>>> +	    !kvm_is_realm(kvm))
>>>    		return -EINVAL;
>>>    	hva = new->userspace_addr;
>>> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>>> index cae29fd3353c..761b38a4071c 100644
>>> --- a/arch/arm64/kvm/rmi.c
>>> +++ b/arch/arm64/kvm/rmi.c
>>> @@ -597,6 +597,179 @@ static int realm_data_map_init(struct kvm *kvm, unsigned long ipa,
>>>    	return ret;
>>>    }
>>> +static unsigned long addr_range_desc(unsigned long phys, unsigned long size)
>>> +{
>>> +	unsigned long out = 0;
>>> +
>>> +	switch (size) {
>>> +	case P4D_SIZE:
>>> +		out = 3 | (1 << 2);
>>> +		break;
>>> +	case PUD_SIZE:
>>> +		out = 2 | (1 << 2);
>>> +		break;
>>> +	case PMD_SIZE:
>>> +		out = 1 | (1 << 2);
>>> +		break;
>>> +	case PAGE_SIZE:
>>> +		out = 0 | (1 << 2);
>>> +		break;
>>> +	default:
>>> +		/*
>>> +		 * Only support mapping at the page level granulatity when
>>> +		 * it's an unusual length. This should get us back onto a larger
>>> +		 * block size for the subsequent mappings.
>>> +		 */
>>> +		out = 0 | ((MIN(size >> PAGE_SHIFT, PTRS_PER_PTE - 1)) << 2);
>>> +		break;
>>> +	}
>>> +
>>> +	WARN_ON(phys & ~PAGE_MASK);
>>> +
>>> +	out |= phys & PAGE_MASK;
>>> +
>>> +	return out;
>>> +}
>>> +
>>> +int realm_map_protected(struct kvm *kvm,
>>> +			unsigned long ipa,
>>> +			kvm_pfn_t pfn,
>>> +			unsigned long map_size,
>>> +			struct kvm_mmu_memory_cache *memcache)
>>> +{
>>> +	struct realm *realm = &kvm->arch.realm;
>>> +	phys_addr_t phys = __pfn_to_phys(pfn);
>>> +	phys_addr_t base_phys = phys;
>>> +	phys_addr_t rd = virt_to_phys(realm->rd);
>>> +	unsigned long base_ipa = ipa;
>>> +	unsigned long ipa_top = ipa + map_size;
>>> +	int ret = 0;
>>> +
>>> +	if (WARN_ON(!IS_ALIGNED(map_size, PAGE_SIZE) ||
>>> +		    !IS_ALIGNED(ipa, map_size)))
>>> +		return -EINVAL;
>>> +
>>> +	if (rmi_delegate_range(phys, map_size)) {
>>> +		/*
>>> +		 * It's likely we raced with another VCPU on the same
>>> +		 * fault. Assume the other VCPU has handled the fault
>>> +		 * and return to the guest.
>>> +		 */
>>> +		return 0;
>>> +	}
>>> +
>>> +	while (ipa < ipa_top) {
>>> +		unsigned long flags = RMI_ADDR_TYPE_SINGLE;
>>> +		unsigned long range_desc = addr_range_desc(phys, ipa_top - ipa);
>>> +		unsigned long out_top;
>>> +
>>> +		ret = rmi_rtt_data_map(rd, ipa, ipa_top, flags, range_desc,
>>> +				       &out_top);
>>> +
>>> +		if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
>>> +			/* Create missing RTTs and retry */
>>> +			int level = RMI_RETURN_INDEX(ret);
>>> +
>>> +			WARN_ON(level == KVM_PGTABLE_LAST_LEVEL);
>>> +			ret = realm_create_rtt_levels(realm, ipa, level,
>>> +						      KVM_PGTABLE_LAST_LEVEL,
>>> +						      memcache);
>>> +			if (ret)
>>> +				goto err_undelegate;
>>> +
>>> +			ret = rmi_rtt_data_map(rd, ipa, ipa_top, flags,
>>> +					       range_desc, &out_top);
>>> +		}
>>> +
>>> +		if (WARN_ON(ret))
>>> +			goto err_undelegate;
>>> +
>>> +		phys += out_top - ipa;
>>> +		ipa = out_top;
>>> +	}
>>> +
>>> +	return 0;
>>> +
>>> +err_undelegate:
>>> +	realm_unmap_private_range(kvm, base_ipa, ipa, true);
>>> +	if (WARN_ON(rmi_undelegate_range(base_phys, map_size))) {
>>> +		/* Page can't be returned to NS world so is lost */
>>> +		get_page(phys_to_page(base_phys));
>>> +	}
>>> +	return -ENXIO;
>>> +}
>>> +
>>> +int realm_map_non_secure(struct realm *realm,
>>> +			 unsigned long ipa,
>>> +			 kvm_pfn_t pfn,
>>> +			 unsigned long size,
>>> +			 enum kvm_pgtable_prot prot,
>>> +			 struct kvm_mmu_memory_cache *memcache)
>>> +{
>>> +	unsigned long attr, flags = 0;
>>> +	phys_addr_t rd = virt_to_phys(realm->rd);
>>> +	phys_addr_t phys = __pfn_to_phys(pfn);
>>> +	unsigned long ipa_top = ipa + size;
>>> +	int ret;
>>> +
>>> +	if (WARN_ON(!IS_ALIGNED(size, PAGE_SIZE) ||
>>> +		    !IS_ALIGNED(ipa, size)))
>>> +		return -EINVAL;
>>> +
>>> +	switch (prot & (KVM_PGTABLE_PROT_DEVICE | KVM_PGTABLE_PROT_NORMAL_NC)) {
>>> +	case KVM_PGTABLE_PROT_DEVICE | KVM_PGTABLE_PROT_NORMAL_NC:
>>> +		return -EINVAL;
>>> +	case KVM_PGTABLE_PROT_DEVICE:
>>> +		attr = MT_S2_FWB_DEVICE_nGnRE;
>>> +		break;
>>> +	case KVM_PGTABLE_PROT_NORMAL_NC:
>>> +		attr = MT_S2_FWB_NORMAL_NC;
>>> +		break;
>>> +	default:
>>> +		attr = MT_S2_FWB_NORMAL;
>>> +	}
>>> +
>>> +	flags |= FIELD_PREP(RMI_RTT_UNPROT_MAP_FLAGS_MEMATTR, attr);
>>> +
>>> +	if (prot & KVM_PGTABLE_PROT_R)
>>> +		flags |= FIELD_PREP(RMI_RTT_UNPROT_MAP_FLAGS_S2AP, RMI_S2AP_DIRECT_READ);
>>> +	if (prot & KVM_PGTABLE_PROT_W)
>>> +		flags |= FIELD_PREP(RMI_RTT_UNPROT_MAP_FLAGS_S2AP, RMI_S2AP_DIRECT_WRITE);
>>> +
>>> +	flags |= RMI_ADDR_TYPE_SINGLE;
>>> +
>>> +	while (ipa < ipa_top) {
>>> +		unsigned long range_desc = addr_range_desc(phys, ipa_top - ipa);
>>> +		unsigned long out_top;
>>> +
>>> +		ret = rmi_rtt_unprot_map(rd, ipa, ipa_top, flags, range_desc,
>>> +					 &out_top);
>>> +
>>> +		if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
>>> +			/* Create missing RTTs and retry */
>>> +			int level = RMI_RETURN_INDEX(ret);
>>> +
>>> +			WARN_ON(level == KVM_PGTABLE_LAST_LEVEL);
>>> +			ret = realm_create_rtt_levels(realm, ipa, level,
>>> +						      KVM_PGTABLE_LAST_LEVEL,
>>> +						      memcache);
>>> +			if (ret)
>>> +				return ret;
>>> +
>>> +			ret = rmi_rtt_unprot_map(rd, ipa, ipa_top, flags,
>>> +						 range_desc, &out_top);
>>> +		}
>>> +
>>> +		if (WARN_ON(ret))
>>> +			return ret;
>>> +
>>> +		phys += out_top - ipa;
>>> +		ipa = out_top;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>    static int populate_region_cb(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>>>    			      struct page *src_page, void *opaque)
>>>    {
>>
>> Thanks,
>> Gavin
>>
> 


