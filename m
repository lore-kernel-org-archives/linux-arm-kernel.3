Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A5AE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 10:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCbAYMLLvTAcxGqf7AGIu8LtVN+q/aDW+3h34FBSoIk=; b=1TRC93DN5ZNtjIxL4TDSvJGaIP
	+34WANA5o4DkFPHctZmGPKx/Ulom81u0XT2v18JYobXj1gUoLm75UYU/sbSJMRXeHap3oK0EJYg5E
	twQSAl4O71iAfj5PJTsy8DkuQ81P+BpbO3pwNGWYhfunteYZNSVjRJIuuMQM9GxLgjmDNxwCMYboM
	mVHMN70+VzLnY7Kz4wvRK6F6nW7Nvli0anNtMetO0cF25ae0upqryNRwHlIDfKYSUXiT3QMG+3jB1
	9Fu0rDGjNZGz267hqfDX8AZpzwyhAMYCNTNUdyiMV3TaLNcrMzjNLaMpQsoLBmkY7EamhNfjM3BfG
	2qb4efFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tODXe-00000001Vsb-2zta;
	Thu, 19 Dec 2024 10:14:02 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tODWY-00000001Vkg-0kIZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 10:12:55 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aa68b513abcso117555666b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 02:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734603172; x=1735207972; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nCbAYMLLvTAcxGqf7AGIu8LtVN+q/aDW+3h34FBSoIk=;
        b=utpjzvvSOam6MZAbn/Wu7c4EomzS/4QyvDWXpOc/aV741jTrkFx3X5Bi+YA3ZB2Y5T
         7h4pUkgQrHAaIqlQfEEyNoJ5ZUzZgFe54wq7zqx9MuUhFIB8Ijbo6c23+6mdAlpgYXSq
         S8uqfP8J7BTt0wb77OQw+CF39sBGPZvp7lyIo3lq4jCsOn8TWHtBLrWap5P6fCgLu9aV
         4qhmYRHbVkSA4rkgL9xYByhBM+pyUDWLggIeEenrjt9bE9Tc6F+DSXaKZ0r+byhqSuZK
         vSz6i2INaAL7pntLcU13QfZmeNsngQpifFxLCWp3Zi/UbLh8S60xvulPjt2erWxVS2jZ
         /IoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734603172; x=1735207972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCbAYMLLvTAcxGqf7AGIu8LtVN+q/aDW+3h34FBSoIk=;
        b=kL0tNq87GWEWrbNcq/W1gMGm7DAtgILH5H701wG5ZA2uNU98D+latqgqGwR/Zd0qO1
         BAiKi6v8zOaNYnRZtpeKYw0naGpBjAvrmAch7jYbuyHnH0X6lyPKxqgARMN4dX47I5Zl
         6g4/4pjSYM1DBfJdYxwnHW2i/B3xC97vblf709ljXQMQV+QoDCY+4QoJ7d/a1kbhhbjl
         8RWGHFiRs4zB/aFQwyA/N/tiluNAqUl/c9TTVANPidpvZbvitsSHSTamIMf867nwH8vI
         m2+aaIa9GsGuEZjW0EFEHGUqugU1BBajwYHNOv/qI5r8NUejQpqCQ2ELV16Yf8owmZwf
         6lCA==
X-Forwarded-Encrypted: i=1; AJvYcCXpiexjwUy2ntYEZW/o87wq8xPkkoUjXWsn3Uqjnhlr3SViGReg3JMm0H3Ku8GntNLegokyj3EMmCQLipB4lP8d@lists.infradead.org
X-Gm-Message-State: AOJu0YyLJtOQ3BIeOB1tCzvX5sZxgDdcjY1vQrjbdASTbIv/0JcyS/oF
	hGeYco5Tfg19b3yo0ZI7ZtO4PANl/oGgaiYHlQlBwZndDSnfDACJSfDpt7YYGg==
X-Gm-Gg: ASbGnctasbMwZ5HYJ/hsYXrAQDOaVK3LuldgiasWy4inpsczgjdV47Gp2LD7JsM9TEo
	7wzd00yDWb/SNdqRZS8H/+5eoZGXlgggs3akeUsfoEsWILkgWIMttDNIfW650O7Rz6YGdDfBQ8q
	vzmwxG0tR3wiZO0VQUQpyOiiovEWnppBWyPo1cOh57Vu0OVs830RVAI05T7cpAy+fyj4LCrDvcW
	WEBXkGCx43q+2/gfE1/p7ZBYir8+cJZdFijHYyoeF2Id7ezW1Zzy5/RyNDxmtHIE1LUldRmVG7j
	M5NFgw+BrHnlA/0=
