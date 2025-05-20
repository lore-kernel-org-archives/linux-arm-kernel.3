Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA49C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 14:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dCIrl5EiWe1t4GespSaZVCa3vu0xn86m7iaUbSsYE8=; b=lkD4SU1I9IvJuAfKQD6m0O6lBq
	FPhPGebHDXoZZ6FbhfBHX1eMd630JKApGFt0au/XpnrnSm1MVW+7hn4WaF6O6lW4aKkr36iliiII+
	QXP+1jOEOid9umUHVl75VnIwGqPL1l2Jyu1Grp5S8dSs3KbVi1oGyo9PPxpRy9B4AVK24j6VfHmS0
	OSVAzU8Ztj6oLwvbsOKnFeJFUwz9t7ELm755WUjiPZlIBBEaekMVkgvCsgHP5L1NM57W1az752yj+
	g71OMNuDzAYL4IGjQZdGZEdomc2PYGe9Y+PL769W+3+a8YFj7LCTsWF2KR+K7U8vGDl2i4g467du/
	I/mN69/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNei-0000000D72M-2Kik;
	Tue, 20 May 2025 14:09:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNbk-0000000D6av-1Q9w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 14:06:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D8EE4376D;
	Tue, 20 May 2025 14:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55123C4CEEA;
	Tue, 20 May 2025 14:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747749975;
	bh=FUqSs96axAp0W6GBkmXg9C3eBD616pCiipr3QPKpK+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMWSAyXuMbLx1/hbp6qcHRyhEmrh+SwjzHgggk6nisBANRAgI0i2pSTllwRw20cOO
	 4A4Oxub/EL3+D9pSsqqSiyc5uZupxkGtEnvqvT1Ke5BlHfmfJSMU627RwkoS5Txqfe
	 YTXqS/bp+ydnNVd4pr2lPAKgC69XUrspKcOqi7sYJoaiSUWIcUIOW5D7q5k9y0SMgd
	 qGnGkmP//B2jNxvIw6zidR5e7qDCX4kaEgzkbNP3zWYjZzikqMPSNJNFk16pAtyD0g
	 c1V0am5JaXH8EZDohQWKaZa7ba4ir0qmi1nz7/IuD+8tqOKskzTtyNYlOINeVPNOCv
	 dTHtLvUkValbw==
Date: Tue, 20 May 2025 15:06:10 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 05/40] iommu/io-pgtable-arm: Add quirk to quiet
 WARN_ON()
Message-ID: <20250520140609.GB18711@willie-the-truck>
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-6-robdclark@gmail.com>
 <20250515143309.GA12165@willie-the-truck>
 <CAF6AEGsnOD8fZmTXAEZZNrdK-NXdUJF51s51EhYQ6Ed7dCFM0A@mail.gmail.com>
 <20250520113146.GA18435@willie-the-truck>
 <def13dd2-3a23-4091-a732-e4c079df7f41@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <def13dd2-3a23-4091-a732-e4c079df7f41@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_070616_419467_878B4C38 
X-CRM114-Status: GOOD (  31.19  )
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

On Tue, May 20, 2025 at 02:06:09PM +0100, Robin Murphy wrote:
> On 2025-05-20 12:31 pm, Will Deacon wrote:
> > On Thu, May 15, 2025 at 07:48:39AM -0700, Rob Clark wrote:
> > > On Thu, May 15, 2025 at 7:33 AM Will Deacon <will@kernel.org> wrote:
> > > > On Wed, May 14, 2025 at 10:53:19AM -0700, Rob Clark wrote:
> > > > > diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> > > > > index bba2a51c87d2..639b8f4fb87d 100644
> > > > > --- a/include/linux/io-pgtable.h
> > > > > +++ b/include/linux/io-pgtable.h
> > > > > @@ -88,6 +88,13 @@ struct io_pgtable_cfg {
> > > > >         *
> > > > >         * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pagetable.
> > > > >         * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttrs bits
> > > > > +      *
> > > > > +      * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
> > > > > +      *      mappings, but silently return -EEXISTS.  Normally an attempt
> > > > > +      *      to map over an existing mapping would indicate some sort of
> > > > > +      *      kernel bug, which would justify the WARN_ON().  But for GPU
> > > > > +      *      drivers, this could be under control of userspace.  Which
> > > > > +      *      deserves an error return, but not to spam dmesg.
> > > > >         */
> > > > >        #define IO_PGTABLE_QUIRK_ARM_NS                 BIT(0)
> > > > >        #define IO_PGTABLE_QUIRK_NO_PERMS               BIT(1)
> > > > > @@ -97,6 +104,7 @@ struct io_pgtable_cfg {
> > > > >        #define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA         BIT(6)
> > > > >        #define IO_PGTABLE_QUIRK_ARM_HD                 BIT(7)
> > > > >        #define IO_PGTABLE_QUIRK_ARM_S2FWB              BIT(8)
> > > > > +     #define IO_PGTABLE_QUIRK_NO_WARN_ON             BIT(9)
> > > > 
> > > > This feels a bit fragile to me:
> > > >    * IOMMU-API users of io-pgtable shouldn't be passing this quirk
> > > >      but might end up doing so to paper over driver bugs.
> > > > 
> > > >    * Low-level users of io-pgtable who expose page-table operations to
> > > >      userspace need to pass the quirk, but might well not bother because
> > > >      well-behaved userspace doesn't trigger the warning.
> > > > 
> > > > So overall, it's all a bit unsatisfactory. Is there a way we could have
> > > > the warnings only when invoked via the IOMMU API?
> > > 
> > > iommu drivers _not_ setting this flag seems like a good way to achieve that ;-)
> > > 
> > > The alternative is to move the warns to the iommu driver... but they
> > > could just as easily remove the WARN_ON()s as they could set the
> > > NO_WARN_ON quirk, so :shrug:?
> > 
> > Bah, I also don't have a good idea to improve this, so I guess I'll take
> > what you have for now.
> 
> Hmm, just a nit on reflection, how about fixing up the name to just
> IO_PGTABLE_QUIRK_NO_WARN? Given that it's already quite long, and we have a
> well-established DMA_ATTR_NO_WARN with equivalent semantics over in the DMA
> API.

Sure, I'll do that now...

Will

