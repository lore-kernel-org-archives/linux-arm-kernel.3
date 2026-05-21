Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CE9CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+Tg5A2q1rSTmypZ4m7QNpGOwZSgbWFsRlyJMtjn0p0=; b=gTinmMG/y1vnL69MHLEzpxN5Dc
	6jCZHsfcFXk8a67FbPO/6qjQ72jTIuVvKoye3h0dZ+eN+Hxjnq5Lr3axKf3nd/deJ+UO7utgF46Wu
	lpyNWS2h/tbUDFxel7AJjb8LrC3Uq2EvgbFdhYycbUzIHOmgNURQ/SgKs/XMY6sK2uFqUQBJ1tGxm
	toZSrtse5E/LCfAQGh+fPXfrnKjxJs08IbDob/qAEoQGzmX30fl6Ci0yoMHs0l1G8/bp+/2i+3Z/z
	1uhKPZuXNWrdofKsUHGcfXBDVkq3mjoJUeMb/zxEB6cyWkKJfYOCEAiWPTPGpjkmStNvwGl3vxbk7
	kgkcxAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3Ur-00000007tyI-1dzc;
	Thu, 21 May 2026 13:31:33 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3Up-00000007twx-09So
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:31:32 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-515548f390fso1591cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 06:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779370290; cv=none;
        d=google.com; s=arc-20240605;
        b=EFgv93cL7LeQ3AdXN09faPKsz2o3NyFRdTDKfLd96Viw3yhnDOuZloC25QmOxD3lwV
         yjfjiE52yx9Jmtc2E0wECNT2gCPzMpT72BH0eAfSFME0As8F63Nmf7PTuUjtuneOwK5a
         QeD1nHzOLKMtesHNxSkx3G00UC99JSbPQRcLPTZyibTYVgcWzR037pQB2OnqN/DUMoaK
         8FCXr1Sn8rIlXoLfI6C6+Sl0a+GJvyBZF/az9x2bmmBs5YATQPQQbUhAjVIlh/Y4Ze6W
         W4Ndq/5w7DCbNc57ZFX/AnuX9AD2n79aX0+cWaq9RzC6xKU5LzoZrPr/sKd+xjh8Dkdm
         SD2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5+Tg5A2q1rSTmypZ4m7QNpGOwZSgbWFsRlyJMtjn0p0=;
        fh=RCHMTwwmjOu6IU7qe4mP+y06sRK0dnPXYVVo7k7Qxbc=;
        b=WJC4cB2oSciIKlUuHGE1Ze2D2kta4JvS5TXWSxP4GfA4vPNU5VTePb+ZFMQ1Qh9W7C
         DmmnRVtGleZWko/QRiKt1s3fm5+gXJmWdsNRKpwLJFJHXsPN3xKl/zM/Y8vZwOX9sJUN
         TTQJwzpwrcTubzrXqvqlacIe5BICq198M7z0+Aeqf1V2uwiUjzcF7u6NtqGT6EOVikFv
         vUvCaaBy7gM1U5opbAzJbcnRGQuzrpvZZe4sDFxfjQ+StQ0xo6SbLthkNkpvLs9KsIuL
         4nNze8q4vp096s4t8DVAhbVQuw4NzrwU538gCf0sjh1TkObvdXppR7KK5vwkTqyvPWt+
         aj7w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779370290; x=1779975090; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5+Tg5A2q1rSTmypZ4m7QNpGOwZSgbWFsRlyJMtjn0p0=;
        b=YsuTopDlDQiWAd8H0LIo02tEh1KDN+IiLYq7WlfxadMcRgyDbISTU3ts9e8NW++i+Q
         V0rW5u1fNRxolbs+ORopA3cNXhu8a0qWM4NEv8mlJwTHIotmPsu2usCSLIwkvOXzyXLK
         Tk+zoCKxQ9eadGDQ8gOTATzjoB3+4X7MgDUzhnYbkJn67NpljBt7GrHP9dggXcp7tjIl
         Svao48WctjIcp/77kr4QPMiUkr8VgV3X16LabXBv+t7TUwjdOUS76iurC4XCj3khl0iB
         18NGX9D/MDi7Z0R/tegXqHXGds5KEm+qsdc0qCkCCXurkT3Hh6qbtvYCLbQPjIiPzLEn
         p5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779370290; x=1779975090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+Tg5A2q1rSTmypZ4m7QNpGOwZSgbWFsRlyJMtjn0p0=;
        b=KOCie4pLQ+7jzXUh0nCrAedctk/XNhE9VzI3zqJe+HVS+agpKmbyQZOmM786u8/A2O
         foHDjeYjSEWDk24zjSSM7EPI3pmRxeAP4AwWszo82DbUnBSkwhnGBxU7mUzohdnxPtN6
         LIjDEuPGg+apejnoh+vo/pjvFu/ZjRVb2sRulu+Xm8Jrx2lt9fH9ZSJ0d0Sem7+4SOMX
         /chz+U8woD3vuhJNhyqAPV6eg6RJlqy8Wbj7Z2ZcZoQTbrtwlH3y9jACEty8EwsAGlBr
         bJllqi3HZZAFfp/F6sY406hp9anhbUSrPGtYaGFPZAhnFmCT1FqeHU3QqXr5q4R2aBrm
         JQDA==
