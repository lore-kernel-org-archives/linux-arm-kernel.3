Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B2CCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioEzmXHuVthmvT1VW0zwCCGdbJiMgEB9gdSvDBe2i+A=; b=1ROMQ4yEJ7e7abQp+j9juJmgtk
	qPHdBl22g7CGn2dgyH509hdqDF98b+RlfrhTsGwpgtOOzIS2905+Ho/itJRQNIJm4pKsX6KUhj/dO
	WhR1bHvZ3dR37lsv94GsMwvd4UQczq4DvJ6QBGVSerYA6LlcjaVYqTjZRZbBHtuFYxfV63jXSf7kT
	dC3jl/5ar5xoD/LWKNORAvqibS9t6K0ZW5JdIAIF0mF7oOlPc48Z/B//K79gkg5Due3Ch/CkfkitK
	QYKpdijpelUVH/X9IMRlc088uYb1eLwFXtLYaoZLRkEv44nKggkmruv3S+xd7hPmV/d4YGi9dVCUD
	WDgXDhIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ38O-00000007om2-06Ii;
	Thu, 21 May 2026 13:08:20 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ38K-00000007ok8-087b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:08:17 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-515548f390fso18241cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 06:08:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779368895; cv=none;
        d=google.com; s=arc-20240605;
        b=LNRJE0ainh4pFcLNLuU02gmIF6Xg0uSVXHeKzQsdXgAzuPnaLefxZC4YWuC7VDdSz5
         w8Is3Pt5RO6W+OS4NvYdyBCF8kj5KETIvwvEOsBw8DmsKIYUpC2bbgpNHNpF9MG0SISY
         KfgilZ0alnJQNuy/aHuiWzT5GdEL+v5clSFVkujBfOb0wp6wnkUbRHirD/ESjSnXPqW2
         8tciD3C6xz6ldRt2zRhWIxn75aKExhm2Ars5jNaobbkTTT40EZQ6DWRPllaQcU7G4Vl9
         zIbWjuKepf3frkX9aoJU9WTx2UCiR62AjCC7t5pAUqoJeqr1/gNVq6ZPcZzZDDTyAcAi
         zigw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ioEzmXHuVthmvT1VW0zwCCGdbJiMgEB9gdSvDBe2i+A=;
        fh=avZMOROZuJbYvvO18rEMJuu92KO5K+DiR1LR81kivCw=;
        b=hAeHbrjD877fOky1Okh0Qh4Y75eLevI9sc6pl3fHopdcg48ODVPEgyxNNfI68WiVVE
         mCr0B1Ao22gNRRyeHXzZi9xaUYVKmWem6XD+DdP958V3mqMJFQtUpdlHAwql4kzR3UkT
         kmTu1yUnhcjNNlmLoCIl54+00a5Doc79M+NHOwhrII8o7oHiUahMhoZheWYmDd4THyaz
         1r/FdhbM7D8ezKook2zuo8UmsNfJ1+59HhD3uHnbrP3jRwVxRYrB5wmlm74YOLykP2bT
         6oJL2y59fAosseP6YVcDuDmzIf7yKpBqjLGkrwbkdvGB+YGDByuv8RGS1HQ7AHS5ekhD
         +bFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779368895; x=1779973695; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ioEzmXHuVthmvT1VW0zwCCGdbJiMgEB9gdSvDBe2i+A=;
        b=nLiFFAljWVVrLa42R9Cqr05DAxVQhqiUsmK36ZrDrcG7hJSozhBQvIoG940l9r+XW0
         6SHhZMlYOrfoTHJ7ZjMKZaS/EUtJBVsntVjFx4kEAom3fnhSIKJHlQQpFgS1wrgAWMB3
         lIHAiEOh+EojlCEK+KcEdA32AmO7cfjQDoh6KXpyr7LBrCyHPnJJNgVjFhly1dgnJ0pZ
         ZJSkCLegwo5dNSvhaKrrLsUH9oQgJ77IEkFrq/98VqlcOpAja6kcQLyWBiacdubhpGkn
         U7uX+HcEIgROEZc6Y0h8ciWCDTH/57qrEft2OPO6egUwIqr0XVs3lZDocUtiPgWvpxDg
         S7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368895; x=1779973695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioEzmXHuVthmvT1VW0zwCCGdbJiMgEB9gdSvDBe2i+A=;
        b=qyWOevM+8XGkDrOYvX2JDKoU0n0Pq+DiAuIN7bU+O5RBOmWMm7TpPpRasktRCVgKDr
         Y07JgQGaPgdku2FMhQCKz8mGkSIJKaDrfiWz5vBX50Yqtea5r5wShvS4CjwudatLwP4g
         SkRPrHwgqGnnKk/JEC0efA8fqHusGLfYh5fRVDFclo6O/wfpjR/luK4V2wmNlwGZ9CiR
         FSmwiq2vychgllDkax5IdDChOVE7/oeHg54a/55E33nfmuMcjFnJ2QshvSwonm7z11Cq
         fLVLv0Z/PdZ/cAi345W76FrxE0Ama7qO/FUbB7oPPl7sw3XnLoYryw8OpL7/RTcz4byg
         dPzg==
