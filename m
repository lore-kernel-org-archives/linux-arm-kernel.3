Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AF5606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 06:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oa8aaUyU;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uy6EMYl/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SBYN8nHbrvBKRMqi5RXO8B9e5Gvye9Fzno6hvtSji7Y=; b=oa8aaUyUOzacbpP1GBo4LL20eb
	sDe2VzOShyPnF17nK1TTm+8/pnmM9ZTeIgALMTZFl4mZG4twxSxZ0DSCFFL+aosO0U08cY7ZmDrsI
	jCbldZ3kLdd6192+lIfaJbL8dt32dt20odf4AtCJZVyPGknwY2i0eF5VmS02YpZYwCw4XLLFKmjNF
	agiQHlTRQw5ZJ47ktR5Y9RzhUrFlnsmoSNEJJXgOmGfeEaXjHGo2C2gEFpQJIf+tEv1tSF+G8SdKl
	paAYJzkBDrJ373cD1PsjJ7fxdKXpNR6D+fRTExjC6GsQaOEX2hKvTibjBDl7TNJBorp/qyNXn439/
	jg7/mHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJaa-00000008TGR-3BIb;
	Thu, 29 Oct 2026 06:26:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJaZ-00000008TGL-2GRh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 06:26:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E8EE601E4;
	Thu, 29 Oct 2026 06:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE471F01825;
	Thu, 29 Oct 2026 06:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793255174;
	bh=SBYN8nHbrvBKRMqi5RXO8B9e5Gvye9Fzno6hvtSji7Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Uy6EMYl/aUxbNk06a+gjS6GHbd/oi5C01+fRiJ3cltkIJv5OTsod38EsQWy7t7dBn
	 NDZucBRCnlRrE4FcJs6mzCXn0iaHWOA6wKxFqhnUCvzeBY/iWWhXk9rPwjvD+faOvY
	 7alUHiUmpBfPf8UWXje9fuyNYk2uOhOSqHViqFIToW9yyC98wxQiuMSwJCGyTPqjZi
	 aBcbxR8E/UhECkrsVez64c5FKzV2tPz4fSYDyuznvLSCdvwJv/jyozbljN64q8rKF3
	 RcC2WNFaDQDWyZ/AQKfhOM37vh9iY4cN7X1OogpQxyUPUKsonl3f93IY/HFPy4WMMr
	 Vs+MMJgJNexVg==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: iommu@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org, jacob.pan@linux.microsoft.com
Subject: Re: [PATCH v7 08/16] iommufd/viommu: Keep a reference to the KVM file
In-Reply-To: <20261014105913.00001217@linux.microsoft.com>
References: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
 <20261008055955.4014342-9-aneesh.kumar@kernel.org>
 <20261014105913.00001217@linux.microsoft.com>
Date: Thu, 29 Oct 2026 11:56:02 +0530
Message-ID: <yq5aecd9aupx.fsf@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Jacob Pan <jacob.pan@linux.microsoft.com> writes:

> Hi Aneesh,
>
> On Thu,  8 Oct 2026 11:29:47 +0530
> "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:
>
>> From: Nicolin Chen <nicolinc@nvidia.com>
>> 
>> The TSM vDevice operations need access to the KVM associated with the
>> device's vIOMMU. Save the device's KVM file in the iommufd_viommu
>> when the vIOMMU is allocated, and take a file reference so it remains
>> valid for the lifetime of the vIOMMU.
>> 
>> Release the reference when the vIOMMU is destroyed.
>> 
>> Based on an original patch by
>> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> 
>> [nicolinc: hold kvm's users_count]
>> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
>> [aneesh.kumar: Switch to use kvm_file]
>> Cc: jgg@ziepe.ca
>> Cc: kevin.tian@intel.com
>> Cc: joro@8bytes.org
>> Cc: will@kernel.org
>> Cc: robin.murphy@arm.com
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>  drivers/iommu/iommufd/viommu.c | 5 +++++
>>  include/linux/iommufd.h        | 1 +
>>  2 files changed, 6 insertions(+)
>> 
>> diff --git a/drivers/iommu/iommufd/viommu.c
>> b/drivers/iommu/iommufd/viommu.c index f7951057a1e5..b7489ed259bd
>> 100644 --- a/drivers/iommu/iommufd/viommu.c
>> +++ b/drivers/iommu/iommufd/viommu.c
>> @@ -1,6 +1,7 @@
>>  // SPDX-License-Identifier: GPL-2.0-only
>>  /* Copyright (c) 2024, NVIDIA CORPORATION & AFFILIATES
>>   */
>> +#include <linux/file.h>
>>  #include "iommufd_private.h"
>>  
>>  void iommufd_viommu_destroy(struct iommufd_object *obj)
>> @@ -11,6 +12,8 @@ void iommufd_viommu_destroy(struct iommufd_object
>> *obj) if (viommu->ops && viommu->ops->destroy)
>>  		viommu->ops->destroy(viommu);
>>  	refcount_dec(&viommu->hwpt->common.obj.users);
>> +	if (viommu->kvm_file)
>> +		fput(viommu->kvm_file);
>>  	xa_destroy(&viommu->vdevs);
>>  }
>>  
>> @@ -82,6 +85,8 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd
>> *ucmd) }
>>  
>>  	xa_init(&viommu->vdevs);
>> +	if (idev->kvm_file)
>> +		viommu->kvm_file = get_file(idev->kvm_file);
> So kvm_file will persist inside viommu even when no more vdevice exists
> under the viommu. In that case, don't we need to check idev->kvm_file
> matches viommu->kvm_file during vdevice allocation?
>
> Otherwise, it appears possible to associate a device belonging to a
> different KVM VM with the existing vIOMMU, no?
>

Agreed. I will add the below.

modified    drivers/iommu/iommufd/viommu.c
@@ -212,6 +212,11 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
 		goto out_put_viommu;
 	}
 
+	if (idev->kvm_file != viommu->kvm_file) {
+		rc = -EINVAL;
+		goto out_put_idev;
+	}
+
 	if (viommu->iommu_dev) {
 		iommu_dev = iommufd_device_get_iommu_dev(idev);
 		if (!iommu_dev || viommu->iommu_dev != iommu_dev) {



-aneesh

