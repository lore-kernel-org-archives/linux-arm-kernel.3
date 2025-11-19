Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1C0CF2564
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 03:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzbbqNOjaMCoSNXhnNqlwzWELHs61NmL1VsE2NMvDBI=; b=XTkUEBwK3w6xPbOgyJMy9gNAtd
	+JaqiW4fey2OJ3+jjuoB7PDfZmJAa2KGfAFmZby8tGwFBU0AAvGwhtU+DP2M5eR07YhqnkIbdnuNp
	wQt71vwrO6C3p/bLc0LpoEs1BTYgG9OeXcLMzK9BDJQx+CVuAHDJv/ERKXyAAbmpHyohX0OkKw6F7
	4PCOGPfR9R9zqLGgoxL+k7MKTtyA1ApJ2LzoDWxevWx2oipfbuelAjCSJOQt0UFnGEIZIEGSWqQbJ
	a7x+Tektbvwhc3RSaWZPwdxhZTS6jNoo49oL36ojsc8WAkr/3xyDA3q0rdWp05Xt2ITXl4ESU0oRN
	LGxyPrFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYU8-00000001RH7-242l;
	Wed, 19 Nov 2025 03:03:56 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYU6-00000001RGg-1oRv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 03:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763521434; x=1795057434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pXsZhuxxB+kI3KzL5qT6v5f2HxideVTv+RifgqSeoW0=;
  b=R3ZDrId2sUqQMHoeLkmnA4fU/gQivZBrwhBbMXswb5VRA/LGOALowebv
   SUv/wKK2R55C0egCE67FPnDmP4T7sh5zECKYCFt8jkeZlfScqK7MJURxi
   cQJYIbPdSk7sjIY0uJxYm6TYSEFx+X0cWNWBq/fJww/2L6Q52lbiRjVEy
   t1T3gL+KGE4JWdqRy9WiHU6d51hcOLDWKFUQH0y6zimUhBvNzsjtjaDKU
   04oLsIOPY/qKP8rRjJSBAlsPskdkgrfiq3iwpA82ybXpm0Ga8vekvVnqJ
   s5PQcS/EnGcnYGuco6r/zS+p2oJwK4XsRSygExuk1yuTWP2ZOqNmZZXrQ
   Q==;
X-CSE-ConnectionGUID: o6tMeosbRlmid+fDET4/Cw==
X-CSE-MsgGUID: bKj/V6XbRDqQF/fACk8DvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="83181391"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="83181391"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 19:03:54 -0800
X-CSE-ConnectionGUID: svX445uPT3aJVISNNc1eYg==
X-CSE-MsgGUID: ux192vFhRle5ZCI9piTKCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190200915"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Nov 2025 19:03:48 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLYTy-0002Nn-09;
	Wed, 19 Nov 2025 03:03:46 +0000
Date: Wed, 19 Nov 2025 11:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, robin.murphy@arm.com,
	joro@8bytes.org, afael@kernel.org, bhelgaas@google.com,
	alex@shazbot.org, jgg@nvidia.com, kevin.tian@intel.com
Cc: oe-kbuild-all@lists.linux.dev, will@kernel.org, lenb@kernel.org,
	baolu.lu@linux.intel.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev,
	pjaroszynski@nvidia.com, vsethi@nvidia.com, helgaas@kernel.org,
	etzhao1900@gmail.com
Subject: Re: [PATCH v6 5/5] PCI: Suspend iommu function prior to resetting a
 device
Message-ID: <202511191219.qIkZ1n2P-lkp@intel.com>
References: <9f6caaedc278fe057aacb813d94f44a93d8cab3c.1763512374.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f6caaedc278fe057aacb813d94f44a93d8cab3c.1763512374.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_190354_492169_314DA0BC 
X-CRM114-Status: GOOD (  16.43  )
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

