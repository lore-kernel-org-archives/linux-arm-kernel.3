Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCBBC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44wijPDxOs8MXYWMCES6hvBHIczTeQ5fHlAE3Ub1cRQ=; b=nWTZR1R7rKNZeP+JwXS9bkRyZh
	Q8Z1Evs6edF/Y5BRkIrN4E8u3Us4yvJzwrnnv1tjuT7KMNmlYYrzp53NQaJfubL1bT0g060daPUxY
	t7dZTmKNZAU+0QvAwoVjsVqlex3sW15Wo5eOHZmJ4dA/cWnsZFMM5+/n03G4fL9pwytqDZVxHQ70F
	ttD641aP8BroFTk9+RT1+iWNrW/Q2zfQe8hVJShOLAoSFNLJz/bQhBWTiXEcAqmGhJ5f6FvM1QE+6
	vrZwxe1llWz8UzVAaSRu7URuHHtlY8ak8YEpMAmnG0SELlc8nfMqLu+xNMOH8eUUJSZ1KTlaE5puA
	E35dCvSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3x6D-00000009JXl-47iZ;
	Tue, 08 Sep 2026 14:47:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3x69-00000009JWu-3J0X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 14:47:00 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4956869750eso42281775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 07:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788878816; x=1789483616; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=44wijPDxOs8MXYWMCES6hvBHIczTeQ5fHlAE3Ub1cRQ=;
        b=E/D3Fi0JkyaDrZNAPkIjN7whaVs2ptUn77eNqzB9N+mimOc+2Rv1VFQmwaByBToIcs
         HPEBMcPAtKl4f/OdDP8uQrES3+THh49pD8S2AfUmY6Pbzt45ATLtE5D+APhZ/K6GGwZI
         OG5cUzvnufD+vjf9JM5ZQ6o2yu+ZaQ62fBx8Qvvd+xEEYQismSGlnJfLlL0T/9q9QVnW
         J4Lz+NW+gMJDYidfolOeFTvSgWP9aDBXeAX2cm7Yw1fmoCjcMhY+Zpy4B2Kyl95eJQPe
         ztYlJ5Un6rpp3EBg2vDD+BJfoFAkg/obMyw8P2n8u8xl/3YKdXi+GEyY7RBrT2Y7eGP2
         CP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788878816; x=1789483616;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=44wijPDxOs8MXYWMCES6hvBHIczTeQ5fHlAE3Ub1cRQ=;
        b=TEO+rwu4FU3Itcj5bsNbcvBq/BTKhilcvwY0kvF+NVglHzDJ768+euuTLqfmSEhna0
         4Hp14dBoWUt6kspd3uyYLmphNErh6m0a5sch8HiTSFtWrDAceWKd9/4WY/Eql8sPer7m
         kvb83sdwaaTF7YpDJ7gf6zHfRnDtJfxvu7GFmXLfuHabj+8duWD8RAy4TqPjixpqqrfe
         +544w2Xm7hZo2mzSMdlMH138RZslRNEZ7pCaSTzFUe1g0expG07Wg9ATxZcbnGly9uz1
         +wdndLIXwtBlRWch3o/2xYy7DZATYtF4Ty/H9jxNSC2cT8tUFIWf/QAGyrax4BAgGZ7l
         I3Gw==
X-Forwarded-Encrypted: i=1; AKwUvBwlvNe8pV3YyoyzAHtVhVPd1MHxWZqvg7lADDQWSeUqZK7tfI87ZU4stbrDNm/rH8v0ShjNLkAjRmFBNvzzZ0GW@lists.infradead.org
X-Gm-Message-State: AFuF++mAi1JAeDI5bjAqT0WskYIUUR7ga2XElZu4NOI7zeFnGCSOIIY5
	jQuHKXQLaVP5/a7/9TsNKmSE4LpQStMBiRKYv8szEXA2I9TqfX8XGxuVU2kVdrw1+w==
