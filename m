Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F59FFDEE5E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 02:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWxObQbgd8RAn50rgfDWc3292sszZfFiJHCCkvKhc/0=; b=Xnc60d+bo778jOPqJJWKTWXGnP
	TryICpxqTZbjK04Sh+TMuStc/WjkUChTIeJ6mwzP2sEkAIl1c6pqGR3/XkRRPBQjDGrl0M3UOQDCb
	if4k4HFFjzQOV7oRQ8iPKOIrR4ueAWglAV9SRgU5jg+vjY/uEOSHDNmg0H8B8apCJUZ/uXbQ2UfGE
	NHqfFW7VnoFQymU3DhgIf7kkDjIYCLcDVXZtCtAQR6nOZeWvF8/DVsaTV99RtCkqbnR7wpUiLMeQs
	T7qp3ADL23BN2/RyjaLdgCJRfgEZpREpARWpQPEaKM9LEfx/wFg9kARSTO0R/QDMY7aPs8092RwHb
	SfKdfBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6St-0000000CVjp-3ZqV;
	Fri, 24 Apr 2026 02:40:23 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6Sr-0000000CVjN-2fcn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 02:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776998421; x=1808534421;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GDYHGeXDanVl8be8asao377ynTvHnLATzfIj9w33Zys=;
  b=MULLAV+5IVMIzVXVLXEBNQEMDcxf9mcrRPCpGO4B5PTdL6OTvVvU8zNH
   wod3YB2M9F/35Vx6zDre7RsCqhjAnFhsj49xV4i4kZF+Efj/lwbJRkZ5a
   luQZJgLhVfJpmiNp2X4NPriBry+I+AxDCFDqYP/YgRRJwwG//Rd5xos/I
   3incIcykZBai/zVeq3KyDwmeO7PxtUYiMbZhgTUxc2nK2kgnM4rsy6JRv
   67mxkhTljd3hKsDAj+cl6rdvQxCsDQ42CDZnluNhMcwzfvbY1WE3zYmos
   ZbDYUNq1V4zjwT1HUxEPf5N6z6pqDB21p7J0GX3Z8mTwk4A6NbjbKOlMf
   Q==;
X-CSE-ConnectionGUID: RcrrMRJ0TjCNN1EjL/EOJg==
X-CSE-MsgGUID: VKfdUQgeQxi6h4lL8PgoYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="78091814"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="78091814"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 19:40:20 -0700
X-CSE-ConnectionGUID: hQmNcwIpQrmyzZpDbg2sgw==
X-CSE-MsgGUID: 5jhsLy+iQ9yt0maafXtcjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="234609058"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 19:40:15 -0700
Message-ID: <c8c8b482-3781-4d33-9aea-866467d15b69@linux.intel.com>
Date: Fri, 24 Apr 2026 10:38:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] iommu: Pass in reset result to
 pci_dev_reset_iommu_done()
To: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>,
 Kevin Tian <kevin.tian@intel.com>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, vsethi@nvidia.com,
 Shuai Xue <xueshuai@linux.alibaba.com>
References: <cover.1776381841.git.nicolinc@nvidia.com>
 <bf99f11ac9a42b5552ec3367d02840366459ae7b.1776381841.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <bf99f11ac9a42b5552ec3367d02840366459ae7b.1776381841.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_194021_720362_2AE8CE77 
X-CRM114-Status: GOOD (  34.07  )
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

