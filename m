Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4D0CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 03:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tTCdiePndXIRwCmFCtbHTHaGzs2XLhLP1juLivd72j0=; b=I4tGge8bqT55+kBwykhgD6g2sV
	axW/J8BKDmaL3X3ioGHWGTsCeqcYWvIF9bFZ6G9LuOckByQ/iKgT+QJmCe6El9z50/tESKFy0nBDj
	ZP7BLr3PLDEreowk7JqbMRLdgwf/c3JntwwqmEX/k86HjAzvfqq4Ag0NKBhZFdMq41RKpCvXDvgMM
	La28BuVaMOdjB9/VwCdYDtUVpSke7GygmXu0P4Ii749znlXO54skzObu38KUNc6icqRb3AKLy++zU
	jnR9asRw6v+w3y7ilYiPq/JREYcmIs5mxlcVmogLeZfqEOKYL2jvd/qQZsnOrgHoU7hasQmTIPyAH
	eLMIyLfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBPKU-00000001IuY-1mBE;
	Wed, 22 Oct 2025 03:16:04 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBPKR-00000001Ito-0ybU;
	Wed, 22 Oct 2025 03:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761102959; x=1792638959;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=C4vq3UaKFDwToRnrsRh+czOcOkuL3mJDA1+8OYAo9rg=;
  b=Ku9U8g7e1/guC7DjGv8MdApsuMrRXyvnlKKEcGvSi5KSKPp624YlIgD0
   cT8x1OURcakRkZ35iiaO/vFBbPQLQNRU8ac6IFQ4U1IIuVMORdAkjP+k3
   NNnx5TlwyCL2XZ1Y+fY5wDbIXPGRRpE5nsGLHjZuCrn1dtDBipgnot2VV
   KWClcuTpLLt3IVbS/MS6ZPhhnetB/GfwyPfYtplrN0viMw/VRJEpQgQs8
   89dXAuZUSJJzV6UUnQRnOXvdt7BzeMTJn+X3qFcT6SMH8A9foflvWA8l5
   FIu57nRfPhPZc85+TF5VATqhQxslc89y2DBPSI0Ls/ZPY/aHX0dQohkQ0
   g==;
X-CSE-ConnectionGUID: 0RdbvCkiQBuXWoae8ibSQw==
X-CSE-MsgGUID: 36Yt0q9+Twmj2TZLHK/YMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67105122"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="67105122"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 20:15:55 -0700
X-CSE-ConnectionGUID: rS/w9ShoRTOr0LOxJ5xyUg==
X-CSE-MsgGUID: oNdfq1G9T4yNJ67V9X9aAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="184159739"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 20:15:49 -0700
Message-ID: <eb6a2ca0-84eb-4770-8300-cd8892eae6ad@linux.intel.com>
Date: Wed, 22 Oct 2025 11:15:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/25] KVM: TDX: Drop PROVE_MMU=y sanity check on
 to-be-populated mappings
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ackerley Tng <ackerleytng@google.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-4-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251017003244.186495-4-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_201559_318852_28C5CD9C 
X-CRM114-Status: GOOD (  29.29  )
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



On 10/17/2025 8:32 AM, Sean Christopherson wrote:
> Drop TDX's sanity check that a mirror EPT mapping isn't zapped between
> creating said mapping and doing TDH.MEM.PAGE.ADD, as the check is
> simultaneously superfluous and incomplete.  Per commit 2608f1057601
> ("KVM: x86/tdp_mmu: Add a helper function to walk down the TDP MMU"), the
> justification for introducing kvm_tdp_mmu_gpa_is_mapped() was to check
> that the target gfn was pre-populated, with a link that points to this
> snippet:
>
>   : > One small question:
>   : >
>   : > What if the memory region passed to KVM_TDX_INIT_MEM_REGION hasn't been pre-
>   : > populated?  If we want to make KVM_TDX_INIT_MEM_REGION work with these regions,
>   : > then we still need to do the real map.  Or we can make KVM_TDX_INIT_MEM_REGION
>   : > return error when it finds the region hasn't been pre-populated?
>   :
>   : Return an error.  I don't love the idea of bleeding so many TDX details into
>   : userspace, but I'm pretty sure that ship sailed a long, long time ago.
>
> But that justification makes little sense for the final code, as the check
> on nr_premapped after TDH.MEM.PAGE.ADD will detect and return an error if
> KVM attempted to zap a S-EPT entry (tdx_sept_zap_private_spte() will fail
> on TDH.MEM.RANGE.BLOCK due lack of a valid S-EPT entry).  And as evidenced
> by the "is mapped?" code being guarded with CONFIG_KVM_PROVE_MMU=y, KVM is
> NOT relying on the check for general correctness.
>
> The sanity check is also incomplete in the sense that mmu_lock is dropped
> between the check and TDH.MEM.PAGE.ADD, i.e. will only detect KVM bugs that
> zap SPTEs in a very specific window (note, this also applies to the check
> on nr_premapped).
>
> Removing the sanity check will allow removing kvm_tdp_mmu_gpa_is_mapped(),
> which has no business being exposed to vendor code, and more importantly
> will pave the way for eliminating the "pre-map" approach entirely in favor
> of doing TDH.MEM.PAGE.ADD under mmu_lock.
>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

> ---
>   arch/x86/kvm/vmx/tdx.c | 14 --------------
>   1 file changed, 14 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 326db9b9c567..4c3014befe9f 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -3181,20 +3181,6 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>   	if (ret < 0)
>   		goto out;
>   
> -	/*
> -	 * The private mem cannot be zapped after kvm_tdp_map_page()
> -	 * because all paths are covered by slots_lock and the
> -	 * filemap invalidate lock.  Check that they are indeed enough.
> -	 */
> -	if (IS_ENABLED(CONFIG_KVM_PROVE_MMU)) {
> -		scoped_guard(read_lock, &kvm->mmu_lock) {
> -			if (KVM_BUG_ON(!kvm_tdp_mmu_gpa_is_mapped(vcpu, gpa), kvm)) {
> -				ret = -EIO;
> -				goto out;
> -			}
> -		}
> -	}
> -
>   	ret = 0;
>   	err = tdh_mem_page_add(&kvm_tdx->td, gpa, pfn_to_page(pfn),
>   			       src_page, &entry, &level_state);


