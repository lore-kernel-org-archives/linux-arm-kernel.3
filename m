Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F096CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 14:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhmMdRL8qlR3Tvk3u8O3tOtlAqkQkVluaZ5zKHg+950=; b=ZiAW8vFQ6P6fizpUziMEkM4ESo
	opclF72nryckOJIvukusjH3/qDhQvhrPZhdoy+l7BhRNK3WYoznZcDAgJuITrS4cnxnUJI3erPG4O
	PkBMMZUbzWB6LEoLfGqBKt2l/AcKwtpb/yU5G1WDi2RSxzp3AJW1wVBymjkh2+9DaT8YExeGglVCU
	gJ03d4uKxMCei+MWPit16y4v8eSnD1E66sy340qioiC2OwnwH4SHHHkK6pPmuoJs9BNwQGAe0f43E
	ObzAdQ0bd8gaZMZ8J8BhGeDMH7eSIkdIU1LGi5xY7ABhk+AE/87sbrRF4KH1sPwt7S6Yk15DnlINX
	mPmKBbOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWhR-000000087zC-0ZoZ;
	Tue, 16 Sep 2025 14:30:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWhO-000000087yW-0pxN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 14:30:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45f30011eceso58645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 07:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758033024; x=1758637824; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fhmMdRL8qlR3Tvk3u8O3tOtlAqkQkVluaZ5zKHg+950=;
        b=tIMociXO6PHfA7GkLoPX3EmQXbICqQzdx2v36BKFFwrY5Ca58acu2jKrL8vq2xUxiB
         gonpx7uCRaxwxEQ7WlUifRFxMKioweEOuYqjtxhNFyZnGs4TVesY6rT0WkQXM8F+DowG
         i1nusBnoHaQnxu3LqfZjsw7ysCETZfYyz8u6midItreriEpka0InsyoL2iEYqJODtMUG
         aqMohBdGJBIoGUTLQBVCibazVrZ/6s8frFeiD59eMrN6GOMomrRq81Zmm7pIt9ngWakP
         aORlr/CeW63DyoEoTGT7WQ/D3WJTNclLPc8KCFfzedWtwZlw4ZCGh+ECBrjXUQd/nTql
         jzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758033024; x=1758637824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhmMdRL8qlR3Tvk3u8O3tOtlAqkQkVluaZ5zKHg+950=;
        b=LvgguV+PuCSCzdExVCtzvDDX5Ge7ECVHc72sZPT0rqIu+g59nmOODIluXe173a802T
         qQzp0BRIVr0YKv4WPiXESjfkhTgqFJnNkjIqoJX0a4aQRDJtlZMJex+imXauSKBfNilQ
         6jFGunAAPHB/9GNgR1SV6IXVYnR+Ty6DHfHODVK2TcCpsXDl0Hm1HY65nr05LzDGyq+B
         YIoJvj6hIjPtN+aTx+UYc/5TvCEpG3iKYmgP5ONfSUC37MWLOqkSWIbNPa07339Ewgky
         2CtoBDzESdJeMYRXdG+5je+2n6Bh1/0mc/0xxgxDU5lfYGlb3h80rQ+smgrzKBJCuh9O
         zJ3g==
X-Forwarded-Encrypted: i=1; AJvYcCXnd+KEDCAHM0WgN/rqfWGkL3kzJ9Gx25d5UTtRsEbflO5Jr/Ylrf6EjwjjjsYmiu9Fq2CDQFaHWEgIjOHwe98l@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5GgqUy32csXyseguQ81QVYx2z9inRsahmfUJAkqVmUYmRrFBL
	c3qngH/bHZZBrE5Wrw7IUYSH6zCFcxLdx6F09nYMf1Ib2hywE6K4gSfBGM0VluaHKg==
