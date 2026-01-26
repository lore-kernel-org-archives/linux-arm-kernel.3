Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934F5C88E4F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1o4WADTTHCzvlP6JtHKtRCxZVaOSvm6I7TJUb2/tQI=; b=DqIC+CwPY/O/D/Q/m1kVgoSowX
	+y/Gu4RU8c1Y4GczOFfezJ0LjIh8CvRsX3nvFk7p28/Yhl+hwYWARkgjWz7CYIoUPSZKh5BQU+9Xb
	1ajC0vr6q13MWIHM9fz7MtfzpjfDKBUQ1+r9mDUrWn+no+VdlKPEGLewLuF0SjoZyUELx5D9utNCT
	VhDWf1wHSz6gxN+xKDbzOGy6daozAPeT1kqAHqvU/WmX3SVzwJDPdC4bHJuBFoK716Ob40ESmofS3
	I60WYMtAh9eiAFWMd6/E3GWwcNxAz8JjsMKw7T9rfqQJ3bAl+/d/3EJJSgkb1UJaU2pBT3RvKW0OJ
	3A5TPbGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLss-0000000CZ3m-0tZZ;
	Mon, 26 Jan 2026 12:39:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLsr-0000000CZ3f-0Bh0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:39:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E7A160051;
	Mon, 26 Jan 2026 12:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A08C116C6;
	Mon, 26 Jan 2026 12:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769431195;
	bh=FxsnTu8eMYxkU3fivLnU4cZVxOCth2hrCor83qQn70o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o0/gxbfaMeTRD7TRqobbcPOW2vCWdLWVVxQnSoKnpZgee7s3WJsymzLqAF/+WLmS4
	 4Eu3AyrgQrSuXJ5YXsZQ7U5xWgQC/vLcn26IVdcSbyQLy/qOCTwFX7+JllNz0Wm9XP
	 WXJ5LT8BsOzB5DKK2h0sy1E0O70AmM2odti8qnnfI+25Owv8H4/iE7FPf3Tn/2tA5h
	 PUEfNKoO1xuBz8tU0uUuEbibainuL0zp4g32v4xxEa1OHBqAVOdb+W/zPiEp5blNIT
	 Bfc+hg09ktCmfkUdq0zAD5Z6pVgrgxJOQP3XlHb0+ka+Xafg43gu2MJNUCdaIPGBeB
	 TRbn40x2dbzog==
Date: Mon, 26 Jan 2026 12:39:50 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, robin.murphy@arm.com, bhelgaas@google.com,
	joro@8bytes.org, praan@google.com, baolu.lu@linux.intel.com,
	kevin.tian@intel.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH RFCv1 3/3] iommu/arm-smmu-v3: Allow ATS to be always on
Message-ID: <aXdgljWHHPVMTmya@willie-the-truck>
References: <cover.1768624180.git.nicolinc@nvidia.com>
 <09cb6be1f8f7472a2f1ccab72154cc6e22cf570b.1768624181.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09cb6be1f8f7472a2f1ccab72154cc6e22cf570b.1768624181.git.nicolinc@nvidia.com>
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

On Fri, Jan 16, 2026 at 08:56:42PM -0800, Nicolin Chen wrote:
> When a device's default substream attaches to an identity domain, the SMMU
> driver currently sets the device's STE between two modes:
> 
>   Mode 1: Cfg=Translate, S1DSS=Bypass, EATS=1
>   Mode 2: Cfg=bypass (EATS is ignored by HW)
> 
> When there is an active PASID (non-default substream), mode 1 is used. And
> when there is no PASID support or no active PASID, mode 2 is used.
> 
> The driver will also downgrade an STE from mode 1 to mode 2, when the last
> active substream becomes inactive.
> 
> However, there are PCIe devices that demand ATS to be always on. For these
> devices, their STEs have to use the mode 1 as HW ignores EATS with mode 2.
> 
> Change the driver accordingly:
>   - always use the mode 1
>   - never downgrade to mode 2
>   - allocate and retain a CD table (see note below)
> 
> Note that these devices might not support PASID, i.e. doing non-PASID ATS.
> In such a case, the ssid_bits is set to 0. However, s1cdmax must be set to
> a !0 value in order to keep the S1DSS field effective. Thus, when a master
> requires ats_always_on, set its s1cdmax to minimal 1, meaning the CD table
> will have a dummy entry (SSID=1) that will be never used.
> 
> Now, for these device, arm_smmu_cdtab_allocated() will always return true,
> v.s. false prior to this change. When its default substream is attached to
> an IDENTITY domain, its first CD is NULL in the table, which is a totally
> valid case. Thus, drop the WARN_ON().
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 74 ++++++++++++++++++---
>  2 files changed, 64 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index ae23aacc3840..2ed68f43347e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -850,6 +850,7 @@ struct arm_smmu_master {
>  	bool				ats_enabled : 1;
>  	bool				ste_ats_enabled : 1;
>  	bool				stall_enabled;
> +	bool				ats_always_on;
>  	unsigned int			ssid_bits;
>  	unsigned int			iopf_refcount;
>  };
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index d16d35c78c06..5b7deb708636 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1422,7 +1422,7 @@ void arm_smmu_clear_cd(struct arm_smmu_master *master, ioasid_t ssid)
>  	if (!arm_smmu_cdtab_allocated(&master->cd_table))
>  		return;
>  	cdptr = arm_smmu_get_cd_ptr(master, ssid);
> -	if (WARN_ON(!cdptr))
> +	if (!cdptr)
>  		return;

Should we still warn if !master->ats_always_on?

