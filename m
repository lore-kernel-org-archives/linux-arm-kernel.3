Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26B9C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dz5fCb8eEO+u0xeHbat1iXwZqnQiKYPkVzTkS17OKDs=; b=mB2Lf5XaIjne2PAdu5t7Ryxh08
	LsnSjNA2FwSOY1DbBrx/iHpo5L1sXC2k9hILfCDc/Z7PqGGouR8IiksyheIXMtqcf6nDdd7ezyUFi
	zR5WXjjaNWbgWxAheg/ntAJ37xfPHy5jUUnmBQTPc1xbcc4ehp9zbirdNTGtaywZJgYurZPZuiM37
	rdJsXpWzPJKsFvCX7ZYFUtRi6nlPRMfTmsBdvEqABse7lEgq0kVq1854HDuX6voe6fZPsnmiIXE+p
	8i++uD+yq6RbmEB2fjA1L1jCI6iAKgOIdTGHVIND7vuSK3Cb/KiVFH7Pd3gq1fDNrJ17vdD03hufd
	1ShVz99Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SXl-0000000CrZz-0Qfz;
	Tue, 01 Sep 2026 17:45:09 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SXi-0000000CrZX-1TN9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:45:08 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-93900ed2925so18892285a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 10:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788284704; x=1788889504; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dz5fCb8eEO+u0xeHbat1iXwZqnQiKYPkVzTkS17OKDs=;
        b=E0Ori3cyH4QYNcur6xmJLK3tqYy+U0PpI+7NTEY4U800fSr2tS+JviEfyNGY4yt4bF
         sQHklAvcur39rU/CwkDbfmTyMjNqXuP5C7pBagwkt/Gp7iYXXPmzW3UOboGy658FNPk4
         myQ2nhfewFRoe9c4ghjAPFJn1bk5DP25gGBgprzOWrNTp72oWheKKG/fWA3LglVVia6E
         iwsHOhNLi5vas5nkiMWXiDDNI7HFYNXoSjntDh3vQKQf/hw13G4hdM45P2fa/7WV/KXO
         RbrK3Csu+z/AveF7UUA5KaGsYOv6LmJIhLAGw+Y6EcRSDTO0K8YpMdTjLC57qYPvH/np
         XpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788284704; x=1788889504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dz5fCb8eEO+u0xeHbat1iXwZqnQiKYPkVzTkS17OKDs=;
        b=dFt5Sqwwq2r4cuiGH0Fr8RBVIcGt5lNxKEGtlZueR68zG9QIKmK2xCDgm+gyw8+Sr6
         V2C84TOng5943f7MVe8ypP8kgKX6ug3iG3Cyc8zcm8kRj8TA8tdwzOCMXkZIH2jnZonU
         k4mA6ZFI7XZojfnD4wBzsBmw5MM26lyknPwv8Z4F5/vVzFj8ujXaFbgJ4X+88C68lTt+
         NcfdsBknlEB99+eFTQwkCpeVvxRqRd301VByTrUwfAfMeXF1W4jWCj2G8OlVLwko4IPp
         HlUF3bZrJ0+3XWDfsO/r0jgCFrZZmXxUdxpMwWZd8f1S0j2coH1V3LYC/865W3kDKSJU
         Uh2g==
X-Forwarded-Encrypted: i=1; AHgh+RqAH2CfYWpCN4Dflm+EPiArGbVyIIRoRCu+4FzgX2feq4L1JFSlSfzDkc17ulMKqxdJ21e0u4T566ZAhyuD4P62@lists.infradead.org
X-Gm-Message-State: AFuF++lxsK39i/afrKA3/P7D++6N3kU9rtZboHSb5cxhf7S3O2gzgfcf
	k2SB4gYaf1lDWKs2zuHsKP/BmVkXolXSmxmrvAjkwsPFb+6NQ6/gNBbOcHdZFQ33lVc=