On 4/17/26 07:28, Nicolin Chen wrote:
> IOMMU drivers handle ATC cache maintenance. They may encounter ATC-related
> errors (e.g., ATC invalidation request timeout), indicating that ATC cache
> might have stale entries that can corrupt the memory. In this case, IOMMU
> driver has no choice but to block the device's ATS function and wait for a
> device recovery.
> 
> The pci_dev_reset_iommu_done() called at the end of a reset function could
> serve as a reliable signal to the IOMMU subsystem that the physical device
> cache is completely clean. However, the function is called unconditionally
> even if the reset operation had actually failed, which would re-attach the
> faulty device back to a normal translation domain. And this will leave the
> system highly exposed, creating vulnerabilities for data corruption:
>      IOMMU blocks RID/ATS
>      pci_reset_function():
>          pci_dev_reset_iommu_prepare(); // Block RID/ATS
>          __reset(); // Failed (ATC is still stale)
>          pci_dev_reset_iommu_done(); // Unblock RID/ATS (ah-ha)
> 
> Instead, add a @reset_succeeds parameter to pci_dev_reset_iommu_done() and
> pass the reset result from each caller:
>      IOMMU blocks RID/ATS
>      pci_reset_function():
>          pci_dev_reset_iommu_prepare(); // Block RID/ATS
>          rc = __reset();
>          pci_dev_reset_iommu_done(!rc); // Unblock or quarantine
> 
> On a successful reset, done() restores the device to its RID/PASID domains
> and decrements group->recovery_cnt. On failure, the device remains blocked,
> and concurrent domain attachment will be rejected until a successful reset.
> 
> Suggested-by: Kevin Tian<kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   include/linux/iommu.h  |  5 +++--
>   drivers/iommu/iommu.c  | 28 +++++++++++++++++++++++++---
>   drivers/pci/pci-acpi.c |  2 +-
>   drivers/pci/pci.c      | 10 +++++-----
>   drivers/pci/quirks.c   |  2 +-
>   5 files changed, 35 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 54b8b48c762e8..d3685967e960a 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -1191,7 +1191,7 @@ void iommu_free_global_pasid(ioasid_t pasid);
>   
>   /* PCI device reset functions */
>   int pci_dev_reset_iommu_prepare(struct pci_dev *pdev);
> -void pci_dev_reset_iommu_done(struct pci_dev *pdev);
> +void pci_dev_reset_iommu_done(struct pci_dev *pdev, bool reset_succeeds);
>   #else /* CONFIG_IOMMU_API */
>   
>   struct iommu_ops {};
> @@ -1521,7 +1521,8 @@ static inline int pci_dev_reset_iommu_prepare(struct pci_dev *pdev)
>   	return 0;
>   }
>   
> -static inline void pci_dev_reset_iommu_done(struct pci_dev *pdev)
> +static inline void pci_dev_reset_iommu_done(struct pci_dev *pdev,
> +					    bool reset_succeeds)
>   {
>   }
>   #endif /* CONFIG_IOMMU_API */
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index ff181db687bbf..28d4c1f143a08 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -80,6 +80,7 @@ struct group_device {
>   	 * Device is blocked for a pending recovery while its group->domain is
>   	 * retained. This can happen when:
>   	 *  - Device is undergoing a reset
> +	 *  - Device failed the last reset
>   	 */
>   	bool blocked;
>   	unsigned int reset_depth;
> @@ -3971,7 +3972,9 @@ EXPORT_SYMBOL_NS_GPL(iommu_replace_group_handle, "IOMMUFD_INTERNAL");
>    * reset is finished, pci_dev_reset_iommu_done() can restore everything.
>    *
>    * Caller must use pci_dev_reset_iommu_prepare() with pci_dev_reset_iommu_done()
> - * before/after the core-level reset routine, to decrement the recovery_cnt.
> + * before/after the core-level reset routine. On a successful reset, done() will
> + * decrement group->recovery_cnt and restore domains. On a failure, recovery_cnt
> + * is left intact and the device stays blocked.
>    *
>    * Return: 0 on success or negative error code if the preparation failed.
>    *
> @@ -4000,6 +4003,9 @@ int pci_dev_reset_iommu_prepare(struct pci_dev *pdev)
>   
>   	if (gdev->reset_depth++)
>   		return 0;
> +	/* Device might be already blocked for a quarantine */
> +	if (gdev->blocked)
> +		return 0;
>   
>   	ret = __iommu_group_alloc_blocking_domain(group);
>   	if (ret)
> @@ -4047,18 +4053,22 @@ EXPORT_SYMBOL_GPL(pci_dev_reset_iommu_prepare);
>   /**
>    * pci_dev_reset_iommu_done() - Restore IOMMU after a PCI device reset is done
>    * @pdev: PCI device that has finished a reset routine
> + * @reset_succeeds: Whether the PCI device reset is successful or not
>    *
>    * After a PCIe device finishes a reset routine, it wants to restore its IOMMU
>    * activity, including new translation and cache invalidation, by re-attaching
>    * all RID/PASID of the device back to the domains retained in the core-level
>    * structure.
>    *
> - * Caller must pair it with a successful pci_dev_reset_iommu_prepare().
> + * This is a pairing function for pci_dev_reset_iommu_prepare(). Caller should
> + * pass in the reset state via @reset_succeeds. On a failed reset, the device
> + * remains blocked for a quarantine with the group->recovery_cnt intact, so as
> + * to protect system memory until a subsequent successful reset.
>    *
>    * Note that, although unlikely, there is a risk that re-attaching domains might
>    * fail due to some unexpected happening like OOM.
>    */
> -void pci_dev_reset_iommu_done(struct pci_dev *pdev)
> +void pci_dev_reset_iommu_done(struct pci_dev *pdev, bool reset_succeeds)
>   {
>   	struct iommu_group *group = pdev->dev.iommu_group;
>   	struct group_device *gdev;
> @@ -4083,6 +4093,18 @@ void pci_dev_reset_iommu_done(struct pci_dev *pdev)
>   	if (WARN_ON(!group->blocking_domain))
>   		return;
>   
> +	/*
> +	 * A reset failure implies that the device might be unreliable. E.g. its
> +	 * device cache might retain stale entries, which potentially results in
> +	 * memory corruption. Thus, do not unblock the device until a successful
> +	 * reset.
> +	 */
> +	if (!reset_succeeds) {
> +		pci_err(pdev,
> +			"Reset failed. Keep it blocked to protect memory\n");
> +		return;
> +	}

Nit: pci_dev_reset_iommu_done() does nothing if reset_succeeds is false.
Would it be better to handle this in the caller instead? Something like:

	if (reset_succeeds)
		pci_dev_reset_iommu_done(dev);

?

> +
>   	/* Re-attach RID domain back to group->domain */
>   	if (group->domain != group->blocking_domain) {
>   		WARN_ON(__iommu_attach_device(group->domain, &pdev->dev,

Thanks,
baolu