X-Forwarded-Encrypted: i=1; AFNElJ+Fv4oRtNVNoh1bls11MLYWNPM9640lDCiiXZIar+xnIuZjeY1j6hPybcPdMeSOLFxjKprEGRidMo2QtRn0lXOY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw67WVG89a7ALUowecq35ApbSDDgxxUGanu+Cc/Ri7GwJVoNRht
	iowmymbKPTsK8g6aSW9hlL+mbt4A7NdIGfjWifqFqpQnfbQLpi6usdhZcsBkj9+Xmb/3uRdw2EZ
	OyKPOdgldedxz0HIYepUjtryD6hm96V7PDXREc/aG
X-Gm-Gg: Acq92OFhtB+I9lMGIJElZlGnEx2gKiv84OsiAKYV/7maANpu+czmg2vNnPvIK5v6wbj
	FqlKnntc6a9I8uye8L42nX/ZZ8vYKGz7ChPFbFBRA2fdkv5BloKI475qD9qC+3O2KmKVgF0DyQc
	ao5/fQVMQIyCj5t0ZKLugRvxb3Ng+NZpsDXf2si3KehIVqztSynRqUKP6Ci+KMl+HH6xuIg23ri
	7Hr5O5qrP98MO8A01RquJ02mUHp2DhRll0H3Pahqk0FlLi/CuT19yMDpugLqxl5FsCLKXTd6WlM
	vI1qXAMrPHUCCmWDcss=
X-Received: by 2002:ac8:5945:0:b0:514:b17e:86f3 with SMTP id
 d75a77b69052e-516c545d419mr9811621cf.12.1779370288694; Thu, 21 May 2026
 06:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260521102149.804874-1-vdonnefort@google.com>
 <20260521102149.804874-2-vdonnefort@google.com> <CA+EHjTxPoxjvMTZX5w+UyVgC=W3VUSDoOQ-tCDLfnae16SqoMQ@mail.gmail.com>
 <ag8GvtAonB6LNB5m@google.com>
In-Reply-To: <ag8GvtAonB6LNB5m@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 14:30:51 +0100
X-Gm-Features: AVHnY4KrdKGWYydx9yhZf1wn2cakxt9es8y5lQpSEP6pVl9oimBEtzwNxOuc5kg
Message-ID: <CA+EHjTyrfKLZ1o1szYz3UUA2oq+GZOAeA7ta3ohxKeBDMS9y_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] KVM: arm64: Reset page order in pKVM hyp_pool_init
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_063131_097047_455F3584 
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

