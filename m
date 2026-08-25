Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A52C61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 17:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bj2g1RQRxCbMBdA5rwuLTDfC67Rmlu8p6CaftxfrFeY=; b=uEFvIoB2Fh3eIdZNKeiwFP1N8g
	ctWWWp78vYG0hDotBDCzUBtf6UEBGIAv+UhEih7lcRySkEyRp7Tf2vVLOpDVjXWXjiUOjrk3J8gqt
	xkUCB7CM1K9yWhDifNZNxtBinkSrVBn88Ro2IY8/kllC20scOXrfwOoxllPtratSbivgoTXlxvtrW
	LRJ89C6sJQSUDuVsNClXul/vLEkwDQlLPxew6sR4jomSA+Rgg3t79lyREEsNU7hLP9T83EZ6W2zMi
	QdHox2C36w/puC27yNop8NCOUhDezcjt0CJGHQ3+SAXeWx6gL1rxs7NQLRzREuwZLZhz+COo/fxtO
	SPQFDvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyubt-00000001AhC-2KAK;
	Tue, 25 Aug 2026 17:06:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyubs-00000001Ah2-2WJt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 17:06:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 07BB4408A2;
	Tue, 25 Aug 2026 17:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B5B1F000E9;
	Tue, 25 Aug 2026 17:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787677611;
	bh=bj2g1RQRxCbMBdA5rwuLTDfC67Rmlu8p6CaftxfrFeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TprJ7xxJidQiclhVmzR7uTnPdxnygmo/1eEVQIMmYK1TAkDTTBsmRPf0TX3lxWiMp
	 vxTYeSJM37E0iSXa6xUlrorX5KmCLHR8rZA1L7lY0FjX6GlRIoBDKH4k4adynQ8Y5l
	 0WOQFDAL44Mgl2zv16PVisH4q1OSAoniC4xRusd9NbESz4N6wrGs4hZ/v9Pe3Hl/rD
	 JHh++0H7dgP40e92dBW4flhauaJp/b3BKK29HBx9dAzCRmdzPWFCVOFp2lBVdLY1I5
	 9/GRoEzkY8xTfo5VKkWJ29z5dU4wDrJNZVXMwj2W7b3/YO+PG6gbZZ/+hbXFsaZnPu
	 q2hZBTn9T2E4w==
Date: Tue, 25 Aug 2026 18:06:45 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v2 3/8] iommu/arm-smmu-v3: Optimize range invalidation
 for latency
Message-ID: <ao3LpdSgK7ZBrLza@willie-the-truck>
References: <akzm5BoV0rToJ7ij@google.com>
 <20260708001058.GA422027@nvidia.com>
 <an3MSKEj7VhT4WkP@google.com>
 <20260813141320.GF730363@nvidia.com>
 <an3ew9xbnLe1dr5g@google.com>
 <1791d7da-ecd9-4475-8f27-c8857477b442@arm.com>
 <20260813180102.GH730363@nvidia.com>
 <an7UNAA1WlEXG23-@willie-the-truck>
 <20260814123417.GB510472@nvidia.com>
 <20260818184338.GF5432@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818184338.GF5432@nvidia.com>
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

On Tue, Aug 18, 2026 at 03:43:38PM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 14, 2026 at 09:34:17AM -0300, Jason Gunthorpe wrote:
> 
> > I'm also wondering if we are even OK with this errata today? The
> > current RIL algorithm also does not guarentee the split up RILs will
> > cover every CONT. This will happen to be true if the input range has
> > certain properties but I have no idea if the SVA path or even the
> > proposed CONT iopgtable change guarentees that.
> 
> I've looked into this and it looks like the current RIL implementation
> does not meet the requirement to solve the errata, and these days SVA
> provides CONT entries from the mm.
> 
> The errata says the RIL command must cover the *entire* CONT group. I
> read this text as meaning two contiguous RILs with a split that is
> inside a CONT group is still vulnerable to this errata. Each CONT
> group must be fully covered by at least one RIL.
> 
> So the algorithm we have today where we take the range and split it
> into many RILs has nothing that prevents the RIL split from landing
> inside a CONT. SVA is not guarenteed to produce ranges with an
> alignment or size that make this algorithm happen to choose aligned
> splits.
> 
> I've prepared an errata fix patch that detects the errata and triggers
> a very simplified version of this single-RIL algorithm only for SVA
> invalidations. That will fix today's kerenel, it is reasonably small
> and can go to -stable.
> 
> I've adjusted this series on top of that to use the double-RIL version
> with no over invalidation that Robin suggested for paging domains and
> single-RIL with over invalidation for SVA domains. This also turned
> out pretty good.
> 
> For the iommupt integration, and enabling CONT for the paging
> domains.. Ugh.
> 
> It seems at least our Spark CPU has this errata and requires CONT
> support to work in paging domains, or it runs into its own isochronous
> HW problems. So the easy answer of disable CONT isn't desirable.
> 
> So.. what I've come up with is a little tweak that still allows the 4k
> granule's 64K CONT to work without any over invalidation, so we can
> turn it on by default. That is enough for spark to work. Everything
> else stays with status quo of no CONT.
> 
> If someone has another smart idea now is the time..

The documentation for 3673557 gives a possible workaround of:

  - When invalidating a contiguous set of page tables, perform the
    invalidation sequence twice. Only the invalidation sequence needs to
    be performed twice, not the SYNC.

and we just merged something very similar from Ashish. Could we use that
for domains that want to use contiguous ptes?

Will

