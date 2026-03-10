Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B63DFD4F04
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 16:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auHdVnEiNttivU3WpAwlPNPg2IpeSVq/bDwRs4IssAc=; b=PcRDTJqrMprgKurDJ8QHtZeXN+
	hdlKCVPqOsIGSmT7ab7NCeDs5hPr7GI3IEyJquBGVd0eYpTkUgmLnDN/R5hqVs6XcVnh++og59QM+
	IaWokdmpeQ5P1U3GwcrbPKl/Aa6wn1HCDiTKNUSUKR+io7amURp6ButnA9SbZC7yqEDzbE1Mmy1FB
	IyKQEhxRHDYynDFswA81F7yV9Iq4pe48cAeFzqsiGDZu6mgEwaCHTVGPp7Ajvb2uPTaVgIyFx9AXj
	PVCVmH/GsernWIPV+dv1eWuP61M/L25RkueC/kAw28YPyCXpSVDuqzGpXwM6TWErxflYNImxcw9wM
	TRupXhxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00Hy-00000009w2e-0ElU;
	Tue, 10 Mar 2026 16:50:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00Hs-00000009w0c-44D9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 16:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6478741A33;
	Tue, 10 Mar 2026 16:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93214C2BC9E;
	Tue, 10 Mar 2026 16:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773161428;
	bh=BAxA5cq+4SCMpHLZSPR6IGnVcUVzSzmQy7VsDQVyUX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ULTxrBpNDsZcxV9AuGVsXi+DANSUSzVpfnuy2GPkkgeYbPno1sr+1uOzV718EewgQ
	 AC7sj6TUvxixeh67QfgXBu2PGYdNCMyWR4/H91vk3sKnEwxY+5Ycd7N8fXSXI+jCfa
	 W9JmAF1nN330XEAqewpnqCJiSXT5r9sKFJop5ITYVaS4TnuvudoZUOnhTbmaoXJB6g
	 +2I8j3Z/+TpbZw3ALUqKns73fQHgarvkhFgaZ9Y29scfKcfEmQYaW2BTFG2jG/hf/i
	 Dcr52hbeabN0EcsfDoMf0EkN9uTgZDGMWTuVTnwuiC/Kfvk7M741MEv3w5aofGPEBs
	 wzfpNE9GeiRbA==
Date: Tue, 10 Mar 2026 16:50:23 +0000
From: Will Deacon <will@kernel.org>
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu: arm-smmu-qcom: Ensure smmu is powered up in
 set_ttbr0_cfg
Message-ID: <abBLz16xYE0xJqgE@willie-the-truck>
References: <20260210-qcom_smmu_pmfix-v1-1-78b7143ac053@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210-qcom_smmu_pmfix-v1-1-78b7143ac053@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_095029_157842_14F828CD 
X-CRM114-Status: GOOD (  18.34  )
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

On Tue, Feb 10, 2026 at 05:17:38PM +0100, Anna Maniscalco wrote:
> Previously the device was being accessed while potentially in a
> suspended state.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 573085349df3..ca34b7a141e6 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -231,16 +231,27 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
>  	struct io_pgtable *pgtable = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
>  	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>  	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(smmu_domain->smmu->dev);
> +	if (ret < 0) {
> +		dev_err(smmu_domain->smmu->dev, "failed to get runtime PM: %d\n", ret);
> +		return -ENODEV;
> +	}
>  
>  	/* The domain must have split pagetables already enabled */
> -	if (cb->tcr[0] & ARM_SMMU_TCR_EPD1)
> -		return -EINVAL;
> +	if (cb->tcr[0] & ARM_SMMU_TCR_EPD1) {
> +		ret = -EINVAL;
> +		goto out;
> +	}

Presumably, you only need to stabilise the power state across the call
to arm_smmu_write_context_bank(), in which case why not defer that until
you've gone past all these early exits?

Will

