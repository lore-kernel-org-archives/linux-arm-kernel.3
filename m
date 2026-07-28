Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB00AC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPiIGPvKbEzVvkisuieRapAQMt4KNwjEh7oUsK+fLwI=; b=g+vW/wpxkbz3z71WgC1TJsO+G4
	DTpFGcwidojKNh4jCVO1InRHW2JKMm3H0L//bvUzBbo6i4izxFpKWYWjMqd8XjaAAGp4UKfljBTTV
	MZMmar6XDF9vlkdhqb5N/Gxf9c2JOEOQXMlH1rfGScwKyny5UnW9Jkdh9WmxAjk8Sm89akOKqGo17
	2913YK9Y0Ds4ggGzv0c1PugMNfuXrGHmrt2a3LVj29a5eIowD3S3g2WB2PAy1Yw6uujHdB8XSovjt
	quDB512VrSBotWHN92yqYbFQwkaVtzHQcdX0JIWBu0cV3/U6VesIZJK/MmGHdaEINnAUzjU+dH7kq
	canB09xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofyJ-000000054og-0RP1;
	Tue, 28 Jul 2026 11:27:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofyI-000000054oX-045x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:27:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4908260051;
	Tue, 28 Jul 2026 11:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92691F000E9;
	Tue, 28 Jul 2026 11:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785238061;
	bh=EPiIGPvKbEzVvkisuieRapAQMt4KNwjEh7oUsK+fLwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lEfr4B0WyJmHDE6f576vwoF1R+Fs93uEOJRNAIM3bAFeQOb7iknCsaOIoHODPLN4Z
	 tWHUqSImCxe/aAWMrcldqp2Aeyg1ZTPTx9qZQ+GlgZfthH6bim526IVqAxWys/o5La
	 ytuNQeYeh/L0I7F4Bgf4jH7GyAQbIJG+zUqQZP0BCinM6lAPzFXcFjee0JimQf2VBJ
	 ftLuWJ8Nkq2lmu+b4u72LaizonsA0f1Ml62Te7ojYBM9Ga8UDmL0vC4gam/Essuh3q
	 cFt9Xtitgd9xbiE51hws/O8vgAsUrLqX7iCjmLZX2kwokKhn+j1wnghUVn9G8/DnD4
	 RhrCtUPj9Tf+g==
Date: Tue, 28 Jul 2026 12:27:36 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
	Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [PATCH v4 0/6] iommufd: Iterate the cache invalidation array in
 the core
Message-ID: <amiSKPx6-VXBxGBK@willie-the-truck>
References: <cover.1784054606.git.nicolinc@nvidia.com>
 <20260715201521.GL3775915@nvidia.com>
 <alft3llhZ79t17j8@nvidia.com>
 <20260716151845.GO3775915@nvidia.com>
 <alkE4iUQSWeD8Vyx@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alkE4iUQSWeD8Vyx@nvidia.com>
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

On Thu, Jul 16, 2026 at 09:20:50AM -0700, Nicolin Chen wrote:
> On Thu, Jul 16, 2026 at 12:18:45PM -0300, Jason Gunthorpe wrote:
> > On Wed, Jul 15, 2026 at 01:30:22PM -0700, Nicolin Chen wrote:
> > > On Wed, Jul 15, 2026 at 05:15:21PM -0300, Jason Gunthorpe wrote:
> > > > On Tue, Jul 14, 2026 at 11:48:46AM -0700, Nicolin Chen wrote:
> > > > > Nicolin Chen (6):
> > > > >   iommu/arm-smmu-v3: Support IDR5.DS and widen the TLBI SCALE field
> > > > >   iommu/arm-smmu-v3-iommufd: Reject unsupported bits in invalidation
> > > > >     commands
> > > > >   iommufd: Iterate the cache invalidation array in the core
> > > > >   iommufd/selftest: Convert cache invalidation mocks to the core array
> > > > >     loop
> > > > >   iommu/arm-smmu-v3-iommufd: Convert cache invalidation to the core
> > > > >     array loop
> > > > >   iommu/vt-d: Convert nested cache invalidation to the core array loop
> > > > 
> > > > I was tempted to take this through the iommufd tree, but Will, I think
> > > > the first two ought to go to -stable through iommu ?
> > > > 
> > > > If you do that then maybe I'll pick up the rest
> > > 
> > > PATCH-5 touches arm-smmu-v3-iommufd. Merging via the iommufd tree
> > > will conflict with the PATCH-2 in Ashish's series (via iommu):
> > > https://lore.kernel.org/all/20260714104202.1664187-1-amhetre@nvidia.com/
> > > 
> > > Maybe it needs a shared branch; and then, Ashish can rebase?
> > 
> > Urk this is a pain. I think Ashish's errata fix should go first so it
> > is easier to backport.
> 
> OK. I can rebase and send a v5 after Will takes Ashish's series.

I've now queued the workaround from Ashish.

Will

