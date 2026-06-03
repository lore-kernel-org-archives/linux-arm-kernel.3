Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72326CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2jL+y7AofTEiRmizQge3p1N6/KWPXHpy6eo/h7vnb4=; b=xcoxi45aLZymJsm43eMEbArNjG
	kmmXW9KM/Iiiba7bWDyIXXXNrqxr9ckPet6hK0u0bEjU9xt9G5L4A7ty4bBd2KDpGn8tfluHDKHKe
	RfBPrMc7GyE8xJ/SoTn47Q/tuH49mvPw7LctvgWmDUb5iHKs2vpG24Guz9P1ZK9HvtvlQY2gLixE0
	z45zWmvhpIarjfFI9PsB34MlTdnqNcN82MKMAsXrviFLNSWHDZ4qyeFrsBq2W5kftMgflnFu2cEgX
	nIqGaxTg4oOUJMm2Lp/k43/vz60GhP2wBIQrz0FMEEVw0zryDMtrSCl4yLTeBudepwrjGhgNBJuOM
	v+ZoZD2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlPz-0000000F9ZJ-1iyA;
	Wed, 03 Jun 2026 13:13:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlPx-0000000F9XL-04ae
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:13:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4891b4934ffso70775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780492435; x=1781097235; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X2jL+y7AofTEiRmizQge3p1N6/KWPXHpy6eo/h7vnb4=;
        b=YcCcILp+c25uVlLNTBD8htcYiHQdwQCYX2ioqBW6dn2oPfXi3AQARmnR0YHIWgPP/W
         8v/MEckI3YhLvzNFzfgrFFyvDVHzwY6hVgVzaKijf1NK0NgZFYZZrA/XAo8eE9E9S7AE
         OSLIDwzsPytmLldS0zs6zoH5vMh85Uu6jWiP6g7cZ6K8L9IiaE2nXvH6DPUFbzawJ3vG
         bdymtFDXdbwmxKdvi+tpfIFJAMblbV45cBpe9g73xx423FuYx94Q67XpSpI484U3u8oP
         7kaeLFBQP8HMdhRjz9YqUKWYxtnRgzS9LG2gxg9qCFor4IJoNdz7otKeZIjfFmgzla94
         z8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492435; x=1781097235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2jL+y7AofTEiRmizQge3p1N6/KWPXHpy6eo/h7vnb4=;
        b=Bdu+TFHcLaIXDFB1QQ69N3ihylX/ilG4tiwUfkYrtZWZYupcTeoISOqeWWIt2Tl8j4
         +ck7YCqW3FWPIMrqj8B60uicgJmCI/S06M/q5YQSoWaeo/tPYNWhTSrM6hQwsatjsMWr
         ST87ee2pX0j7Q9hJLNN31CRPXVKf3U95ze7iK4/XeNKjWXqlh3YgV7PNGI2VSHQdxp6T
         XQsi4CoHDFBhxKqFq4830Q2q1KallhOsh67rNdNdCFvnXqXWldvBdbhjy+J5KprvdwDo
         w0gaeI/Wt/tXMGIp4xhnBkNMMjTax4SNOHIceGwebjxMZRkb6MrpzSJfJRtLbC2FD5O4
         bjLQ==
X-Gm-Message-State: AOJu0YzdWvL6ELAfXgyBh8RvvqpDS2jK3hxAQoVjLUxa6/PKUeA8L/K/
	y0HkNtUDLvQtT/QHcO1qDS0ZG1AbJ0GCPnVTvFMd8C/ZeQYuhCZ0gdOPQy/vhNOQ/w==
X-Gm-Gg: Acq92OEzz/1OPnXHPG3vltTC5fAbjb9+MtRoDuuWZQPZwiU2qZBeYJzW2EUkdUuzwB5
	roAuOEUYQZR4ZMguL9PSyMme7zoWlP/0Dx44nmP7cRpYWC+JbDqd5dd9E2DNj4Rn4kYRXsKx4HY
	FZSmQsQBP+/gvsIzPpptqAHl45XhCUpVslHNXUxUoupDDuvDDeo+7KfFH2fpjcnR/EytvjAS3Ns
	D2UYje0zdsCStO+Qagy5nEy+6vhdU3oLGVPRYSMJS9I9MQ16x6F3w526sCGH8Qess0YpVvniD6k
	RTR270Ygl0bjOjOlxp7WAUKfnBa6uQtixsCyVYSdUl0+3pXfPcezn4kR273mNseCcKO87w5W//h
	JW6nQLKkfPQel/DE4CJBk1vU054UfcHQyrQDJzRNvANioJfgbebxked/rUndtWwFB+TFmH1/j6z
	Cf1MGqQmXLa7iOAcd1YytrLGWIbzGv4FN5cmW1u84q7yY+7P5WzdPJ5pwzqv1U0J9DxESIvJP4
