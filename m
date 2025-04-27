Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30130C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 06:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcVCrUoHjG//yPujzaXWnCGYbtq58WQGf4GF5lf4MlA=; b=tjR/1ThmW8g52tYzmZ5vI+qlI8
	y9s6BiDvJbJo911pqJvu0H3l3C1GXEagV0Kwb24AHPX4xR0iTzUcTFgvJUoT9LC7fvHuI9gFGwmwt
	3tp84NU9tNvJBi4i7yjw7yd0cv+XA4h/QxhzT9/PEI97RsTclI7ToZk6TiMfjpY3pj8Bo8j3pI0ba
	hMa2bZtxiC0ylGIrFj2ciqx87KZZYiLpe5l76ybZaXjf8+lucsq8lwnRmuNP/E9pNrp2nMfwGG11K
	LvMT8lRUC1ZlFvayejfGejllFIcUdpGPCFnmSBqKyDa08GfAwnqrL8KDPtGmEqrKXyTvMLiS3qkMQ
	4LHwVo+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vWv-00000002zP4-01Q6;
	Sun, 27 Apr 2025 06:30:21 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vUw-00000002z38-499A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 06:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745735299; x=1777271299;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=a2U2SlgQI1bryyjViVU51BvLU6tMztBGgxaJGgkhS3I=;
  b=mHAGKyfBAoZKZIaKgK/xnBdmYflBYo6fGEhv1dELKwnc8EOYWaDzlcmk
   iBZVrKrktoDd76/t8uoN7l+g5evZviYvVwlRFm6cF9AK2WuyC1whVmtRl
   oCjl9q2OPg6RZYm7tVnDJxtbjvPPTwUanvo4S0PhyjRoFIDPOStLvPAMb
   7MNh58C48gu9NwU2WE2uDhA5X83V5VX7vC0c+eEAQ8eLD+UayVce9poy9
   3i6iczLcNhbkDEYsNWv/WzVIOkJ+5NTKlMUP2AIIIeylTsvnzyjANZ+Tw
   EftwV4Qhr8iXrhmFumRwLQJjYJp1bUKQaGeB5SMoCqKSibC9NAPmV0JMe
   g==;
X-CSE-ConnectionGUID: a+9RovW/TK2ANLLyiCGl7g==
X-CSE-MsgGUID: QQ9Ye9C2SmSDuhj1CDfSSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="58326573"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="58326573"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 23:28:10 -0700
X-CSE-ConnectionGUID: 9w3DTI3ARqWE4clFyzRfDg==
X-CSE-MsgGUID: /2mg6I5GSyaCmMoT2ZQ9sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="138218331"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 23:28:04 -0700
Message-ID: <ee9d46f2-5953-4ca4-adac-c3e35c9001a3@linux.intel.com>
Date: Sun, 27 Apr 2025 14:23:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/22] iommufd/viommu: Add driver-allocated vDEVICE
 support
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
 <14781558dbc291e515b5e249535e3c08290a6792.1745646960.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <14781558dbc291e515b5e249535e3c08290a6792.1745646960.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_232819_110347_DC7E085E 
X-CRM114-Status: GOOD (  14.46  )
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

On 4/26/25 13:57, Nicolin Chen wrote:
> @@ -120,6 +128,13 @@ struct iommufd_viommu {
>    *                    array->entry_num to report the number of handled requests.
>    *                    The data structure of the array entry must be defined in
>    *                    include/uapi/linux/iommufd.h
> + * @vdevice_alloc: Allocate a vDEVICE object and init its driver-level structure
> + *                 or HW procedure. Note that the core-level structure is filled
> + *                 by the iommufd core after calling this op. @virt_id carries a
> + *                 per-vIOMMU virtual ID for the driver to initialize its HW.

I'm wondering whether the 'per-vIOMMU virtual ID' is intended to be
generic for other features that might require a vdevice. I'm also not
sure where this virtual ID originates when I read it here. Could it
potentially come from the KVM instance? If so, how about retrieving it
directly from a struct kvm pointer? My understanding is that vIOMMU in
IOMMUFD acts as a handle to KVM, so perhaps we should maintain a
reference to the kvm pointer within the iommufd_viommu structure?

> + * @vdevice_destroy: Clean up all driver-specific parts of an iommufd_vdevice.
> + *                   The memory of the vDEVICE will be free-ed by iommufd core
> + *                   after calling this op
>    */
>   struct iommufd_viommu_ops {
>   	void (*destroy)(struct iommufd_viommu *viommu);
> @@ -128,6 +143,10 @@ struct iommufd_viommu_ops {
>   		const struct iommu_user_data *user_data);
>   	int (*cache_invalidate)(struct iommufd_viommu *viommu,
>   				struct iommu_user_data_array *array);
> +	struct iommufd_vdevice *(*vdevice_alloc)(struct iommufd_viommu *viommu,
> +						 struct device *dev,
> +						 u64 virt_id);
> +	void (*vdevice_destroy)(struct iommufd_vdevice *vdev);
>   };

Thanks,
baolu

