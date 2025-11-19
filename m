Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7873BCEE35E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 02:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKF5sfHV8qLoygWH+vggxh8+ykBArCENYq2WO00HwSc=; b=X3Z+3dlcU8QDP0qGZQbkMvLBI+
	Fl2zu3Zg1Q/j1suKwStSPVeJgU7Z/lowFqdrgR2Va21dPvdOtAPwUHuxChQ7DAP98ulj/7Sg9BUQ9
	cDYC3lOIeAKRBmpadsed4T8TlBxujS3+9KG39UzUMagSDjowz8ZjRWGk2mbC0jnUKo1bGNa9kOchY
	pMWQfUToV4K+hFdekV0OKP3tZ9TgXdiRflzTAoLfRyer5j3/6ep8TND8Z8yWlvHf0qnPDZZkc4rW3
	lhdKY1XYjdXvasWTmeACCkZk0TxZcNueh4KkamFG5SJrQO2oZ2Nij2/h/VGwzefoPxr5hPPCP1fVm
	WzOLmawA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLXyA-00000001OQZ-1OBH;
	Wed, 19 Nov 2025 02:30:54 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLXy7-00000001OQB-3FWw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 02:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763519451; x=1795055451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JbgYqJmxAL5gcFdKRLrhRdlqGMIuGzVFsUJ/BShX3xU=;
  b=eeZ26/G+tzVaNEMkB4MM8Ac/D4wDXtJMyJUHzfg9BGIblyEm4/Db7pGA
   PkHc1fYYykyyRcCLm9irT5J9XRJhNfXZxKP80osuRK6QgKvGvTzLR5yvr
   990CD+TONLlxxbTnm2RB1HWJfuUsq6B+yrrh1yRAxupitgXtF40bVoVPz
   HCP4EMaz0FMUffP+GOqzCtioCz3Scjt/4pEaydi8puAq/FGBXb0zqyUHD
   xu9uKzKKsWUI6pSCqq4+Kw925XswvwwJCoAmE7KByw7ErSQvPMa5nvdQr
   WRYZOIN65YNa9H5ZnHrIxDoR5COIoYgy7fSq8ET7dpBvaJdUjUidTdnUd
   Q==;
X-CSE-ConnectionGUID: EoKxafBIRnmiDHhhBFUAEA==
X-CSE-MsgGUID: YbDrPuo3Q+e5TlCflqIS/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="77012163"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="77012163"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:30:50 -0800
X-CSE-ConnectionGUID: M+HTTEv+TZ699Y6u4qkS1w==
X-CSE-MsgGUID: qn9gjqNIT9Wbu6YaVNIlXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="228266107"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Nov 2025 18:30:46 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLXxy-0002Mh-33;
	Wed, 19 Nov 2025 02:30:42 +0000
Date: Wed, 19 Nov 2025 10:29:43 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, robin.murphy@arm.com,
	joro@8bytes.org, afael@kernel.org, bhelgaas@google.com,
	alex@shazbot.org, jgg@nvidia.com, kevin.tian@intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, will@kernel.org,
	lenb@kernel.org, baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org,
	patches@lists.linux.dev, pjaroszynski@nvidia.com, vsethi@nvidia.com,
	helgaas@kernel.org, etzhao1900@gmail.com
Subject: Re: [PATCH v6 5/5] PCI: Suspend iommu function prior to resetting a
 device
