Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3038CD6DDC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 03:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1VLStTCFkxyufdMpLCZLja7IK8d1o4v8Hl7ldnhhgI=; b=UITgP36TdVFmozZtxRztkYGQXo
	/02PIrps7RLVzfOpdo+tfWsPD+6oeQovybzrhqK0uelukdS+FYWxVErJIB/dLTQ/bWzrUffscXUJH
	QdcOnrs8g5kbybXPKCXsfteVHradPQtALJo/lVuEQl2d7j1wb8vDtc+qv3RKvcExYVc9cD5E7ZmXE
	wG9qS3EsW8fCX03iYv4xHxyXkX2dGzN1K4i8ktR39hirXZj+tDgxnIldeK//TI9DsNkcNp/pu2s7u
	u2uIPa0tswpbmlFp5P5TCOaGy1S4DetK7Y8Vzt9bzFj9F+WHwErasRcCDBnxVQ1a4+GMx1CWJv+lp
	+8yLEQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBmtR-00000001T9s-1uvq;
	Fri, 15 Nov 2024 03:21:09 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBmsV-00000001SvN-0FUH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 03:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731640811; x=1763176811;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EmmauIawg383LKUBt/6r/yNcNhvgcVIZnj39fkNbIv8=;
  b=iz1FSZJ/i2LN65+476UsN/m2cyD3nPCAcNGpQ24vRtrXDgOOI2qxaPhf
   JdOxjRqNzOyXlvUPBBij9kP311XJ/wWN1hsg0GPh8G56djsCdFOZlXMJo
   ZrHgfYsf3WL5WIxEHkXUp5eP9FHwhwBpB/ojqoGTxEj3nkuKtfWfCLvfB
   xQI7RUxYLILmvAgJu171OM+By9yK+W72DG8h7uzuj7NgATaH8XTUL7G3U
   zm9yJe3DQjRDdfpQO7Ra1uj+is/3ArJgX8uP2LeEBPY9UJH/HHde9R/4z
   /T7AtuJSHZpL5zodZrbD6yGql7z6Z28dgUoB4FOvbUBGtWqM/zyzGn5Ji
   Q==;
X-CSE-ConnectionGUID: 8Bu2VukoS0ahor0RBiwh/Q==
X-CSE-MsgGUID: 2zh9ikp7Se+Z4kIBsAeY3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="43014891"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="43014891"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 19:20:09 -0800
X-CSE-ConnectionGUID: AtpwSsV+RnaGl0XhBl2YSw==
X-CSE-MsgGUID: J2He9sEdRqWy3hAuDWdm3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="89166020"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 19:20:07 -0800
Message-ID: <9c065d9d-ec97-4d3c-a2af-0dd4fe40ad5a@linux.intel.com>
Date: Fri, 15 Nov 2024 11:19:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iommu: Add ops->domain_alloc_nested()
To: Jason Gunthorpe <jgg@nvidia.com>, David Woodhouse <dwmw2@infradead.org>,
 iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>
Cc: patches@lists.linux.dev
References: <1-v1-c252ebdeb57b+329-iommu_paging_flags_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <1-v1-c252ebdeb57b+329-iommu_paging_flags_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_192011_161128_4F33BDD5 
X-CRM114-Status: GOOD (  19.11  )
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

On 11/15/24 03:55, Jason Gunthorpe wrote:
> It turns out all the drivers that are using this immediately call into
> another function, so just make that function directly into the op. This
> makes paging=NULL for domain_alloc_user and we can remove the argument in
> the next patch.
> 
> The function mirrors the similar op in the viommu that allocates a nested
> domain on top of the viommu's nesting parent. This version supports cases
> where a viommu is not being used.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/intel/iommu.c          |  9 +++------
>   drivers/iommu/intel/iommu.h          |  6 ++++--
>   drivers/iommu/intel/nested.c         | 11 +++++++++--
>   drivers/iommu/iommufd/hw_pagetable.c |  8 ++++----
>   drivers/iommu/iommufd/selftest.c     |  7 ++++---
>   include/linux/iommu.h                |  9 +++++----
>   6 files changed, 29 insertions(+), 21 deletions(-)
>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

with below minor suggestion.

[...]

> diff --git a/drivers/iommu/intel/nested.c b/drivers/iommu/intel/nested.c
> index 42c4533a6ea21d..aba92c00b42740 100644
> --- a/drivers/iommu/intel/nested.c
> +++ b/drivers/iommu/intel/nested.c
> @@ -186,14 +186,21 @@ static const struct iommu_domain_ops intel_nested_domain_ops = {
>   	.cache_invalidate_user	= intel_nested_cache_invalidate_user,
>   };
>   
> -struct iommu_domain *intel_nested_domain_alloc(struct iommu_domain *parent,
> -					       const struct iommu_user_data *user_data)
> +struct iommu_domain *
> +intel_iommu_domain_alloc_nested(struct device *dev, struct iommu_domain *parent,
> +				u32 flags,
> +				const struct iommu_user_data *user_data)
>   {
> +	struct device_domain_info *info = dev_iommu_priv_get(dev);
>   	struct dmar_domain *s2_domain = to_dmar_domain(parent);
> +	struct intel_iommu *iommu = info->iommu;
>   	struct iommu_hwpt_vtd_s1 vtd;
>   	struct dmar_domain *domain;
>   	int ret;
>   
> +	if (!nested_supported(iommu) || flags)
> +		return ERR_PTR(-EOPNOTSUPP);

How about making it like

         if (!nested_supported(iommu) || (flags & 
~IOMMU_HWPT_FAULT_ID_VALID))
                 return ERR_PTR(-EOPNOTSUPP);

         if ((flags & IOMMU_HWPT_FAULT_ID_VALID) && !info->pri_supported)
                 return ERR_PTR(-EOPNOTSUPP);

?

--
baolu