Hi Nicolin,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251118]
[cannot apply to pci/next pci/for-linus awilliam-vfio/next awilliam-vfio/for-linus rafael-pm/linux-next rafael-pm/bleeding-edge linus/master v6.18-rc6 v6.18-rc5 v6.18-rc4 v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolin-Chen/iommu-Lock-group-mutex-in-iommu_deferred_attach/20251119-085721
base:   next-20251118
patch link:    https://lore.kernel.org/r/9f6caaedc278fe057aacb813d94f44a93d8cab3c.1763512374.git.nicolinc%40nvidia.com
patch subject: [PATCH v6 5/5] PCI: Suspend iommu function prior to resetting a device
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251119/202511191219.qIkZ1n2P-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191219.qIkZ1n2P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191219.qIkZ1n2P-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/pci.c: In function 'pcie_flr':
>> drivers/pci/pci.c:4341:43: error: passing argument 1 of 'pci_dev_reset_iommu_prepare' from incompatible pointer type [-Wincompatible-pointer-types]
    4341 |         ret = pci_dev_reset_iommu_prepare(dev);
         |                                           ^~~
         |                                           |
         |                                           struct pci_dev *
   In file included from drivers/pci/pci.c:16:
   include/linux/iommu.h:1519:62: note: expected 'struct device *' but argument is of type 'struct pci_dev *'
    1519 | static inline int pci_dev_reset_iommu_prepare(struct device *dev)
         |                                               ~~~~~~~~~~~~~~~^~~
>> drivers/pci/pci.c:4361:34: error: passing argument 1 of 'pci_dev_reset_iommu_done' from incompatible pointer type [-Wincompatible-pointer-types]
    4361 |         pci_dev_reset_iommu_done(dev);
         |                                  ^~~
         |                                  |
         |                                  struct pci_dev *
   include/linux/iommu.h:1524:60: note: expected 'struct device *' but argument is of type 'struct pci_dev *'
    1524 | static inline void pci_dev_reset_iommu_done(struct device *dev)
         |                                             ~~~~~~~~~~~~~~~^~~
   drivers/pci/pci.c: In function 'pci_af_flr':
   drivers/pci/pci.c:4418:43: error: passing argument 1 of 'pci_dev_reset_iommu_prepare' from incompatible pointer type [-Wincompatible-pointer-types]
    4418 |         ret = pci_dev_reset_iommu_prepare(dev);
         |                                           ^~~
         |                                           |
         |                                           struct pci_dev *
   include/linux/iommu.h:1519:62: note: expected 'struct device *' but argument is of type 'struct pci_dev *'
    1519 | static inline int pci_dev_reset_iommu_prepare(struct device *dev)
         |                                               ~~~~~~~~~~~~~~~^~~
   drivers/pci/pci.c:4439:34: error: passing argument 1 of 'pci_dev_reset_iommu_done' from incompatible pointer type [-Wincompatible-pointer-types]
    4439 |         pci_dev_reset_iommu_done(dev);
         |                                  ^~~
         |                                  |
         |                                  struct pci_dev *
   include/linux/iommu.h:1524:60: note: expected 'struct device *' but argument is of type 'struct pci_dev *'
    1524 | static inline void pci_dev_reset_iommu_done(struct device *dev)
         |                                             ~~~~~~~~~~~~~~~^~~
   drivers/pci/pci.c: In function 'pci_pm_reset':
   drivers/pci/pci.c:4476:43: error: passing argument 1 of 'pci_dev_reset_iommu_prepare' from incompatible pointer type [-Wincompatible-pointer-types]
    4476 |         ret = pci_dev_reset_iommu_prepare(dev);
         |                                           ^~~
         |                                           |
         |                                           struct pci_dev *
   include/linux/iommu.h:1519:62: note: expected 'struct device *' but argument is of type 'struct pci_dev *'
    1519 | static inline int pci_dev_reset_iommu_prepare(struct device *dev)
         |                                               ~~~~~~~~~~~~~~~^~~
   drivers/pci/pci.c:4493:34: error: passing argument 1 of 'pci_dev_reset_iommu_done' from incompatible pointer type [-Wincompatible-pointer-types]
    4493 |         pci_dev_reset_iommu_done(dev);
         |                                  ^~~
         |                                  |
         |                                  struct pci_dev *
   include/linux/iommu.h:1524:60: note: expected 'struct device *' but argument is of type 'struct pci_dev *'
    1524 | static inline void pci_dev_reset_iommu_done(struct device *dev)
         |                                             ~~~~~~~~~~~~~~~^~~
   drivers/pci/pci.c: In function 'pci_reset_bus_function':
   drivers/pci/pci.c:4922:42: error: passing argument 1 of 'pci_dev_reset_iommu_prepare' from incompatible pointer type [-Wincompatible-pointer-types]
    4922 |         rc = pci_dev_reset_iommu_prepare(dev);
         |                                          ^~~
         |                                          |
         |                                          struct pci_dev *
   include/linux/iommu.h:1519:62: note: expected 'struct device *' but argument is of type 'struct pci_dev *'
    1519 | static inline int pci_dev_reset_iommu_prepare(struct device *dev)
         |                                               ~~~~~~~~~~~~~~~^~~
   drivers/pci/pci.c:4934:34: error: passing argument 1 of 'pci_dev_reset_iommu_done' from incompatible pointer type [-Wincompatible-pointer-types]
    4934 |         pci_dev_reset_iommu_done(dev);
         |                                  ^~~
         |                                  |
         |                                  struct pci_dev *
   include/linux/iommu.h:1524:60: note: expected 'struct device *' but argument is of type 'struct pci_dev *'
    1524 | static inline void pci_dev_reset_iommu_done(struct device *dev)
         |                                             ~~~~~~~~~~~~~~~^~~
   drivers/pci/pci.c: In function 'cxl_reset_bus_function':
   drivers/pci/pci.c:4959:42: error: passing argument 1 of 'pci_dev_reset_iommu_prepare' from incompatible pointer type [-Wincompatible-pointer-types]
    4959 |         rc = pci_dev_reset_iommu_prepare(dev);
         |                                          ^~~
         |                                          |
         |                                          struct pci_dev *
   include/linux/iommu.h:1519:62: note: expected 'struct device *' but argument is of type 'struct pci_dev *'
    1519 | static inline int pci_dev_reset_iommu_prepare(struct device *dev)
         |                                               ~~~~~~~~~~~~~~~^~~
   drivers/pci/pci.c:4979:34: error: passing argument 1 of 'pci_dev_reset_iommu_done' from incompatible pointer type [-Wincompatible-pointer-types]
    4979 |         pci_dev_reset_iommu_done(dev);
         |                                  ^~~
         |                                  |
         |                                  struct pci_dev *
   include/linux/iommu.h:1524:60: note: expected 'struct device *' but argument is of type 'struct pci_dev *'
    1524 | static inline void pci_dev_reset_iommu_done(struct device *dev)
         |                                             ~~~~~~~~~~~~~~~^~~
--
   drivers/pci/quirks.c: In function '__pci_dev_specific_reset':
>> drivers/pci/quirks.c:4237:43: error: passing argument 1 of 'pci_dev_reset_iommu_prepare' from incompatible pointer type [-Wincompatible-pointer-types]
    4237 |         ret = pci_dev_reset_iommu_prepare(dev);
         |                                           ^~~
         |                                           |
         |                                           struct pci_dev *
   In file included from drivers/pci/quirks.c:24:
   include/linux/iommu.h:1519:62: note: expected 'struct device *' but argument is of type 'struct pci_dev *'
    1519 | static inline int pci_dev_reset_iommu_prepare(struct device *dev)
         |                                               ~~~~~~~~~~~~~~~^~~
>> drivers/pci/quirks.c:4244:34: error: passing argument 1 of 'pci_dev_reset_iommu_done' from incompatible pointer type [-Wincompatible-pointer-types]
    4244 |         pci_dev_reset_iommu_done(dev);
         |                                  ^~~
         |                                  |
         |                                  struct pci_dev *
   include/linux/iommu.h:1524:60: note: expected 'struct device *' but argument is of type 'struct pci_dev *'
    1524 | static inline void pci_dev_reset_iommu_done(struct device *dev)
         |                                             ~~~~~~~~~~~~~~~^~~


vim +/pci_dev_reset_iommu_prepare +4341 drivers/pci/pci.c

  4325	
  4326	/**
  4327	 * pcie_flr - initiate a PCIe function level reset
  4328	 * @dev: device to reset
  4329	 *
  4330	 * Initiate a function level reset unconditionally on @dev without
  4331	 * checking any flags and DEVCAP
  4332	 */
  4333	int pcie_flr(struct pci_dev *dev)
  4334	{
  4335		int ret;
  4336	
  4337		if (!pci_wait_for_pending_transaction(dev))
  4338			pci_err(dev, "timed out waiting for pending transaction; performing function level reset anyway\n");
  4339	
  4340		/* Have to call it after waiting for pending DMA transaction */
> 4341		ret = pci_dev_reset_iommu_prepare(dev);
  4342		if (ret) {
  4343			pci_err(dev, "failed to stop IOMMU for a PCI reset: %d\n", ret);
  4344			return ret;
  4345		}
  4346	
  4347		pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_DEVCTL_BCR_FLR);
  4348	
  4349		if (dev->imm_ready)
  4350			goto done;
  4351	
  4352		/*
  4353		 * Per PCIe r4.0, sec 6.6.2, a device must complete an FLR within
  4354		 * 100ms, but may silently discard requests while the FLR is in
  4355		 * progress.  Wait 100ms before trying to access the device.
  4356		 */
  4357		msleep(100);
  4358	
  4359		ret = pci_dev_wait(dev, "FLR", PCIE_RESET_READY_POLL_MS);
  4360	done:
> 4361		pci_dev_reset_iommu_done(dev);
  4362		return ret;
  4363	}
  4364	EXPORT_SYMBOL_GPL(pcie_flr);
  4365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

