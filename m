Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01FDC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 14:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/L74aNTJbvTixP9x7JPOzIa2qX6+0XWisdXXC8NLNbk=; b=m+6bSDnQl5FYCn6BMkUxNNJ/hY
	v3bEijo6vifP0OqAxr3zVSrXC3Vbl/sReZayKQUSrt90bR6QnykIfFieF+GMBrgkbqv334BLYLxvR
	+S4uNqh47phcEcLpIjVJIgpJJzF2aQPNQM3oyftVbaS9LQ7Fgofg7Yr3QyxM9QgKQMIqYDFX6LlHx
	gypt89/4lYuR3SKxZlUQEWMNtwQzBnyzipw1CF7vDjmguBFtAwAdueoiCAeuKaZumocb70wQ7+Jpa
	JP+NuG2Mmrvd3+RmzICqsdbB1jy/qe+/aM0UFNzxCL32mDaHEwMtXHnxttFoPwbLhUy4sUHFzlaUS
	KLzRUzZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbv6-00000005hAo-0KNN;
	Tue, 01 Jul 2025 14:25:12 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaV6-00000005OW6-1lPu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 12:54:18 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2357c61cda7so119295ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751374456; x=1751979256; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/L74aNTJbvTixP9x7JPOzIa2qX6+0XWisdXXC8NLNbk=;
        b=4LG8nUH4I2jNi5OV4LWtZPFY56mvGYyMpBUXVNFa5IXjOeWRKZMEkEoGu91yplRmYL
         cPzMCck6uxg98HzSMGvh8wcIHZGhqQHS+eg1/MJnUfCQqHn9uXLe6h+R0KvsX25c3tp4
         Q5iBpMGOXitl17T0zyhcs1v+qu7uR1oOJIOF70fMFbKIweise/br6rpbuhf0WH6EMYqI
         +8/Bzewd3IdAMRf2Y1KFewPawA2zBK18jICXY2/fD699Ca+y7YZtYdEWOqwSROjWlbL2
         V1gXiOd8X5cQYxz3b7xho1o/LG6Wkv8hud+wPmBrFgY6jWQ1daUgUZLeDJmtGnOaP/WQ
         DikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751374456; x=1751979256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/L74aNTJbvTixP9x7JPOzIa2qX6+0XWisdXXC8NLNbk=;
        b=rmmw0fsvFtZ0woDkJNlOpcQ7rRoxLY9S0Jdal1Mm37Dml4otrFHTIxGDp1cjT2cYtt
         qwwOhQPYJp+iLs4nd/HATMvjn+IJ48QfxpCoTDUUJoqVOKeiwd5J7iQ4G4ksIWxvtMgA
         mLAeOxf2JhjTRj5Xy7V9fAA3kI3KQNc2I+CeOq4EdnvsFg3+nPfxxtoFvR9xIKUF9R9q
         uqr3aQZG+iZReE7q0aWeK3eyYOEbi/GTvsp+jzQNe76Hfz9GJdVyv5hvUzN5jmQE96QS
         amtlDGoqCtFSXgvDmdToxux8ylNQqsc0L4b4vVii3yNk/MAWXOzUMilkSvw0cgtW4nGd
         fzUA==
X-Forwarded-Encrypted: i=1; AJvYcCXJfS2Q+LgWto/4bOTRLJ7KYwrmLB/hyqfpIqKWyqLoCOJFUdn9G0jAvbUAD7rQelM1xYFB/+n2pTGNlGm/c8sN@lists.infradead.org
X-Gm-Message-State: AOJu0YxN4IUQxriaV6R25KRp5/Ww+h2QjzIO4o/og5lE0zhXiJnUEJJ8
	0ioj6ia56JsSHdolNB8WWTFsFYLwPVLrBwjcOC+wki6d5pP5nsWDAUDvqYbX6gtHxg==
X-Gm-Gg: ASbGncvl+Vtw1WSNiUdS3/KM70jjPx+Nu0Q+bxzwv+eHW9GxajD5u8AF6d5QZ/8X4C8
	YqyXMQKRHF/PAyAMPxOSx34wjqhh1j4aK2Nfq09+YlWd9tr8OYdy2GIFlB8+wqI6UATM23Dj2Nl
	+tgDWU8sRjOgAKpm8sfzuwzrD6Zv7OjTYeVeO+9V5ikL8dQiz4N13Fw23yO7Fx5tUTrLu/UaWyb
	j0jOoGjwxowxLaEKpPmmsjL4tGUYwPHG/H7zmV13tJOEy+llbb7FXdGmbLnNVYQWm3ahqVYxAL2
	+bOc7y2GuQ0YlIt7iIL7k1thXtH9MzaJNu+TivH9LcUSSaTTBjgyhnrie3PMazXAs/ND7sx1ZNg
	GASrsOwIur5LqydKfN/l6
X-Google-Smtp-Source: AGHT+IFmb6IkHO5vc0UO9aOVGDXMpB2kmzp4LmZ2sU6rPiqzBx0SBn3BZ18jaHfT4NmGETFHxk/nSg==
X-Received: by 2002:a17:902:f688:b0:231:ed22:e230 with SMTP id d9443c01a7336-23c6010f25amr2110315ad.15.1751374455431;
        Tue, 01 Jul 2025 05:54:15 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b7a47sm108535025ad.166.2025.07.01.05.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 05:54:13 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:54:05 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 19/28] iommu: Allow an input type in hw_info op
