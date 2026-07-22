Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F60C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ed4T4xJjlrAZXH7SdCvLneLF0/yxPPXnPkh3K7AaOfQ=; b=lKBFGHw6FdO2XD0uotSK0Svsr8
	XmoxzLM1S0rtcWUihael0FJexhM7kPqkLifmUTbG8U2EAfQ9GLa/cJmnrgc0y0y3xKuT0BioYiNdA
	FFjWsmJsUYdb0nOVa/BGN6tdcG1+NoxN1iInybrh/4bBU4Qkoar9eNfxi9bHwyWUc0VZkfrAcjnsW
	DRdh/MX3PAiKfCuz9OwEeHnKH188gshE4Eq+ZA72ITSMh8dxjbpcLlzSsaSWdFo28di+eBRxQfCdn
	GNkLpEWC+e7SCAXxgJiztnVEPUKZZuxsrYbdUXzE8176CvnQ2lnMOB8CtHGQyJJQHvXIq5RZRVgg3
	30SAkNWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeiC-0000000CqWn-26nA;
	Wed, 22 Jul 2026 21:42:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeiB-0000000CqWK-1BDC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:42:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A788F600AB;
	Wed, 22 Jul 2026 21:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9076A1F000E9;
	Wed, 22 Jul 2026 21:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756562;
	bh=ed4T4xJjlrAZXH7SdCvLneLF0/yxPPXnPkh3K7AaOfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fPEv5XfyolxPMevnNfBaZ2im8pSAn8nujZnXszBTCkjPI/wA4aVny7vmXgl5FpNLk
	 2irJA1dPwd6QC+Yy913E/1FGFUdUIo5FxZWlojrG0O9nkIJQ4DqIqylbaaxPnNzqe0
	 RpXOrSb/Mttb55HnoMZblGXLGTpU5vbryBFw06bhlM4bgNe9rKDNEWSaIz7yijbljV
	 vTstFZl6fOw9fIOFUaHx1w5JTBWBhEtnOSZNKYCDy78t8JsfFKiMpfcoEHkwfBqqn/
	 l89ugTCLvx+Km3cADcP9eB5XBUJm2cmYU2OnU+xtGDgmOo7Pc98eVWgm4/MQW/EikI
	 r8H5/c514C2Zw==
Date: Wed, 22 Jul 2026 22:42:37 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
Message-ID: <amE5TRcSscM4iuGi@willie-the-truck>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <20260703161228.GA1948451@nvidia.com>
 <b7224dff-7e51-49cb-8421-14d090492dfc@oss.qualcomm.com>
 <20260715113913.GA3775915@nvidia.com>
 <ald3CuddY6I7gml1@willie-the-truck>
 <2ce09e84-c57f-4087-9dda-07245fadfc02@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ce09e84-c57f-4087-9dda-07245fadfc02@arm.com>
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

On Wed, Jul 15, 2026 at 01:14:18PM +0100, Robin Murphy wrote:
> On 15/07/2026 1:03 pm, Will Deacon wrote:
> > On Wed, Jul 15, 2026 at 08:39:13AM -0300, Jason Gunthorpe wrote:
> > > On Wed, Jul 15, 2026 at 11:25:42AM +0530, Vijayanand Jitta wrote:
> > > > On 7/3/2026 9:42 PM, Jason Gunthorpe wrote:
> > > > > On Thu, Jun 18, 2026 at 02:32:09PM +0530, Vijayanand Jitta wrote:
> > > > > > From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> > > > > > 
> > > > > > Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
> > > > > > When a set of consecutive PTEs map a naturally-aligned contiguous block
> > > > > > of memory, the CONT bit can be set on all entries in the group to allow
> > > > > > the hardware to combine them into a single TLB entry, improving TLB
> > > > > > utilization.
> > > > > > 
> > > > > > The contiguous hint sizes per granule are:
> > > > > > 
> > > > > >    Page Size | CONT PTE |  PMD  | CONT PMD
> > > > > >    ----------+----------+-------+---------
> > > > > >        4K    |   64K    |   2M  |   32M
> > > > > >       16K    |    2M    |  32M  |    1G
> > > > > >       64K    |    2M    | 512M  |   16G
> > > > > 
> > > > > My series to convert smmuv3 to the iommupt takes care of this and
> > > > > supports all the orders too. I'd rather we move forward with that then
> > > > > try to patch up this.
> > > > 
> > > > Thanks for details, I have gone through your series. As this patch
> > > > targets io-pgtable-arm.c directly and would benefit all its users (SMMUv2,
> > > > Apple DART, etc.), not just SMMUv3. I think there will still be value in
> > > > this patch for the other users.
> > > 
> > > If other users care they should also be converted to iommupt, there
> > > are many benefits to this besides just cont support.
> > 
> > I really have no interest in maintaining two copies of the page-table
> > code, so I agree that we should convert users of the architectural (long
> > descriptor) page-table format over to iommupt with a view to removing
> > the io-pgtable implementation eventually. If you want two parallel
> > implementations, then one should really be in rust :)
> > 
> >  From what I can tell, the fiddly parts for iommupt will be:
> > 
> >    1. Hardware bugs / quirks. Some of the simpler ones could probably be
> >       handled but for the more invasive stuff like the Mali format
> >       format, io-pgtable will probably need to hang around. Perhaps
> >       it becomes io-pgtable-mali.c?
> > 
> >    2. The pKVM work from Mostafa. We'll probably end up with something
> >       separate at EL2 for this (ideally, just reusing the CPU page-table
> >       code when it learns about BBML3).
> > 
> >    3. Non-coherent walkers, although I think this might actually be fine
> >       because x86 needs it anyway?
> > 
> > So, for now, I wouldn't require new drivers to use iommupt but I'm not
> > particularly keen about teaching io-pgtable new architectural tricks
> > either.
> 
> Conversely though, I really wouldn't want to have to maintain arm-smmu
> supporting two completely different pagetable APIs simultaneously either :/

Yeah, we'll have to see how it pans out. I suppose the first step is for
somebody to go through Jason's iommupt series for SMMUv3 and get that
driver converted. Once we've got that working, we should have a better
idea about what to do with arm-smmu.

If we can't get to a point where drivers are no longer using the long
descriptor io-pgtable implementation, then we'll obviously not get rid
of it, but I think it will become "fixes only" or something like that.

Will

