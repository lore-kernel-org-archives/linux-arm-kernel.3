Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8FECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 07:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCxE+rszi7Vtj91iPn83k1KzhNJKRwOLPR1ysps3Zb4=; b=2+6xZTxxtdjSVVvARt7cUshrvY
	HliLufkQBBwEdJjBNtNxEIHFJcOSYlyU/WZmTs5OM6i49AM1N2taCzqX3zH3ClZLedxUx3c6lJoIz
	gd00Wq/i35eAjtP83U6H5MaBDVeSt6nGkD3uDtFqq/Rjx3TUWJX1SLbX7ey0WLCGOrUuHn4FwhfuT
	U8h6CuP2l2GO0XcHsz7Y1FytBO9TrwMDe3dqMnlV+Xu5r//VmADO5iq3OqzrkX8AgsqQpN0mAZeTZ
	KzJdb+Xni22wWOv8AIypxyHb0bDBRmWiAfqVGe2uq2gukxo/e/+ERT+mGULlBWk14TJy4/3wCRElF
	iFV/YMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVcc-000000024Ji-2Cjr;
	Fri, 19 Sep 2025 07:33:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVcb-000000024JX-0CNn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 07:33:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87F5C60097;
	Fri, 19 Sep 2025 07:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88238C4CEF0;
	Fri, 19 Sep 2025 07:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758267210;
	bh=Lx33AaBsxDOHxkZEXjvlDKiPRuXKJF1OzxalkYoJ7Cg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OnIayxU4R21x2fQ71+36zLb/cyb1S39xVraWvMNWx5ASXXzFBQYBeWskMMSM1LUYs
	 L3Df5/Tnk9zFsvYVhBRqhVue/HNMc0lX08e0aiJYwDDd/n3NAV0ycbyUApu0a2aQLq
	 vBxGTZ1w1gg8s1Tetdb7nsPFCtHsIi1dCqUnvAl29N4//QZBRFgPUZyT6mH/6Cb5nF
	 RuoiPGKL1l1nCwczm4Po6lA83cjt+yFnWioHNE5lBNL2ZpihKUPffSijkvVcxFP0wt
	 ySoN86uYo4D82No4xfpvCBhxNJZMNRyRi6aZVmzdidrmEoT6JRIb7AurVY0Yg8SdCA
	 tNGhAR4uNLHlA==
Date: Fri, 19 Sep 2025 08:33:23 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Shyam Saini <shyamsaini@linux.microsoft.com>, thierry.reding@gmail.com,
	robin.murphy@arm.com, robh@kernel.org, joro@8bytes.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	jacob.pan@linux.microsoft.com, eric.auger@redhat.com,
	code@tyhicks.com, eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com, bboscaccy@linux.microsoft.com,
	saravanak@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	lizhi.hou@amd.com, clement.leger@bootlin.com
Subject: Re: [PATCH v4 3/4] arm-smmu: select suitable MSI IOVA
Message-ID: <aM0HQ51DelZW_Rt8@willie-the-truck>
References: <20250909154600.910110-1-shyamsaini@linux.microsoft.com>
 <20250909154600.910110-4-shyamsaini@linux.microsoft.com>
 <aMw4I0AjKNPY6SOw@willie-the-truck>
 <20250918224322.GR1326709@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918224322.GR1326709@ziepe.ca>
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

On Thu, Sep 18, 2025 at 07:43:22PM -0300, Jason Gunthorpe wrote:
> On Thu, Sep 18, 2025 at 05:49:39PM +0100, Will Deacon wrote:
> > Given that we're walking over the reserved regions to see if we have a
> > collision with MSI_IOVA_BASE, why not allocate the base address
> > dynamically if we detect a collision rather than having yet another
> > hard-coded address which we can't guarantee won't be problematic in future?
> 
> I'm nervous about this. Right now the  MSI_IOVA is actually UAPI and
> things like VFIO/qmeu need to accomodate it's placement in their own
> memory maps.

*shrug*

That's only the case for broken systems where the existing MSI_IOVA
can't be made to work. As far as I'm concerned, they get to keep the
pieces and will need to work on the userspace side. It's not like
MSI_IOVA2 is magically going to work (and I bet it won't be tested).

> Nicolin has some patches on the iommufd side to let userspace select
> the MSI address instead, but they are not done yet.

Maybe we should just wait for that? Carrying a temporary hack with ABI
implications to support broken hardware isn't particularly compelling
to me.

> So, randomly picking an address sounds like a bad idea to me, it would
> almost certainly unpredictably break qemu..

It's not really "random", in the sense that it would be deterministic
for a given set of reserved regions.

Will

