Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB76AC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 01:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KALBz3zkyARZckTa2hFB3HYhxK92PC0qnr0S1ZdUho=; b=4lmH3ww6FBcssmdssrsyyWIZTH
	Wdw4ccjM+rAxp1BEPefiJCkGIM3n/rUWEDnZ0BBzrq8DgDxtjRB0pmtQ8PPVepLjeuQWdByinNlLN
	r+jke2mmxt/oRljgdCVV0al5UxJIRI1Kioupn64AvAx+1YgxFJyiY7PKoBuv0YIc8vOJvynweBIMH
	UAKgLfNBDE+BIL/4RcrKZ6xB/uk5+vpL40IhN2IJzbBjZyKIp+OwRFyWjKx5I+jRi0wXlT1Lybg8F
	l594L+43FPXhQynOSEpwaDfQKXAd9LfPPSmsbuJ4U8PgSZgVvrwmf2rXWxwvZnYkPSXycA0b9wmRC
	z49WKBNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9DRx-00000004IDy-1fhI;
	Mon, 28 Apr 2025 01:38:25 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9DPz-00000004Hk6-1CBV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 01:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745804183; x=1777340183;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ka5i6kOXSNGQcxxbduG/8nuC65hLt6QpSbzaVuD2Wr0=;
  b=arxLRgrBS3ekDyOWXbgph3zJpb06EQaQ3XzqATELqvLg6lXXmgvTC9el
   NHEKXsu6Tn2S3HmLbgALJMVy7WUEN2biCBqeNB/ah6zWtG/JJqlGbCUrE
   ecy9wMTbNjNY+0ImV/DZneREZ8K/anDZnrt6wZavN8EvqJGSZKUCQNBv/
   nirqbGigoGUWQI4eqJEuyJ79KBB9BdJNXJoYwUxzxmmGRqM+96KBk6eNN
   JUCCOclGMuyjeyiYhwWOmqEFYxrYBH1aX7X4UT0S/MA1ENIKsJ3O8wbT3
   7MFc9h5Jz7wNhnKHxsuphfiASJhvte/f2E8XG4hn6L7Vz/mB1wQB6PxrW
   g==;
X-CSE-ConnectionGUID: phP9JowNSauE2lX4hwGiRA==
X-CSE-MsgGUID: GNs4EMCaR9OxOMeHKEfiAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47511594"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="47511594"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 18:36:20 -0700
X-CSE-ConnectionGUID: ks4dRZHRQR2z+gA9bUZEsQ==
X-CSE-MsgGUID: 3TSRWkChRnOLfY4dm9t51g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="137427362"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 18:36:14 -0700
Message-ID: <dcfd9bfc-44db-4fd8-a49c-0c96c68f6b88@linux.intel.com>
Date: Mon, 28 Apr 2025 09:32:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/22] iommufd/viommmu: Add IOMMUFD_CMD_VCMDQ_ALLOC
 ioctl
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
 <094992b874190ffdcf6012104b419c8649b5e4b4.1745646960.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <094992b874190ffdcf6012104b419c8649b5e4b4.1745646960.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_183623_375696_1D36B7B9 
X-CRM114-Status: GOOD (  10.38  )
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
> diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> index a65153458a26..02a111710ffe 100644
> --- a/drivers/iommu/iommufd/viommu.c
> +++ b/drivers/iommu/iommufd/viommu.c
> @@ -170,3 +170,97 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
>   	iommufd_put_object(ucmd->ictx, &viommu->obj);
>   	return rc;
>   }
> +
> +void iommufd_vcmdq_destroy(struct iommufd_object *obj)
> +{
> +	struct iommufd_vcmdq *vcmdq =
> +		container_of(obj, struct iommufd_vcmdq, obj);
> +	struct iommufd_viommu *viommu = vcmdq->viommu;
> +
> +	if (viommu->ops->vcmdq_destroy)
> +		viommu->ops->vcmdq_destroy(vcmdq);
> +	iopt_unpin_pages(&viommu->hwpt->ioas->iopt, vcmdq->addr, vcmdq->length);
> +	refcount_dec(&viommu->obj.users);
> +}
> +
> +int iommufd_vcmdq_alloc_ioctl(struct iommufd_ucmd *ucmd)
> +{
> +	struct iommu_vcmdq_alloc *cmd = ucmd->cmd;
> +	struct iommufd_viommu *viommu;
> +	struct iommufd_vcmdq *vcmdq;
> +	struct page **pages;
> +	int max_npages, i;
> +	dma_addr_t end;
> +	int rc;
> +
> +	if (cmd->flags || cmd->type == IOMMU_VCMDQ_TYPE_DEFAULT)

I don't follow the check of 'cmd->type == IOMMU_VCMDQ_TYPE_DEFAULT'
here. My understanding is that it states that "other values of type are
not supported". If so, shouldn't it be,

	if (cmd->flags || cmd->type != IOMMU_VCMDQ_TYPE_DEFAULT)

?

> +		return -EOPNOTSUPP;
> +	if (!cmd->addr || !cmd->length)
> +		return -EINVAL;
> +	if (check_add_overflow(cmd->addr, cmd->length - 1, &end))
> +		return -EOVERFLOW;

Thanks,
baolu

