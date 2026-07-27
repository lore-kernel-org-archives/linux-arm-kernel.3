Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E5CC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 08:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqVw4hn9qYQIGv2zQRg01CGwV4FIX3vH2ne+HmEOylA=; b=jlNsA/R/Q5GkjP1j5pPeIZpjcG
	XgD6Iz6bRYjcpDtkfguzixYN2RjRDjf1PsK9PAYarUqjWllTan6R1KcCQu8oxq175FheELLopsjq7
	F4Xtq0FB4hcuAZXGwYUiMYBgfvnjE/eC01d21Uw+Fdoy7UqX757RCkbp+vSH8bB+HbpfzoXOfpVCM
	bBBb5xPTYh/oywS44egmWngLTt8N2XAXwvZOWlAxFOgralb5pK2s3wXwwHfaQHuKNhr0MEPB1SV+L
	qr/QD3elAKQzdfT472w5TBcpyYQ2SDdBnM1vgoLF2twOUvNFK0GlOxlAYhTFg6B36ej3H5z/3Xiu9
	NbaO09mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGSM-00000002CvH-0zv6;
	Mon, 27 Jul 2026 08:13:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGSK-00000002Cuy-2srI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 08:13:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2E564013A;
	Mon, 27 Jul 2026 08:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3621F000E9;
	Mon, 27 Jul 2026 08:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139979;
	bh=OqVw4hn9qYQIGv2zQRg01CGwV4FIX3vH2ne+HmEOylA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=He1e+qXxG78Mw62hrMKR8jcgC9E9ssqW84dJxLuuSAv3qeEybPnW/d41RnvjZfoY6
	 UIz8SQXAtd3ePejXZdLJs3Bb4/dcfdmABQwALQEFqRu1dJUMkvXQKp6RlmVP1CUl3h
	 3mm9byXkbnhPGu8/H0Vxo8u9LQ+8POYboTHGK0GVDBQKpAJLL+aT40cbX/FFtGK3GV
	 V8TwASDhXKeTy4VAdM/UnnDgJixTtvaAcj4ftV1vrG8lj0KDHRslFCN7ynrWOv+05w
	 Ivt9rvwEa29xBs1WaOn4Rv12YxHRZiJcpXjo8KIC0yLEP37BBqngmhsSQIf4V80AGM
	 L1vH5wRJ9yzxQ==
Date: Mon, 27 Jul 2026 09:12:54 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, catalin.marinas@arm.com,
	joro@8bytes.org, jpb@kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] iommu/arm-smmu-v3: Add HAFT support for SVA
Message-ID: <amcTBlw16RKuZC8y@willie-the-truck>
References: <cover.1784814923.git.robin.murphy@arm.com>
 <57ae366ec501a142bd20f2cc7d18b3eca8eeac25.1784814923.git.robin.murphy@arm.com>
 <amTH7xHBY2ol4LHw@nvidia.com>
 <amX25rcF-ETdnUPj@willie-the-truck>
 <amYxa51b2j/Cdw/6@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amYxa51b2j/Cdw/6@nvidia.com>
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

On Sun, Jul 26, 2026 at 01:10:19PM -0300, Jason Gunthorpe wrote:
> On Sun, Jul 26, 2026 at 01:00:38PM +0100, Will Deacon wrote:
> > On Sat, Jul 25, 2026 at 11:27:59AM -0300, Jason Gunthorpe wrote:
> > > On Thu, Jul 23, 2026 at 03:19:44PM +0100, Robin Murphy wrote:
> > > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> > > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> > > > @@ -102,6 +102,8 @@ void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
> > > >  			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HA);
> > > >  		if (master->smmu->features & ARM_SMMU_FEAT_HD)
> > > >  			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HD);
> > > > +		if (master->smmu->features & ARM_SMMU_FEAT_HAFT && system_supports_haft())
> > > > +			target->data[1] |= cpu_to_le64(CTXDESC_CD_1_HAFT);
> > > >  	} else {
> > > >  		target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_EPD0);
> > > 
> > > Based on the Sashiko remark and your note you should lift all the
> > > HA/HD/HAFT bits outside this if (mm) block.
> > > 
> > > AFAICT it is fine for HA/HD/HAFT to be set with EPD0, the HW won't
> > > process any PTEs so they won't have any effect.
> > 
> > I'm not sure about that. The spec says this about CD.HAFT:
> 
> Sorry I see this was unclear
> 
> I ment to move all *three* bits outside the if.
> 
> There is no reason for EPD0 to also require setting any of those three
> bits to zero, AFAICT.

Ah, gotcha! And even if we did want to get to that configuration, I
guess you could set EPD0, then clear HAFT, then clear HA+HD?

Will

