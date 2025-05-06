Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072EEC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 14:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jT59FuCKnc7FOE1GgCngJapfm/iyYkKYjKq/CVbHSsw=; b=ST2Dwa6vmUDcMf7DGZOSkq9O0a
	t1BgA+XsbBZsL9eFFhBqM8clE9JPw2Fq5m7V/q0+n35SIzm2x/RnXCwzGuDwjzFZ4T0j9dk7vxp5P
	wM2VwLqoBkkgySWpHZWF8b3VLaQAeAZIhBwBXCdZt1NWKIQ2L3YAYhNJi9ABteEAIbOWZVj2JEK18
	R3NPBLOHKAKchbPSCVMFGsCULak50T4EKyoCH6GZiwGuMIr/hM/4urYt04mKMI5xwoOpsyI58IJUZ
	DyO8nojC8+jUP1Fycy4m9AKvm6A4dMuD0ojjqw/++vQZaufjz+AJ7ucb4xqBpWHDPhwRLH4zuIHIY
	m/pMVwlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCItG-0000000CF1n-0eQa;
	Tue, 06 May 2025 14:03:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGXd-0000000Bkvs-299q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:32:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDFF0438CC;
	Tue,  6 May 2025 11:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4D4C4CEE4;
	Tue,  6 May 2025 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746531172;
	bh=mE1e1B9m9uhzxTNZaDZ3TY+lY86rVvjhSEag8/l7vDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+FElNUNhdG5CYgnApQsUFYFp+lb9D4evnzqSTmmE3FJtKAA5aDKSQq9jDoh1b+uq
	 Qmvb5zCPGb51aJ8iAHF1LRTFA4EdtPTaS7yN3EahbaJHl4AVY3Z3yy2TN5HoAfgZmW
	 WfWzf+kPc5cHicOck1lE7ZB+j+UfmUzzpkximKT9KQmSyixoPaVzM3FlbXzht8aJQC
	 LA3yNCAtSJX1w0hDiUB9QQ1iEhCG9qgFME2SviolTzXq+lEEjA9KRip8/v6JMUlftA
	 anKqkQ+2LIoi1JtBxda8j9cG7AO5KGzAtZP5qML5SV0Es1CK7n/tlFEphi5y07Dewh
	 yAxG4yeV/iD2A==
Date: Tue, 6 May 2025 12:32:46 +0100
From: Will Deacon <will@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 1/5] iommu/arm-smmu: Save additional information on
 context fault
Message-ID: <20250506113246.GA723@willie-the-truck>
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-1-97561209dd8c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319-msm-gpu-fault-fixes-next-v5-1-97561209dd8c@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_043253_567921_AE056053 
X-CRM114-Status: GOOD (  16.59  )
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

On Wed, Mar 19, 2025 at 10:44:00AM -0400, Connor Abbott wrote:
> This will be used by drm/msm for GPU page faults, replacing the manual
> register reading it does.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  6 ++--
>  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 35 ++++++++++++++----------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  7 +++--
>  3 files changed, 29 insertions(+), 19 deletions(-)

[...]

> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index ade4684c14c9b2724a71e2457288dbfaf7562c83..a02078eb968b81a35c1c086ed7007ea2a453ef94 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -405,13 +405,20 @@ static const struct iommu_flush_ops arm_smmu_s2_tlb_ops_v1 = {
>  };
>  
>  
> -void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
> +void arm_smmu_read_context_fault_info(struct arm_smmu_domain *smmu_domain,
>  				      struct arm_smmu_context_fault_info *cfi)
>  {
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	int idx = smmu_domain->cfg.cbndx;
> +
>  	cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> +	cfi->ttbr0 = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
>  	cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> -	cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> +	cfi->fsynr0 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> +	cfi->fsynr1 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
>  	cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> +	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1)
> +		cfi->contextidr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTEXTIDR);

I think this leaves 'cfi->contextidr' uninitialised for stage-2 domains.
We should probably either zero it here or just zero-initialise the whole
'cfi' struct in arm_smmu_context_fault() with a:

	struct arm_smmu_context_fault_info cfi = {};

line.

Will

