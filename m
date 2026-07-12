Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F09CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 16:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ES1mkwY7jaOFgFwjojYBIvQZ3AefuN0fAHADuk0B0OU=; b=V1qrMBi0XjxmV+Clqg++EX/Kog
	vGEtG4wQxquag5ZZUPBkhFlEEf8u5JN62yNFhD/diQlB1aRHDotwWSAExTfz7rufsxa1Y4rzIuqBU
	c2OrjAFubTmqo1s3UcKlWOFd6aTOuGRCR8fhv9wlcWP2t0XPSbhS1nnhhP2OLPGDmaWfc611MNRwC
	K9st2fLQS5UacY+b5qgVYvfYmvzPFnojA8wzEchZnDru1xwwhjGd63KjnDTmjm2GEEeP6KO38dNFk
	P1Lk+/SmGlth3MkOaZEWospj8enueIIlv41JKn3F/baqf/C6lmnfBNv9u8qex2Ay639Xeb+pjUXA0
	VgoGjhfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiwBk-00000007Zqw-4BhD;
	Sun, 12 Jul 2026 15:33:53 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiwBh-00000007ZqP-1fEW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 15:33:50 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493b8d99342so43575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 08:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783870427; x=1784475227; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ES1mkwY7jaOFgFwjojYBIvQZ3AefuN0fAHADuk0B0OU=;
        b=SrwubAWoMfVkGo0W2DhQrCzQT6S4MhcvHkXVRB7uMymooWDDfHcPFOrRiA9eyu1cZt
         GhQ5qEkXW9XVOostFZtZrxPueWnIajenIkr5EikM4CccyWzOV2U2XDGRwXIX4ZDTA1Oj
         wwUL0aa4ebpUEyZe4pr6UnyxE0XHJUlhywOqNMD403ZDoJtcDfU4Jl74XE4LG1FafrNN
         puScAr/V7V/rSS/5hKfnGCmhwOvZioBwBi+fcxA8DCzuLj/vj79aXxy37XSjRHJhCv7D
         4SMncBRhKs7s4Y+J7p/30h72h7Hup+WnsmHxRlc0jD6+XTM4CVdto2EVLyn1f5mgWuCa
         97FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870427; x=1784475227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ES1mkwY7jaOFgFwjojYBIvQZ3AefuN0fAHADuk0B0OU=;
        b=p/weROIJQGHG1NyjBLYL09WbXa3PeZZWNGM4GXRpF2P0ozpb4bZLiOcqlSR1arD1H+
         gBbTDYYV962doykxTsUYI8GPaaEWla9co7a8bZJUXcVMO5wT0dKimPvF4LqE2ivuiG/6
         +5IoOoeqGKwiKT6p3Hl6R6nQwnbFfepuWv42Er40bfIzG6OMJsyRPmBQyk115eWRAxOr
         E7IDHFLBmssPhV3fCayUlsTLETqvm4qOqT7xDqL344lau1u5fljVxWvxZc3WQWxtCheC
         bJL4JtD6/ux2lH8gnwtcgbysy7dIDGaFTFtWOvZcRUGCkOSdg/kXVz+iYRODWaZCuzLV
         vkIw==
X-Gm-Message-State: AOJu0YysrK25guPHgfx4xYOSFuU3Gtv6uouzuf/ZvwXEjwlabo/kWE5h
	I6uB4ZQFSUV0vBPpMTcW9mGymR4zUiGsjdHVDDpb8pSZXmbANyzAu8/YRfVv6AVJgw==
X-Gm-Gg: AfdE7ckP4P/RxQgFAW2oOZWaHZSTgI1tmtuwHV2t/ZaR4sRHvURJlHF5NcrlwY5tzWW
	4vD7g2ot6+TvfBy7CiZxGDxNbLTe1l4XkfhkCmZ+JT2Gs6gFceemfcgE891XPHi4nWx5iOoUTL2
	1aSRqUjyL5Dt16zBNARzACm8uKLmhiQH1z4IqnusGAoiiF/9tu8pUNh6J38oFGzgkY5Oy/RWjza
	qi2IYMmkVcZqBMLE4l16vozed/mAWxPCjK+fh/QsbYvUGsKJSM6Lwy/WJQbVLXr1keZaHPC3H+G
	gw/cEkCY1Clg87XSExoUNZBUUe/+R62UrOrEWT0PvHcBols5sQEeIFJGDsX06VdyujTGMZ03HcA
	4qtWDoT9tl3qmFhksOdiqcsX9wscHIFTzOTYZkrn577TEtSGlHzHHheglMni0IkPfvOVAdY/Nby
	AoV6MUGkxJkN8ZzFypaZMWmeQW5m94Z30r7CS+HHfof3XgBolYxmA7AWObK4A=
X-Received: by 2002:a05:600c:acd:b0:493:aed4:8d03 with SMTP id 5b1f17b1804b1-493f8cc96d9mr1755725e9.9.1783870427118;
        Sun, 12 Jul 2026 08:33:47 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm82266808f8f.37.2026.07.12.08.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:33:45 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:33:42 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, will@kernel.org, rppt@kernel.org,
	maz@kernel.org, aneesh.kumar@kernel.org
Subject: Re: [PATCH 1/3] arm64/mm: Simplify SWIOTLB setup in arch_mm_preinit()
Message-ID: <alOz1nMnqtAb2mRh@google.com>
References: <20260603110522.3331819-1-smostafa@google.com>
 <20260603110522.3331819-2-smostafa@google.com>
 <ak9lA6dUnBYzwMlI@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak9lA6dUnBYzwMlI@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_083349_449795_2690BEBD 
X-CRM114-Status: GOOD (  28.44  )
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

On Thu, Jul 09, 2026 at 10:08:19AM +0100, Catalin Marinas wrote:
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
> I'm fine with implementing Mike's comment on doing the check inline.
> 
> I recall some people still comment out the dma kmalloc bounce option:
> 
> https://github.com/raspberrypi/linux/commit/a07564753639fe5ffb3f59d7364f14e6e68e3e9e
> 
> (there was no way I could convince them it's worse memory wastage
> without the option)
> 
> So happy to make it slightly harder for them ;).
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks! Would you prefer if I send a new version removing
limited_addressing?

Thanks,
Mostafa


