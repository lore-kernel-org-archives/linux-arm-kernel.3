Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81CBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 02:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WS0erFVcmkQSEGT8RdD30nMBeisHBLwb4ltsvCrc1s=; b=g4KT55rFdp1FKHtf8/3as0aJ8q
	+fEdz1F2bfxQDtiSwPxUlPPQIne0Qu+ynoMG1K9GwF49tVJgxcr57KJtGFT8ltJLKYxgxBbEFOrQG
	Y7s7iqkIvAJI3yZSEVwIq70wIHAg7caW2Pgiw1Qfi+owFbFoqiLgmGlfCQ3Oo/1nsxNYF4MgtRZkP
	6qxcAe475qpAW8bpm8ldY2H7VvJ4iFBD7GmDQjA3Hj+KbuQNatdsDfcKJf4XjeFoV03F5Hzj9ZXym
	Rv8D28SeF9vp4XY8x9/CPTo4tYPx7PSvsYZ8ZLML8X3bBlSkXD1fl2Xdefy4PQyfI1MjIUFqMmHUu
	wdY1NpKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO5y4-00000000aH3-1YHS;
	Thu, 19 Dec 2024 02:08:48 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO5ww-00000000a9A-0ZNL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 02:07:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734574058; x=1766110058;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=u9RKb7yTKqQPGL6ESkRUFOfnECFsgIrUnpYAIzAyl1Y=;
  b=WxNEwpVPs87Bt3PUsqT8VbZAglfQ7rXPrWXDNy88JFRSqJ0bSZTKa5f6
   7kTQXI6HxsxzyvJgFfPq/y/FooOZiBiUbe7liE3v+VQjkujbiqumHFlcQ
   wbMfWeN63Cyp/P5WuzpTi9qrskjP2FbjewQ8+0DsopU55hmOrVJ5ZJWgI
   Qd9gtNfAIMpnyRhA1LfaQwlKT4brpWEqFE+wnkVAoI/wRVwhHeK7eb8da
   wJR+Q/29tHRIUhs08L3rjPqciI6L2HtcrafIImD9X0LL3HlMnmloTpOec
   89QSFhNZqQZKi6UgyJxQJtKgRIA9zAKLvwQGSUCBpDjI8kD5BwCOQ14cD
   g==;
X-CSE-ConnectionGUID: 4wM98nNBSu6r2CbqXdNP2g==
X-CSE-MsgGUID: WxJlTZp4SD+M9+7gbAJe/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35101039"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; 
   d="scan'208";a="35101039"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 18:07:37 -0800
X-CSE-ConnectionGUID: BUEwx9zdRY+0awZQGNEcJQ==
X-CSE-MsgGUID: Mwq7DUNKQP+Q7w80W636Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; 
   d="scan'208";a="98449984"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 18:07:32 -0800
Message-ID: <56c65e50-5890-42af-85b7-85f8a1bf5cf5@linux.intel.com>
Date: Thu, 19 Dec 2024 10:05:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] iommufd/viommu: Add iommufd_viommu_get_vdev_id
 helper
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com,
 will@kernel.org
Cc: corbet@lwn.net, joro@8bytes.org, suravee.suthikulpanit@amd.com,
 robin.murphy@arm.com, dwmw2@infradead.org, shuah@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, eric.auger@redhat.com, jean-philippe@linaro.org,
 mdf@kernel.org, mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
 smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
 patches@lists.linux.dev
References: <cover.1734477608.git.nicolinc@nvidia.com>
 <21d7e63b97d81d0acf9127418a67efe386787261.1734477608.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <21d7e63b97d81d0acf9127418a67efe386787261.1734477608.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_180738_254220_D052F20F 
X-CRM114-Status: GOOD (  15.99  )
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

On 12/18/24 13:00, Nicolin Chen wrote:
> This is a reverse search v.s. iommufd_viommu_find_dev, as drivers may want
> to convert a struct device pointer (physical) to its virtual device ID for
> an event injection to the user space VM.
> 
> Again, this avoids exposing more core structures to the drivers, than the
> iommufd_viommu alone.
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   include/linux/iommufd.h        |  8 ++++++++
>   drivers/iommu/iommufd/driver.c | 20 ++++++++++++++++++++
>   2 files changed, 28 insertions(+)
> 
> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index b082676c9e43..ac1f1897d290 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -190,6 +190,8 @@ struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
>   					     enum iommufd_object_type type);
>   struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
>   				       unsigned long vdev_id);
> +unsigned long iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
> +					 struct device *dev);

Hi Nicolin,

This series overall looks good to me. But I have a question that might
be irrelevant to this series itself.

The iommufd provides both IOMMUFD_OBJ_DEVICE and IOMMUFD_OBJ_VDEVICE
objects. What is the essential difference between these two from
userspace's perspective? And, which object ID should the IOMMU device
driver provide when reporting other events in the future?

Currently, the IOMMUFD uAPI reports IOMMUFD_OBJ_DEVICE in the page
fault message, and IOMMUFD_OBJ_VDEVICE (if I understand it correctly) in
the vIRQ message. It will be more future-proof if this could be defined
clearly.

Thanks,
baolu

