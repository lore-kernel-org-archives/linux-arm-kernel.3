Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3BAC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 07:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92kVKvLXYp8GEpDqehUSajVqtYMH61w+w2uAm/5AlIk=; b=NOSnmc/NNL8QG47V0uGJ4DkBvk
	5I5CgAbP4jTTMHuNvN5Tv0lK9dd+Dvw7ycCr4dJPZguN1rZh0W3EB0P1r/oWpEzNJ7PONV/owm1KK
	Qg0MfG6b4R1A6kZIacqFItxSAK/gOSv8LOLMObGUbuWiDkz4oOushjf0XlomJ/aS1biMrIjHCNrRS
	P6I423MS59khOvb1xz+tP+dchkIpH3PQmr0cwHBc6+li/p/INQhZ3A9mKEhAFwJodR0GvjKuo7tIf
	tM3Xe2WX5APYp3G5pvPhQLPx4emUzrkReJvoslQ1XFNdeCO3GJXTBjl5sySQHmG0EREGKy4ftUqRe
	pLgZy7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1Rb-00000000u8B-0fbm;
	Wed, 30 Jul 2025 07:41:47 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1Nc-00000000tem-2DEx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 07:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753861061; x=1785397061;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Wx/PGqRnErvPvMGDFamkrBsB3gh6iDSc0BGeARtBkZM=;
  b=hgM3Qo0g3Y+vzYNr0KC7dY8zfLzDbvdw/9zwn1y4WxD7OiaGlFSAxIJI
   r5qCPADAAc7ssxCU29AjmViqXe3umfUJ/lGqpZfsKMSLxn0ItWDNrlc0H
   Cou4FXeLgE2f1a8T4hgHtO99PJZlaXAwF6ub0PrhwsjJ9/uL+9EgsKiPH
   +3uAIWQRfC7ZwgfJ1AovZdyB0w2ct836+wYEhMuCEU+I0SSFa6J0eAQly
   x+Xko5DGOat6E+vyI6wKjovU1jMibrpBwaXQvETUSIjwasceoCBn7VmwE
   iyeSmOXj+AVEHVe/pSWlLoKsFgbJkN9eqtKwh7b0ZBLdEQKDutw4w4W86
   w==;
X-CSE-ConnectionGUID: PPOJFDgfSaWla9rzxYLSlA==
X-CSE-MsgGUID: Zrdh96BNSc6OcDnfLMKoLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56037758"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56037758"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 00:37:38 -0700
X-CSE-ConnectionGUID: feCkmU4NS/GnJCZ7axVvKA==
X-CSE-MsgGUID: yuXXeCjDTC2mBvEuGPXruA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="167395719"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1]) ([10.124.247.1])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 00:37:34 -0700
Message-ID: <cf196e44-4ec1-45ab-9cd4-dd8cb10bd44f@intel.com>
Date: Wed, 30 Jul 2025 15:37:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 16/24] KVM: x86/mmu: Handle guest page faults for
 guest_memfd with shared memory
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>,
 Shivank Garg <shivankg@amd.com>, Vlastimil Babka <vbabka@suse.cz>,
 David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>,
 Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>,
 James Houghton <jthoughton@google.com>
References: <20250729225455.670324-1-seanjc@google.com>
 <20250729225455.670324-17-seanjc@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250729225455.670324-17-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_003740_646637_FB3D84C3 
X-CRM114-Status: GOOD (  17.83  )
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

On 7/30/2025 6:54 AM, Sean Christopherson wrote:
> From: Ackerley Tng <ackerleytng@google.com>
> 
> Update the KVM MMU fault handler to service guest page faults
> for memory slots backed by guest_memfd with mmap support. For such
> slots, the MMU must always fault in pages directly from guest_memfd,
> bypassing the host's userspace_addr.
> 
> This ensures that guest_memfd-backed memory is always handled through
> the guest_memfd specific faulting path, regardless of whether it's for
> private or non-private (shared) use cases.
> 
> Additionally, rename kvm_mmu_faultin_pfn_private() to
> kvm_mmu_faultin_pfn_gmem(), as this function is now used to fault in
> pages from guest_memfd for both private and non-private memory,
> accommodating the new use cases.
> 
> Co-developed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> [sean: drop the helper]
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> ---
>   arch/x86/kvm/mmu/mmu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index e83d666f32ad..56c80588efa0 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -4561,8 +4561,8 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
>   				 r == RET_PF_RETRY, fault->map_writable);
>   }
>   
> -static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
> -				       struct kvm_page_fault *fault)
> +static int kvm_mmu_faultin_pfn_gmem(struct kvm_vcpu *vcpu,
> +				    struct kvm_page_fault *fault)
>   {
>   	int max_order, r;
>   
> @@ -4589,8 +4589,8 @@ static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
>   {
>   	unsigned int foll = fault->write ? FOLL_WRITE : 0;
>   
> -	if (fault->is_private)
> -		return kvm_mmu_faultin_pfn_private(vcpu, fault);
> +	if (fault->is_private || kvm_memslot_is_gmem_only(fault->slot))
> +		return kvm_mmu_faultin_pfn_gmem(vcpu, fault);
>   
>   	foll |= FOLL_NOWAIT;
>   	fault->pfn = __kvm_faultin_pfn(fault->slot, fault->gfn, foll,


