Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE01C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 07:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJw58N0xw8wuF0XPUh0ddIK0CFfWiPBeRP8gBLU6t2U=; b=CiS+LsrgkgkkEe+eZ6DP+D13XN
	GmUpqwGChB0EGIbhAIGtMIMNeBgezjsRMuggk54MAdViXtPsGucWmUJ7Rvkwki6L9IEc6f4Az5udy
	TTpOUuBfXcrCLm1VLOKaRj4ZvpCkOFUonwmPE9sNeAFGXOuYErXcyhwrRqP1RErOK48nFY5KtI+zL
	8Nxmep75tJPkofwvEK9pznyugzL9D/6uNS17FATY/Z2pMdekw1iNpbex1mGu6feAK+FNV+iIpaPyV
	yuBVtDPsaeGpYMd+NFGzkERTMUTQYMmGyUZgJ3oazvQnDiKcST425wp715ZYwVJEDvMoC+xdUyqBb
	Aut3dxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR45J-00000003byJ-0xgT;
	Mon, 16 Jun 2025 07:16:49 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3ys-00000003bAR-2sbT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 07:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750057811; x=1781593811;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HhwKjP8VbV2N/fsxYWO7bqaMkvO7ZpTuQ+h5KlIDRzk=;
  b=e3B82TtDWzCIRHsfoAWFXZRD/rKBGFCTteTvUO3ci2Xo0NXCegc1qY14
   /XWhk8Asv43BdopuZDrKi1dYBb+6BBTmNdwscmUY54Q5h6bVFm839FjLs
   QAZn3lqv9VHxA2lRNbWcFx90T1AmHrCJJY5HwiSFlCVfr0edz6L7gJ9vJ
   E3Rpr5AXv5llwdBWlc3Z3lN8cu+QZB91Rle+blkDLT1qJK3N9IzEOCAPH
   vy2kwb6I5yReQB70UJiWycmaOxHjFyjUZJdM8SaBtdZIn8GcS2RllIezS
   2ZF9xNDxlS3A1u77AnpZfsQ/pWoeuLxhyMIXkOLYIlUxTooWunLvmkbUh
   w==;
X-CSE-ConnectionGUID: ukm/hrLiTMm6IMnH2cJKMA==
X-CSE-MsgGUID: 5/kwA740T26ycGDYnnh3Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62465438"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="62465438"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 00:10:09 -0700
X-CSE-ConnectionGUID: HFp5YyxzShG8ZygBfit8+A==
X-CSE-MsgGUID: dPn4q0uRTlCcfFecEvm0Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="148225683"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 00:10:01 -0700
Message-ID: <0e3c15ab-f38f-43e3-9de0-78e8ce486aca@linux.intel.com>
Date: Mon, 16 Jun 2025 15:09:02 +0800
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
 <b9a7ae65-edc6-46e9-bea0-163a51459884@linux.intel.com>
 <aE/B40NRb+GecpRi@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <aE/B40NRb+GecpRi@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_001010_772192_CC40F6C9 
X-CRM114-Status: GOOD (  17.90  )
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

On 6/16/25 15:04, Nicolin Chen wrote:
> On Mon, Jun 16, 2025 at 02:54:10PM +0800, Baolu Lu wrote:
>> On 6/16/25 14:47, Nicolin Chen wrote:
>>> On Mon, Jun 16, 2025 at 02:12:04PM +0800, Baolu Lu wrote:
>>>> On 6/14/25 15:14, Nicolin Chen wrote:
>>>>> +	if (!viommu->ops || !viommu->ops->get_hw_queue_size ||
>>>>> +	    !viommu->ops->hw_queue_init_phys) {
>>>>> +		rc = -EOPNOTSUPP;
>>>>> +		goto out_put_viommu;
>>>>> +	}
>>> Hmm, here it does abort when !viommu->ops->hw_queue_init_phys ..
>>>
>>>>> +	/*
>>>>> +	 * FIXME once ops->hw_queue_init is introduced, this should check "if
>>>>> +	 * ops->hw_queue_init_phys". And "access" should be initialized to NULL.
>>>>> +	 */
>>>> I just don't follow here. Up until now, only viommu->ops->
>>>> hw_queue_init_phys has been added, which means the current code only
>>>> supports hardware queues that access guest memory using physical
>>>> addresses. The access object is not needed for the other type of
>>>> hardware queue that uses guest IOVA.
>>>>
>>>> So, why not just abort here if ops->hw_queue_init_phys is not supported
>>>> by the IOMMU driver?
>>> .. so, it already does.
>>>
>>>> Leave other logics to the patches that introduce
>>>> ops->hw_queue_init? I guess that would make this patch more readible.
>>> The patch is doing in the way to support the hw_queue_init_phys
>>> case only. It is just adding some extra FIXMEs as the guideline
>>> for the future patch adding hw_queue_init op.
>>>
>>> I personally don't feel these are confusing. Maybe you can help
>>> point out what specific wording feels odd here? Maybe "FIXME"s
>>> should be "TODO"s?
>> Oh, I probably misunderstood the logic here. For both hw_queue_init and
>> hw_queue_init_phys, using an access object to pin the pages for hardware
>> access is necessary, right? My understanding was that pinning pages is
>> only required for hw_queue_init_phys.
> No. The access is only used by the ops->hw_queue_init_phys case.
> 
> The ops->hw_queue_init case will use the cmd->nesting_parent_iova
> directly without calling iommufd_hw_queue_alloc_phys().
> 
> This FIXME means that, when adding ops->hw_queue_init, add this:
> 
> -	struct iommufd_access *access;
> +	struct iommufd_access *access = NULL;
> ...
> -	access = iommufd_hw_queue_alloc_phys(cmd, viommu, &base_pa);
> +	if (ops->hw_queue_init_phys) {
> +		access = iommufd_hw_queue_alloc_phys(cmd, viommu, &base_pa);
> 
> Also, the other FIXME guideline states that these two ops should be
> mutually exclusive. So, add this too:
> +	if (WARN_ON_ONCE(ops->hw_queue_init &&
> +			 ops->hw_queue_init_phys)) {
> +		rc = -EOPNOTSUPP;

Okay, above matches my understanding. Thanks for the explanation.

Thanks,
baolu

