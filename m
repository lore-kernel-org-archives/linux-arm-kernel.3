Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39ACFCD0BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 06:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6xfAo223iai4XrJOG2g3U3nRO3cD+u3aZ+eWAjFRp4=; b=I3t+LXrPTUP0h5yo1ctYzSIfGq
	dED9BEm90gXWzjAKmqawQeRWndm0C3duadDbHG2xxiFKT04tzSAHP/WHfPb/ZhXE7juTG9P6QXZ0Q
	/gJ25yxYwYlwKcpXu/n8D/9emkiNyk0VBHY1Dz8zwcDdC1efJWFFqGLMUO89VzKSImr2lY2Xu1cEu
	S++QhV6N0EiPNdgsIrw6fHRfkgs9KQC7koLKRXn8xB4iue1v1BLzjDYKzuRYZNfEHd5XOYKv9yet3
	ZI7tlSKQEsJYd594qK3pyleiMxrOHxcDk9Iho0GeN4x5DcHl7/rBaXLCTx/c4OG3fQmujJFJr6uZ5
	5vf0fWCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kAc-00000007pwr-05qa;
	Wed, 18 Mar 2026 06:14:18 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2kAZ-00000007pwW-3tka
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 06:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773814456; x=1805350456;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DkHUnEo/Buc1iI8h0hzSm7QzwytPckEV+C7X+Kypm6E=;
  b=ThU7rf/f2bbXa3igaTn3wXXepU7XKFXrsrhXxtl9Uz3btRe1TMF9S/zM
   o+jKxEbKKf1VhIGkBtlBM5vpVuOoLiYRF0uaGG4WpI1FW1dgayx92/KQx
   bPyzHwtMsjaDvLWYelrcwK53CLAsavpcM4RXTgHp24o+//VwcakPsqv0X
   YHDJviOQ/Nv+ZvMco81+6iO0S2VLViXNTaLm1kk/gKB2Y/iKE39BIJP8M
   H1r9+mn+VO4HsH4frKefcI3tOikzTVCIdYbYx1bv+SHRBsuCKKweEXrrS
   l+5s0pJjTCf/6cgM94TgwO7CSnWUzm6LHfGnJ1Z/+3Y9wbDto751UVbvp
   w==;
X-CSE-ConnectionGUID: 07eUr4VrSSCbT1ezmoeQtA==
X-CSE-MsgGUID: vgjrmafmSTeKUHOfuFRlnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85494659"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="85494659"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 23:14:15 -0700
X-CSE-ConnectionGUID: Z1FGCetaTSGF++XIxaxXEg==
X-CSE-MsgGUID: iCZ0jeD2TnyuQZO6sIHcrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="222567515"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 23:14:11 -0700
Message-ID: <791a46c7-3129-4438-86bd-b7677e01332a@linux.intel.com>
Date: Wed, 18 Mar 2026 14:13:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] iommu: Add iommu_report_device_broken() to
 quarantine a broken device
