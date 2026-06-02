Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316DFCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 19:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftOIpII2o5BHlSrpYjdtnSczjR8NYdTjJYRnMSN/BTM=; b=0BEO6dp3jKvDezKhdqYEUd9hHu
	EJRca6Dt21gKLwMDoiDyh6dEZgZ69gHmKmC9SS4WWX5Pfd2kO8ChopqJjbkpQlZGs7G1oSAFFEm8K
	ZnnZYIapIvh4zkWru5R4yzUENJOERKOLKkxC14NPMZMimwNItB2r2OaGwPowTjxfnqoeywSxWvxFT
	G2EYqUez2ZfHNEqeg/LdPryOxl2l0+LhQLSo/zzoPk6zhhcsJ9nr2rUxDAw6NdM0qCkM6+8iropqi
	rT8AIFK2iHY2K04++y1FdX8tc9q28orOpUB7bkLEQG3CFatZXUxEcBr/3JG/ININpdwtsCGiJGpYr
	h94OZCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVCo-0000000DiOg-3VY0;
	Tue, 02 Jun 2026 19:55:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVCn-0000000DiOY-1VSl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 19:55:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 62E4A60098;
	Tue,  2 Jun 2026 19:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461E91F00893;
	Tue,  2 Jun 2026 19:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780430116;
	bh=ftOIpII2o5BHlSrpYjdtnSczjR8NYdTjJYRnMSN/BTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bGOerLGi9R5hKth9QMPVvN8b5Ds4rpn8aJMi2p2Qe5KjZxinm0fUynTnZXzRaMUDC
	 r9pNx4zbJ6VuFllwfLUpJyxEGxBxdyXiggpPSW1hCVsVFJfiueOVZfdfSw1jR8Hgia
	 Bpy7b609LIotTjG0zVmaAEP74TXkqY7nj1E/g444K9C+K45X2zPMamz8lCQtiUfYPY
	 51O85iXZumK49wtOfL5+ONJtxWAQWaTwwOaakRVdpiJAFxIXPr7paXH+xqfnEJDGNA
	 TWFt+s0rnkr/ibIForY/iVSaCNdZu3eLSGbZh/3LxrovMEP+rsfM/Yp07S0FPwoq58
	 ApUDj+6WcAFOA==
Date: Tue, 2 Jun 2026 20:55:10 +0100
From: Will Deacon <will@kernel.org>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu-v3: Factor out CMDQ batch
 force-sync conditions
Message-ID: <ah81HhVW7_h9xyDM@willie-the-truck>
References: <20260601104845.995005-1-amhetre@nvidia.com>
 <20260601104845.995005-2-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601104845.995005-2-amhetre@nvidia.com>
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

On Mon, Jun 01, 2026 at 10:48:43AM +0000, Ashish Mhetre wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
> 
> arm_smmu_cmdq_batch_add_cmd_p() carries two distinct reasons for
> flushing the current batch with a CMD_SYNC before appending the
> new command:
> 
>   - The batch's pre-assigned cmdq does not support the new command.
>   - The Arm erratum 2812531 workaround (ARM_SMMU_OPT_CMDQ_FORCE_SYNC)
>     forces a SYNC at one entry before the batch is full.
> 
> Lift those checks into a new arm_smmu_cmdq_batch_force_sync() helper
> so that adding another force-sync condition becomes a one-line
> addition. No functional change.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 26 ++++++++++++++++-----
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 9be589d14a3b..4d29bd343460 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -847,16 +847,30 @@ static void arm_smmu_cmdq_batch_init_cmd(struct arm_smmu_device *smmu,
>  	cmds->cmdq = arm_smmu_get_cmdq(smmu, cmd);
>  }
>  
> +static bool arm_smmu_cmdq_batch_force_sync(struct arm_smmu_device *smmu,
> +					   struct arm_smmu_cmdq_batch *cmds,
> +					   struct arm_smmu_cmd *cmd)
> +{
> +	if (!cmds->num)
> +		return false;

This check seems new?

Will

