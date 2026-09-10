Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA58DC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WB1NjqmZcUvP9wHGBJnRxwj++gRzhIlJU0V8tkFibco=; b=gTFlOS2hTTiE+iJFSrfRgJQzXK
	zQc2mqpxkkd67IvDAbxKGmWIY7tif0W89amb6VkiuTNGobQQANOZGhsyd6YbWNFwUSaulUaD+rHVz
	HkoYCmyPkHAcDbOjMq/9JQvVdfQR9cNhivE+qMelsMVMTb9yMuixPC59fAkbFYrjLjE2oSsVIhKed
	Vj/yz2L/F+6vYFVA97jZztceKtofQafONtdo9xsllj46nW2WCUvezsF1yeaXP57T5bIv4eOtTF+Q6
	evgVs4pCJyaMdQcYQC4Ku9N4nEvSfsf+X0ITZmUwfPxlcw0xdGVyh1ThQxx53ESx0cKCfmrcqX45m
	4apI4Y3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4agd-0000000Dp1Y-0Gku;
	Thu, 10 Sep 2026 09:03:15 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aga-0000000Dp1A-1Qw7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 09:03:13 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cda5e048fso31325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 02:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789030989; x=1789635789; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WB1NjqmZcUvP9wHGBJnRxwj++gRzhIlJU0V8tkFibco=;
        b=vTFldaO5urvXoFmKtzJlyBQxR4apRVi1NV5zCg6hP38UDDDtOX5kkFyP66zmmQ9CP2
         XZFkCmYsLnB//tkvpoATO9mhJ+sAJhKMJjgEieWTLEeLv0Le3Zj6CjXPofGsEPUZvCrU
         tPFdb2hCTtfQbvDzMWDKe9sz2bEcZpYx99ktMGwAWBxEcHdmsFmn2wcw7cz5rJPJ5zPI
         GbMlwIxCZwF7S3GFAZh+6ywG4wBGAy8DmYzdji00lKS/njHoyZeohoNppGXn7jLaZgad
         /JJKFMYElvOvT8LgbBnYLIoYaxNmRC+nWLkDUmUpudhiykA8MUmsmmADCvw+1EDN4qAu
         BGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030989; x=1789635789;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WB1NjqmZcUvP9wHGBJnRxwj++gRzhIlJU0V8tkFibco=;
        b=rvCzOFO5lauyeJdqOHy+P7jXrtPTtC3Mzc9GeLGobgpm0OIPI4AQ1a6DmQDUIjkE4t
         aJlvTzwT5jYlaVDZkvfVV/juGTIfJhUCoBz2oXLplE16J0L4pT0Vih4HMgPr7SETnEVJ
         d4g4sOcEG1ifnzvAqZXEbAPFivuHwQ1LqWrc+xOscpACjcRR8H73XQgB4DsW7L2kaxcd
         in6ILa2/tooBvcpAzb0gl74OuERoHVRvwwf/JPHOF9VZ1yVLEVAqPMQhdM6TUWjFsZqR
         UJHnquciFl0oe+DuN7x3JmKy5cjuot81K+3zCVJ6mservPWn1K+KEa6cA7fhJrpHIMPL
         tuAA==
X-Forwarded-Encrypted: i=1; AKwUvBz5rLbOLMwXR8x04F3LcYGUh9qqJm0tdCGrteA0ZLiVw+YgOo+R5nqLSMfWAPewj3O5B8y+AqeWcFFFTKOoE1PG@lists.infradead.org
X-Gm-Message-State: AFuF++mq65rxicRPHyeHeq7Jk2VCIZN0U5uut9w/h22h8WY8hAEqIzfo
	V57XG9CFTh2XyX7qzMiO7yrkKwbMfkruPtBxMPrSy/U5Iv5eqHmSM4ft+w41cmu4jw==
X-Gm-Gg: AYBFou1hiy/xxEY84hq42fVe1Gjc6ID1sYPbYQ8N44LAa7Moi6fz1qV9xAihVsTszhc
	tuDwtqXSp3BjPyhenZrcut/EuyDw8v7pdpfgGAANUCbRF1gZe03dr2b5g7D0/46YrL8gVFmfPjT
	ieG7qxxzGr28bwvcdlFVdmxHL9rb+uuHgxe4HRrU94v2mNdfuNvWVgBxnzM0l5+R9cZhQISshwP
	DbMaWwDbv86o1Eafp5Et+9lgMcdZ0iTgLfUJ/HC3aYrmrqKLRo1B8QPJ7i9AfTQUrH0vj5H4ZjR
	ZGOAmryQ2pt9ww2MwPUMMZJ+mPvM5aS1JPyo7VjqKAapCiqdEccbRqoOi2XCva+Im86YOac3csw
	ycYdxBX8hynyBp4cyETlRKDfNoLJ78OzkyjTrCCSeUYWLvF12Q0zyP0+5bcV7/pJrHMjLDhvvQq
	vsYNQQuczh5RiDXo8IQyaDxnguf6cVBiRcEQ2DQAjDjPDZdkCKy+sSCYavQl+JDve6OFh3Jm4lJ
	Hj0qREJJ3PK/yELeziUyMXgGZ90PELuAXpineJC26SR8yKE0sc=
X-Received: by 2002:a05:600c:1c20:b0:49b:8f5e:51f6 with SMTP id 5b1f17b1804b1-49d28f4b4ecmr656805e9.3.1789030988814;
        Thu, 10 Sep 2026 02:03:08 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ab73c2bsm48353295f8f.22.2026.09.10.02.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:03:08 -0700 (PDT)
