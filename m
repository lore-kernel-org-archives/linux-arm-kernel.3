Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B820FF8869
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 16:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+kcS+RF7ul139+IsLW+SJd1rc+dwFZPBm+wKeOEa6E=; b=p/8d7H+A+BiEYOse6mr+OVzZoQ
	DT6uRuKYE24hD9sbZnSMq2INcyOy9ZR1CFuy3kodlaROxqHkQ68tkoTzckCKnKxx2S9QsWNA1tQ2R
	arzk3JVBbOQWLXi9zTTsVuUl+ojIAS+N0TK9fB/4VZZ1i9nUKmy/df/4kA3jtTYnYHHAgy+Aq7/CN
	n+9J1G6WrWs2x1R2lhbtFUI/XXvTyp88xrrMsSWI7dmNhrN6PS3kwhi+ZupOkUMHPi8QcAXOTCSAf
	mQU9/UkU9l4LShE4C/nFIqZueLtKSFQ6SJQ5DRsd+mDY4C3otC3Vdm8dkgHOey5SgkAjB01pkdT9y
	ZTVjdavA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOt4-0000000HN12-1XdC;
	Mon, 27 Apr 2026 16:32:46 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOt1-0000000HN0R-3Fhy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 16:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777307564; x=1808843564;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Y0roxTXaVRo9dgpe+WBRbf1u7DnmhCufjiiekE3A1aw=;
  b=SLV7DphtTtGQYhRq7XWALzd68nBG3sz6HrCNNVGe0CSwASMnZLNU5ZGN
   H6+gdtdNRv+wJTthNLMk7Xfo6H2+UqCInKG3gY+/fukvhBQ7daWeTnvIW
   /WTaw/Movrk/7Hy9tmG+pBzRJ7D0ewrhcOhyU43+KHksLWc1qp05zAGgx
   IHVmja+vGabMieqA/o5zdh5RsE71OYK2SyFftbjt3WGxDK22VVy5wVE3I
   AOkj2jKVZgoy5lrwD2ApzhgvAmot8EFNCc7K54P0xB0chm2sFUHxWZM5D
   czkoGFE9uZY0xvI6xMFBuUi8bGas6gLIo86teYFLx8bG0xzpZPLQxZv5I
   g==;
X-CSE-ConnectionGUID: H/jIFQ0bRzGAHU+/EC7IPw==
X-CSE-MsgGUID: 7nzZxlPhQSqnQDdWWcDJbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78093718"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="78093718"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 09:32:44 -0700
X-CSE-ConnectionGUID: 1RUd+HJWR5uLHpUSBZOvmg==
X-CSE-MsgGUID: cCHic7IMRuiseDsi8VPeig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="271816409"
Received: from msatwood-mobl.amr.corp.intel.com (HELO [10.125.108.172]) ([10.125.108.172])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 09:32:42 -0700
Message-ID: <b8ebf835-fc0a-4c28-ae8a-5b165d11775d@intel.com>
Date: Mon, 27 Apr 2026 09:32:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] PCI: Allow ATS to be always on for pre-CXL devices
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, will@kernel.org,
 robin.murphy@arm.com, bhelgaas@google.com
Cc: joro@8bytes.org, praan@google.com, baolu.lu@linux.intel.com,
 kevin.tian@intel.com, miko.lenczewski@arm.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 dan.j.williams@intel.com, jonathan.cameron@huawei.com, vsethi@nvidia.com,
 linux-cxl@vger.kernel.org, nirmoyd@nvidia.com
References: <cover.1777269009.git.nicolinc@nvidia.com>
 <1a8cf5e88051ab5c10417edb94df598ecbc810cf.1777269009.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <1a8cf5e88051ab5c10417edb94df598ecbc810cf.1777269009.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_093243_870120_B3930A76 
X-CRM114-Status: GOOD (  21.49  )
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



