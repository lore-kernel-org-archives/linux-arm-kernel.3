Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8245ACD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 11:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+dHNKFMVBkDdICjg2Muej8aIFbwcMiW4DpFYR49CkI=; b=bXkMhIvae/BPw4r/NNVUUbAb1k
	Q1Rl/LqQtD263pD64xZceYRKjDW7Jl9uglW05OK1r3d8uapnzPhwIyfPVLPhDOJtIyazEYZabKDmv
	vx8xi8z7B01JrboIgs4ZDzOktwO1txdj52H647f0+plKCxLsHN49zjM6oajpHME2FRgf/ike61OlD
	YYYgwXuOi51n2Ervjz9LvzzHt7NJJedX9IfYYSCZjCsLueSALkPECq4QUqlzP1FGrxBX2UHGBbvgT
	ZStqwAvmyr2UXWhw0YrOmT1yyUn3BS6gsKLzyEAJSXMdHuNYzjVsBIwJCOWhy0+2ctc54GHPwQ5sZ
	xZbjLbrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSbJ-00000000Wy5-2l40;
	Fri, 05 Jun 2026 11:20:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSbG-00000000WxP-0cng
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 11:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780658428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M+dHNKFMVBkDdICjg2Muej8aIFbwcMiW4DpFYR49CkI=;
	b=NQst+nedkCx5EBACavuTEYwl5fdcsVCvHNGRmBOs2S5+QnDNwUfcjHxgxAV6aLpCTpAkAo
	155lKHETS6LRBxfRI9+0xO9qctfZxPVbGUV9IKmQtI4NRu4IHw/K7NLSJuerZQTt01NtCe
	3JPteZmSK5LlE4UceS6v+KUDh0LQy7s=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-sVAFQzwHM5CCwpGpo3ju-Q-1; Fri, 05 Jun 2026 07:20:27 -0400
X-MC-Unique: sVAFQzwHM5CCwpGpo3ju-Q-1
X-Mimecast-MFC-AGG-ID: sVAFQzwHM5CCwpGpo3ju-Q_1780658426
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f544944so1361851b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 04:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658426; x=1781263226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+dHNKFMVBkDdICjg2Muej8aIFbwcMiW4DpFYR49CkI=;
        b=G58eDahpcjIsioUtcQJiYvo1UQFGa8jLwJssyfSbFzaZ0lsQHyq19zdFSJp15axqbH
         facklqWNLxshvFAyrVMpNQD8n47b6T34SV0rGi0rPS4CmMSEpJzqxe1OqI/nXDp1pbfo
         4L4GPOYOmE+v1hV6HeLYiyCnWL+E0GwRE8IDfCMcoog7GfqPPyjrQvTNbnnBCN+EDISJ
         DPKLeD5aaFN1A7pC/mB6J4VKkVQqBNAqTNo/EEgtiPX1KQ+YRLF/vXKkWNtbUjCY2FR5
         BryTAfvy8icJVybdh7WJADqnQhI2ohO4i0Z27zgeh+Y97sOLQDVJgNLmdbat3ONsMcAd
         vkWw==
X-Forwarded-Encrypted: i=1; AFNElJ8Uo7DDspBlN4M5xOuZMVc4tToJW8UPE36XnmzLqMFEa3kdI2zo2fVBCVwNgujPhQ9Q2JPTeHhVHj4gOBoxn8he@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi4rWGDT9KnRSWSBq8ozCK8JyFeBCS2KS6vza6f918+cIicMj8
	SfHr819kOr9SvmyKATpzCCpG5AWzUddng+R6D14IfilDusmmXPzOliqQ78ONj7NyLg2Dc8NABPx
	kOclOyviE3c00p4zr/KyqLTkksNxMgQ4Y/fjT5pgxVvdj1eIHsYzLclNC4vvYkkvcQgKDm+NhNL
	VS
