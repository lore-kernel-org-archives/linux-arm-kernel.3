Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0BC109024E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lv3lHA7Am34IVdGQCa5Kj30Y+ZqMeJwbbeWh1Al2jWc=; b=oJc8oM5/bFnSV9D+/9XA4tJMbF
	si9cM8GT8BhayqhGs7q+7ML+tkE54yB/IRP7yiVirgSc4+3A4uw7pZ93MmrhRLWpUleKM0nT6ggPT
	6h3VvNGv/HkwWe4S9fHE0g/pCMPUWB5b9dYbyXy/wCJFOixQ4T4M7UpNi40SNF/6x4LKNR3++5LYA
	z/Vt+mubHaHYMNj4+ZkSG2bsdNE2PgWt8oiCFsVtVt7uYhiJF3CXqPMht8Qb+g77GXIxCxAv9TUIN
	ChdCKRN3MKx/LHb1daGd3guQ68nvX+OdXa2aqVrL9Dv8XBtsA/2JbgF2NpRYO+p6ukPPU4w0XfxAs
	XJXTU+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GCi-0000000B4WP-1dKE;
	Thu, 19 Mar 2026 16:26:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GCc-0000000B4Va-02VV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:26:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2068C60097;
	Thu, 19 Mar 2026 16:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D861C19424;
	Thu, 19 Mar 2026 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773937588;
	bh=3unA1PwfL2Fg34GNfzHISq0EoNO+jPqZ9/aavZeuSeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ulPuAquROn7u7UJkt+WmVJuX2QSMIFnI/wXrEBxU3zlx3/2XY2nlFL20ONFJcV6yW
	 0fgO9FZT+oL5LSRfe1G/l+wR+fdVqSCaniIXj2pADxaaGznmz/jZuOEBRbNcV4DTqB
	 /SrR0XigW3jph0Z9+P5uQLQDrRXVdv1PvHRIJqsqlnQYfh1d9J8riYPHChCAzdloIf
	 APnPh6c6ozB++4I64/iYh9hNqxUb90fS4OTGWl322yypVol4lRIFdHAk/GCYw5uSRx
	 HzxqGIW7nMU/YvclTmOzzyBKqm5HINfj/Oeg8n4MwYJb4CjyjlwdP84EebHJv8Dk08
	 NLttWWNmGcLPA==
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	jpb@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org,
	balbirs@nvidia.com,
	praan@google.com,
	miko.lenczewski@arm.com,
	smostafa@google.com,
	xueshuai@linux.alibaba.com,
	baolu.lu@linux.intel.com,
	kevin.tian@intel.com,
	mshavit@google.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	peterz@infradead.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v13 0/8] iommu/arm-smmu-v3: Introduce an RCU-protected invalidation array
Date: Thu, 19 Mar 2026 16:26:09 +0000
Message-ID: <177393290314.3824125.1547121281315179805.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773733797.git.nicolinc@nvidia.com>
References: <cover.1773733797.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 17 Mar 2026 00:59:15 -0700, Nicolin Chen wrote:
> This is a work based on Jason's design and algorithm. This implementation
> follows his initial draft and revising as well.
> 
> The new arm_smmu_invs array is an RCU-protected array, mutated when device
> attach to the domain, iterated when an invalidation is required for IOPTE
> changes in this domain. This keeps the current invalidation efficiency of
> a smb_mb() followed by a conditional rwlock replacing the atomic/spinlock
> combination.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/8] iommu/arm-smmu-v3: Add a missing dma_wmb() for hitless STE update
      https://git.kernel.org/iommu/c/6fabce53f6b9
[2/8] iommu/arm-smmu-v3: Explicitly set smmu_domain->stage for SVA
      https://git.kernel.org/iommu/c/9b056856880a
[3/8] iommu/arm-smmu-v3: Add an inline arm_smmu_domain_free()
      https://git.kernel.org/iommu/c/c317452f5a22
[4/8] iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array
      https://git.kernel.org/iommu/c/15a2a5645ad7
[5/8] iommu/arm-smmu-v3: Pre-allocate a per-master invalidation array
      https://git.kernel.org/iommu/c/e3a56b37bf75
[6/8] iommu/arm-smmu-v3: Populate smmu_domain->invs when attaching masters
      https://git.kernel.org/iommu/c/b77429757e45
[7/8] iommu/arm-smmu-v3: Add arm_smmu_invs based arm_smmu_domain_inv_range()
      https://git.kernel.org/iommu/c/587bb3e56a2c
[8/8] iommu/arm-smmu-v3: Perform per-domain invalidations using arm_smmu_invs
      https://git.kernel.org/iommu/c/4202fddd01c7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

