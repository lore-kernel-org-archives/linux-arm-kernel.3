Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50A4D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 19:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZ6xvBl0Zywo6aL2LLn8TZxnquREJdfFXToeuegNBtk=; b=DatoaA0IflSUne4ZdD2mYu/goi
	65S/iwHwbHd7v95Uh0QdhJAg2d5snhozFYEV7aI5ivgi7Gue6NBreKU8vytaA9bFM2aIfjDqsYpIZ
	iZPSuKbrzLZkf2z7lfM9Fpcr9sb+p8qRi08fohD8/W4klyu0uqbwcTf094KNDQ4VBKYp0IV7MW77J
	Cb5xuTIKecVrD/EwlgexF7UfOd17ALClAx+oIZ1Sq1PAthvvTqn/DJgpn3FugmjGZ80X6iulINVSl
	LjVfFtMA64gDyiDNhI00t9wfSvW2iArFiV8pXZIZr/7uDaCYze3Z+3K+n7X1MgH9+kLUv1XpnYI4w
	GyRr/9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSh9T-0000000DTmm-3RR8;
	Mon, 08 Dec 2025 19:44:07 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSh9Q-0000000DTm7-30QS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 19:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765223045; x=1796759045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3ipuuZGft/S8N19xrr05kuT8U40MNWLgd1x0A0Em+OA=;
  b=LRJl+H4F37v+q66RlJ0PyASxPHS7ml7oq6s+ZfL88A273fihsBpYHJM2
   Iq4qoIOIOMyeDJ8AHqVFihJCtj3hvtx6TSG+EjgsdlhOzHwFu/FvYxGsh
   Sy1WS/ObWvSaIg9GgoV0wAq2/NVI1OgBHM9JakmxDVgn/Rao7M4eMv8Ap
   Bdyz1Zv0QZ1pIjvsdrKeM+QRjqynCx+4h7c9tCtyVtzgc33DJR6MUr3aD
   kQRYrjSMui3UUKt1uM9CZIGQlvH999r6G6FEe5KqQyqLxFnpDzu5pBU7q
   x2HyoFZhbw/1/0vmzgOG/fV00wY40DktdfI4twgJewUtrv/Eoeh2jIUM9
   Q==;
X-CSE-ConnectionGUID: 89zkwsmESbuJXflNx31K7w==
X-CSE-MsgGUID: kGOqc3ZGQ7udhAzZxgYusQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="54714118"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="54714118"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 11:44:04 -0800
X-CSE-ConnectionGUID: n+XSjhiORGCFX38P4L/tgg==
X-CSE-MsgGUID: NGCiOOtnRBmB7MoDx7MLow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="195921748"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Dec 2025 11:44:01 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSh9K-000000000mj-0dfK;
	Mon, 08 Dec 2025 19:43:58 +0000
Date: Tue, 9 Dec 2025 03:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ashish Mhetre <amhetre@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, nicolinc@nvidia.com
Cc: oe-kbuild-all@lists.linux.dev, thierry.reding@gmail.com,
	jonathanh@nvidia.com, vdumpa@nvidia.com, jgg@ziepe.ca,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, Ashish Mhetre <amhetre@nvidia.com>
Subject: Re: [PATCH V4 1/3] iommu/arm-smmu-v3: Add device-tree support for
 CMDQV driver
Message-ID: <202512090331.QAFgb6vQ-lkp@intel.com>
References: <20251205065850.3841834-2-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205065850.3841834-2-amhetre@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_114404_767986_11BAA5D1 
X-CRM114-Status: GOOD (  14.12  )
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

