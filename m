Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D4DCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 22:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oll1MPE7hkNDT7M/Q1/FAEUqkNVEA+iYvJPlZMv+EKE=; b=XIcnfIRe/klm1PCQO2xoVxWaW+
	QKI1d01RQxjhkjaOZAVuE0k3RyhmlBUjVJ7MTtmsvuECMC0R8RhquEMjRQCPy+aPN9SjbcOCuhn4+
	1fB+5lhZIBhZuLH/DlwEImwNcsfs4x1n0PPuvaTVE54+eH/vZbVMca5xB54wxzKggn+PKw6xfgANX
	w6EdNRV9FaY2nU7ISY45z4PeWj0hzR0DD5n0194a/kg2YLJtlXBLEpmnMUnKR7NeZNdz2B/9fNbjL
	lQFlQLs98nYyN4+7MyLG8JizkjRBLfUSYorZunBYBihWscvmLF2HZUctOPmnLAooD2N3idjGghOPz
	F93Xa+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6yvD-00000007DOZ-1iTZ;
	Thu, 09 Oct 2025 22:15:39 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6yvB-00000007DOE-2PK0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 22:15:38 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b5533921eb2so1903706a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 15:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760048136; x=1760652936; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oll1MPE7hkNDT7M/Q1/FAEUqkNVEA+iYvJPlZMv+EKE=;
        b=zjC9ndRNqLGVdIS0kAZiohnAGnqKts9tujDu1goLqK5HzpslKNQHXpi6tzjAI+YFz3
         ixwn5JBRGVYhby9cq6xMbZV5INS/T/s92G8QK2ddZHai22IkVZBZKlvwlvj0JqSPj8Mx
         K3BAy5e1/bZ+KM3+1l7A5zGWBaF86xPDiFgAaLmJwoDA3c/p9LktZwppZ85y6tJyY6XQ
         ID06YiMgAkxiAoz7YNuRh7ol1dN142dyOxQ69CEGLWjRtuwZm7QQfsinZm0y4P1eln0y
         OCroXri2WL38fOxAtBF/ixhbzlD3nlK4B7yrjxpP6nMVP75q0M7iI5oSoHDbzvhuIl2s
         0fcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760048136; x=1760652936;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oll1MPE7hkNDT7M/Q1/FAEUqkNVEA+iYvJPlZMv+EKE=;
        b=ueoc9ZMrbdXQRa0MMZsVj/19RoSbE4/8QM0U7ZGHBtz5CPYhsJ8+dcWPiAvsT1T8B5
         plwuoJ3LNfqAICXFHIY7QS4YWxuBxDFYStt+7+5WbElnFHpPduu4QG4583bg+e+dVaq7
         H2KNYswaot08wWqK77ECxSq9cr2Yk19rl/uFrSZTSKSScVzvSLMI1CTswH2jO+N7RiNg
         mIFwS+xb8qVCynAb5lJ8p3X8k6eORXZXMNosASsUxut58o1bmZlG26iudBz95fQFVyFH
         5U2GUzNqo3+z/MtYEKjbwDONWagk4zHC2sFLEe1mC57I/uFj7wdk2QuKjSCCiRORogCx
         IsZg==
X-Gm-Message-State: AOJu0YyTCbHhnYvx1nCs6QQQT8mg/hkAk0xhkWd17V3p4ZDnEnNDIorx
	WmKBzwekttZiF6X+nQIQt1MtvRBNbScZQxj0xdM74PBwyAq8NiJYyZrTpLml1eRIg4gvErEYasz
	HLKbb6xl7LwmvuY1qm3W7YdMrmA==
X-Google-Smtp-Source: AGHT+IHgB0xcVfauc1u1HW+fOsPb84FTf4YqLuG37YUk27FkO9AUKT3em4wnlAFSqHZKd0l5szDhiTWCqndJLqsXJA==
X-Received: from pjad22.prod.google.com ([2002:a17:90a:1116:b0:33b:51fe:1a77])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:38ce:b0:32e:5646:d448 with SMTP id 98e67ed59e1d1-33b513b2ab9mr11170579a91.21.1760048135969;
 Thu, 09 Oct 2025 15:15:35 -0700 (PDT)
Date: Thu, 09 Oct 2025 15:15:34 -0700
In-Reply-To: <20251007221420.344669-6-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com> <20251007221420.344669-6-seanjc@google.com>
Message-ID: <diqzo6qfhgc9.fsf@google.com>
Subject: Re: [PATCH v12 05/12] KVM: guest_memfd: Enforce NUMA mempolicy using
 shared policy
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_151537_637877_C000D3AA 
X-CRM114-Status: GOOD (  35.51  )
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

Sean Christopherson <seanjc@google.com> writes:

