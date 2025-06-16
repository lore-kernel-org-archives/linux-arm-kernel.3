Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BB5C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kNU98GqvoY/2N+rHSgzZWQGmQpqcL99KyddV2L+Mps=; b=05AXICN7xLn1Evco/lQ+aPqxdh
	AWZW+zbw5A8yDZSi6Ah0+EGLyHh9OKHYZYqZBYVnFd79BAHulLs6hnQoJ4LG2tiALbpcTwM2xhF9f
	z98ofefG760YZa2btjO8KOo7SxsmktwxbRO2f6n/4rvTtinCFs/TTU6Pxv3A2/qY/+jh20z1o0T3/
	USWhXOLBm/enXjJah2T6jrP1LtIN3F3qe5ltBBH9q2OOL/gC6VhCpsAbz3kYKqCh/+BindVzgdTuC
	YlQq65wTCkv3/2Th0+95eB8Voc+9U7XWS41zPO783rO6l21BCeq4uohgFDVvimiTImTn2ECIz3xlO
	6vsOtbqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIMX-00000005hZA-4Bt0;
	Mon, 16 Jun 2025 22:31:34 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRI27-00000005fIs-37gS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:10:28 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-235ca5eba8cso60985ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 15:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750111827; x=1750716627; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0kNU98GqvoY/2N+rHSgzZWQGmQpqcL99KyddV2L+Mps=;
        b=KN2jhJ8ltCgJ/7Vu3Ds3sjC3vnmuAom4t4HmvlCMMWrP2+vMxcY5crE+o6kQZCHyJQ
         MobfGUBPN5iFWpWsLf483AbJyuLFHWSWKO19Ol1agW9Srzs2OGolJw4JVLl/nR+0P4HZ
         0a05rDGM8XNGyL0dEZarL3MLIjC2fKOvfQ6F/gBjJmvb1deUT2F77Ijpke3Y7mvPX7KC
         isNIN/eYXnRCJyoNQF2IExTZOumV4hM6eAl9jDrqFoJU7J34EYNgrVjfVXwz4LjfPrCQ
         izec9ZD978LA5Oed62UBuClVixg/rKYHsKuOsDrEdcLVaPgoDYuO2XroibmTzxdaKmnX
         sF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750111827; x=1750716627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kNU98GqvoY/2N+rHSgzZWQGmQpqcL99KyddV2L+Mps=;
        b=oUmYACjsoY7m6O5sUvryEgEbdv8nPJ6X+s8ihi1GKaUtt0BOVSanDqngbFkZm+4EDA
         RG0gYJNee4s9BkOZmbWEQGsKWqMzBX0PzrEnVBJTp6eKnTt50KxsFgG1I/YLMZTO7L4K
         QHt6f611ZGU9kE1fCkxicnPjukHgeDwXK02tHFM8mWEo+NQEOBcDTnQXNOZz63lwxOpM
         /PH0XMA1n79A2pggu7QCCKEDMmDu8b/vvpA3bMEL99H/UDonO6B25idq6uvuWywiCX5I
         huT6IfK9/3tLiP26OVfvp1Zk5V2SMuZojpnnopbC5TwSq6g1aSVwr1EKJogMtCy/E8aA
         RzJg==
X-Forwarded-Encrypted: i=1; AJvYcCUM3wiHKK/vTvu+s6ciQnHY/DAYX3LhfwpMWy2WUIqfXoM4lQ8DHsX99HUAjNoI8Y8vUwLebiD8D/+q1uq5+2xM@lists.infradead.org
X-Gm-Message-State: AOJu0YzakkYLpMToNIjdCstaZif5AekGKgthyokeHaHIwvi4lYCCVkMi
	QzpqXp7iGcTME6qQR63fHCCZxT4OBWIxw+WNUFLc2U5yS7e4fqAbAixOYz/+GlMN5g==
