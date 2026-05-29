Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D6CCD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 06:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anc98ujI+0Sy4AB5Oi/wLqcj3z35ygxqLEjP/fJGVzY=; b=uVsOamVVTaFtvUiHfynlo5NB9L
	mBPP92ZDXAdiyCCPEmBfXyPq4VM/cxJAS95YOvy/XssgFYukPWSGtDulcCGykjBrhLJcSbUEZp4+A
	XD54o8lqtXMfez+I+bFsl9y45tGh4iuPkHXICC8bXNi1Vp9Sw/5nsNCchchmF7bv9BgQE6S1NDNQc
	eU4983TihU74QtKBX9vB2OVAWVIb//ujwFvM22PE+pIrhXxfeNF43hliLA2M6+wsK1h8FCJBx81sJ
	wLlYP3+TPG/tOqWfo9AHU1trVdyUxvG4GBSGiKWku+T32BEsMzZyr8i7gmpxhlAvdb8elOlxg4kI5
	eXR/mFaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqtH-00000006pQB-447r;
	Fri, 29 May 2026 06:40:19 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqtF-00000006pPk-1wrv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 06:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780036817; x=1811572817;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RuPeE6gjPC40qKPJlamS/Aiu1t3G8drwyUhBpAA62Es=;
  b=hvgQv2f0twK6GFicWULbgPsQsc2s65XtoY+CgrmO9KfUUAUODEnMQ7+Q
   JTbBvXCtNSuH3OMVz0f+gJDE7PWRNUPUv3/93/KvUNXOxF86x5M94RuyV
   4m2rA8nT0QD9BmSa7mMjSbI4j02b6CCW6BzCdv4tvMifN4dcbXdSk9VTe
   hKBnMPqCOeuqgoUyYI19rnL1oOwmteN9wygepqaAb2fTET3mR8B3b6uZT
   bVGB1JlcwDwgeR0RJ/762RWQkGmILbranrkrNmBAllX53WoobowJmGUuy
   pVG5akHz72VrRYCF/9cZfbYcS8H6abu9h98yZquSmH5Ei24jIAqevExVg
   Q==;
X-CSE-ConnectionGUID: Y6MCrlLbQN+MKgeXfjXBBw==
X-CSE-MsgGUID: 0mbr+0FhSxS+FNGsaUkTSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="84743557"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="84743557"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 23:40:17 -0700
X-CSE-ConnectionGUID: f2+Pz2IRQwO0yTKeVeEmcA==
X-CSE-MsgGUID: O7ZOH8EvRFmSYEg28QuzHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="246777942"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 23:40:13 -0700
Message-ID: <3fa3d4c9-c083-4167-93fe-814f0ecfcb7f@linux.intel.com>
Date: Fri, 29 May 2026 14:39:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] iommu/vt-d: Fail probe on ATS configuration
 failure
To: Pranjal Shrivastava <praan@google.com>, iommu@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, David Woodhouse <dwmw2@infradead.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
 David Matlack <dmatlack@google.com>, Samiullah Khawaja
 <skhawaja@google.com>, Daniel Mentz <danielmentz@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Mostafa Saleh <smostafa@google.com>
References: <20260528202353.3422206-1-praan@google.com>
 <20260528202353.3422206-7-praan@google.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20260528202353.3422206-7-praan@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_234017_526055_D72F6C15 
X-CRM114-Status: GOOD (  20.00  )
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

On 5/29/26 04:23, Pranjal Shrivastava wrote:
> Update the Intel VT-d driver to handle ATS configuration and enablement
> more strictly. Specifically, update the device probe to fail if
> pci_prepare_ats() returns an error. This ensures that any ATS-capable
> master reaching the attach phase is guaranteed to have a valid config.
> 
> Additionally, update iommu_enable_pci_ats() to WARN() if pci_enable_ats
> fails. Since earlier checks in the probe phase preclude config-related
> failures, any failure during hardware enablement is considered a kernel
> bug.
> 
> Signed-off-by: Pranjal Shrivastava <praan@google.com>
> ---
>   drivers/iommu/intel/iommu.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index ed6d3a0203f5..f13da16717fe 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -876,8 +876,14 @@ static void iommu_enable_pci_ats(struct device_domain_info *info)
>   	if (!pci_ats_page_aligned(pdev))
>   		return;
>   
> -	if (!pci_enable_ats(pdev, VTD_PAGE_SHIFT))
> -		info->ats_enabled = 1;
> +	/*
> +	 * pci_enable_ats() should not fail here because earlier checks
> +	 * have already verified support and configuration.
> +	 */
> +	if (WARN_ON(pci_enable_ats(pdev, VTD_PAGE_SHIFT)))
> +		return;
> +
> +	info->ats_enabled = 1;
>   }
>   
>   static void iommu_disable_pci_ats(struct device_domain_info *info)
> @@ -3292,7 +3298,10 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
>   
>   	dev_iommu_priv_set(dev, info);
>   	if (pdev && pci_ats_supported(pdev)) {
> -		pci_prepare_ats(pdev, VTD_PAGE_SHIFT);
> +		ret = pci_prepare_ats(pdev, VTD_PAGE_SHIFT);
> +		if (ret)
> +			goto free;
> +
>   		ret = device_rbtree_insert(iommu, info);
>   		if (ret)
>   			goto free;

Sashiko made a valuable review comment, and I believe it applies here as
well:

[Severity: High]
Since ATS is an optional performance optimization, does failing the
IOMMU probe when pci_prepare_ats() fails break backward compatibility?

This completely prevents devices with buggy ATS capabilities (or VF/PF
STU mismatches) from attaching to the IOMMU.

Could this disable DMA translation entirely for hardware that would
otherwise work correctly without ATS?

Thanks,
baolu

