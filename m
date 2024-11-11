Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714F2D3ABDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 18:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V727xVEcY7yFWLmUPOMMfS/ZHgcFLc0KHznkPFUeW0Q=; b=oqNusssOylORB9Xp1FVCXDhJRR
	hUDqoHiGSYsWV0W+Cr/qozkHIS/VoEU3UrTkg0N/I66QGnTDRpYpV9JdCm+nyeE9EPbb6AWO15nyK
	toqCMtsalV7BggEVcmUqkZo8GPE5iq4lgAZlYbuZqFcXEJ2nRYZ6Xrj8dJLffh/kICpyZmrMOcaQK
	DERGeaOCbJ1SIgVxbdGiwKFUwLtJ6MKhYSe2n0S6cuPO6Smbjt5SKfSZ3kzdMmaTl46bZ7XOCX5Oa
	oyM2ktr9YaZnTdhxiCDlDY9b8aGmphXH8m95Z507nf2JWn+BImpvcthrDDmoXv1IQdEDvu4+x7fC9
	HNML0PEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYtm-00000000rd4-3cht;
	Mon, 11 Nov 2024 18:12:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYrr-00000000r1x-42HO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 18:10:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8BC75C543F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 18:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E1FC4CED7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 18:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731348626;
	bh=FI81DDkXGkVEmFzo/VgrQsQ5U88rxBHJXFqcPkk5x28=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bGIcCU3ORpRVfPKjh3dwVwpUcCTfs82AQNiX9Q4YQj9CbA6Dp1sujSVFmrem7b8c8
	 VgBcSLsx1tW2Q38GsC8jZWOcgrddL+3xFX1FedHCTk7BfACiBWpB7bs7KwGvbNbgZm
	 NYGK5pmkXUd3ZNbOP69nga/uzK8kOgLs84iABngxP5DSO4b+yAww9axsAou8qGfgcn
	 9Ps4W6U8KwLvw9Kpj5uM6gQIpF/MxfastsMl9KZAYgmpHWi0zzbiBbUS3Z7z+ZTq1V
	 54rIcVJV2mqB1Ec5zbNUW7CVHIu4AWyPVdzd/WZ5nQZB1wkEZwrzh+MwOZv9bwyt1o
	 cqBRWvIxYZULQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb599aac99so43886951fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 10:10:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGpPR5TNgSSbN7OnKAoS5phWsP4DrWG03hdVJJD3z3s/Yw0OykUY3oXJMWrdMvUXnrU/RbTQtKuXF1CAVIXhL+@lists.infradead.org
X-Gm-Message-State: AOJu0YwdEYXQkPMVkjnvD+mYpPYZ7eEKyzOFeps1eMwmRNIv8PTJz3av
	nfi+Jaa/ePQUJoCn5NtwEuEJ+TWq485Eja5CdkwS5TFqt4/7vy+Np5i1sZFkmZZ1/YuTkkHavSV
	p4Eh+lsSrU/bJ0gkrqwb9FqDUr5o=
X-Google-Smtp-Source: AGHT+IHDZ1fPqbm4aBb22nZlwH9tCsMCjkpMdwzDD/ItbOaeZtm2Cy99tyeNjIL2ksg22Z3qN3Z/wt9pu6UONElamxw=
X-Received: by 2002:a05:651c:543:b0:2fb:5f9d:c2a3 with SMTP id
 38308e7fff4ca-2ff20222f14mr68139721fa.29.1731348625159; Mon, 11 Nov 2024
 10:10:25 -0800 (PST)
MIME-Version: 1.0
References: <20241111083544.1845845-8-ardb+git@google.com> <20241111083544.1845845-12-ardb+git@google.com>
 <20241111172725.GA20336@willie-the-truck>
In-Reply-To: <20241111172725.GA20336@willie-the-truck>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 11 Nov 2024 19:10:13 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEasFkp6jtxVQQRFwyxB=wHcJyV1G_oaWi+kcG6=yAbOg@mail.gmail.com>
Message-ID: <CAMj1kXEasFkp6jtxVQQRFwyxB=wHcJyV1G_oaWi+kcG6=yAbOg@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64/kvm: Avoid invalid physical addresses to signal
 owner updates
To: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_101028_124830_89BF3767 
X-CRM114-Status: GOOD (  35.76  )
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

