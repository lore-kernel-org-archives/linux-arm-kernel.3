Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A45CEE356
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 02:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ry4EESdgda5B/CH5vhuNw6trvyUOQpubeUBbJg7V014=; b=vELmMq1PxDzaeOF7YeK52Fc1Nv
	eszJ0+FB3vkKBhXjHxz8a5d075ikbl8kDGymPM6Cg06gqmGJ/tUnbFDMILrBn3EtoSALX8hsyAgy1
	Q7+ZSROdKiApGiUK0B4DBkyX4rqSJ7rRQk/AVSUhQBKERwS3g5Le+TtPScovGkDsfJHcXM7PtNRRU
	Ks+rdmcdgk8NbmVEmEqeyfdzEfXIy1RpzqyHVeaK8AFC4Sj34a5ptvmdjvigx8skKVtPUySs+FBtb
	AtUG5kJ9HFkcSe/1dnJHcf95HqDHZpmQ2j1NqvdOCsFBsiFizCCjJ7z9dof2Lk2Y2CuJFPVk+r8+X
	UAoV7o9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYIQ-00000001PXp-3P2e;
	Wed, 19 Nov 2025 02:51:50 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYIN-00000001PX5-2Odl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 02:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763520707; x=1795056707;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Y06lVyS4i4aGeKoISvtJgz0qBkZ8VMKTdchC7Sci+2E=;
  b=YGTqx/ssrT9Blnva8Njka0SfrDEHnvT4iKB9V7H3i66en0qwwtzN401y
   mkDwfhYe1H3xgxYZafvjhAaRSSePoSoDRI7WW7kh6iOqmbLy/YemoDbwa
   HuY2cwR1l7b5u/NEnQQBBlBlcsXnJQLP2rHr0K84L1Ld/YI4m633wEmw8
   uTvLi0WFdyKPupNdD04/lI3wC65TlBFMU6l5fWE7S8fEr4hcf4wA6FZhk
   NkZlYfYY1HLNtesNonbVIYPpb69EP52aGtyRTYRNkSlypWBJPKZ0diiq+
   n6zxMyfzZgxikc2PbWdtOXGi8rbxDDGOygE5gj/xrbS5O/fXGhhyPvpf2
   w==;
X-CSE-ConnectionGUID: taPMX1hfSYyjvEB65EqDDA==
X-CSE-MsgGUID: jXAPLqJ1RPCCtnoy5p/N8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65713823"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65713823"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:51:46 -0800
X-CSE-ConnectionGUID: ZvvFg8h+RrWzs/+N7veq5g==
X-CSE-MsgGUID: RePARr2fRJO/pW7IoKusCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221835583"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:51:41 -0800
Message-ID: <69ebd6cc-7620-4156-b64c-35ae1344d54f@linux.intel.com>
Date: Wed, 19 Nov 2025 10:47:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] iommu: Add iommu_driver_get_domain_for_dev()
 helper
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: joro@8bytes.org, afael@kernel.org, bhelgaas@google.com, alex@shazbot.org,
 jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org, robin.murphy@arm.com,
 lenb@kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, kvm@vger.kernel.org,
 patches@lists.linux.dev, pjaroszynski@nvidia.com, vsethi@nvidia.com,
 helgaas@kernel.org, etzhao1900@gmail.com
References: <cover.1762835355.git.nicolinc@nvidia.com>
 <0303739735f3f49bcebc244804e9eeb82b1c41dc.1762835355.git.nicolinc@nvidia.com>
 <d5445875-76bd-453d-b959-25989f5d3060@linux.intel.com>
 <aRTGwJ2CABOIKtq6@Asurada-Nvidia> <aRwaHMcgQNqV/cCG@Asurada-Nvidia>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <aRwaHMcgQNqV/cCG@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_185147_676129_66BD1473 
X-CRM114-Status: GOOD (  17.21  )
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

On 11/18/25 15:02, Nicolin Chen wrote:
> On Wed, Nov 12, 2025 at 09:41:25AM -0800, Nicolin Chen wrote:
>> Hi Baolu,
>>
>> On Wed, Nov 12, 2025 at 01:58:51PM +0800, Baolu Lu wrote:
>>> On 11/11/25 13:12, Nicolin Chen wrote:
>>>> +/**
>>>> + * iommu_get_domain_for_dev() - Return the DMA API domain pointer
>>>> + * @dev - Device to query
>>>> + *
>>>> + * This function can be called within a driver bound to dev. The returned
>>>> + * pointer is valid for the lifetime of the bound driver.
>>>> + *
>>>> + * It should not be called by drivers with driver_managed_dma = true.
>>>
>>> "driver_managed_dma != true" means the driver will use the default
>>> domain allocated by the iommu core during iommu probe.
>>
>> Hmm, I am not very sure. Jason's remarks pointed out that There
>> is an exception in host1x_client_iommu_detach():
>> https://lore.kernel.org/all/20250924191055.GJ2617119@nvidia.com/
>>
>> Where the group->domain could be NULL, i.e. not attached to the
>> default domain?
>>
>>> The iommu core
>>> ensures that this domain stored at group->domain will not be changed
>>> during the driver's whole lifecycle. That's reasonable.
>>>
>>> How about making some code to enforce this requirement? Something like
>>> below ...
>>>
>>>> + */
>>>>    struct iommu_domain *iommu_get_domain_for_dev(struct device *dev)
>>>>    {
>>>>    	/* Caller must be a probed driver on dev */
>>>> @@ -2225,10 +2234,29 @@ struct iommu_domain *iommu_get_domain_for_dev(struct device *dev)
>>>>    	if (!group)
>>>>    		return NULL;
>>>> +	lockdep_assert_not_held(&group->mutex);
>>>
>>> ...
>>> 	if (WARN_ON(!dev->driver || !group->owner_cnt || group->owner))
>>> 		return NULL;
>>
>> With that, could host1x_client_iommu_detach() trigger WARN_ON?
> 
> Hi Baolu,
> 
> For v6, I tend to keep this API as-is, trying not to give troubles
> to existing callers. Jason suggested a potential followup series:
> https://lore.kernel.org/linux-iommu/20250821131304.GM802098@nvidia.com/
> That would replace this function, so maybe we can think about that.
> 
> If you have a strong feeling about the WARN_ON, please let me know.
> 
> Thanks
> Nicolin

No strong feeling. I am fine with it because the comments have already
stated that "This function can be called within a driver bound to dev.".

Thanks,
baolu

