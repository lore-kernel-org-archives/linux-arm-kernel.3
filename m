Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B102FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 06:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZHnWZFgQYqUXGntsY1dde3lweX10vSlBdYe5GMqweQ=; b=z2QyXMdDcs33obN588wU4xXYoS
	JJn3FaWEeMjxkY6b3N3vghpq9uikcbeQNB5qN63O4fRilW1KRjYZ5MB89y28xlRE0eJaN1zBnRK85
	dPogMVW1Kh9iMjJOv/vUv/j8n2q3tXr4rd1+kln0Ftaymp0RbHLS50WBfQZrJIkcU4Kx630zVfrAR
	WPCqAWnH6TkpcxuX4Pb5w4heq+c/5KzQ2RrCk0brtxck4vX2tbIG+3Ge7zBcdL2nlEH8xYqqN4GY3
	q8SBLBwgOtcJprDHweZIhxaJtxedf/3A1mlU8mSffcpD0yZ1Y2cqANqevwvs/6ncSXC8gVPTQhQrX
	udYQPhUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ4FJ-00000008BnO-08Hn;
	Wed, 12 Nov 2025 06:22:21 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ4FF-00000008BmZ-3hZm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 06:22:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762928538; x=1794464538;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WUP1kjvtR8UUXkZWolJKlxqm2Abil0rICQsZg+E7nCk=;
  b=G7sggNKQvZqpNL2ZNzIbe6HCFX45B3iIqul1noLGtk3dM1/2MY852cDI
   8yF8t1o906PBLeUVZ3Pg+qLIcbzVlYQguA3RQbzZuiYELQzuuZHhcRpyi
   I8yYG84MgMWhwTBtKwlAEVOfwuIri7WB79s9+utt5M/9657WNLbnj3Vlq
   S23tAGCNBp9ggYA2R9LusYv3SmY6zyqAMHmTyNI0Hgat9U2UXDXPl/XLn
   rUib31ZV32L13PgvkOwF3/zbWw/KZ/vSbBNOO/riVCeND5NGQt2XroJpQ
   54AizYZuuW32k6dwaltMrTgsprJfDnf3WTXUpZuGC781gNBDWDZC/4PRq
   Q==;
X-CSE-ConnectionGUID: WrkVEkVFS5GvWtcEzrgXUA==
X-CSE-MsgGUID: 5mHuiw79RjiX+lRd1BMnOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="82383159"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="82383159"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 22:22:17 -0800
X-CSE-ConnectionGUID: bunbCrviTPWIJPn1B3GT+g==
X-CSE-MsgGUID: jeGtRGzFRRCq22mROzCv+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="189106120"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 22:22:12 -0800
Message-ID: <60970315-613f-4e62-8923-e162c29d9362@linux.intel.com>
Date: Wed, 12 Nov 2025 14:18:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] iommu: Introduce iommu_dev_reset_prepare() and
 iommu_dev_reset_done()
To: Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org, afael@kernel.org,
 bhelgaas@google.com, alex@shazbot.org, jgg@nvidia.com, kevin.tian@intel.com
Cc: will@kernel.org, robin.murphy@arm.com, lenb@kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org, patches@lists.linux.dev,
 pjaroszynski@nvidia.com, vsethi@nvidia.com, helgaas@kernel.org,
 etzhao1900@gmail.com
References: <cover.1762835355.git.nicolinc@nvidia.com>
 <28af027371a981a2b4154633e12cdb1e5a11da4a.1762835355.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <28af027371a981a2b4154633e12cdb1e5a11da4a.1762835355.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_222217_973197_1273A1FF 
X-CRM114-Status: GOOD (  23.05  )
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