X-Gm-Gg: AYBFou0m22xYUT2q+F+bd/l6pA7/8nbrEQiHrbqYuAyz8eCILS//BRoYH4NHAQiJfGF
	FUkYAVBj7dfTE2UrB2xCKgV+c9XLxvv5d/4LcDQJV9Pv8mrq7PXfsXHSHCLc0JwNE7LjOlOkA/Y
	ZImUkV5o8m1bhQoAdChUpujDVw6eoSAhJzkJdxAexbnrZsXU+NdUqZ9uxe4Q0fdwEHLXf5kzSlZ
	RGw7f0d1qAh6AUhLndoVDC2kFIvcRsgWrd/J4dI/CbKskZ0deIp3IUAdwSOG+ajKUNhHb3R6p/p
	IX3pb6caSLL4szq2m+99ysgEfXIoS3OaPe/11Qsa/Oboz4HEaxY+SIDI2aWMwq8Y+f6+CPv+T2l
	mMATCrAUmsK6a1clKBe/SBwQijv75R3JQ7fHqn2o8ecK48HqMbAYMVGiuMD22dQexlTgpo5p0ZV
	oIynwTEo4H8UwPqqcxxBBNbbwCcIo9gTGV8DsADeBJ0KIvRnIiSyJB23gdzb/DRZKUk3Ez82iB4
	ElZSddQyzxosAwV1OeakqaqcSTOnJSJ
X-Received: by 2002:a05:600c:620b:b0:49c:fa20:cc07 with SMTP id 5b1f17b1804b1-49cff19cbf4mr236754075e9.30.1788878815281;
        Tue, 08 Sep 2026 07:46:55 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48594172546sm28296366f8f.15.2026.09.08.07.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:46:54 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:46:51 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 16/20] KVM: arm64: Add __pkvm_host_split_guest HVC
Message-ID: <aqAf27qhViD-V5ao@google.com>
References: <20260803100904.3563942-1-vdonnefort@google.com>
 <20260803100904.3563942-17-vdonnefort@google.com>
 <hrhbuwdfu625jtzm75t6wnva6odgreshchyv75ebqntlymslz7@adyxhe7oyypc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hrhbuwdfu625jtzm75t6wnva6odgreshchyv75ebqntlymslz7@adyxhe7oyypc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_074657_905475_2517672E 
X-CRM114-Status: GOOD (  40.56  )
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

On Mon, Sep 07, 2026 at 06:39:49PM +0100, Wei-Lin Chang wrote:
> On Mon, Aug 03, 2026 at 11:09:00AM +0100, Vincent Donnefort wrote:
> 
> [...]
> 
> > diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> > index 41a8687938eb..355573d53fed 100644
> > --- a/arch/arm64/include/asm/kvm_pgtable.h
> > +++ b/arch/arm64/include/asm/kvm_pgtable.h
> > @@ -824,8 +824,7 @@ int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size);
> >   * kvm_pgtable_stage2_split() is best effort: it tries to break as many
> >   * blocks in the input range as allowed by @mc_capacity.
> 
> Maybe also adjust the comment and remove @mc_capacity while changing
> this, looks like it was included by mistake.
> 
> >   */
> > -int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
> > -			     struct kvm_mmu_memory_cache *mc);
> > +int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size, void *mc);
> >  
> 
> [...]
> 
> > +static int host_stage2_split_gfn_meta(phys_addr_t phys, u64 ipa, u64 size, struct pkvm_hyp_vm *vm)
> > +{
> > +	pkvm_handle_t handle;
> > +	kvm_pte_t pte;
> > +	u64 gfn, end;
> > +	s8 level;
> > +	int ret;
> > +
> > +	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, &level);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (kvm_granule_size(level) != size)
> > +		return -EINVAL;
> > +
> > +	ret = host_stage2_decode_gfn_meta(pte, &handle, &gfn);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (handle != vm->kvm.arch.pkvm.handle || gfn != (ipa >> PAGE_SHIFT))
> > +		return -EINVAL;
> > +
> > +	end = phys + size;
> > +	while (phys < end) {
> > +		u64 meta = host_stage2_encode_gfn_meta(vm, gfn);
> > +		kvm_pte_t annotation = FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_GUEST) |
> > +				       FIELD_PREP(KVM_HOST_DONATION_PTE_EXTRA_MASK, meta);
> > +
> > +		ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
> > +				      phys, PAGE_SIZE, &host_s2_pool,
> > +				      KVM_HOST_INVALID_PTE_TYPE_DONATION, annotation);
> > +		if (WARN_ON(ret))
> > +			return ret;
> > +
> > +		phys += PAGE_SIZE;
> > +		gfn++;
> 
> Annotating every PTE is required here because patch 2's
> stage2_map_prefault_idmap() copies the same annotation to each PTE, so
> the resulting PTEs all contain the same gfn.
> 
> In other words patch 2 simply leaves wrong annotations in this case, and
> we make up for it here.
> 
> We can't just remove patch 2 because a HYP owned block needs to be
> broken down with HYP owned annotations when a single page is donated
> back to the host.
> 
> With this, would it be a better design to have an annotation-aware
> helper that splits a host block properly including the annotations, and
> call it whenever pKVM annotates or maps host stage-2?

