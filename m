Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDDECD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlD/sZLAbq1YNiDypmu5ohGMtt+/3desZPPRaicZ4+Q=; b=v7/Zix+x/bWye8kBsqO6BQVe2Q
	S2JbFylT+sXHMk7ib42+pnCndnZK8470h67ChhEIllgtoXRAslMIxV9Gd7DOkC5FdLrW/H36vrPNn
	/0WQscUNHb0ZiLHrJLL+TylfEpIU5k3EPvXk/kNpLgog5MxzG7CPpHI0Y4ak+lsWLsmLWoRuLrtWE
	2EOt6XOcq38j1FwwiC85+zMyiJ10X/p7qlDVRT5k38KksSpv3adAPk8ExfzY+3nQEBozfYa0BUey6
	pFV9sY+r9eOZXrU35fTrw37H8LupABjdrFA64p+XH5FOMQiEeMQ+zZifyXH+XfZgtsSoyENKlULKz
	1vaChvOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuzr-00000003L0h-3bo1;
	Thu, 07 May 2026 09:26:19 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuzp-00000003Kzz-0iyJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:26:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so68455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778145975; x=1778750775; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IlD/sZLAbq1YNiDypmu5ohGMtt+/3desZPPRaicZ4+Q=;
        b=NY74afFrNXDReBhhQ9apFtBCGF+czwugEsbtDd4/311BgpNTzlFv3sf7ewaJgMYsr9
         HzwWqvs+MGXjKK3K3Ed4/gB0heCNY52IeHgedCzGzY02VpnsUy7ipfES/ZM7vjSOIQ5G
         pa2RIDT6ypnRVP+EianO/W1u1BomDK8+3a0QdJT6lAYOAMm08EyfGq2t/vWAtIfYO09j
         ++KRIs3186xNREj/Xr10CktvI68ZD4CDywCDdqpwO/maZomdGOZJrL2bc3NtYkMQdDkT
         M8MjPVvCIL32pMjEwkuwpva4uK14C2qHuvlR/UNmjh/kKHmlUsLhfM4+fwUJNim7mkip
         cRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145975; x=1778750775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IlD/sZLAbq1YNiDypmu5ohGMtt+/3desZPPRaicZ4+Q=;
        b=tY1yxxPKAq/1ChuYiXkE1NqQOu2ZBqozwuPtIXvglEhQoJT44kc5VmSEbVL2zokeRU
         iIBan/tYYFV//IFGZmp2dOcOZ2ZEuBfZxEhVc4Iz4xomeyKPfaDfzXTVH4zAKZc76GIo
         p4Ean+J7sxgL2JZQxbTi+3yznuzkTyi0LBFAG5YpHuGFIdqspLS1HYje5YgHWgEcBxk3
         33jNizSDgJDfvsOoSvqIThT115XYstverY4qSB00rpqHVZxTnibWK5jfR8KPPmrwL+VT
         yBecrzCCIYKQc9C5/Y/P1TLMZh9S3TWDLK9UkwnkcbatBoi7RJDEV9kSWCSwbg/EmroT
         LS/g==
X-Forwarded-Encrypted: i=1; AFNElJ+g+FY65oDFXw1TN2aJT/FpQZbuqH9bPrbwBr/6eW5yAKQ//dQUq26gxdM+/JpRaD17EaSdtmsh98/xsnqsNWcE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1/pfSNS1JmVkxrTLlzay14VV1t3/6Fl80y4APrvqXej0oOgzm
	fR6dDEouDIH5x49evkGCsB/fIbTnWiSjz+VKtqLKRfybPSURKkAe8s+0+IHraUetEg==
X-Gm-Gg: AeBDievOvO1Jtogz+mpbWyRuwJpDQcSvPqphHDBpnc1FWxqNFMGaD5g+5zCedhjjqAo
	H1T5GZoEI7UmvP27Sbp7WJ0JJ3WfXXpWux/5m+wqrPAJugAfnvidgDrh2pXSTo3LdIQ/WjBa+cc
	2YVkWpiiikKboTsiw1RfTrXaTmmd2VvM7Cc3YYN4eWyFxLZJX6kZ4asP112qG8np8IvTInvMUNX
	ggX0eH33shHWkXVV1YOXNUxr87mdT/wy/LMiGyturf9BM4usHzWOdDv+TWaeGCb9GgmUYsYWJ46
	8FWhKHzR9NGPI5FY5WK2p/Hvf3x4QHudSU+8qPVlbojjISlUdefZLXCyQfEKINkp8v4SrQxs+OG
	2ilKrKo/AKf0s+mo9dfpc3WHt38eRuS6ptw0pOHPDcGyEA/Uns4ivk8/s07uzrB66brAUbp6x44
	aJ+I8Eh6f+xgaXSGsco/eQfXvcWC3hMDdd8vLxffZbhNZeaDnYYlkqIHQVxKsb8pH5mK2LVeno1
	dN8qpTr6BfFRpE4