X-Google-Smtp-Source: AGHT+IGMl2hg/hWZAxfwmB/IK3u3QFEHEjrtfo3Stww8uFN30SkW9zfcsvkOQ6GyYADyRplBw2Y2nw==
X-Received: by 2002:a17:907:dab:b0:aa6:538e:a311 with SMTP id a640c23a62f3a-aabf474df33mr596243266b.18.1734603171614;
        Thu, 19 Dec 2024 02:12:51 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06ebf3sm47724366b.196.2024.12.19.02.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 02:12:51 -0800 (PST)
Date: Thu, 19 Dec 2024 10:12:48 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 17/18] KVM: arm64: Introduce the EL1 pKVM MMU
Message-ID: <Z2PxoLcB3EMfk3_-@google.com>
References: <20241218194059.3670226-1-qperret@google.com>
 <20241218194059.3670226-18-qperret@google.com>
 <CA+EHjTymHPQGwLLpsWzYf1zHpnQKu4mV54Bz3U9HWf3Jb8TcqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTymHPQGwLLpsWzYf1zHpnQKu4mV54Bz3U9HWf3Jb8TcqA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_021254_227368_DA0BC622 
X-CRM114-Status: GOOD (  38.79  )
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

On Thursday 19 Dec 2024 at 09:49:31 (+0000), Fuad Tabba wrote:
> Hi Quentin
> 
> On Wed, 18 Dec 2024 at 19:41, Quentin Perret <qperret@google.com> wrote:
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
> > state and is protected by the mmu_lock like a traditional stage-2
> > page-table.
> >
> > Signed-off-by: Quentin Perret <qperret@google.com>
> 
> Minor nits (feel free to ignore). Apart from that, and despite that
> for_each_mapping_in_range_safe macro:
> 
> Tested-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>

Thanks!

