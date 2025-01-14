Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54441C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 15:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3uX9sXBfAGLVLkprPT9LjGtR+jH3MZBlHxc/29olV4=; b=U7FAEBiqH0JCI/rI/VuIwY4q2y
	x6X2cQwe/yLnIlnoYtzVF5iOyzjzIjSVzqGK52xjCwR5uPSW2rx8UzftBFIIzQaj0PIlBITZV1qaq
	QL2mslaWqYyWhQKjk9eVxFzvMyGAHBgvcjmPrOjUk2uycGNA2xYo4VLPVwNfCLXH52xufgTiwFX47
	VQYIJ49uzp03HKB9LE/szoYlvgfPLoxAFN4grHOgzJEhG2hNTTlXFr5XhBjvqG1TrdXNj/R66iDMt
	HJwKot/IaoP0kwkwSsNKxrqAXYKgpLdRElpfR7yMc9HtOD9042GDd+JeYemVPa/8nv6V7FoSRRXV4
	3O67im/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXiUc-00000008n4V-1cxb;
	Tue, 14 Jan 2025 15:06:10 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXiSF-00000008mXn-1AIb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 15:03:44 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4361d5730caso44535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 07:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736867021; x=1737471821; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r3uX9sXBfAGLVLkprPT9LjGtR+jH3MZBlHxc/29olV4=;
        b=K76rwfqQPlgTgl/X7m6v4MUEEArxs9iIBJsqWY6ihT51Un8Sjge6vDbmYaJJMkYB21
         dj+e/isq73mmSGPfy1k4LOUjVyLvA5foNkmf6MjuyFVJoUtm2RTNEV3R6zp7L9p8+rxV
         R7R6GeiwUhnoQzv1GeIGPjfoM4cJMwMVSIaSti26os+rti5oXDkLR/7RcWcsvLnbl7Fg
         T72GNNhE1Ja1MlQgJOeI6vSmwuhZVSJx4+SZbX0zpLGFw3plv1MoqeldM7WNyul2ZQEv
         CYXs2m+Yu8KY2vSNWvkXzPwKvT1wUy0DGrF08WQrfd0iLOuloKLuTLCscF5JcRofCIcJ
         EDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736867021; x=1737471821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3uX9sXBfAGLVLkprPT9LjGtR+jH3MZBlHxc/29olV4=;
        b=lEnPpoE2v5EkpI9xCg4jVpkJTjDhGqrsk0YUqyUC0he7AK2qudCu2v1D4vo2sR4lm2
         86ebHz1ngwsxUj09EbhiCWyVtBj4nZIbaswMhLVHIumdbMGrTZ39HBT9vB7wTJc9QovC
         JQbpqlRYU8a8/fAG56wgZ5gp5iPtRaUhHbBd11+8lLVaKj911c/YdqjSKfpyXyXCN16P
         yPaoUOjfegV7ZgOaj1cf9LI53rXvOJycZQsSX5wDbb6/QfdkoclocUsbVfzrB8Smp0Yy
         iO9gQTsHNHFWSZmxz+gB1cI8KmDFno8SWzemLs+/lgKaS9Lx+N0Go7LMBcsqWUHSjtwD
         Vf2A==
X-Forwarded-Encrypted: i=1; AJvYcCUTg+J++iYyIiT7idc3ZkgNrbFLQ7OnD+JpOxNiBgG2Jmt1duNHBjnUgVIYh70zKVmY+OJ63BzvTrlo8PjIp29L@lists.infradead.org
X-Gm-Message-State: AOJu0Yythx3sPsqqkt1G7VXgTVuqRFwvRhBNvcwR1sZMUL3fQAgDxkoN
	RCisnj3xpvOJZqJ/FwK8sX+0zJIkMM/K43keVUeGLbmuPRPLVu1oZqzPSrrHDw==
X-Gm-Gg: ASbGnct6ZElBe4JQ2N48WJGThJ4S+EESSARlLPbl6TvMfIPIOoi8S+tUU/83R3rNVFz
	+dtIPUJN6tDpFUg1/4yLf63Yb+ShgWgf4TUX+B2EH8X0Aag3IsJ7UF/7/z4lWgMD8GBYZDDcLj8
	DIIkZsRtFCqqIxvlEgC2fxw9lPCCrdK+BcdER57r1T80PXvuCinMBSP+7Y+Qv2hOEQtF2F9RC2I
	A/2EROoVJLnCV0coAJYWV8KhCxJ7punstlKdz/MeW/YcEdcJh0vnTo3m/xjBY3J0ILaArQPw55K
	GE4MmpWNORgXUFB9MpemUsfs
X-Google-Smtp-Source: AGHT+IGYqkoeO9rhW5ofYX5hkCQ3axs1adHzVPrXSPhBirum2F1DdwApMWgQvcwBhmV8s97iNigOAw==
X-Received: by 2002:a05:600c:22d4:b0:434:9fac:3408 with SMTP id 5b1f17b1804b1-4376cbbdea5mr1143785e9.2.1736867020368;
        Tue, 14 Jan 2025 07:03:40 -0800 (PST)
Received: from google.com (47.246.140.34.bc.googleusercontent.com. [34.140.246.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d2f5sm15218121f8f.17.2025.01.14.07.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 07:03:39 -0800 (PST)
Date: Tue, 14 Jan 2025 15:03:37 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	oliver.upton@linux.dev, suzuki.poulose@arm.com, will@kernel.org,
	yuzenghui@huawei.com
Subject: Re: [PATCH] KVM: arm64: Fix the upper limit of the walker range
Message-ID: <Z4Z8yRPGwvqHpzRs@google.com>
References: <20250114145050.563658-2-sebastianene@google.com>
 <86frllwilm.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86frllwilm.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_070343_321268_9DDD4A3C 
X-CRM114-Status: GOOD (  20.73  )
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

On Tue, Jan 14, 2025 at 02:55:17PM +0000, Marc Zyngier wrote:
> On Tue, 14 Jan 2025 14:50:51 +0000,
> Sebastian Ene <sebastianene@google.com> wrote:
> > 
> > Prevent the walker from running into weeds when walking an
> > entire address range.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/pgtable.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index 40bd55966..2ffb5571e 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > @@ -260,7 +260,7 @@ static int _kvm_pgtable_walk(struct kvm_pgtable *pgt, struct kvm_pgtable_walk_da
> >  {
> >  	u32 idx;
> >  	int ret = 0;
> > -	u64 limit = BIT(pgt->ia_bits);
> > +	u64 limit = BIT(pgt->ia_bits) - 1;
> >  
> >  	if (data->addr > limit || data->end > limit)
> >  		return -ERANGE;
> 
> Huh, nice catch. I guess this deserves a
> 
> Fixes: b1e57de62cfb4 ("KVM: arm64: Add stand-alone page-table walker infrastructure")
> Cc: stable@vger.kernel.org
> 
> right?
> 
> 	M.

Hi Marc,

Thanks for the prompt review. Adding the missing bits now and re-spinnig
v2.

> 
> -- 
> Without deviation from the norm, progress is not possible.

Cheers
Sebastian