Message-ID: <202511191020.OczvlCww-lkp@intel.com>
References: <9f6caaedc278fe057aacb813d94f44a93d8cab3c.1763512374.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f6caaedc278fe057aacb813d94f44a93d8cab3c.1763512374.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_183051_895429_209DE98B 
X-CRM114-Status: GOOD (  14.53  )
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
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251119/202511191020.OczvlCww-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191020.OczvlCww-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191020.OczvlCww-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/pci.c:4341:36: error: incompatible pointer types passing 'struct pci_dev *' to parameter of type 'struct device *' [-Wincompatible-pointer-types]
    4341 |         ret = pci_dev_reset_iommu_prepare(dev);
         |                                           ^~~
   include/linux/iommu.h:1519:62: note: passing argument to parameter 'dev' here
    1519 | static inline int pci_dev_reset_iommu_prepare(struct device *dev)
         |                                                              ^
   drivers/pci/pci.c:4361:27: error: incompatible pointer types passing 'struct pci_dev *' to parameter of type 'struct device *' [-Wincompatible-pointer-types]
    4361 |         pci_dev_reset_iommu_done(dev);
         |                                  ^~~
   include/linux/iommu.h:1524:60: note: passing argument to parameter 'dev' here
    1524 | static inline void pci_dev_reset_iommu_done(struct device *dev)
         |                                                            ^
   drivers/pci/pci.c:4418:36: error: incompatible pointer types passing 'struct pci_dev *' to parameter of type 'struct device *' [-Wincompatible-pointer-types]
    4418 |         ret = pci_dev_reset_iommu_prepare(dev);
         |                                           ^~~
   include/linux/iommu.h:1519:62: note: passing argument to parameter 'dev' here
    1519 | static inline int pci_dev_reset_iommu_prepare(struct device *dev)
         |                                                              ^
   drivers/pci/pci.c:4439:27: error: incompatible pointer types passing 'struct pci_dev *' to parameter of type 'struct device *' [-Wincompatible-pointer-types]
    4439 |         pci_dev_reset_iommu_done(dev);
         |                                  ^~~
   include/linux/iommu.h:1524:60: note: passing argument to parameter 'dev' here
    1524 | static inline void pci_dev_reset_iommu_done(struct device *dev)
         |                                                            ^
   drivers/pci/pci.c:4476:36: error: incompatible pointer types passing 'struct pci_dev *' to parameter of type 'struct device *' [-Wincompatible-pointer-types]
    4476 |         ret = pci_dev_reset_iommu_prepare(dev);
         |                                           ^~~
   include/linux/iommu.h:1519:62: note: passing argument to parameter 'dev' here
    1519 | static inline int pci_dev_reset_iommu_prepare(struct device *dev)
         |                                                              ^
   drivers/pci/pci.c:4493:27: error: incompatible pointer types passing 'struct pci_dev *' to parameter of type 'struct device *' [-Wincompatible-pointer-types]
    4493 |         pci_dev_reset_iommu_done(dev);
         |                                  ^~~
   include/linux/iommu.h:1524:60: note: passing argument to parameter 'dev' here
    1524 | static inline void pci_dev_reset_iommu_done(struct device *dev)
         |                                                            ^
   drivers/pci/pci.c:4922:35: error: incompatible pointer types passing 'struct pci_dev *' to parameter of type 'struct device *' [-Wincompatible-pointer-types]
    4922 |         rc = pci_dev_reset_iommu_prepare(dev);
         |                                          ^~~
   include/linux/iommu.h:1519:62: note: passing argument to parameter 'dev' here
    1519 | static inline int pci_dev_reset_iommu_prepare(struct device *dev)
         |                                                              ^
   drivers/pci/pci.c:4934:27: error: incompatible pointer types passing 'struct pci_dev *' to parameter of type 'struct device *' [-Wincompatible-pointer-types]
    4934 |         pci_dev_reset_iommu_done(dev);
         |                                  ^~~
   include/linux/iommu.h:1524:60: note: passing argument to parameter 'dev' here
    1524 | static inline void pci_dev_reset_iommu_done(struct device *dev)
         |                                                            ^
   drivers/pci/pci.c:4959:35: error: incompatible pointer types passing 'struct pci_dev *' to parameter of type 'struct device *' [-Wincompatible-pointer-types]
    4959 |         rc = pci_dev_reset_iommu_prepare(dev);
         |                                          ^~~
   include/linux/iommu.h:1519:62: note: passing argument to parameter 'dev' here
    1519 | static inline int pci_dev_reset_iommu_prepare(struct device *dev)
         |                                                              ^
   drivers/pci/pci.c:4979:27: error: incompatible pointer types passing 'struct pci_dev *' to parameter of type 'struct device *' [-Wincompatible-pointer-types]
    4979 |         pci_dev_reset_iommu_done(dev);
         |                                  ^~~
   include/linux/iommu.h:1524:60: note: passing argument to parameter 'dev' here
    1524 | static inline void pci_dev_reset_iommu_done(struct device *dev)
         |                                                            ^
   10 errors generated.
--
>> drivers/pci/pci-acpi.c:983:36: error: incompatible pointer types passing 'struct pci_dev *' to parameter of type 'struct device *' [-Wincompatible-pointer-types]
     983 |         ret = pci_dev_reset_iommu_prepare(dev);
         |                                           ^~~
   include/linux/iommu.h:1519:62: note: passing argument to parameter 'dev' here
    1519 | static inline int pci_dev_reset_iommu_prepare(struct device *dev)
         |                                                              ^
   drivers/pci/pci-acpi.c:994:27: error: incompatible pointer types passing 'struct pci_dev *' to parameter of type 'struct device *' [-Wincompatible-pointer-types]
     994 |         pci_dev_reset_iommu_done(dev);
         |                                  ^~~
   include/linux/iommu.h:1524:60: note: passing argument to parameter 'dev' here
    1524 | static inline void pci_dev_reset_iommu_done(struct device *dev)
         |                                                            ^
   2 errors generated.
--
>> drivers/pci/quirks.c:4237:36: error: incompatible pointer types passing 'struct pci_dev *' to parameter of type 'struct device *' [-Wincompatible-pointer-types]
    4237 |         ret = pci_dev_reset_iommu_prepare(dev);
         |                                           ^~~
   include/linux/iommu.h:1519:62: note: passing argument to parameter 'dev' here
    1519 | static inline int pci_dev_reset_iommu_prepare(struct device *dev)
         |                                                              ^
   drivers/pci/quirks.c:4244:27: error: incompatible pointer types passing 'struct pci_dev *' to parameter of type 'struct device *' [-Wincompatible-pointer-types]
    4244 |         pci_dev_reset_iommu_done(dev);
         |                                  ^~~
   include/linux/iommu.h:1524:60: note: passing argument to parameter 'dev' here
    1524 | static inline void pci_dev_reset_iommu_done(struct device *dev)
         |                                                            ^
   2 errors generated.


vim +4341 drivers/pci/pci.c

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
  4361		pci_dev_reset_iommu_done(dev);
  4362		return ret;
  4363	}
  4364	EXPORT_SYMBOL_GPL(pcie_flr);
  4365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

