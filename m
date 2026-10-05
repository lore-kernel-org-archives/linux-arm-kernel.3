Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F0CCA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 15:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQ07Wpw/41IyXuGwO1TNf2h3w/qx6ENdaCXlHUoPSxo=; b=YoWF/y0DqzhWwsVuYUl6asjWJP
	mQfPKmnrtg5G+kbikFVCU//9jpV3U/QqmEU8ESZQGOqoBMZTY9cPbDjmr6CLmsOhZ8/vwwwFe4I7A
	yOwwmywV3BzE8AYZIastDbSPreXUUBbWHdu9wdshgkUkunK5uc1PzymEm+TW9SXZLVtCvPfBG5ocT
	Ke0PBFqjMxGFRAlOes7mXgG7fFhwcOEqqlpNnAHdY9Q2XD7i8tXuh/earfgr5J800ECOJ6Kf2EKjj
	h4sL7O4fLQWm+kaUnshbwFAG0BSweYNb3DB55hxvuSAY7PVYTfREzXZ4+JdCdevjNBDaqxmdaSKHW
	oinxXyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkCt-0000000GiSd-0dsh;
	Mon, 05 Oct 2026 15:02:23 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkCq-0000000GiRh-3CNU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 15:02:22 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a1722c37c9so8691485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 08:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791212539; x=1791817339; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lQ07Wpw/41IyXuGwO1TNf2h3w/qx6ENdaCXlHUoPSxo=;
        b=aj9gOPAcHSIkAF0PF1CUU//hSgDcQwTsuKMV7YWpp23ISNulwHA4Y7nxqsJe9pQ0x8
         2d9WRmU9wOHa2IYzhEOJ7IHPy8L4LEvOwaAxNUpZp8ZzDG2GuzcpxzPns6tt+tUp3T8z
         sNrDyAnRnF8J8UbHCcHw+KUsRvb/irnfB10OSsE29WIf+PNdOPN1xMwwVZBFYzfP3u47
         IwVLWrCz7axTKkklNU6eFWkx5YpNQNOnps60imh7vCjLeVArfHi4P/lk6xr0Ouz0gb7f
         6vdYgSTYoVjg4cjr/OSgLyhooo0CZkIR4msGCRu7N7jyphcVjABEHBevX5U700OfDlp3
         epdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212539; x=1791817339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQ07Wpw/41IyXuGwO1TNf2h3w/qx6ENdaCXlHUoPSxo=;
        b=W3RDTPSPPfyPGNCWNsTrsA6j+GEIrgXiyHr7IBfFiNCPFOZrrQ/EuPL94sOPHbSqnR
         +ePrLzuAeKabz4pHARVF9goTTjKoZTwzBBpFZfWAtb8UORapJKTG8XBeJYPOrlEGOTG7
         lzlApG11Odo1yuyohzrcTDpqklDSFdDbir0/Vndq6/1TIpHv09x6WtwaqZwh+qc1B/Ab
         iHdWCRCmmGvDh/o9GAYyQUxh5l3JfAaxotZgDFGnkHuAeMpN/4J3c4X+zFSYzkvSw86u
         xxLsq+mtm+hV7ywBiM1EJaC/sf4G0B3lhX4wxD2tRtIk6g/dtiWcuhv1twUIWbMuULYn
         6tqw==
X-Forwarded-Encrypted: i=1; AKwUvBzSKBWmNv+BY7acb/8jWapO8vXvaSUCiAtEZ2ve/4ltQ4W81hlO8Jg3QspAHrtgVzKJlE9MR8BhyTnrTYj/aLGT@lists.infradead.org
X-Gm-Message-State: AFuF++nBnmHMdBZ2Vg6Al74916kxnZLEyVEgLbHyoM4HYuURdLUYDFMT
	VLOaQAjpVqvKlG4UqTfsZELA+UdFHtm8WsiKViAEyqQFYToFGaZxnffIG8LsCCXtCA==
