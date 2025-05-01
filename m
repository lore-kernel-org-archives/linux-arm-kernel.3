Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB20C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 21:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9r6A8pjeBdT9CIMooiOuLDzT6g9hy9vPLljDSfADzUo=; b=uuRYvYAIscjzkVqedQ3dyd3b37
	2FNM+LUSu/ceQVHVncEw6M1LT6WFR/Vr17Oa5pl6gLvzQZU2WXubgcIv0CrBJ5OYldKsJV8Sps98d
	L2R53A2zXIel+d84ymosjx31t/EQGJdgfaQ8fL3aO7rYcPSqatd/GUNUePktmj4N4QgT9ickW0LYt
	UMwzbHTa8SYSyKZrW41Vu7KaTT+etlv7DjlvaOfPEJYegfoXNdYV3yhmOkA2Z2u1DC/EUEEmLOtym
	Vzx90ITXI7T51mtn0omAckxmHXqn6kKR29WifBMErB6YM0TGr5xJdZLRwltjvuiMZdlytFz8P2UCJ
	d4gUxtZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAbmM-0000000HH59-2AFo;
	Thu, 01 May 2025 21:49:14 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAbjx-0000000HFNU-2nFn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 21:46:47 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2240aad70f2so60805ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 14:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746136004; x=1746740804; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9r6A8pjeBdT9CIMooiOuLDzT6g9hy9vPLljDSfADzUo=;
        b=lAm7w0AgDmLM9GrXmRVJmEwtEE0LFjxbIC3PH5rLpXnAnv+GQ/iBnr8uK5tS2LkMfu
         PKps8Zjl/9aR/F/tp5d4bU1VYIdSfMPQPLUJYlimHky4WVzCnZLvy8+kMd3OUT7GS0GV
         Ua7p0YmWnfiKfhyXFFVFpVKaeSY8vHQxFGy/myn+cUHmc1aKkPQ0wmyIPt1QSYclYeJJ
         2KRKh2ZXmpHOHAQKRW+guDyroiCiZuGY9XbjDnfY+VGDzYdVDQkSdjfIB+meQZT6uX/l
         kW7XLxsX3eVtTQxxYQ+/T6CMUHBDcdYNvS3LMW3KYi++d5e80bUIX0BXmGwJ8vzBaviT
         mbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746136004; x=1746740804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9r6A8pjeBdT9CIMooiOuLDzT6g9hy9vPLljDSfADzUo=;
        b=LiomkeNc8Z5zDoe5DX99JO+f0roosbxc/zS2nnBHK3Xpy86Yr+8HMLAV+cOEgDcNPo
         K5ONU3lu0ti081e+Yvg69J+AFkvm3osYj8E5Hyws9qebsZOitTC8yvBn3cu4R1vlMDpX
         Kn7ree68BMhK0xqYW0DJqYjupz9OE0SXqeva1AaqGntEA5cLDTjD/YeuTuGkvrSZgtUg
         kr5NTHsN7ybrEDbdmRKbxj8jmpmf91ZlsP9b3xOsbIof1OdNVf7FqXDrP+nSdmPqCrBk
         ofILhMZ6hlh70pEfwL92LtN10gZStbSBVLNUsYeNcOpP5GpLRK8OZE0mpNU5PbSSmD8b
         s5Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVnCap6ItYNHE2pb/rLhrKQZ+qxosKycOYBamYwV4cklZOOGI9Om3FPmsRtZWjK0jX0ekKK0eZBnykb0qoMxlua@lists.infradead.org
X-Gm-Message-State: AOJu0YwPTJR6KdBJm13NE/R3wjQ+L7t+jKyTTbXLNz3xNarYeclU7BvR
	3Nt1JtCNnSa6FUn3zArtyxBf3iHZryxDOyHvf4LN6ZCtlQEvj6TOTb+JpgroTQ==
X-Gm-Gg: ASbGnctUMaVac4OgloyD8bGe0unQRbD8MBdmBPJGyQqM6yVJ9ECE9axHy+vAPMLsz+y
	uPew1pPCk9wehU/BLgtVEA6Ln+ZxXRoOmDg8vlSNUQgfUp1eq2VtzGQnDam3FBp7gFY48JP5vto
	BiSDvmX+fOsyVV99Pn+BIDAXHERw/v6u2NPR3AqNKK4WxdwJEOa9coiIUPaotK0UkdbzDTlGxU6
	T3CwsMlWGkROvRvXiW3zAPHeKMeGXVWZWzBG6d8TlGitWCxIhamdmZGnQRzZE2w9Ryn7x1ClwCh
	7nZZzZwHfWlRncVlmxPgkTaIF3/Va4qOUVnl69uA9XxFcloHdS7de9A1M1ZIUCUJCPvgAPg4