> From: Shivank Garg <shivankg@amd.com>
>
> Previously, guest-memfd allocations followed local NUMA node id in absence
> of process mempolicy, resulting in arbitrary memory allocation.
> Moreover, mbind() couldn't be used  by the VMM as guest memory wasn't
> mapped into userspace when allocation occurred.
>
> Enable NUMA policy support by implementing vm_ops for guest-memfd mmap
> operation. This allows the VMM to map the memory and use mbind() to set the
> desired NUMA policy. The policy is stored in the inode structure via
> kvm_gmem_inode_info, as memory policy is a property of the memory (struct
> inode) itself. The policy is then retrieved via mpol_shared_policy_lookup()
> and passed to filemap_grab_folio_mpol() to ensure that allocations follow
> the specified memory policy.
>
> This enables the VMM to control guest memory NUMA placement by calling
> mbind() on the mapped memory regions, providing fine-grained control over
> guest memory allocation across NUMA nodes.
>
> The policy change only affect future allocations and does not migrate
> existing memory. This matches mbind(2)'s default behavior which affects
> only new allocations unless overridden with MPOL_MF_MOVE/MPOL_MF_MOVE_ALL
> flags, which are not supported for guest_memfd as it is unmovable.
>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> Tested-by: Ashish Kalra <ashish.kalra@amd.com>
> [sean: document the ABI impact of the ->get_policy() hook]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/guest_memfd.c | 69 ++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 67 insertions(+), 2 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index cc3b25155726..95267c92983b 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -4,6 +4,7 @@
>  #include <linux/falloc.h>
>  #include <linux/fs.h>
>  #include <linux/kvm_host.h>
> +#include <linux/mempolicy.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/pagemap.h>
>  
> @@ -27,6 +28,7 @@ struct gmem_file {
>  };
>  
>  struct gmem_inode {
> +	struct shared_policy policy;
>  	struct inode vfs_inode;
>  };
>  
> @@ -112,6 +114,19 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
>  	return r;
>  }
>  
> +static struct mempolicy *kvm_gmem_get_folio_policy(struct gmem_inode *gi,
> +						   pgoff_t index)

How about kvm_gmem_get_index_policy() instead, since the policy is keyed
by index?

> +{
> +#ifdef CONFIG_NUMA
> +	struct mempolicy *mpol;
> +
> +	mpol = mpol_shared_policy_lookup(&gi->policy, index);
> +	return mpol ? mpol : get_task_policy(current);

Should we be returning NULL if no shared policy was defined?

By returning NULL, __filemap_get_folio_mpol() can handle the case where
cpuset_do_page_mem_spread().

If we always return current's task policy, what if the user wants to use
cpuset_do_page_mem_spread()?

> +#else
> +	return NULL;

Returning current's task policy in the CONFIG_NUMA case seems to
conflict with returning NULL here.

> +#endif
> +}
> +
>  /*
>   * Returns a locked folio on success.  The caller is responsible for
>   * setting the up-to-date flag before the memory is mapped into the guest.
> @@ -124,7 +139,25 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
>  static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
>  {
>  	/* TODO: Support huge pages. */
> -	return filemap_grab_folio(inode->i_mapping, index);
> +	struct mempolicy *policy;
> +	struct folio *folio;
> +
> +	/*
> +	 * Fast-path: See if folio is already present in mapping to avoid
> +	 * policy_lookup.
> +	 */
> +	folio = __filemap_get_folio(inode->i_mapping, index,
> +				    FGP_LOCK | FGP_ACCESSED, 0);
> +	if (!IS_ERR(folio))
> +		return folio;
> +
> +	policy = kvm_gmem_get_folio_policy(GMEM_I(inode), index);

If we're going to return NULL if no shared policy is defined, then I
believe we can directly call mpol_shared_policy_lookup() here.

> +	folio = __filemap_get_folio_mpol(inode->i_mapping, index,
> +					 FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
> +					 mapping_gfp_mask(inode->i_mapping), policy);
> +	mpol_cond_put(policy);
> +
> +	return folio;
>  }
>  
>  static enum kvm_gfn_range_filter kvm_gmem_get_invalidate_filter(struct inode *inode)
> @@ -413,8 +446,38 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
>  	return ret;
>  }
>  
> +#ifdef CONFIG_NUMA
> +static int kvm_gmem_set_policy(struct vm_area_struct *vma, struct mempolicy *mpol)
> +{
> +	struct inode *inode = file_inode(vma->vm_file);
> +
> +	return mpol_set_shared_policy(&GMEM_I(inode)->policy, vma, mpol);
> +}
> +
> +static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
> +					     unsigned long addr, pgoff_t *pgoff)
> +{
> +	struct inode *inode = file_inode(vma->vm_file);
> +
> +	*pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> +
> +	/*
> +	 * Note!  Directly return whatever the lookup returns, do NOT return
> +	 * the current task's policy as is done when looking up the policy for
> +	 * a specific folio.  Kernel ABI for get_mempolicy() is to return
> +	 * MPOL_DEFAULT when there is no defined policy, not whatever the
> +	 * default policy resolves to.

To be more accurate, I think this sentence should be:

Kernel ABI for .get_policy is to return NULL if no policy is specified
at this index. The caller can then replace NULL with the default memory
policy instead of current's memory policy.

> +	 */
> +	return mpol_shared_policy_lookup(&GMEM_I(inode)->policy, *pgoff);
> +}
> +#endif /* CONFIG_NUMA */
> +
>  static const struct vm_operations_struct kvm_gmem_vm_ops = {
> -	.fault = kvm_gmem_fault_user_mapping,
> +	.fault		= kvm_gmem_fault_user_mapping,
> +#ifdef CONFIG_NUMA
> +	.get_policy	= kvm_gmem_get_policy,
> +	.set_policy	= kvm_gmem_set_policy,
> +#endif
>  };
>  
>  static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
> @@ -867,11 +930,13 @@ static struct inode *kvm_gmem_alloc_inode(struct super_block *sb)
>  	if (!gi)
>  		return NULL;
>  
> +	mpol_shared_policy_init(&gi->policy, NULL);
>  	return &gi->vfs_inode;
>  }
>  
>  static void kvm_gmem_destroy_inode(struct inode *inode)
>  {
> +	mpol_free_shared_policy(&GMEM_I(inode)->policy);
>  }
>  
>  static void kvm_gmem_free_inode(struct inode *inode)
> -- 
> 2.51.0.710.ga91ca5db03-goog

