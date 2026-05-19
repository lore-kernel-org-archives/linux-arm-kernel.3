Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C5ECD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hi0Lpb7+ajQvg7rhxnw1FE+ra/clMpc2Zg/OZkolwL8=; b=U7FJHJ4ssGurw3+zHkb4+nbrzf
	hbFbNCf2MSwMvyPh28L1lHtWXu0gbRcRPdii/TtDHMf+j8CzgLadUz1sGs/cjb4rzfb1qoQn8adrx
	vHvhkzBDqA4z/zTUnjZpturuEBin/OMd8A6gAsMF1/NOHEoSs5gIdYy0bK1bKrTng2N2HKxTLorac
	9o6B2kR+sUMzJeZHYiCO3M93fcZNgSW6Jf4HYD677fi2ET3jO53iCDG3ZKvJViN0HEewBveCsAexd
	9k6FNTo7oAPh1Jakea2fKWw8U+fETmhvcCzjulNIbzfFH+jfFmJXpXFVdEbLxzO+tKtKggKWSRhsg
	LO6LFcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIa-000000020nQ-3XYR;
	Tue, 19 May 2026 15:24:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIS-000000020ib-1kH0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:23:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 26EBF43616;
	Tue, 19 May 2026 15:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD92C2BCB3;
	Tue, 19 May 2026 15:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204232;
	bh=EcYgGA7+qxpGDVJn+BOWyz9F6ILNNr7DE0ak3LTgO3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uwVnXFU0sfkq9f5+QC+fiz9RkLgBmIu78FNEThTdjkRihuLffFJD+bjCOtRBBF4Tu
	 qxYaQo0oLYzphwHooYty8/w2PUsj1WdRBUvmEBBXfjxLnmEAB9EK1Ic3faW9h1aInA
	 SFvHAdif9+B8ooFvTohsIEQxdi1UFiZdejEOiL2KpBp42+qJuTVxndR19UVRpKEMpC
	 5SYqYaNnlO9Oh2WR6rmfXVCkGzupA4IdHJiCa/suAhYyKPzFRRrJ6xT7kxBTCOpEgc
	 ZKQNncFlTuZXJlLCvCu4UUILTCsK57QB7AA8xF8XkmIzWOdVh1K+1oWeimhB7aboX4
	 roEEhF26lB/YQ==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux.dev,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 0/9] Remove SMMUv3 struct arm_smmu_cmdq_ent
Date: Tue, 19 May 2026 16:22:58 +0100
Message-ID: <177919957385.1012282.14787407041669291032.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <0-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
References: <0-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_082352_481106_C585C0CE 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

On Wed, 13 May 2026 20:57:39 -0300, Jason Gunthorpe wrote:
> [ This is part of the patch pile to move SMMUv3 over to the generic page
> table:
> 1) Introduction of new gather items and RISCV usage
>   https://patch.msgid.link/r/0-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com
> 2) Remove SMMUv3 struct arm_smmu_cmdq_ent
> 3) Organize the SMMUv3 invalidation flow so iommupt can use it
> 4) Use the generic iommu page table for SMMUv3
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/9] iommu/arm-smmu-v3: Add struct arm_smmu_cmd to represent the HW format command
      https://git.kernel.org/iommu/c/bf00a29234a4
[2/9] iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq selection functions
      https://git.kernel.org/iommu/c/f59c5b6858d8
[3/9] iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq submission functions
      https://git.kernel.org/iommu/c/d455e3a7bf0a
[4/9] iommu/arm-smmu-v3: Convert arm_smmu_cmdq_batch cmds to struct arm_smmu_cmd
      https://git.kernel.org/iommu/c/27e02ca61552
[5/9] iommu/arm-smmu-v3: Remove CMDQ_OP_CFGI_CD_ALL from arm_smmu_cmdq_build_cmd()
      https://git.kernel.org/iommu/c/c5758947cb7b
[6/9] iommu/arm-smmu-v3: Directly encode simple commands
      https://git.kernel.org/iommu/c/6e771be45e8a
[7/9] iommu/arm-smmu-v3: Directly encode CMDQ_OP_ATC_INV
      https://git.kernel.org/iommu/c/2eedb906f9c6
[8/9] iommu/arm-smmu-v3: Directly encode CMDQ_OP_SYNC
      https://git.kernel.org/iommu/c/c3f84707ad4f
[9/9] iommu/arm-smmu-v3: Directly encode TLBI commands
      https://git.kernel.org/iommu/c/be0d0b858861

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