X-Received: by 2002:a05:600d:2:b0:490:b2ae:44e1 with SMTP id 5b1f17b1804b1-490b8ed04bamr811475e9.5.1780492434644;
        Wed, 03 Jun 2026 06:13:54 -0700 (PDT)
Received: from google.com (203.80.140.34.bc.googleusercontent.com. [34.140.80.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm5706360f8f.10.2026.06.03.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:53 -0700 (PDT)
Date: Wed, 3 Jun 2026 13:13:49 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org,
	maz@kernel.org, aneesh.kumar@kernel.org
Subject: Re: [PATCH 1/3] arm64/mm: Simplify SWIOTLB setup in arch_mm_preinit()
Message-ID: <aiAojTDO_FcEG8XC@google.com>
References: <20260603110522.3331819-1-smostafa@google.com>
 <20260603110522.3331819-2-smostafa@google.com>
 <aiAdyLKSRGjV4_r3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiAdyLKSRGjV4_r3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_061357_074546_4DE39C56 
X-CRM114-Status: GOOD (  32.08  )
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

Hi Mike,

On Wed, Jun 03, 2026 at 03:27:52PM +0300, Mike Rapoport wrote:
> Hi,
> 
> On Wed, Jun 03, 2026 at 11:05:20AM +0000, Mostafa Saleh wrote:
> > At the moment, arch_mm_preinit() checks if the system has limited
> > addressing or is running under CCA to enable SWIOTLB, only after to
> > be forced to true anyway if it was false due to
> > CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC being unconditionally true for
> > arm64.
> > 
> > Simplify this logic, by making it clear that SWIOTLB is always used
> > but its size depends on the address layout of the system.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/mm/init.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > index 97987f850a33..fcc9c05a8fe6 100644
> > --- a/arch/arm64/mm/init.c
> > +++ b/arch/arm64/mm/init.c
> > @@ -336,25 +336,22 @@ void __init arch_setup_zero_pages(void)
> >  void __init arch_mm_preinit(void)
> >  {
> >  	unsigned int flags = SWIOTLB_VERBOSE;
> > -	bool swiotlb = max_pfn > PFN_DOWN(arm64_dma_phys_limit);
> > +	bool limited_addressing = max_pfn > PFN_DOWN(arm64_dma_phys_limit);
> >  
> >  	if (is_realm_world()) {
> > -		swiotlb = true;
> >  		flags |= SWIOTLB_FORCE;
> > -	}
> > -
> > -	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb) {
> > +	} else if (!limited_addressing) {
> 
> Can realm_world() coexist with limited_addressing? Then the size adjustment
> is still required.

My guess would be no, my understanding is that CCA guests have niche
hardware.

However, the check for limited_addressing is negated, we adjust the
SWIOTLB to be smaller if no bouncing is needed.
So, if this is a realm world, address space layout is irrelevant as we
keep the original size which is larger.

Otherwise, this alters the current behaviour.

> 
> I'd also make this more explicit:
> 
> 	if (max_pfn > PFN_DOWN(arm64_dma_phys_limit))

Sure, I can drop the bool.

Thanks,
Mostafa

> 
> >  		/*
> >  		 * If no bouncing needed for ZONE_DMA, reduce the swiotlb
> >  		 * buffer for kmalloc() bouncing to 1MB per 1GB of RAM.
> >  		 */
> >  		unsigned long size =
> >  			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
> > +
> >  		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
> > -		swiotlb = true;
> >  	}
> >  
> > -	swiotlb_init(swiotlb, flags);
> > +	swiotlb_init(true, flags);
> >  
> >  	/*
> >  	 * Check boundaries twice: Some fundamental inconsistencies can be
> > -- 
> > 2.54.0.1032.g2f8565e1d1-goog
> > 
> 
> -- 
> Sincerely yours,
> Mike.