X-Forwarded-Encrypted: i=1; AFNElJ9M8Dkqr7eFxNeSfb+ju+eMxew1cYSF3pLgLdPDqJHpcsdR5bRUr/7RwquXbySR23BNd1VFKT4kfzErm9tR0tVM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/H+fo4uwmKqHiG6D8ANXIDki/oP1pEFMHKxEA32dpO8zVqf3g
	fKjr/s4YSAzEUwN69z8zp4o/KQ9568JCTLgjYDHbaMD+CWABqLDV/eZb4/Ohf/84n/6Lwg6oR5f
	3uIP8bl4LxdyZZuqDMEJPszegYH8MXfPGGOCWkFSH
X-Gm-Gg: Acq92OFGQVYcbJQ02abjih9dEa0SjqPbkQTAaBhIDsJXubg20HfXdYRYRLJ+CCYob4+
	1AUAxcjGt7uQsrPvL+hlNR2XmC0NRq0FSbOmIgbDPCU9rZS4KrjZTEFzJ0xUkwC/I62pB4l3idD
	uv2COBvWW5D54E5Bim0IB5zVvGTK183RnYfIqraXiQ+I8EW4UaA5bR39kbDAHchexaLCJ3ou9XQ
	I1hD2zbnEgovJkoq1AIxHcMDj2HTQvBXAxhYELYuUeVvYpoOwuzKCwmfnDj0g1cNDynOwCFmIVe
	miNLLNylPfmerwOTPe0=
X-Received: by 2002:a05:622a:4a8f:b0:516:9871:9a37 with SMTP id
 d75a77b69052e-516c530d214mr378741cf.3.1779368894161; Thu, 21 May 2026
 06:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260521102149.804874-1-vdonnefort@google.com> <20260521102149.804874-2-vdonnefort@google.com>
In-Reply-To: <20260521102149.804874-2-vdonnefort@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 14:07:36 +0100
X-Gm-Features: AVHnY4KpHOKPjBT7EqKWxkA57-QgUd5s-jhv2KTVVou9FaixwRXZGIGkqf1v4Bw
Message-ID: <CA+EHjTxPoxjvMTZX5w+UyVgC=W3VUSDoOQ-tCDLfnae16SqoMQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] KVM: arm64: Reset page order in pKVM hyp_pool_init
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_060816_087490_382F02EA 
X-CRM114-Status: GOOD (  22.70  )
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

On Thu, 21 May 2026 at 11:22, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> When a VM fails to initialise after its stage-2 hyp_pool has been
> initialised, that stage-2 must be torn down entirely. This requires
> resetting both the refcount and the order of its pages back to 0.
>
> Currently, reclaim_pgtable_pages() implicitly resets the page order by
> allocating the entire pool with order-0 granularity. However, in the VM
> initialisation error path, the addresses of the donated memory (the PGD)
> are already known, making it unnecessary to iterate over all pages in
> the pool.
>
> Since the vmemmap page order is a hyp_pool-specific field, leaving a
> non-zero order on hyp_pool destruction is harmless until another pool
> attempts to admit the page. Instead of resetting this field during
> destruction, reset it during pool initialization in hyp_pool_init().
> Note that pages added to the pool outside of the initial pool range
> (e.g., via guest_s2_zalloc_page()) must still have their order managed
> manually.
>
> While at it, add a WARN_ON() in the hyp_pool attach path to catch
> unexpected page orders that exceed the pool's max_order.
>
> Fixes: 256b4668cd89 ("KVM: arm64: Introduce separate hypercalls for pKVM VM reservation and initialization")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 25f04629014e..89eb20d4fee4 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -322,7 +322,6 @@ void reclaim_pgtable_pages(struct pkvm_hyp_vm *vm, struct kvm_hyp_memcache *mc)
>         while (addr) {
>                 page = hyp_virt_to_page(addr);
>                 page->refcount = 0;
> -               page->order = 0;
>                 push_hyp_memcache(mc, addr, hyp_virt_to_phys);
>                 WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(addr), 1));
>                 addr = hyp_alloc_pages(&vm->pool, 0);
> diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> index a1eb27a1a747..c3b3dc5a8ea7 100644
> --- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> +++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> @@ -97,6 +97,8 @@ static void __hyp_attach_page(struct hyp_pool *pool,
>         u8 order = p->order;
>         struct hyp_page *buddy;
>
> +       WARN_ON(p->order > pool->max_order);
> +

Could you add a brief comment? It took me a minute to figure out what this
catches. IIUC it's not attach's own input, it's a stale p->order from way back
when an external page was popped from a memcache (today only via
guest_s2_zalloc_page()). Right?

With that.

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad




>         memset(hyp_page_to_virt(p), 0, PAGE_SIZE << p->order);
>
>         /* Skip coalescing for 'external' pages being freed into the pool. */
> @@ -237,8 +239,10 @@ int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
>
>         /* Init the vmemmap portion */
>         p = hyp_phys_to_page(phys);
> -       for (i = 0; i < nr_pages; i++)
> +       for (i = 0; i < nr_pages; i++) {
>                 hyp_set_page_refcounted(&p[i]);
> +               p[i].order = 0;
> +       }
>
>         /* Attach the unused pages to the buddy tree */
>         for (i = reserved_pages; i < nr_pages; i++)
> --
> 2.54.0.746.g67dd491aae-goog
>

