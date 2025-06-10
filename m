Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E37EC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 05:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MvTNYoYv/628Jc3bkdfKEJm6A34cEdSBtwrhLPTsztQ=; b=HKTh4hRfe6AZHXbCcXIDeqNXrB
	dLhARSQ076l3azWdWaRjHpgO5EUpMkHmt0LSprLKangGkdffms6NDvyzeya21oi0PTMwcFnBeOyqv
	F9QAnYuXzewUBXQBx1cqyNCLA7D95dcjFODuRHwdpe6t/5J65Le/bdArKdjjGnxI7pDP4B0jRh1M9
	TC5OlMzwzK6HwA/lzgJGus7KBKKuiICSmWAiJmAU8SDPmakC+pMiOwcvWdm6q8Sgh2jqATjB3gfrp
	U8P6kNsJLpIty0A3iC1Kg5n2NJjPCT0Ckwh7EsK4onQTc7s8aFyreJBK3AT1y5ll1T5yokIWpXpE7
	rja6Q83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOs02-00000005sfr-3Ziz;
	Tue, 10 Jun 2025 05:58:18 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOrxu-00000005sVW-0M1S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 05:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749534966; x=1781070966;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=G4e/2eOK6ny5QB/E7KrW01XPlfzZ3rtlWZTAQU/NK50=;
  b=iMOeNgNx8E8W5+H3Y3jwEzFcStzJJ2y6adRXi+OZGr6rvizCuITKpWOM
   CS8dMW+jBohYflwIAJRW7ETFYVFQTWCWweBKVUEbs86NIRq5vRWzvkz1H
   ubTx/TMveQ+e3ad1DN3X4BBl59EuM/D8/ylKdfD5edakp+w1uchNBuIFg
   /GUZfwD1DC28Frp/wNl0qK+rMSfHijYc9CUQ0fqqfQlyBfIytv/vV4Y8A
   ZLXW1IRW1N8zBHxhVeWZW0emKoYsMPhT1gcQXYcHaNifTOp+O4Y/qMxOI
   VMdzF0mOtKofPsxmX8ASU3WNQgxce8fNdT0kMcYQeHrz7jE4kEwYPvwjf
   g==;
X-CSE-ConnectionGUID: yMLR8KymSD21m5gOrOha5Q==
X-CSE-MsgGUID: 2LMJA3SLRvKFi1CoZx0wmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51619309"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="51619309"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 22:56:00 -0700
X-CSE-ConnectionGUID: iwtgq3SFR1qHMUrMNb3N1Q==
X-CSE-MsgGUID: +iV+ck/8TO6QZ8hxjHdHGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147692069"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 22:55:56 -0700
Message-ID: <663c7eee-5a3a-48e5-8bed-8abad62f3484@linux.intel.com>
Date: Tue, 10 Jun 2025 13:55:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/12] iommufd/viommu: Replace ops->viommu_alloc with
 ops->viommu_init
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 ddutile@redhat.com, yi.l.liu@intel.com, peterz@infradead.org,
 jsnitsel@redhat.com, praan@google.com, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1749488870.git.nicolinc@nvidia.com>
 <5586990446e4c97827b5a195622ec0f8cf9d2d67.1749488870.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <5586990446e4c97827b5a195622ec0f8cf9d2d67.1749488870.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_225606_228563_4D34E2AE 
X-CRM114-Status: GOOD (  14.52  )
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

On 6/10/25 01:13, Nicolin Chen wrote:
> To ease the for-driver iommufd APIs, get_viommu_size and viommu_init ops
> are introduced. Now, those existing vIOMMU supported drivers implemented
> these two ops too.
> 
> Relace the ops->viommu_alloc call with the two new ones.
> 
> Note that this will fail a !viommu->ops case from now on, since a vIOMMU
> is expected to support alloc_domain_nested at least.

Does this mean that the viommu implementation in the iommu driver is
required to implement alloc_domain_nested? I suppose viommu should soon
be extended to support TEE/IO.

> 
> Suggested-by: Jason Gunthorpe<jgg@nvidia.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommufd/viommu.c | 30 +++++++++++++++++++++++++++---
>   1 file changed, 27 insertions(+), 3 deletions(-)
> 

<...>

> @@ -68,6 +82,16 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>   	 */
>   	viommu->iommu_dev = __iommu_get_iommu_dev(idev->dev);
>   
> +	rc = ops->viommu_init(viommu, hwpt_paging->common.domain);
> +	if (rc)
> +		goto out_abort;
> +
> +	/* It is a driver bug that viommu->ops isn't filled */
> +	if (WARN_ON_ONCE(!viommu->ops)) {
> +		rc = -EINVAL;
> +		goto out_abort;
> +	}
> +
>   	cmd->out_viommu_id = viommu->obj.id;
>   	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
>   	if (rc)

Thanks,
baolu