On 4/26/26 10:54 PM, Nicolin Chen wrote:
> Some NVIDIA GPU/NIC devices, though they don't implement CXL config space,
> have many CXL-like properties. Call this kind "pre-CXL".
> 
> Similar to CXL.cache capability, these pre-CXL devices also require the ATS
> function even when their RIDs are IOMMU bypassed, i.e. keep ATS "always on"
> v.s. "on demand" when a non-zero PASID line gets enabled in SVA use cases.
> 
> Introduce pci_dev_specific_ats_always_on() quirk function to scan a list of
> IDs for these devices. Then, include it in pci_ats_always_on().
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Nirmoy Das <nirmoyd@nvidia.com>
> Tested-by: Nirmoy Das <nirmoyd@nvidia.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>


> ---
>  drivers/pci/pci.h    |  9 +++++++++
>  drivers/pci/ats.c    |  3 ++-
>  drivers/pci/quirks.c | 38 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 4a14f88e543a2..4e0077478cd7a 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -1155,6 +1155,15 @@ static inline int pci_dev_specific_reset(struct pci_dev *dev, bool probe)
>  }
>  #endif
>  
> +#if defined(CONFIG_PCI_QUIRKS) && defined(CONFIG_PCI_ATS)
> +bool pci_dev_specific_ats_always_on(struct pci_dev *dev);
> +#else
> +static inline bool pci_dev_specific_ats_always_on(struct pci_dev *dev)
> +{
> +	return false;
> +}
> +#endif
> +
>  #if defined(CONFIG_PCI_QUIRKS) && defined(CONFIG_ARM64)
>  int acpi_get_rc_resources(struct device *dev, const char *hid, u16 segment,
>  			  struct resource *res);
> diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
> index fc871858b65bc..3846447ea322f 100644
> --- a/drivers/pci/ats.c
> +++ b/drivers/pci/ats.c
> @@ -244,7 +244,8 @@ bool pci_ats_always_on(struct pci_dev *pdev)
>  	if (pdev->is_virtfn)
>  		pdev = pci_physfn(pdev);
>  
> -	return pci_cxl_ats_always_on(pdev);
> +	return pci_cxl_ats_always_on(pdev) ||
> +	       pci_dev_specific_ats_always_on(pdev);
>  }
>  EXPORT_SYMBOL_GPL(pci_ats_always_on);
>  
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index caaed1a01dc02..887babba97cc7 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -5715,6 +5715,44 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x1457, quirk_intel_e2000_no_ats);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x1459, quirk_intel_e2000_no_ats);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x145a, quirk_intel_e2000_no_ats);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x145c, quirk_intel_e2000_no_ats);
> +
> +static bool quirk_nvidia_gpu_ats_always_on(struct pci_dev *pdev)
> +{
> +	switch (pdev->device) {
> +	case 0x2e00 ... 0x2e3f: /* GB20B */
> +		return true;
> +	}
> +	return false;
> +}
> +
> +static const struct pci_dev_ats_always_on {
> +	u16 vendor;
> +	u16 device;
> +	bool (*ats_always_on)(struct pci_dev *dev);
> +} pci_dev_ats_always_on[] = {
> +	/* NVIDIA GPUs */
> +	{ PCI_VENDOR_ID_NVIDIA, PCI_ANY_ID, quirk_nvidia_gpu_ats_always_on },
> +	/* NVIDIA CX10 Family NVlink-C2C */
> +	{ PCI_VENDOR_ID_MELLANOX, 0x2101, NULL },
> +	{ 0 }
> +};
> +
> +/* Some pre-CXL devices require ATS when it is IOMMU-bypassed */
> +bool pci_dev_specific_ats_always_on(struct pci_dev *pdev)
> +{
> +	const struct pci_dev_ats_always_on *i;
> +
> +	for (i = pci_dev_ats_always_on; i->vendor; i++) {
> +		if (i->vendor != pdev->vendor)
> +			continue;
> +		if (i->ats_always_on && i->ats_always_on(pdev))
> +			return true;
> +		if (!i->ats_always_on && i->device == pdev->device)
> +			return true;
> +	}
> +
> +	return false;
> +}
>  #endif /* CONFIG_PCI_ATS */
>  
>  /* Freescale PCIe doesn't support MSI in RC mode */


