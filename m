Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2446CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 00:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xi6UMXsamXS4nO8ukGa9Mfe0AvlJid/kwLk/3dcmb4k=; b=bJiHl7lBP6kfESErgjU0wzGYzm
	u70BZBiROWbXmOfKoM2SDTFMskGu1808Zd2d6gz0psLrQdd09Gloq0AOGzcTOouzZv4L/rGwDoZVj
	t1UiugK7lJEJ9FfTeYuR7lMwvnu7cLQTv9F4wdHg5zdaom6w3Ii/Z5D/x+KzfT1S9EOwgCWMb3rXV
	aI7sJbkfish/z8HLA92k0lzXP2JNuJXi7/QbH1k77kcudlt6zMmQ32aPzWJxYIaI/udGXNXXh1H12
	gXQaAiTEzmc67nz2jMRKS3HVIubjiq3rgH8RlUoOFi4b+TatRMPmYYqLa5rnABRguKiUWzuGSuBEA
	fZ30owlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO3Aq-00000009pPQ-22Ep;
	Sat, 16 May 2026 00:46:36 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO3An-00000009pOt-3RvA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 00:46:35 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-133362c30cfso9c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 17:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778892392; x=1779497192; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xi6UMXsamXS4nO8ukGa9Mfe0AvlJid/kwLk/3dcmb4k=;
        b=cNqHoeDlnkXAmhdc3E9FzZL4mvBDv38dui+yHLMZ+V7qdgDFdnDHbnMwYwlytwPhk6
         99WAVHwPW9x7i5vCBNZiMmjfx4Gam7XkHBn3so1rLVP08+/1BDqiQArP0SaS3JA+hn/E
         nyMKh19zh8Ws6CDLHKTpAuCU3TUOKU6vtLkCxm0NnetMHVm9gB8cw1rQ2sg5wEohF4zc
         JXLtmpDdezA228hX+VWRoLkRngLsqlBMq98T3q/mJyuaPD90zefQ9DK1d/1PujcYx1/O
         /1Q9xUYxqbvjYmMeFPiE1GbDa5Qm/3sPbQqKpxjHqCthygeC69+qlxFDq40qzDFgA3il
         Vc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778892392; x=1779497192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xi6UMXsamXS4nO8ukGa9Mfe0AvlJid/kwLk/3dcmb4k=;
        b=B7EE+4eIhrmHrzKtZyLA2JH+H5hTAn3FKdoIITbfoA/geONdAw0vJTT0a2XjaBzlkz
         wXkQlM9s7M4GPcdQifxFKR03uSBVYQmWbgujk6OqIUVeFm41IC3d8hMpPOdyp1+rPxjw
         PvW/CdO5QNlQ3bUL6Il9Rl5X+wfqhGJsWnrZTmXaASUignjHFqb0dkqR8AkiXG8UN8bf
         h8rmLdo3c9r1szNO8H87hfP3OVz4aGm4+mSJJjFJG1TeG4hEJJIc6NH3Q7k8J56oj4O6
         zYxLA5KX7an8HJrhBVPxuy2gSQ3icWZ9KZD8qS4N2U86BkL1sZYZeO7oNYTUtKCJEIOf
         oYNw==
X-Forwarded-Encrypted: i=1; AFNElJ/EgEYmAfA31nZia4Pev8raks1YlxfhoYTL6TloHPomNiO4zBiuw4qHa8z4heyXXyl3TWwXWNUBTztlt7m5nMvA@lists.infradead.org
X-Gm-Message-State: AOJu0YxvYOW6vN2Z0DSuou4DKbF3/5la2z2yyFz6yWzpl87NYKUEz0VI
	mtLD3Mtd6SSk1isOjzAbV02R/ja/qJAAFygjI9374o+QqjBk8x9qzKXI6uNCcJX1Rg==
X-Gm-Gg: Acq92OEw4wG2v72YRi6KGVBB8rEqXInPvOtmDZF+kqYAcMimDO/ZtxWC11YxBNYuK18
	KG84rZb/mPXCL9WRJ5mOSd7MSZtqt6npgETDH8ctydM71oeS1DM+O9pBUXRwGA8i2s68le5JgRI
	zSG4IlC2NS43lBYRcHJz4ZyWMiMqfZlME/xbwCqi5HY9ZLTO5q0yo/dlrEIP0TUDO7Fh6HUcfE+
	MiFPA91LDWcBS3UgIsHdEy3//bzifQSu/Ss+WNV+pECnpT//6UlShk127NOyhaMn1CGjqoGuYPq
	fKHflRb6e3ptvX3smL1H5ORL81gLEDvJtx61l/JhtF5pDY73mEli+srirq84j1jhUp3OmIhCGbS
	uhuyh0YVWSFloVNDYuWswD/ujdpCt5NlcYMOfkgMXHYLBOIc6JTdi2Phg4lauHgJcw8wOKpQUme
	eaasILbQTPL6zPrdgjv0bga1QsJQAXNscmqCAP1kcB7sqp1Sm98WHQv5Um/vop0oGbxnfO2A==