I ended-up with that solution because it is difficult to draw the line between
pulling pKVM specific knowledge in pgtable.c and reusing pgtable.c private
functions in mem_protect.c. So I wanted a mem_protect.c function that can split
the annotations, but without having to touch pgtable.c. Indeed, that isn't the
most optimal.

Looking again at stage2_split_walker(), perhaps pgtable.c could export only a
single additional function to allow implementing a pkvm version of stage2_split.
This stage2 split can then be used for both guest and host.

Let me see if I can optimise that

Eventually part of the "pkvm_stage2_split()" could be reused by
stage2_map_prefault_idmap() I'll see if that's worth it.

> 
> >  	}
> >  
> > -	*gfn = FIELD_GET(KVM_HOST_PTE_OWNER_GUEST_GFN_MASK, meta);
> >  	return 0;
> >  }
> >  
> 
> [...]
> 
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index c4ebae0544d4..986b5a19b07a 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > @@ -1537,9 +1537,10 @@ static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
> >  			       enum kvm_pgtable_walk_flags visit)
> >  {
> >  	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
> > -	struct kvm_mmu_memory_cache *mc = ctx->arg;
> > -	struct kvm_s2_mmu *mmu;
> > +	struct stage2_map_data *data = ctx->arg;
> >  	kvm_pte_t pte = ctx->old, new, *childp;
> > +	struct kvm_s2_mmu *mmu = data->mmu;
> > +	void *mc = data->memcache;
> >  	enum kvm_pgtable_prot prot;
> >  	s8 level = ctx->level;
> >  	bool force_pte;
> > @@ -1554,30 +1555,37 @@ static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
> >  	if (!kvm_pte_valid(pte))
> >  		return 0;
> >  
> > -	nr_pages = stage2_block_get_nr_page_tables(level);
> > -	if (nr_pages < 0)
> > -		return nr_pages;
> > -
> > -	if (mc->nobjs >= nr_pages) {
> > -		/* Build a tree mapped down to the PTE granularity. */
> > +	if (unlikely(is_protected_kvm_enabled())) {
> > +		/* pKVM only supports splitting PMD-level blocks */
> > +		if (level != KVM_PGTABLE_LAST_LEVEL - 1)
> > +			return -EINVAL;
> >  		force_pte = true;
> >  	} else {
> > -		/*
> > -		 * Don't force PTEs, so create_unlinked() below does
> > -		 * not populate the tree up to the PTE level. The
> > -		 * consequence is that the call will require a single
> > -		 * page of level 2 entries at level 1, or a single
> > -		 * page of PTEs at level 2. If we are at level 1, the
> > -		 * PTEs will be created recursively.
> > -		 */
> > -		force_pte = false;
> > -		nr_pages = 1;
> > +		struct kvm_mmu_memory_cache *host_mc = mc;
> > +
> > +		nr_pages = stage2_block_get_nr_page_tables(level);
> > +		if (nr_pages < 0)
> > +			return nr_pages;
> > +
> > +		if (host_mc->nobjs >= nr_pages) {
> > +			/* Build a tree mapped down to the PTE granularity. */
> > +			force_pte = true;
> > +		} else if (host_mc->nobjs) {
> > +			/*
> > +			 * Don't force PTEs, so create_unlinked() below does
> > +			 * not populate the tree up to the PTE level. The
> > +			 * consequence is that the call will require a single
> > +			 * page of level 2 entries at level 1, or a single
> > +			 * page of PTEs at level 2. If we are at level 1, the
> > +			 * PTEs will be created recursively.
> > +			 */
> > +			force_pte = false;
> > +			nr_pages = 1;
> > +		} else {
> > +			return -ENOMEM;
> > +		}
> >  	}
> >  
> > -	if (mc->nobjs < nr_pages)
> > -		return -ENOMEM;
> > -
> > -	mmu = container_of(mc, struct kvm_s2_mmu, split_page_cache);
> >  	phys = kvm_pte_to_phys(pte);
> >  	prot = kvm_pgtable_stage2_pte_prot(pte);
> 
> I feel like this change is trying too hard to make the pKVM case fit
> in stage2_split_walker(). The assumptions differ by much: the original
> usage assumes kvm_mmu_memory_cache, can potentially split more than one
> level, and makes decisions base on the memcache's reserve.
> 
> Perhaps create another function for pKVM?

Looking at this version, the pKVM case is rather small, hence reusing the same
function made sense to me.

A completely separate function is actually what we have in Android kernels at
the moment.

Anyway, as per the discussion above, I'll probably try to create a pKVM specific
version of the split.

> 
> Thanks,
> Wei-Lin Chang
> 
> [...]

