Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E70C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 18:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goGsGlGK4aCvgRlt6QQZwnV9SY/etRc0Yb1ngROaDOc=; b=RRix4XMXmvlxiY7XWRqjkuRe9T
	VkKGBCN+HP5XNbgL6afnOgiH9nQiJ3CgfjkkxJ8W+9lGLPHVVIlYm/OFB3GpiJF/k9l86CgfgLXu9
	dMhpgQF7mkvg5R0zh87BqJfM1cOPv4aN+wbgI/uzgdl3J61i1rCHqo1/q9sbXf8iSN67/kf0tLSwG
	bFz01ed+hKYiAy8QJ+ACYzt1Vr/8MJPBTbfxFgY6zYf8iVzpRXVpaE9dUq76Erb6teZtW1VF36OSE
	SlHWI2rBxCMvbz//fnJjFWBaMoRG1e4qohL+4KWL6hEugcNmwQTARsx3aY0K6TvZb5b0BNRf1qPiG
	X9cpyGRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNbZy-00000000mh0-2HkJ;
	Fri, 06 Jun 2025 18:14:10 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNbXr-00000000mVE-1tr4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 18:12:00 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-310efe825ccso2525602a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 11:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749233518; x=1749838318; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=goGsGlGK4aCvgRlt6QQZwnV9SY/etRc0Yb1ngROaDOc=;
        b=tFm5QeuleS5CRWrBmjmvNLpxCwz3ce8qufqYrrfGkAmfWlXpLAVXcfe0cVFuAG0qb3
         WRC5QzLCP28Sd4LvfsaFzUdZ+jIwA5G/aiEcg4Q5xHIBGezOF/CcM2wgP8+orvELS9rt
         3090iL0Oha7SjSKNNl4ZNKJmM8V/9AzMLMKliHpI9LB8QenTp2NsHUClHmGmHKjXnvQA
         kGJr1SOQSi50NKaFsXMHaJvMdl054j3H+Ru3/PZU8/10L5Fj50LiZNe2rn1aK88+leA7
         1pQ2K/tJAM7nhoGVklXVWG3fPovEmuNN6f5Ub0ZxwjySlSVnxiM1sfSxCOmJkyOuaeDh
         LSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749233518; x=1749838318;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=goGsGlGK4aCvgRlt6QQZwnV9SY/etRc0Yb1ngROaDOc=;
        b=EU6CXWXDqaIGRcK5SG0Uo97OWpTNx9AeJdDvA5CemrblDPKcnZbTiFyHlwTno3uger
         DXT3kaj9HF6CK/0U+TtEaIf305oZGePW9XsV9XFI83QyTc9oYrCf9frpOK1xyeHN50oF
         ZE2LDxhUouF8g6mIjcuPNfyec0JvRlE1LtWIVd38XOO3mPpNZvHTe2TRhOAxapfJs5xy
         pMZg6LP+Q3Sy3o6nPFA0ZBrddf8JgJ8gwM2suXBhFkVcqippZmJbqaYOvoB/1e58c934
         q90GwYyKUmiuBGK/koO6663+XyoJP97yFM6ydi7uABJ/aXc7xQnh9I5R2WWLMBbMlPD8
         Flcw==
X-Forwarded-Encrypted: i=1; AJvYcCW8psTdFiylBb8tY7jW1n8/nW8juBFCW71oHd649JuHp3yxd/1XsL+P8dU7QNpxmVBdrHlq6Eb4nlitKEWb2+t0@lists.infradead.org
X-Gm-Message-State: AOJu0YwNgyZ9UMJJdwkuKqz6PxzSeUWGjzQMYlsGGxE2u/by0vVPJ/sZ
	mDNLP71/Qi/6/NA/MHv/yEvFXWYvIUutw4sUZ0uYJT9f/irWs6X5lIkQ4nAjqhK96MF+7pt72rN
	pE4xpjA==
X-Google-Smtp-Source: AGHT+IEL48Zr+RVpxcph90N0P9k6HL0QyILrRx6484oP33DwOnxzZeVG7VJ6lc1LW/g9pPx5ZMAaWFJF2Pc=
X-Received: from pjbqd13.prod.google.com ([2002:a17:90b:3ccd:b0:312:4274:c4ce])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17c5:b0:313:33ca:3b8b
 with SMTP id 98e67ed59e1d1-31346b21437mr6696240a91.9.1749233518162; Fri, 06
 Jun 2025 11:11:58 -0700 (PDT)