X-Gm-Gg: AR+sD12jEZlod5VmSoom/Kh8kCeDhqa8aYvScg3zaCrwfWH9Ax97t+6ZEp1jpo/LNzc
	PKr00U/Qxy5WhfK10X09gdFGH+wqmc6ixPI3/IbDPvHFGjZp8uvxwLwcgsHLtsDBct87a/EL5hk
	oCw+roYSXlgxC5TX0XOnsqh3GOBuchww4PTvUg54meeToEduMqk07wvOIiHmu52VwO5yfjD8n/p
	+OhWEdyX93dtAkJ7iR6/L+z3snoU1yx1f6nY/YG4jQxkaoBF+Omg62T8BJgj7O/nLqFwXBJwlTZ
	fx1i/unKU7x5k+zP0jyV425c0uIioduF5hdNSsh0for9tMGh6FfI3yHN70YyX/wNHbTjU0bpVuS
	S8j81WzViKgamGyfkWjfzuCfQzBsqrvQ9s6DBqr0eeL4/lXgKQ8XgL3Jk8uXlTce5mTlv1M7eB/
	j9peFnMTtKeNh2dvczQehjTxLFDOtlkKrtz1wulUmjKvKUMVky+nUXblTQZGcYLijAO3OUfPccK
	fkBE2Ca+feD6Mc7anrvJqE72mtpPzUflTj8n5IeLIMXaA==
X-Received: by 2002:a05:620a:2b90:b0:939:3712:77df with SMTP id af79cd13be357-939480e4a93mr1404504985a.21.1788284704506;
        Tue, 01 Sep 2026 10:45:04 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917247209sm1093584585a.17.2026.09.01.10.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:45:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1SXf-0000000C5Bj-0yOq;
	Tue, 01 Sep 2026 14:45:03 -0300
Date: Tue, 1 Sep 2026 14:45:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260901174503.GB2847102@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <apcHoHKGoI7WNFXp@nvidia.com>
 <apcI6dnRaGRNdzN1@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apcI6dnRaGRNdzN1@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_104507_717322_114F89FE 
X-CRM114-Status: GOOD (  27.00  )
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

On Tue, Sep 01, 2026 at 10:18:33AM -0700, Nicolin Chen wrote:
> On Tue, Sep 01, 2026 at 10:13:11AM -0700, Nicolin Chen wrote:
> > On Tue, Sep 01, 2026 at 11:34:45AM -0300, Jason Gunthorpe wrote:
> > > On Tue, Sep 01, 2026 at 03:36:37PM +0530, Aneesh Kumar K.V wrote:
> > > 
> > > > @@ -463,14 +460,13 @@
> > > >  	vsmmu->vmid = s2_parent->s2_cfg.vmid;
> > > >  
> > > >  	if (viommu->type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3) {
> > > > +		if (arm_smmu_is_realm_viommu(viommu))
> > > > +			return arm_realm_smmu_v3_init(viommu, user_data);
> > > > +
> > > 
> > > I think the realm vsmmu is going to require a different info struct
> > > than the normal psmmu case, isn't it?
> > > 
> > > If so it needs its own enum value.
> > > 
> > > It would be nice to see a draft patch showing how the real vsmmu works
> > > on top of the RMM spec for it. If we are using a viommu object then
> > > non-vsmmu case should be identical just with an option in the info
> > > struct to not create the vsmmu object.
> > 
> > Actually, the PSMMU-only viommu object in this series only adds a
> > type with no viommu data structure.
> > 
> > I've drafted the vsmmu case on top of the series, so it would add
> > a structure reusing the same IOMMU_VIOMMU_TYPE_ARM_SMMUV3 with a
> > flag:
> 
> Oh. I replied too fast that I didn't notice this is under the
> standard IOMMU_VIOMMU_TYPE_ARM_SMMUV3 used by non-secure vSTE.

The original patches were OK:

@@ -1055,6 +1055,7 @@ enum iommu_viommu_type {
        IOMMU_VIOMMU_TYPE_DEFAULT = 0,
        IOMMU_VIOMMU_TYPE_ARM_SMMUV3 = 1,
        IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV = 2,
+       IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3 = 3,

That's where everything should be placed, including your new struct
above.

Jason