X-Gm-Gg: Acq92OGiQAK0cgKLFqSVyk9TSIW3u+s1G2ibIIzAg069q7TE0WGzraj63x+XBaIqWeo
	OxOkmLLCTuzooT3yH9xpefbLqrSGyzDQXzi+zQVuhXMCYneC/YdGkHxz7a1pcN7E0/52Zz4bG0R
	c9zCx7qPW9+PGRYU4vshu/OeXIc+WZU7jc5A3qKqkfqPt+eE/JZmxS6rjjHr0nx1CwGYdU3jq15
	AIF7H+Nc3zzgDR+NvhOqncTP3TrRxqFKI40ZEv9s8PexvNg5r/83ibEv/xHkwqr9TTdp95C+Bu9
	0u5Rtc3IdUFR11R7wbYuOxnHxfhuodIzDhTP2LehebHH9Ddcmq/JqEkuRXUvHI47eFrWH0k7l5j
	Ac3O3rouy/2MvIyivMRH8gX1QFhhvcoDZ2oj1OZMU1mT6yssTaVlcWoNqsxcaaj6+8ciBKxFYWU
	U=
X-Received: by 2002:a05:6a00:2351:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-842b0f52eefmr3355885b3a.27.1780658425894;
        Fri, 05 Jun 2026 04:20:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:2351:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-842b0f52eefmr3355817b3a.27.1780658425323;
        Fri, 05 Jun 2026 04:20:25 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282880050sm8756478b3a.29.2026.06.05.04.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 04:20:24 -0700 (PDT)
Message-ID: <d08ca4d6-1e7c-473d-909e-89642bd8c4c2@redhat.com>
Date: Fri, 5 Jun 2026 21:20:14 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 29/44] arm64: RMI: Runtime faulting of memory
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-30-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260513131757.116630-30-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PsKsY-DotGcGSaBhLBP5lpGr4FLHNGFVAOKcV6fmAJ8_1780658426
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_042030_259926_44925A70 
X-CRM114-Status: GOOD (  36.45  )
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

Hi Steve,

On 5/13/26 11:17 PM, Steven Price wrote:
> At runtime if the realm guest accesses memory which hasn't yet been
> mapped then KVM needs to either populate the region or fault the guest.
> 
> For memory in the lower (protected) region of IPA a fresh page is
> provided to the RMM which will zero the contents. For memory in the
> upper (shared) region of IPA, the memory from the memslot is mapped
> into the realm VM non secure.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v13:
>   * Numerous changes due to rebasing.
>   * Fix addr_range_desc() to encode the correct block size.
> Changes since v12:
>   * Switch to RMM v2.0 range based APIs.
> Changes since v11:
>   * Adapt to upstream changes.
> Changes since v10:
>   * RME->RMI renaming.
>   * Adapt to upstream gmem changes.
> Changes since v9:
>   * Fix call to kvm_stage2_unmap_range() in kvm_free_stage2_pgd() to set
>     may_block to avoid stall warnings.
>   * Minor coding style fixes.
> Changes since v8:
>   * Propagate the may_block flag.
>   * Minor comments and coding style changes.
> Changes since v7:
>   * Remove redundant WARN_ONs for realm_create_rtt_levels() - it will
>     internally WARN when necessary.
> Changes since v6:
>   * Handle PAGE_SIZE being larger than RMM granule size.
>   * Some minor renaming following review comments.
> Changes since v5:
>   * Reduce use of struct page in preparation for supporting the RMM
>     having a different page size to the host.
>   * Handle a race when delegating a page where another CPU has faulted on
>     a the same page (and already delegated the physical page) but not yet
>     mapped it. In this case simply return to the guest to either use the
>     mapping from the other CPU (or refault if the race is lost).
>   * The changes to populate_par_region() are moved into the previous
>     patch where they belong.
> Changes since v4:
>   * Code cleanup following review feedback.
>   * Drop the PTE_SHARED bit when creating unprotected page table entries.
>     This is now set by the RMM and the host has no control of it and the
>     spec requires the bit to be set to zero.
> Changes since v2:
>   * Avoid leaking memory if failing to map it in the realm.
>   * Correctly mask RTT based on LPA2 flag (see rtt_get_phys()).
>   * Adapt to changes in previous patches.
> ---
>   arch/arm64/include/asm/kvm_emulate.h |   8 ++
>   arch/arm64/include/asm/kvm_rmi.h     |  12 ++
>   arch/arm64/kvm/mmu.c                 | 128 ++++++++++++++++----
>   arch/arm64/kvm/rmi.c                 | 173 +++++++++++++++++++++++++++
>   4 files changed, 301 insertions(+), 20 deletions(-)
> 

