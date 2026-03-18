Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C90FCD0B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 06:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piaxn3CCsWBxFPw+QRWJ+cU0bLVVVi/hMzKHLT7ydkw=; b=QJ0N1Cc7L4jaVHCikkmOSk8gHv
	8bsDLojpLiOx320wxx03PHGF6QNj9wgrzQEE9ZXdP6TpF+uEwkh3rHYxVY0XGkFlt1FKQc3L1teKp
	Wzc4Kbzu9kP9qLNPzA4mdgyOftXCs23WSgirAmsKP5Y+crOsxTH6ozWxfOt4Y78maclBqaVTA04/7
	ih2aW+630RQNN/pDquf+pPU1M7iJewJ+C2z1y6rTH7X+uM3YZC29V1mWpo4RYHPC3fZCL3aK/kz7M
	J31JlDEwLAM93TpWordP9miQlhwsH9kstJHi/O8Ur0bm7zK+ap9miJxipN+YW3aARZrafO+pS2Mh0
	fL1dwYWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2jxw-00000007p2V-0sN3;
	Wed, 18 Mar 2026 06:01:12 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2jxr-00000007p1m-17st
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 06:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773813667; x=1805349667;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QWi6oahhozHMScCb8k498+pC0gcouQ2/wL4RVwYu/w0=;
  b=LE80kTywRw4EckMdnf4nTkW/3cEmbV/98tkTLZvfrnrEK9catD53y4hB
   rN/VgcPm6+UQymlHWlBnXFA8EOFh1AWI2V6Mbxpzf55EOcWgoDt2Vn+ZS
   ulctHtLuO83hPqHsrzeqrwU+tPJSF/iUbKls81qZ35s0vYjuTmmlfm2Ye
   WxovmY0evClbZyPpe1HGSgeGvvj+IFBTZPDLqe0lq1qJ4Q43lJuG1/oQq
   BNnQHE0F4U4ImkIeVdWCCx7FfdwyRA+lwKyJGoZw3AX1PcqMppNGRunU1
   hnhC+MFyBAwuztb9fG2rf3LWPvHysrRYNlOxYqKoyQlTEWy/JkoYVmC4F
   A==;
X-CSE-ConnectionGUID: NA2P8V8CTdSuP1tey1H84Q==
X-CSE-MsgGUID: Gefr2kq0T0S7hAXblHyssw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="86333455"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="86333455"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 23:01:04 -0700
X-CSE-ConnectionGUID: fufkNcBiT+CBntmgJzz94w==
X-CSE-MsgGUID: fcvgoaXHTAWlNQB0gyTvMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="222480812"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 23:01:00 -0700
Message-ID: <566549c9-fab1-43b5-a35b-e3c76f1c285d@linux.intel.com>
Date: Wed, 18 Mar 2026 13:59:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] iommu: Add reset_device_done callback for hardware
 fault recovery
To: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, bhelgaas@google.com, jgg@nvidia.com
Cc: rafael@kernel.org, lenb@kernel.org, praan@google.com,
 xueshuai@linux.alibaba.com, kevin.tian@intel.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, vsethi@nvidia.com
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <3750a106b4ab4235df842fa2b9defbc8226ebbef.1773774441.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <3750a106b4ab4235df842fa2b9defbc8226ebbef.1773774441.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_230107_413087_EF3BD28A 
X-CRM114-Status: GOOD (  23.02  )
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

On 3/18/26 03:15, Nicolin Chen wrote:
> When an IOMMU hardware detects an error due to a faulty device (e.g. an ATS
> invalidation timeout), IOMMU drivers may quarantine the device by disabling
> specific hardware features or dropping translation capabilities.
> 
> To recover from these states, the IOMMU driver needs a reliable signal that
> the underlying physical hardware has been cleanly reset (e.g., via PCIe AER
> or a sysfs Function Level Reset) so as to lift the quarantine.
> 
> Introduce a reset_device_done callback in struct iommu_ops. Trigger it from
> the existing pci_dev_reset_iommu_done() path to notify the underlying IOMMU
> driver that the device's internal state has been sanitized.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   include/linux/iommu.h |  2 ++
>   drivers/iommu/iommu.c | 12 ++++++++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 54b8b48c762e8..9ba12b2164724 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -626,6 +626,7 @@ __iommu_copy_struct_to_user(const struct iommu_user_data *dst_data,
>    * @release_device: Remove device from iommu driver handling
>    * @probe_finalize: Do final setup work after the device is added to an IOMMU
>    *                  group and attached to the groups domain
> + * @reset_device_done: Notify the driver about the completion of a device reset
>    * @device_group: find iommu group for a particular device
>    * @get_resv_regions: Request list of reserved regions for a device
>    * @of_xlate: add OF master IDs to iommu grouping
> @@ -683,6 +684,7 @@ struct iommu_ops {
>   	struct iommu_device *(*probe_device)(struct device *dev);
>   	void (*release_device)(struct device *dev);
>   	void (*probe_finalize)(struct device *dev);
> +	void (*reset_device_done)(struct device *dev);
>   	struct iommu_group *(*device_group)(struct device *dev);
>   
>   	/* Request/Free a list of reserved regions for a device */
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 40a15c9360bd1..fcd2902d9e8db 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -4013,11 +4013,13 @@ EXPORT_SYMBOL_GPL(pci_dev_reset_iommu_prepare);
>   void pci_dev_reset_iommu_done(struct pci_dev *pdev)
>   {
>   	struct iommu_group *group = pdev->dev.iommu_group;
> +	const struct iommu_ops *ops;
>   	unsigned long pasid;
>   	void *entry;
>   
>   	if (!pci_ats_supported(pdev) || !dev_has_iommu(&pdev->dev))
>   		return;
> +	ops = dev_iommu_ops(&pdev->dev);
>   
>   	guard(mutex)(&group->mutex);
>   
> @@ -4029,6 +4031,16 @@ void pci_dev_reset_iommu_done(struct pci_dev *pdev)
>   	if (WARN_ON(!group->blocking_domain))
>   		return;
>   
> +	/*
> +	 * A PCI device might have been in an error state, so the IOMMU driver
> +	 * had to quarantine the device by disabling specific hardware feature
> +	 * or dropping translation capability. Here notify the IOMMU driver as
> +	 * a reliable signal that the faulty PCI device has been cleanly reset
> +	 * so now it can lift its quarantine and restore full functionality.
> +	 */
> +	if (ops && ops->reset_device_done)
> +		ops->reset_device_done(&pdev->dev);

Nit: dev_iommu_ops() ensures a valid iommu "ops". There is no need to
check "ops != NULL" here. Just

	if (ops->reset_device_done)
		ops->reset_device_done(&pdev->dev);

> +
>   	/* Re-attach RID domain back to group->domain */
>   	if (group->domain != group->blocking_domain) {
>   		WARN_ON(__iommu_attach_device(group->domain, &pdev->dev,

Thanks,
baolu