X-Received: by 2002:a05:600c:3b88:b0:489:1adc:f017 with SMTP id 5b1f17b1804b1-48e52ef5224mr3387525e9.5.1778145975038;
        Thu, 07 May 2026 02:26:15 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53907a00sm99399225e9.12.2026.05.07.02.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:26:14 -0700 (PDT)
Date: Thu, 7 May 2026 09:26:10 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH 0/9] Remove SMMUv3 struct arm_smmu_cmdq_ent
Message-ID: <afxasmHvZVl1iQgz@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_022617_226395_6E414769 
X-CRM114-Status: GOOD (  27.82  )
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

On Fri, May 01, 2026 at 11:29:09AM -0300, Jason Gunthorpe wrote:
> [ This is part of the patch pile to move SMMUv3 over to the generic page
> table:
> 1) Introduction of new gather items and RISCV usage
>   https://patch.msgid.link/r/0-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com
> 2) Remove SMMUv3 struct arm_smmu_cmdq_ent
> 3) Organize the SMMUv3 invalidation flow so iommupt can use it
> 4) Use the generic iommu page table for SMMUv3
> 
> The whole branch is here:
>    https://github.com/jgunthorpe/linux/commits/iommu_pt_arm64/
> ]
> 
> The invalidation logic has this multi-step process where it first
> writes the command into a 32 byte struct arm_smmu_cmdq_ent, then it
> calls a function which converts it into a 16 byte HW struct, and
> sometimes it then edits the HW struct a little bit before passing it
> off to the batch or submission functions.
> 
> Instead just generate the HW struct directly by moving the FIELD_PREP
> blocks out of the big case statement and into helper functions. Call the
> right function in all the places that were building arm_smmu_cmdq_ent.
> 
> Add a type for the CMDQ entry similar to the STE/CD types that wraps the
> two u64s for clarity and use it everywhere.
> 
> This is intended to have no functional change. It makes the following
> patches work better and removes a bunch of LOC. I've run several AI tools
> with instruction to look for functional changes, which did find one subtle
> mistake in PRI response.
> 
> The removal of arm_smmu_cmdq_build_cmd() also achieves what Mostafa is
> doing in the pkvm series by making the command formation entirely header
> based with the arm_smmu_make_cmd_*() mini inlines.

I was able to rebase my pKVM series on top of this and it works fine with
just the helpers in the headers, so splitting of the build command is not
needed anymore for pKVM.

I also did test the whole series with just the upstream kernel on my
Lenovo setup.

Tested-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> This series has no dependencies. Several people have already tested this
> on various ARM systems along with the full iommupt conversion.
> 
> Jason Gunthorpe (9):
>   iommu/arm-smmu-v3: Add struct arm_smmu_cmd to represent the HW format
>     command
>   iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq selection functions
>   iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq submission
>     functions
>   iommu/arm-smmu-v3: Convert arm_smmu_cmdq_batch cmds to struct
>     arm_smmu_cmd
>   iommu/arm-smmu-v3: Remove CMDQ_OP_CFGI_CD_ALL from
>     arm_smmu_cmdq_build_cmd()
>   iommu/arm-smmu-v3: Directly encode simple commands
>   iommu/arm-smmu-v3: Directly encode CMDQ_OP_ATC_INV
>   iommu/arm-smmu-v3: Directly encode CMDQ_OP_SYNC
>   iommu/arm-smmu-v3: Directly encode TLBI commands
> 
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  24 +-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 475 +++++++-----------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 248 +++++----
>  .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  16 +-
>  4 files changed, 350 insertions(+), 413 deletions(-)
> 
> 
> base-commit: 1338d1bd1ea27bfe2cd1c4494547d409016a6644
> -- 
> 2.43.0
> 