[...]

> @@ -1604,27 +1641,52 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>   	bool write_fault, exec_fault;
>   	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
>   	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
> -	struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
> +	struct kvm_vcpu *vcpu = s2fd->vcpu;
> +	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> +	gpa_t gpa = kvm_gpa_from_fault(vcpu->kvm, s2fd->fault_ipa);
>   	unsigned long mmu_seq;
>   	struct page *page;
> -	struct kvm *kvm = s2fd->vcpu->kvm;
> +	struct kvm *kvm = vcpu->kvm;
>   	void *memcache;
>   	kvm_pfn_t pfn;
>   	gfn_t gfn;
>   	int ret;
>   
> -	memcache = get_mmu_memcache(s2fd->vcpu);
> -	ret = topup_mmu_memcache(s2fd->vcpu, memcache);
> +	if (kvm_is_realm(vcpu->kvm)) {
> +		/* check for memory attribute mismatch */
> +		bool is_priv_gfn = kvm_mem_is_private(kvm, gpa >> PAGE_SHIFT);
> +		/*
> +		 * For Realms, the shared address is an alias of the private
> +		 * PA with the top bit set. Thus if the fault address matches
> +		 * the GPA then it is the private alias.
> +		 */
> +		bool is_priv_fault = (gpa == s2fd->fault_ipa);
> +
> +		if (is_priv_gfn != is_priv_fault) {
> +			kvm_prepare_memory_fault_exit(vcpu, gpa, PAGE_SIZE,
> +						      kvm_is_write_fault(vcpu),
> +						      false,
> +						      is_priv_fault);
> +			/*
> +			 * KVM_EXIT_MEMORY_FAULT requires an return code of
> +			 * -EFAULT, see the API documentation
> +			 */
> +			return -EFAULT;
> +		}
> +	}
> +

For a Realm, gmem_abort() is called by kvm_handle_guest_abort() only when
we're faulting in the private (protected) space.

     if (kvm_slot_has_gmem(memslot) && !shared_ipa_fault(vcpu->kvm, fault_ipa))
         ret = gmem_abort(&s2fd);
     else
         ret = user_mem_abort(&s2fd);

With the condition, this block of code can be simplied to handle conversion
(shared -> private) instead of both directions.

     /* Convert the shared address to the private adress for Realm */
     if (kvm_is_realm(vcpu->kvm) &&
         !kvm_mem_is_private(kvm, gpa >> PAGE_SHIFT)) {
         /*
          * KVM_EXIT_MEMORY_FAULT requires an return code of
          * -EFAULT, see the API documentation
          */
         kvm_prepare_memory_fault_exit(vcpu, gpa, PAGE_SIZE,
                                       kvm_is_write_fault(vcpu),
                                       false, true);
         return -EFAULT;
     }


[...]

> @@ -2396,7 +2475,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>   				!write_fault &&
>   				!kvm_vcpu_trap_is_exec_fault(vcpu));
>   
> -		if (kvm_slot_has_gmem(memslot))
> +		if (kvm_slot_has_gmem(memslot) && !shared_ipa_fault(vcpu->kvm, fault_ipa))
>   			ret = gmem_abort(&s2fd);
>   		else
>   			ret = user_mem_abort(&s2fd);
gmem_abort() is only called for faults in the protected (private) space.

Thanks,
Gavin


