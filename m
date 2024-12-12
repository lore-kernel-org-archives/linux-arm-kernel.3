Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD6AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 12:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9EWeRxh3hADQc6IlvVh9SaHVyloqGP0JnJbvwuN9zQ=; b=4cLr+81ZyuLZSa24PKhekkxqzI
	Nk8ay1PgUoStWuAw9iYMkj2wvCccenEBOtjFD7GgXPJ+J0TbTxWnl7pyEKrPIM+FijTdS1UdIIa68
	yIXj/CnzE+8qoepmyPqGcj3sepNqJd3dDRwczLsaYtok8+qW+a6N9H6vJ8NrVR7xGyzyj5fLgEttt
	4eZAyqqja2hqhsjE+Kwa/ZW3axk/fCu1I/CPIAdAGvTVJKS7FziC8/stCCMb+2AbKqRcnsfwbBy1n
	dNlM/Kvpax2E2DY66qy1aPFTyMvDdTo73u4nGgzgdvlDnhAC8zvFJFQcD2ViYeH6Li0ZupdHnnipT
	wFYiE9aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhwo-00000000K2M-2qLx;
	Thu, 12 Dec 2024 12:05:38 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhuu-00000000JZv-1xnA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 12:03:41 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aa689a37dd4so90921466b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 04:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734005018; x=1734609818; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h9EWeRxh3hADQc6IlvVh9SaHVyloqGP0JnJbvwuN9zQ=;
        b=ThJPyIvZOXQ2cd/CNqsqXO3P/WV822sZBPiEtiLJRc3E81QqKU0QQKfUzUj7o8RPrz
         sdNHTPk7uYnlbuweIQ8us0aewx9P66Tyf1IJYBp6yGdhWRq69AYoiMk1T0f0MlmZRjxk
         I9wRzTkD+eboLbbf7h7RvJSezWlJfu7jWvVWlVaBi8EVM3oGNtTU7wgLJNl7EnPB8jGY
         3P1DiANWs4qSETHmrZtbU8DzyeSoL44KTIz06lNwmzZPcw+9GMGUEN/z/mJyZZlxkgZB
         uBPpqHcREeK/jSuJVGiAzFurAKAMDCjzfpKodb5GmmzHbNP3tiNtNuQ51V491R0tLr6M
         MivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734005019; x=1734609819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9EWeRxh3hADQc6IlvVh9SaHVyloqGP0JnJbvwuN9zQ=;
        b=IK51SP9SGrahc1NNAbe6HrWLvAteNjJHvYv82Y1Kl8CRAtmqGetg9xUEtSm7lPcFrz
         P5Qg+Z+w3FAii/rE8lCKc6c2ZNwB5he98zoD2fGVVKuA1cXmFbyfDtpGmBwITbzNWlwe
         gd5Q2VjxJqU4BYQK8dZvNSbzzfEzlY3eqhucWsfgsdnWrbY+l/CaVusGD7y2Unb+Ibtv
         dNGeUBhKiHwqODgAphqCR192FuGfWQUztteiczDAGWHVnOb6ixNMhIhFSHNMrHAo6mkf
         SeZJVoqPqricbyMyjX5IBqmwCj8V5ITnALOEa/3nisCcF6gF/ztoBt+soTyoze4+5O1f
         ns0w==
X-Forwarded-Encrypted: i=1; AJvYcCU6lKmSJS4NmtKpHGgXtoZYz0A1UksJTXpH9DQiShDQenGh8KZnrkiK3711iGQurKJI0c3Ns+XHSrtFssNk1eXe@lists.infradead.org
X-Gm-Message-State: AOJu0YzMruVrbiHylJLd0oYi7vlVjaoYHViWBSuvlCV6xzWfEo0+K5Jt
	3MqACF+ISuANy9euX+OcxQsTVF/7N0Y4DDvyOkiE5tmION3nfXiVhiyxudRXUA==
X-Gm-Gg: ASbGncunb6CBFHCoheJnxZdakbvz9H7ZCOa3Z+wnpSSXKtBDx0U71N0kIeXbhhpvKgx
	SE6RTmrBvdxiVwZsIfI7HWhpIr6KS/SADONUYqjqf8owVanWxPcKHfQ3+vQnkcNrmuDncHe6x/b
	JDd2UD0gKwnbTmpa2WSLcwm1bQ0h4NBhmtkKcEC9pMaUhHoJ9XTBKor+7f6qx7K1x3MILD6a347
	qZxpCIQBISso225SZoS4IWDipDCRYiASImZLSiOBxFl3kNrcPBumJj/T0W65UYOmnmH65xbng2s
	xv52kUvrzCccyoY=
