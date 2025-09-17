Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AFECAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 20:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XoUhSQnd7IfUTabpSDtGCH3l3cdjv1ByOw0labXn8P4=; b=Y/y3zlAmtl/v5N/K6asoD1hkxl
	Z425CkYzGD9mybf2p9MR8XFunqLMT/xBiTk2G9jgz47TvKXsXQRIYIPRKA7l6mBvQBb9xtI88+h5h
	B6wdu+lIxcEDa/qi4xnCpAZ4jfUH2eBvkRGTHe0c8vhAjXbKUZ2SXohHczkVf5PtXsfOd0v+LRH/x
	n90gsudmeHh6Q3ViqgCuEJBVGlQZt1LF5cjszsIuAFVfDb1kLEDtuZVZMl/YiH4f10VCYkzqCmh9H
	t1bIaZOWzX+b2wnWWqUKdYzYxC2UCephRX2WWyIITaO+ta5KwjrnntjO+mx8JXDnwe4lF/k4R+JVK
	5T0exDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyyda-0000000EXkG-1TAR;
	Wed, 17 Sep 2025 20:20:22 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyydX-0000000EXiT-2TVz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 20:20:20 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45f2f894632so19725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 13:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758140418; x=1758745218; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XoUhSQnd7IfUTabpSDtGCH3l3cdjv1ByOw0labXn8P4=;
        b=ps5RczcO8+djBQtL+ZQNmll++4tpcptr0S2uVJhRQVRsDlX7NBBJ8Cp+iBetisSXHf
         2CgwHiW6hG7k6V31uMhzIvjDBYyUSdk2ZvFft+1KFhdgDzhfsGMkq3lEqdRaOvMAU9q5
         FFdmxDAixZ/yg+Y8eQlY4sR1h+Z6VHEoaNKf/P5Byu5TRKmk3gLuxD228ZklVqfW/etl
         h3J+m3yWRypm2LlvzNioGMSbyiUs8NmfsAzKJo1/fOY1HK8urik37wv1sOinpy/l9m9/
         ZeavFAytnjqGhbkxu5Y75fvHtcNiErpxQ4VBDbc+tjBd5hbkuh/l3e0LlDCDHbGe0TSv
         3ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758140418; x=1758745218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XoUhSQnd7IfUTabpSDtGCH3l3cdjv1ByOw0labXn8P4=;
        b=leVZ0rV/iB3R1lnhebupaDQ0s4Enev/NRh3SE2f6+awKqSXskKlhMOj3dwR0jqd7u0
         seqRRG+wm1Ug9BwF9W4GsfF+jotpeaN0jLX974tyfqdUr0CcG6Qjp8Df3Z1FWkFmgCVP
         POmAlB0OTEW9LI1n7IHV0nz+A9tm9LRZVv7Fmv39NxG1Uou/dL9zAXKYn6QrFIyUNSWH
         AlR+wbKxwMrK7PQFs7KozjFPISrGJcwxKOKZcm4A6GEvGYErxUwMJA5bwPNuKZ1iz2Co
         BU6CmCbAV2J9eFS9SRm46gCCM8AtjoMzhNp3gEuPDaQnlj8Y/BuLkldE0EvJi69i64qG
         eeKw==
X-Forwarded-Encrypted: i=1; AJvYcCW2yyfTdEZlO8GYHvEL4cQ0BSWXgWXgdsH28GXeHmeR16JHuI048lP//jbCLA7Hh1GbNXjQ/UFjKj37HyyCWSMk@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx3NO+XYOeMXBolwsxSNerW9V9qwhu04CVxYDx0x861aX+p4+5
	d019fpzvENPqgSVnlWsfOrJpt5ikJ7Rb5yM0xZFiyzA4U9UNEYB2sNCqEFjq/RYpmw==
X-Gm-Gg: ASbGncve9tnrZgAe14CxbV1jB6d7f3IZtj+5LZAywfGx+YWgxLv0xi1zW1zelFeH86a
	8RUAljVOlqwLJoWL+Dn+spoYfbz35dHfZ/gT5h8BrpfjGMdFdyaW0K66mHel2OuXE1AuZ1wCvpo
	W9q4G9OwAd+a8vzoCn8fm3I5jZXRQftH4lQ7zGiCd5lH+Ld4Rnhex+HNpIedGlkusAzI7s5np1L
	NA2v9Bt/Re7SgkeWZTWP8nC7M0PBom4esN+PTpRC3LzUd75jGRC0zdFgZBAatdBiSlZMOZqd7HP
	fcN3/44aJmJN44sCwjBO1777z1p7fLg+0tmisdK7FingZ0RvYWPOh626LhFojOUx6QM1PAzLf8p
	vOv6JelMiAo4xSvu9ZvQW6L3yJ/S7ih4WgVmXg0VjFUHxNoQjOAbX22xIhWM+neSdXbkVv2f8nB
	dylYzACiMmcWzN