X-Gm-Gg: AYBFou0/HFucVf79FzaMTl1WJFbw2hWgQ4Ht9p6WjI+zv1nYzStMjlwePNaSpi7YGTh
	yJGRIwrBBaVu9BfDjXfp3kRhDUCNgsm6rXb7uLgpUblOr8mTIpIh3+QQBxjou32HlG2xL6y7rFk
	S07KDgXREgYz80WkLqd85ecXB9ousw4rxHpmCG/FJmYE5dWQq3BOrrGMfwUTZC11bsO0pINHmrH
	rLyHgeXhLsfs5CYO0o7sWAIMa+QdN+WGJvZx00ia/5I9DANnCDKultnKBIU7WDrAUfM+mLB1WJA
	456+ihkZAj3oTlMqQjYNqT0wk43D8k2UpMafvJc8s5I6aPputcR+XmU++oa05BRlChcsGine5VO
	d6G81QJAg7nnokMVIg2/KKpxqV0Nhod2T6+uplbpNrnEwe2I6/pBc598XjDOhHAzg8TXhvI7ljR
	+bVQn+7pX4y2pzE8hHoPjXFbYNfErw0D6eC0uq2TW3BRyVQYeBCPPphPn5vicdUXoK1HX/3dUFq
	wBJtRTNkumPEMZ1VrArYvSN5ydKiD0LHzKZooJgFrA=
X-Received: by 2002:a05:600c:4e4e:b0:4a0:62d:4424 with SMTP id 5b1f17b1804b1-4a027566f93mr192858015e9.8.1791212537927;
        Mon, 05 Oct 2026 08:02:17 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1785398b5sm156955e9.2.2026.10.05.08.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:02:12 -0700 (PDT)
Date: Mon, 5 Oct 2026 16:02:06 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oupton@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, tabba@google.com,
	sebastianene@google.com, keirf@google.com, qperret@google.com,
	linu.cherian@arm.com
Subject: Re: [PATCH v3 2/2] KVM: arm64: Support BBM level 3
Message-ID: <asO77kvqqwCsJt8I@google.com>
References: <20260904132855.638117-1-smostafa@google.com>
 <20260904132855.638117-3-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904132855.638117-3-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_080220_898485_EECC4041 
X-CRM114-Status: GOOD (  38.80  )
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

