Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B515C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 12:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNIu1nT9O5TEzBCIb6SZPpMwQbKBprZzCJQi10hmSNQ=; b=DK7lP/BWCt656CDchqE2+j1Ipn
	Uux6fuCNlpvsdsUAEE1EvtLcvUXZSM37ceNiQJkp+9mBFaFiBExXPa8X7SVWXVkUzHSTVaYxDjv3E
	yglgPFTHDBubDDgaLRDD5hx1IOjbX6fINfBktsm2jHYqs2+Xxo5QoeGlatssZ7bXXtuyfBwWj+yFx
	tl7emRYPwYm60g/0Erh3H3Bl8Rrp54cl+NUa0292m/u0VzEXNpRUhVHwv+RJe5TBo0rtAbFCp8MxB
	FkGhLNs7URHgYGst0GUFt7ybqg1ukhSx3IQYhsTJapVbZRujALMG9IXxuB/Seqzl/ChKVq5H+5zV8
	n7gcibtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4rb-0000000Ex0Z-2qwY;
	Tue, 07 Jul 2026 12:25:24 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4rW-0000000Ex0E-1hWT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 12:25:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-493be0fbcc5so36795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 05:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783427116; x=1784031916; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BNIu1nT9O5TEzBCIb6SZPpMwQbKBprZzCJQi10hmSNQ=;
        b=hWbyiNPqzUxXDD5GfqbnPvFFBtyFVAkpzPlVm+CCjF4CAKhT84MSMIkrhIYHM3A45l
         fZYAdD5asr7VHGv0ueutE/tXTPWdUTyYFlnrV5HaTn39IF/jaoTDLyHyu+bMt7weQ98p
         JMRIPou9Z7bqYYvsK9CEqTB6EBa3IZEq/Yv7aRmppjYMmhjQIVK5X9n6VczDw9Xvb89I
         xl+0Y2a9Vh0mS3SQN32L5RBNvKFnrivuWWS2mVt+bqAP9rtLiqGOf7Z9WEo6nzQZMdjU
         KiP15kr7izMcMeMZMw4XzHBSx5iv4XPr0uEpdv8+FmePAfb5PwqcEvItUZQmDxbWAvgf
         q42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427116; x=1784031916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNIu1nT9O5TEzBCIb6SZPpMwQbKBprZzCJQi10hmSNQ=;
        b=TMnvtnDqqNIEOUgQipen4rO9frGEZKV0R+ogzXCEtZTRkKfoeRUPQLIGpOY5Gd+3Jq
         5xRp287xhG6/UU8ZXffHxC1exYNPBWq/xjz30EX+Q640yUEYlL85/+TyjSv/+5YM5hXq
         RyYNwaPahs553FytGUpM70lCOnmgJSJWVC2W/Ht36rdGFvlKs70sH+BRhVW5y+59bIeF
         moBG0A2S4wOQxmviNT5J9k3kOipEVXDtIoawvvLq2GZGuU4SAth65Ijqre//FS4UlCvQ
         dJfb7rfffftkR94V5v1ddyveShdlUM/64QZIC12g0glGROOzBWrhMdmS8HVwVeRPkkeB
         37nw==
X-Forwarded-Encrypted: i=1; AHgh+RpbV+hZxNPMYfhxUu9OEQ3T7NAy+XABD5Hz4qQ8IZz712imt1Wxwz8AKduoWpNpJZiY2DTCV5TYSLBzvi7NrKdF@lists.infradead.org
X-Gm-Message-State: AOJu0YxIvJ6Zszh0wVOOb1Rbzm1JLC1br+OavRrz3rW7QuP3w+Oru9P1
	UqmynihsZpg6jFvPncy1g0fxIl6iH5W9l8gtHysp6AsDRwxON6/cqSbYd51yzq2RgQ==
X-Gm-Gg: AfdE7cmBuQbhc1mwRDqhMAQrZUidDD1d36E+CzIvw3X+AgoObu5bj6v3vX7/2Y67Tpm
	QFbJl0ueMfS0iUenqoSdAlGvEf3EO2slTKBj8k+iNswpE65bNB19Q2hIdOr14uMlBOvMAWatTlq
	laIxMI11vXnGpibdYiGcxV5oajJYTGR4Rta0MRre7EXHZALlx5NVilX1qJJsQZsvZrcPG6Oj8Hi
	K20WdicK0pC1xaxmIJWut9KxAUoKKp0l5Dgi2b2RQxF4wsgyXKkPwqkKoAYfExAK0enpCkrKhQB
	jflXmPTZt3opKm7Dz7cY7Ake4Eqi60zzxFgIXHY6d58ZD6px2SY7r1c01h7v05wGhDda/SD56cS
	kTFgAoajwjfKc+uBmhirHGdZk7gqMYF8XRCPZcG7lz1b5umHsAJyf1VXXne2ScE1sc9HLqvAaTw
	aewnoksx3IBfSq7uPUiy3YO3ifNdoidN+LWNc2pICQxByznRCaH7ALTYhZpso=
X-Received: by 2002:a05:600c:1c0d:b0:492:203f:a378 with SMTP id 5b1f17b1804b1-493e121b8cdmr1231235e9.8.1783427116023;
        Tue, 07 Jul 2026 05:25:16 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3677asm48472185e9.4.2026.07.07.05.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:25:14 -0700 (PDT)
