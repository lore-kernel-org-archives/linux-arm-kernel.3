Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DD8606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qJCR16H1;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j+VpPybF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xPmA0pkfhdgm8CaJDGdf7BEDZGYIBrL6KWwLvFembQY=; b=qJCR16H1oqy0zXhQraXzKKSUaw
	aeiL1KlzCnu3sCK/ueIaze7webHgwmgFaitNJngQmNtyZnKL3Bi4devA2VT46dlsJjkM+JKQqtag2
	RVPS8slbcq4VrB/eo4bJyvEh7+YXg312V+FTYL5kPrCGUmNmrGWsfJ2sfQferxMqrYX5fkCSKR+Td
	67GjYgmYB8QcACHjm9zKGHcXNfFWJQqP0GpQkg3gY1Qs99fRHVEJn0mHyPNvHrsjclAXDHRNq1KpH
	qfXyjrMgV2o9YVwZo1UE3J1Kj9X6sTOXZ3byoZZjH4QD22J5FmdnnAymM2LewdmA7jvC5ZA78UpSL
	CbmO+ZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLOR-00000008hWs-3qR3;
	Thu, 29 Oct 2026 08:21:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLOP-00000008hWa-43KP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 08:21:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DA4543B26;
	Thu, 29 Oct 2026 08:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026C61F01825;
	Thu, 29 Oct 2026 08:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793262109;
	bh=xPmA0pkfhdgm8CaJDGdf7BEDZGYIBrL6KWwLvFembQY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=j+VpPybF6IZFS02jOwPLDCU/oqxnF36kGt/r+uuygcDVDakU+jtz7x6bM47p1LBbB
	 A5DkDZENUbYysQ/lFizuVu9Jakcxi+LatcRtyxMktaYn959Xd+jSu1xzh4Rp3ldkxj
	 0jCC1apEtCbQ36cK51x6ekx5Wo0w+S5PmzaPF8liLzSuNORTHrw6cWAgnVidD/keCF
	 FCXGBZqw8jA/6Ea+//8GN+Qh/ttyFLzrNrOPiNntT4aDom9QwKVkPs1pzNdWRumSjR
	 WBqj5BQVS7ec/2NdB5VXi7EpvUmfgTm+GtkQwFSADEIhzS9z94STGRqVROt2AYgnCb
	 mE3Omf6VbU3Dg==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Alexey Kardashevskiy <aik@amd.com>
Cc: iommu@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
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
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 13/16] iommufd/viommu: Select vIOMMU operations
 before allocation
In-Reply-To: <179321444125.2412245.13201160469751061592.b4-review@b4>
References: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
 <20261008055955.4014342-14-aneesh.kumar@kernel.org>
 <179321444125.2412245.13201160469751061592.b4-review@b4>
Date: Thu, 29 Oct 2026 13:51:37 +0530
Message-ID: <yq5a7bj0c3xq.fsf@kernel.org>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Jason Gunthorpe <jgg@nvidia.com> writes:

>> [ ... 62 lines skipped ... ]
>> --- a/drivers/iommu/amd/iommufd.c
>> +++ b/drivers/iommu/amd/iommufd.c
>> @@ -32,13 +32,21 @@ void *amd_iommufd_hw_info(struct device *dev, u32 *length, enum iommu_hw_info_ty
>>  	return hwinfo;
>>  }
>>  
>> -size_t amd_iommufd_get_viommu_size(struct device *dev, enum iommu_viommu_type viommu_type)
>> +static size_t amd_iommufd_get_viommu_size(struct device *dev,
>> +		enum iommu_viommu_type viommu_type)
>>  {
>>  	return VIOMMU_STRUCT_SIZE(struct amd_iommu_viommu, core);
>>  }
>>  
>> -int amd_iommufd_viommu_init(struct iommufd_viommu *viommu, struct iommu_domain *parent,
>> -			    const struct iommu_user_data *user_data)
>> +const struct iommufd_viommu_ops *
>> +amd_iommufd_get_viommu_ops(struct device *dev, enum iommu_viommu_type viommu_type)
>> +{
>> +	return &amd_viommu_ops;
>> +}
>
> This needs to fail not retain the broken behavior if this is getting
> touched..
>

Do you mean return NULL until we add an AMD-specific type equivalent to
IOMMU_VIOMMU_TYPE_ARM_SMMUV3?

modified    drivers/iommu/amd/iommufd.c
@@ -41,7 +41,7 @@ static size_t amd_iommufd_get_viommu_size(struct device *dev,
 const struct iommufd_viommu_ops *
 amd_iommufd_get_viommu_ops(struct device *dev, enum iommu_viommu_type viommu_type)
 {
-	return &amd_viommu_ops;
+	return NULL:
 }
 
 int amd_iommufd_viommu_init(struct iommufd_viommu *viommu,


Alexey,

Could you look at this and suggest the AMD equivalent of
arm_smmu_get_viommu_ops()? We could add it as part of this patch.


-aneesh