On Thu, 21 May 2026 at 14:21, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Thu, May 21, 2026 at 02:07:36PM +0100, Fuad Tabba wrote:
> > On Thu, 21 May 2026 at 11:22, Vincent Donnefort <vdonnefort@google.com> wrote:
> > >
> > > When a VM fails to initialise after its stage-2 hyp_pool has been
> > > initialised, that stage-2 must be torn down entirely. This requires
> > > resetting both the refcount and the order of its pages back to 0.
> > >
> > > Currently, reclaim_pgtable_pages() implicitly resets the page order by
> > > allocating the entire pool with order-0 granularity. However, in the VM
> > > initialisation error path, the addresses of the donated memory (the PGD)
> > > are already known, making it unnecessary to iterate over all pages in
> > > the pool.
> > >
> > > Since the vmemmap page order is a hyp_pool-specific field, leaving a
> > > non-zero order on hyp_pool destruction is harmless until another pool
> > > attempts to admit the page. Instead of resetting this field during
> > > destruction, reset it during pool initialization in hyp_pool_init().
> > > Note that pages added to the pool outside of the initial pool range
> > > (e.g., via guest_s2_zalloc_page()) must still have their order managed
> > > manually.
> > >
> > > While at it, add a WARN_ON() in the hyp_pool attach path to catch
> > > unexpected page orders that exceed the pool's max_order.
> > >
> > > Fixes: 256b4668cd89 ("KVM: arm64: Introduce separate hypercalls for pKVM VM reservation and initialization")
> > > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > >
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > index 25f04629014e..89eb20d4fee4 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > @@ -322,7 +322,6 @@ void reclaim_pgtable_pages(struct pkvm_hyp_vm *vm, struct kvm_hyp_memcache *mc)
> > >         while (addr) {
> > >                 page = hyp_virt_to_page(addr);
> > >                 page->refcount = 0;
> > > -               page->order = 0;
> > >                 push_hyp_memcache(mc, addr, hyp_virt_to_phys);
> > >                 WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(addr), 1));
> > >                 addr = hyp_alloc_pages(&vm->pool, 0);
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> > > index a1eb27a1a747..c3b3dc5a8ea7 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> > > @@ -97,6 +97,8 @@ static void __hyp_attach_page(struct hyp_pool *pool,
> > >         u8 order = p->order;
> > >         struct hyp_page *buddy;
> > >
> > > +       WARN_ON(p->order > pool->max_order);
> > > +
> >
> > Could you add a brief comment? It took me a minute to figure out what this
> > catches. IIUC it's not attach's own input, it's a stale p->order from way back
> > when an external page was popped from a memcache (today only via
> > guest_s2_zalloc_page()). Right?
>
> I think it'd be self explanatory if that was next the page_add_to_list, but that
> wouldn't protect the memset (that's really best-effort though).
>
> How about?
>
> /*
>  * A page with an order bigger than the pool's max is an 'external' page
>  * whose order hasn't been reset before being added to the pool.
>  */
>
> But now I am thinking I can do way better: we can easily identify external
> pages, so I could just force the order to 0 in that case.
>
> WDYS?

Yeah, Sounds better. The WARN's scope was actually narrower than the
real risk. Forcing order = 0 on entry covers all of that and removes
the implicit caller obligation the WARN was best-effort enforcing.

The memset is trivially safe then too (PAGE_SIZE << 0, regardless of
what was in the vmemmap).

Cheers,
/fuad

>
> >
> > With that.
> >
> > Reviewed-by: Fuad Tabba <tabba@google.com>
> > Tested-by: Fuad Tabba <tabba@google.com>
> >
> > Cheers,
> > /fuad
> >
> >
> >
> >
> > >         memset(hyp_page_to_virt(p), 0, PAGE_SIZE << p->order);
> > >
> > >         /* Skip coalescing for 'external' pages being freed into the pool. */
> > > @@ -237,8 +239,10 @@ int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
> > >
> > >         /* Init the vmemmap portion */
> > >         p = hyp_phys_to_page(phys);
> > > -       for (i = 0; i < nr_pages; i++)
> > > +       for (i = 0; i < nr_pages; i++) {
> > >                 hyp_set_page_refcounted(&p[i]);
> > > +               p[i].order = 0;
> > > +       }
> > >
> > >         /* Attach the unused pages to the buddy tree */
> > >         for (i = reserved_pages; i < nr_pages; i++)
> > > --
> > > 2.54.0.746.g67dd491aae-goog
> > >