X-Gm-Gg: ASbGncsi/dWuVzbZOjSjUgAWZyFGVwB5OLVP4phgfIayXRr/v4VWEGOI4AMO3W9TIDF
	HKoIXkacldJN/1Y0QSIZe8eSO7nlzL9Q3Bclr6CyX88w9GexCjZjjXlUo9FgE9nj1dMQud1/OxA
	jyWvy3hhNJV6Twoex/LtgbVe3eK9LciRWkT4H+i21F3RqpqqwqCOIZK1aBdY6gXvy5yHlM/aJXz
	d5UGNHHB8c06LL/NTKdwyoC+cjsDzptyJEnIsKphXA6UNs6gSR1KXYuuJnK1B6pz7a1m4liOLeq
	S0HQ06eXcD4TLRk+74CU8AvyYNHoO6trB37sIaBjJnbJ7X5K4PFSj45y0sQSx+fhkeukr9weF6V
	51kX296tZ2dvDqmZOsRLixM+f7RYl7Sr4O22gXPAmuTMtlQsDCiUnBNS82WI/ut/PeV9QXgN9lu
	mTZusYP15szM2OnaE=
X-Google-Smtp-Source: AGHT+IGo1adSqugDdIZRQSzWcjgsYTglPxgYm/2Pf1a15n6l2x2VoKYdVxQeE+Hpg647GI1uAq/aog==
X-Received: by 2002:a05:600c:8b35:b0:45a:2861:3625 with SMTP id 5b1f17b1804b1-45f320ea2dfmr1944965e9.4.1758033024087;
        Tue, 16 Sep 2025 07:30:24 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdc967411sm340062f8f.46.2025.09.16.07.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:30:23 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:30:20 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 14/28] iommu/arm-smmu-v3: Add KVM mode in the driver
Message-ID: <aMl0fJJyV5sJKIKS@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-15-smostafa@google.com>
 <aMQlm9ucDtd5-15r@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMQlm9ucDtd5-15r@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_073026_258206_1DBBE081 
X-CRM114-Status: GOOD (  29.56  )
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

On Fri, Sep 12, 2025 at 02:52:27PM +0100, Will Deacon wrote:
> On Tue, Aug 19, 2025 at 09:51:42PM +0000, Mostafa Saleh wrote:
> > Add a file only compiled for KVM mode.
> > 
> > At the moment it registers the driver with KVM, and add the hook
> > needed for memory allocation.
> > 
> > Next, it will create the array with available SMMUs and their
> > description.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_host.h             |  4 +++
> >  arch/arm64/kvm/iommu.c                        | 10 ++++--
> >  drivers/iommu/arm/arm-smmu-v3/Makefile        |  1 +
> >  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 36 +++++++++++++++++++
> >  4 files changed, 49 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
> > 
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index fcb4b26072f7..52212c0f2e9c 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1678,4 +1678,8 @@ struct kvm_iommu_ops;
> >  int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops);
> >  size_t kvm_iommu_pages(void);
> >  
> > +#ifdef CONFIG_ARM_SMMU_V3_PKVM
> > +size_t smmu_hyp_pgt_pages(void);
> > +#endif
> > +
> >  #endif /* __ARM64_KVM_HOST_H__ */
> > diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
> > index 5460b1bd44a6..0475f7c95c6c 100644
> > --- a/arch/arm64/kvm/iommu.c
> > +++ b/arch/arm64/kvm/iommu.c
> > @@ -17,10 +17,16 @@ int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops)
> >  
> >  size_t kvm_iommu_pages(void)
> >  {
> > +	size_t nr_pages = 0;
> > +
> >  	/*
> >  	 * This is called very early during setup_arch() where no initcalls,
> >  	 * so this has to call specific functions per each KVM driver.
> >  	 */
> > -	kvm_nvhe_sym(hyp_kvm_iommu_pages) = 0;
> > -	return 0;
> > +#ifdef CONFIG_ARM_SMMU_V3_PKVM
> > +	nr_pages = smmu_hyp_pgt_pages();
> > +#endif
> 
> Rather than hard-code this here, I wonder whether it would be better to
> have a default size for the IOMMU carveout and have the driver tells us
> how much it needs later on when it probes. Then we could either free
> any unused portion back to the host or return an error to the driver if
> it wants more than we have.

I can do that, we can set the default from a config or cmdline (or
both).

Thanks,
Mostafa

> 
> Will
> 