Date: Tue, 7 Jul 2026 12:25:08 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v2 0/8] Organize the SMMUv3 invalidation flow so iommupt
 can use it
Message-ID: <akzwJFpHTsgMrOYI@google.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_052518_523045_BF9B0591 
X-CRM114-Status: GOOD (  37.24  )
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

On Mon, Jul 06, 2026 at 01:26:37PM -0300, Jason Gunthorpe wrote:
> [ This is part of the patch pile to move SMMUv3 over to the generic page
> table, the precursor patches have been merged now:
> 1) Organize the SMMUv3 invalidation flow so iommupt can use it
> 2) Use the generic iommu page table for SMMUv3
> 
> The whole branch is here:
>    https://github.com/jgunthorpe/linux/commits/iommu_pt_arm64/
> ]
> 
> iommupt has a design that focuses on building a single iommu_iotlb_gather
> for arbitary batches of map/unmap operations. The gather uses the free
> list and it captures invalidations of tables, leaves and supports mixed
> levels.
> 
> The introduction of PT_FEAT_DETAILED_GATHER provides some additional
> information that is useful for ARM: the damage bitmaps for the table and
> level changes.
> 
> Prior to switching SMMUv3 over to use iommupt prepare for this by
> reworking the internal invalidation to work on the same data format that
> iommupt will produce. Bridge the invalidations generated by io-pgtable
> into the new format. The conversion is simple enough, io-pgtable generates
> invalidation operations that have only a single set bit in
> table_levels_bitmap/leaf_levels_bitmap, so we can convert the io-pgtable
> provided size into the proper level leaf or table bit.
> 
> When iommupt uses this mechanism it will fill in full bitmaps reflecting
> the union of all invalidations contained in the gather, and this series
> provides an implementation that can work this way.
> 
> Like the other drivers the general algorithm focuses on trying to issue a
> single command per gather or at most 512 single invalidations. If that
> isn't possible then it falls back to full invalidation. Since table and
> leaf invalidation are combined together there is no waste of invaliding
> tables prior to performing a full invalidation.
> 
> On its own this provides value as the invalidation has a number of
> rough spots:
> 
>  - Non-leaf invalidation actually expands into a TLBI for every
>    translation granule because the inner logic doesn't special case the
>    walk vs leaf condition. Now that a table_levels_bitmap is used to
>    describe the walk invalidation it properly generates a RIL with optimal
>    TTL or only one single invalidation.
> 
>  - RIL doesn't calculate perfect hints for SVA because the SVA rules are
>    different from the io-pgtable-arm rules that the RIL algorithm works
>    with. SVA can now express the combined leaf and table invalidation that
>    the MM callback represents and get the right TTL, with an optimization
>    for the common 4k only scenario.
> 
>  - RIL didn't generate a single invalidation like VT-d and AMD do,
>    instead it tries to generate an exact coverage with many
>    smaller invalidations. Switch it to match the other drivers single
>    range approach for performance and consistency. Since ARM has a much
>    more flexible range definition the over invalidation is far smaller
>    than other systems.
> 
> The approach is to introduce a new struct arm_smmu_tlbi which
> describes the invalidation, pre-compute into the tlbi the single and
> range commands from the start/last and bitmaps, and then apply the
> correct pre-computed command to each of items in the invalidation
> list.
> 
> The RIL and single calculations are revised to use the new bitmaps
> and accurately generate TTL/stride/etc.
> 
> Some of this design is to support another series to remove the batch on
> the stack. Now that we have the invalidation list and the tlbi it is
> simple to just expand the invs list directly into commands instead of
> using the temporary on-stack batch array. Eventually removing batch will
> save ~1k of stack usage here.
> 
> v2:
>  - Rebase to v7.2-rc1
> v1: https://lore.kernel.org/all/0-v1-5b1ac97a5403+6588f-smmu_tlbi_jgg@nvidia.com/
> 
> Jason Gunthorpe (8):
>   iommu/arm-smmu-v3: Pass the parameters for the invalidation in a
>     struct
>   iommu/arm-smmu-v3: Move pgsize out of arm_smmu_inv
>   iommu/arm-smmu-v3: Optimize range invalidation for latency
>   iommu/arm-smmu-v3: Keep track in the arm_smmu_invs if RIL is used
>   iommu/arm-smmu-v3: Precompute the invalidation commands
>   iommu/arm-smmu-v3: Populate the tlbi at the top of the call chain
>   iommu/arm-smmu-v3: Change how the tlbi describes the invalidation
>   iommu/arm-smmu-v3: Support the DS expansion of RIL's SCALE

I quickly went through the series, and left few comments.
As discussed before regarding the TLB invalidation logic sharing
with pKVM [1], I still think after these changes both drivers can
share some logic on the level arm_smmu_tlbi_calc_range() (+ tweaks).
I am planning to post my series by this week, I will keep it based
on upstream and I can rework my series later if this one gets merged
first.

Thanks,
Mostafa

[1] https://lore.kernel.org/all/20260501111928.259252-5-smostafa@google.com/

> 
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  32 +-
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  |  30 +-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 439 ++++++++++++------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  54 ++-
>  4 files changed, 382 insertions(+), 173 deletions(-)
> 
> 
> base-commit: 4c73a6222c248384513c4f465e547df80b280a06
> -- 
> 2.43.0
> 

