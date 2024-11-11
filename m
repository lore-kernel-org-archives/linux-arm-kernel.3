Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB6DD2E9C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 09:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFo0YqBn+/fL3GzqZiKvftbNQtTE0ziAQd6SgrrbE2g=; b=K6BZYBHk4EzolCzmuuGUREitCD
	cDXKNeDG28MbrNuelXgq4Cb61ImPSnvkHse1img67N5zmuMHr26PxdxoQBh8Y/QJgAJb0eAputcth
	JBnNwy3D+jqF1CyO5xUa9Cc9zjDV18CIpPtZLfheEkH0fskjoM2O7YoI1Krb30D0e/T8AjaYqX+wC
	6BveWLGaaRTPWAJxPsyCdYW+qixNKcw8h1K99o790aYZQk24Hd5kOSDjNOz0kFnQlR/zkjc812eva
	5FzJm6vhlf9jhpAruNd+pnSD3KU0Ue5YYkg304jV9uMGVIlbzikix0wEYRsvk9647FhBbIdEWhwOS
	2B1vqkKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQrI-0000000H7pM-2gPg;
	Mon, 11 Nov 2024 09:37:20 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQoz-0000000H7Ro-3M3C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 09:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731317698; x=1762853698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rUnm2FdY/OLS/8AxyOpljESVF9x1DK5QupuPhKyvdjk=;
  b=UbGgSy+2maJIPe/dtpm3asF3bRp0aCrRUC4AXrmCW9GcPFZlSLJuzkl6
   KwhddLO9vrMzJ7ML6b9d8rd2CnpnRjBByNuyN5nvUZG4WnOMXmL8Yc2xx
   UvL8xfrvRy1bKVOgfG+bJDWSa4xZYXAzXPHyaOHQHDHUF0F5NspFA8SSY
   nqZdVI0KjBSOpMBZDTfVfILM2YTakLVzG8UB2fjZgRcwE1LU5ktl4g9/i
   wCzeIHkCUU/3AwoUjEN36xsvr02ef9U466HqygCSbh3Z36YiWaVgPrlg4
   hW2M9smTf6EvIEH5HR21P4xJpnvt5U8OH6gsa6DFlSXw+XRA+GCgmzY0y
   g==;
X-CSE-ConnectionGUID: 7aShRMbLTqSuxKFm1xEjVw==
X-CSE-MsgGUID: U9lAvqXLQmOzQ4iFrY5ztA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41678018"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41678018"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:34:57 -0800
X-CSE-ConnectionGUID: 4iLhGHbyQTaH/HX0q8sZdQ==
X-CSE-MsgGUID: g/25x4VyTj+JOidQGT/xJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86951247"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:34:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAQop-0000000DXmm-2DTa;
	Mon, 11 Nov 2024 11:34:47 +0200
Date: Mon, 11 Nov 2024 11:34:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: maz@kernel.org, tglx@linutronix.de, bhelgaas@google.com,
	alex.williamson@redhat.com, jgg@nvidia.com, leonro@nvidia.com,
	shameerali.kolothum.thodi@huawei.com, robin.murphy@arm.com,
	dlemoal@kernel.org, kevin.tian@intel.com, smostafa@google.com,
	reinette.chatre@intel.com, eric.auger@redhat.com,
	ddutile@redhat.com, yebin10@huawei.com, brauner@kernel.org,
	apatel@ventanamicro.com, shivamurthy.shastri@linutronix.de,
	anna-maria@linutronix.de, nipun.gupta@amd.com,
	marek.vasut+renesas@mailbox.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFCv1 6/7] PCI/MSI: Add pci_alloc_irq_vectors_iovas helper
Message-ID: <ZzHPtwPdCehYyXWE@smile.fi.intel.com>
References: <cover.1731130093.git.nicolinc@nvidia.com>
 <e9399426b08b16efbdf7224c0122f5bf80f6d0ea.1731130093.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9399426b08b16efbdf7224c0122f5bf80f6d0ea.1731130093.git.nicolinc@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_013457_909939_F608DD69 
X-CRM114-Status: GOOD (  13.00  )
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

On Fri, Nov 08, 2024 at 09:48:51PM -0800, Nicolin Chen wrote:
> Now, the common __pci_alloc_irq_vectors() accepts an array of msi_iovas,
> which is a list of preset IOVAs for MSI doorbell addresses.
> 
> Add a helper that would pass in a list. A following patch will call this
> to forward msi_iovas from user space.

...

> +/**
> + * pci_alloc_irq_vectors_iovas() - Allocate multiple device interrupt
> + *                                 vectors with preset msi_iovas
> + * @dev:       the PCI device to operate on
> + * @min_vecs:  minimum required number of vectors (must be >= 1)
> + * @max_vecs:  maximum desired number of vectors
> + * @flags:     allocation flags, as in pci_alloc_irq_vectors()
> + * @msi_iovas: list of IOVAs for MSI between [min_vecs, max_vecs]
> + *
> + * Same as pci_alloc_irq_vectors(), but with the extra @msi_iovas parameter.
> + * Check that function docs, and &struct irq_affinity, for more details.
> + */

Always validate your kernel-doc descriptions

	scripts/kernel-doc -Wall -none -v ...

will give you a warning here.

-- 
With Best Regards,
Andy Shevchenko



