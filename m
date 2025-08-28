Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514C7CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 11:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAt+br+G9Lon3yOcD2uCT+F1HP2hGvD0BFIJ9EDkS/w=; b=kaxPFYz9qgGP4AABtFktRGeRoq
	r/VIyc6Wb6LLN0BZsE8lufa22mHrRFqoWTSWDbQ0Qd9WgBT5tj5Pk/GRVB8KIuJ5+9yiOneVndDDy
	FnO6ldFU/FBUKuKsm6ukok9sAsf72ltaxTVSsbxfVtDXSPvtNRht052J6OdMbrSXkqy7OP0NYcRYY
	Gnpz+8OpKyxytHTNLghlzuNXtHuerp/9xAHzhds1y9s3XWivSU/c5iTkZ/aFN9s8VljgdTdjWNbbV
	+EkydFu4Zz0v3MIeWFruUIndHLblh2Zr2cdTarNoQ4iBijmBBKjcVO5XBvrzwyN/m1EEf9O4du0yz
	6YETNSJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uradn-00000001K7c-0ko9;
	Thu, 28 Aug 2025 11:18:03 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZlo-0000000181G-32Rk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 10:22:17 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4b29b715106so224261cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756376535; x=1756981335; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zAt+br+G9Lon3yOcD2uCT+F1HP2hGvD0BFIJ9EDkS/w=;
        b=vZqVh9U3vwfAehYo//+xJZotMeI4oDpGd8spskYB2NR7/B20YgvttZTyAmYMH9acB3
         sxUvnZvR6vzVeH11LG6FadZgHTZ6ntAwK3dedK0LO7iyW9M1n3RRAUqjC59Ik4Ydoq9F
         C9a/poVjsms07tMGOkh37S9C8grNSwOU+jj6EBIQv6PPg+z2ejwaT6b56ev1aUkU+36M
         A1enSfVr/K1GNoGZUdz59zzH1QxfV8z11Dp3vdOjuOir9yMSNG3MSlD31iIhh7NrCGSj
         pZxrb3wDFD2kKrg1uMmJco8Ui9QdHOrVPyir1gnPzlphyBFxQAUTqI4hQvuO+FV5+5mT
         KTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376535; x=1756981335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zAt+br+G9Lon3yOcD2uCT+F1HP2hGvD0BFIJ9EDkS/w=;
        b=c820nsAgPzxGHJTbfUGdgaICXcjIK3wjArbl2Jsvad/SFgb0TBqWOaqRnqRKLVdpSz
         kjx7aH35l+87czxcjD6ki2rLWehEHSnYWScjTPKaiD587CniwCg+E9JDyvLrd1Oaay2S
         byh8hUiovAZ4G7IJfJeqd/eCknXyFcu8ZY3q5/+zhk4ml5OTZrTR1auYDQWK8hOQgQtz
         +aLKsJ8XgKmnGOCfQC8tm2N11vsalRXGf7UMTEcZqFautw2VVJZgPClyOurKRMsQ0Gqk
         bRxbVtoKwFsvqySLTBU6ZOFFGXEK8ps7aAwTbRLE4ZiNXospMmcwqic0UaqydDaYQDsW
         4bXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxMRnOnG0wHRm5yyb2ktobb+lmaRveXcXN7fPlnPbCzxdi9UBUFZ75NHufq8LenY5ci7S/SheDYrM96LUhO1WV@lists.infradead.org
X-Gm-Message-State: AOJu0YynQeccKpWo6pp7x38ISU9xFTMKfbI8f2HYbGyy77+T2WjaOev9
	xHhfXZWuM238r2z8ecleWXy51WZUeCwu4iygYzKuRDs2VqJQLAXOoQaTbmnV7TMlCL6GZDXYWNW
	AQxB1GNEHgDf+zx9kgwrTAy+oeJ5BkENh2p8CMtwn
X-Gm-Gg: ASbGncs0Vwzoo2KK68iTzFRMod0n4AVZ8F3lskaTYrGgCEunnVqL1JBt9l72kJu2t1M
	Ft8OsQ0xbZsBlDXcCD/Kc6/o+hksRaLlKmnm7g8hYj4uSauP/wbi3yG9ggsN33/zn452XpK6MfK
	XBQsXky0uHoafv1A0JhwYYoavSrk5/l7l85n1iecTa927enO92DmHyAV87h04NvFeqPWJIaGFO/
	4jUdNaf+z2WAH44Ey+cYgKPpQ==
X-Google-Smtp-Source: AGHT+IENYaxKywEJVnhRd53PlyB2PEFU36G7mSwHHBh3QnGvBJswRyDjryZtJh3goBAjur1DAoDs201z525n5fnLFR0=
X-Received: by 2002:a05:622a:5143:b0:4b2:9b79:e700 with SMTP id
 d75a77b69052e-4b2ea8688bdmr14440241cf.4.1756376534543; Thu, 28 Aug 2025
 03:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250828093902.2719-1-roypat@amazon.co.uk> <20250828093902.2719-4-roypat@amazon.co.uk>