X-Google-Smtp-Source: AGHT+IHNt+Un2gfPyqIAbcWqrmcglHROVfmlY1zXsgu2LNAfmOSvgCPvPwUVtnRVf0w8WXkvglQwQQ==
X-Received: by 2002:a17:907:9145:b0:aa6:79fa:b47a with SMTP id a640c23a62f3a-aa6b10f5426mr581913766b.7.1734005018327;
        Thu, 12 Dec 2024 04:03:38 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6c0c865acsm120762366b.56.2024.12.12.04.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 04:03:37 -0800 (PST)
Date: Thu, 12 Dec 2024 12:03:34 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 17/18] KVM: arm64: Introduce the EL1 pKVM MMU
Message-ID: <Z1rRFuXdj_DjZrvX@google.com>
References: <20241203103735.2267589-1-qperret@google.com>
 <20241203103735.2267589-18-qperret@google.com>
 <86jzc5rv6a.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86jzc5rv6a.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_040340_511256_40E31283 
X-CRM114-Status: GOOD (  48.20  )
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

On Thursday 12 Dec 2024 at 11:35:09 (+0000), Marc Zyngier wrote:
> On Tue, 03 Dec 2024 10:37:34 +0000,
> Quentin Perret <qperret@google.com> wrote:
> > 
> > Introduce a set of helper functions allowing to manipulate the pKVM
> > guest stage-2 page-tables from EL1 using pKVM's HVC interface.
> > 
> > Each helper has an exact one-to-one correspondance with the traditional
> > kvm_pgtable_stage2_*() functions from pgtable.c, with a strictly
> > matching prototype. This will ease plumbing later on in mmu.c.
> > 
> > These callbacks track the gfn->pfn mappings in a simple rb_tree indexed
> > by IPA in lieu of a page-table. This rb-tree is kept in sync with pKVM's
> > state and is protected by a new rwlock -- the existing mmu_lock
> > protection does not suffice in the map() path where the tree must be
> > modified while user_mem_abort() only acquires a read_lock.
> > 
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > ---
> > 
> > The embedded union inside struct kvm_pgtable is arguably a bit horrible
> > currently... I considered making the pgt argument to all kvm_pgtable_*()
> > functions an opaque void * ptr, and moving the definition of
> > struct kvm_pgtable to pgtable.c and the pkvm version into pkvm.c. Given
> > that the allocation of that data-structure is done by the caller, that
> > means we'd need to expose kvm_pgtable_get_pgd_size() or something that
> > each MMU (pgtable.c and pkvm.c) would have to implement and things like
> > that. But that felt like a bigger surgery, so I went with the simpler
> > option. Thoughts welcome :-)
> 
> I really don't think it is too bad, and I rather keep some typing
> rather than going the void * route. Some comments below.

Sounds good.

