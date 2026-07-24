Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966A3C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 19:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMYgbX2E5STWJ3B50MJvZqK+f3UjOUURTR7CU8KzNb4=; b=B8d7/0OZw+a/UDsWHzV5xiWyRu
	LvmstgXGwfjoKCIZlEBKoBBu5z3+NRKex4VZWxJevzshlfq8YCZIrvvqUZ5NdhDRYlvL9UaZVtir/
	FjglOO2xwzc8PKoAyCdOA6H0gNqHD1pIUi1gvNY1xxiSVfhEtOK0ALj2v2mc2DHPZ+/J7pYAmAOOD
	ZN1+WDM+auLPPHv68Q9tg7tYGU13JhO8Irmv6akYB0i7gLQuK1IoexEFGYhsoMxO6GCad0RPa0vK6
	G3RBxZH3BnM2pKWnYaIvRhyVW3opEoii/RbIo+T3rkapz9dMzRU/f2BQWM2O7a5wNAxdZClp35x/c
	+9oh5AlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLbd-0000000HAVn-0W5u;
	Fri, 24 Jul 2026 19:30:49 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLba-0000000HAV7-42Bc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 19:30:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4954d5d814fso11735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 12:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784921445; x=1785526245; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qMYgbX2E5STWJ3B50MJvZqK+f3UjOUURTR7CU8KzNb4=;
        b=fHKyLzDSQfClLnVuXHHPABLSiQ4xRs/50Wrp92zMHi1HLD11o6WKPkpym9tJigROPO
         GtoVy4UYy8cTC0VQjaO8Kb+FrLp/gYdeZpWedR+9l+DKXr2Q5joGa+aJUpuO3IKFLC4C
         IcrpcynuoZWui5U0e1v8nyg73fd144UdV72Y8IHt4ikSj0u5uN8D3nNles6v1oWPW+nU
         ekGSvy5LWjMDvrgXgNTlWVkaTWFMDKxI6TGrj+GpWLjMZ5pmYEORyeGzYJJDzEBG/y5r
         37jjxGdOVhVHpYeNfvlH7aQrZnJHty839qnwetEIxIv2W319EZBRVWTCGuKWf2lJZIT4
         4qEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784921445; x=1785526245;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qMYgbX2E5STWJ3B50MJvZqK+f3UjOUURTR7CU8KzNb4=;
        b=AhBMQcbiDtt21sHjMB2/emnFx403o2n/pIlnDqHpMenL2xZni6duAJedX+AKATymCy
         48U346CuBGCKFSSIKbif3ODH36aTJ2WYX9ar0y0C/JeEj74EK5rcQLd2KDbdx0rE8KtG
         n8zoLS+dJ0QWlHB/EkHcbbvGkgFNCZ+FB3SceAxyR9bpUmitqrPBYdhFhIRqIixcrcDe
         /ESveeT4KAGMkqCGf5Xt2hXb4cvZj1Na02kmoWNbqrkgRWK0dOxENMfPtUuMSS7V931p
         F6zzIMOYl/nXftIlcjENaHo2sNGMr0mnfxkVfSdZmGVV7FfvccaIB+VYLUBcEjGviOIq
         bBZA==
X-Forwarded-Encrypted: i=1; AHgh+RrwDgjIJFCZAtdZmQslgBCtMoyJttf/z3wy9iE3TC89dlZigVuMJAR8/pQGn8HIDUvyoOVJo+okPN90VyC/Cxiv@lists.infradead.org
X-Gm-Message-State: AOJu0YzgEOpe6Mw2uYsgeDhiLPE2QLFRPdWEW/QCvvOv7bL7Hj0+Y7OS
	BsD/OiuM/0QBv9IPsIgIVwRHplXqXNDWzXPgxSSmkZMHUpyqcbvuWJl8b8m/3bEiiA==