On 11/11/25 13:12, Nicolin Chen wrote:
> +/**
> + * iommu_dev_reset_prepare() - Block IOMMU to prepare for a device reset
> + * @dev: device that is going to enter a reset routine
> + *
> + * When certain device is entering a reset routine, it wants to block any IOMMU
> + * activity during the reset routine. This includes blocking any translation as
> + * well as cache invalidation (especially the device cache).
> + *
> + * This function attaches all RID/PASID of the device's to IOMMU_DOMAIN_BLOCKED
> + * allowing any blocked-domain-supporting IOMMU driver to pause translation and
> + * cahce invalidation, but leaves the software domain pointers intact so later
> + * the iommu_dev_reset_done() can restore everything.
> + *
> + * Return: 0 on success or negative error code if the preparation failed.
> + *
> + * Caller must use iommu_dev_reset_prepare() and iommu_dev_reset_done() together
> + * before/after the core-level reset routine, to unset the resetting_domain.
> + *
> + * These two functions are designed to be used by PCI reset functions that would
> + * not invoke any racy iommu_release_device(), since PCI sysfs node gets removed
> + * before it notifies with a BUS_NOTIFY_REMOVED_DEVICE. When using them in other
> + * case, callers must ensure there will be no racy iommu_release_device() call,
> + * which otherwise would UAF the dev->iommu_group pointer.
> + */
> +int iommu_dev_reset_prepare(struct device *dev)
> +{
> +	struct iommu_group *group = dev->iommu_group;
> +	unsigned long pasid;
> +	void *entry;
> +	int ret = 0;
> +
> +	if (!dev_has_iommu(dev))
> +		return 0;

Nit: This interface is only for PCI layer, so why not just

	if (WARN_ON(!dev_is_pci(dev)))
		return -EINVAL;
?
> +
> +	guard(mutex)(&group->mutex);
> +
> +	/*
> +	 * Once the resetting_domain is set, any concurrent attachment to this
> +	 * iommu_group will be rejected, which would break the attach routines
> +	 * of the sibling devices in the same iommu_group. So, skip this case.
> +	 */
> +	if (dev_is_pci(dev)) {
> +		struct group_device *gdev;
> +
> +		for_each_group_device(group, gdev) {
> +			if (gdev->dev != dev)
> +				return 0;
> +		}
> +	}

With above dev_is_pci() check, here it can simply be,

	if (list_count_nodes(&group->devices) != 1)
		return 0;		

> +
> +	/* Re-entry is not allowed */
> +	if (WARN_ON(group->resetting_domain))
> +		return -EBUSY;
> +
> +	ret = __iommu_group_alloc_blocking_domain(group);
> +	if (ret)
> +		return ret;
> +
> +	/* Stage RID domain at blocking_domain while retaining group->domain */
> +	if (group->domain != group->blocking_domain) {
> +		ret = __iommu_attach_device(group->blocking_domain, dev,
> +					    group->domain);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/*
> +	 * Stage PASID domains at blocking_domain while retaining pasid_array.
> +	 *
> +	 * The pasid_array is mostly fenced by group->mutex, except one reader
> +	 * in iommu_attach_handle_get(), so it's safe to read without xa_lock.
> +	 */
> +	xa_for_each_start(&group->pasid_array, pasid, entry, 1)
> +		iommu_remove_dev_pasid(dev, pasid,
> +				       pasid_array_entry_to_domain(entry));
> +
> +	group->resetting_domain = group->blocking_domain;
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(iommu_dev_reset_prepare);
> +
> +/**
> + * iommu_dev_reset_done() - Restore IOMMU after a device reset is finished
> + * @dev: device that has finished a reset routine
> + *
> + * When certain device has finished a reset routine, it wants to restore its
> + * IOMMU activity, including new translation as well as cache invalidation, by
> + * re-attaching all RID/PASID of the device's back to the domains retained in
> + * the core-level structure.
> + *
> + * Caller must pair it with a successfully returned iommu_dev_reset_prepare().
> + *
> + * Note that, although unlikely, there is a risk that re-attaching domains might
> + * fail due to some unexpected happening like OOM.
> + */
> +void iommu_dev_reset_done(struct device *dev)
> +{
> +	struct iommu_group *group = dev->iommu_group;
> +	unsigned long pasid;
> +	void *entry;
> +
> +	if (!dev_has_iommu(dev))
> +		return;
> +
> +	guard(mutex)(&group->mutex);
> +
> +	/* iommu_dev_reset_prepare() was bypassed for the device */
> +	if (!group->resetting_domain)
> +		return;
> +
> +	/* iommu_dev_reset_prepare() was not successfully called */
> +	if (WARN_ON(!group->blocking_domain))
> +		return;
> +
> +	/* Re-attach RID domain back to group->domain */
> +	if (group->domain != group->blocking_domain) {
> +		WARN_ON(__iommu_attach_device(group->domain, dev,
> +					      group->blocking_domain));
> +	}
> +
> +	/*
> +	 * Re-attach PASID domains back to the domains retained in pasid_array.
> +	 *
> +	 * The pasid_array is mostly fenced by group->mutex, except one reader
> +	 * in iommu_attach_handle_get(), so it's safe to read without xa_lock.
> +	 */
> +	xa_for_each_start(&group->pasid_array, pasid, entry, 1)
> +		WARN_ON(__iommu_set_group_pasid(
> +			pasid_array_entry_to_domain(entry), group, pasid,
> +			group->blocking_domain));
> +
> +	group->resetting_domain = NULL;
> +}
> +EXPORT_SYMBOL_GPL(iommu_dev_reset_done);
> +
>   #if IS_ENABLED(CONFIG_IRQ_MSI_IOMMU)
>   /**
>    * iommu_dma_prepare_msi() - Map the MSI page in the IOMMU domain

Thanks,
baolu