Message-ID: <aGPabX6M2REffzjY@google.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <d8c395d6956045fd1fa1349538d29e3b6f9fada8.1750966133.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8c395d6956045fd1fa1349538d29e3b6f9fada8.1750966133.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_055416_471776_75A9B2E0 
X-CRM114-Status: GOOD (  28.15  )
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

On Thu, Jun 26, 2025 at 12:34:50PM -0700, Nicolin Chen wrote:
> The hw_info uAPI will support a bidirectional data_type field that can be
> used as an input field for user space to request for a specific info data.
> 
> To prepare for the uAPI update, change the iommu layer first:
>  - Add a new IOMMU_HW_INFO_TYPE_DEFAULT as an input, for which driver can
>    output its only (or firstly) supported type
>  - Update the kdoc accordingly
>  - Roll out the type validation in the existing drivers
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommu.h                               | 3 ++-
>  include/uapi/linux/iommufd.h                        | 4 +++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 4 ++++
>  drivers/iommu/intel/iommu.c                         | 4 ++++
>  drivers/iommu/iommufd/device.c                      | 3 +++
>  drivers/iommu/iommufd/selftest.c                    | 4 ++++
>  6 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index e06a0fbe4bc7..e8b59ef54e48 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -603,7 +603,8 @@ __iommu_copy_struct_to_user(const struct iommu_user_data *dst_data,
>   * @capable: check capability
>   * @hw_info: report iommu hardware information. The data buffer returned by this
>   *           op is allocated in the iommu driver and freed by the caller after
> - *           use.
> + *           use. @type can input a requested type and output a supported type.
> + *           Driver should reject an unsupported data @type input
>   * @domain_alloc: Do not use in new drivers
>   * @domain_alloc_identity: allocate an IDENTITY domain. Drivers should prefer to
>   *                         use identity_domain instead. This should only be used
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index f091ea072c5f..6ad361ff9b06 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -593,13 +593,15 @@ struct iommu_hw_info_arm_smmuv3 {
>  
>  /**
>   * enum iommu_hw_info_type - IOMMU Hardware Info Types
> - * @IOMMU_HW_INFO_TYPE_NONE: Used by the drivers that do not report hardware
> + * @IOMMU_HW_INFO_TYPE_NONE: Output by the drivers that do not report hardware
>   *                           info
> + * @IOMMU_HW_INFO_TYPE_DEFAULT: Input to request for a default type
>   * @IOMMU_HW_INFO_TYPE_INTEL_VTD: Intel VT-d iommu info type
>   * @IOMMU_HW_INFO_TYPE_ARM_SMMUV3: ARM SMMUv3 iommu info type
>   */
>  enum iommu_hw_info_type {
>  	IOMMU_HW_INFO_TYPE_NONE = 0,
> +	IOMMU_HW_INFO_TYPE_DEFAULT = 0,
>  	IOMMU_HW_INFO_TYPE_INTEL_VTD = 1,
>  	IOMMU_HW_INFO_TYPE_ARM_SMMUV3 = 2,
>  };
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 170d69162848..eb9fe1f6311a 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -15,6 +15,10 @@ void *arm_smmu_hw_info(struct device *dev, u32 *length,
>  	u32 __iomem *base_idr;
>  	unsigned int i;
>  
> +	if (*type != IOMMU_HW_INFO_TYPE_DEFAULT &&
> +	    *type != IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
> +		return ERR_PTR(-EOPNOTSUPP);
> +
>  	info = kzalloc(sizeof(*info), GFP_KERNEL);
>  	if (!info)
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 850f1a6f548c..5f75faffca15 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -4098,6 +4098,10 @@ static void *intel_iommu_hw_info(struct device *dev, u32 *length,
>  	struct intel_iommu *iommu = info->iommu;
>  	struct iommu_hw_info_vtd *vtd;
>  
> +	if (*type != IOMMU_HW_INFO_TYPE_DEFAULT &&
> +	    *type != IOMMU_HW_INFO_TYPE_INTEL_VTD)
> +		return ERR_PTR(-EOPNOTSUPP);
> +
>  	vtd = kzalloc(sizeof(*vtd), GFP_KERNEL);
>  	if (!vtd)
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
> index 8f078fda795a..64a51993e6a1 100644
> --- a/drivers/iommu/iommufd/device.c
> +++ b/drivers/iommu/iommufd/device.c
> @@ -1519,6 +1519,9 @@ int iommufd_get_hw_info(struct iommufd_ucmd *ucmd)
>  	    cmd->__reserved[2])
>  		return -EOPNOTSUPP;
>  
> +	/* Clear the type field since drivers don't support a random input */
> +	cmd->out_data_type = IOMMU_HW_INFO_TYPE_DEFAULT;
> +
>  	idev = iommufd_get_device(ucmd, cmd->dev_id);
>  	if (IS_ERR(idev))
>  		return PTR_ERR(idev);
> diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
> index 8b2c44b32530..a5dc36219a90 100644
> --- a/drivers/iommu/iommufd/selftest.c
> +++ b/drivers/iommu/iommufd/selftest.c
> @@ -310,6 +310,10 @@ static void *mock_domain_hw_info(struct device *dev, u32 *length,
>  {
>  	struct iommu_test_hw_info *info;
>  
> +	if (*type != IOMMU_HW_INFO_TYPE_DEFAULT &&
> +	    *type != IOMMU_HW_INFO_TYPE_SELFTEST)
> +		return ERR_PTR(-EOPNOTSUPP);
> +
>  	info = kzalloc(sizeof(*info), GFP_KERNEL);
>  	if (!info)
>  		return ERR_PTR(-ENOMEM);

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 

