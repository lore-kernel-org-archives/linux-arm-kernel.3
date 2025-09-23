Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D432CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7gFiyv7OnRS5nGrN+3NtlLFQvUag+pzI6L45ZXC1s8=; b=G+UscXOxaG9L8kvGTWzuGrVItJ
	ZnuHsU6cko4DC7IP4vYvFCtodnWYPJ4a4dHypFK4OOWhrV3RNvY7moTfbm2/JUlrWR2oY+0yZbu2E
	KvgaZmKil8DZ0ddLUBgTf1jl4boklFIRyLoh/frPIclq5OhU3fNmiQdp12nQb9fZoSlE/rzS02YyD
	FOcN5yrBep41bBW1zSaxz72sAeS+VbBeZlhboXNWff9vr2EBTFwpMWmQUERZFuD38wDcxdNea1mk1
	AyJRRKm17ZNyFUwwAaJwQYToyp0yvFFAQmZQWAZokRQbjgjxpJzbU2MBjFGiHqAwLQF17v/c58g9R
	EJbuXgbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v147Z-0000000DoHJ-40wk;
	Tue, 23 Sep 2025 14:35:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v147X-0000000DoFJ-3GEN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 14:35:56 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-46d6080d3bfso56835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 07:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758638153; x=1759242953; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w7gFiyv7OnRS5nGrN+3NtlLFQvUag+pzI6L45ZXC1s8=;
        b=y/E/MSWHQuYFatEGfk9+NLOYmzqvsb5dPHMLl1hXPdgnYAShQazh1+qYuvZxMuzpNW
         XxzRQCsWgXb+VLDWhst8hYr1XWcagppMZlxzY81a+2tZlc+Ul7D/CufQ0ZVHXT3gi3G3
         39Auc6JcBIqH/exDIQqscie+MuCzVBMDVOnT/aFnfIVuOi4W7F2Q4+rexgPMtO0tqgfP
         E1oIP7enZNywTOr8qtfaiJtFrrKiiKlWQHkhJJDtQ/ez6bAltOfQSfYjIygCKQLxxv7u
         nf/Qe7x7pNH/qM+9OMthCFb8jAOJ5zenrPu40KRQz5RH0uWbHgaqIbN84MQGe/nG0C9f
         XzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638153; x=1759242953;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w7gFiyv7OnRS5nGrN+3NtlLFQvUag+pzI6L45ZXC1s8=;
        b=ez4LNoZ/rLD/4T52xb4J7UUNJlqyw0O2ByOJ1/kRDN2wenmKE8fTbWS4Szi+ZBkV05
         0n4ICyRYkNKMVEt5Vn5uhwOWJNAAsFAH7AFdOMxCvBmI7M41I1qQ1+euSZuAz5MhnsXp
         NwUjTFbEZRIA7kPdi9lSjskY61Vdq6HGXV0rFuGyXLvQVCalLBUeKVPAfn38c70D3QNl
         zVTwO7uiEBaf9dfalkaxJTEMC7Gfijjk6qiFcys2WD0B5z0HcN4dSeVqgcjd1DmfeMW/
         yD3sBkk21qfXeZfTFG67DKxG2j9CkOj+IDd6iWVQOH5cmZJOafVLSBDVloTv7tNqG6gg
         CayQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBtVVbRhzrhuA76wacH7N1tY2qUIpUF5L75D5su0w2XGSii0hFNuD6m13mt2n5wg968kW4UHAVifSX/cX6tD3e@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmy48V+0yzZ7YuOaooEEOBpJ4uV7tn0mGSfrHfLu4nMFwlv+nt
	IuzEgaq71J4iRGswjQtzGNhgBYp7Uc5YugSrehztzRF1CI3EpXNSayEMMpsLbV+vrw==
X-Gm-Gg: ASbGnctXITcZXnXcZC2f13t9D3HILBN/DA78T3GBzix9Uf10A8OSyaay0fLn2rWSdOQ
	5ygEmeAOymQBGTyZlUuBzjnJA18FHeux949Q+wXhNBLYPomXkaSROYuVbTtBbKGzczCAoB5rXQc
	a/aRvfG5/tSeA55sLzFZts2sSJM121lNkoLer6VpCRGIiuTO5XkKhSXyG/3XLNd/rcxBDIOjb6s
	52ulEzg71cv5S/6Kcd06RwJ8nbGbak6D19A7EwV0VmJuzorLNz+LFPcUHBSb/OLNj+mt1CEIC6L
	jF81sqtuC1vEg+jWb0FjHQuLmTPmKA0Ki1+8lNYudTQARV0d6WOEVsJL6UTQkTJW5TSQpu3PB5S
	0Z/On05wFaeLJbEhUlP2Z8zhPFXq3GA+nZloI3/pQvoF3D6fzJT7bc1rBoLS7ESHipRM=
