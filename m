Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D9BCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 01:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3xy2uhIBa9uRGlGCKv6RNNnKNeckiaUZ7Fy0PM5Q/c=; b=KQzEY7Xtfypy6FL4rZX3WxuQM5
	Oah4kGN+C/eQRWKpMC0UqXbReM2QqauLsgp0ZGuqa38rgh8gjUAIU8yOw1oS2Av+09W90AjE4HnPP
	+NnZQy/lEYYD0lCrfdkOx8N78N3L5wgFYtJwboyZlwwbUCCSNlPWhwtCjTlG+1WZMO+yqUov5dam/
	L1DLruKPNfrZElYJdhBa4V+Yx/cwfmCYSE2ODaMzpGBtlZBeF5VXJLLTxDWVMpaiK05Nm4pvM7WwL
	IE9z+iKT3Inb074sTWQ012SQei7MyZeoRazVdU4hnMZrzIKqZk2nfxAzEMAXtlTDLVB7t+VT3cbhR
	JoYrEEPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUDz7-0000000C9W5-3tNg;
	Tue, 02 Jun 2026 01:32:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUDz5-0000000C9Vf-1wCa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 01:32:00 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso12832565ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 18:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780363918; x=1780968718; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b3xy2uhIBa9uRGlGCKv6RNNnKNeckiaUZ7Fy0PM5Q/c=;
        b=cFtVZTkkOS6bREEVKhqshELU6JZ/GxRoAm/UCcaOF8/ZKro9fWO7PTSlXuEZRwjImr
         Y9XsCqQ4tlhWn3TYhb2TXQDiilcSZ/QlCZYBjqaXVR0nXKAgS+IgTjnfnCNKOyhR1bJ3
         lpQKXhcINzh6+LMfGYAVSm4qWBHseN9kr82lYYJN8HTYLaXHiStXwTivOA3kLOsLTLXq
         eJ/2cB5ZOn+cqXe7odJX/qYik37gcqIMYXBY/VA1HcZULlGrgcDB+rLxE/s+T8WP/5ZV
         3HJ5f8I0NwFrKyxaM0J1YgJsb9snaWTfxxjrp/cNSo3HGk8NJOQ7l9yTYcwb9LB0YmHl
         FCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780363918; x=1780968718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3xy2uhIBa9uRGlGCKv6RNNnKNeckiaUZ7Fy0PM5Q/c=;
        b=JKBkqEikQE6GoACbycwQpZ8UIuuvq25pTMuKvzRmdQvq44AFZJcYel+Hw2E8JpQuhs
         qskyFR7O8mZ5lHX4EI5xcEY9Q8jtoqE6MNL4JFYDe9577S98Z35o0YtP670Uag1dguf/
         5RIY8VGhEncnd0nnyBQ8yBUo2wm9bIk3ATyXVogimYG5AwuznCdN9MlKyZog1srATQXv
         RXqQ/bVGGZ0cQNgzyq/d7cSBPZKlZ0esCUBkb7MJBCgsu4DtjvchkhMCYbl98JXq8kLu
         3QXrZMHG3O7vCS/dYAkSr2jfRCK3uoOOkN/0gYy+Q5avlhoILp/6mFZ7bELZPXWt45Z9
         jymg==
X-Forwarded-Encrypted: i=1; AFNElJ/x3YMO6gB4Uf1wtXcNHpWvIxHpj0DFCbWmYBQ9qOht7ziebJFsguLVewHlskhdtnkQslSoM2OaS+/zvxeemPvs@lists.infradead.org
X-Gm-Message-State: AOJu0YzLwbO930aWWgJiRwWQt6HutY7ECFNzH9DJEbjyaYTLnyq5oRZo
	nwet+qNGWfi3DO5b1tsEHVruHnBCiA1P4ij4sMMdxO70a+HZZfgLErqI
X-Gm-Gg: Acq92OEL3q2VPiA8NvYO8kenOtmT9+0CGsrUqoX/4gMHEQi3i4WOa/s4Qig//deqaVT
	uYjjotyEvsGjhuu/sEIOWC5An2dzjsD9p2iYioewFu4Vdn/dgKQ/d92C14G5G/YfWoNZzu4K7fL
	PL+mw5XZXFmqdNFhSU6dCveicIXziep+y+ocqM38q5OyX9MPuZKEgbNF4NAeAIh0XTejTJZSzja
	7bp2+Qbu6MT1hcBCZ/uCDcA61Nd2vIsgglk0m6Tpqt8NS7Ajy7fCQjjF+BFhmDyO/nWHsdec4kE
	FpnSrLZ0gLLCxjJSprYjklJ6cN2Jg7pAZI7IhG1bIIb9Os7F4wg235446AaTzezenoEloEyk833
	hCYnLvoG7lyOK9afTawm9b8gMVyyxCgY+SFznAuKRpxfR8wSP2xFZGgSVqnr9V9VcCaP0dENA1K
	aGUDiDyhVsWeg3lrH5WbzFOSbn+uWh+sgFIAsBOensS5cmBC1ckpS/zEcW3INg5p3h
X-Received: by 2002:a17:903:3884:b0:2bf:33a9:bf4a with SMTP id d9443c01a7336-2bf368a3d92mr163696255ad.38.1780363918317;
        Mon, 01 Jun 2026 18:31:58 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd85dsm112089405ad.25.2026.06.01.18.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 18:31:57 -0700 (PDT)
