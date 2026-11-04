Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92FD606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mXDTNIJm;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=i4i+j7cT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M+FVUGQeTnDaP8dcVVOqRxcNzHLQ2s/YnEy8ffSa8ug=; b=mXDTNIJmRLBETJ
	yTrPM7qFhordRBNpA97eUZNWTBWm1iEJT8f3wjSra4bgJGgUy6uzHnEMnJ9hpMSR4Uh3JfU/22Lf0
	k+NYKnaW5sWCnndtv+91efLnHp30zGbiCwPMeOwIkTVwgH8EUOLiWY8Pyu0469QYBUK5tR90tuaeJ
	ZJeDEI6XK3PZgZqCE3DSJYIaoe0CLO+BK2Kr3lDahnzgzZ/jl6yragTD5i7xCv5CGme1Plrzmv013
	YhhUTJoug+PMsHdFOil+CFBzsDKYcRW5a0JU4RTWKxEDDltJuK2D9S6nvZaig7r8z3Fp3Rrmmztos
	69q8izBp/0mWxmVhjxHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdy4-000000060SH-24Qb;
	Wed, 04 Nov 2026 16:36:08 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdy0-000000060Pi-2MLg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:36:07 +0000
Received: from localhost (unknown [4.194.122.162])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9C34420B7169;
	Wed,  4 Nov 2026 08:35:35 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9C34420B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793810147;
	bh=M+FVUGQeTnDaP8dcVVOqRxcNzHLQ2s/YnEy8ffSa8ug=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i4i+j7cTR141SF+ryi2A1rilwpQLlb1tWKZCllB4w4XggXR2rgpH/PKKL5oXWsGME
	 lUINehj74XCkboWP0/L1izrZBW2klf+04xYS6ecyyUJlqckWhiCPuAG6I0kD0nY7oS
	 O5loheQsjIK3IuR1x6djo8hJJCGWR7oEGE+iZLH8=
Date: Wed, 4 Nov 2026 08:35:45 -0800
From: Jacob Pan <jacob.pan@linux.microsoft.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, Alex Williamson <alex@shazbot.org>, Alexey
 Kardashevskiy <aik@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Joerg
 Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>, Jonathan
 Hunter <jonathanh@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Krishna
 Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Nicolin Chen
 <nicolinc@nvidia.com>, Robin Murphy <robin.murphy@arm.com>, Samuel Ortiz
 <sameo@rivosinc.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, Steven Price
 <steven.price@arm.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thierry Reding <thierry.reding@kernel.org>, Vasant Hegde
 <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>, Xu Yilun
 <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-tegra@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 jacob.pan@linux.microsoft.com
Subject: Re: [PATCH v8 07/15] iommufd/viommu: Keep a reference to the KVM
 file
Message-ID: <20261104083545.00003624@linux.microsoft.com>
In-Reply-To: <20261104161632.3547423-8-aneesh.kumar@kernel.org>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
	<20261104161632.3547423-8-aneesh.kumar@kernel.org>
Organization: LSG
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_083604_725288_9E295BA6 
X-CRM114-Status: GOOD (  24.01  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>

Hi Aneesh,

On Wed,  4 Nov 2026 21:46:24 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> From: Nicolin Chen <nicolinc@nvidia.com>
> 
> The TSM vDevice operations need access to the KVM associated with the
> device's vIOMMU. Save the device's KVM file in the iommufd_viommu
> when the vIOMMU is allocated, and take a file reference so it remains
> valid for the lifetime of the vIOMMU.
> 
> Release the reference when the vIOMMU is destroyed.
> 
> Reject vdevice allocation when the device's KVM association differs
> from the vIOMMU's, including when only one has a KVM association.
> Allow allocation when both associations are NULL.
> 
> Based on an original patch by
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> 
> [nicolinc: hold kvm's users_count]
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> [aneesh.kumar: Switch to use kvm_file]
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/iommu/iommufd/viommu.c | 10 ++++++++++
>  include/linux/iommufd.h        |  1 +
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/iommu/iommufd/viommu.c
> b/drivers/iommu/iommufd/viommu.c index f7951057a1e5..0dbd382eeb98
> 100644 --- a/drivers/iommu/iommufd/viommu.c
> +++ b/drivers/iommu/iommufd/viommu.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /* Copyright (c) 2024, NVIDIA CORPORATION & AFFILIATES
>   */
> +#include <linux/file.h>
>  #include "iommufd_private.h"
>  
>  void iommufd_viommu_destroy(struct iommufd_object *obj)
> @@ -11,6 +12,8 @@ void iommufd_viommu_destroy(struct iommufd_object
> *obj) if (viommu->ops && viommu->ops->destroy)
>  		viommu->ops->destroy(viommu);
>  	refcount_dec(&viommu->hwpt->common.obj.users);
> +	if (viommu->kvm_file)
> +		fput(viommu->kvm_file);
>  	xa_destroy(&viommu->vdevs);
>  }
>  
> @@ -82,6 +85,8 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd
> *ucmd) }
>  
>  	xa_init(&viommu->vdevs);
> +	if (idev->kvm_file)
> +		viommu->kvm_file = get_file(idev->kvm_file);
>  	viommu->type = cmd->type;
>  	viommu->ictx = ucmd->ictx;
>  	viommu->hwpt = hwpt_paging;
> @@ -171,6 +176,11 @@ int iommufd_vdevice_alloc_ioctl(struct
> iommufd_ucmd *ucmd) goto out_put_viommu;
>  	}
>  
> +	if (idev->kvm_file != viommu->kvm_file) {
> +		rc = -EINVAL;
> +		goto out_put_idev;
> +	}
> +
>  	iommu_dev = iommufd_device_get_iommu_dev(idev);
>  	if (!iommu_dev || viommu->iommu_dev != iommu_dev) {
>  		rc = -EINVAL;
> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index b03ce0187454..c15d80f611b9 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -103,6 +103,7 @@ struct iommufd_viommu {
>  	struct iommufd_ctx *ictx;
>  	struct iommu_device *iommu_dev;
>  	struct iommufd_hwpt_paging *hwpt;
> +	struct file *kvm_file;
>  
>  	const struct iommufd_viommu_ops *ops;
>  
Reviewed-by: Jacob Pan <jacob.pan@linux.microsoft.com>

We may need to enable non-kvm file (such as mshv) eventually, but
until then this looks good to me.