On Mon, 11 Nov 2024 at 18:27, Will Deacon <will@kernel.org> wrote:
>
> On Mon, Nov 11, 2024 at 09:35:48AM +0100, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The pKVM stage2 mapping code relies on an invalid physical address to
> > signal to the internal API that only the owner_id fields of descriptors
> > should be updated, which are stored in the high bits of invalid
> > descriptors covering memory that has been donated to protected guests,
> > and is therefore unmapped from the host stage-2 page tables.
> >
> > Given that these invalid PAs are never stored into the descriptors, it
> > is better to rely on an explicit flag, to clarify the API and to avoid
> > confusion regarding whether or not the output address of a descriptor
> > can ever be invalid to begin with (which is not the case with LPA2).
> >
> > That removes a dependency on the logic that reasons about the maximum PA
> > range, which differs on LPA2 capable CPUs based on whether LPA2 is
> > enabled or not, and will be further clarified in subsequent patches.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/kvm/hyp/pgtable.c | 37 ++++++++------------
> >  1 file changed, 14 insertions(+), 23 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index b11bcebac908..4bf618b2cba7 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > @@ -35,14 +35,6 @@ static bool kvm_pgtable_walk_skip_cmo(const struct kvm_pgtable_visit_ctx *ctx)
> >       return unlikely(ctx->flags & KVM_PGTABLE_WALK_SKIP_CMO);
> >  }
> >
> > -static bool kvm_phys_is_valid(u64 phys)
> > -{
> > -     u64 parange_max = kvm_get_parange_max();
> > -     u8 shift = id_aa64mmfr0_parange_to_phys_shift(parange_max);
> > -
> > -     return phys < BIT(shift);
> > -}
> > -
> >  static bool kvm_block_mapping_supported(const struct kvm_pgtable_visit_ctx *ctx, u64 phys)
> >  {
> >       u64 granule = kvm_granule_size(ctx->level);
> > @@ -53,7 +45,7 @@ static bool kvm_block_mapping_supported(const struct kvm_pgtable_visit_ctx *ctx,
> >       if (granule > (ctx->end - ctx->addr))
> >               return false;
> >
> > -     if (kvm_phys_is_valid(phys) && !IS_ALIGNED(phys, granule))
> > +     if (!IS_ALIGNED(phys, granule))
> >               return false;
> >
> >       return IS_ALIGNED(ctx->addr, granule);
> > @@ -587,6 +579,9 @@ struct stage2_map_data {
> >
> >       /* Force mappings to page granularity */
> >       bool                            force_pte;
> > +
> > +     /* Walk should update owner_id only */
> > +     bool                            owner_update;
> >  };
> >
> >  u64 kvm_get_vtcr(u64 mmfr0, u64 mmfr1, u32 phys_shift)
> > @@ -885,18 +880,7 @@ static u64 stage2_map_walker_phys_addr(const struct kvm_pgtable_visit_ctx *ctx,
> >  {
> >       u64 phys = data->phys;
> >
> > -     /*
> > -      * Stage-2 walks to update ownership data are communicated to the map
> > -      * walker using an invalid PA. Avoid offsetting an already invalid PA,
> > -      * which could overflow and make the address valid again.
> > -      */
> > -     if (!kvm_phys_is_valid(phys))
> > -             return phys;
> > -
> > -     /*
> > -      * Otherwise, work out the correct PA based on how far the walk has
> > -      * gotten.
> > -      */
> > +     /* Work out the correct PA based on how far the walk has gotten */
> >       return phys + (ctx->addr - ctx->start);
> >  }
> >
> > @@ -908,6 +892,13 @@ static bool stage2_leaf_mapping_allowed(const struct kvm_pgtable_visit_ctx *ctx,
> >       if (data->force_pte && ctx->level < KVM_PGTABLE_LAST_LEVEL)
> >               return false;
> >
> > +     /*
> > +      * Pass a value that is aligned to any block size when updating
> > +      * only the owner_id on invalid mappings.
> > +      */
> > +     if (data->owner_update)
> > +             phys = 0;
> > +
>
> Hmm, isn't this a change in behaviour? Previously we would always store
> the owner annotations at the leaf, but now this will take place at a
> higher-level. I think that probably goes horribly wrong if we later
> try to change the owner for a sub-range; the block will be replaced with
> a table and the old ownership information will be lost rather than
> propagated to the leaves.
>

The data->force_pte check preceding this will take care of that, afaict.