X-Received: by 2002:a05:7022:fa02:b0:134:f1e8:e59a with SMTP id a92af1059eb24-1354506413fmr21692c88.27.1778892391267;
        Fri, 15 May 2026 17:46:31 -0700 (PDT)
Received: from google.com (153.46.83.34.bc.googleusercontent.com. [34.83.46.153])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm11830580c88.3.2026.05.15.17.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 17:46:30 -0700 (PDT)
Date: Sat, 16 May 2026 00:46:26 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>, 
	David Matlack <dmatlack@google.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev, Pranjal Shrivastava <praan@google.com>, 
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 0/9] Remove SMMUv3 struct arm_smmu_cmdq_ent
Message-ID: <age-DpeiCWBj7UPu@google.com>
References: <0-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <0-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_174633_896674_A21A54EE 
X-CRM114-Status: GOOD (  19.59  )
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

On Wed, May 13, 2026 at 08:57:39PM -0300, Jason Gunthorpe wrote:
>[ This is part of the patch pile to move SMMUv3 over to the generic page
>table:
>1) Introduction of new gather items and RISCV usage
>  https://patch.msgid.link/r/0-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com
>2) Remove SMMUv3 struct arm_smmu_cmdq_ent
>3) Organize the SMMUv3 invalidation flow so iommupt can use it
>4) Use the generic iommu page table for SMMUv3
>
>The whole branch is here:
>   https://github.com/jgunthorpe/linux/commits/iommu_pt_arm64/
>]
>
>The invalidation logic has this multi-step process where it first
>writes the command into a 32 byte struct arm_smmu_cmdq_ent, then it
>calls a function which converts it into a 16 byte HW struct, and
>sometimes it then edits the HW struct a little bit before passing it
>off to the batch or submission functions.
>
>Instead just generate the HW struct directly by moving the FIELD_PREP
>blocks out of the big case statement and into helper functions. Call the
>right function in all the places that were building arm_smmu_cmdq_ent.
>
>Add a type for the CMDQ entry similar to the STE/CD types that wraps the
>two u64s for clarity and use it everywhere.
>
>This is intended to have no functional change. It makes the following
>patches work better and removes a bunch of LOC. I've run several AI tools
>with instruction to look for functional changes, which did find one subtle
>mistake in PRI response.
>
>The removal of arm_smmu_cmdq_build_cmd() also achieves what Mostafa is
>doing in the pkvm series by making the command formation entirely header
>based with the arm_smmu_make_cmd_*() mini inlines.
>
>This series has no dependencies. Several people have already tested this
>on various ARM systems along with the full iommupt conversion.
>
>v2:
> - Collect tags and add a commit message note about ATS
>v1: https://patch.msgid.link/r/0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com
>
>Jason Gunthorpe (9):
>  iommu/arm-smmu-v3: Add struct arm_smmu_cmd to represent the HW format
>    command
>  iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq selection functions
>  iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq submission
>    functions
>  iommu/arm-smmu-v3: Convert arm_smmu_cmdq_batch cmds to struct
>    arm_smmu_cmd
>  iommu/arm-smmu-v3: Remove CMDQ_OP_CFGI_CD_ALL from
>    arm_smmu_cmdq_build_cmd()
>  iommu/arm-smmu-v3: Directly encode simple commands
>  iommu/arm-smmu-v3: Directly encode CMDQ_OP_ATC_INV
>  iommu/arm-smmu-v3: Directly encode CMDQ_OP_SYNC
>  iommu/arm-smmu-v3: Directly encode TLBI commands
>
> .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  24 +-
> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 475 +++++++-----------
> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 248 +++++----
> .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  16 +-
> 4 files changed, 350 insertions(+), 413 deletions(-)
>
>
>base-commit: d8fa633ffaf43316bc3ee8d7b21366cc92c02002
>-- 
>2.43.0
>
>

Sanity tested on non-coherent rockchip rk3588s with nvme.

Tested-by: Samiullah Khawaja <skhawaja@google.com>