> > ---
> >  arch/arm64/include/asm/kvm_host.h    |   1 +
> >  arch/arm64/include/asm/kvm_pgtable.h |  23 +--
> >  arch/arm64/include/asm/kvm_pkvm.h    |  26 ++++
> >  arch/arm64/kvm/pkvm.c                | 201 +++++++++++++++++++++++++++
> >  4 files changed, 242 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 1246f1d01dbf..f23f4ea9ec8b 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -85,6 +85,7 @@ void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu);
> >  struct kvm_hyp_memcache {
> >         phys_addr_t head;
> >         unsigned long nr_pages;
> > +       struct pkvm_mapping *mapping; /* only used from EL1 */
> >  };
> >
> >  static inline void push_hyp_memcache(struct kvm_hyp_memcache *mc,
> > diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> > index 04418b5e3004..6b9d274052c7 100644
> > --- a/arch/arm64/include/asm/kvm_pgtable.h
> > +++ b/arch/arm64/include/asm/kvm_pgtable.h
> > @@ -412,15 +412,20 @@ static inline bool kvm_pgtable_walk_lock_held(void)
> >   *                     be used instead of block mappings.
> >   */
> >  struct kvm_pgtable {
> > -       u32                                     ia_bits;
> > -       s8                                      start_level;
> > -       kvm_pteref_t                            pgd;
> > -       struct kvm_pgtable_mm_ops               *mm_ops;
> > -
> > -       /* Stage-2 only */
> > -       struct kvm_s2_mmu                       *mmu;
> > -       enum kvm_pgtable_stage2_flags           flags;
> > -       kvm_pgtable_force_pte_cb_t              force_pte_cb;
> > +       union {
> > +               struct rb_root                                  pkvm_mappings;
> > +               struct {
> > +                       u32                                     ia_bits;
> > +                       s8                                      start_level;
> > +                       kvm_pteref_t                            pgd;
> > +                       struct kvm_pgtable_mm_ops               *mm_ops;
> > +
> > +                       /* Stage-2 only */
> > +                       enum kvm_pgtable_stage2_flags           flags;
> > +                       kvm_pgtable_force_pte_cb_t              force_pte_cb;
> > +               };
> > +       };
> > +       struct kvm_s2_mmu                                       *mmu;
> >  };
> >
> >  /**
> > diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> > index cd56acd9a842..65f988b6fe0d 100644
> > --- a/arch/arm64/include/asm/kvm_pkvm.h
> > +++ b/arch/arm64/include/asm/kvm_pkvm.h
> > @@ -137,4 +137,30 @@ static inline size_t pkvm_host_sve_state_size(void)
> >                         SVE_SIG_REGS_SIZE(sve_vq_from_vl(kvm_host_sve_max_vl)));
> >  }
> >
> > +struct pkvm_mapping {
> > +       struct rb_node node;
> > +       u64 gfn;
> > +       u64 pfn;
> > +};
> > +
> > +int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
> > +                            struct kvm_pgtable_mm_ops *mm_ops);
> > +void pkvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt);
> > +int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size, u64 phys,
> > +                           enum kvm_pgtable_prot prot, void *mc,
> > +                           enum kvm_pgtable_walk_flags flags);
> > +int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
> > +int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size);
> > +int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size);
> > +bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64 size, bool mkold);
> > +int pkvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr, enum kvm_pgtable_prot prot,
> > +                                   enum kvm_pgtable_walk_flags flags);
> > +void pkvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr,
> > +                                enum kvm_pgtable_walk_flags flags);
> > +int pkvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
> > +                             struct kvm_mmu_memory_cache *mc);
> > +void pkvm_pgtable_stage2_free_unlinked(struct kvm_pgtable_mm_ops *mm_ops, void *pgtable, s8 level);
> > +kvm_pte_t *pkvm_pgtable_stage2_create_unlinked(struct kvm_pgtable *pgt, u64 phys, s8 level,
> > +                                              enum kvm_pgtable_prot prot, void *mc,
> > +                                              bool force_pte);
> >  #endif /* __ARM64_KVM_PKVM_H__ */
> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > index 85117ea8f351..930b677eb9b0 100644
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
> > @@ -268,3 +269,203 @@ static int __init finalize_pkvm(void)
> >         return ret;
> >  }
> >  device_initcall_sync(finalize_pkvm);
> > +
> > +static int cmp_mappings(struct rb_node *node, const struct rb_node *parent)
> > +{
> > +       struct pkvm_mapping *a = rb_entry(node, struct pkvm_mapping, node);
> > +       struct pkvm_mapping *b = rb_entry(parent, struct pkvm_mapping, node);
> > +
> > +       if (a->gfn < b->gfn)
> > +               return -1;
> > +       if (a->gfn > b->gfn)
> > +               return 1;
> > +       return 0;
> > +}
> > +
> > +static struct rb_node *find_first_mapping_node(struct rb_root *root, u64 gfn)
> > +{
> > +       struct rb_node *node = root->rb_node, *prev = NULL;
> > +       struct pkvm_mapping *mapping;
> > +
> > +       while (node) {
> > +               mapping = rb_entry(node, struct pkvm_mapping, node);
> > +               if (mapping->gfn == gfn)
> > +                       return node;
> > +               prev = node;
> > +               node = (gfn < mapping->gfn) ? node->rb_left : node->rb_right;
> > +       }
> > +
> > +       return prev;
> > +}
> > +
> > +/*
> > + * __tmp is updated to rb_next(__tmp) *before* entering the body of the loop to allow freeing
> > + * of __map inline.
> > + */
> > +#define for_each_mapping_in_range_safe(__pgt, __start, __end, __map)                           \
> > +       for (struct rb_node *__tmp = find_first_mapping_node(&(__pgt)->pkvm_mappings,           \
> > +                                                            ((__start) >> PAGE_SHIFT));        \
> > +            __tmp && ({                                                                        \
> > +                               __map = rb_entry(__tmp, struct pkvm_mapping, node);             \
> > +                               __tmp = rb_next(__tmp);                                         \
> > +                               true;                                                           \
> > +                      });                                                                      \
> > +           )                                                                                   \
> > +               if (__map->gfn < ((__start) >> PAGE_SHIFT))                                     \
> > +                       continue;                                                               \
> > +               else if (__map->gfn >= ((__end) >> PAGE_SHIFT))                                 \
> > +                       break;                                                                  \
> > +               else
> > +
> > +int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
> > +                            struct kvm_pgtable_mm_ops *mm_ops)
> > +{
> > +       pgt->pkvm_mappings      = RB_ROOT;
> > +       pgt->mmu                = mmu;
> > +
> > +       return 0;
> > +}
> > +
> > +void pkvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
> > +{
> > +       struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> > +       pkvm_handle_t handle = kvm->arch.pkvm.handle;
> > +       struct pkvm_mapping *mapping;
> > +       struct rb_node *node;
> > +
> > +       if (!handle)
> > +               return;
> > +
> > +       node = rb_first(&pgt->pkvm_mappings);
> > +       while (node) {
> > +               mapping = rb_entry(node, struct pkvm_mapping, node);
> > +               kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn);
> > +               node = rb_next(node);
> > +               rb_erase(&mapping->node, &pgt->pkvm_mappings);
> > +               kfree(mapping);
> > +       }
> > +}
> > +
> > +int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
> > +                          u64 phys, enum kvm_pgtable_prot prot,
> > +                          void *mc, enum kvm_pgtable_walk_flags flags)
> > +{
> > +       struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> > +       struct pkvm_mapping *mapping = NULL;
> > +       struct kvm_hyp_memcache *cache = mc;
> > +       u64 gfn = addr >> PAGE_SHIFT;
> > +       u64 pfn = phys >> PAGE_SHIFT;
> 
> Is it worth using the gpa_to_gfn and __phys_to_pfn helpers? Might
> obscure rather than help, but something to think about.

Apparently user_mem_abort() already uses an open coded variant of
gpa_to_gfn(), so I guess it makes sense to be consistent here? I
personally like the open coded variant better because it makes it clear
what this does, but no strong opinion really.

> > +       int ret;
> > +
> > +       if (size != PAGE_SIZE)
> > +               return -EINVAL;
> > +
> > +       lockdep_assert_held_write(&kvm->mmu_lock);
> > +       ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, prot);
> > +       if (ret) {
> > +               /* Is the gfn already mapped due to a racing vCPU? */
> > +               if (ret == -EPERM)
> > +                       return -EAGAIN;
> > +       }
> > +
> > +       swap(mapping, cache->mapping);
> > +       mapping->gfn = gfn;
> > +       mapping->pfn = pfn;
> > +       WARN_ON(rb_find_add(&mapping->node, &pgt->pkvm_mappings, cmp_mappings));
> 
> In addition to the warning, is it better to return an error as well?

