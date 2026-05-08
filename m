Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B3ECD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 14:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jV748N849RYQi6RggjQ0XmU2FvPCrHd7ojXmcuhGvG8=; b=KYE6KXug9XYoNG4RUFI0MgOyAS
	JEn7CnJEC49BGcEdxjZaZfne2bfh0tAe280Z8M2SIQ5HPlMAEHDxu5rYUp73IoH9SgOlWI6rWlSyJ
	DqUr/xNrJ7fI6OKFQgE1lwc+hNuQbbi4LQQcNYudKrawuejpblGw0wsV6eBfXsUnZxrVR5iTkcHrj
	W7pGvY9/XSUrZlFI6V4A4cRMqeiJ3j34JdYl0QmmhOPiQG/PgY+BWUDBSa2McgUUKvDDtFKcQ/1nJ
	Zkjlj0GLLD5381QdxZblGS3amDRVl93d0oDSG3Lusl4VDb++K3M8DPwfVKRndVIj2jhb/Lz24XDBQ
	8Sc81/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLoC-00000006d2c-2zbt;
	Fri, 08 May 2026 14:04:04 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLoA-00000006d1p-0CzN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 14:04:03 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ba180a022dso88395ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 07:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778249041; x=1778853841; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jV748N849RYQi6RggjQ0XmU2FvPCrHd7ojXmcuhGvG8=;
        b=GrMXVzWxE9QuNLMnLAiq1oqw4axdAmlgbmw7LBR13VxQhbmI+1byOCuWdGh6Qp2VWn
         hU3Op4ssa1uZHWzfzzWRiquDheQ47lodmvbo0iUzZ9ETD1pBKdJ8pswnElkIVrRmLARv
         G7TE9XnPE7T8k0D7VvlJAou3eZtJ4SqZajYCKeLH2NqaxNkOU5LhFGp/WFD2ltUGrZwt
         NqLJcAmfb8pKg9DRrev4J/3HdmGV+ZybusYtdXG9DYxucnwVABFAR6tbrKAos352rshV
         fRW4L6006ZsdjjA834DlhMvtqY/PsnlxJXCFchb3vqeRL0s5DjaCfqcTUNs5dRMWf41i
         IRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778249041; x=1778853841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jV748N849RYQi6RggjQ0XmU2FvPCrHd7ojXmcuhGvG8=;
        b=DefJt2Efqguh0QwUQVXLgU20/ZCm8+Rz6c3+fPkQCChPhzRgsFbpQyIBR33D4B9eWE
         TMyy9JsFxdTvdcjQOIC6gaInO2wudBO+kH3J28eACyIEWxsJ8Ok+izHN7jlqK51nHH4k
         PYgYGA7562lUM2rrEGj5OMBJCEQGYf/TO84+i88azBhmvnZDs0sx8EZtFEcumjHvunee
         Z8QmffyX3V8vD7CoFvq2vai6w0uWZfST1ZXE7VMFRVGmH7Uok0Hl/gSTMXQE5Xj1zN7b
         NwUMxiOh2WzzT4GVk85KWqRjv7fht7xieIitHSPH3JpdC91dw6hshR50KKLHltayjgsU
         8mgw==
X-Forwarded-Encrypted: i=1; AFNElJ+2Pt0mOkgt+yGqr5V/NsCdqKw2e+WZF1d8H8SDxq1MIMgkc86zyKQoWi3WaqOZPW/X1KIbet1oPcH/DI8c1B8z@lists.infradead.org
X-Gm-Message-State: AOJu0YyvNf00DhOcUTqEpkQwlP96v2vwfwJuwfMt0AJ0xlJSzeqH3vyC
	oDE5uNRIsg5QYv4mCWL249PKDxmInrVNb82vdgPdgzRWlEuCESY75Nt77sy3di7TAQ==
X-Gm-Gg: Acq92OHCxenZvUmC3xYTUjF/b7tPqrUrVaXqIoPBBUqn39Md5SatutDWPof75hMd+H4
	bDx0OkjnPXa7z34J5Ue7WuA1NYQGG1LxdiwsY/seFNFTgit+4yG0WolhZwVJleR2aq3+XyOd5mL
	UzBbHkTvr2HyFlB8Nr/sTBj9UezxORYF4be22zY5V+hoQhAWJWfBquwwWJ3XDYMxqK77hzF0Ea+
	vCVZle6Nltw2xirrJ4c9Tv6FMseecne6Iur5e2QIatmOGwWEm4Kd8kXRdKJKBdyey27iOlETg8w
	Opq6aWz8MolsMw5qOJ1jfZsYGxZxuW52qk6scaK9Bs2+RxxTyQtWpSTJMZM0cg96BKk1TJ5VXEd
	xAztXW+JqxJq0FkGeIAk+UvrXjAIJA9M/594kjb5BcOQr9EHgap4m9hsDLdPeJQdq+alCb+U3Cb
	tNoTNw5bGI6D3FN11drTZwEo2skVJXRsyEttyG9psU5WifUGDRLWYrg/o4UItD9BtWa9B/
X-Received: by 2002:a17:903:1b66:b0:2a7:6c4e:5914 with SMTP id d9443c01a7336-2bae9ab0221mr3993415ad.6.1778249040522;
        Fri, 08 May 2026 07:04:00 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367bed0ad05sm18255a91.12.2026.05.08.07.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 07:03:59 -0700 (PDT)
Date: Fri, 8 May 2026 14:03:52 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 0/9] Remove SMMUv3 struct arm_smmu_cmdq_ent
Message-ID: <af3tSOYMS-X43B4N@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_070402_093242_B16AF5CC 
X-CRM114-Status: GOOD (  25.76  )
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
> 
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

I was able to test this with 7.1-rc3 on an Arm server with the 
iova_stress test [1]. For the series:

Tested-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

[1] https://github.com/soleen/iova_stress