X-Google-Smtp-Source: AGHT+IFvUZC8hU4aVaM+B2ZVSTNY2pCK/nLLcGd0XFRXs64IKLx9ZNGK9gnrvBoN85r9vD2bqa+nEg==
X-Received: by 2002:a05:600c:a40a:b0:45f:2e6d:ca01 with SMTP id 5b1f17b1804b1-46e1dc7b863mr1452625e9.4.1758638152887;
        Tue, 23 Sep 2025 07:35:52 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07408258sm24481309f8f.19.2025.09.23.07.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:35:52 -0700 (PDT)
Date: Tue, 23 Sep 2025 14:35:48 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 15/28] iommu/arm-smmu-v3: Load the driver later in KVM
 mode
Message-ID: <aNKwROPzDCWgJBGQ@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-16-smostafa@google.com>
 <aMQmA9cLaeYWG5_C@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMQmA9cLaeYWG5_C@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_073555_830504_146935D2 
X-CRM114-Status: GOOD (  31.32  )
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

On Fri, Sep 12, 2025 at 02:54:11PM +0100, Will Deacon wrote:
> On Tue, Aug 19, 2025 at 09:51:43PM +0000, Mostafa Saleh wrote:
> > While in KVM mode, the driver must be loaded after the hypervisor
> > initializes.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 25 ++++++++++++++++-----
> >  1 file changed, 19 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > index 10ca07c6dbe9..a04730b5fe41 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -4576,12 +4576,6 @@ static const struct of_device_id arm_smmu_of_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, arm_smmu_of_match);
> >  
> > -static void arm_smmu_driver_unregister(struct platform_driver *drv)
> > -{
> > -	arm_smmu_sva_notifier_synchronize();
> > -	platform_driver_unregister(drv);
> > -}
> > -
> >  static struct platform_driver arm_smmu_driver = {
> >  	.driver	= {
> >  		.name			= "arm-smmu-v3",
> > @@ -4592,8 +4586,27 @@ static struct platform_driver arm_smmu_driver = {
> >  	.remove = arm_smmu_device_remove,
> >  	.shutdown = arm_smmu_device_shutdown,
> >  };
> > +
> > +#ifndef CONFIG_ARM_SMMU_V3_PKVM
> > +static void arm_smmu_driver_unregister(struct platform_driver *drv)
> > +{
> > +	arm_smmu_sva_notifier_synchronize();
> > +	platform_driver_unregister(drv);
> > +}
> > +
> >  module_driver(arm_smmu_driver, platform_driver_register,
> >  	      arm_smmu_driver_unregister);
> > +#else
> > +/*
> > + * Must be done after the hypervisor initializes at module_init()
> > + * No need for unregister as this is a built in driver.
> > + */
> > +static int arm_smmu_driver_register(void)
> > +{
> > +	return platform_driver_register(&arm_smmu_driver);
> > +}
> > +device_initcall_sync(arm_smmu_driver_register);
> > +#endif /* !CONFIG_ARM_SMMU_V3_PKVM */
> 
> I think this is a bit grotty as we now have to reason about different
> initialisation ordering based on CONFIG_ARM_SMMU_V3_PKVM. Could we
> instead return -EPROBE_DEFER if the driver tries to probe before the
> hypervisor is up?

I looked a bit into this and I think the current approach would be
better because:
1- In case KVM fails to initialise or was disabled from command line,
   waiting for the hypervisor means SMMUs may never probe.
   One of the things I was cautious to get right is the error path,
   so if KVM or if the nested driver fails at any point at initialization,
   the SMMUs should still be probed and the systems should still be running
   even without KVM.

2- That's not as bad, but it leaks some KVM internals as we need to either
   check (is_kvm_arm_initialised()\or kvm_protected_mode_initialized) from
   driver code, as opposed to registering the driver late based on a kernel
   config for the nested SMMUv3.

If we really want to avoid the current approach, we can keep deferring probe,
until a check for a new flag set from “finalize_pkvm” which is called
unconditionally of KVM state.

Thanks,
Mostafa

> 
> Will

