Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3158C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 12:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiosQTu8baA+WXCpacOsGlT6To8H67hjURXJziEm3mg=; b=KwwcJGW9TZXF/JDqbj7vTLhnt0
	zWCv5i2Ay6dKLTsX9/9o6A20loS4qt4xp7+5vFms5kqEeqlZuzdrRCoEJz94ReT7rtLIVfzJ8Qufw
	TRsydzAgIpYSz5lvkPlE5l2ANYjO4Z6U4S25xMToWn0ALB72uL8ZchTa+ZA6tMAtNO+kYx7o78TPT
	eDeqHf5TPyycULXyQUZuNFFYO5I1BcBGpVNSAqMKw1x9cHBo8FiBXrddiHeEf+vXy1/ZhJfdZDed9
	9ifeBf79JTWrq7eQGFoTCDw4HA+t1vbqsdeKGbO0aeMBbNSfbQe3y8zPJhkaYZcVNAqul92Hl18qE
	+UDuLmgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnxXB-000000018mB-2v0S;
	Sun, 26 Jul 2026 12:00:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnxXA-000000018m5-1Rn8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 12:00:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5006F6001D;
	Sun, 26 Jul 2026 12:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8757B1F00A3D;
	Sun, 26 Jul 2026 12:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785067243;
	bh=PiosQTu8baA+WXCpacOsGlT6To8H67hjURXJziEm3mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QcI+gSjrWnphZnhrzYSfQmSsBHbX+Iv9Zb5ccq+lmXibhlcIg9ce0RyEX/3oisCJr
	 RROrJvDeoCctBLrEGppGdG46XkJlAU2TBCaenMyDp1ovjXyNaylqxfdZ86REottiz1
	 lJ/Ib4QH4UBK4F+LT7PIiANe4zj6i1PfbF8OPb1tqkB4QFesDsmZTw52Rjo/ELBKLf
	 EbRXg8Rn2JHiImHNFNiIsRgrDqix5FOPhFyLiXbVefU9k9PvS13LKU3dt0J6Rlu2Ev
	 LtWIZ5SEc90Rpp5Sn7r5h4pH0eUtTpmrKnDQcgxzGIhwydc6o0XOyWeH6/nqS4Hld/
	 8TrCAxX/v2dvA==
Date: Sun, 26 Jul 2026 13:00:38 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, catalin.marinas@arm.com,
	joro@8bytes.org, jpb@kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] iommu/arm-smmu-v3: Add HAFT support for SVA
Message-ID: <amX25rcF-ETdnUPj@willie-the-truck>
References: <cover.1784814923.git.robin.murphy@arm.com>
 <57ae366ec501a142bd20f2cc7d18b3eca8eeac25.1784814923.git.robin.murphy@arm.com>
 <amTH7xHBY2ol4LHw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amTH7xHBY2ol4LHw@nvidia.com>
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

On Sat, Jul 25, 2026 at 11:27:59AM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 23, 2026 at 03:19:44PM +0100, Robin Murphy wrote:
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> > @@ -102,6 +102,8 @@ void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
> >  			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HA);
> >  		if (master->smmu->features & ARM_SMMU_FEAT_HD)
> >  			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HD);
> > +		if (master->smmu->features & ARM_SMMU_FEAT_HAFT && system_supports_haft())
> > +			target->data[1] |= cpu_to_le64(CTXDESC_CD_1_HAFT);
> >  	} else {
> >  		target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_EPD0);
> 
> Based on the Sashiko remark and your note you should lift all the
> HA/HD/HAFT bits outside this if (mm) block.
> 
> AFAICT it is fine for HA/HD/HAFT to be set with EPD0, the HW won't
> process any PTEs so they won't have any effect.

I'm not sure about that. The spec says this about CD.HAFT:

| If CD.HA is 0 and not IGNORED, it is ILLEGAL to set this field to 1
| and this results in C_BAD_CD.

so the question is whether or not CD.HA is IGNORED when EPD0 is set, and
I couldn't find anything to suggest that is the case (which kinda makes
sense, given that there are two TTBs).

As a last resort, I tried to parse the pseudocode for C_BAD_CD (based on
CdIllegal() in "5.4.2 Validity of CD")...

It looks like EPD0 gets wrapped up in 'n_transl_cfg0', but that's not
used at all in the relevant check (you need to skip past the first few
bits, but I've included them for completeness):


// Check CD.HA, CD.HD, CD.HAFT
if !using_vmsa32 &&
    // The following conditions are ILLEGAL when VMSAv8-64 or
    // when VMSAv9-128 are used.
    // No flag updates supported, but CD wants to update flag
    (((CD.HA == '1' || CD.HD == '1') && (SMMU_IDR0.HTTU == '00')) ||

    // Only access flag update suppported, but CD updates dirty flag
    (CD.HD == '1' && SMMU_IDR0.HTTU == '01') ||

    ** LOOK HERE! This is the relevant part: **

    // Hardware update of AF in Table descriptors is supported and enabled,
    // but update of AF in leaf descriptors is not enabled
    (SMMU_IDR0.HTTU == '11' && CD.HAFT == '1' && CD.HA == '0')) then

  return TRUE; // Invalid


so I think your options are either:

1. Use the cmdline option that Robin is adding so that you can disable
   HAFT altogether.

- or -

2. We could disable HAFT first, and then do the hitless transition.

(2) means we can miss table AF updates during that window, but I think
that should be fine?

Will

