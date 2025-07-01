Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613A9C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 14:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPts6df6Q4890tqHCArh7YEtzYo+b0PlaNL9e95JEQ4=; b=ZRHAG3DfVsdi9XaPelHxzzC6Ho
	dKeAY2nhtbkmhdPKY1VDSFRzquy94GHE2gBYTi89XsssycVl4Gj+vZpevBeqFUAJO1YJv+9VLP1wG
	nEbbszQMDedcNBXeURwvqadvFMpLOUxhw45EEF9rJBXZX4M9C1d/wAB59Orj/EXlJofYkA7PseUNX
	NZoe7NJYkmaK+FM7qBKhf4IwjHh+mpd/qRYoY/sQRwKQHxE1xyyU+Bo0cHtWHyGHD1L50S8tdJBr+
	sZFphUX52z/K/QRufqeKRGxeVWpXs1uT2Fyi6G7aVPnUXuqJ+C+SjOy7aQgfL9Et0Iq5C0CXUwwyr
	uEAEZkjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbls-00000005f2O-0nFt;
	Tue, 01 Jul 2025 14:15:40 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaPU-00000005NNq-27Cq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 12:48:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-237f270513bso139565ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 05:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751374108; x=1751978908; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GPts6df6Q4890tqHCArh7YEtzYo+b0PlaNL9e95JEQ4=;
        b=TQBN/wcAf+XSldsBzqLbnpK0UGOlT5NMtTHNny/eoya1G1GLFxliLolNOhKOuKZ6k4
         +XHsT/VLh7fgkYoUUt865rzZDhZfrbPJ30CgOaWz3TkSORyEFS9+99oi2FMpzfF5GQ59
         e6a/CxulXwqiubbuUiPCnrwQPODRY5H7a7h2qYqEpDZWb3VSYSsrLvn7EwaiLnL6Jhak
         i067xEfsBIP6O7RRv84vDDmOteNAQ+qaUd7r8zfCDvdmk2/SR4TDVelWMuUQ7qEDnuny
         FGhrikcNQcswejrwjOw76jh6rkGKE66v8rKt6H1ZUEJ2ezQ6+fge3VI7vX8VqlW2zWja
         /v4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751374108; x=1751978908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPts6df6Q4890tqHCArh7YEtzYo+b0PlaNL9e95JEQ4=;
        b=V1YuysVPxAhcPcmqd/Fkv/SBcRtxgk5x4/HVs0TQyGOp1rdIC+yIdPXR/lDIVvUueH
         CJCbIHSqKejPtDU7NIlxsS2/nY4vdMiz8afgEFa7bebZK4fUDM3oEpapa4bNSfgK10pj
         D83UrbcYifbILsJ5pAfFRThdd++1h++EYlTR3gRtCIAs67hYBB10F/eC3KYyEZ35SlKw
         WlLte4TldPKIAo6LlvyDd/D50W4LSPB65JogRcYwfXStHvDKvXjtlTTvXJKsNjEfUKuz
         3OT/m1JQFEta2kx9fH8kXhiwcw0oF1n9NuqxxL6E4i+rPZCqZFjliwWz9UNTvnY0XKUK
         jspw==
X-Forwarded-Encrypted: i=1; AJvYcCW4CeDrpHFY1X50dHHNwy/+KDJyZatWtgX8vSHAvXPWmLW4S1fPd6aYEPRGejiMGGd+Af3NKWcmUtsK5Z0jptNq@lists.infradead.org
X-Gm-Message-State: AOJu0YxqMoZOr6CqityZ7L+WORlA23apGjPczxb/BmDPpGiMSo6qnsLy
	SklfvZuVixEnebeyKo4ICMeCRZ8PaQhDnU3xcTTcIj7oHD2ChTEGnuXWRxs/hcL44A==
X-Gm-Gg: ASbGncsJ2RLNnfUT6uRdy5BqL5XrGeiysR6Dtddl7ALzg5CvyLADatpzgoX1YV/y5tA
	ho1RPY/a8EVjhfN3AhveOPq2SV2zbiUKYlvsQwFwWOcXWO22s8nE5/lhbtMeO1Lrv5B31sXv2Wp
	jp4xu5iLp8YVai9mO7J8G6ytPknm0FMf0CrpxABnzVuTCzeQlu93GwfiNVBZl6sCCQHbUGhRvkm
	wj6DoaO+djdTf+5lUT/DgWsNTVEcgq1xpYUFkqyQwNzyVdX/44ja3+VjnMny7wau54vjXm1tbO6
	mbNYXmFB9dwKXlXBVMyX/nButPada2NBBhbmmZ4o1mkxVK/XFPQJzoxcRlH4TH0Q4yxHy8Cm4MC
	7mqwBA7Tl2imxW7F8t+hL