Right, returning an error would be fatal for the guest I think, there's
nothing the VMM can do. The WARN alone keeps it limping along a bit
longer. In both case we're in deep trouble because the state is truly
borked.

I'm tempted to leave things as is (because the error path is really
going to be dead code in practice) unless anybody feels strongly about
it.

Cheers,
Quentin

> 
> > +       return ret;
> > +}
> > +
> > +int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
> > +{
> > +       struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> > +       pkvm_handle_t handle = kvm->arch.pkvm.handle;
> > +       struct pkvm_mapping *mapping;
> > +       int ret = 0;
> > +
> > +       lockdep_assert_held_write(&kvm->mmu_lock);
> > +       for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
> > +               ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn);
> > +               if (WARN_ON(ret))
> > +                       break;
> > +               rb_erase(&mapping->node, &pgt->pkvm_mappings);
> > +               kfree(mapping);
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> > +int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
> > +{
> > +       struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> > +       pkvm_handle_t handle = kvm->arch.pkvm.handle;
> > +       struct pkvm_mapping *mapping;
> > +       int ret = 0;
> > +
> > +       lockdep_assert_held(&kvm->mmu_lock);
> > +       for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
> > +               ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn);
> > +               if (WARN_ON(ret))
> > +                       break;
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> > +int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
> > +{
> > +       struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> > +       struct pkvm_mapping *mapping;
> > +
> > +       lockdep_assert_held(&kvm->mmu_lock);
> > +       for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
> > +               __clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn), PAGE_SIZE);
> > +
> > +       return 0;
> > +}
> > +
> > +bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64 size, bool mkold)
> > +{
> > +       struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> > +       pkvm_handle_t handle = kvm->arch.pkvm.handle;
> > +       struct pkvm_mapping *mapping;
> > +       bool young = false;
> > +
> > +       lockdep_assert_held(&kvm->mmu_lock);
> > +       for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
> > +               young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
> > +                                          mkold);
> > +
> > +       return young;
> > +}
> > +
> > +int pkvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr, enum kvm_pgtable_prot prot,
> > +                                   enum kvm_pgtable_walk_flags flags)
> > +{
> > +       return kvm_call_hyp_nvhe(__pkvm_host_relax_perms_guest, addr >> PAGE_SHIFT, prot);
> > +}
> > +
> > +void pkvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr,
> > +                                enum kvm_pgtable_walk_flags flags)
> > +{
> > +       WARN_ON(kvm_call_hyp_nvhe(__pkvm_host_mkyoung_guest, addr >> PAGE_SHIFT));
> > +}
> > +
> > +void pkvm_pgtable_stage2_free_unlinked(struct kvm_pgtable_mm_ops *mm_ops, void *pgtable, s8 level)
> > +{
> > +       WARN_ON_ONCE(1);
> > +}
> > +
> > +kvm_pte_t *pkvm_pgtable_stage2_create_unlinked(struct kvm_pgtable *pgt, u64 phys, s8 level,
> > +                                       enum kvm_pgtable_prot prot, void *mc, bool force_pte)
> > +{
> > +       WARN_ON_ONCE(1);
> > +       return NULL;
> > +}
> > +
> > +int pkvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
> > +                             struct kvm_mmu_memory_cache *mc)
> > +{
> > +       WARN_ON_ONCE(1);
> > +       return -EINVAL;
> > +}
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
> >

