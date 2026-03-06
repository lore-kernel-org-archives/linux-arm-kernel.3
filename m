Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7AFF513ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 02:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2kx2gSalwKnPR6NZ+bGIq52qQ0BXGesTnolcpvmGfo=; b=x4KlPDInHtSl6dObgxcDlM371a
	gzTITvXvK1bcGKNKPAFF1m76mOAkZTTB32KA+ZZ8iBTrg+c0WnHpQ3c9LHleQcJvQrzsJHWWLG0Il
	+e5+JEuZ2ij5Qi8HB2q+5K/oXy2VIOuRED3s0tj8weZNGVJzmyyCJVVO8iC28NhUz8NeLLjeGp2XW
	P/H71/+JEwqsP5L3FloyvtUCGmpi7zUWwaZZAQlFz7JBxhF69R6ZaVBZW2wfm8s0QV6Onq1KgYzl2
	ds/XqgMlXF0B2403AxlZnZ+of9A2VOsoHNb5BZxwKs1EbJ1EHf06LfeCf3HkEsVcONW0yKha1dZD7
	vLOQleOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyL2k-00000002tOr-2Kko;
	Fri, 06 Mar 2026 02:35:58 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyL2f-00000002tOP-3lsZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 02:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772764554; x=1804300554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y5W6sLW/aDaUXUpUxv1dbppKapc3xlSNoGc5wcYGb2M=;
  b=gvk188yND9d5IAvMnLe5tmzHsTY1SHPIkbTglh3v9sAaoo5QugdFXeK5
   W3NmFnREO/UWyahypyKKmvmOfwJ9audcUh+hvDBBssnZcxJ2sLv3rbbtR
   KQXdi81nec5/UEo0yHK7vuvbka+J2TaPuCATPuLiVxERqa6YAAdJpZZWF
   QOkGNuIpIeMRKAvDXNRwdfqiLhqd8EIwwBSB3WFuf050Z9D5Ghl//w6mI
   xfKl2Pqfo38XnDcpRQcw5VqvBWH0raCxXEjWrFi/UmPDm2bvpfmRqGT+F
   dIy6M4UfdtFDCBODbWnmTS58+hg0hLGz11gsdjFvNK5rFUJqR9M1g9bUP
   w==;
X-CSE-ConnectionGUID: /6yLvDysR/GSXSqrkvps7w==
X-CSE-MsgGUID: kzHQjmpeTWqDFungKMG87Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84198731"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="84198731"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 18:35:52 -0800
X-CSE-ConnectionGUID: p3vTN18iSpGYBmvT220Zaw==
X-CSE-MsgGUID: JmUmVkVeS7KdkehDBMsUgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223008504"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Mar 2026 18:35:44 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyL2T-000000000Dl-0Ljp;
	Fri, 06 Mar 2026 02:35:41 +0000
Date: Fri, 6 Mar 2026 10:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, bhelgaas@google.com,
	jgg@nvidia.com
Cc: oe-kbuild-all@lists.linux.dev, rafael@kernel.org, lenb@kernel.org,
	praan@google.com, kees@kernel.org, baolu.lu@linux.intel.com,
	smostafa@google.com, Alexander.Grest@microsoft.com,
	kevin.tian@intel.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, vsethi@nvidia.com
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <202603061001.fesCQb1B-lkp@intel.com>
References: <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_183554_018097_0B9F66FD 
X-CRM114-Status: GOOD (  13.63  )
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

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus rafael-pm/linux-next rafael-pm/bleeding-edge soc/for-next linus/master v7.0-rc2 next-20260305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolin-Chen/iommu-Do-not-call-pci_dev_reset_iommu_done-unless-reset-succeeds/20260305-132923
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc%40nvidia.com
patch subject: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
config: arm64-randconfig-001-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061001.fesCQb1B-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061001.fesCQb1B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061001.fesCQb1B-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: In function 'arm_smmu_atc_recovery_worker':
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:467:9: error: implicit declaration of function 'pci_dev_lock'; did you mean 'pci_dev_get'? [-Werror=implicit-function-declaration]
     467 |         pci_dev_lock(pdev);
         |         ^~~~~~~~~~~~
         |         pci_dev_get
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:471:9: error: implicit declaration of function 'pci_dev_unlock'; did you mean 'inode_unlock'? [-Werror=implicit-function-declaration]
     471 |         pci_dev_unlock(pdev);
         |         ^~~~~~~~~~~~~~
         |         inode_unlock
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:480:14: error: implicit declaration of function 'pci_reset_function' [-Werror=implicit-function-declaration]
     480 |         if (!pci_reset_function(pdev)) {
         |              ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +467 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

   431	
   432	static void arm_smmu_atc_recovery_worker(struct work_struct *work)
   433	{
   434		struct arm_smmu_atc_recovery_param *param =
   435			container_of(work, struct arm_smmu_atc_recovery_param, work);
   436		struct pci_dev *pdev;
   437	
   438		scoped_guard(mutex, &param->smmu->streams_mutex) {
   439			struct arm_smmu_master *master;
   440	
   441			master = arm_smmu_find_master(param->smmu, param->sid);
   442			if (!master || WARN_ON(!dev_is_pci(master->dev)))
   443				goto free_param;
   444			pdev = to_pci_dev(master->dev);
   445			pci_dev_get(pdev);
   446		}
   447	
   448		scoped_guard(spinlock_irqsave, &param->smmu->atc_recovery.lock) {
   449			struct arm_smmu_atc_recovery_param *e;
   450	
   451			list_for_each_entry(e, &param->smmu->atc_recovery.list, node) {
   452				/* Device is already being recovered */
   453				if (e->pdev == pdev)
   454					goto put_pdev;
   455			}
   456			param->pdev = pdev;
   457			list_add(&param->node, &param->smmu->atc_recovery.list);
   458		}
   459	
   460		/*
   461		 * Stop DMA (PCI) and block ATS (IOMMU) immediately, to prevent memory
   462		 * corruption. This must take pci_dev_lock to prevent any racy unplug.
   463		 *
   464		 * If pci_dev_reset_iommu_prepare() fails, pci_reset_function will call
   465		 * it again internally.
   466		 */
 > 467		pci_dev_lock(pdev);
   468		pci_clear_master(pdev);
   469		if (pci_dev_reset_iommu_prepare(pdev))
   470			pci_err(pdev, "failed to block ATS!\n");
 > 471		pci_dev_unlock(pdev);
   472	
   473		/*
   474		 * ATC timeout indicates the device has stopped responding to coherence
   475		 * protocol requests. The only safe recovery is a reset to flush stale
   476		 * cached translations. Note that pci_reset_function() internally calls
   477		 * pci_dev_reset_iommu_prepare/done() as well and ensures to block ATS
   478		 * if PCI-level reset fails.
   479		 */
 > 480		if (!pci_reset_function(pdev)) {
   481			/*
   482			 * If reset succeeds, set BME back. Otherwise, fence the system
   483			 * from a faulty device, in which case user will have to replug
   484			 * the device to invoke pci_set_master().
   485			 */
   486			pci_dev_lock(pdev);
   487			pci_set_master(pdev);
   488			pci_dev_unlock(pdev);
   489		}
   490		scoped_guard(spinlock_irqsave, &param->smmu->atc_recovery.lock)
   491			list_del(&param->node);
   492	put_pdev:
   493		pci_dev_put(pdev);
   494	free_param:
   495		kfree(param);
   496	}
   497	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

