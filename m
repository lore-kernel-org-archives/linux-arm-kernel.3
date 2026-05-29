Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAC0CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 03:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOU2RCYFW5gy8yOcvzKD2LYKQJInJJBEtyfu7dPaVog=; b=rq15FxPiUFjCG3wcLP2Lk4NLNR
	YiL9RaUM6fN/fMAzYP395/rYOk4tZZKPnPFS+gQCD9u+S3fLUodj9aJaFlsY41OxGV7Y2Ch3EbtcQ
	7DopPqusg9fbvQRyRLE6TfTWWcIXkSWecrDl3BCY1oHVdo9SLjuuRG7VRAaOfBhjVThAOBqaphR4x
	GNQZGdHtR30fxwhatHDd2CeusTM7i3O4UwaAs5fBeIS5xthmRu5ztC7d5ujU1vGVog5EJ9uk7TRAk
	aH5R1vylB0tUymk0+9j2SADk1NPdTl+X1YeiXOPUy6udXOVm3z6eQa7Px8UYzXwkZjZJvyX2oEdlH
	uoQxSG9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSnoy-00000006h1a-3xOY;
	Fri, 29 May 2026 03:23:40 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSnow-00000006gl8-2Gky
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 03:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780025018; x=1811561018;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wDQVFhBo3gBIQZfJEViqlT0vYqsaA6hIzYCcs0Tl2GA=;
  b=R95wXqg83RirX6ilBFX8GpwClBNgUggJyZsWMmx4YwqKwOPaalYi7SvJ
   SdKVrZDHG+4t+qrKN3/9Q6GvTVYfRzlawzDU4hv9BjJEyLpaRLZ4rtizM
   KXjBX1oVn0zhT5SdiDqCxRowy1gHYSeiZ2cfDsh9h0zxZ6poYXr5ZEYeA
   YDP2ymOLPlzZp6E0OuCV/Qov0f2GF2TPdL0KAScwgSYdL9dZTV3aoaZvl
   E7gmMRl4mOR9gdaV3Hn7E7USlcb4JG2DzMIK1xUfOpPeVayGbz2oL9DE5
   MW8/Q2fuh6QXebHfRqMJcDUO3/ORkPV7AEMRgJsnLAl4O30n6RBUq9a56
   A==;
X-CSE-ConnectionGUID: bNDVyRmEQMmrOXlg4ku0Cg==
X-CSE-MsgGUID: NKV47LwLS+qOTb5xCEGJPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="81058265"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="81058265"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 20:21:37 -0700
X-CSE-ConnectionGUID: H5rT94fQQAuf4q2VWMam+w==
X-CSE-MsgGUID: RCxSXA1aSmSJpaSFQgHLbQ==
X-ExtLoop1: 1
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 20:21:33 -0700
Message-ID: <5c5e85f1-f745-4667-af0d-30af71288294@linux.intel.com>
Date: Fri, 29 May 2026 11:20:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] iommu/vt-d: Fix RB-tree corruption and
 Use-After-Free in probe
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
 Mostafa Saleh <smostafa@google.com>, sashiko-bot@kernel.org
References: <20260528202353.3422206-1-praan@google.com>
 <20260528202353.3422206-6-praan@google.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20260528202353.3422206-6-praan@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_202338_655652_B96358B0 
X-CRM114-Status: GOOD (  21.05  )
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
> The intel_iommu_probe_device() function contains two pre-existing
> memory safety issues on its error path:
> 
> 1. The info->node RB-tree member is zero-initialized via kzalloc. If
>     a device does not support ATS, the device_rbtree_insert() call is
>     skipped. If a subsequent probe step fails, the error path jumps to
>     device_rbtree_remove(), which misinterprets the zeroed node as
>     a tree root and corrupts the device RB-tree.
> 
> 2. The info structure is freed on failure, but the pointer remains
>     linked to the device via dev_iommu_priv_set(). This leads to a
>     Use-After-Free regression if the pointer is accessed later.
> 
> Fix these by explicitly initializing the RB-node as empty and guarding
> its removal. Additionally, ensure dev_iommu_priv_set(dev, NULL) is
> called before freeing the info structure in the error path.

Thanks for the fixes. Could you please separate these two fixes into two
distinct patches and post them as a standalone series? These two fixes
are quick cleanups and are not part of the current series, which focuses
on improving the robustness of ATS enablement.

> 
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/all/20260525205628.CD4431F000E9@smtp.kernel.org/
> Suggested-by: Baolu Lu <baolu.lu@linux.intel.com>
> Signed-off-by: Pranjal Shrivastava <praan@google.com>
> ---
>   drivers/iommu/intel/iommu.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 4d0e65bc131d..ed6d3a0203f5 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -157,7 +157,10 @@ static void device_rbtree_remove(struct device_domain_info *info)
>   	unsigned long flags;
>   
>   	spin_lock_irqsave(&iommu->device_rbtree_lock, flags);
> -	rb_erase(&info->node, &iommu->device_rbtree);
> +	if (!RB_EMPTY_NODE(&info->node)) {
> +		rb_erase(&info->node, &iommu->device_rbtree);
> +		RB_CLEAR_NODE(&info->node);
> +	}
>   	spin_unlock_irqrestore(&iommu->device_rbtree_lock, flags);
>   }
>   
> @@ -3254,6 +3257,7 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
>   
>   	info->dev = dev;
>   	info->iommu = iommu;
> +	RB_CLEAR_NODE(&info->node);
>   	if (dev_is_pci(dev)) {
>   		if (ecap_dev_iotlb_support(iommu->ecap) &&
>   		    pci_ats_supported(pdev) &&
> @@ -3316,6 +3320,7 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
>   clear_rbtree:
>   	device_rbtree_remove(info);
>   free:
> +	dev_iommu_priv_set(dev, NULL);
>   	kfree(info);
>   
>   	return ERR_PTR(ret);

Thanks,
baolu