X-Gm-Gg: ASbGncuIsZJ5CzK6ED0B9ImdS3bnSOOrTLKV61hcVk7zdrV2SRI4/Bgb9Y3dOc1ngQS
	San7zkFIGdry2PbxKGZ/pB4ssL7Fw8+tR6gT10FBRU/WF39sZgFBOE7wI0DOcfCqivVQV8pF5Rb
	0IsekT/QPQVkYNlkkfxOcFftMWPtGR8vnDecB4i8P8ggRc4G4/v1lPvKpMIZTbjX3wbgt0IcvA1
	DhpIwWFTjD2UJfTM7QE0LOM0L6rqVelEokEzrx/w2xCzdoHTSsxGxFmYr6+60eLXUP86B1SVPzL
	ugzR2MQ3LI19ViuCDmeHydvGLm+pYT8MmibjrCskzLHGMT8vhxyYD9Z3ryFXmLbPfn7xnv7gd2k
	RAR06nS7XVadkyHQm8f99
X-Google-Smtp-Source: AGHT+IHafQhQzPRhJ3j9d6qdD5hPqdbdu9Gdsdh0mrYjgCf+ykHfOaUnI39p3vGID7jjfHRJysZXkA==
X-Received: by 2002:a17:902:d48f:b0:223:2630:6b86 with SMTP id d9443c01a7336-2366eef035dmr5556855ad.7.1750111826636;
        Mon, 16 Jun 2025 15:10:26 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de78e8asm66412495ad.132.2025.06.16.15.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:10:26 -0700 (PDT)
Date: Mon, 16 Jun 2025 22:10:17 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 06/14] iommu: Introduce get_viommu_size and
 viommu_init ops
Message-ID: <aFCWSZpFuhAweGdb@google.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <3ab52c5b622dad476c43b1b1f1636c8b902f1692.1749882255.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ab52c5b622dad476c43b1b1f1636c8b902f1692.1749882255.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_151027_785197_BFC4F133 
X-CRM114-Status: GOOD (  22.39  )
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

On Fri, Jun 13, 2025 at 11:35:18PM -0700, Nicolin Chen wrote:
> So far, a vIOMMU object has been allocated by IOMMU driver and initialized
> with the driver-level structure, before it returns to the iommufd core for
> core-level structure initialization. It has been requiring iommufd core to
> expose some core structure/helpers in its driver.c file, which result in a
> size increase of this driver module.
> 
> Meanwhile, IOMMU drivers are now requiring more vIOMMU-base structures for
> some advanced feature, such as the existing vDEVICE and a future HW_QUEUE.
> Initializing a core-structure later than driver-structure gives for-driver
> helpers some trouble, when they are used by IOMMU driver assuming that the
> new structure (including core) are fully initialized, for example:
> 
> core:	viommu = ops->viommu_alloc();
> driver:	// my_viommu is successfully allocated
> driver:	my_viommu = iommufd_viommu_alloc(...);
> driver:	// This may crash if it reads viommu->ictx
> driver:	new = iommufd_new_viommu_helper(my_viommu->core ...);
> core:	viommu->ictx = ucmd->ictx;
> core:	...
> 
> To ease such a condition, allow the IOMMU driver to report the size of its
> vIOMMU structure, let the core allocate a vIOMMU object and initialize the
> core-level structure first, and then hand it over the driver to initialize
> its driver-level structure.
> 
> Thus, this requires two new iommu ops, get_viommu_size and viommu_init, so
> iommufd core can communicate with drivers to replace the viommu_alloc op:
> 
> core:	viommu = ops->get_viommu_size();
> driver:	return VIOMMU_STRUCT_SIZE();
> core:	viommu->ictx = ucmd->ictx; // and others
> core:	rc = ops->viommu_init();
> driver:	// This is safe now as viommu->ictx is inited
> driver:	new = iommufd_new_viommu_helper(my_viommu->core ...);
> core:	...
> 
> This also adds a VIOMMU_STRUCT_SIZE macro, for drivers to use, which would
> statically sanitize the driver structure.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommu.h   | 15 +++++++++++++++
>  include/linux/iommufd.h |  6 ++++++
>  2 files changed, 21 insertions(+)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>