On Fri, Sep 04, 2026 at 01:28:55PM +0000, Mostafa Saleh wrote:
> If the system supports hardware Break-Before-Make (BBM) level 3, use it
> to replace stage-2 PTEs directly. Otherwise, fall back to the software
> BBM sequence.
> 
> For BBML3 the sequence is:
> 1) Get a reference count on the containing table for the new PTE.
> 2) Atomically update the PTE with the new valid descriptor.
> 3) Invalidate the TLB for the old PTE.
> 4) Drop the reference count holding the old PTE.
> 
> Add 2 helpers:
> 1) kvm_pgtable_use_bbml3(): Checks for the architecture requirement
>    for BBML3.
> 
> 2) stage2_use_bbml3(): Extra checks added by SW design (FWB and DIC)
>    - As BBML3 will update the PTE atomically, it can only know it
>      raced with another core at the point of the cmpxchg failing,
>      unlike the SW implementation which locks the PTE first.
>      And as we must issue CMOs to the new mapped page before the
>      update, that means with BBML3 racing cores will issue redundant
>      CMOs.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/pgtable.c | 111 ++++++++++++++++++++++++++++-------
>  1 file changed, 90 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index d670da8882a5..a9ba761e9a01 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -82,6 +82,27 @@ static bool kvm_pte_table(kvm_pte_t pte, s8 level)
>  	return FIELD_GET(KVM_PTE_TYPE, pte) == KVM_PTE_TYPE_TABLE;
>  }
>  
> +/*
> + * Check if BBML3 can be used for this PTE update.
> + * Fallback to software break-before-make for leaf-to-leaf changes.
> + */
> +static bool kvm_pgtable_use_bbml3(const struct kvm_pgtable_visit_ctx *ctx,
> +				  kvm_pte_t new)
> +{
> +	if (!system_supports_bbml3())
> +		return false;
> +
> +	if (!kvm_pte_valid(ctx->old) || !kvm_pte_valid(new))
> +		return false;
> +
> +	/* Block <-> Table is ok. */
> +	if (kvm_pte_table(new, ctx->level) ||
> +	    kvm_pte_table(ctx->old, ctx->level))
> +		return true;
> +
> +	return false;
> +}
> +
>  static kvm_pte_t *kvm_pte_follow(kvm_pte_t pte, struct kvm_pgtable_mm_ops *mm_ops)
>  {
>  	return mm_ops->phys_to_virt(kvm_pte_to_phys(pte));
> @@ -835,25 +856,46 @@ static void stage2_clean_old_pte(const struct kvm_pgtable_visit_ctx *ctx,
>  		mm_ops->put_page(ctx->ptep);
>  }
>  
> +/*
> + * Don't use bbml3 for stage-2 if FWB or DIC are not supported
> + * as that means racing cores will issue duplicate CMOs.
> + */
> +static bool stage2_use_bbml3(const struct kvm_pgtable_visit_ctx *ctx,
> +			     kvm_pte_t new)
> +{
> +	if (!cpus_have_final_cap(ARM64_HAS_STAGE2_FWB) ||
> +	    !cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
> +		return false;
> +
> +	return kvm_pgtable_use_bbml3(ctx, new);
> +}
> +
>  /**
>   * stage2_try_break_pte() - Invalidates a pte according to the
>   *			    'break-before-make' requirements of the
> - *			    architecture.
> + *			    architecture, if BBML3 is supported it
> + *			    will be used and this function won't
> + *			    break the PTE.
>   *
>   * @ctx: context of the visited pte.
>   * @mmu: stage-2 mmu
> + * @new: New pte installed in make.
>   *
> - * Returns: true if the pte was successfully broken.
> + * Returns: true if the pte was successfully broken or BBML3 is used.
>   *
>   * If the removed pte was valid, performs the necessary serialization and TLB
>   * invalidation for the old value. For counted ptes, drops the reference count
>   * on the containing table page.
>   */
>  static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
> -				 struct kvm_s2_mmu *mmu)
> +				 struct kvm_s2_mmu *mmu, kvm_pte_t new)
>  {
>  	kvm_pte_t locked_pte;
>  
> +	/* All handled in stage2_make_pte() */
> +	if (stage2_use_bbml3(ctx, new))
> +		return true;
> +

Wouldn't it be easier to keep try_break_pte/make_pte to the !bbml3 case and to
just create a make_pte_bbml3() variant to be called when stage2_use_bbml3()?

  if (!stage2_use_bbml3()) {
      if (stage2_try_break_pte())
          return -EAGAIN;
      stage2_make_pte();
  } else {
      if (stage2_make_pte_bbml3())
          return -EAGAIN;
  }

I believe also, the error path would look less weird as we catch an error in
make_pte() but without reverting the break_pte() (even if it is correct right
now).

And perhaps you could introduce a function that does both break/make
(stage2_update_pte()?) called by both stage2_split_walker() and
stage2_map_walk_leaf(). This would avoid repeating the error path.

Otherwise, everything looks functional to me.

-- 
Vincent


>  	if (stage2_pte_is_locked(ctx->old)) {
>  		/*
>  		 * Should never occur if this walker has exclusive access to the
> @@ -873,16 +915,37 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
>  	return true;
>  }
>  
> -static void stage2_make_pte(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t new)
> +static bool stage2_make_pte(const struct kvm_pgtable_visit_ctx *ctx, struct kvm_s2_mmu *mmu,
> +			    kvm_pte_t new)
>  {
>  	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
>  
> -	WARN_ON(!stage2_pte_is_locked(*ctx->ptep));
> -
>  	if (stage2_pte_is_counted(new))
>  		mm_ops->get_page(ctx->ptep);
>  
> +	if (stage2_use_bbml3(ctx, new)) {
> +		if (!kvm_pgtable_walk_shared(ctx)) {
> +			/*
> +			 * stage2_try_set_pte() uses WRITE_ONCE for non-shared walks,
> +			 * lacking release semantics used in the software BBM case.
> +			 */
> +			smp_wmb();
> +		}
> +
> +		if (!stage2_try_set_pte(ctx, new)) {
> +			/* Raced with another core. */
> +			if (stage2_pte_is_counted(new))
> +				mm_ops->put_page(ctx->ptep);
> +			return false;
> +		}
> +
> +		stage2_clean_old_pte(ctx, mmu);
> +		return true;
> +	}
> +
> +	WARN_ON(!stage2_pte_is_locked(*ctx->ptep));
>  	smp_store_release(ctx->ptep, new);
> +	return true;
>  }
>  
>  static bool stage2_unmap_defer_tlb_flush(struct kvm_pgtable *pgt)
> @@ -1001,7 +1064,7 @@ static int stage2_map_walker_try_leaf(const struct kvm_pgtable_visit_ctx *ctx,
>  		return 0;
>  	}
>  
> -	if (!stage2_try_break_pte(ctx, data->mmu))
> +	if (!stage2_try_break_pte(ctx, data->mmu, new))
>  		return -EAGAIN;
>  
>  	/* Perform CMOs before installation of the guest stage-2 PTE */
> @@ -1014,7 +1077,8 @@ static int stage2_map_walker_try_leaf(const struct kvm_pgtable_visit_ctx *ctx,
>  	    stage2_pte_executable(new))
>  		mm_ops->icache_inval_pou(kvm_pte_follow(new, mm_ops), granule);
>  
> -	stage2_make_pte(ctx, new);
> +	if (!stage2_make_pte(ctx, data->mmu, new))
> +		return -EAGAIN;
>  
>  	return 0;
>  }
> @@ -1057,19 +1121,21 @@ static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
>  	childp = mm_ops->zalloc_page(data->memcache);
>  	if (!childp)
>  		return -ENOMEM;
> -
> -	if (!stage2_try_break_pte(ctx, data->mmu)) {
> -		mm_ops->put_page(childp);
> -		return -EAGAIN;
> -	}
> -
>  	/*
>  	 * If we've run into an existing block mapping then replace it with
>  	 * a table. Accesses beyond 'end' that fall within the new table
>  	 * will be mapped lazily.
>  	 */
>  	new = kvm_init_table_pte(childp, mm_ops);
> -	stage2_make_pte(ctx, new);
> +	if (!stage2_try_break_pte(ctx, data->mmu, new)) {
> +		mm_ops->put_page(childp);
> +		return -EAGAIN;
> +	}
> +
> +	if (!stage2_make_pte(ctx, data->mmu, new)) {
> +		mm_ops->put_page(childp);
> +		return -EAGAIN;
> +	}
>  
>  	return 0;
>  }
> @@ -1549,18 +1615,21 @@ static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
>  	if (IS_ERR(childp))
>  		return PTR_ERR(childp);
>  
> -	if (!stage2_try_break_pte(ctx, mmu)) {
> -		kvm_pgtable_stage2_free_unlinked(mm_ops, childp, level);
> -		return -EAGAIN;
> -	}
> -
>  	/*
>  	 * Note, the contents of the page table are guaranteed to be made
>  	 * visible before the new PTE is assigned because stage2_make_pte()
>  	 * writes the PTE using smp_store_release().
>  	 */
>  	new = kvm_init_table_pte(childp, mm_ops);
> -	stage2_make_pte(ctx, new);
> +	if (!stage2_try_break_pte(ctx, mmu, new)) {
> +		kvm_pgtable_stage2_free_unlinked(mm_ops, childp, level);
> +		return -EAGAIN;
> +	}
> +
> +	if (!stage2_make_pte(ctx, mmu, new)) {
> +		kvm_pgtable_stage2_free_unlinked(mm_ops, childp, level);
> +		return -EAGAIN;
> +	}
>  	return 0;
>  }
>  
> -- 
> 2.55.0.979.g7e5102b832-goog
> 

