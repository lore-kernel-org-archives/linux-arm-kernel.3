Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8ADE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 05:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJ4A51OZNp406wVto37ixNyoeozvfe5gqd5GQDr+NOQ=; b=b1pAKe0Y2GLrkFidtfVfdkPanR
	SQ387T7ehnwqizy+Z2UQKMvWV3H9ihSCAWeuUW/5iL0gOQGecRT3TBwlBtoOLoAvGRC6MZGtcuZ0Z
	pbz7QZ7aCQM0QZNFBAlN0LewaheH3TBL2JsiLdIaAqwi2kVgRk63Lsw38yvZbtF38DoSbac+kl9nk
	McfccbVoZQnQwZcw5E1SlMUu0C7JunqKM5BoaapkjL5ibcOoi0z/u4m8hWfyWARYfoBEcDt4HdpYw
	NlHjZ7MARKjWWf7AqM3uVOfDvrpwI2Xedf/FOp/qE5TpaOZhgwyZoJScXFj5Xh2MKWlKb4+bCyIOR
	ZXVIF44g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV2af-00000003adT-2Shs;
	Tue, 07 Jan 2025 05:57:21 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV2ZR-00000003aVW-0b7q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 05:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736229365; x=1767765365;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WoJ6PsFjUaXsGhvoop4qkupd0WOfNNTpqM+Het/KLMU=;
  b=jlmsKSnpHomDLrhprqVVMScoxXYRK+gX6ahXokLkXOUuOswFZ3SeUquP
   qOvihRgC643dqxjG5E/sdR1d6p4+jNRfpi3lSJ9EdckIZIybsi0ZIjVR/
   Eumrly0pFN5+Djx9Gapwe9ELWa4jjlkPFs8Pi37DZk2/ZEk2w8TQzVsKg
   V6C/CVWKCURGh1NTBDV+IZvFXwep1ibnFHybpn8JOcFTmjD0tQwsFGCJy
   O2PyLy1UlkH9hGkKhAPLz/96IBkchr5d+q4IGt3WcUnIp0kRn+j6odBww
   MsOAtxL9ypjlqiTNTiTaIR1zr4BlWlT0H1E4LCvrf+KFKY7iO3Vm1GZm6
   g==;
X-CSE-ConnectionGUID: MNOpGAT8QruwwqsTeaGliA==
X-CSE-MsgGUID: lLgqCTSiR4C+yEDmZopO4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="24001429"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="24001429"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 21:56:04 -0800
X-CSE-ConnectionGUID: OOJpn2qvQDGj1fkl/ZwdHw==
X-CSE-MsgGUID: 6MdEJVMyTveGv4b9OOT3qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="102849876"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 21:56:00 -0800
Message-ID: <75456867-8993-4be4-bcdf-14df28fe92cc@linux.intel.com>
Date: Tue, 7 Jan 2025 13:54:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/14] iommu/arm-smmu-v3: Report events that belong to
 devices attached to vIOMMU
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
 joro@8bytes.org, suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
 dwmw2@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
 mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
 smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
 patches@lists.linux.dev
References: <cover.1735933254.git.nicolinc@nvidia.com>
 <69a46c72e43ed086840be462eef731167d90a9d8.1735933254.git.nicolinc@nvidia.com>
 <585fc99f-c2dc-459c-929a-c7c7631b9caf@linux.intel.com>
 <Z3wk9TvmUhB3/zlk@Asurada-Nvidia> <Z3yvZsq77bpnaoAb@Asurada-Nvidia>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <Z3yvZsq77bpnaoAb@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_215605_203770_C11528E9 
X-CRM114-Status: GOOD (  19.66  )
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

On 1/7/25 12:36, Nicolin Chen wrote:
> On Mon, Jan 06, 2025 at 10:46:21AM -0800, Nicolin Chen wrote:
>> On Mon, Jan 06, 2025 at 11:01:32AM +0800, Baolu Lu wrote:
>>> Nit: I think it would be more readable to add a check in the vevent
>>> reporting helper.
>>>
>>> diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
>>> index 77c34f8791ef..ccada0ada5ff 100644
>>> --- a/drivers/iommu/iommufd/driver.c
>>> +++ b/drivers/iommu/iommufd/driver.c
>>> @@ -86,6 +86,9 @@ int iommufd_viommu_report_event(struct iommufd_viommu
>>> *viommu,
>>>          if (WARN_ON_ONCE(!data_len || !event_data))
>>>                  return -EINVAL;
>>>
>>> +       if (WARN_ON_ONCE(type != IOMMU_VEVENTQ_TYPE_ARM_SMMUV3))
>>> +               return -EINVAL;
>>> +
>> Hmm, that's a good point I think.
>>
>>>          down_read(&viommu->veventqs_rwsem);
>>>
>>>          veventq = iommufd_viommu_find_veventq(viommu, type);
>> 		    ^
>> 		    |
>> We actually have been missing a type validation entirely, so the
>> type could have been rejected by this function. Perhaps we should
>> add a static list of supported types to struct iommufd_viommu_ops
>> for drivers to report so that then the core could reject from the
>> first place during a vEVENTQ allocation.
> I added something like this. Will send a v5.
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 0c7a5894ba07..348179f3cf2a 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -399,9 +399,15 @@ static int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
>   	return ret;
>   }
>   
> +static bool arm_vsmmu_supports_veventq(unsigned int type)
> +{
> +	return type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3;

Do you need to check the hardware capabilities before reporting this? I
am not familiar with the ARM architecture, but typically it's better to
make it like this,

static bool arm_vsmmu_supports_veventq(struct iommufd_viommu *viommu,
                                        enum iommu_veventq_type type)
{
	if (type != IOMMU_VEVENTQ_TYPE_ARM_SMMUV3)
		return false;

	if (hardware_not_capable(viommu))
		return false;

	return true;
}

> +}
> +
>   static const struct iommufd_viommu_ops arm_vsmmu_ops = {
>   	.alloc_domain_nested = arm_vsmmu_alloc_domain_nested,
>   	.cache_invalidate = arm_vsmmu_cache_invalidate,
> +	.supports_veventq = arm_vsmmu_supports_veventq,
>   };

Others look good to me.

Thanks,
baolu

