Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E702CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaCe+0vBux/acxxxbAjd0sdUOKLj5KDIayotecJQPco=; b=H9ci5qzqVNMKI/T4GyQSGeDh+V
	V1QNg+OQmVIfEAwDUzT7mACo/OHP6hZtsEUev7XS8xqaw0IGodJ+twotMR0yWbNPVy2z1EpVfXV81
	XXSZj3m2k6z558fshUW0fAq8l8+OLssSi0fu23cpG+Dpj+NubNdECvg1x6hVX8Y9Y4a6nxEyCGCcr
	gui11Ak3zDWQgTjgRN3W6XZTcrn/BE9b1PjJ/U8zEc0MdzYH0WbKeIzrJU9wLR7iRbseS1bqsZQTU
	2/Y33Q/YB71iW88MHBFPREzHZrLPe2Cmjetb3urqS5pzxfbgENYTSTZ7j6/Eo3vHHwMC8lH+qiCTa
	7aGY6esw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3Ks-00000007r04-0fVZ;
	Thu, 21 May 2026 13:21:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3Ko-00000007qxp-1l16
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:21:13 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4903cbfad68so3409285e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 06:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779369668; x=1779974468; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oaCe+0vBux/acxxxbAjd0sdUOKLj5KDIayotecJQPco=;
        b=Mvcx4IzttnfI6OI6Ql2CIW2oTayVY9X6mqwBZn6gzqZaZqmWDY6uEI10UWVf/uhv/v
         bJBt4/+q7NwKS4Emkd0O3E5TzvcRdGCMSNcYnwsSNNHEsdcP0WTDfJoPdcU2iIQX5upH
         L1H9H0XeBeqv+m8lNU5nc9DlkA/dFPriWZG0Pxy+bw0BxaP4MWDi2nmmihULIHg1uHl/
         xJm0DuLsGhfBfAlc3u0oGLw4hnRASV9Ok9mVvVcC2XkJi0O4OD7AI+JqpNcWjgzhP6SE
         kRePWW1PEBOXGADt9zFR87aS9vgt7o1NN7H6MxGUXP2PHJ+QUSoqrsx3fwnv9flO7887
         Q5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369668; x=1779974468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaCe+0vBux/acxxxbAjd0sdUOKLj5KDIayotecJQPco=;
        b=GgWdmFmbbmX2kdskcERanmcYZi0AYGaQbJcH+mfPFQ3WiKRK5wARWxeszb/r3FHOuY
         J7bWybq9V4oZPFXLoTexkhOxwncJslTuzVqwOB3EtS1+3R3x9MtIcMS5htQ+4zQ4qdEz
         5BzTK8NzkOH4M8rzvAzOj/TF/RXv6OPsG6yhA6qHe1wPVhUeSPJI8p+y8UBlONZnCOgw
         HRaJcEXQ4JwCYdXrOCOBvn6kroKLooq5ODumsFf9swoFwdEH/cdHr4FaCshuyWQKEzgL
         qcWKj3zvnSoP2JfAzCEJhVLsEAca+SlP9Y9lIeTtBtDBrZyZxALPPdE2hDMv9t6xXoBc
         qMtw==
X-Forwarded-Encrypted: i=1; AFNElJ/v5CVB9757P8oZ2D6Hmoq8JeZOiLsnOsG4KN0lpyn4IDkB2/tuzM5luutSrHkAP5z9i48CfYfbOxVFnKlrFMR+@lists.infradead.org
X-Gm-Message-State: AOJu0YzB2uhMj+XZZgVwzdP/zsLNOMofxfNzMvxla2dBMx1blzUKRQhN
	VgPBzx2xZduahZAuim7eRadLfQ/EfbsuONFTQhooPnNEIJJLHc6FPI2R0UvBemWOhg==
X-Gm-Gg: Acq92OGFV5hQ8jAtm7Lco4fiv9gBn3kg1jyGwHNsD2DrodhbGaEyxKEIGFSkftbu9mK
	5FLCsuPC7waCbk+mXfTnLcUbs96vwBIVWxbr9YgvylWAcVxMVMAL0LIXT/sMZjaw+UYwOuptA4m
	+rwJByyGmK//q3Wcza1lWdLOUloBlnRKLJ0OMBJpT7Ory7uQcM1+UzqitZFreyXv1+IJ7rTZrBu
	0vyQTDxIjHS5mKFuBKoAApUNUeoCKnzmEmccxkwLphfXaL6Iw8ntJXQ0ObRu9u32T6S/iqyemH1
	JeEx87oRjJEhEAVDoVZxE2oDhyKmFep5rB10bh7/aRixFRnR+elQ9Xk5PcpqEWjPwq6jReenW3p
	5DjUls/AsttPqFerJCF5ZQ4n8UdzUiNr3i4mV3pzTncCz5iiRjmLckn1KTw3cFMer6L4LEh4Cbu
	ETa5apb/TLXNB8ZTiRlC/EzdNzawEgIEp5KGIkR/5EgrjXuQG50JOqg9stkQBOfFCcxnTOieMo3
	2brJw==