Date: Fri, 6 Jun 2025 11:11:56 -0700
In-Reply-To: <20250524013943.2832-2-ankita@nvidia.com>
Mime-Version: 1.0
References: <20250524013943.2832-1-ankita@nvidia.com> <20250524013943.2832-2-ankita@nvidia.com>
Message-ID: <aEMvbIu530nCqwhG@google.com>
Subject: Re: [PATCH v6 1/5] KVM: arm64: Block cacheable PFNMAP mapping
From: Sean Christopherson <seanjc@google.com>
To: ankita@nvidia.com
Cc: jgg@nvidia.com, maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, ryan.roberts@arm.com, shahuang@redhat.com, 
	lpieralisi@kernel.org, david@redhat.com, aniketa@nvidia.com, cjia@nvidia.com, 
	kwankhede@nvidia.com, kjaju@nvidia.com, targupta@nvidia.com, 
	vsethi@nvidia.com, acurrid@nvidia.com, apopple@nvidia.com, 
	jhubbard@nvidia.com, danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com, 
	udhoke@nvidia.com, dnigam@nvidia.com, alex.williamson@redhat.com, 
	sebastianene@google.com, coltonlewis@google.com, kevin.tian@intel.com, 
	yi.l.liu@intel.com, ardb@kernel.org, akpm@linux-foundation.org, 
	gshan@redhat.com, linux-mm@kvack.org, ddutile@redhat.com, tabba@google.com, 
	qperret@google.com, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, maobibo@loongson.cn
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_111159_493943_A463043D 
X-CRM114-Status: GOOD (  32.66  )
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

On Sat, May 24, 2025, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Fixes a security bug due to mismatched attributes between S1 and
> S2 mapping.
> 
> Currently, it is possible for a region to be cacheable in S1, but mapped
> non cached in S2. This creates a potential issue where the VMM may
> sanitize cacheable memory across VMs using cacheable stores, ensuring
> it is zeroed. However, if KVM subsequently assigns this memory to a VM
> as uncached, the VM could end up accessing stale, non-zeroed data from
> a previous VM, leading to unintended data exposure. This is a security
> risk.
> 
> Block such mismatch attributes case by returning EINVAL when userspace
> try to map PFNMAP cacheable. Only allow NORMAL_NC and DEVICE_*.
> 
> CC: Oliver Upton <oliver.upton@linux.dev>
> CC: Sean Christopherson <seanjc@google.com>
> CC: Catalin Marinas <catalin.marinas@arm.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>  arch/arm64/kvm/mmu.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 2feb6c6b63af..305a0e054f81 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1466,6 +1466,18 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
>  	return vma->vm_flags & VM_MTE_ALLOWED;
>  }
>  
> +/*
> + * Determine the memory region cacheability from VMA's pgprot. This
> + * is used to set the stage 2 PTEs.
> + */
> +static unsigned long mapping_type_noncacheable(pgprot_t page_prot)

Return a bool.  And given that all the usage queries cachaeable, maybe invert
this predicate?

> +{
> +	unsigned long mt = FIELD_GET(PTE_ATTRINDX_MASK, pgprot_val(page_prot));
> +
> +	return (mt == MT_NORMAL_NC || mt == MT_DEVICE_nGnRnE ||
> +		mt == MT_DEVICE_nGnRE);
> +}

No need for the parantheses.  And since the values are clumped together, maybe
use a switch statement to let the compiler optimize the checks (though I'm
guessing modern compilers will optimize either way).

E.g.

static bool kvm_vma_is_cacheable(struct vm_area_struct *vma)
{
	switch (FIELD_GET(PTE_ATTRINDX_MASK, pgprot_val(vma->vm_page_prot))) {
	case MT_NORMAL_NC:
	case MT_DEVICE_nGnRnE:
	case MT_DEVICE_nGnRE:
		return false;
	default:
		return true;
	}
}


>  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  			  struct kvm_s2_trans *nested,
>  			  struct kvm_memory_slot *memslot, unsigned long hva,
> @@ -1612,6 +1624,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  
>  	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
>  
> +	if ((vma->vm_flags & VM_PFNMAP) &&
> +	    !mapping_type_noncacheable(vma->vm_page_prot))