Date: Thu, 10 Sep 2026 09:03:04 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Sebastian Ene <sebastianene@google.com>, catalin.marinas@arm.com,
	joey.gouly@arm.com, mark.rutland@arm.com, maz@kernel.org,
	oupton@kernel.org, rananta@google.com, Sascha.Bischoff@arm.com,
	suzuki.poulose@arm.com, will@kernel.org, kvmarm@lists.linux.dev,
	android-kvm@google.com, bgrzesik@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	nathan@kernel.org, perlarsen@google.com, seiden@linux.ibm.com,
	tglx@kernel.org, vdonnefort@google.com, vladimir.murzin@arm.com,
	yuzenghui@huawei.com, zenghui.yu@linux.dev
Subject: Re: [PATCH v2 01/13] KVM: arm64: Donate MMIO to the hypervisor
Message-ID: <aqJySHem_uYd-c1P@google.com>
References: <20260807164322.2970811-2-sebastianene@google.com>
 <20260807164322.2970811-3-sebastianene@google.com>
 <CA+EHjTw8H90YZmwbVu6gwe+2+D6QsDLybKcncLcCFSsK4kT+gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTw8H90YZmwbVu6gwe+2+D6QsDLybKcncLcCFSsK4kT+gw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_020312_410557_94BB2615 
X-CRM114-Status: GOOD (  35.02  )
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

Hi Fuad,

On Wed, Sep 09, 2026 at 04:39:03PM +0100, Fuad Tabba wrote:
> Hi Mostaf, Seb,
> 
> On Fri, 7 Aug 2026 at 17:43, Sebastian Ene <sebastianene@google.com> wrote:
> >
> > From: Mostafa Saleh <smostafa@google.com>
> ...
> > +int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size)
> > +{
> ...
> > +       /*
> > +        * We set HYP as the owner of the MMIO pages in the host stage-2, for:
> > +        * - host aborts: host_stage2_adjust_range() would fail for invalid non zero PTEs.
> > +        * - recycle under memory pressure: host_stage2_unmap_dev_all() would call
> > +        *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid ptes (counted).
> > +        * - other MMIO donation: Would fail as we check that the PTE is valid or empty.
> > +        */
> > +       ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
> > +                             addr, size, &host_s2_pool,
> > +                             KVM_HOST_INVALID_PTE_TYPE_DONATION,
> > +                             FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_HYP));
> 
> Before this patch the hyp linear map held nothing but memory, and this
> adds the first device mapping to it. That places it outside
> `fix_host_ownership()`, whose scope is the memblock list, so nothing
> at init verifies the ownership. It's correct as written: the donation
> writes the host stage-2 annotation itself.
> 
> This has already gone wrong once with the hyp stacks. The fix [1] adds
> `pkvm_check_host_ownership()` over the private range, which fails init
> on a leaf that isn't hyp-owned. I'd move this mapping there rather
> than leave it outside any ownership walk.
> 

This patch is not the latest, the latest one uses the private range:
https://lore.kernel.org/all/20260715115906.2664882-3-smostafa@google.com/

> ...
> 
> > +int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size)
> > +{
> ...
> > +               virt = __hyp_va(addr + offset);
> > +               if (kvm_pgtable_hyp_unmap(&pkvm_pgtable, (u64)virt, PAGE_SIZE) != PAGE_SIZE)
> > +                       goto err_with_unmap;
> 
> Sashiko is right, even though this is benign for now. `ret` is still 0
> from the `kvm_pgtable_get_leaf()` above, so a short unmap runs the
> rollback and returns success. Could it set an error before the goto?
> 

True, also fixed in the latest version.

> ...
> 
> > @@ -1161,13 +1161,12 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
> >         kvm_pte_t *childp = NULL;
> >         bool need_flush = false;
> >
> > -       if (!kvm_pte_valid(ctx->old)) {
> > -               if (stage2_pte_is_counted(ctx->old)) {
> > -                       kvm_clear_pte(ctx->ptep);
> > -                       mm_ops->put_page(ctx->ptep);
> > -               }
> > +       /*
> > +        * That also ignores stage2_pte_is_counted() instead of clearing
> > +        * the PTE as the MMIO can be owned by the hypervisor.
> > +        */
> > +       if (!kvm_pte_valid(ctx->old))
> >                 return 0;
> > -       }
> 
> This changes `kvm_pgtable_stage2_unmap()` for every caller, for a
> reason specific to `host_stage2_unmap_dev_all()`. The others are
> `__unmap_stage2_range()` and the two guest unmaps in `mem_protect.c`;
> as far as I can tell none is affected today, but
> `stage2_pte_is_counted()`'s comment still describes the old behaviour.

I digged more into this check and I am not sure why is it here in
the first place, as invalid counted PTEs are pKVM specific anyway.
And there is no place were pKVM clear them with an unmap call.
So this is more solid IMHO to avoid accidentally losing annotations.

> 
> What's changing isn't what the walk does, it's what counts as a
> counted entry, and that isn't the same question for the host stage-2
> as for a guest's. Could that be stated at the call site instead?

My understanding is that the old check never hits in guest (invalid
and counted)

> 
> I couldn't work out what "That" refers to in the new comment.

Sorry that was unclear, I mean't "the check", as it only checks
for validity now, it will ignore stage2_pte_is_counted() PTEs,
I just wanted to make that clear.


Thanks,
Mostafa

> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20260908110713.1540304-1-fuad.tabba@linux.dev/
> 
> >
> >         if (kvm_pte_table(ctx->old, ctx->level)) {
> >                 childp = kvm_pte_follow(ctx->old, mm_ops);
> > --
> > 2.55.0.654.g21b8a5bc05-goog
> >