>  	arm_smmu_write_cd_entry(master, ssid, cdptr, &target);
>  }
> @@ -1436,6 +1436,22 @@ static int arm_smmu_alloc_cd_tables(struct arm_smmu_master *master)
>  	struct arm_smmu_ctx_desc_cfg *cd_table = &master->cd_table;
>  
>  	cd_table->s1cdmax = master->ssid_bits;
> +
> +	/*
> +	 * When a device doesn't support PASID (non default SSID), ssid_bits is
> +	 * set to 0. This also sets S1CDMAX to 0, which disables the substreams
> +	 * and ignores the S1DSS field.
> +	 *
> +	 * On the other hand, if a device demands ATS to be always on even when
> +	 * its default substream is IOMMU bypassed, it has to use EATS that is
> +	 * only effective with an STE (CFG=S1translate, S1DSS=Bypass). For such
> +	 * use cases, S1CDMAX has to be !0, in order to make use of S1DSS/EATS.
> +	 *
> +	 * Set S1CDMAX no lower than 1. This would add a dummy substream in the
> +	 * CD table but it should never be used by an actual CD.
> +	 */
> +	if (master->ats_always_on)
> +		cd_table->s1cdmax = max_t(u8, cd_table->s1cdmax, 1);
>  	max_contexts = 1 << cd_table->s1cdmax;
>  
>  	if (!(smmu->features & ARM_SMMU_FEAT_2_LVL_CDTAB) ||
> @@ -3189,7 +3205,8 @@ static int arm_smmu_blocking_set_dev_pasid(struct iommu_domain *new_domain,
>  	 * When the last user of the CD table goes away downgrade the STE back
>  	 * to a non-cd_table one, by re-attaching its sid_domain.
>  	 */
> -	if (!arm_smmu_ssids_in_use(&master->cd_table)) {
> +	if (!master->ats_always_on &&
> +	    !arm_smmu_ssids_in_use(&master->cd_table)) {
>  		struct iommu_domain *sid_domain =
>  			iommu_get_domain_for_dev(master->dev);
>  
> @@ -3205,7 +3222,7 @@ static void arm_smmu_attach_dev_ste(struct iommu_domain *domain,
>  				    struct iommu_domain *old_domain,
>  				    struct device *dev,
>  				    struct arm_smmu_ste *ste,
> -				    unsigned int s1dss)
> +				    unsigned int s1dss, bool ats_always_on)
>  {
>  	struct arm_smmu_master *master = dev_iommu_priv_get(dev);

Can we avoid the 'bool' parameter if possible, please? They tend to make the
callsites pretty horrible to read and you're already passing the 'struct
device *' so you should have the master in hand?

>  	struct arm_smmu_attach_state state = {
> @@ -3224,7 +3241,7 @@ static void arm_smmu_attach_dev_ste(struct iommu_domain *domain,
>  	 * If the CD table is not in use we can use the provided STE, otherwise
>  	 * we use a cdtable STE with the provided S1DSS.
>  	 */
> -	if (arm_smmu_ssids_in_use(&master->cd_table)) {
> +	if (ats_always_on || arm_smmu_ssids_in_use(&master->cd_table)) {
>  		/*
>  		 * If a CD table has to be present then we need to run with ATS
>  		 * on because we have to assume a PASID is using ATS. For
> @@ -3260,7 +3277,8 @@ static int arm_smmu_attach_dev_identity(struct iommu_domain *domain,
>  	arm_smmu_master_clear_vmaster(master);
>  	arm_smmu_make_bypass_ste(master->smmu, &ste);
>  	arm_smmu_attach_dev_ste(domain, old_domain, dev, &ste,
> -				STRTAB_STE_1_S1DSS_BYPASS);
> +				STRTAB_STE_1_S1DSS_BYPASS,
> +				master->ats_always_on);
>  	return 0;
>  }
>  
> @@ -3283,7 +3301,7 @@ static int arm_smmu_attach_dev_blocked(struct iommu_domain *domain,
>  	arm_smmu_master_clear_vmaster(master);
>  	arm_smmu_make_abort_ste(&ste);
>  	arm_smmu_attach_dev_ste(domain, old_domain, dev, &ste,
> -				STRTAB_STE_1_S1DSS_TERMINATE);
> +				STRTAB_STE_1_S1DSS_TERMINATE, false);
>  	return 0;
>  }
>  
> @@ -3521,6 +3539,40 @@ static void arm_smmu_remove_master(struct arm_smmu_master *master)
>  	kfree(master->streams);
>  }
>  
> +static int arm_smmu_master_prepare_ats(struct arm_smmu_master *master)
> +{
> +	bool s1p = master->smmu->features & ARM_SMMU_FEAT_TRANS_S1;
> +	unsigned int stu = __ffs(master->smmu->pgsize_bitmap);
> +	struct pci_dev *pdev = to_pci_dev(master->dev);
> +	int ret;
> +
> +	if (!arm_smmu_ats_supported(master))
> +		return 0;
> +
> +	if (!pci_ats_always_on(pdev))
> +		goto out_prepare;
> +
> +	/*
> +	 * S1DSS is required for ATS to be always on for identity domain cases.
> +	 * However, the S1DSS field is ignored if !IDR0_S1P or !IDR1_SSIDSIZE.
> +	 */
> +	if (!s1p || !master->smmu->ssid_bits) {
> +		dev_info_once(master->dev,
> +			      "SMMU doesn't support ATS to be always on\n");
> +		goto out_prepare;
> +	}
> +
> +	master->ats_always_on = true;
> +
> +	ret = arm_smmu_alloc_cd_tables(master);
> +	if (ret)
> +		return ret;

Were do you allocate the second level entry for ssid 0 if we're using
2-level cd tables?

Will

