Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4548C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQbHVyvOfJT59Z1tjcStlzFu/GfhyqjlrHuEPmE7uTg=; b=K5duBEdBNdRTS/kwOuecqcu3+D
	jtDd0fyaXY6FXBBdtSA+9yrfR/V1ZgmSkVbEtDMc2QC+vxmSPO1SpXjtwkXhWe6XzO3UBZXd+gli9
	HcExEkkzvaDdRpg4cQeREqbBvn9vn4rOIph3ueJdsP5JwvBtAFb+EOjMrR2fq4eIlIbN0YKei0T9e
	pQUmBi1gydGPHQf0SdlWt1M1wb4i9TfyrzBgJShCHx0uJBu+gboJtQ2sa7UM92N2jalbIXj8ZoLx7
	ATioa6WVplQSxqLdNk9tPGQKF079opKUiK85nTnGT1bwjwtJ9dB2yun4IQDJX0ESFfNhXJgreHnU1
	L6r/31RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7Rh-0000000DgUa-0fNO;
	Fri, 25 Sep 2026 15:02:41 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7Rd-0000000DgSN-3C1t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 15:02:39 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso7505295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 08:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790348555; x=1790953355; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uQbHVyvOfJT59Z1tjcStlzFu/GfhyqjlrHuEPmE7uTg=;
        b=b2fNHSRA3cBhEIW5JOcETXcXdhc21J5fvSziZ3XZ5VvxDaV/Wwwf8KqJqin3yr0mD7
         We37pESNZv12Wcsyn8joi8sJ8hi6azyCjXCQ4OwWM6FPv1WC1iXUTqpkGSnm4bNFlUz1
         FhMnmtu2YpYsdwIttn4fSk/mUWPZnK3S7Wp1XNulkG09p3kakeuhdBsJh0Nn7W0PAUUT
         ZRDU05dvX6aperun7mj78tcCzoHqRYv0wDhbi08olCvrUoCv4IevySwa9FNJqTbRML1v
         qSWTLIpAXOqg0hjzpOAuXZEzIezRfFX6Rh/90F1hiS2Wdls/z7JDKnVGGzVefrQ9quem
         rxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790348555; x=1790953355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQbHVyvOfJT59Z1tjcStlzFu/GfhyqjlrHuEPmE7uTg=;
        b=DSNWeY6esdUrEkcT729TOzIo/POQcMO6APavMYbooSs7/ksg8aLlduXpKH9ySdusMa
         mU/ox3BnNimDynbUhbsREYSTQdPe0oXNNfj6M/z44HJU4YM8fDUKDWShCysTw6K15Vzj
         l9i2bgxgtuGgbgsEFgObIpaSa1OAbccljOX3fPZELsUAlucloSr9O00LWNr7jKWhX8ZZ
         8Fj6QfuZ1kpKlP7DlV3KSpSuHgzSjVKI/h32rJGpqAA1oOJxkUaqg1vMgcHmXYhuloiv
         VCgYKGn/MZ2leFTB/JsoC1PiwXiJiO5g66XeSjBL2YZ1xt+xb0i6TgW1LeIz7YMHrSN9
         5s/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMGG2EM8Kc7hJV9MNe4THbfbnutqVNozBh1/9LPje3WY4aLEdaAwzxDA/Z+uzB4f1ElWHc7RJ80RPpHH6G4tiy@lists.infradead.org
X-Gm-Message-State: AFuF++m588vSt+0D4GPu1/9QOgRHWz7iLp2lGDLc2e45uehx458ed2i9
	yLOe/P/8ZjVls9QMudARfoh3k3FaxEEvf2H4htVc1eiw9dXymSSotQWffQDubv4YYg==
X-Gm-Gg: AYBFou3IQD39lKa0gSbO3BlBCwrOhsQDedOrgJyJwXREGheF7YzqoyXBkFAB9M6dMAC
	u/Ev9FkyLkKpvP4Hp7qihL8LyoMkP5n1fnJDcztJrg3h5GwU5qhHwV6WoNV+/iir4oTaOm5oiD2
	GSwWaz9NCObxQDMGdQ1LBYgRYfr75NzQwQ2BWz2bZTFr1wUaRjx0VJsY69fucYk3ROSLt1VBr9J
	Ze4rtkC0DFXmlfd/j/dYMzTWPf6K3U5hJFZbdxdwYj7TJjFSENSvG0fuvIzBRBH9vR5vGr+jKJ5
	R2m0ZmqcmHgJ/hNcBlZjnlQTw44Suc0fL+4bCv7fZva48LH8++TpSqAvb/CHGrxyjLh8/53VtSc
	MhDFkhb7RcK0fVykq+lKx5ekYLUKwNVYpjr8J9bf3HJzHYlqNlALoW0dmx2ewgzL+kOeOkUzZYv
	R0RnAwQ1MJYIxVIcsa+8ItVNWVPgRDzW9Y8b0JyyEVNpkf492d2DpUvnfid9gMc4iYTqlgdfakk
	eVShdszZBeZoszx4lms3L7/qT23T4xTR1BJUHCPFjY=
