Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0775ACA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 05:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcL7hPbmGDM4HASvdhu3BAiCTa7aoi6Rpo2JWPsFZp8=; b=gL9X9rNQjo0FiLdFNQp4yOcERc
	GoiPS/py1izjAvL6K+53iZhjUbBdGo4t46HC7llGSHX97DcQGiZ9cfKdHw21LCkOlTdGYQ3nsnKKu
	kEpcamPQV1275Al4EIQ56UsE5PxVpCiZe1oMQrtzHFxu59VOFu6HwVmF+3OndNz4xpbN7ziht+fid
	cJubKgj/TLyqWW56bizdVkXYnKB9PN+pJ/tE8mvlmD3/2gT5qhJZR+5XWNHB4VDe9dI651ni/UCgB
	czEFs2DRDu0HnrACVE0op3/bZE2uNmSByTdd5Vi8T7yDg66sK5IAHHZQmTAlvynXCgRahae6x5AT8
	/e9yINEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummm7-00000001Uy7-2dEY;
	Fri, 15 Aug 2025 05:14:47 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummjU-00000001Uez-1mHU;
	Fri, 15 Aug 2025 05:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755234725; x=1786770725;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=piFJDMoWgMoAcz5ZrOxOxHNp2cNxC29xMo9DwzCJmRM=;
  b=DJbzy0qxP8x6PiAC5TuolIEGqMs2nGcaFOMJoNXE8BHmPrlLdXCsvP7i
   hEkRpMalLMUsr53MlS7lXrQH116+1N4FM+Geb62k6hBCU0Hk1RKs2XX5g
   JbPetjNyrxSi5uE923IXVbFvuCKpvwa/mmOZl4V85WBFMXTs7SItK1+wJ
   +ZjeH9uTkj3fZOlS0kqWNRrlizif7/a1kAgfsQJaHodleuSIj9eLJIzfX
   3E9O+ZGCu6esrCMVjzHhU5aUKOk3QnXUK6Wybe09VqzXu6EOHVsFF8xuz
   el8NdSO7ukckFv2TQH5HbSepAQAuAL7gMK7a9MH1lm++XOg3U+H+gP6BC
   g==;
X-CSE-ConnectionGUID: U42NNKyZTWuCV8CsLkdIOQ==
X-CSE-MsgGUID: YsWACPAwQTSXlUjGy6KdlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68646435"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68646435"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 22:12:03 -0700
X-CSE-ConnectionGUID: z3XLWN8JSkSewaRE53xizA==
X-CSE-MsgGUID: k+jCi0MrTzK5WA2i0FqSdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="197786291"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 22:11:57 -0700
Message-ID: <eb248b73-7fb6-47cd-9e10-5c54ca2391b2@linux.intel.com>
Date: Fri, 15 Aug 2025 13:09:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] iommu: Lock group->mutex in iommu_deferred_attach
To: Nicolin Chen <nicolinc@nvidia.com>, robin.murphy@arm.com,
 joro@8bytes.org, bhelgaas@google.com, jgg@nvidia.com
Cc: will@kernel.org, robin.clark@oss.qualcomm.com, yong.wu@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 rafael@kernel.org, lenb@kernel.org, kevin.tian@intel.com,
 yi.l.liu@intel.com, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, patches@lists.linux.dev, pjaroszynski@nvidia.com,
 vsethi@nvidia.com, helgaas@kernel.org, etzhao1900@gmail.com
References: <cover.1754952762.git.nicolinc@nvidia.com>
 <44783ca52e17a9ca0ce7acfe8daae3edc3d7b45b.1754952762.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <44783ca52e17a9ca0ce7acfe8daae3edc3d7b45b.1754952762.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_221204_509239_1BFD9D4F 
X-CRM114-Status: GOOD (  17.18  )
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

On 8/12/25 06:59, Nicolin Chen wrote:
> The iommu_deferred_attach() is a runtime asynchronous function called by
> iommu-dma function, which could race against other attach functions if it
> accesses something in the dev->iommu_group.
> 
> So, grab the mutex to guard __iommu_attach_device() like other callers.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 060ebe330ee16..1e0116bce0762 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2144,10 +2144,17 @@ EXPORT_SYMBOL_GPL(iommu_attach_device);
>   
>   int iommu_deferred_attach(struct device *dev, struct iommu_domain *domain)
>   {
> -	if (dev->iommu && dev->iommu->attach_deferred)
> -		return __iommu_attach_device(domain, dev);
> +	/*
> +	 * This is called on the dma mapping fast path so avoid locking. This is
> +	 * racy, but we have an expectation that the driver will setup its DMAs

Why not making it like this,

int iommu_deferred_attach(struct device *dev, struct iommu_domain *domain)
{
         /* Caller must be a probed driver on dev */
         if (!dev->iommu_group)
                 return 0;

         guard(mutex)(&dev->iommu_group->mutex);
         if (!dev->iommu->attach_deferred)
                 return 0;

         return __iommu_attach_device(domain, dev);
}

?

> +	 * inside probe while being single threaded to avoid racing.
> +	 */
> +	if (!dev->iommu || !dev->iommu->attach_deferred)
> +		return 0;
>   
> -	return 0;
> +	guard(mutex)(&dev->iommu_group->mutex);
> +
> +	return __iommu_attach_device(domain, dev);
>   }
>   
>   void iommu_detach_device(struct iommu_domain *domain, struct device *dev)

Thanks,
baolu

