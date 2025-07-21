Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DB8C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 19:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGQPWNQH6auGewqnWXmAXdt+WrF93YfTwRXbxUGs1ds=; b=O/GQ1iShfV6J6ZvhNmuANLMeIc
	6vo2+Ix0hFvfRMNgki85epHo6MNd/jaJORb+qoGasnS7IEx3we3pvmBXvVElcup1DetUtq60Ggft4
	lXECVglTlNZ1KetbGODLV5KlMyvu5NpB/SY8gCRHsXiecc3k7lcdJPqGeT1f59svsax2Nh4NVUQ5J
	AWZ47tIaHdLeg2fvO6M4mn+disJG0hhoOWr5clAoKUPHkJ8f6b/ljFuZTm0Mt1W9HBXZj6+RxAb51
	yZlKqB82iGMmWEy8qDdew75OwY/+yfemrLW2wANBvZ+OQwCOP2XrtmthSNqqiotwJs+pZGjsmPvhA
	JeJHgJAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udw9Q-00000000WBz-13Fx;
	Mon, 21 Jul 2025 19:26:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udw6w-00000000Vyl-2kdp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 19:23:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B202E5C62CE;
	Mon, 21 Jul 2025 19:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2949C4CEED;
	Mon, 21 Jul 2025 19:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753125821;
	bh=Aws3PhmMgoBZ58qJM7UE1xab7bz1LhXmpSvwVKlcB+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PL+KKSZnBXHZpDllvLIVOosemhc1Ker6OgY95UYhzdDRMWX2Rfrt5r299/Q3RIfUg
	 RPRTawET1NkkiQjmkifIXqjRa+hDGUJRxIxvjBGPAd9XjSlX0pffoFcWwB60vbm/9o
	 ILUGtXLbFp7w/m/6/gkVtPbw0HAhJbgaLjx2FomVI9CpapYAlr735kk0nIk1ChCmJC
	 fm4niJFKVCR77ogTpcHQAMvaZqxZMjURJCd5Mb/iDMUgavAg3sNk22XwDhEPlEoNbM
	 5D98rLIpv5u8cZsZKpLtWwj6a8VSC+3lEY9sAolvvw8yJMXLRzBaH5NRprSmcYcw+P
	 nPudwUgR+ZcMg==
Date: Mon, 21 Jul 2025 20:23:36 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 1/2] iommu/arm-smmu-v3: Do not bother impl_ops if
 IOMMU_VIOMMU_TYPE_ARM_SMMUV3
Message-ID: <aH6TuLAz4DeoLByx@willie-the-truck>
References: <20250721191236.1739951-1-nicolinc@nvidia.com>
 <20250721191236.1739951-2-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721191236.1739951-2-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_122342_732521_6A2E2BD0 
X-CRM114-Status: GOOD (  20.93  )
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

On Mon, Jul 21, 2025 at 12:12:35PM -0700, Nicolin Chen wrote:
> When viommu type is IOMMU_VIOMMU_TYPE_ARM_SMMUV3, always return or init the
> standard struct arm_vsmmu, instead of going through impl_ops that must have
> its own viommu type than the standard IOMMU_VIOMMU_TYPE_ARM_SMMUV3.
> 
> Given that arm_vsmmu_init() is called after arm_smmu_get_viommu_size(), any
> unsupported viommu->type must be a corruption. And it must be a driver bug
> that its vsmmu_size and vsmmu_init ops aren't paired. Warn these two cases.
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 24 ++++++++++---------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 14 +++++++++++
>  2 files changed, 27 insertions(+), 11 deletions(-)

Cheers for the quick respin.

> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 181d07bc1a9d..dfe7f40fac35 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4703,6 +4703,7 @@ static void arm_smmu_impl_remove(void *data)
>  static struct arm_smmu_device *arm_smmu_impl_probe(struct arm_smmu_device *smmu)
>  {
>  	struct arm_smmu_device *new_smmu = ERR_PTR(-ENODEV);
> +	const struct arm_smmu_impl_ops *ops;
>  	int ret;
>  
>  	if (smmu->impl_dev && (smmu->options & ARM_SMMU_OPT_TEGRA241_CMDQV))
> @@ -4713,11 +4714,24 @@ static struct arm_smmu_device *arm_smmu_impl_probe(struct arm_smmu_device *smmu)
>  	if (IS_ERR(new_smmu))
>  		return new_smmu;
>  
> +	ops = new_smmu->impl_ops;
> +	if (ops) {
> +		/* vsmmu_size and vsmmu_init ops must be paired */
> +		if (WARN_ON(!ops->vsmmu_size ^ !ops->vsmmu_init)) {
> +			ret = -EINVAL;
> +			goto err_remove;
> +		}

I suppose that could be != instead of ^ to avoid mixing up logical and
arithmetic operators, but it does the trick either way so:

Acked-by: Will Deacon <will@kernel.org>

Will