X-Google-Smtp-Source: AGHT+IE1AhXNqed/8JZKyAmcFp7SvY2x6/U4LqFKGR3TbYVNdWAQposrAbDssUYuNO2iiJxapdN4ug==
X-Received: by 2002:a17:903:2cf:b0:231:e069:6195 with SMTP id d9443c01a7336-23c6015a715mr2208215ad.23.1751374107263;
        Tue, 01 Jul 2025 05:48:27 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541e5c1sm11877926b3a.70.2025.07.01.05.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 05:48:26 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:48:17 +0000
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
Subject: Re: [PATCH v7 03/28] iommu: Use enum iommu_hw_info_type for type in
 hw_info op
Message-ID: <aGPZEbur-8d5cHz1@google.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <f588bf6a47cbaf350a03e5a1680074b852fb5502.1750966133.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f588bf6a47cbaf350a03e5a1680074b852fb5502.1750966133.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_054828_554051_CB11861C 
X-CRM114-Status: GOOD (  22.84  )
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

On Thu, Jun 26, 2025 at 12:34:34PM -0700, Nicolin Chen wrote:
> Replace u32 to make it clear. No functional changes.
> 
> Also simplify the kdoc since the type itself is clear enough.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommu.h                               | 6 +++---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 3 ++-
>  drivers/iommu/intel/iommu.c                         | 3 ++-
>  drivers/iommu/iommufd/selftest.c                    | 3 ++-
>  4 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 04548b18df28..b87c2841e6bc 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -563,8 +563,7 @@ iommu_copy_struct_from_full_user_array(void *kdst, size_t kdst_entry_size,
>   * @capable: check capability
>   * @hw_info: report iommu hardware information. The data buffer returned by this
>   *           op is allocated in the iommu driver and freed by the caller after
> - *           use. The information type is one of enum iommu_hw_info_type defined
> - *           in include/uapi/linux/iommufd.h.
> + *           use.
>   * @domain_alloc: Do not use in new drivers
>   * @domain_alloc_identity: allocate an IDENTITY domain. Drivers should prefer to
>   *                         use identity_domain instead. This should only be used
> @@ -623,7 +622,8 @@ iommu_copy_struct_from_full_user_array(void *kdst, size_t kdst_entry_size,
>   */
>  struct iommu_ops {
>  	bool (*capable)(struct device *dev, enum iommu_cap);
> -	void *(*hw_info)(struct device *dev, u32 *length, u32 *type);
> +	void *(*hw_info)(struct device *dev, u32 *length,
> +			 enum iommu_hw_info_type *type);
>  
>  	/* Domain allocation and freeing by the iommu driver */
>  #if IS_ENABLED(CONFIG_FSL_PAMU)
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 9f59c95a254c..69bbe39e28de 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -7,7 +7,8 @@
>  
>  #include "arm-smmu-v3.h"
>  
> -void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type)
> +void *arm_smmu_hw_info(struct device *dev, u32 *length,
> +		       enum iommu_hw_info_type *type)
>  {
>  	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
>  	struct iommu_hw_info_arm_smmuv3 *info;
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 7aa3932251b2..850f1a6f548c 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -4091,7 +4091,8 @@ static int intel_iommu_set_dev_pasid(struct iommu_domain *domain,
>  	return ret;
>  }
>  
> -static void *intel_iommu_hw_info(struct device *dev, u32 *length, u32 *type)
> +static void *intel_iommu_hw_info(struct device *dev, u32 *length,
> +				 enum iommu_hw_info_type *type)
>  {
>  	struct device_domain_info *info = dev_iommu_priv_get(dev);
>  	struct intel_iommu *iommu = info->iommu;
> diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
> index 74ca955a766e..7a9abe3f47d5 100644
> --- a/drivers/iommu/iommufd/selftest.c
> +++ b/drivers/iommu/iommufd/selftest.c
> @@ -287,7 +287,8 @@ static struct iommu_domain mock_blocking_domain = {
>  	.ops = &mock_blocking_ops,
>  };
>  
> -static void *mock_domain_hw_info(struct device *dev, u32 *length, u32 *type)
> +static void *mock_domain_hw_info(struct device *dev, u32 *length,
> +				 enum iommu_hw_info_type *type)
>  {
>  	struct iommu_test_hw_info *info;
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 