In-Reply-To: <20250828093902.2719-4-roypat@amazon.co.uk>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 28 Aug 2025 11:21:38 +0100
X-Gm-Features: Ac12FXxQhIbmHWE_IVdh_SbAhoCZMe-hp6nPpbqQbsT5jXtNkVhWc6QqYibQkV8
Message-ID: <CA+EHjTxOmDJkwjSvAUr2O4yqEkyqeQ=_p3E5Uj5yQrPW7Qz_HA@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] mm: introduce AS_NO_DIRECT_MAP
To: "Roy, Patrick" <roypat@amazon.co.uk>
Cc: "david@redhat.com" <david@redhat.com>, "seanjc@google.com" <seanjc@google.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"rppt@kernel.org" <rppt@kernel.org>, "will@kernel.org" <will@kernel.org>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"Cali, Marco" <xmarcalx@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, 
	"Thomson, Jack" <jackabt@amazon.co.uk>, "Manwaring, Derek" <derekmn@amazon.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_032216_766219_6540FC00 
X-CRM114-Status: GOOD (  34.93  )
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

Hi Patrick,

On Thu, 28 Aug 2025 at 10:39, Roy, Patrick <roypat@amazon.co.uk> wrote:
>
> Add AS_NO_DIRECT_MAP for mappings where direct map entries of folios are
> set to not present . Currently, mappings that match this description are
> secretmem mappings (memfd_secret()). Later, some guest_memfd
> configurations will also fall into this category.
>
> Reject this new type of mappings in all locations that currently reject
> secretmem mappings, on the assumption that if secretmem mappings are
> rejected somewhere, it is precisely because of an inability to deal with
> folios without direct map entries, and then make memfd_secret() use
> AS_NO_DIRECT_MAP on its address_space to drop its special
> vma_is_secretmem()/secretmem_mapping() checks.
>
> This drops a optimization in gup_fast_folio_allowed() where
> secretmem_mapping() was only called if CONFIG_SECRETMEM=y. secretmem is
> enabled by default since commit b758fe6df50d ("mm/secretmem: make it on
> by default"), so the secretmem check did not actually end up elided in
> most cases anymore anyway.
>
> Use a new flag instead of overloading AS_INACCESSIBLE (which is already
> set by guest_memfd) because not all guest_memfd mappings will end up
> being direct map removed (e.g. in pKVM setups, parts of guest_memfd that
> can be mapped to userspace should also be GUP-able, and generally not
> have restrictions on who can access it).
>
> Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
> ---
>  include/linux/pagemap.h   | 16 ++++++++++++++++
>  include/linux/secretmem.h | 18 ------------------
>  lib/buildid.c             |  4 ++--
>  mm/gup.c                  | 14 +++-----------
>  mm/mlock.c                |  2 +-
>  mm/secretmem.c            |  6 +-----
>  6 files changed, 23 insertions(+), 37 deletions(-)
>
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 12a12dae727d..b52b28ae4636 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -211,6 +211,7 @@ enum mapping_flags {
>                                    folio contents */
>         AS_INACCESSIBLE = 8,    /* Do not attempt direct R/W access to the mapping */
>         AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM = 9,
> +       AS_NO_DIRECT_MAP = 10,  /* Folios in the mapping are not in the direct map */
>         /* Bits 16-25 are used for FOLIO_ORDER */
>         AS_FOLIO_ORDER_BITS = 5,
>         AS_FOLIO_ORDER_MIN = 16,
> @@ -346,6 +347,21 @@ static inline bool mapping_writeback_may_deadlock_on_reclaim(struct address_spac
>         return test_bit(AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM, &mapping->flags);
>  }
>
> +static inline void mapping_set_no_direct_map(struct address_space *mapping)
> +{
> +       set_bit(AS_NO_DIRECT_MAP, &mapping->flags);
> +}
> +
> +static inline bool mapping_no_direct_map(struct address_space *mapping)
> +{
> +       return test_bit(AS_NO_DIRECT_MAP, &mapping->flags);
> +}
> +
> +static inline bool vma_is_no_direct_map(const struct vm_area_struct *vma)
> +{
> +       return vma->vm_file && mapping_no_direct_map(vma->vm_file->f_mapping);
> +}
> +

Any reason vma is const whereas mapping in the function that it calls
(defined above it) isn't?

Cheers,
/fuad

>  static inline gfp_t mapping_gfp_mask(struct address_space * mapping)
>  {
>         return mapping->gfp_mask;
> diff --git a/include/linux/secretmem.h b/include/linux/secretmem.h
> index e918f96881f5..0ae1fb057b3d 100644
> --- a/include/linux/secretmem.h
> +++ b/include/linux/secretmem.h
> @@ -4,28 +4,10 @@
>
>  #ifdef CONFIG_SECRETMEM
>
> -extern const struct address_space_operations secretmem_aops;
> -
> -static inline bool secretmem_mapping(struct address_space *mapping)
> -{
> -       return mapping->a_ops == &secretmem_aops;
> -}
> -
> -bool vma_is_secretmem(struct vm_area_struct *vma);
>  bool secretmem_active(void);
>
>  #else
>
> -static inline bool vma_is_secretmem(struct vm_area_struct *vma)
> -{
> -       return false;
> -}
> -
> -static inline bool secretmem_mapping(struct address_space *mapping)
> -{
> -       return false;
> -}
> -
>  static inline bool secretmem_active(void)
>  {
>         return false;
> diff --git a/lib/buildid.c b/lib/buildid.c
> index c4b0f376fb34..33f173a607ad 100644
> --- a/lib/buildid.c
> +++ b/lib/buildid.c
> @@ -65,8 +65,8 @@ static int freader_get_folio(struct freader *r, loff_t file_off)
>
>         freader_put_folio(r);
>
> -       /* reject secretmem folios created with memfd_secret() */
> -       if (secretmem_mapping(r->file->f_mapping))
> +       /* reject secretmem folios created with memfd_secret() or guest_memfd() */
> +       if (mapping_no_direct_map(r->file->f_mapping))
>                 return -EFAULT;
>
>         r->folio = filemap_get_folio(r->file->f_mapping, file_off >> PAGE_SHIFT);
> diff --git a/mm/gup.c b/mm/gup.c
> index adffe663594d..8c988e076e5d 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1234,7 +1234,7 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
>         if ((gup_flags & FOLL_SPLIT_PMD) && is_vm_hugetlb_page(vma))
>                 return -EOPNOTSUPP;
>
> -       if (vma_is_secretmem(vma))
> +       if (vma_is_no_direct_map(vma))
>                 return -EFAULT;
>
>         if (write) {
> @@ -2751,7 +2751,6 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>  {
>         bool reject_file_backed = false;
>         struct address_space *mapping;
> -       bool check_secretmem = false;
>         unsigned long mapping_flags;
>
>         /*
> @@ -2763,14 +2762,6 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>                 reject_file_backed = true;
>
>         /* We hold a folio reference, so we can safely access folio fields. */
> -
> -       /* secretmem folios are always order-0 folios. */
> -       if (IS_ENABLED(CONFIG_SECRETMEM) && !folio_test_large(folio))
> -               check_secretmem = true;
> -
> -       if (!reject_file_backed && !check_secretmem)
> -               return true;
> -
>         if (WARN_ON_ONCE(folio_test_slab(folio)))
>                 return false;
>
> @@ -2812,8 +2803,9 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>          * At this point, we know the mapping is non-null and points to an
>          * address_space object.
>          */
> -       if (check_secretmem && secretmem_mapping(mapping))
> +       if (mapping_no_direct_map(mapping))
>                 return false;
> +
>         /* The only remaining allowed file system is shmem. */
>         return !reject_file_backed || shmem_mapping(mapping);
>  }
> diff --git a/mm/mlock.c b/mm/mlock.c
> index a1d93ad33c6d..0def453fe881 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -474,7 +474,7 @@ static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
>
>         if (newflags == oldflags || (oldflags & VM_SPECIAL) ||
>             is_vm_hugetlb_page(vma) || vma == get_gate_vma(current->mm) ||
> -           vma_is_dax(vma) || vma_is_secretmem(vma) || (oldflags & VM_DROPPABLE))
> +           vma_is_dax(vma) || vma_is_no_direct_map(vma) || (oldflags & VM_DROPPABLE))
>                 /* don't set VM_LOCKED or VM_LOCKONFAULT and don't count */
>                 goto out;
>
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index 422dcaa32506..a2daee0e63a5 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -134,11 +134,6 @@ static int secretmem_mmap_prepare(struct vm_area_desc *desc)
>         return 0;
>  }
>
> -bool vma_is_secretmem(struct vm_area_struct *vma)
> -{
> -       return vma->vm_ops == &secretmem_vm_ops;
> -}
> -
>  static const struct file_operations secretmem_fops = {
>         .release        = secretmem_release,
>         .mmap_prepare   = secretmem_mmap_prepare,
> @@ -206,6 +201,7 @@ static struct file *secretmem_file_create(unsigned long flags)
>
>         mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
>         mapping_set_unevictable(inode->i_mapping);
> +       mapping_set_no_direct_map(inode->i_mapping);
>
>         inode->i_op = &secretmem_iops;
>         inode->i_mapping->a_ops = &secretmem_aops;
> --
> 2.50.1
>