X-Received: by 2002:a05:600c:4594:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-49fe6707f69mr117966225e9.32.1790348554298;
        Fri, 25 Sep 2026 08:02:34 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06bdef2sm66540075e9.11.2026.09.25.08.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:02:31 -0700 (PDT)
Date: Fri, 25 Sep 2026 16:02:27 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev, qperret@google.com, weilin.chang@arm.com,
	Keir Fraser <keirf@google.com>
Subject: Re: [PATCH v2 01/22] KVM: arm64: Prefault host stage-2 entries on
 block split
Message-ID: <araNAy968NbQkfer@google.com>
References: <20260911135053.146435-1-vdonnefort@google.com>
 <20260911135053.146435-2-vdonnefort@google.com>
 <arVgKRqRRon00wTD@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arVgKRqRRon00wTD@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_080237_858874_E84ADEF9 
X-CRM114-Status: GOOD (  34.16  )
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

On Thu, Sep 24, 2026 at 05:38:49PM +0000, Mostafa Saleh wrote:
> On Fri, Sep 11, 2026 at 02:50:32PM +0100, 'Vincent Donnefort' via kernel-team wrote:
> > From: Keir Fraser <keirf@google.com>
> > 
> > For the host stage-2 that is idmap, we can avoid lazy-mapping on block
> > splitting by propagating existing valid mappings to neighbouring entries
> > of the new table.
> > 
> > Signed-off-by: Keir Fraser <keirf@google.com>
> > Co-developed-by: Quentin Perret <qperret@google.com>
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > ---
> >  arch/arm64/kvm/hyp/pgtable.c | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index b74dd5ce1efd..34f78a58cded 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > @@ -1030,10 +1030,39 @@ static int stage2_map_walk_table_pre(const struct kvm_pgtable_visit_ctx *ctx,
> >  	return 0;
> >  }
> >  
> > +static void stage2_map_prefault_idmap(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t *ptep)
> > +{
> > +	kvm_pte_t block_pte = ctx->old;
> > +	u64 pa;
> > +	int i;
> > +
> > +	if (!kvm_pte_valid(block_pte))
> > +		return;
> > +
> > +	pa = ALIGN_DOWN(ctx->addr, kvm_granule_size(ctx->level));
> > +	for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep, pa += kvm_granule_size(ctx->level + 1)) {
> > +		kvm_pte_t pte = kvm_init_valid_leaf_pte(pa, block_pte, ctx->level + 1);
> > +
> > +		/*
> > +		 * Skip ptes in the range being modified by the caller if we're
> > +		 * installing last level entries. Otherwise, we need to
> > +		 * temporarily put in a valid mapping to make sure the
> > +		 * prefaulting logic is triggered on the next
> > +		 * stage2_map_walk_leaf(). This adds an unnecessary TLBI as
> > +		 * we'll presumably re-break the freshly installed block, but
> > +		 * that should happen very infrequently.
> > +		 */
> > +		if ((ctx->level < (KVM_PGTABLE_LAST_LEVEL - 1)) ||
> > +		    (pa < ctx->addr) || (pa >= ctx->end))
> > +			*ptep = pte;
> 
> Do we need now to call get_page() on the table as we are installing a
> new PTE?

Ouch, I really start mixing android branches with upstream... I thought this
wasn't an issue because the host stage-2 doesn't refcount valid PTE... but this
is only true on Android branches, not in the current upstream...

So yes, you are right (and so were Wei-Lin who reported it as well on v1), I
should move the if (counted) get_page() from PATCH2 into PATCH1.

> 
> Also, I think we need a WRITE_ONCE() for the PTE write.

This one though I am pretty sure it isn't needed because of the
smp_store_release() when replacing the PTE with a table.
> 
> Thanks,
> Mostafa
> 
> > +	}
> > +}
> > +
> >  static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
> >  				struct stage2_map_data *data)
> >  {
> >  	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
> > +	struct kvm_pgtable *pgt = data->mmu->pgt;
> >  	kvm_pte_t *childp, new;
> >  	int ret;
> >  
> > @@ -1051,6 +1080,9 @@ static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
> >  	if (!childp)
> >  		return -ENOMEM;
> >  
> > +	if (pgt->flags & KVM_PGTABLE_S2_IDMAP)
> > +		stage2_map_prefault_idmap(ctx, childp);
> > +
> >  	if (!stage2_try_break_pte(ctx, data->mmu)) {
> >  		mm_ops->put_page(childp);
> >  		return -EAGAIN;
> > -- 
> > 2.55.0.1007.g17ff1f9808-goog
> > 
> > To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> > 

-- 
Vincent

