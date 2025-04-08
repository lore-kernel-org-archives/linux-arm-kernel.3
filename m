Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3C5C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50rhH0P4C6X37y8/XrUykTYL68bxlRnwKFJu2ki7lY4=; b=P+I06aca8RtwXck8S5pQZpYsko
	3USPDZ95p8ShlwntlGK21P3xb5C5xeSstNMIb6DYh/Pek+XxtgLWMgMvqfbd2XAOCYZ4XrDzr9Dy3
	buAeoT9SZ5NhgRFXoeLH58gKM/uah/1/D+Utagq0Zy1Odj15m6+s7+kpX5UZ0tjAVp7OYeOc8SLoY
	dvSK1BRIfxRErVrZPlKFTZffwSKgif+LjMD1M7y2Wi48UnjQWrZ5dvw+7r3EiBOpqjQVeVtzNUIeY
	sUb+0fpP2QN++beCCmtpyBDeehATY0uzAUXqIjo2ZbwNJwQ6AAJ5QjCvh7M83qsS5pi6UN5S9uhHf
	8/dG8mFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29sl-00000004MuN-3I6d;
	Tue, 08 Apr 2025 14:24:55 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29oz-00000004MBL-3QSA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:21:03 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2240aad70f2so250455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744122060; x=1744726860; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=50rhH0P4C6X37y8/XrUykTYL68bxlRnwKFJu2ki7lY4=;
        b=4r35LXomADhZXNs4RHVbYN+vIuF3dHcvOTbwx6Hp43h7wjmhb2/OfXDq8plXO05dmH
         8FbBbZDRZo1O45akv7ZqdrVdN+I0d85ZaZXGn6ao++aM8DSsvGmoCMpw4zZGyn0MeZkP
         8THA59NaQo0RDB5EBx4DQVH1r8FTu3Ugb+YqdkkgGNNQ5BRo54E35U/gqf2pqXg28OdO
         Tv+u/vJDlONS5jsxrNdigSPiUEwzwiNjGa21geuwyslYlJJPAYh3A/a+CnWEWxT10JlY
         LJ09KzGLNKaP2HaTfxGKSZCPKndVi8rsMf05+I8TMnIJHogLjhWn8B+c0xZguEUuQh/v
         4ltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122060; x=1744726860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50rhH0P4C6X37y8/XrUykTYL68bxlRnwKFJu2ki7lY4=;
        b=jR3rX0F8ngwBYLGuGHh2jw2Z82uxhxbY7964CtF2W+RBShQm0yTUk716WsKvBcEBBg
         hcgqYD5+eneYmnG/IzQgBnf2CQTGHTlGLvDjs4ZqKM5Pv9BAR5txO7mvTl5SfmISjgQW
         rW2TjOxinCn3CBchpOGNWzSzpuZZODQ7j7VNtBwCFYl/XStHfUU5dkAogaEVP5PDJNbl
         yq4UXrAqxxxSkTvVw8650wO5jYTr/rA+6jmKTdgOP5li/Sgvj+Hp6kI4WR2ULOhjQwWJ
         ic5DOXpMtM12GZEeN4lf7IA8CKXOj1n7nJVRz7w+6JDcMKvtwBg+NjqoTDVwNgntFjA1
         2CbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAtJWjQGb5sDLHs/jTbW0SPQ/iI6gDG0z3rgUgvUBHz3t7fdnSjuvAtO8ojTZ7A7QG964HJpPgwQXIhDD9W8Ev@lists.infradead.org
X-Gm-Message-State: AOJu0YyMkkHHSup86/e2oNGySmNN95slvfP8mMdTdZg3WDA/9YPWapC4
	0Un1bG74+ob1HuI4aenq4IYDJ2FSYI1TBhZMiL8InjU8BOfZFsEL41nMgbS3nA==
