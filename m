Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28653C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yHe8hDTcnmrj3XYpI0JJg5OnyNTAtTIKn+2wDEfePI=; b=l7KUd9PRE7BIolkilKtXEI9Qvk
	R/RrdvuBTbt8QyRnP/pOs9ZkhC+7tw+UhJGtdtQcv+3/HXO66hzGY+qBOZ7wzUiWpdYq2eEQ4RDd3
	XSVrnttBrAOKk2H6WgUs3l2YgPB5oQ/a5y8+yhQ1OfvnaiWNlg1gLXJ2MPuBIue3jQDrs6zDCmwAI
	kGjqCLzeXlJTNOQvpXwwqw9Ellh6w02M7ACmajYFC1w47M8bznrLaFkZNKjI96DJ87yBt28rBak8/
	mbr4kYv6r85yPl3A5+LNHj8yJf4orAVHfIKWxwmyPQiv70+b9Ulm2OeqJYps2ULwKobJ7gtvDht1i
	7y+EZ5XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjF9o-000000093g7-1LWi;
	Mon, 13 Jul 2026 11:49:08 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjF9m-000000093fZ-00iV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783943346; x=1815479346;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eWnSXz9Ty3uIb95SUsOqz5bA+W6Aati8Zka7C0DJr9A=;
  b=FAShgmN4Dq/L9I+jIE7JCxx1n+ziFNVdkPOQR4yJzfxGEDGGexdr84tv
   erQJxLpS8UkNk1albPkS+9Bueld5quiEX5oa8fLJj9atfxdH/hc66VDud
   gcvLxwma3e3E9JIMt1kUypWQSzZUGhOyH33TUot5ZFgaMlm/ttzb1urxk
   Y58ak9RTHsIphxrAK8FpklXxMj60RIOoK77t1TIMTKizXmoNV/bxbmmCJ
   tLYj7P0rzQdBB+aQ6QoLstkvIie07akQmOU6Fj0ailNq0I8eLmXOmNzHf
   4GZjefoB/TWXSuOwg2ip/6dMBWWqKd6QkB83JYj2MgUK2vsKWsvvRSOfE
   w==;
X-CSE-ConnectionGUID: 0PomCebUSSyz7OXP1FAe+A==
X-CSE-MsgGUID: 72C547xRRwu8NqtlA6+DSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95697225"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95697225"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 04:49:01 -0700
X-CSE-ConnectionGUID: N6iz91DlRpqeoIxV+DT4Zg==
X-CSE-MsgGUID: ySaEXyB2T7mvKjfyUTuDwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259834074"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.124.248.249]) ([10.124.248.249])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 04:48:56 -0700
Message-ID: <a24597bc-28ff-4b23-818c-f9126be3bbf9@linux.intel.com>
Date: Mon, 13 Jul 2026 19:48:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Pranjal Shrivastava <praan@google.com>,
 Mostafa Saleh <smostafa@google.com>, Kevin Tian <kevin.tian@intel.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, vsethi@nvidia.com,
 Shuai Xue <xueshuai@linux.alibaba.com>
Subject: Re: [PATCH v5 05/18] iommu: Pass in reset result to
 pci_dev_reset_iommu_done()
To: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.1783044582.git.nicolinc@nvidia.com>
 <9306670b5bd647e477e36156b124557917baead3.1783044582.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <9306670b5bd647e477e36156b124557917baead3.1783044582.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_044906_152029_ADCD3E38 
X-CRM114-Status: GOOD (  27.01  )
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

On 7/3/2026 12:06 PM, Nicolin Chen wrote:
> IOMMU drivers handle ATC cache maintenance. They may encounter ATC-related
> errors (e.g., ATC invalidation timeout), indicating that the ATC cache may
> have stale entries that can corrupt the memory. In this case, IOMMU driver
> has no choice but to block the device's ATS function and wait for a device
> recovery.
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
> Instead, pass in @reset_result to pci_dev_reset_iommu_done() from callers:
>      IOMMU blocks RID/ATS
>      pci_reset_function():
>          pci_dev_reset_iommu_prepare(); // Block RID/ATS
>          rc = __reset();
>          pci_dev_reset_iommu_done(rc); // Unblock or quarantine
> 
> On a successful reset, done() restores the device to its RID/PASID domains
> and decrements group->recovery_cnt. On failure, the device remains blocked,
> and concurrent domain attachment will be rejected until a successful reset.
> 
> Note: -ENOTTY is overloaded with different meanings by PCI reset functions.
> Some of them indicate "reset was not attempted", while others indicate "try
> the next reset method and the current method failed". IOMMU that must react
> these two outcomes separately has no choice but to keep the device blocked
> on -ENOTTY as well. Leave an inline FIXME and warning.
> 
> This introduces a new situation where a blocked device is being unplugged.
> Decrement the group->recovery_cnt accordingly.
> 
> Suggested-by: Kevin Tian<kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   include/linux/iommu.h  |  5 ++--
>   drivers/iommu/iommu.c  | 62 ++++++++++++++++++++++++++++++++++++++++--
>   drivers/pci/pci-acpi.c |  2 +-
>   drivers/pci/pci.c      | 10 +++----
>   drivers/pci/quirks.c   |  2 +-
>   5 files changed, 69 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index d20aa6f6863ab..59ea7e601a2d7 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -1224,7 +1224,7 @@ void iommu_free_global_pasid(ioasid_t pasid);
>   
>   /* PCI device reset functions */
>   int pci_dev_reset_iommu_prepare(struct pci_dev *pdev);
> -void pci_dev_reset_iommu_done(struct pci_dev *pdev);
> +void pci_dev_reset_iommu_done(struct pci_dev *pdev, int reset_result);
>   #else /* CONFIG_IOMMU_API */
>   
>   struct iommu_ops {};
> @@ -1554,7 +1554,8 @@ static inline int pci_dev_reset_iommu_prepare(struct pci_dev *pdev)
>   	return 0;
>   }
>   
> -static inline void pci_dev_reset_iommu_done(struct pci_dev *pdev)
> +static inline void pci_dev_reset_iommu_done(struct pci_dev *pdev,
> +					    int reset_result)
>   {
>   }
>   #endif /* CONFIG_IOMMU_API */
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 342e8a5ad628c..6e2e607de8d8f 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -76,6 +76,7 @@ struct iommu_group {
>   enum gdev_blocked {
>   	BLOCKED_NO = 0, /* Not blocked */
>   	BLOCKED_RESETTING, /* PCI reset in flight */
> +	BLOCKED_RESET_FAILED, /* PCI reset failed */
>   };
>   
>   struct group_device {
> @@ -762,6 +763,9 @@ static void __iommu_group_remove_device(struct device *dev)
>   		if (device->dev != dev)
>   			continue;
>   
> +		/* Must drop the recovery_cnt when removing a blocked device */
> +		if (device->blocked && !WARN_ON(group->recovery_cnt == 0))
> +			group->recovery_cnt--;

I feel that the change above is unrelated to the purpose of this patch.
It looks like an independent fix that belongs to a separate patch.

Otherwise, this looks good to me.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

