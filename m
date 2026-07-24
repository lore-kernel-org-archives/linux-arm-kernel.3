Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08966C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 19:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvsKfAGO1/G1RkKRO+bqMq0Jxexy/5+6v+o5lfiDScQ=; b=AsiSsrxRgy+YXoIpYft28OFYbN
	cTCoyqqYPoAE3wW5QFZ6q7qujKnQSEN0YkVV9EOL0vu2AHuqgGVXHYYvil1LLDXN8lRZoTiwng4oK
	eBcA6Fjel4BrKzmql6tGbMTGrCN+B0MtJLhDvw6DsRu5DVkWPuKu2SfLElNehS9oF2xe7ue4DgRxD
	F+8sl2HFBaUiW3mxAuNEiF1cN7xDnvzH/ans5CSkAXQfME4nOQ5LRqr5tEliiMK2QDrk2jkid4CK4
	5mGLsqiPwJqkgS2dfpmvRyRDxgOUp95KODiwk7ShzQ1ERSZZQCPrwKoE+rp/MfwIomxTaePHjKPWd
	SkKg3+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLh3-0000000HB4J-3Rjh;
	Fri, 24 Jul 2026 19:36:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLh1-0000000HB3X-0Alh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 19:36:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493be0fbcc5so10355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 12:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784921781; x=1785526581; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vvsKfAGO1/G1RkKRO+bqMq0Jxexy/5+6v+o5lfiDScQ=;
        b=VjPKw1o90iwAysx1WJ7nBpxnAeGrqNeH7A4m2BEBzGQMB5r1rSODvyLpYz/aRUU7s+
         RSb1t3PENLTjdD0+YraBDj+OOQxJCNLgfSoDeO1YMMn1FesHJ5P0+e7jhudf0b/0NM7I
         aevKYJ3Cx4fr3B4DKTwp3xJjokBufBvzdwIefnkPJdSdEomiHiGpqMF2gd5BlkO7m9Qp
         shYkWDOT5WiAgXCzkTGibaTXROMcQ5crKZYzY6r+I22l8k6pLpvWd2Iktwowm4hZOBc/
         /ocbOGguyNapK/cEAU0lUQ254DgUBpgcqbdB0QNY6V5RG7rPC4r/sKbAhn1YvJOv/IVF
         k/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784921781; x=1785526581;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvsKfAGO1/G1RkKRO+bqMq0Jxexy/5+6v+o5lfiDScQ=;
        b=KiNTSSOylOdtwN3qnxyx2Tw1QPhr5X5kvHPbQLT6pbGqzIJwMGCHCNVqCDvoNGn6R9
         EBCCHvWHXTksnMtptSd7j0DcCr1lBQxwtMrvBftgt9KCqL6pf93KkcQJ2BP2lBSue9vw
         SkT+m95y1zExRMHqsfMUl4GygNrS7CU5I+YUjFQbx8EXs8tNCuu0E7JjVNzArY3bTtGF
         b8Ue9QVJFQ67DiEElq9v9KpggGPjgEClYX9MPUOmDzYu/X8JpML7Iac42Vv0M1N6kgJt
         QndO3CjBxPkz0J/1eWbCc8uNcwIAg/TTS+0VQ1PwH3wutAEYWodKZLTzn3Oc0K/X1d8B
         u0cw==
X-Forwarded-Encrypted: i=1; AHgh+RpiaUhRry66q1aPpB++571i3eEkuFkE8+pVz12Q96Ml4kqlHLbk8c2m5UIFeaTTZdyvXqiF5aIqIdxsGeXqkBWj@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn0C9XT/QUyuekoFb1wlDdtr0iTGFQy61+tQOfXk//Na/YYxrN
	/BgbxIGN4/v3VJMGRpvpGK6HUD/We803mr3QlXo/O9pyBDf5YeEMf6JJ+PiYuJpo9A==
X-Gm-Gg: AR+sD11kRzY2ioyF2u5tXsndpFxIlC6mCjLP8CHqz1Tbox06E2rly5HmLigcSvYykBY
	+doCirSIZ63z1lCaKPVgqNmdu/lGhtt09e9N0otaid7E3gll1eUAjCsTxgC0cXdfcdpYHuXPN4H
	dEXvjMesiNbcFmuERc/sGfclLQaZknd/1MFWhp5i83zMIno5tXobvu+GOf1zZm/4pN5Uax7esr4
	v789UdNgCyOD0w7BhoyLkY+HoWKRaQ61lVdrM4s+MP2ENbcXmyugUfPkSNyOzWkkzKkE2kjyAae
	t5eTQBMguLHl9BqnU7UTQNN9s2Tm/jHJXyudwNYWbCfVsx/YNniMakGrF74HL3L5GGKkyWpwMhc
	VwxUaFTEBFpWCwJLttrcnHOG+oKCCjFb1LiQfH9c22QQdoPQK0dx5Q/B8GUbX2gN/GedeN2k5mq
	VFlbU4cRERrLo4Jq8whh4WFBEGYo5go4nMW3yTMhEOGsovT8OC
