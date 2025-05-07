Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB92C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkMMN7aoLjrVziOe6MXRXG9fOk8E9BWhlOpYp2kNdvc=; b=3aI6AynDt4JY4GOysPah315NgU
	w27YVSvpV0eUKTqcsc4385IOphrcCPhOeRWU4ikGX3MbE/o2tXat/mwBFPQBHEG5b2LvSWKj90Ige
	w+I4uT5VeEpTdkGvCHU1puq188nkWChYhJ278/wm6+QiHgqm7XsZA7ZtnT2CexNFs//pcmLJS20Ob
	l8TXNlSL3Y0+jESqg0PTFLSZdr/UIhcK7U+mGMywMDiEg7N8GfNg/zRSbHgTsqZ8wx6bLb+DFSHbq
	Vfkbl62jGNssx45xRVQ49yBo9YsEY1Uvnpahw7XOBQeCKKrBhcVo5jLGeKC46boxPgccKaONjPLGx
	oLxXOj7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUd1-0000000Dyoy-3LkS;
	Wed, 07 May 2025 02:35:23 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCSES-0000000Dkuz-12I2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 00:01:53 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3086107d023so5594578a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 17:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746576111; x=1747180911; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IkMMN7aoLjrVziOe6MXRXG9fOk8E9BWhlOpYp2kNdvc=;
        b=KCpRI4g7gvyrr7XGoAScW1N4/4oQexFQ60IIsE71OnbEiQdwq6nG4C/ws7PgI8TROQ
         Fia48qCxIVU47eouVJ/1lQxPZJyBQnJ3hn6/l7YG6JRxJVIrS2gadHzdi0rQoo+jOR0a
         Lq3dyFE9+OZMNJIwj4iOc/t4e3qgybYl4aONB5tcqmW8BrbTBcaMo83z15pQ1Bn7lGAh
         dtu64qXW179ddZDTDhEO0PGScqEmSuqH5mJmVKHqAlSNz2OfEKs43E8iVUqdL+H+mVBo
         mcnLOIVT8yPh4/9fXGA7HGcMSJ5iQW25ME2MXSsqCktqToiGqe/6N2TtdTSKEhK4sNQv
         ESow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746576111; x=1747180911;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkMMN7aoLjrVziOe6MXRXG9fOk8E9BWhlOpYp2kNdvc=;
        b=q7FYqHnUyx4bVwTD9ay/Jkzxf47fVeLj68WI+7LDHk1RZ1ShE8cw5l2gzigtXWmmjs
         ckfV32/ICx0jXF+BCCRJiSHkqItL2bHI+g5gsSyn+mlX8SjcGzoQmnV3/cIJtsEJ+G53
         JElFYevzSjr644z8cs41P9t80UDmc/x1TOfPO4FZA9tTMySg5XR7SwUYw1eOzejVCCmZ
         SIdP93kE7yAuJRWGxNHIgSF5kRKEIIl9zt6XJFu/WaN4xM6bFMM3oDM1Po0iXeYd8j7e
         NaPvRBAiwxrl+WaG0cWTG36GoAhEoQK1RjpdqJnqUsy1WWLyWhM0+soWLoe1o8wdGC45
         nWMA==
X-Forwarded-Encrypted: i=1; AJvYcCVqVZFhiaOI7yF1Ek5NLHNhu8lkiBKS5sQ4DWnlcd3eucrJKT+sGYY9RkB1xVQN+ZivSRQ8XC1Ed8eqDIEMc4yQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ5OOVAZceg1SUbRvF0NdJi8tTRySXoD9CkUg1NCNQB0dlyL6T
	D+ViIBwVz19EJx+dFnxR8+nsvKCCfbsara2/ISEs+8FrXIulieXwitqDd8NVXrQMAmjgGkBwHmC
	t7Q==
X-Google-Smtp-Source: AGHT+IG6EiJshM8I+/QNoyITpB25GV3XJSeVoH1WhXumO4+pfjjtK3RlA2H+mctfIUZWla7V1VRApNhLAsY=
X-Received: from pjbsi7.prod.google.com ([2002:a17:90b:5287:b0:2fb:fa85:1678])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38c6:b0:2ff:5a9d:937f
 with SMTP id 98e67ed59e1d1-30aac21f2f2mr2069431a91.24.1746576110794; Tue, 06
 May 2025 17:01:50 -0700 (PDT)
Date: Tue, 6 May 2025 17:01:49 -0700
In-Reply-To: <20250109204929.1106563-2-jthoughton@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com> <20250109204929.1106563-2-jthoughton@google.com>
Message-ID: <aBqi7fDtnvxzxV1V@google.com>
Subject: Re: [PATCH v2 01/13] KVM: Add KVM_MEM_USERFAULT memslot flag and bitmap
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_170152_288028_C10E5506 
X-CRM114-Status: GOOD (  33.25  )
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

On Thu, Jan 09, 2025, James Houghton wrote:
> Use one of the 14 reserved u64s in struct kvm_userspace_memory_region2
> for the user to provide `userfault_bitmap`.
> 
> The memslot flag indicates if KVM should be reading from the
> `userfault_bitmap` field from the memslot. The user is permitted to
> provide a bogus pointer. If the pointer cannot be read from, we will
> return -EFAULT (with no other information) back to the user.

