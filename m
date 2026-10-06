Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F632CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNhJI/vsDPATwVHCwRxldmCYKg+ihLyBJJx7xKlf2yc=; b=y4VQzh5bXyH6lZ8j+kqoxRWczg
	Fw8wFbPeknqU9QV8LUWRmHgju1Fc7amDI6eQolaSsxOsxtbX/riaqhtdMbYMJINZwlWo2aWKzXXC8
	2IRf2aeOPO/jcMa/3WorRkp3Zcpow9ZQ0upuVVnty2DCju+d8WQi92w/ggppcb3P5xLoFGKux1c0O
	Dg9i8dnZ3OKAt7QSL2mSM4dUPXm3lfJ/HPNaDrz3+N2vJ9qBkB4LPphXJ0+eT7p6lEsBJKeKmUix8
	fpm2ARg9OEsV+dELUJI8vVDnBs/WYfYSxrUST8UDA654ESIT0/7ciIMZFfmHtoTQGWFjoSVV5F5DK
	iNYm99/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2hY-00000000YWA-0LkZ;
	Tue, 06 Oct 2026 10:47:16 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2hU-00000000YTq-45wv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:47:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a021c28046so33965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791283630; x=1791888430; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oNhJI/vsDPATwVHCwRxldmCYKg+ihLyBJJx7xKlf2yc=;
        b=abSBGWvtyiHbUXTWNSQOUQ8Kk6tHbrf8xxxhF6IZgICjZE2m5esOZdg/QVVCQrrk9p
         5O7Dhbg/2NN/+mL6miB677PwSMXoeh6p/9JhEC68oGA5AGt5cdGGhu9khwFfVXHcgNOK
         FLGk47vMCvd2Jv86llAXQcU9hMonQKFaESZnIc/xark+zKMUBAkOLi7xaQJMkB7HBXTQ
         Se5cHYw/X7dLIX9o+jlpI2uGhqQWmki2jzgpsQWH9B6bfR9Zu11343UUzy7BhPwyuIrp
         DlZlGozwd7iXjGxy/bOogoJM7ByuAgyTtGmhncS2raqf/g47B1eoUGXEymhfRZ/Y5Z/e
         6NRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283630; x=1791888430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNhJI/vsDPATwVHCwRxldmCYKg+ihLyBJJx7xKlf2yc=;
        b=Vsn00z3QcmwgK1kdxa4+r5HSv2FmjK3OiRZAyct992llQVqVRRlnDs3gaVrUVOqsZM
         R0jR56b5TnB/CAR1ydgwhtF2OiDgMwd7h9jYff/Gcb2D4pTOQhHVe15f/v2X2mta11Li
         cA20ov6+37x6jZ41sAvCqLXsuc/nXKqqysIQaUC+TgEbZrO3Rd3ZQA7p0udHJOQ6abzj
         wjDxMeTYONBL0BdAe6mU+u/s5PLJahP4zN/6UDDPpPORJS5TLBnrGIVhvLQ30ZgmSTpT
         +g7fjT4T2wQxMl1f3MdLQK8Kq7A5fK8yidV0KLC8v0OGmh9lS/Y9M6HlxisIHsJ77Vfa
         bIvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxttr+s+sjwRwE1uNErvWQtCifkwr1amkviF1hQxR+CjAX9XfpQ4OJJWfETckAOw7eHTEqe8rtNC1NTOutTQN4s@lists.infradead.org
X-Gm-Message-State: AFuF++l7AF4NM8199jJuD1zjPhi/gPqczp4KN4c3cZJgB2ThRnXpd5WN
	ZdNlGMWVaySzzkJSXemNDO1uTSR7kk3dbqNp+Ak/VFUY3ZjS1Hh3T4hCJMUqHqDVTw==