X-Received: by 2002:a7b:c311:0:b0:48a:623c:8859 with SMTP id 5b1f17b1804b1-496b4d58803mr116215e9.7.1784921780558;
        Fri, 24 Jul 2026 12:36:20 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b480fafasm17596165e9.0.2026.07.24.12.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:36:19 -0700 (PDT)
Date: Fri, 24 Jul 2026 19:36:16 +0000
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
Subject: Re: [PATCH 0/7] Use the generic iommu page table for SMMUv3
Message-ID: <amO-sGlWsmtcPsDZ@google.com>
References: <0-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_123623_109978_087A4985 
X-CRM114-Status: GOOD (  30.01  )
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

On Mon, Jul 06, 2026 at 01:29:06PM -0300, Jason Gunthorpe wrote:
> [ This is the last patch to move SMMUv3 over to the generic page
>   table:
> 1) Organize the SMMUv3 invalidation flow so iommupt can use it
>   ..
> 2) Use the generic iommu page table for SMMUv3
> 
> It depends on #1
> 
> The whole branch is here:
>    https://github.com/jgunthorpe/linux/commits/iommu_pt_arm64/
> ]
> 
> Introduce the generic page table for what the ARM spec calls VMSAv8-64
> (ie the long 64 bit PTE page table, io-pgtable-arm.c) and use it for
> SMMUv3. ARM is by far the most complex page table of all the ones
> implemented, it has the most runtime behavior variations and a lot of
> features.
> 
> Like the othe architectures, the page table itself is supported by a kunit
> compare test that runs operations through both io-pgtable-arm.c and the
> new code then checks for identical PTEs. This is on the github link above
> but I don't intend to merge it.
> 
> The existing kunit tests for iommupt will automatically cover the new
> format as well.
> 
> This is the final series migrating the SMMUv3 driver over to use the new
> functions and remove io-pgtable-arm.c usage. In principle the other iommu
> drivers that use io-pgtable-arm could be converted someday as well.
> 
> Robin once mentioned there were errata about contiguous bits, I only found
> 3673557 and it is mitigated in this design by always using RIL. I'm
> assuming that RIL is always available in SMMUs that are effected by
> 3673557? I have a patch add a FEAT if for contiguous bits if that is
> required.
> 
> Jason Gunthorpe (7):
>   iommupt: Remove the sanity check for pt_num_items_lg2() at the top
>     level
>   iommupt/kunit: Skip test configs without supported features
>   iommupt: Add the 64 bit ARMv8 page table format
>   iommu/arm-smmu-v3: Remove io-pgtable-arm from sva.c
>   iommu/arm-smmu-v3: Move the DMA API comment to flush_iotlb_all
>   iommu/arm-smmu-v3: Use the generic iommu page table
>   iommu: Remove pgsize from iommu_iotlb_gather

I went through the series, it seems the arm work plug in nicely with
the iommupt stuff, I left some comments around, but I feel that
patches 1,2 and 5 can be sent separately.

And patch 8 it too large to review, it would be better to split into
3-6 patches, I was thinking: base support, dirty tracking, contig bit
aarch32 and kunit.

Thanks,
Mostafa

> 
>  drivers/iommu/arm/Kconfig                     |    4 +-
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |   13 +-
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  |   45 +-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  287 ++---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   18 +-
>  drivers/iommu/generic_pt/.kunitconfig         |    1 +
>  drivers/iommu/generic_pt/Kconfig              |   12 +
>  drivers/iommu/generic_pt/fmt/Makefile         |    2 +
>  drivers/iommu/generic_pt/fmt/armv8.h          | 1124 +++++++++++++++++
>  drivers/iommu/generic_pt/fmt/defs_armv8.h     |   23 +
>  drivers/iommu/generic_pt/fmt/iommu_armv8.c    |   13 +
>  drivers/iommu/generic_pt/iommu_pt.h           |   14 -
>  drivers/iommu/generic_pt/kunit_iommu.h        |   10 +
>  include/linux/generic_pt/common.h             |   42 +
>  include/linux/generic_pt/iommu.h              |   73 ++
>  include/linux/iommu.h                         |   62 +-
>  16 files changed, 1452 insertions(+), 291 deletions(-)
>  create mode 100644 drivers/iommu/generic_pt/fmt/armv8.h
>  create mode 100644 drivers/iommu/generic_pt/fmt/defs_armv8.h
>  create mode 100644 drivers/iommu/generic_pt/fmt/iommu_armv8.c
> 
> 
> base-commit: 8cd13c14dcc29762766ff9ca2f67e3bae7c7cb77
> -- 
> 2.43.0
> 

