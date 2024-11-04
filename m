Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16593D132B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 11:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FO1agiXMxzQL/SuKVLuIwXDRS5cGYyeniXGwD0AzOT4=; b=LUPhI6KKvLVaqFiCs5FDySF5yX
	6I7BjOur1fmi9KP8dvWxsf/t3OiNWprGWTFTboo92zc7knXGaXM3HfEW7ewzJOM6Lx3AmFnQsPFqb
	L9gDjf2QbCis8aFWLINNSyM4ybix22d0spsOJOFHVNpKiV8N2QatpqUJVyvc1KzHlHdjOEq0Vvd1x
	OjUDrHFbfVYUobjg6xXROf7+XGFCWYMSSTPzMRj66EmczezQfhMY8JYKpBezQPpxH6UF45IJF3PaV
	HuPWK5OBhtzvbdln2cAHhksKAeNwYE80NG9btURsbkYmdgwgn5hxPv/XU7aBJtkuXtqmR+WG4g7oU
	qSgHq7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vVU-0000000DZxz-1BHq;
	Mon, 04 Nov 2024 11:44:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vK9-0000000DXZ9-1eXV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 11:32:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E32215C5535;
	Mon,  4 Nov 2024 11:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891D9C4CED1;
	Mon,  4 Nov 2024 11:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730719964;
	bh=8ZO8QMi8eDQyeTvFBdXQdNHTOJOfrtdUJdubuiwZ26E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eMIpvvSlZ8E4uxwZ7RDJG/WK491fOg5D1/i7OF8DAZMparvrwh25tgA94GY1Kvi0a
	 t8TVXxZfxukkgbQszt9zut5dFN6DkJA3yGO0A9NYJIVCH7nogxxgEpEyMNHGhFY3VR
	 0co6qii2nN7EhEGZcSGisc+1zvNrlLGAnoTr+SVonFeO7N5Uo5g885gGZg6wy+ezQg
	 BLsGOKpWXVSR8wS2wTG6Sdh4Js7Hrh3eDOF/51e3083RdUBcZQPbTHhgoHrum0M1wW
	 g+V+XsUY+35ZgGm6tZvBFewKdmu/BspsFIy9/BTHHEUxATypIUSYqmu3VZc8R8jpRc
	 lSRPC1aMRuYnQ==
Date: Mon, 4 Nov 2024 11:32:39 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
	patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Remove split on unmap behavior
Message-ID: <20241104113237.GA11481@willie-the-truck>
References: <0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com>
 <20241101134005.GA109739@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101134005.GA109739@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_033245_503657_0FA08BFE 
X-CRM114-Status: GOOD (  20.97  )
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

On Fri, Nov 01, 2024 at 10:40:05AM -0300, Jason Gunthorpe wrote:
> On Fri, Oct 18, 2024 at 02:19:26PM -0300, Jason Gunthorpe wrote:
> > Of the page table implementations (AMD v1/2, VT-D SS, ARM32, DART)
> > arm_lpae is unique in how it handles partial unmap of large IOPTEs.
> > 
> > All other drivers will unmap the large IOPTE and return it's length.  For
> > example if a 2M IOPTE is present and the first 4K is requested to be
> > unmapped then unmap will remove the whole 2M and report 2M as the result.
> > 
> > arm_lpae instead replaces the IOPTE with a table of smaller IOPTEs, unmaps
> > the 4K and returns 4k. This is actually an illegal/non-hitless operation
> > on at least SMMUv3 because of the BBM level 0 rules.
> > 
> > Long ago VFIO could trigger a path like this, today I know of no user of
> > this functionality.
> > 
> > Given it doesn't work fully correctly on SMMUv3 and would create
> > portability problems if any user depends on it, remove the unique support
> > in arm_lpae and align with the expected iommu interface.
> > 
> > Outside the iommu users, this will potentially effect io_pgtable users of
> > ARM_32_LPAE_S1, ARM_32_LPAE_S2, ARM_64_LPAE_S1, ARM_64_LPAE_S2, and
> > ARM_MALI_LPAE formats.
> > 
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >  drivers/iommu/io-pgtable-arm.c | 72 +++-------------------------------
> >  1 file changed, 6 insertions(+), 66 deletions(-)
> 
> Updated commit message - Will let me know if you want me to resend
> with this, or any changes:

Thanks! Please send a new version with this text, the WARN we discussed
in the other part of the thread and also attacking the v7s code.

Cheers,

Will

