Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55D7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 02:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bFuOV5agNlTmwIg1GHWbWGFr5ZYdWtw8qCx/zn+kRo=; b=RB1Qnwgf37Oe/L+3Kkb49S9epG
	tLZ/0e1+f/4k1f4jqIMimZ6GV1tp4cf48V82JHLAz6Fn4mi7P1AZDdzoEJzef0SnLoUXxnKkQ6ooT
	KkBVEsL5g1JNF5DF6wQDlOipOfgYQzw2BgPR1CJVIUyua1ldTI599ByoxGVGmvZIaJ+rFhmO4zh46
	b90Ajw/9578rhSL3k6bQEh4ivAXiqIDNEy+4sJ1LlSyyfhLeKKKiMLKL1xZ9aCA4XW4j4wWIZlksR
	K2y+EeIfNV6dQx9IAZj8mnL5sppgATI3j9xmUiY4zmeWTk8eypndjxJ9I3NSB7/qYbDLUGHRq9LDm
	DjBH8Xdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYEI-00000009A7p-22mG;
	Mon, 23 Dec 2024 02:31:34 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYD7-00000009A1d-0KWb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 02:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734921021; x=1766457021;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=846d+cRFBoDrFep8BfHDhcE6RYZkZKHKE60fLL1H0x4=;
  b=Olx4B3F9zh/K5GMFyoki1WbeZ17l1IvLxh4+ZzfIJccFA0fX+uRbS6dL
   tzFsbE3LTeX96+1Fy0MT5anPngsuec8jhA4AzTOO8qyiwH/TqGc/jTKZx
   nkoDmxBipTEMsh4D3bgrYatKUmRK+G9zDkfCuOQdKbeWx1zW32/zGzuqI
   lZJJNe+DLykXV131Y2kiYpuhH9Q4rjqh3JjYPitxFJ/PVIfH2NMVnuvPX
   VQxi2EjilovH1qTQGThvYOiKGH/k6UFXbItVs+1jMtGJY/A6L8hI6Ytzd
   c8ZMWYdwJSNBFjWczqrIt8TVtkzy7PaodtizLrlUV+iBfG0AKHbkJbO4h
   A==;
X-CSE-ConnectionGUID: aIbJmPMuToacQf0FSLD8pA==
X-CSE-MsgGUID: uN7m89vKRMG914TglTpQYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="39320717"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="39320717"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 18:30:19 -0800
X-CSE-ConnectionGUID: WxF/1ytIQjSsv80o60rM8A==
X-CSE-MsgGUID: FxLvu3rfS3Gtu8sDqEny9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103189883"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 18:30:14 -0800
Message-ID: <74bc9dbe-3420-4f0c-9e32-db49327a723d@linux.intel.com>
Date: Mon, 23 Dec 2024 10:28:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] iommufd/viommu: Add iommufd_viommu_get_vdev_id
 helper
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org, corbet@lwn.net,
 joro@8bytes.org, suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
 dwmw2@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
 mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
 smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
 patches@lists.linux.dev
References: <cover.1734477608.git.nicolinc@nvidia.com>
 <21d7e63b97d81d0acf9127418a67efe386787261.1734477608.git.nicolinc@nvidia.com>
 <56c65e50-5890-42af-85b7-85f8a1bf5cf5@linux.intel.com>
 <Z2OpylDlhLXoo3dt@Asurada-Nvidia>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <Z2OpylDlhLXoo3dt@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_183021_200109_5D99525B 
X-CRM114-Status: GOOD (  25.91  )
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

On 12/19/24 13:06, Nicolin Chen wrote:
> On Thu, Dec 19, 2024 at 10:05:53AM +0800, Baolu Lu wrote:
>> On 12/18/24 13:00, Nicolin Chen wrote:
>>> This is a reverse search v.s. iommufd_viommu_find_dev, as drivers may want
>>> to convert a struct device pointer (physical) to its virtual device ID for
>>> an event injection to the user space VM.
>>>
>>> Again, this avoids exposing more core structures to the drivers, than the
>>> iommufd_viommu alone.
>>>
>>> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
>>> ---
>>>    include/linux/iommufd.h        |  8 ++++++++
>>>    drivers/iommu/iommufd/driver.c | 20 ++++++++++++++++++++
>>>    2 files changed, 28 insertions(+)
>>>
>>> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
>>> index b082676c9e43..ac1f1897d290 100644
>>> --- a/include/linux/iommufd.h
>>> +++ b/include/linux/iommufd.h
>>> @@ -190,6 +190,8 @@ struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
>>>    					     enum iommufd_object_type type);
>>>    struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
>>>    				       unsigned long vdev_id);
>>> +unsigned long iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
>>> +					 struct device *dev);
>> Hi Nicolin,
>>
>> This series overall looks good to me. But I have a question that might
>> be irrelevant to this series itself.
>>
>> The iommufd provides both IOMMUFD_OBJ_DEVICE and IOMMUFD_OBJ_VDEVICE
>> objects. What is the essential difference between these two from
>> userspace's perspective?
> A quick answer is an IOMMUFD_OBJ_DEVICE being a host physical
> device and an IOMMUFD_OBJ_VDEVICE being an IOMMUFD_OBJ_DEVICE
> related to IOMMUFD_OBJ_VIOMMU. Two of them can be seen in two
> different layers. May refer to this graph:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ 
> Documentation/userspace-api/iommufd.rst?h=v6.13-rc3#n150
> 
>> And, which object ID should the IOMMU device
>> driver provide when reporting other events in the future?
>>
>> Currently, the IOMMUFD uAPI reports IOMMUFD_OBJ_DEVICE in the page
>> fault message, and IOMMUFD_OBJ_VDEVICE (if I understand it correctly) in
>> the vIRQ message. It will be more future-proof if this could be defined
>> clearly.
> A vIRQ is actually reported per-vIOMMU in this design. Although
> in the this series the SMMU driver seems to report a per-device
> vIRQ, it internally converts the vDEVICE to a virtual device ID
> and packs the virtual device ID into a per-vIOMMU event:
> 
> +/**
> + * struct iommu_virq_arm_smmuv3 - ARM SMMUv3 Virtual IRQ
> + *                                (IOMMU_VIRQ_TYPE_ARM_SMMUV3)
> + * @evt: 256-bit ARM SMMUv3 Event record, little-endian.
> + *       (Refer to "7.3 Event records" in SMMUv3 HW Spec)
> + *
> + * StreamID field reports a virtual device ID. To receive a virtual IRQ for a
> + * device, a vDEVICE must be allocated via IOMMU_VDEVICE_ALLOC.
> + */
> +struct iommu_virq_arm_smmuv3 {
> +	__aligned_le64 evt[4];
>   };

Thanks for the explanation. Maybe I am a bit over-considering here.

Initially, my understanding is to report a virtual device ID when the
object originates from a vIOMMU, and an iommufd device ID otherwise.

However, considering page fault scenarios, which are self-contained but
linked to a hardware page table (hwpt), introduces ambiguity. Hwpt can
be created with or without a vIOMMU. This raises the question: should
the page fault message always report the iommufd device ID, or should
the reporting depend on whether the hwpt was created from a vIOMMU?

Thanks,
baolu

