Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D87C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 16:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8tBDjy543x7O/2+coA7DuMO9h9IfvbGc6S9Gogs05c=; b=s+zj/+zan01DvIG9YzXOx9IpWy
	puiV6WeCWtc2u3chTBUiadWWBmB2/D4vjy277Sqh09cppvCkVsddcj4GptECidJSvTDLQfgPFCHRe
	ECD8qvg+MpLwqIcPMoRxmLk5tpp4+Pia8JBr0JOIUQHWbrVkZ4d9cnhCtqy4c806B2ByRCfao2alz
	pU+gl1qRuadMVtbwa6F192zyfQ9YIOz5LOqQUwp5iYPT34GX3cW9TL1IDZNhGXx71vp6G9JLofIsk
	R15fokPsnLR+iwS78cMc+56j9R/DXV2B4Guh2Uo1rwNEtY+YdB+vwyozjMIEKhd7y1VHh4xC2Pn9r
	D+vkDAIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts23J-00000006Gpu-2GTG;
	Tue, 11 Mar 2025 16:01:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1yu-00000006FnM-1YXw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 15:57:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 821C6A45E8E;
	Tue, 11 Mar 2025 15:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D941C4CEEC;
	Tue, 11 Mar 2025 15:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741708643;
	bh=BZTxXXA67zvcYZUPAms2o1IQhwkgm/4LnFmDVxI2ONs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NYrFmUvfLJTnTAUuNsvf7jl110FlX1XQjHYJv6UtMkxM487T1UwPjrJnb/KFOOXDY
	 4c/FTYEtU3qswKyPGejNRtq9L4QnNxy+rDETa8i1IAL2MhiMEW+6PJnE6ajqGYLfL8
	 JHDnS7kP7oW2bNHPkridid0tOs53GJHG9msqCSX/ReUA415polcodWwWksAHJXoQwk
	 Q7zbpaLmB369VDgojkiXPq1kNn+gICyoTQ0g91wrOQkty74sa2qKd3by0RjZGS6WNw
	 fqrMTu3Rb7/NHMMay2gFyahQ3CSkmM+sNuZejCnSqzmPMrrEf+Q4+Prhg3OjPWvlZH
	 XOobXYZ3D+D9g==
Date: Tue, 11 Mar 2025 15:57:16 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	praan@google.com, patches@lists.linux.dev
Subject: Re: [PATCH v8 12/14] iommu/arm-smmu-v3: Introduce struct
 arm_smmu_vmaster
Message-ID: <20250311155714.GC5138@willie-the-truck>
References: <cover.1740504232.git.nicolinc@nvidia.com>
 <f205a4e2f5971cd4b1033d7cac41683e10ebabfb.1740504232.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f205a4e2f5971cd4b1033d7cac41683e10ebabfb.1740504232.git.nicolinc@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_085724_561770_B851DB19 
X-CRM114-Status: GOOD (  20.85  )
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

On Tue, Feb 25, 2025 at 09:25:40AM -0800, Nicolin Chen wrote:
> Use it to store all vSMMU-related data. The vsid (Virtual Stream ID) will
> be the first use case. Since the vsid reader will be the eventq handler
> that already holds a streams_mutex, reuse that to fenche the vmaster too.

"fenche"?

> Also add a pair of arm_smmu_attach_prepare/commit_vmaster helpers to set
> or unset the master->vmaster point. Put these helpers inside the existing

s/point/pointer/

> arm_smmu_attach_prepare/commit().
> 
> For identity/blocked ops that don't call arm_smmu_attach_prepare/commit(),
> add a simpler arm_smmu_master_clear_vmaster helper to unset the vmaster.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Pranjal Shrivastavat <praan@google.com>

(per Pranjal: please fix his mis-spelling of his own name here and in
the other patches too!)

> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 28 ++++++++++++
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 45 +++++++++++++++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 18 +++++++-
>  3 files changed, 90 insertions(+), 1 deletion(-)

[...]

> @@ -1055,9 +1062,30 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
>  				       struct iommu_domain *parent,
>  				       struct iommufd_ctx *ictx,
>  				       unsigned int viommu_type);
> +int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> +				    struct arm_smmu_nested_domain *nested_domain);
> +void arm_smmu_attach_commit_vmaster(struct arm_smmu_attach_state *state);
> +void arm_smmu_master_clear_vmaster(struct arm_smmu_master *master);
>  #else
>  #define arm_smmu_hw_info NULL
>  #define arm_vsmmu_alloc NULL
> +
> +static inline int
> +arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> +				struct arm_smmu_nested_domain *nested_domain)
> +{
> +	return 0; /* NOP */
> +}

Please drop this comment.

> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 5aa2e7af58b4..6b712b1ab429 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -85,6 +85,51 @@ static void arm_smmu_make_nested_domain_ste(
>  	}
>  }
>  
> +int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> +				    struct arm_smmu_nested_domain *nested_domain)
> +{
> +	struct arm_smmu_vmaster *vmaster;
> +	unsigned long vsid;
> +	int ret;
> +
> +	iommu_group_mutex_assert(state->master->dev);
> +
> +	/* Skip invalid vSTE */
> +	if (!(nested_domain->ste[0] & cpu_to_le64(STRTAB_STE_0_V)))
> +		return 0;

Ok, and we don't need to set 'state->vmaster' in this case because we
only report stage-1 faults back to the vSMMU?

With the nits fixed:

Acked-by: Will Deacon <will@kernel.org>

Thanks,

Will