For the uAPI+infrastructure changelog, please elaborate on the design goals and
choices.  The "what" is pretty obvious from the patch; describe why this is being
added.

> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
>  include/linux/kvm_host.h | 14 ++++++++++++++
>  include/uapi/linux/kvm.h |  4 +++-
>  virt/kvm/Kconfig         |  3 +++
>  virt/kvm/kvm_main.c      | 35 +++++++++++++++++++++++++++++++++++
>  4 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 401439bb21e3..f7a3dfd5e224 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -590,6 +590,7 @@ struct kvm_memory_slot {
>  	unsigned long *dirty_bitmap;
>  	struct kvm_arch_memory_slot arch;
>  	unsigned long userspace_addr;
> +	unsigned long __user *userfault_bitmap;
>  	u32 flags;
>  	short id;
>  	u16 as_id;
> @@ -724,6 +725,11 @@ static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
>  }
>  #endif
>  
> +static inline bool kvm_has_userfault(struct kvm *kvm)
> +{
> +	return IS_ENABLED(CONFIG_HAVE_KVM_USERFAULT);
> +}

Eh, don't think we need this wrapper.  Just check the CONFIG_xxx manually in the
one or two places where code isn't guarded by an #ifdef.

>  struct kvm_memslots {
>  	u64 generation;
>  	atomic_long_t last_used_slot;
> @@ -2553,4 +2559,12 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
>  				    struct kvm_pre_fault_memory *range);
>  #endif
>  
> +int kvm_gfn_userfault(struct kvm *kvm, struct kvm_memory_slot *memslot,
> +		      gfn_t gfn);
> +
> +static inline bool kvm_memslot_userfault(struct kvm_memory_slot *memslot)

I strongly prefer kvm_is_userfault_memslot().  KVM's weird kvm_memslot_<flag>()
nomenclature comes from ancient code, i.e. isn't something I would follow.

> +{
> +	return memslot->flags & KVM_MEM_USERFAULT;

I think it's worth checking for a non-NULL memslot, even if all current callers
pre-check for a slot.

> @@ -2042,6 +2051,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
>  		if (r)
>  			goto out;
>  	}
> +	if (mem->flags & KVM_MEM_USERFAULT)
> +		new->userfault_bitmap =
> +		  (unsigned long __user *)(unsigned long)mem->userfault_bitmap;

	if (mem->flags & KVM_MEM_USERFAULT)
		new->userfault_bitmap = u64_to_user_ptr(mem->userfault_bitmap);

>  	r = kvm_set_memslot(kvm, old, new, change);
>  	if (r)
> @@ -6426,3 +6438,26 @@ void kvm_exit(void)
>  	kvm_irqfd_exit();
>  }
>  EXPORT_SYMBOL_GPL(kvm_exit);
> +
> +int kvm_gfn_userfault(struct kvm *kvm, struct kvm_memory_slot *memslot,
> +		       gfn_t gfn)

I think this series is the perfect opportunity (read: victim) to introduce a
common "struct kvm_page_fault".  With a common structure to provide the gfn, slot,
write, exec, and is_private fields, this helper can handle the checks and the call
to kvm_prepare_memory_fault_exit().

And with that in place, I would vote to name this something like kvm_do_userfault(),
return a boolean, and let the caller return -EFAULT.

For making "struct kvm_page_fault" common, one thought would be to have arch code
define the entire struct, and simply assert on the few fields that common KVM needs
being defined by arch code.  And wrap all references in CONFIG_KVM_GENERIC_PAGE_FAULT.

I don't expect there will be a huge number of fields that common KVM needs, i.e. I
don't think the maintenance burden of punting to arch code will be high.  And letting
arch code own the entire struct means we don't need to have e.g. fault->arch.present
vs. fault->write in KVM x86, which to me is a big net negative for readability.

I'll respond to the cover letter with an attachment of seven patches to sketch out
the idea.

> +{
> +	unsigned long bitmap_chunk = 0;
> +	off_t offset;
> +
> +	if (!kvm_memslot_userfault(memslot))
> +		return 0;
> +
> +	if (WARN_ON_ONCE(!memslot->userfault_bitmap))
> +		return 0;

'0' is technically a valid userspace address.  I'd just drop this.  If we have a
KVM bug that results in failure to generate usefaults, we'll notice quite quickly.

> +
> +	offset = gfn - memslot->base_gfn;
> +
> +	if (copy_from_user(&bitmap_chunk,
> +			   memslot->userfault_bitmap + offset / BITS_PER_LONG,
> +			   sizeof(bitmap_chunk)))

Since the address is checked during memslot creation, I'm pretty sure this can
use __get_user().  At the very least, it should be get_user().

> +		return -EFAULT;
> +
> +	/* Set in the bitmap means that the gfn is userfault */
> +	return !!(bitmap_chunk & (1ul << (offset % BITS_PER_LONG)));

test_bit()?