> > 
> > Similarly, happy to drop the mappings_lock if we want to teach
> > user_mem_abort() about taking a write lock on the mmu_lock in the pKVM
> > case, but again this implementation is the least invasive into normal
> > KVM so that felt like a reasonable starting point.
> > ---
> >  arch/arm64/include/asm/kvm_host.h    |   1 +
> >  arch/arm64/include/asm/kvm_pgtable.h |  27 ++--
> >  arch/arm64/include/asm/kvm_pkvm.h    |  28 ++++
> >  arch/arm64/kvm/pkvm.c                | 195 +++++++++++++++++++++++++++
> >  4 files changed, 242 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index f75988e3515b..05936b57a3a4 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -85,6 +85,7 @@ void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu);
> >  struct kvm_hyp_memcache {
> >  	phys_addr_t head;
> >  	unsigned long nr_pages;
> > +	struct pkvm_mapping *mapping; /* only used from EL1 */
> >  };
> >  
> >  static inline void push_hyp_memcache(struct kvm_hyp_memcache *mc,
> > diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> > index 04418b5e3004..d24d18874015 100644
> > --- a/arch/arm64/include/asm/kvm_pgtable.h
> > +++ b/arch/arm64/include/asm/kvm_pgtable.h
> > @@ -412,15 +412,24 @@ static inline bool kvm_pgtable_walk_lock_held(void)
> >   *			be used instead of block mappings.
> >   */
> >  struct kvm_pgtable {
> > -	u32					ia_bits;
> > -	s8					start_level;
> > -	kvm_pteref_t				pgd;
> > -	struct kvm_pgtable_mm_ops		*mm_ops;
> > -
> > -	/* Stage-2 only */
> > -	struct kvm_s2_mmu			*mmu;
> > -	enum kvm_pgtable_stage2_flags		flags;
> > -	kvm_pgtable_force_pte_cb_t		force_pte_cb;
> > +	union {
> > +		struct {
> > +			u32					ia_bits;
> > +			s8					start_level;
> > +			kvm_pteref_t				pgd;
> > +			struct kvm_pgtable_mm_ops		*mm_ops;
> > +
> > +			/* Stage-2 only */
> > +			struct kvm_s2_mmu			*mmu;
> > +			enum kvm_pgtable_stage2_flags		flags;
> > +			kvm_pgtable_force_pte_cb_t		force_pte_cb;
> > +		};
> > +		struct {
> > +			struct kvm				*kvm;
> 
> Given that the kvm_s2_mmu already has a back-pointer to kvm_arch,
> maybe you could keep that one common and use it?
> 
> There is also some baked assumption that non-NV is always using the
> s2_mmu that's embedded in kvm_arch.

Right, what I need is one kvm_s2_mmu_to_kvm() away, so that should work
nicely. And as discussed below, I'll try ditching mappings_lock, so we
should be left the rb_root on its own.

> > +			struct rb_root				mappings;
> > +			rwlock_t				mappings_lock;
> > +		} pkvm;
> > +	};
> >  };
> >  
> >  /**
> > diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> > index cd56acd9a842..84211d5daf87 100644
> > --- a/arch/arm64/include/asm/kvm_pkvm.h
> > +++ b/arch/arm64/include/asm/kvm_pkvm.h
> > @@ -11,6 +11,12 @@
> >  #include <linux/scatterlist.h>
> >  #include <asm/kvm_pgtable.h>
> >  
> > +struct pkvm_mapping {
> > +	u64 gfn;
> > +	u64 pfn;
> > +	struct rb_node node;
> 
> nit: make the node the first field.

Ack.

> > +};
> > +
> >  /* Maximum number of VMs that can co-exist under pKVM. */
> >  #define KVM_MAX_PVMS 255
> >  
> > @@ -137,4 +143,26 @@ static inline size_t pkvm_host_sve_state_size(void)
> >  			SVE_SIG_REGS_SIZE(sve_vq_from_vl(kvm_host_sve_max_vl)));
> >  }
> >  
> > +static inline pkvm_handle_t pkvm_pgt_to_handle(struct kvm_pgtable *pgt)
> > +{
> > +	return pgt->pkvm.kvm->arch.pkvm.handle;
> > +}
> > +
> > +int pkvm_pgtable_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu, struct kvm_pgtable_mm_ops *mm_ops);
> > +void pkvm_pgtable_destroy(struct kvm_pgtable *pgt);
> > +int pkvm_pgtable_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
> > +			   u64 phys, enum kvm_pgtable_prot prot,
> > +			   void *mc, enum kvm_pgtable_walk_flags flags);
> > +int pkvm_pgtable_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
> > +int pkvm_pgtable_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size);
> > +int pkvm_pgtable_flush(struct kvm_pgtable *pgt, u64 addr, u64 size);
> > +bool pkvm_pgtable_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64 size, bool mkold);
> > +int pkvm_pgtable_relax_perms(struct kvm_pgtable *pgt, u64 addr, enum kvm_pgtable_prot prot,
> > +			     enum kvm_pgtable_walk_flags flags);
> > +void pkvm_pgtable_mkyoung(struct kvm_pgtable *pgt, u64 addr, enum kvm_pgtable_walk_flags flags);
> > +int pkvm_pgtable_split(struct kvm_pgtable *pgt, u64 addr, u64 size, struct kvm_mmu_memory_cache *mc);
> > +void pkvm_pgtable_free_unlinked(struct kvm_pgtable_mm_ops *mm_ops, void *pgtable, s8 level);
> > +kvm_pte_t *pkvm_pgtable_create_unlinked(struct kvm_pgtable *pgt, u64 phys, s8 level,
> > +					enum kvm_pgtable_prot prot, void *mc, bool force_pte);
> > +
> >  #endif	/* __ARM64_KVM_PKVM_H__ */
> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > index 85117ea8f351..9c648a510671 100644
> > --- a/arch/arm64/kvm/pkvm.c
> > +++ b/arch/arm64/kvm/pkvm.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/init.h>
> >  #include <linux/kmemleak.h>
> >  #include <linux/kvm_host.h>
> > +#include <asm/kvm_mmu.h>
> >  #include <linux/memblock.h>
> >  #include <linux/mutex.h>
> >  #include <linux/sort.h>
> > @@ -268,3 +269,197 @@ static int __init finalize_pkvm(void)
> >  	return ret;
> >  }
> >  device_initcall_sync(finalize_pkvm);
> > +
> > +static int cmp_mappings(struct rb_node *node, const struct rb_node *parent)
> > +{
> > +	struct pkvm_mapping *a = rb_entry(node, struct pkvm_mapping, node);
> > +	struct pkvm_mapping *b = rb_entry(parent, struct pkvm_mapping, node);
> > +
> > +	if (a->gfn < b->gfn)
> > +		return -1;
> > +	if (a->gfn > b->gfn)
> > +		return 1;
> > +	return 0;
> > +}
> > +
> > +static struct rb_node *find_first_mapping_node(struct rb_root *root, u64 gfn)
> > +{
> > +	struct rb_node *node = root->rb_node, *prev = NULL;
> > +	struct pkvm_mapping *mapping;
> > +
> > +	while (node) {
> > +		mapping = rb_entry(node, struct pkvm_mapping, node);
> > +		if (mapping->gfn == gfn)
> > +			return node;
> > +		prev = node;
> > +		node = (gfn < mapping->gfn) ? node->rb_left : node->rb_right;
> > +	}
> > +
> > +	return prev;
> > +}
> > +
> > +#define for_each_mapping_in_range(pgt, start_ipa, end_ipa, mapping, tmp)				\
> > +	for (tmp = find_first_mapping_node(&pgt->pkvm.mappings, ((start_ipa) >> PAGE_SHIFT));		\
> > +	     tmp && ({ mapping = rb_entry(tmp, struct pkvm_mapping, node); tmp = rb_next(tmp); 1; });)	\
> > +		if (mapping->gfn < ((start_ipa) >> PAGE_SHIFT))						\
> > +			continue;									\
> > +		else if (mapping->gfn >= ((end_ipa) >> PAGE_SHIFT))					\
> > +			break;										\
> > +		else
> 
> Oh gawd... This makes my head spin, and it can't be said that I'm
> adverse to the most bizarre macro constructs. I came up with this:
> 
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 9c648a5106717..b1b8501cae8f7 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -298,13 +298,19 @@ static struct rb_node *find_first_mapping_node(struct rb_root *root, u64 gfn)
>  	return prev;
>  }
>  
> -#define for_each_mapping_in_range(pgt, start_ipa, end_ipa, mapping, tmp)				\
> -	for (tmp = find_first_mapping_node(&pgt->pkvm.mappings, ((start_ipa) >> PAGE_SHIFT));		\
> -	     tmp && ({ mapping = rb_entry(tmp, struct pkvm_mapping, node); tmp = rb_next(tmp); 1; });)	\
> -		if (mapping->gfn < ((start_ipa) >> PAGE_SHIFT))						\
> -			continue;									\
> -		else if (mapping->gfn >= ((end_ipa) >> PAGE_SHIFT))					\
> -			break;										\
> +#define for_each_mapping_in_range(__pgt, __start, __end, __map)				 \
> +	for (struct rb_node *__tmp = find_first_mapping_node(&__pgt->pkvm.mappings, 	 \
> +							     ((__start) >> PAGE_SHIFT)); \
> +	     __tmp && ({								 \
> +			     __map = rb_entry(__tmp, struct pkvm_mapping, node); 	 \
> +			     __tmp = rb_next(__tmp);					 \
> +			     true;							 \
> +		     });								 \
> +	     )										 \
> +		if (__map->gfn < ((__start) >> PAGE_SHIFT))				 \
> +			continue;							 \
> +		else if (__map->gfn >= ((__end) >> PAGE_SHIFT))				 \
> +			break;								 \
>  		else
>  
>  int pkvm_pgtable_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu, struct kvm_pgtable_mm_ops *mm_ops)
> @@ -371,11 +377,10 @@ int pkvm_pgtable_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  {
>  	pkvm_handle_t handle = pkvm_pgt_to_handle(pgt);
>  	struct pkvm_mapping *mapping;
> -	struct rb_node *tmp;
>  	int ret = 0;
>  
>  	write_lock(&pgt->pkvm.mappings_lock);
> -	for_each_mapping_in_range(pgt, addr, addr + size, mapping, tmp) {
> +	for_each_mapping_in_range(pgt, addr, addr + size, mapping) {
>  		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn);
>  		if (WARN_ON(ret))
>  			break;
> @@ -392,11 +397,10 @@ int pkvm_pgtable_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  {
>  	pkvm_handle_t handle = pkvm_pgt_to_handle(pgt);
>  	struct pkvm_mapping *mapping;
> -	struct rb_node *tmp;
>  	int ret = 0;
>  
>  	read_lock(&pgt->pkvm.mappings_lock);
> -	for_each_mapping_in_range(pgt, addr, addr + size, mapping, tmp) {
> +	for_each_mapping_in_range(pgt, addr, addr + size, mapping) {
>  		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn);
>  		if (WARN_ON(ret))
>  			break;
> @@ -409,10 +413,9 @@ int pkvm_pgtable_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  int pkvm_pgtable_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  {
>  	struct pkvm_mapping *mapping;
> -	struct rb_node *tmp;
>  
>  	read_lock(&pgt->pkvm.mappings_lock);
> -	for_each_mapping_in_range(pgt, addr, addr + size, mapping, tmp)
> +	for_each_mapping_in_range(pgt, addr, addr + size, mapping)
>  		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn), PAGE_SIZE);
>  	read_unlock(&pgt->pkvm.mappings_lock);
>  
> @@ -423,11 +426,10 @@ bool pkvm_pgtable_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64 size,
>  {
>  	pkvm_handle_t handle = pkvm_pgt_to_handle(pgt);
>  	struct pkvm_mapping *mapping;
> -	struct rb_node *tmp;
>  	bool young = false;
>  
>  	read_lock(&pgt->pkvm.mappings_lock);
> -	for_each_mapping_in_range(pgt, addr, addr + size, mapping, tmp)
> +	for_each_mapping_in_range(pgt, addr, addr + size, mapping)
>  		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
>  					   mkold);
>  	read_unlock(&pgt->pkvm.mappings_lock);
> 
> Should be semantically equivalent, but I find it way more readable.

Yep, declaring __tmp within the loop itself is much nicer, it certainly
doesn't need to outlive it. I'll fold that in, thanks!

> Also, maybe add a comment indicating why __tmp needs to be updated
> *before* the body of the loop gets executed (case of freeing the
> mapping from within the body).

Ack, and I might rename the macro to for_each_mapping_in_range_safe()
as well to make it clear we have that property.

> > +
> > +int pkvm_pgtable_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu, struct kvm_pgtable_mm_ops *mm_ops)
> > +{
> > +	pgt->pkvm.kvm		= kvm_s2_mmu_to_kvm(mmu);
> > +	pgt->pkvm.mappings	= RB_ROOT;
> > +	rwlock_init(&pgt->pkvm.mappings_lock);
> 
> We talked about this f2f: Given that this lock is semantically
> equivalent to the MMU lock, maybe just use that by upgrading it to be
> taken as for write when pKVM is enabled.
> 
> It should be easy enough to wrap that in helpers that DTRT, and all
> this code could become devoid of any extra locking.

OK, I'll also stick lockdep assertions to document and enforce the
locking requirements from here.

> > +int pkvm_pgtable_relax_perms(struct kvm_pgtable *pgt, u64 addr, enum kvm_pgtable_prot prot,
> > +			     enum kvm_pgtable_walk_flags flags)
> > +{
> > +	return kvm_call_hyp_nvhe(__pkvm_host_relax_guest_perms, addr >> PAGE_SHIFT, prot);
> > +}
> > +
> > +void pkvm_pgtable_mkyoung(struct kvm_pgtable *pgt, u64 addr, enum kvm_pgtable_walk_flags flags)
> > +{
> > +	WARN_ON(kvm_call_hyp_nvhe(__pkvm_host_mkyoung_guest, addr >> PAGE_SHIFT));
> > +}
> > +
> > +void pkvm_pgtable_free_unlinked(struct kvm_pgtable_mm_ops *mm_ops, void *pgtable, s8 level)
> > +{
> > +	WARN_ON(1);
> > +}
> > +
> > +kvm_pte_t *pkvm_pgtable_create_unlinked(struct kvm_pgtable *pgt, u64 phys, s8 level,
> > +					enum kvm_pgtable_prot prot, void *mc, bool force_pte)
> > +{
> > +	WARN_ON(1);
> > +	return NULL;
> > +}
> > +
> > +int pkvm_pgtable_split(struct kvm_pgtable *pgt, u64 addr, u64 size, struct kvm_mmu_memory_cache *mc)
> > +{
> > +	WARN_ON(1);
> > +	return -EINVAL;
> > +}
> 
> Maybe turn these warnings into their _ONCE version. If we end-up here,
> seeing it once should be enough to realise we're toast.

Will do.

Cheers,
Quentin