I don't think this is correct, and there's a very real chance this will break
existing setups.  PFNMAP memory isn't strictly device memory, and IIUC, KVM
force DEVICE/NORMAL_NC based on kvm_is_device_pfn(), not based on VM_PFNMAP.

	if (kvm_is_device_pfn(pfn)) {
		/*
		 * If the page was identified as device early by looking at
		 * the VMA flags, vma_pagesize is already representing the
		 * largest quantity we can map.  If instead it was mapped
		 * via __kvm_faultin_pfn(), vma_pagesize is set to PAGE_SIZE
		 * and must not be upgraded.
		 *
		 * In both cases, we don't let transparent_hugepage_adjust()
		 * change things at the last minute.
		 */
		device = true;
	}

	if (device) {
		if (vfio_allow_any_uc)
			prot |= KVM_PGTABLE_PROT_NORMAL_NC;
		else
			prot |= KVM_PGTABLE_PROT_DEVICE;
	} else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC) &&
		   (!nested || kvm_s2_trans_executable(nested))) {
		prot |= KVM_PGTABLE_PROT_X;
	}

which gets morphed into the hardware memtype attributes as:

	switch (prot & (KVM_PGTABLE_PROT_DEVICE |
			KVM_PGTABLE_PROT_NORMAL_NC)) {
	case KVM_PGTABLE_PROT_DEVICE | KVM_PGTABLE_PROT_NORMAL_NC:
		return -EINVAL;
	case KVM_PGTABLE_PROT_DEVICE:
		if (prot & KVM_PGTABLE_PROT_X)
			return -EINVAL;
		attr = KVM_S2_MEMATTR(pgt, DEVICE_nGnRE);
		break;
	case KVM_PGTABLE_PROT_NORMAL_NC:
		if (prot & KVM_PGTABLE_PROT_X)
			return -EINVAL;
		attr = KVM_S2_MEMATTR(pgt, NORMAL_NC);
		break;
	default:
		attr = KVM_S2_MEMATTR(pgt, NORMAL);
	}

E.g. if the admin hides RAM from the kernel and manages it in userspace via
/dev/mem, this will break (I think).

So I believe what you want is something like this:

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index eeda92330ade..4129ab5ac871 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1466,6 +1466,18 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
        return vma->vm_flags & VM_MTE_ALLOWED;
 }
 
+static bool kvm_vma_is_cacheable(struct vm_area_struct *vma)
+{
+       switch (FIELD_GET(PTE_ATTRINDX_MASK, pgprot_val(vma->vm_page_prot))) {
+       case MT_NORMAL_NC:
+       case MT_DEVICE_nGnRnE:
+       case MT_DEVICE_nGnRE:
+               return false;
+       default:
+               return true;
+       }
+}
+
 static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
                          struct kvm_s2_trans *nested,
                          struct kvm_memory_slot *memslot, unsigned long hva,
@@ -1473,7 +1485,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 {
        int ret = 0;
        bool write_fault, writable, force_pte = false;
-       bool exec_fault, mte_allowed;
+       bool exec_fault, mte_allowed, is_vma_cacheable;
        bool device = false, vfio_allow_any_uc = false;
        unsigned long mmu_seq;
        phys_addr_t ipa = fault_ipa;
@@ -1615,6 +1627,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 
        vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
 
+       is_vma_cacheable = kvm_vma_is_cacheable(vma);
+
        /* Don't use the VMA after the unlock -- it may have vanished */
        vma = NULL;
 
@@ -1639,6 +1653,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
                return -EFAULT;
 
        if (kvm_is_device_pfn(pfn)) {
+               if (is_vma_cacheable)
+                       return -EINVAL;
+
                /*
                 * If the page was identified as device early by looking at
                 * the VMA flags, vma_pagesize is already representing the
@@ -1722,6 +1739,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
                prot |= KVM_PGTABLE_PROT_X;
 
        if (device) {
+               if (is_vma_cacheable) {
+                       ret = -EINVAL;
+                       goto out;
+               }
+
                if (vfio_allow_any_uc)
                        prot |= KVM_PGTABLE_PROT_NORMAL_NC;
                else