X-Received: by 2002:a05:600c:1f87:b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-4903cf08f14mr15940795e9.13.1779369667306;
        Thu, 21 May 2026 06:21:07 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c64beasm24039235e9.1.2026.05.21.06.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:21:06 -0700 (PDT)
Date: Thu, 21 May 2026 14:21:02 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kernel-team@android.com, qperret@google.com,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 1/3] KVM: arm64: Reset page order in pKVM hyp_pool_init
Message-ID: <ag8GvtAonB6LNB5m@google.com>
References: <20260521102149.804874-1-vdonnefort@google.com>
 <20260521102149.804874-2-vdonnefort@google.com>
 <CA+EHjTxPoxjvMTZX5w+UyVgC=W3VUSDoOQ-tCDLfnae16SqoMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxPoxjvMTZX5w+UyVgC=W3VUSDoOQ-tCDLfnae16SqoMQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_062110_482697_795B071B 
X-CRM114-Status: GOOD (  30.42  )
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

On Thu, May 21, 2026 at 02:07:36PM +0100, Fuad Tabba wrote:
> On Thu, 21 May 2026 at 11:22, Vincent Donnefort <vdonnefort@google.com> wrote:
> >
> > When a VM fails to initialise after its stage-2 hyp_pool has been
> > initialised, that stage-2 must be torn down entirely. This requires
> > resetting both the refcount and the order of its pages back to 0.
> >
> > Currently, reclaim_pgtable_pages() implicitly resets the page order by
> > allocating the entire pool with order-0 granularity. However, in the VM
> > initialisation error path, the addresses of the donated memory (the PGD)
> > are already known, making it unnecessary to iterate over all pages in
> > the pool.
> >
> > Since the vmemmap page order is a hyp_pool-specific field, leaving a
> > non-zero order on hyp_pool destruction is harmless until another pool
> > attempts to admit the page. Instead of resetting this field during
> > destruction, reset it during pool initialization in hyp_pool_init().
> > Note that pages added to the pool outside of the initial pool range
> > (e.g., via guest_s2_zalloc_page()) must still have their order managed
> > manually.
> >
> > While at it, add a WARN_ON() in the hyp_pool attach path to catch
> > unexpected page orders that exceed the pool's max_order.
> >
> > Fixes: 256b4668cd89 ("KVM: arm64: Introduce separate hypercalls for pKVM VM reservation and initialization")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 25f04629014e..89eb20d4fee4 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -322,7 +322,6 @@ void reclaim_pgtable_pages(struct pkvm_hyp_vm *vm, struct kvm_hyp_memcache *mc)
> >         while (addr) {
> >                 page = hyp_virt_to_page(addr);
> >                 page->refcount = 0;
> > -               page->order = 0;
> >                 push_hyp_memcache(mc, addr, hyp_virt_to_phys);
> >                 WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(addr), 1));
> >                 addr = hyp_alloc_pages(&vm->pool, 0);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> > index a1eb27a1a747..c3b3dc5a8ea7 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> > @@ -97,6 +97,8 @@ static void __hyp_attach_page(struct hyp_pool *pool,
> >         u8 order = p->order;
> >         struct hyp_page *buddy;
> >
> > +       WARN_ON(p->order > pool->max_order);
> > +
> 
> Could you add a brief comment? It took me a minute to figure out what this
> catches. IIUC it's not attach's own input, it's a stale p->order from way back
> when an external page was popped from a memcache (today only via
> guest_s2_zalloc_page()). Right?

I think it'd be self explanatory if that was next the page_add_to_list, but that
wouldn't protect the memset (that's really best-effort though).

How about?

/* 
 * A page with an order bigger than the pool's max is an 'external' page
 * whose order hasn't been reset before being added to the pool.
 */

But now I am thinking I can do way better: we can easily identify external
pages, so I could just force the order to 0 in that case.

WDYS?

> 
> With that.
> 
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> 
> Cheers,
> /fuad
> 
> 
> 
> 
> >         memset(hyp_page_to_virt(p), 0, PAGE_SIZE << p->order);
> >
> >         /* Skip coalescing for 'external' pages being freed into the pool. */
> > @@ -237,8 +239,10 @@ int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
> >
> >         /* Init the vmemmap portion */
> >         p = hyp_phys_to_page(phys);
> > -       for (i = 0; i < nr_pages; i++)
> > +       for (i = 0; i < nr_pages; i++) {
> >                 hyp_set_page_refcounted(&p[i]);
> > +               p[i].order = 0;
> > +       }
> >
> >         /* Attach the unused pages to the buddy tree */
> >         for (i = reserved_pages; i < nr_pages; i++)
> > --
> > 2.54.0.746.g67dd491aae-goog
> >

