Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA1DC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 02:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUFRAsGPUrmxTvUi3n4dpptHopKyu19slCIJDggC7v4=; b=H9xqjDaNr0NjUTU1WRbeT7lu8n
	AFSMGepd6ZlWpFvlzdzpV9fHLxsmDCIGhOVNTbKLm9KJswzbu8fH+LBdY04LJrldyaAICtN3ncBJb
	eS7ZuE+mQ2bLP7zT9yKRcbdn+6DLiWGYvlOYlHEHoOenZY9QmjFUkZZxeLQEq/jMO/dNcNcfSCIVt
	qLm8V0SSb6uZv1YW3U+oBTVHIS5Cb43HIJEpf72azeW4+DcCbdX5kx5Vi1Z5Ed4lTrChFpZbisFXw
	3xgIDERVO7wT6kKGU+ipaYeOj23hVPlvqpFJzViMTn19PDQlT79VYsMSPQ+eVzdt2sk2WfKmL75RY
	dwS/Ktpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Efv-00000004OKi-0CUg;
	Mon, 28 Apr 2025 02:56:55 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Edu-00000004O8u-0tem
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 02:54:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745808891; x=1777344891;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8UmPPcYF02m42D0X2SqZC95wLkwf70+0LBSPOHRvYHs=;
  b=Kl1bFAdLaSiUzYVihKqUN3S5qa90izVATeGWHO0OL2L/Fcox7qaSbZ/l
   uwRG5KF5IG8Lq+BJZyyhUFWeM30t0UEMumfLAh7eO5mbLr/pFNdRbFfOA
   wFfoUcWG/cfgOm/vY5lvgEDYesz7GYrTZRl+3NmUtAvbuf6fivt0xG7E4
   e8ryHtzxvxtOXyl/m6OYDMUYDFkxhPdmKBFqLlIQe9Cy+cpA+yBgME+hH
   yZJcHOGOR2OPgUwr9Fud7SPst/psNNF9B2BgyaItbh+PARhmEu5iCPnOD
   4Ns2tJzofQiJdz4xUjG6okgXFDMH6rOer3NTqgO9lIVNL+lpNdd/lAQUH
   w==;
X-CSE-ConnectionGUID: Zho6OKJOSlinWOd0D557MA==
X-CSE-MsgGUID: QHcYMzwNSNeUzL0ez172Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="51191798"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="51191798"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 19:54:48 -0700
X-CSE-ConnectionGUID: +mY80rqWTlmDXdkEN10FGw==
X-CSE-MsgGUID: I+oqtZWeS3+OR7W5/JQ1Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="133277233"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 19:54:42 -0700
Message-ID: <c4d03b52-422e-41ab-845b-1d2eda7ca9e2@linux.intel.com>
Date: Mon, 28 Apr 2025 10:50:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/22] iommufd: Add mmap interface
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com,
 corbet@lwn.net, will@kernel.org
Cc: bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
 peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
 praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kselftest@vger.kernel.org, patches@lists.linux.dev, mochs@nvidia.com,
 alok.a.tiwari@oracle.com, vasant.hegde@amd.com
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7be26560c604b0cbc2fd218997b97a47e4ed11ff.1745646960.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <7be26560c604b0cbc2fd218997b97a47e4ed11ff.1745646960.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_195450_309992_77BAD6FC 
X-CRM114-Status: GOOD (  27.66  )
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

On 4/26/25 13:58, Nicolin Chen wrote:
> For vIOMMU passing through HW resources to user space (VMs), add an mmap
> infrastructure to map a region of hardware MMIO pages.
> 
> Maintain an mt_mmap per ictx for validations. To allow IOMMU drivers to
> add and delete mmappable regions to/from the mt_mmap, add a pair of new
> helpers: iommufd_ctx_alloc_mmap() and iommufd_ctx_free_mmap().

I am wondering why the dma_buf mechanism isn't used here, considering
that this also involves an export and import pattern.

> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommufd/iommufd_private.h |  8 +++++
>   include/linux/iommufd.h                 | 15 ++++++++++
>   drivers/iommu/iommufd/driver.c          | 39 +++++++++++++++++++++++++
>   drivers/iommu/iommufd/main.c            | 39 +++++++++++++++++++++++++
>   4 files changed, 101 insertions(+)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index b974c207ae8a..db5b62ec4abb 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -7,6 +7,7 @@
>   #include <linux/iommu.h>
>   #include <linux/iommufd.h>
>   #include <linux/iova_bitmap.h>
> +#include <linux/maple_tree.h>
>   #include <linux/rwsem.h>
>   #include <linux/uaccess.h>
>   #include <linux/xarray.h>
> @@ -44,6 +45,7 @@ struct iommufd_ctx {
>   	struct xarray groups;
>   	wait_queue_head_t destroy_wait;
>   	struct rw_semaphore ioas_creation_lock;
> +	struct maple_tree mt_mmap;
>   
>   	struct mutex sw_msi_lock;
>   	struct list_head sw_msi_list;
> @@ -55,6 +57,12 @@ struct iommufd_ctx {
>   	struct iommufd_ioas *vfio_ioas;
>   };
>   
> +/* Entry for iommufd_ctx::mt_mmap */
> +struct iommufd_mmap {
> +	unsigned long pfn_start;
> +	unsigned long pfn_end;
> +};

This structure is introduced to represent a mappable/mapped region,
right? It would be better to add comments specifying whether the start
and end are inclusive or exclusive.

> +
>   /*
>    * The IOVA to PFN map. The map automatically copies the PFNs into multiple
>    * domains and permits sharing of PFNs between io_pagetable instances. This
> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index 5dff154e8ce1..d63e2d91be0d 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -236,6 +236,9 @@ int iommufd_object_depend(struct iommufd_object *obj_dependent,
>   			  struct iommufd_object *obj_depended);
>   void iommufd_object_undepend(struct iommufd_object *obj_dependent,
>   			     struct iommufd_object *obj_depended);
> +int iommufd_ctx_alloc_mmap(struct iommufd_ctx *ictx, phys_addr_t base,
> +			   size_t size, unsigned long *immap_id);
> +void iommufd_ctx_free_mmap(struct iommufd_ctx *ictx, unsigned long immap_id);
>   struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
>   				       unsigned long vdev_id);
>   int iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
> @@ -262,11 +265,23 @@ static inline int iommufd_object_depend(struct iommufd_object *obj_dependent,
>   	return -EOPNOTSUPP;
>   }
>   
> +static inline int iommufd_ctx_alloc_mmap(struct iommufd_ctx *ictx,
> +					 phys_addr_t base, size_t size,
> +					 unsigned long *immap_id)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
>   static inline void iommufd_object_undepend(struct iommufd_object *obj_dependent,
>   					   struct iommufd_object *obj_depended)
>   {
>   }
>   
> +static inline void iommufd_ctx_free_mmap(struct iommufd_ctx *ictx,
> +					 unsigned long immap_id)
> +{
> +}
> +
>   static inline struct device *
>   iommufd_viommu_find_dev(struct iommufd_viommu *viommu, unsigned long vdev_id)
>   {
> diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
> index fb7f8fe40f95..c55336c580dc 100644
> --- a/drivers/iommu/iommufd/driver.c
> +++ b/drivers/iommu/iommufd/driver.c
> @@ -78,6 +78,45 @@ void iommufd_object_undepend(struct iommufd_object *obj_dependent,
>   }
>   EXPORT_SYMBOL_NS_GPL(iommufd_object_undepend, "IOMMUFD");
>   
> +/* Driver should report the output @immap_id to user space for mmap() syscall */
> +int iommufd_ctx_alloc_mmap(struct iommufd_ctx *ictx, phys_addr_t base,
> +			   size_t size, unsigned long *immap_id)
> +{
> +	struct iommufd_mmap *immap;
> +	int rc;
> +
> +	if (WARN_ON_ONCE(!immap_id))
> +		return -EINVAL;
> +	if (base & ~PAGE_MASK)
> +		return -EINVAL;

Is it equal to PAGE_ALIGNED()?

> +	if (!size || size & ~PAGE_MASK)
> +		return -EINVAL;
> +
> +	immap = kzalloc(sizeof(*immap), GFP_KERNEL);
> +	if (!immap)
> +		return -ENOMEM;
> +	immap->pfn_start = base >> PAGE_SHIFT;
> +	immap->pfn_end = immap->pfn_start + (size >> PAGE_SHIFT) - 1;
> +
> +	rc = mtree_alloc_range(&ictx->mt_mmap, immap_id, immap, sizeof(immap),
> +			       0, LONG_MAX >> PAGE_SHIFT, GFP_KERNEL);
> +	if (rc < 0) {
> +		kfree(immap);
> +		return rc;
> +	}
> +
> +	/* mmap() syscall will right-shift the immap_id to vma->vm_pgoff */
> +	*immap_id <<= PAGE_SHIFT;
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(iommufd_ctx_alloc_mmap, "IOMMUFD");
> +
> +void iommufd_ctx_free_mmap(struct iommufd_ctx *ictx, unsigned long immap_id)
> +{
> +	kfree(mtree_erase(&ictx->mt_mmap, immap_id >> PAGE_SHIFT));

MMIO lifecycle question: what happens if a region is removed from the
maple tree (and is therefore no longer mappable), but is still mapped
and in use by userspace?

> +}
> +EXPORT_SYMBOL_NS_GPL(iommufd_ctx_free_mmap, "IOMMUFD");
> +
>   /* Caller should xa_lock(&viommu->vdevs) to protect the return value */
>   struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
>   				       unsigned long vdev_id)

Thanks,
baolu

