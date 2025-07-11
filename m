Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D971C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJOnwqo0AP+rCig3urX0zZ1GobU2FBT4lYDcp/oHcAs=; b=XwEvn5UFgAnQJWxahlmCbBpXFy
	JR7lntnAf2Tqv5gckpMSyVe2n7Hmv0sAD455T6sy99x43IV3aucCLcdxNZMTkHEKDCH08mF/XbWxa
	e+K2rYcDvpjldz+7x9Xg0w9v1WumipR7qP9ObO6S0wZrpS6mEAyqu/sf0ABtptTM4dcSyP+A3Y+1D
	vPl7MRkKXZQ4BNUcJeAumgZp8jlTXqHZbfvCMWGHEQrImRB7vdIR0sOyvXNY1PY0q0ko4nQZu7cCf
	kuXM3Ou3LSC5TTEKAtZ6yTqNlbbt77pF03hidO1BcO99ocgV7mpkMVJSWxuFuLnvbanCyWIInC8mu
	XRPLmogQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaH0E-0000000FL9G-25pa;
	Fri, 11 Jul 2025 16:53:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGOS-0000000FFjJ-17D8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 16:14:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7902B5C7131;
	Fri, 11 Jul 2025 16:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C421C4CEF5;
	Fri, 11 Jul 2025 16:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752250475;
	bh=GmeNQXQW8OBcvcvO6HZildjusv3m9QHJ5AApHT58lZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=apaK87ldOYn5FK2tDeGRDePprHq+beg+q9HsLOWJ2j13cMBCS6+mx0WcltPJsdS3w
	 CzYun59+ByQ3TdmVIVWrGlL/W8WcIzaPbfTXsbA5FtiIxqz5ZbhVvShMT6Uf9cL0PN
	 4ytZp94nPA10Y7DtWLizwiEYUSknZl+OyAs0DUYaItDecpCuVhE4QDWkqNIHSJi7sp
	 LWi25pGc9/uHHZ07X+TmzULZC8hajpmCywurY5p6K7szAY7mgPFz6xddS8AdBVgpm6
	 fmH0Ugvb/IhmTZU+IPSaCKy2NvVBQrpYO4pajykZ1XzB949TL/eMqMY5t9EE4AzX1R
	 jyy6Psd53fAxQ==
Date: Fri, 11 Jul 2025 17:14:27 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v9 23/29] iommu/arm-smmu-v3-iommufd: Add vsmmu_size/type
 and vsmmu_init impl ops
Message-ID: <aHE4Y-fbucm-j-yi@willie-the-truck>
References: <cover.1752126748.git.nicolinc@nvidia.com>
 <375ac2b056764534bb7c10ecc4f34a0bae82b108.1752126748.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <375ac2b056764534bb7c10ecc4f34a0bae82b108.1752126748.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_091436_386550_39CB7D2B 
X-CRM114-Status: GOOD (  21.59  )
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

Hey Nicolin,

On Wed, Jul 09, 2025 at 10:59:15PM -0700, Nicolin Chen wrote:
> An impl driver might want to allocate its own type of vIOMMU object or the
> standard IOMMU_VIOMMU_TYPE_ARM_SMMUV3 by setting up its own SW/HW bits, as
> the tegra241-cmdqv driver will add IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV.
> 
> Add vsmmu_size/type and vsmmu_init to struct arm_smmu_impl_ops. Prioritize
> them in arm_smmu_get_viommu_size() and arm_vsmmu_init().
> 
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 5 +++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 8 ++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index c1ced4d4b6d1..6183f212539a 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -16,6 +16,7 @@
>  #include <linux/sizes.h>
>  
>  struct arm_smmu_device;
> +struct arm_vsmmu;
>  
>  /* MMIO registers */
>  #define ARM_SMMU_IDR0			0x0
> @@ -720,6 +721,10 @@ struct arm_smmu_impl_ops {
>  	int (*init_structures)(struct arm_smmu_device *smmu);
>  	struct arm_smmu_cmdq *(*get_secondary_cmdq)(
>  		struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
> +	const size_t vsmmu_size;
> +	const enum iommu_viommu_type vsmmu_type;
> +	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
> +			  const struct iommu_user_data *user_data);

It would be nice to avoid adding data members to the ops structure, if
at all possible. The easiest thing would probably be to add a function
for getting the vsmmu size and then pushing the two checks against
'vsmmu_type' down into the impl_ops callbacks so that:

  1. If the type is IOMMU_VIOMMU_TYPE_ARM_SMMUV3, we don't bother with
     the impl_ops at all in arm_vsmmu_init() and arm_smmu_get_viommu_size()

  2. Otherwise, we pass the type into the impl_ops and they can check it

Of course, that can be a patch on top of the series as there's no point
respinning the whole just for this.

Cheers,

Will