Date: Tue, 2 Jun 2026 10:31:53 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Oliver Upton <oupton@kernel.org>
Cc: maz@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kees@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, imv4bel@gmail.com
Subject: Re: [PATCH] KVM: arm64: vgic-its: Drop the translation cache
 reference only for the erased entry
Message-ID: <ah4yiavdXTB10P0d@v4bel>
References: <ah2c5lu4JbUg7dj-@v4bel>
 <ah3Yx0fjguUdCk_G@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah3Yx0fjguUdCk_G@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_183159_509964_4CFC2C59 
X-CRM114-Status: GOOD (  37.45  )
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

On Mon, Jun 01, 2026 at 12:08:55PM -0700, Oliver Upton wrote:
> Hi Hyunwoo,
> 
> Nice find.
> 
> On Mon, Jun 01, 2026 at 11:53:26PM +0900, Hyunwoo Kim wrote:
> > vgic_its_invalidate_cache() walks the per-ITS translation cache with
> > xa_for_each() and drops the cache's reference on each entry with
> > vgic_put_irq(). It puts the iterated pointer, though, rather than the
> > value returned by xa_erase().
> > 
> > The function is called from contexts that do not exclude one another: the
> > ITS command handlers hold its_lock, the GITS_CTLR write path holds
> > cmd_lock, and the path that clears EnableLPIs in a redistributor's
> > GICR_CTLR holds neither. Two or more of them can drain the same cache
> > concurrently, and if each one observes the same entry, erases it and then
> > puts it, the single reference the cache holds on that entry is dropped
> > more than once. The entry can then be freed while an ITE still maps it.
> > 
> > xa_erase() is atomic and returns the previous entry, so put only the entry
> > that this context actually removed. The cache reference is then dropped
> > exactly once per entry even when the invalidations run concurrently, and
> > the behavior is unchanged when only one context runs.
> 
> Next time:
> 
> Cc: stable@vger.kernel.org
> 
> > Fixes: 8201d1028caa ("KVM: arm64: vgic-its: Maintain a translation cache per ITS")
> > Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> > ---
> >  arch/arm64/kvm/vgic/vgic-its.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> > index 1d7e5d560af4..1e3706ac3b8e 100644
> > --- a/arch/arm64/kvm/vgic/vgic-its.c
> > +++ b/arch/arm64/kvm/vgic/vgic-its.c
> > @@ -597,8 +597,10 @@ static void vgic_its_invalidate_cache(struct vgic_its *its)
> >  	unsigned long idx;
> >  
> >  	xa_for_each(&its->translation_cache, idx, irq) {
> > -		xa_erase(&its->translation_cache, idx);
> > -		vgic_put_irq(kvm, irq);
> > +		/* Only the context that erases the entry drops its cache ref. */
> > +		irq = xa_erase(&its->translation_cache, idx);
> > +		if (irq)
> > +			vgic_put_irq(kvm, irq);
> >  	}
> >  }
> 
> This definitely works but TBH I'd rather just plug the subtle race and
> do invalidations behind the its_lock since it already nests with the
> cmd_lock.

Thank you for the review.

> 
> Could you give this a spin?

After testing, I've confirmed that this patch approach works well too.

Shall I submit v2 based on this fix?

> 
> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> index 2ea9f1c7ebcd..b2225da212ec 100644
> --- a/arch/arm64/kvm/vgic/vgic-its.c
> +++ b/arch/arm64/kvm/vgic/vgic-its.c
> @@ -596,6 +596,8 @@ static void vgic_its_invalidate_cache(struct vgic_its *its)
>  	struct vgic_irq *irq;
>  	unsigned long idx;
>  
> +	lockdep_assert_held(&its->its_lock);
> +
>  	xa_for_each(&its->translation_cache, idx, irq) {
>  		xa_erase(&its->translation_cache, idx);
>  		vgic_put_irq(kvm, irq);
> @@ -607,17 +609,16 @@ void vgic_its_invalidate_all_caches(struct kvm *kvm)
>  	struct kvm_device *dev;
>  	struct vgic_its *its;
>  
> -	rcu_read_lock();
> +	guard(mutex)(&kvm->lock);
>  
> -	list_for_each_entry_rcu(dev, &kvm->devices, vm_node) {
> +	list_for_each_entry(dev, &kvm->devices, vm_node) {
>  		if (dev->ops != &kvm_arm_vgic_its_ops)
>  			continue;
>  
>  		its = dev->private;
> +		guard(mutex)(&its->its_lock);
>  		vgic_its_invalidate_cache(its);
>  	}
> -
> -	rcu_read_unlock();
>  }
>  
>  int vgic_its_resolve_lpi(struct kvm *kvm, struct vgic_its *its,
> @@ -1725,8 +1726,10 @@ static void vgic_mmio_write_its_ctlr(struct kvm *kvm, struct vgic_its *its,
>  		goto out;
>  
>  	its->enabled = !!(val & GITS_CTLR_ENABLE);
> -	if (!its->enabled)
> +	if (!its->enabled) {
> +		guard(mutex)(&its->its_lock);
>  		vgic_its_invalidate_cache(its);
> +	}
>  
>  	/*
>  	 * Try to process any pending commands. This function bails out early
> 
> --
> Thanks,
> Oliver


Best regards,
Hyunwoo Kim

