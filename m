Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53BEC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 15:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zizj9Zfv80ZephJVTwvLABE7brgFhnhJjP5l+ivAlo4=; b=LaYy+dr0AHbxH8kMQm6ifcDPnD
	U5FOLHfTYKJ1m/Z/wEF1ct5D1QUsos6gBQgJJ0kMQXTEJSXyN0IxezQTPxrjEsWOfCbOVTtt0LlDk
	1armyGh/rDuEf9fUPfvVWwS20GKlgPSykT1Efi3cx/7kLtg57M8FuP+N/iuaE/R6ScIxNaiG4Gx1v
	XDk/j+N8uOEkOdnfuID7IPOOi2or2lrKIhvUlyku5qqeImBFTKFT7cYgfj3UxDp59F6NcLuuyJZN6
	QnrF13krXgSBfW0gq8phUDfJSuHzJbBkXKNKvPcgkz03NWHRSq6p7p7Z+VopzTHjMOMxjyU+DEdlf
	/Sb8LJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0Wd-00000001Hty-25Nq;
	Sun, 26 Jul 2026 15:12:23 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0WZ-00000001HtP-0z6o
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 15:12:21 +0000
X-Forwarded-Encrypted: i=1; AHgh+RoTiaCiC23c+mFSAaE7FqtF74ugYbbgRMmBIhs27LxWUaEnMZOy3zHGMVkAfrt30RQEMcmvyei5o/QO/zDqHgnG@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785078736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zizj9Zfv80ZephJVTwvLABE7brgFhnhJjP5l+ivAlo4=;
	b=Ed5an+kqGfwD8pBRDUXWeBKBsbqyVmLvrFKqhTAJfynLyPvexo+F73bMmj8QwUoj4Ili72
	0+G8FYIDZkiA/0vIZjvl+q/vB+QChys3ijEtkpflDTeoODXywoDrWxCRJZWqgBiHGZIr5c
	fXlaimpL8T99gyKRVyZB/fK54xMIISA=
X-Gm-Message-State: AOJu0YxBtpCdCDDjKwGvF33PqRpyrr110rCtJqhinRS8wX4DrgnCq0lD
	vlnoUsJXclXVdSD9gYDxSyFKXek6Zzvvwfj2mmWo5/wSjSx/9LjKBv51t7nNNfHQJZcswYGzM3b
	aAkw4CLlu3nU7pKzyfjabhjcJCx0B5X0ilpLEwj4k
X-Received: by 2002:a05:622a:e198:20b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-529a5c1acfamr21067511cf.0.1785078726501; Sun, 26 Jul 2026
 08:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260715150125.2798116-1-smostafa@google.com>
In-Reply-To: <20260715150125.2798116-1-smostafa@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 26 Jul 2026 16:11:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyhFhooFDUsjEu_9TDkiPeOrFZLE4PEL7gFvf6Lk9ShOA@mail.gmail.com>
X-Gm-Features: AUfX_mwy3jWyH-Tvwq789eUPJlNX89fkyt2UCwKxTp-OL1P5nSI-YyRYDYs6HZQ
Message-ID: <CA+EHjTyhFhooFDUsjEu_9TDkiPeOrFZLE4PEL7gFvf6Lk9ShOA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Use consistent type for pool size
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, oupton@kernel.org, 
	seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	vdonnefort@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_081220_319256_A1153CD4 
X-CRM114-Status: GOOD (  21.33  )
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

On Wed, 15 Jul 2026 at 16:01, Mostafa Saleh <smostafa@google.com> wrote:
>
> All the pool sizes in the hypervisor are "unsigned long" but when
> they get passed to hyp_early_alloc_contig() or hyp_pool_init() they get
> truncated to 32-bits.
>
> That is not a big problem at the moment as to overflow this we need
> 4G bytes of carveout (2 TB of host or guest system memory).
>
> However when new users are added (as IOMMU) it is hard to reason
> about the carveout size anymore.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
> For example in the SMMUv3 to avoid this overflow, I add a cap
> for the pools size to UINT_MAX to work around this:
> https://lore.kernel.org/linux-iommu/20260715115906.2664882-9-smostafa@google.com/
> ---
>  arch/arm64/kvm/hyp/include/nvhe/early_alloc.h | 2 +-
>  arch/arm64/kvm/hyp/include/nvhe/gfp.h         | 4 ++--
>  arch/arm64/kvm/hyp/nvhe/early_alloc.c         | 2 +-
>  arch/arm64/kvm/hyp/nvhe/page_alloc.c          | 6 +++---
>  4 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h b/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
> index dc61aaa56f31..462883c4e325 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
> @@ -7,7 +7,7 @@
>  void hyp_early_alloc_init(void *virt, unsigned long size);
>  unsigned long hyp_early_alloc_nr_used_pages(void);
>  void *hyp_early_alloc_page(void *arg);
> -void *hyp_early_alloc_contig(unsigned int nr_pages);
> +void *hyp_early_alloc_contig(unsigned long nr_pages);
>
>  extern struct kvm_pgtable_mm_ops hyp_early_alloc_mm_ops;
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/gfp.h b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
> index 3766333bace9..3a428dc40b14 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/gfp.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
> @@ -29,6 +29,6 @@ void hyp_get_page(struct hyp_pool *pool, void *addr);
>  void hyp_put_page(struct hyp_pool *pool, void *addr);
>
>  /* Used pages cannot be freed */
> -int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
> -                 unsigned int reserved_pages);
> +int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned long nr_pages,
> +                 unsigned long reserved_pages);
>  #endif /* __KVM_HYP_GFP_H */
> diff --git a/arch/arm64/kvm/hyp/nvhe/early_alloc.c b/arch/arm64/kvm/hyp/nvhe/early_alloc.c
> index 00de04153cc6..9fef0c7d2185 100644
> --- a/arch/arm64/kvm/hyp/nvhe/early_alloc.c
> +++ b/arch/arm64/kvm/hyp/nvhe/early_alloc.c
> @@ -21,7 +21,7 @@ unsigned long hyp_early_alloc_nr_used_pages(void)
>         return (cur - base) >> PAGE_SHIFT;
>  }
>
> -void *hyp_early_alloc_contig(unsigned int nr_pages)
> +void *hyp_early_alloc_contig(unsigned long nr_pages)
>  {
>         unsigned long size = (nr_pages << PAGE_SHIFT);
>         void *ret = (void *)cur;
> diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> index 57f86aa0f82f..51460d420c94 100644
> --- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> +++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> @@ -229,12 +229,12 @@ void *hyp_alloc_pages(struct hyp_pool *pool, u8 order)
>         return hyp_page_to_virt(p);
>  }
>
> -int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
> -                 unsigned int reserved_pages)
> +int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned long nr_pages,
> +                 unsigned long reserved_pages)
>  {
>         phys_addr_t phys = hyp_pfn_to_phys(pfn);
>         struct hyp_page *p;
> -       int i;
> +       unsigned long i;
>
>         hyp_spin_lock_init(&pool->lock);
>         pool->max_order = min(MAX_PAGE_ORDER,
> --
> 2.55.0.141.g00534a21ce-goog
>