X-Google-Smtp-Source: AGHT+IFwvKnjZtLoQ4bY59+1gUvZDTEb4mowMJ0K70YKwsiOKp0lgYtmDTG0AdFCxAuctUKRuXVbug==
X-Received: by 2002:a17:902:db02:b0:21f:631c:7fc9 with SMTP id d9443c01a7336-22e03c81070mr3938175ad.0.1746136004118;
        Thu, 01 May 2025 14:46:44 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fa8611424sm129648a12.73.2025.05.01.14.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:46:43 -0700 (PDT)
Date: Thu, 1 May 2025 21:46:32 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 21/22] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aBPruHaehW4yU-ez@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <b81b2332f793a9ffccc528d821f2ed3ac051f9e0.1745646960.git.nicolinc@nvidia.com>
 <aBKdMaFLPFJYegIS@google.com>
 <aBKmk6PNFreeyfLh@Asurada-Nvidia>
 <aBLGUby2dIiYCe7S@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBLGUby2dIiYCe7S@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_144645_708283_82BE845A 
X-CRM114-Status: GOOD (  29.72  )
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

On Wed, Apr 30, 2025 at 05:54:41PM -0700, Nicolin Chen wrote:
> On Wed, Apr 30, 2025 at 03:39:22PM -0700, Nicolin Chen wrote:
> > On Wed, Apr 30, 2025 at 09:59:13PM +0000, Pranjal Shrivastava wrote:
> > > >  enum iommu_viommu_type {
> > > >  	IOMMU_VIOMMU_TYPE_DEFAULT = 0,
> > > >  	IOMMU_VIOMMU_TYPE_ARM_SMMUV3 = 1,
> > > > +	IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV = 2,
> > > > +};
> > > 
> > > This is a little confusing.. I understand that we need a new viommu type
> > > to copy the new struct iommu_viommu_tegra241_cmdqv b/w the user & kernel
> > > 
> > > But, in a previous patch (Add vsmmu_alloc impl op), we add a check to
> > > fallback to the standard type SMMUv3, if the impl_ops->vsmmu_alloc 
> > > returns -EOPNOTSUPP:
> > > 
> > > 	if (master->smmu->impl_ops && master->smmu->impl_ops->vsmmu_alloc)
> > > 		vsmmu = master->smmu->impl_ops->vsmmu_alloc(
> > > 			master->smmu, s2_parent, ictx, viommu_type, user_data);
> > > 	if (PTR_ERR(vsmmu) == -EOPNOTSUPP) {
> > > 		if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
> > > 			return ERR_PTR(-EOPNOTSUPP);
> > > 		/* Fallback to standard SMMUv3 type if viommu_type matches */
> > > 		vsmmu = iommufd_viommu_alloc(ictx, struct arm_vsmmu, core,
> > > 					     &arm_vsmmu_ops);
> > > 
> > > Now, if we'll ALWAYS try to allocate an impl-specified vsmmu first, even
> > > when the viommu_type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3, we are anyways
> > > going to return back from the impl_ops->vsmmu_alloc with -EOPNOTSUPP.
> > 
> > That's not necessarily true. An impl_ops->vsmmu_alloc can support
> > IOMMU_VIOMMU_TYPE_ARM_SMMUV3 potentially, e.g. an impl could just
> > toggle a few special bits in a register and return a valid vsmmu
> > pointer.
> > 
> > It doesn't work like this with VCMDQ as it supports its own type,
> > but for the long run I think we should pass in the standard type
> > to impl_ops->vsmmu_alloc too.
> > 
> > > Then we'll again check if the retval was -EOPNOTSUPP and re-check the
> > > viommu_type requested.. which seems a little counter intuitive.
> > 
> > It's just prioritizing the impl_ops->vsmmu_alloc. Similar to the
> > probe, if VCMDQ is missing or encountering some initialization
> > problem, give it a chance to fallback to the standard SMMU.
> 
> I changed to this and it should be clear now:
> 
> +       /* Prioritize the impl that may support IOMMU_VIOMMU_TYPE_ARM_SMMUV3 */
> +       if (master->smmu->impl_ops && master->smmu->impl_ops->vsmmu_alloc)
> +               vsmmu = master->smmu->impl_ops->vsmmu_alloc(
> +                       master->smmu, s2_parent, ictx, viommu_type, user_data);
> +       if (PTR_ERR(vsmmu) == -EOPNOTSUPP) {
> +               /* Otherwise, allocate an IOMMU_VIOMMU_TYPE_ARM_SMMUV3 here */
> +               if (viommu_type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
> +                       vsmmu = iommufd_viommu_alloc(ictx, struct arm_vsmmu,
> +                                                    core, &arm_vsmmu_ops);
> 

This looks good! Thanks!

> Thanks
> Nicolin

Praan