Hi Ashish,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20251204]
[also build test WARNING on v6.18]
[cannot apply to robh/for-next linus/master v6.18 v6.18-rc7 v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ashish-Mhetre/iommu-arm-smmu-v3-Add-device-tree-support-for-CMDQV-driver/20251205-151258
base:   next-20251204
patch link:    https://lore.kernel.org/r/20251205065850.3841834-2-amhetre%40nvidia.com
patch subject: [PATCH V4 1/3] iommu/arm-smmu-v3: Add device-tree support for CMDQV driver
config: arm64-randconfig-004-20251209 (https://download.01.org/0day-ci/archive/20251209/202512090331.QAFgb6vQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090331.QAFgb6vQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090331.QAFgb6vQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c: In function 'tegra241_cmdqv_acpi_is_memory':
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:863:17: error: implicit declaration of function 'acpi_dev_resource_address_space' [-Werror=implicit-function-declaration]
     863 |         return !acpi_dev_resource_address_space(res, &win);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c: In function 'tegra241_cmdqv_acpi_get_irqs':
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:871:26: error: implicit declaration of function 'acpi_dev_resource_interrupt' [-Werror=implicit-function-declaration]
     871 |         if (*irq <= 0 && acpi_dev_resource_interrupt(ares, 0, &r))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c: In function 'tegra241_cmdqv_find_acpi_resource':
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:879:36: error: implicit declaration of function 'to_acpi_device'; did you mean 'to_acpi_device_node'? [-Werror=implicit-function-declaration]
     879 |         struct acpi_device *adev = to_acpi_device(dev);
         |                                    ^~~~~~~~~~~~~~
         |                                    to_acpi_device_node
>> drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:879:36: warning: initialization of 'struct acpi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:886:15: error: implicit declaration of function 'acpi_dev_get_resources'; did you mean 'acpi_get_event_resources'? [-Werror=implicit-function-declaration]
     886 |         ret = acpi_dev_get_resources(adev, &resource_list,
         |               ^~~~~~~~~~~~~~~~~~~~~~
         |               acpi_get_event_resources
   drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:907:9: error: implicit declaration of function 'acpi_dev_free_resource_list' [-Werror=implicit-function-declaration]
     907 |         acpi_dev_free_resource_list(&resource_list);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +879 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c

918eb5c856f6ce Nate Watterson 2024-08-29  875  
918eb5c856f6ce Nate Watterson 2024-08-29  876  static struct resource *
918eb5c856f6ce Nate Watterson 2024-08-29  877  tegra241_cmdqv_find_acpi_resource(struct device *dev, int *irq)
918eb5c856f6ce Nate Watterson 2024-08-29  878  {
918eb5c856f6ce Nate Watterson 2024-08-29 @879  	struct acpi_device *adev = to_acpi_device(dev);
918eb5c856f6ce Nate Watterson 2024-08-29  880  	struct list_head resource_list;
918eb5c856f6ce Nate Watterson 2024-08-29  881  	struct resource_entry *rentry;
918eb5c856f6ce Nate Watterson 2024-08-29  882  	struct resource *res = NULL;
918eb5c856f6ce Nate Watterson 2024-08-29  883  	int ret;
918eb5c856f6ce Nate Watterson 2024-08-29  884  
918eb5c856f6ce Nate Watterson 2024-08-29  885  	INIT_LIST_HEAD(&resource_list);
918eb5c856f6ce Nate Watterson 2024-08-29  886  	ret = acpi_dev_get_resources(adev, &resource_list,
918eb5c856f6ce Nate Watterson 2024-08-29  887  				     tegra241_cmdqv_acpi_is_memory, NULL);
918eb5c856f6ce Nate Watterson 2024-08-29  888  	if (ret < 0) {
918eb5c856f6ce Nate Watterson 2024-08-29  889  		dev_err(dev, "failed to get memory resource: %d\n", ret);
918eb5c856f6ce Nate Watterson 2024-08-29  890  		return NULL;
918eb5c856f6ce Nate Watterson 2024-08-29  891  	}
918eb5c856f6ce Nate Watterson 2024-08-29  892  
918eb5c856f6ce Nate Watterson 2024-08-29  893  	rentry = list_first_entry_or_null(&resource_list,
918eb5c856f6ce Nate Watterson 2024-08-29  894  					  struct resource_entry, node);
918eb5c856f6ce Nate Watterson 2024-08-29  895  	if (!rentry) {
918eb5c856f6ce Nate Watterson 2024-08-29  896  		dev_err(dev, "failed to get memory resource entry\n");
918eb5c856f6ce Nate Watterson 2024-08-29  897  		goto free_list;
918eb5c856f6ce Nate Watterson 2024-08-29  898  	}
918eb5c856f6ce Nate Watterson 2024-08-29  899  
918eb5c856f6ce Nate Watterson 2024-08-29  900  	/* Caller must free the res */
918eb5c856f6ce Nate Watterson 2024-08-29  901  	res = kzalloc(sizeof(*res), GFP_KERNEL);
918eb5c856f6ce Nate Watterson 2024-08-29  902  	if (!res)
918eb5c856f6ce Nate Watterson 2024-08-29  903  		goto free_list;
918eb5c856f6ce Nate Watterson 2024-08-29  904  
918eb5c856f6ce Nate Watterson 2024-08-29  905  	*res = *rentry->res;
918eb5c856f6ce Nate Watterson 2024-08-29  906  
918eb5c856f6ce Nate Watterson 2024-08-29  907  	acpi_dev_free_resource_list(&resource_list);
918eb5c856f6ce Nate Watterson 2024-08-29  908  
918eb5c856f6ce Nate Watterson 2024-08-29  909  	INIT_LIST_HEAD(&resource_list);
918eb5c856f6ce Nate Watterson 2024-08-29  910  
918eb5c856f6ce Nate Watterson 2024-08-29  911  	if (irq)
918eb5c856f6ce Nate Watterson 2024-08-29  912  		ret = acpi_dev_get_resources(adev, &resource_list,
918eb5c856f6ce Nate Watterson 2024-08-29  913  					     tegra241_cmdqv_acpi_get_irqs, irq);
918eb5c856f6ce Nate Watterson 2024-08-29  914  	if (ret < 0 || !irq || *irq <= 0)
918eb5c856f6ce Nate Watterson 2024-08-29  915  		dev_warn(dev, "no interrupt. errors will not be reported\n");
918eb5c856f6ce Nate Watterson 2024-08-29  916  
918eb5c856f6ce Nate Watterson 2024-08-29  917  free_list:
918eb5c856f6ce Nate Watterson 2024-08-29  918  	acpi_dev_free_resource_list(&resource_list);
918eb5c856f6ce Nate Watterson 2024-08-29  919  	return res;
918eb5c856f6ce Nate Watterson 2024-08-29  920  }
918eb5c856f6ce Nate Watterson 2024-08-29  921  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

