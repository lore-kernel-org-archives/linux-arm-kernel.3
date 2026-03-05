Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AA8F33A8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 15:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMQ7Vcm9EWebWdGK0o/UurmgGnoJNra1GWHX4Z4gBGM=; b=Nn3wXscCqpmoqCJ1olzV0qEHFH
	Rx9kp/pIQCBGF0HdurX9vmv3ijV7I54iwDaLZyF/qYaAWplLhRKAcyOOeYAZznDd/938o+EqdytVt
	1Y5WFCfoqnOFGQQU0UrP84a3QXKEkw4Kk76bCeNRQxOCy29kYrU1v5BDopBR0AQ9sJyp9xpGjcwoD
	0HJjj/Ip/k62W74Jr+F7XPUZBhE9v8YfqvFoL27RURIKVKTglqsBy9VBlGi20IO3DtZl/2p3zClV9
	HTPTnvRxl6sAmOFnKYNYP/Z/JdihTO425JZUzUtc2Xc6mcS/CYDM67LEz1jD3XiCAEfT3oNYnHW/P
	MRtTGvlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyARE-00000002676-3yqx;
	Thu, 05 Mar 2026 15:16:32 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAR9-00000002659-3KnY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 15:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772723788; x=1804259788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NIqGePwhMB9v9rBzNePQxONPR4S/D8k+T7Bqpz8eGUc=;
  b=Ddrrt3NHcIB29vQfExY61ahT6VzZ6Q0M3/+iQ+WwjigyAObIdeOERTFP
   02hrXe0s58xqWrldKmE2UjsEIGsttdiqgv9BP3M4x/979tkjtqQ78BeuJ
   o+YNlx/4Lm9xvoBNsp3pL2059PE3rOVDRuyjNp622D4wz/+ZbYc3sQaW7
   8QfK9ZNnuDCTnmfApg3KI3FVYjrosyV0sKC//SDs8+s0AoLxm5ZUkjxuQ
   KahvEBDi9j1M9zo6jPUYmgSjcM0vKJteD0agaSVmQ3DAU+uMijdB/2p2H
   eEb4+vnzS8mIun/8fDjEGS5oDpFnD4jQkNwUbYEeT5UzWmdL7wftX1/jV
   Q==;
X-CSE-ConnectionGUID: JuM+x04+QxiJMhu3ddIUSA==
X-CSE-MsgGUID: 0bwbiVq6S+CxzsRsZizruQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="96431015"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="96431015"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 07:16:19 -0800
X-CSE-ConnectionGUID: wnCKV1F1Q4ykB5mWY2Gqag==
X-CSE-MsgGUID: Qs67a8/fRH2sHp+KnOhEfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="223667087"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Mar 2026 07:16:13 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyAQs-000000000oU-2KhI;
	Thu, 05 Mar 2026 15:16:10 +0000
Date: Thu, 5 Mar 2026 23:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, bhelgaas@google.com,
	jgg@nvidia.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, rafael@kernel.org,
	lenb@kernel.org, praan@google.com, kees@kernel.org,
	baolu.lu@linux.intel.com, smostafa@google.com,
	Alexander.Grest@microsoft.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	vsethi@nvidia.com
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <202603052303.jrfwR7CV-lkp@intel.com>
References: <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_071628_170531_7D53491F 
X-CRM114-Status: GOOD (  13.70  )
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
[also build test ERROR on pci/for-linus rafael-pm/linux-next rafael-pm/bleeding-edge soc/for-next linus/master v7.0-rc2 next-20260304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolin-Chen/iommu-Do-not-call-pci_dev_reset_iommu_done-unless-reset-succeeds/20260305-132923
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc%40nvidia.com
patch subject: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
config: arm64-randconfig-003-20260305 (https://download.01.org/0day-ci/archive/20260305/202603052303.jrfwR7CV-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603052303.jrfwR7CV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603052303.jrfwR7CV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:467:2: error: call to undeclared function 'pci_dev_lock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pci_dev_lock(pdev);
           ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:471:2: error: call to undeclared function 'pci_dev_unlock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pci_dev_unlock(pdev);
           ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:480:7: error: call to undeclared function 'pci_reset_function'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (!pci_reset_function(pdev)) {
                ^
   3 errors generated.


vim +/pci_dev_lock +467 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

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