X-Gm-Gg: AR+sD12XvDNX/bkBY3pNoaVnAxJ3HJC31qrec+H21TCnEttfjAIzNQeqUv6VgRu+Qsm
	fPJDnUFbCjvzP/K9gQphvHME/Vi87gllE6owtKXFPFH3pov51gPQw8CfoYhyTl3krDnu9Md2ZQd
	xIEtckC37lShFwnoW2sB3ul9vaHWFi0YQQNyN5HOI2ROXjwVCP7fErGo3hTV5ZcruQpv/FbpArG
	xHLsvm6BsRRd1Sswjsm3vPwglT41DVEap9FrGCg3otmaV5cFjcfys91kIFXRoZPLG/pvxn0kZ7X
	msMZeXRSTV+BoOm4KWC7N8T3+5t/syK+83Bx8Qa285qnsrBYewjU9OnOF7SImH2loeYoRPKG7HU
	BZ88nKgIuT3DWk5zqb7ykSw/DkUD5hLrQWljDVeWOE/Qin810erPcrvEpAgoh9S+o5yEjomroyb
	U/3P1wRltMAk4q7nSZTuS7YqEgvVAOmsJYTBfd0w==
X-Received: by 2002:a05:600c:8709:b0:493:be38:fa5a with SMTP id 5b1f17b1804b1-496b4d388e8mr268615e9.10.1784921444576;
        Fri, 24 Jul 2026 12:30:44 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85a2573csm25874209f8f.0.2026.07.24.12.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:30:43 -0700 (PDT)
Date: Fri, 24 Jul 2026 19:30:39 +0000
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
Subject: Re: [PATCH 6/7] iommu/arm-smmu-v3: Use the generic iommu page table
Message-ID: <amO9X2vBl3_jIttb@google.com>
References: <0-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
 <6-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_123047_020278_3FA88649 
X-CRM114-Status: GOOD (  19.66  )
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

On Mon, Jul 06, 2026 at 01:29:12PM -0300, Jason Gunthorpe wrote:
> Switch to use the iommupt provided page table. This is fairly
> straightforward now since the page table construction and hwinfo are very
> similar to io-pgtable-arm.
> 
> The struct pt_iommu_armv8_hw_info is a direct replacement for 'tcr' and I
> have a kunit compare test validating that the fields have identical values
> for identical configurations.
> 
> Quirks are replaced by features
>  IO_PGTABLE_QUIRK_ARM_HD -> PT_FEAT_ARMV8_DBM
>  IO_PGTABLE_QUIRK_ARM_S2FWB -> PT_FEAT_ARMV8_S2FWB
> 
> SMMU features are mapped to iommupt features:
>  ARM_SMMU_FEAT_COHERENCY -> PT_FEAT_DMA_INCOHERENT
>  ARM_SMMU_FEAT_VAX -> PT_FEAT_ARMV8_LVA
>  ARM_SMMU_FEAT_S2FWB -> PT_FEAT_ARMV8_S2FWB
> 
> Remove the iommu_flush_ops entirely, iommupt only uses gathers for
> invalidation. Wire the tlbi directly to the gather.
> 
> Remove the trampoline for map/unmap/iova/read_and_clear_dirt. iommupt
> directly provides the domain ops. Domain initialization is largely moved
> into iommupt common code.
> 
> Change the kunit to fully create a page table to generate the tcr bits for
> testing.
> 
> Compared to io-pgtable-arm iommupt has a number of key differences:
>  - CONT support, including always using RIL to avoid errata 3673557
>  - Unmap yields a single gather which generates a single tlbi operation
>     * free_list is always used to free after invalidate
>     * walk cache and leaf invalidation are combined for non-RIL cases
>       instead of being duplicated
>     * non-RIL cut over to all-invalidate covers walk invalidation now too,
>       umap -> single gather -> single all invalidate.
>     * RIL flushes the walk cache and leafs together with a good TTL hint.
>     * RIL always generates one command from any gather.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/Kconfig                     |   4 +-
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  |  45 +--
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 256 ++++++------------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  11 +-
>  4 files changed, 110 insertions(+), 206 deletions(-)
> 

[...]

> -
>  static bool arm_smmu_dbm_capable(struct arm_smmu_device *smmu)
>  {
>  	u32 features = (ARM_SMMU_FEAT_HD | ARM_SMMU_FEAT_COHERENCY);
> @@ -2831,7 +2785,6 @@ static bool arm_smmu_capable(struct device *dev, enum iommu_cap cap)
>  	case IOMMU_CAP_ENFORCE_CACHE_COHERENCY:
>  		return arm_smmu_master_canwbs(master);
>  	case IOMMU_CAP_NOEXEC:
> -	case IOMMU_CAP_DEFERRED_FLUSH:

Why this is removed? That would drop support for FQ domains.

Thanks,
Mostafa

>  		return true;
>  	case IOMMU_CAP_DIRTY_TRACKING:
>  		return arm_smmu_dbm_capable(master->smmu);

