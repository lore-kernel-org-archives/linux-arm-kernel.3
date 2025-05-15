Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E2EC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 15:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOPCtozXvcH8djLgpGedVUsU7rOKpccS4+X43Xzod/o=; b=rvFZpapB/NOooH2ueYFtk8zL2x
	WFVXkfP3NWiMlpgp6bWB4RimWdMTny5DkupzsomCPAXorh2XmRfNTiG7NidoIVuDWq7b7K+1B2OiH
	Dsip7ROSPpnHu0T47XLjA1u49y1yerYcHZa2niuvYQmiJ+bjXN1HsWxOhoustAhJ/zxfBBCf+swar
	07Cy7uL+kKfdJDymh/uKN8nWq22nPUlD+lghy9SKU9lU3iCRNvDEGIHLT5XkzKRBtzF+gJaaTGlYQ
	1w4SUwY0sKifNUArNDOxJ43TN0L9KTAlvEM3o4t0Xu99Y5Cv4B20k2Sce2lUSJnCVeRYQ8TC6Gq7h
	LKRjV6Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFaFx-0000000114m-1rz5;
	Thu, 15 May 2025 15:12:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFaAR-00000001091-2W14
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 15:06:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A8A33A4DF38;
	Thu, 15 May 2025 15:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B3DC4CEE7;
	Thu, 15 May 2025 15:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747321598;
	bh=urKXtVF+8OQ4aIsSMiNubACGLVMonPp+yOm8unTAuRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fa2XDMuI4w/GYS2stX9qIHl+35V28XFvu7nOBJp9mxJXYV1AFJiYvOrFcpP9SV+HF
	 FDlr+DdlQ9RYF/jAKrmEoWinAR3oY5m9uAE60GqvjJiXPQkjB0WB03wkuBin1KolUx
	 EmhBA2plJeO7bBikqw3fC3X9oSywbdpR4X3xPSM1VJUZyr8W/tzyBWnI+aIb+ZVmV4
	 bgb8Y160ka65deKyfWq+OGRAYUAFyGOx2j9SmLjPrgCnn5NTPx38OpurquG5mYWI+c
	 nUG4NAdUdncQtsRq0Az8JqiEGU5+wk5tABnHUasE+b9g8UvurDNIktXOxTk9b2N497
	 rQDgsbTwsksAw==
Date: Thu, 15 May 2025 16:06:32 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	kevin.tian@intel.com, praan@google.com, nathan@kernel.org,
	yi.l.liu@intel.com, peterz@infradead.org, mshavit@google.com,
	jsnitsel@redhat.com, smostafa@google.com,
	jeff.johnson@oss.qualcomm.com, zhangzekun11@huawei.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v2 02/11] iommu/arm-smmu-v3: Pass in smmu/iommu_domain to
 __arm_smmu_tlb_inv_range()
Message-ID: <20250515150629.GD12165@willie-the-truck>
References: <cover.1744692494.git.nicolinc@nvidia.com>
 <ed8b2837e5ea63f6ee98663761d4f1ebe66a6d41.1744692494.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed8b2837e5ea63f6ee98663761d4f1ebe66a6d41.1744692494.git.nicolinc@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_080639_706095_80533AD3 
X-CRM114-Status: GOOD (  19.08  )
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

On Mon, Apr 14, 2025 at 09:57:37PM -0700, Nicolin Chen wrote:
> What __arm_smmu_tlb_inv_range() really needs is the smmu and iommu_domain
> pointers from the smmu_domain.
> 
> For a nest_parent smmu_domain, it will no longer store an smmu pointer as
> it can be shared across vSMMU instances. A vSMMU structure sharing the S2
> smmu_domain instead would hold the smmu pointer.
> 
> Pass them in explicitly to fit both !nest_parent and nest_parent cases.
> 
> While changing it, share it in the header with arm-smmu-v3-iommmufd that
> will call it too.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  4 ++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 17 +++++++++--------
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index d4837a33fb81..5dbdc61558a9 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -955,6 +955,10 @@ void arm_smmu_tlb_inv_range_asid(unsigned long iova, size_t size, int asid,
>  				 struct arm_smmu_domain *smmu_domain);
>  int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
>  			    unsigned long iova, size_t size);
> +void __arm_smmu_tlb_inv_range(struct arm_smmu_device *smmu,
> +			      struct arm_smmu_cmdq_ent *cmd, unsigned long iova,
> +			      size_t size, size_t granule,
> +			      struct iommu_domain *domain);

I don't think this function makes a particularly good "public" API --
the caller even sets the cmd opcode!

Can we expose some TLB invalidation helpers instead rather than the
low-level helpers?

Will

