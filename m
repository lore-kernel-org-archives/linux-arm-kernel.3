Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3271BCFD35C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 21:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Dx10vbJL/TzdnPPy/kS34urDgMnaBZyZKhiZwacWOc=; b=NNgAuiHOxvMVb9D2Rmlhwm2Ivr
	AolZEVrH+K6p3y2yuJrskGgNAR5r+bpFMpvM+By2ZcDXnec2vsa/X0kwVNmWN/GUEgzsjDvmJMzSK
	/8N5z8YXGmimWig4tr0IY73U/43L4BQd540iG+WcuNfr3qxGkf/GDHqMfsQDqhmo6BPtVJVdoFO3Y
	j3nkY5uKWfQfdEFqo8ga3Z2qz5YEYhLNvgoc5yDAJxCzrzUXTvcc8y8bFi2J/xGvFb8GO2o3lI6BS
	12gi+zaYaqSYFsa9Y3w1XbwR1jvKtg9QJYtTwRa+tbwDcek1SKvu9oUuGTu6cEj18gODc3xQ5E8SZ
	L35JJi/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNeKu-0000000CM0V-327t;
	Mon, 24 Nov 2025 21:43:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNeKs-0000000CLzk-1Osm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 21:43:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6FF2402F5;
	Mon, 24 Nov 2025 21:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BFDC4CEF1;
	Mon, 24 Nov 2025 21:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764020581;
	bh=1DBTbXT5XFmNZaTfnC6zGXl9doaHJLY4/GiojX8PYi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5SpGS8SVO/6aWOKgjxCiB3dRBN0aJAqPeBVtsQ67OcysYxDTkZhCTAr/PUQ6m/j7
	 mpAg1Us8FdH5nTQCDFHAEW8JJedL/aWA3OSUxzJPN+YouytEGBs0ATqfihdPz5O5JZ
	 FAY1BmyLXj3D11SsAkJC/+EHZ52LpaOmNowzNbNammu7TGVjLD/LmxG0m06G5UZZgS
	 s1hn37HN367+Dqn8f6mWdOEeI7YqpSmc63sajdWv3WHBNHp3zRZPXH0Vnroe7DMJBO
	 NR8xJ5VhHnJZtfK8H5a2bUWljV89+0uVsUV3btJakCon1GxxnKxfL/LWRQnSZr2Dty
	 1foWEvvp7WWkw==
Date: Mon, 24 Nov 2025 21:42:55 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
	jgg@nvidia.com, balbirs@nvidia.com, miko.lenczewski@arm.com,
	peterz@infradead.org, kevin.tian@intel.com, praan@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/7] iommu/arm-smmu-v3: Pre-allocate a per-master
 invalidation array
Message-ID: <aSTRX5RJJhfNU6l3@willie-the-truck>
References: <cover.1762588839.git.nicolinc@nvidia.com>
 <b6e1b5d0ac0157fc06b5cd20c5cd72caec892c47.1762588839.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6e1b5d0ac0157fc06b5cd20c5cd72caec892c47.1762588839.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_134302_433754_DBA40C14 
X-CRM114-Status: GOOD (  30.73  )
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

On Sat, Nov 08, 2025 at 12:08:05AM -0800, Nicolin Chen wrote:
> When a master is attached from an old domain to a new domain, it needs to
> build an invalidation array to delete and add the array entries from/onto
> the invalidation arrays of those two domains, passed via the to_merge and
> to_unref arguments into arm_smmu_invs_merge/unref() respectively.
> 
> Since the master->num_streams might differ across masters, a memory would
> have to be allocated when building an to_merge/to_unref array which might
> fail with -ENOMEM.
> 
> On the other hand, an attachment to arm_smmu_blocked_domain must not fail
> so it's the best to avoid any memory allocation in that path.
> 
> Pre-allocate a fixed size invalidation array for every master. This array
> will be used as a scratch to fill dynamically when building a to_merge or
> to_unref invs array. Sort fwspec->ids in an ascending order to fit to the
> arm_smmu_invs_merge() function.
> 
> Co-developed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  8 ++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 27 +++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 757158b9ea655..7b81a82c0dfe4 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -922,6 +922,14 @@ struct arm_smmu_master {
>  	struct arm_smmu_device		*smmu;
>  	struct device			*dev;
>  	struct arm_smmu_stream		*streams;
> +	/*
> +	 * Scratch memory for a to_merge or to_unref array to build a per-domain
> +	 * invalidation array. It'll be pre-allocated with enough enries for all
> +	 * possible build scenarios. It can be used by only one caller at a time
> +	 * until the arm_smmu_invs_merge/unref() finishes. Must be locked by the
> +	 * iommu_group mutex.
> +	 */
> +	struct arm_smmu_invs		*build_invs;
>  	struct arm_smmu_vmaster		*vmaster; /* use smmu->streams_mutex */
>  	/* Locked by the iommu core using the group mutex */
>  	struct arm_smmu_ctx_desc_cfg	cd_table;
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 8266d0839a927..26b8492a13f20 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -3693,12 +3693,22 @@ static int arm_smmu_init_sid_strtab(struct arm_smmu_device *smmu, u32 sid)
>  	return 0;
>  }
>  
> +static int arm_smmu_ids_cmp(const void *_l, const void *_r)
> +{
> +	const typeof_member(struct iommu_fwspec, ids[0]) *l = _l;
> +	const typeof_member(struct iommu_fwspec, ids[0]) *r = _r;
> +
> +	return cmp_int(*l, *r);
> +}
> +
>  static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
>  				  struct arm_smmu_master *master)
>  {
>  	int i;
>  	int ret = 0;
>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(master->dev);
> +	bool ats_supported = dev_is_pci(master->dev) &&
> +			     pci_ats_supported(to_pci_dev(master->dev));
>  
>  	master->streams = kcalloc(fwspec->num_ids, sizeof(*master->streams),
>  				  GFP_KERNEL);
> @@ -3706,6 +3716,21 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
>  		return -ENOMEM;
>  	master->num_streams = fwspec->num_ids;
>  
> +	if (!ats_supported) {
> +		/* Base case has 1 ASID entry or maximum 2 VMID entries */
> +		master->build_invs = arm_smmu_invs_alloc(2);
> +	} else {
> +		/* Put the ids into order for sorted to_merge/to_unref arrays */
> +		sort_nonatomic(fwspec->ids, fwspec->num_ids,
> +			       sizeof(fwspec->ids[0]), arm_smmu_ids_cmp, NULL);
> +		/* ATS case adds num_ids of entries, on top of the base case */
> +		master->build_invs = arm_smmu_invs_alloc(2 + fwspec->num_ids);

Although I can't point at a specific issue here, I'm nervous about mutating
the 'fwspec->ids' array from within the driver, The array isn't allocated
or populated directly by the driver and so I don't think we really have any
business sorting it. Could we hack iommu_fwspec_add_ids() to keep the array
ordered instead?

Will

