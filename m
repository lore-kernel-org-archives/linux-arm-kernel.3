Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69176C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 07:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9b1ToOszkThj2uAeoNsrFy9AJprJXsX3EVBOlIQS4LM=; b=urM2IPnhg4dPODmwXcfSsqc8pL
	5KGceAaMNUXcV0G2oPs8VRb+kbuFhXLcLEOtB21bBiHFucgII0hoVYpzzd1Io2lcnmsbY5CMGJEXb
	6KNt7rvSlUA/zFkrC9k61bMVZBYNa2SD25N5LEIqQpXEloW9PMSpQWF7JvOQCvvnXhd6lR7BoG2ho
	79PtAUeEHV6NLVlE1HJx9RWcYWiJ+2yLXar2jnGSuBgeyS6vYqyxNIKcKnqty+VeVCfYYgkZBVvha
	3dE6Svg23/BcxLrU1gBuXhmGNXhdxH2KMQh3B0QdF4/Ki5tqawWfdrYm0XYzPpzjbD8cZxn2QEezD
	r11tjXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3sA-00000003aEK-0Y3B;
	Mon, 16 Jun 2025 07:03:14 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3kU-00000003ZL0-0GOG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 06:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750056918; x=1781592918;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JzhPaAJq3SE1ySzHxtViTC3KuZDIosj/LQ8YKkF7X1Q=;
  b=WiPLRl0NqgbcrHZJpY5RpWoMzSjjaRyLbG9RGcdR3QqwC32Hg6Z6SXqk
   NFpZS4quy09i0kjLfVcv8QcUlJ8XIPeZ3i3CVw5A4DFkjin1Rtq7SKeWE
   RQoLmkSFe12WBRGB7uD8owFl4hmujcDx8gubMYIua8SWHagpOBDHzoxUi
   H1xTWrsVqcz22GG8xtO0g7zi18KQg3ThIy8ucIcXbKH4VrPvS6kLmIfDT
   zuCP9KrXH04TWDmpfRFTMXQmNwuRhrzDuFRcJb8rMiEai4ZD++Il7LbFv
   rH8nljM4ds35lQpgAbYYufCWVa8+14jGTFGHlvgkzLVquDnWZW1zjYiXJ
   A==;
X-CSE-ConnectionGUID: oJGcCgKmSsyziYFHe/V77w==
X-CSE-MsgGUID: bt5DTJm7QBulDawCaeq37w==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="74720818"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="74720818"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 23:55:15 -0700
X-CSE-ConnectionGUID: eWT5UpgTTxO6CbYgUZWzxg==
X-CSE-MsgGUID: xOYLWIvfQEeVOE3EP2VS3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="149298915"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 23:55:09 -0700
Message-ID: <b9a7ae65-edc6-46e9-bea0-163a51459884@linux.intel.com>
Date: Mon, 16 Jun 2025 14:54:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/25] iommufd/viommu: Add IOMMUFD_CMD_HW_QUEUE_ALLOC
 ioctl
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
 bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
 peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
 praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kselftest@vger.kernel.org, patches@lists.linux.dev, mochs@nvidia.com,
 alok.a.tiwari@oracle.com, vasant.hegde@amd.com, dwmw2@infradead.org
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <7dfb002613f224f57a069d27e7bf2b306b0a5ba0.1749884998.git.nicolinc@nvidia.com>
 <1ab8030b-8d2f-4ebe-a280-6d0e4e1d17c7@linux.intel.com>
 <aE+976F9zPsjtfry@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <aE+976F9zPsjtfry@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_235518_144852_DD515607 
X-CRM114-Status: GOOD (  18.84  )
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

On 6/16/25 14:47, Nicolin Chen wrote:
> On Mon, Jun 16, 2025 at 02:12:04PM +0800, Baolu Lu wrote:
>> On 6/14/25 15:14, Nicolin Chen wrote:
>>> +	if (!viommu->ops || !viommu->ops->get_hw_queue_size ||
>>> +	    !viommu->ops->hw_queue_init_phys) {
>>> +		rc = -EOPNOTSUPP;
>>> +		goto out_put_viommu;
>>> +	}
> Hmm, here it does abort when !viommu->ops->hw_queue_init_phys ..
> 
>>> +	/*
>>> +	 * FIXME once ops->hw_queue_init is introduced, this should check "if
>>> +	 * ops->hw_queue_init_phys". And "access" should be initialized to NULL.
>>> +	 */
>> I just don't follow here. Up until now, only viommu->ops->
>> hw_queue_init_phys has been added, which means the current code only
>> supports hardware queues that access guest memory using physical
>> addresses. The access object is not needed for the other type of
>> hardware queue that uses guest IOVA.
>>
>> So, why not just abort here if ops->hw_queue_init_phys is not supported
>> by the IOMMU driver?
> .. so, it already does.
> 
>> Leave other logics to the patches that introduce
>> ops->hw_queue_init? I guess that would make this patch more readible.
> The patch is doing in the way to support the hw_queue_init_phys
> case only. It is just adding some extra FIXMEs as the guideline
> for the future patch adding hw_queue_init op.
> 
> I personally don't feel these are confusing. Maybe you can help
> point out what specific wording feels odd here? Maybe "FIXME"s
> should be "TODO"s?

Oh, I probably misunderstood the logic here. For both hw_queue_init and
hw_queue_init_phys, using an access object to pin the pages for hardware
access is necessary, right? My understanding was that pinning pages is
only required for hw_queue_init_phys.

> 
> I could also drop all of these guideline if they are considered
> very unnecessary.
> 
> Thanks
> Nicolin

Thanks,
baolu