X-Gm-Gg: AYBFou1kO2vIhNuudTY7RgWn0pmxn7a1GK1PBNl1bcVbwU4M47a248lRWMEHhspKNNr
	PzdvtU41gi2BYp5Gq6TdRUHqoIuuz1J4QOuA80Frf+CrdU6BNYeaBSwOUCo8vnx5bIGxwdDZtjw
	+gKuo6cGP5GxzHfmnT0qq83nQqOethvLD/FpT6w+ztGEaK2ZuEBM8tFJWDgEfTXwC9JFqQeIuEV
	ZdqKLTGcRta44QpK4eJGRbddW7RkVu0zP/6JMxEmMbtqkWVf1U13VFiEOkQMOrjiOHcJ7paFfqr
	TgdWEaE0oMDwvp/LBZyL8Hye+SJ0shCUARnvN1spSygNLztye2Onyfj9PyX3qLZoVTq41ZZpl1i
	HNzUqP2AxO5Hl7oao9l9oZiTFIv5F5RFioYaO/Wa2rzUnFnyndCaMyaEPJvGzMBgWYxf+Fidsl4
	XxY9DsI43QFY8ccNyW1aAIluzg+2RYrj1U7RWnM6rTXSsMPU+L4CnYn6O5IiKmeFFfPzO134Cp7
	YVB4hwqJBYGe5o6PY3M859kVpUqG7q7ekSPtto4
X-Received: by 2002:a05:600c:6290:b0:4a1:7af1:5386 with SMTP id 5b1f17b1804b1-4a17b4587a5mr465225e9.1.1791283629775;
        Tue, 06 Oct 2026 03:47:09 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c69afe66bsm3896689f8f.30.2026.10.06.03.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:47:08 -0700 (PDT)
Date: Tue, 6 Oct 2026 10:47:04 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oupton@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, tabba@google.com,
	sebastianene@google.com, keirf@google.com, qperret@google.com,
	linu.cherian@arm.com
Subject: Re: [PATCH v3 2/2] KVM: arm64: Support BBM level 3
Message-ID: <asTRqPfsrnbBWVSF@google.com>
References: <20260904132855.638117-1-smostafa@google.com>
 <20260904132855.638117-3-smostafa@google.com>
 <asO77kvqqwCsJt8I@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asO77kvqqwCsJt8I@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_034713_069632_D75C1D39 
X-CRM114-Status: GOOD (  43.40  )
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