X-Google-Smtp-Source: AGHT+IGL88nN+OqGfm1HaJnu3LWbX2CcWRBICMmdu5JCioCD/g1gYZjfAdwJ3rB3P8WH9nqDGiZ/5Q==
X-Received: by 2002:a05:600c:a404:b0:45b:9bcb:205 with SMTP id 5b1f17b1804b1-461e37283d8mr1338655e9.5.1758140417528;
        Wed, 17 Sep 2025 13:20:17 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f0aac271sm9659905e9.3.2025.09.17.13.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 13:20:16 -0700 (PDT)
Date: Wed, 17 Sep 2025 20:20:12 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, praan@google.com
Subject: Re: [PATCH v2 1/3] iommu/io-pgtable-arm: Move selftests to a
 separate file
Message-ID: <aMsX_HafW3rLs5dQ@google.com>
References: <20250917191143.3847487-1-smostafa@google.com>
 <20250917191143.3847487-2-smostafa@google.com>
 <20250917193818.GK1326709@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250917193818.GK1326709@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_132019_648755_CE63A37E 
X-CRM114-Status: GOOD (  25.56  )
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

On Wed, Sep 17, 2025 at 04:38:18PM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 17, 2025 at 07:11:38PM +0000, Mostafa Saleh wrote:
> > +static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
> > +{
> > +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> > +	struct io_pgtable_cfg *cfg = &data->iop.cfg;
> 
> Can be:
> 
>        struct io_pgtable_cfg *cfg =
>                &io_pgtable_ops_to_pgtable(pgtbl_ops)->cfg;

There are a bunch of other formatting issues here also, but I wanted to
move the code as is, so with “--color-moved” you can see the exact
difference, otherwise, it’s harder to review.

I can add a patch before to fix those + the printing as you suggested
next.

> 
> > +
> > +	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
> > +		cfg->pgsize_bitmap, cfg->ias);
> > +	pr_err("data: %d levels, 0x%zx pgd_size, %u pg_shift, %u bits_per_level, pgd @ %p\n",
> > +		ARM_LPAE_MAX_LEVELS - data->start_level, ARM_LPAE_PGD_SIZE(data),
> > +		ilog2(ARM_LPAE_GRANULE(data)), data->bits_per_level, data->pgd);
> 
> The entire struct arm_lpae_io_pgtable is exposed to a public header
> just for this one print.. Seems undesirable.
> 
> Drop the print? Honestly, I prefer this, given the maturity let's not
> compromise modularity to print someting nobody will ever read..
> 
> Alternatively call a kunit-only exported function to do the print
> directly from ops so. smmuv3 has an example how to do that
> 
> Either way a precursor patch to adjust it will allow this patch to
> avoid publishing most stuff.

I don’t have a strong opinion about this, but I am more inclined to
keep the prints considering it’s a low-level test for the page table,
and such parameters would be useful to understand the failures.

Moving arm_lpae_dump_ops() to the core library will leak the kunit
struct, but we can drop the kunit_err and rely on pr_err().

I know this is not relevant to this series, but the KVM driver will
need to expose arm_lpae_io_pgtable anyway.

>
> > +/*
> > + * Calculate the right shift amount to get to the portion describing level l
> > + * in a virtual address mapped by the pagetable in d.
> > + */
> > +#define ARM_LPAE_LVL_SHIFT(l,d)						\
> > +	(((ARM_LPAE_MAX_LEVELS - (l)) * (d)->bits_per_level) +		\
> > +	ilog2(sizeof(arm_lpae_iopte)))
> 
> Didn't see this being used?

Yes, my bad, I will move it and the other one back.

Thanks,
Mostafa

> 
> > +#define ARM_LPAE_GRANULE(d)						\
> > +	(sizeof(arm_lpae_iopte) << (d)->bits_per_level)
> 
> Only used by the above print
> 
> > +#define ARM_LPAE_PGD_SIZE(d)						\
> > +	(sizeof(arm_lpae_iopte) << (d)->pgd_bits)
> 
> Only used by the above print
> 
> > +#define ARM_LPAE_PTES_PER_TABLE(d)					\
> > +	(ARM_LPAE_GRANULE(d) >> ilog2(sizeof(arm_lpae_iopte)))
> 
> Didn't see this being used?
> 
> > +typedef u64 arm_lpae_iopte;
> 
> Only used by the defines and the above print.
> 
> Jason