To: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, bhelgaas@google.com, jgg@nvidia.com
Cc: rafael@kernel.org, lenb@kernel.org, praan@google.com,
 xueshuai@linux.alibaba.com, kevin.tian@intel.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, vsethi@nvidia.com
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <c5390aeaeccfa86a1c79f26d2c0ff5df380940a4.1773774441.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <c5390aeaeccfa86a1c79f26d2c0ff5df380940a4.1773774441.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_231416_009949_EE8806BD 
X-CRM114-Status: GOOD (  30.10  )
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
> However, the core-level states of the faulty device are out of sync, as the
> device can be still attached to a translation domain or even potentially be
> moved to a new domain that might overwrite the driver-level quarantine.
> 
> Given that such an error can be likely an ISR, introduce a broken_work per
> iommu_group, and add a helper function to allow driver to report the broken
> device, so as to completely quarantine it in the core.
> 
> Use the existing pci_dev_reset_iommu_prepare() function to shift the device
> to its resetting_domain/blocking_domain. A later pci_dev_reset_iommu_done()
> call will clear it and move it out of the quarantine.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   include/linux/iommu.h |  2 ++
>   drivers/iommu/iommu.c | 59 +++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 61 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 9ba12b2164724..9b5f94e566ff9 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -891,6 +891,8 @@ static inline struct iommu_device *__iommu_get_iommu_dev(struct device *dev)
>   #define iommu_get_iommu_dev(dev, type, member) \
>   	container_of(__iommu_get_iommu_dev(dev), type, member)
>   
> +void iommu_report_device_broken(struct device *dev);
> +
>   static inline void iommu_iotlb_gather_init(struct iommu_iotlb_gather *gather)
>   {
>   	*gather = (struct iommu_iotlb_gather) {
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index fcd2902d9e8db..2f297f689a3a3 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -55,6 +55,8 @@ struct iommu_group {
>   	struct list_head devices;
>   	struct xarray pasid_array;
>   	struct mutex mutex;
> +	struct work_struct broken_work;
> +	bool requires_reset;
>   	void *iommu_data;
>   	void (*iommu_data_release)(void *iommu_data);
>   	char *name;
> @@ -146,6 +148,7 @@ static struct group_device *iommu_group_alloc_device(struct iommu_group *group,
>   						     struct device *dev);
>   static void __iommu_group_free_device(struct iommu_group *group,
>   				      struct group_device *grp_dev);
> +static void iommu_group_broken_worker(struct work_struct *work);
>   static void iommu_domain_init(struct iommu_domain *domain, unsigned int type,
>   			      const struct iommu_ops *ops);
>   
> @@ -1057,6 +1060,7 @@ struct iommu_group *iommu_group_alloc(void)
>   	if (!group)
>   		return ERR_PTR(-ENOMEM);
>   
> +	INIT_WORK(&group->broken_work, iommu_group_broken_worker);
>   	group->kobj.kset = iommu_group_kset;
>   	mutex_init(&group->mutex);
>   	INIT_LIST_HEAD(&group->devices);
> @@ -4031,6 +4035,7 @@ void pci_dev_reset_iommu_done(struct pci_dev *pdev)
>   	if (WARN_ON(!group->blocking_domain))
>   		return;
>   
> +	WRITE_ONCE(group->requires_reset, false);
>   	/*
>   	 * A PCI device might have been in an error state, so the IOMMU driver
>   	 * had to quarantine the device by disabling specific hardware feature
> @@ -4062,6 +4067,60 @@ void pci_dev_reset_iommu_done(struct pci_dev *pdev)
>   }
>   EXPORT_SYMBOL_GPL(pci_dev_reset_iommu_done);
>   
> +static void iommu_group_broken_worker(struct work_struct *work)
> +{
> +	struct iommu_group *group =
> +		container_of(work, struct iommu_group, broken_work);
> +	struct pci_dev *pdev = NULL;
> +	struct device *dev;
> +
> +	scoped_guard(mutex, &group->mutex) {
> +		/* Do not block the device again if it has been recovered */
> +		if (!READ_ONCE(group->requires_reset))
> +			goto out_put;
> +		if (list_is_singular(&group->devices)) {
> +			/* Note: only support group with a single device */
> +			dev = iommu_group_first_dev(group);
> +			if (dev_is_pci(dev)) {
> +				pdev = to_pci_dev(dev);
> +				pci_dev_get(pdev);
> +			}
> +		}

The current mechanism is designed only for the PCIe devices within
singleton iommu groups. How about moving the above check to
iommu_report_device_broken() and emitting a message if it is called for
unsupported devices?

> +	}
> +
> +	if (pdev) {
> +		/*
> +		 * Quarantine the device completely. This will be cleared upon
> +		 * a pci_dev_reset_iommu_done() call indicating the recovery.
> +		 */
> +		pci_dev_lock(pdev);
> +		pci_dev_reset_iommu_prepare(pdev);
> +		pci_dev_unlock(pdev);
> +		pci_dev_put(pdev);
> +	}
> +out_put:
> +	iommu_group_put(group);
> +}
> +
> +void iommu_report_device_broken(struct device *dev)
> +{
> +	struct iommu_group *group = iommu_group_get(dev);
> +
> +	if (!group)
> +		return;
> +
> +	if (READ_ONCE(group->requires_reset)) {
> +		iommu_group_put(group);
> +		return;
> +	}
> +	WRITE_ONCE(group->requires_reset, true);
> +
> +	/* Put the group now or later in iommu_group_broken_worker() */
> +	if (!schedule_work(&group->broken_work))
> +		iommu_group_put(group);
> +}
> +EXPORT_SYMBOL_GPL(iommu_report_device_broken);
> +
>   #if IS_ENABLED(CONFIG_IRQ_MSI_IOMMU)
>   /**
>    * iommu_dma_prepare_msi() - Map the MSI page in the IOMMU domain

Thanks,
baolu