On Mon, Oct 05, 2026 at 04:02:06PM +0100, Vincent Donnefort wrote:
> On Fri, Sep 04, 2026 at 01:28:55PM +0000, Mostafa Saleh wrote:
> > If the system supports hardware Break-Before-Make (BBM) level 3, use it
> > to replace stage-2 PTEs directly. Otherwise, fall back to the software
> > BBM sequence.
> > 
> > For BBML3 the sequence is:
> > 1) Get a reference count on the containing table for the new PTE.
> > 2) Atomically update the PTE with the new valid descriptor.
> > 3) Invalidate the TLB for the old PTE.
> > 4) Drop the reference count holding the old PTE.
> > 
> > Add 2 helpers:
> > 1) kvm_pgtable_use_bbml3(): Checks for the architecture requirement
> >    for BBML3.
> > 
> > 2) stage2_use_bbml3(): Extra checks added by SW design (FWB and DIC)
> >    - As BBML3 will update the PTE atomically, it can only know it
> >      raced with another core at the point of the cmpxchg failing,
> >      unlike the SW implementation which locks the PTE first.
> >      And as we must issue CMOs to the new mapped page before the
> >      update, that means with BBML3 racing cores will issue redundant
> >      CMOs.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/pgtable.c | 111 ++++++++++++++++++++++++++++-------
> >  1 file changed, 90 insertions(+), 21 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index d670da8882a5..a9ba761e9a01 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > @@ -82,6 +82,27 @@ static bool kvm_pte_table(kvm_pte_t pte, s8 level)
> >  	return FIELD_GET(KVM_PTE_TYPE, pte) == KVM_PTE_TYPE_TABLE;
> >  }
> >  
> > +/*
> > + * Check if BBML3 can be used for this PTE update.
> > + * Fallback to software break-before-make for leaf-to-leaf changes.
> > + */
> > +static bool kvm_pgtable_use_bbml3(const struct kvm_pgtable_visit_ctx *ctx,
> > +				  kvm_pte_t new)
> > +{
> > +	if (!system_supports_bbml3())
> > +		return false;
> > +
> > +	if (!kvm_pte_valid(ctx->old) || !kvm_pte_valid(new))
> > +		return false;
> > +
> > +	/* Block <-> Table is ok. */
> > +	if (kvm_pte_table(new, ctx->level) ||
> > +	    kvm_pte_table(ctx->old, ctx->level))
> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> >  static kvm_pte_t *kvm_pte_follow(kvm_pte_t pte, struct kvm_pgtable_mm_ops *mm_ops)
> >  {
> >  	return mm_ops->phys_to_virt(kvm_pte_to_phys(pte));
> > @@ -835,25 +856,46 @@ static void stage2_clean_old_pte(const struct kvm_pgtable_visit_ctx *ctx,
> >  		mm_ops->put_page(ctx->ptep);
> >  }
> >  
> > +/*
> > + * Don't use bbml3 for stage-2 if FWB or DIC are not supported
> > + * as that means racing cores will issue duplicate CMOs.
> > + */
> > +static bool stage2_use_bbml3(const struct kvm_pgtable_visit_ctx *ctx,
> > +			     kvm_pte_t new)
> > +{
> > +	if (!cpus_have_final_cap(ARM64_HAS_STAGE2_FWB) ||
> > +	    !cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
> > +		return false;
> > +
> > +	return kvm_pgtable_use_bbml3(ctx, new);
> > +}
> > +
> >  /**
> >   * stage2_try_break_pte() - Invalidates a pte according to the
> >   *			    'break-before-make' requirements of the
> > - *			    architecture.
> > + *			    architecture, if BBML3 is supported it
> > + *			    will be used and this function won't
> > + *			    break the PTE.
> >   *
> >   * @ctx: context of the visited pte.
> >   * @mmu: stage-2 mmu
> > + * @new: New pte installed in make.
> >   *
> > - * Returns: true if the pte was successfully broken.
> > + * Returns: true if the pte was successfully broken or BBML3 is used.
> >   *
> >   * If the removed pte was valid, performs the necessary serialization and TLB
> >   * invalidation for the old value. For counted ptes, drops the reference count
> >   * on the containing table page.
> >   */
> >  static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
> > -				 struct kvm_s2_mmu *mmu)
> > +				 struct kvm_s2_mmu *mmu, kvm_pte_t new)
> >  {
> >  	kvm_pte_t locked_pte;
> >  
> > +	/* All handled in stage2_make_pte() */
> > +	if (stage2_use_bbml3(ctx, new))
> > +		return true;
> > +
> 
> Wouldn't it be easier to keep try_break_pte/make_pte to the !bbml3 case and to
> just create a make_pte_bbml3() variant to be called when stage2_use_bbml3()?
> 
>   if (!stage2_use_bbml3()) {
>       if (stage2_try_break_pte())
>           return -EAGAIN;
>       stage2_make_pte();
>   } else {
>       if (stage2_make_pte_bbml3())
>           return -EAGAIN;
>   }
> 
> I believe also, the error path would look less weird as we catch an error in
> make_pte() but without reverting the break_pte() (even if it is correct right
> now).
> 
> And perhaps you could introduce a function that does both break/make
> (stage2_update_pte()?) called by both stage2_split_walker() and
> stage2_map_walk_leaf(). This would avoid repeating the error path.

I though about that and was not sure about it at the beginning as
mentioned in the cover letter:
    Initially, I encapsulated the full logic of BBM in one function,
    which was not readable, due to different ordering and dealing with
    CMO, TLBI.

I think that can be better if we call the new helper for all sites
except for stage2_map_walker_try_leaf(). Although we would need to
open code the bbml3 check there now. I can try and see how it looks.

Thanks,
Mostafa

> 
> Otherwise, everything looks functional to me.
> 
> -- 
> Vincent
> 

