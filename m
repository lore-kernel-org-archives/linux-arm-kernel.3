Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9265C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 01:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZlux3dVjaB+PIADG5zODjBzJKk/hXIc0Mkrxb+oTNs=; b=MkUX7YPIdhNdWSrRUbrlktW4k4
	ikjkeB9fFYX8uWbDnMbSWd70W4AWoi1RRGsO+r2XrHz16pMM0AAUdQhLoHOx9a7sxjhsH5SMQej28
	10xEQ+slGD6LPxmxQ+TyDIKRw182qvmJs2TSHWZEYx9M9sThFgiBi4AXFBpSAIrbci6ACEtlcmPmK
	Og+U2TwWzg6uADFKss9Sq0yz4X4JaFiy5o4pUAq0tIVrpmRsBn8gABpx8fzMG5uBBQ/qyv922jroG
	p8G/l58v7MisW3ZC0QN/78Xtty54vduXrNY7f0zXYtmc/iz5hVEayGaCjXPDD3Yw2Zz/F5aLolSh9
	QiS7CLsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9D62-00000004FcZ-3L7k;
	Mon, 28 Apr 2025 01:15:46 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9D43-00000004FQf-3wQR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 01:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745802823; x=1777338823;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SzVEkDhgS3lNLKaxMmkzixB0NkfENpwp720ZSDFOdIQ=;
  b=lbu7cFGMHg1W1e8IrZL3gQgWv1U0qlZh9oScKU7mY6ivO/oYqhpFu9F0
   h4u7HPNQKduBu6eNUne0PzHY+wAJhTqk+gsUFsGXs/yja8YRVOWXlW3D+
   9N4zeuYTGJ02D7hpcpF6iLJqLXq6ZXm052VQA3n8SWbgr9ci5361dRn84
   8nvmFqpxkhOpAKFsUKR4AqQtO3w3iCmsVsUeltoiq1A4+/LHKhNe7CErh
   KiehcnEDUdRX65xxxjjOlyg+SlEREfJtU335MsqZ9ycmESbMp1vFWOmTO
   6apZgqapqFcssDFLdXLR44ntwrMJ2yitGmisRlmUh0ByVUc06Asa3cBlq
   A==;
X-CSE-ConnectionGUID: o0Gy12SGTSWdVrAC3qkWsA==
X-CSE-MsgGUID: ErOl+1NXQauUMMQ4nUKnbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47469194"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="47469194"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 18:13:34 -0700
X-CSE-ConnectionGUID: kCEJNONXT+mMJ2UwL1Mdjw==
X-CSE-MsgGUID: 1gUHhF4hT5y9Cgd2z9Awrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="133265254"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 18:13:29 -0700
Message-ID: <28e513ec-4d8b-4967-a241-d6f63d533050@linux.intel.com>
Date: Mon, 28 Apr 2025 09:09:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/22] iommufd/viommu: Introduce IOMMUFD_OBJ_VCMDQ and
 its related struct
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
 <8bab0069503fa21b48298ed2ffe29a06963f71f5.1745646960.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <8bab0069503fa21b48298ed2ffe29a06963f71f5.1745646960.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_181344_045536_64ECC18A 
X-CRM114-Status: GOOD (  13.72  )
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
> Add a new IOMMUFD_OBJ_VCMDQ with an iommufd_vcmdq structure, representing
> a command queue type of physical HW passed to a user space VM. This vCMDQ
> object, is a subset of vIOMMU resources of a physical IOMMU's, such as:
>   - NVIDIA's virtual command queue
>   - AMD vIOMMU's command buffer
> 
> Inroduce a struct iommufd_vcmdq and its allocator iommufd_vcmdq_alloc().
> Also add a pair of viommu ops for iommufd to forward user space ioctls to
> IOMMU drivers.
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

with a small nit below ...

> ---
>   include/linux/iommufd.h | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index ef0d3c4765cf..e91381aaec5a 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -37,6 +37,7 @@ enum iommufd_object_type {
>   	IOMMUFD_OBJ_VIOMMU,
>   	IOMMUFD_OBJ_VDEVICE,
>   	IOMMUFD_OBJ_VEVENTQ,
> +	IOMMUFD_OBJ_VCMDQ,
>   #ifdef CONFIG_IOMMUFD_TEST
>   	IOMMUFD_OBJ_SELFTEST,
>   #endif
> @@ -112,6 +113,14 @@ struct iommufd_vdevice {
>   	u64 id; /* per-vIOMMU virtual ID */
>   };
>   
> +struct iommufd_vcmdq {
> +	struct iommufd_object obj;
> +	struct iommufd_ctx *ictx;
> +	struct iommufd_viommu *viommu;
> +	dma_addr_t addr;

It's better to add a comment to state that @addr is a guest physical
address. Or not?

> +	size_t length;
> +};

Thanks,
baolu