X-Gm-Gg: ASbGncuHGCpaX0OB9nUE3TY/HFtO5iOj7LaQi/VLiJyu+MPqZ2H3VN/Gf/wnuxKxhgv
	8wUXS+X6StWN6u+utgqtAam36w4H2oYivZVBUSyoPsXdJ6ix3opejkj/ch6HBplbYZP+M/eIvW9
	ZFiHBVIZZxi1hhj0fEyUHb4he6h837p5GdpFsfGqIRGwru30+on3waXR5R9/o+ZJ6/7bI4/Wi+o
	wXSxJoWXhTrp2kiq6/0Z1lkkRtMC3MTCswf6YpW/r99oAYzz+JGEGkMGoZxW6M8aNnaa6ROZn+8
	kp2IffYhIiunRU1OljSdveiBX3Ir09DFIgqVsbCrxKujR+ZulZJLB37aVtFJr0ruq9euFw60N6M
	umW8=
X-Google-Smtp-Source: AGHT+IE4iRRh4X4YLUZunHgPf+vwd/X5Yt1E655M4r0NMhwn9qwL0MFydS3s1KuHykiWXHRTrO7ZHQ==
X-Received: by 2002:a17:902:db03:b0:20c:f40e:6ec3 with SMTP id d9443c01a7336-22ab7136fa8mr2614455ad.22.1744122059590;
        Tue, 08 Apr 2025 07:20:59 -0700 (PDT)
Received: from google.com (188.152.87.34.bc.googleusercontent.com. [34.87.152.188])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc32382dsm9155045a12.28.2025.04.08.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:20:59 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:20:51 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v1 3/4] iommu/arm-smmu-v3: Decouple vmid from S2
 nest_parent domain
Message-ID: <Z_Uww4PdJesOoA8N@google.com>
References: <cover.1741150594.git.nicolinc@nvidia.com>
 <0429d554fb0f54f6d79bdacacb3fb3e7877ca8f7.1741150594.git.nicolinc@nvidia.com>
 <Z_OuLJ7RGnChDckY@google.com>
 <20250407165220.GH1557073@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407165220.GH1557073@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_072101_853304_FACE60CF 
X-CRM114-Status: GOOD (  21.56  )
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

On Mon, Apr 07, 2025 at 01:52:20PM -0300, Jason Gunthorpe wrote:
> On Mon, Apr 07, 2025 at 10:51:24AM +0000, Pranjal Shrivastava wrote:
> > > @@ -381,15 +401,24 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
> > >  	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
> > >  		return ERR_PTR(-EOPNOTSUPP);
> > >  
> > > +	vmid = ida_alloc_range(&smmu->vmid_map, 1, (1 << smmu->vmid_bits) - 1,
> > > +			       GFP_KERNEL);
> > > +	if (vmid < 0)
> > > +		return ERR_PTR(vmid);
> > > +
> > 
> > Probably a basic question, I hope we'll have one vSMMU per VM? 
> 
> A VIOMMU is tied to the physical SMMU, it cannot be shared across
> physical SMMU, so this is the right sort of way to get the ID
> 
> > Even if that's not the case then the VMM should take care of
> > invalidating contexts of all associated vSMMUs anyway? (Just
> > thinking if we should allocate a VMID per VM or per vSMMU)
> 
> If the VMM wants to present a single vSMMU to the VM then the VMM
> needs to replicate invalidations as required to all the physical
> VIOMMU objects. This will prevent using the HW accelerated
> invalidation paths, so I expect that the VMM will have one vSMM per
> physical.
> 

Makes sense. Thanks!

> > Nit: Does it makes sense to create a helper like `arm_smmu_vmid_alloc`
> > and call it here and finalise_s2?
> 
> Maybe so
> 

I recently saw Shameer's patch [1] using a different vmid allocation
scheme, so I guess it's okay if we don't share this function..


Thanks,
Praan

[1] https://lore.kernel.org/linux-arm-kernel/20250319173202.78988-5-shameerali.kolothum.thodi@huawei.com/

