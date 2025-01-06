Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C2FE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 03:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QHmMIz5wEHvB/yFzQiTj0wqsXG2Ph/0wrsbctqnm4c=; b=feUdf2rBjKL9IHtAd7NkwYN7PR
	Au84CtfjbJi6M+a44+65cw6p6mmrVeEdA4BXr/aG5Cn9fqvvXVNGaQgwXz51lQC9aBFFj41qK+Ug1
	Kj+4DDwhb6zly600sFr7XeLTUG/fuDAcgGsi1UFVSmL8sfg3tHU+cJMaHkUleQKStDXbkkBR0Ieum
	rk81tfshnfCo8nYnA9wZ4+2w7BmTSSL7gBi1MUNhThGWCqJSd6KlS+HBHXGOdrQDRg9HjEVS9IKcW
	C1U2Ui5o8AV2Y2TG3QXYRzCWuMAsytxnSher2SHqQbJtDwK6JLcSZmrYsjmcpY92xe1uTivHpHT3Q
	LDMjI0+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdQc-00000000745-0U5e;
	Mon, 06 Jan 2025 03:05:18 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdPP-000000006se-3PU3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 03:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736132644; x=1767668644;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=L5CTqVAplYWz3cvc2Q2+gANM0xCm7wWwxzoKHr589zI=;
  b=Z8gQ3ZVqnC2L9aNITZrkx17Vahaflv87rw6f86fLQx4BF+z7vW58t8jW
   BCIMSh8N+44/ABIQtljeaVdThK3qYI99zS10zVDHVuN2O55MSk1Kp3MrY
   Y88y9r7yBhvtjjD8MPtSD5rmhVBZfNH9fj56iX33KTG9nTFvMWAlP/seX
   i/qHrrl2VsrjDyx6rxU3LG0Tymf0L6n3nTyAxPMqTJZfwW5A6ommmCyLi
   LaC0bJ6pMTZnigtVFhduGLL1Ap6TjX22RtKB+b+K0HOJh0t5JqzAl1Vsy
   k85pIe0QN8/9EBgezG482zGf9OZ7K4eNrUyQKQnnWBJ5/aL7Do1yYUQDw
   g==;
X-CSE-ConnectionGUID: 5o0fU6mZTJmVZ5ku7eGxHQ==
X-CSE-MsgGUID: 2/2ZC2vkRwKS5Kx1dPYgbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36431348"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36431348"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 19:03:45 -0800
X-CSE-ConnectionGUID: dFnpKBihReKdlEaZXHSJug==
X-CSE-MsgGUID: OINJhP+5SYWKmpQ13/0R3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139659644"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 19:03:39 -0800
Message-ID: <585fc99f-c2dc-459c-929a-c7c7631b9caf@linux.intel.com>
Date: Mon, 6 Jan 2025 11:01:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/14] iommu/arm-smmu-v3: Report events that belong to
 devices attached to vIOMMU
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com,
 corbet@lwn.net, will@kernel.org
Cc: joro@8bytes.org, suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
 dwmw2@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
 mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
 smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
 patches@lists.linux.dev
References: <cover.1735933254.git.nicolinc@nvidia.com>
 <69a46c72e43ed086840be462eef731167d90a9d8.1735933254.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <69a46c72e43ed086840be462eef731167d90a9d8.1735933254.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_190403_886209_D30741EE 
X-CRM114-Status: GOOD (  13.75  )
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

On 1/4/25 03:43, Nicolin Chen wrote:
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index 0a08aa82e7cc..55e3d5a14cca 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -1016,9 +1016,24 @@ struct iommu_ioas_change_process {
>   /**
>    * enum iommu_veventq_type - Virtual Event Queue Type
>    * @IOMMU_VEVENTQ_TYPE_DEFAULT: Reserved for future use
> + * @IOMMU_VEVENTQ_TYPE_ARM_SMMUV3: ARM SMMUv3 Virtual Event Queue
>    */
>   enum iommu_veventq_type {
>   	IOMMU_VEVENTQ_TYPE_DEFAULT = 0,
> +	IOMMU_VEVENTQ_TYPE_ARM_SMMUV3 = 1,
> +};
> +
> +/**
> + * struct iommu_vevent_arm_smmuv3 - ARM SMMUv3 Virtual Event
> + *                                  (IOMMU_VEVENTQ_TYPE_ARM_SMMUV3)
> + * @evt: 256-bit ARM SMMUv3 Event record, little-endian.
> + *       (Refer to "7.3 Event records" in SMMUv3 HW Spec)
> + *
> + * StreamID field reports a virtual device ID. To receive a virtual event for a
> + * device, a vDEVICE must be allocated via IOMMU_VDEVICE_ALLOC.
> + */
> +struct iommu_vevent_arm_smmuv3 {
> +	__aligned_le64 evt[4];
>   };

Nit: I think it would be more readable to add a check in the vevent
reporting helper.

diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 77c34f8791ef..ccada0ada5ff 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -86,6 +86,9 @@ int iommufd_viommu_report_event(struct iommufd_viommu 
*viommu,
         if (WARN_ON_ONCE(!data_len || !event_data))
                 return -EINVAL;

+       if (WARN_ON_ONCE(type != IOMMU_VEVENTQ_TYPE_ARM_SMMUV3))
+               return -EINVAL;
+
         down_read(&viommu->veventqs_rwsem);

         veventq = iommufd_viommu_find_veventq(viommu, type);

Or perhaps the compiler could automatically make a warning if the @type
is not one of those values in enum iommu_veventq_type?

Others look good to me.

Thanks,
baolu

