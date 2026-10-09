Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAE9CA601D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpuwbvwib9EDUN3UXsGE9XtsqFDmeSpwQT+jx6FWOm8=; b=xx3o0vkQg3YCB5Py0+yhVN5G+j
	BrTJsraczH/4Ps+ySZhMwcM+BlyWGNiwGgGXx6bHq3Aw7HUFxadpTDIQSt0zyJCox4/q2Es6oMyIj
	lxzF3eDyBwTQFdql/h3wujpa2ACSzX5wldwMbdIv9yvc5/h2kUiYU9aq1+S7laQLrz2O+1icTgV+B
	+lG2bmmgAnyecI2adKcQqtLV2lZCOy2KQ/0y3FBv5Dg2RhD1natA4yY1njKP5lC6jir6qxyhJvAVe
	yg3hCc9PWseH1RwvJrDKTJgolY/CSQNfLJD4y5X8f2y07a93NSG9Q97j2f05S+yuZ9mJSFopTzlVj
	3pYt89Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDgi-00000006gBz-1a2Y;
	Fri, 09 Oct 2026 16:43:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDgf-00000006gBc-44Wu
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 16:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xpuwbvwib9EDUN3UXsGE9XtsqFDmeSpwQT+jx6FWOm8=; b=o5k/nlX/hbFkQZWWBunkNVX0wK
	HNJJBv44vRvbQsI9mJG075WIwFbB/nrkndsPAinJE2Dl82GIvnwdmTq/UhSFf78v/xZatHrvWu6jt
	tOLGqHFAJUDYBggrepfWX8trbZWGMTt3kQBtt6S3z4ZzEriQ9DsDbjyVMGB7uH97TxFSWTsvkOZ27
	S0GSxKha9PozOG1rg6AZZ0Dv4w0DvT0sGGqoBLGX0bg1gCPpe4qV5Y0giC2Nj8dMHht4Aa1c71Y3u
	AKjnwOLnGFtc86Y7ZjHkULJZW0xSldQKvDyXpu8udWE0ITeSEa2pGo5uWmoqfMGdhJJQW2h248L1k
	a1fN/qxw==;
Received: from mgamail.intel.com ([192.198.163.7])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFDgc-0000000BQOE-26TX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791564190; x=1823100190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HL4dLnQazmu9eond2oaF2ZCcsFOHB8BI0FASnIbUEk8=;
  b=ZbJGgs31o2wO9c0EYzKJIkweAU85SlaEwc5NtrTJuxJq5pIB5eUQmEsC
   KbxeYE8cNMVDT5Svb2P8b7NW2gCr6RvbAjcYCH5wfNXKn2uEBP1vxRg7h
   5JThZ1KYxoUgs0qfCqiqysqhW812byvf/63+LG+D30hkPuJwdkvXaKXLv
   j8FziGaTYcPdgYhqsLe7Q0zBWV/iO8/U2fZPPWqxH9GMdAjFH+uVKzlyC
   La83oXQZZ/Nsq+4wOmD4L8d4XycuW0UIXqDSepKtJ0FDG8NvZntZllBqx
   Ak4sXFwlS79B5FZpPBiYQIfWy/nI/E7RW/7n78bn9KMRKTFL5efKaJ/1n
   g==;
X-CSE-ConnectionGUID: dNysosU6Q2SOSdSv57uXaw==
X-CSE-MsgGUID: 8Aq2vzceRSmv8VfUkmK4Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="259596"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="259596"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 09:43:05 -0700
X-CSE-ConnectionGUID: tUi5YPRHSZWPTE6paRwA/Q==
X-CSE-MsgGUID: QM0uw6PORcuqyvHNUpy+Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2094648"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 09 Oct 2026 09:43:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFDgR-0000000061U-0JFK;
	Fri, 09 Oct 2026 16:42:59 +0000
Date: Sat, 10 Oct 2026 00:42:14 +0800
From: kernel test robot <lkp@intel.com>
To: Haotian Zhang <vulab@iscas.ac.cn>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Joerg Roedel <jroedel@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/exynos: fix NULL pointer dereference on
 device_link_add() failure
Message-ID: <202610100049.FvaUUeCb-lkp@intel.com>
References: <20261009034539.3073100-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009034539.3073100-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_174310_958666_901F3233 
X-CRM114-Status: GOOD (  16.34  )
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

Hi Haotian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on arm-perf/for-next/perf pinctrl-samsung/for-next linus/master v7.3-rc6 next-20261008]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haotian-Zhang/iommu-exynos-fix-NULL-pointer-dereference-on-device_link_add-failure/20261009-114539
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20261009034539.3073100-1-vulab%40iscas.ac.cn
patch subject: [PATCH] iommu/exynos: fix NULL pointer dereference on device_link_add() failure
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261010/202610100049.FvaUUeCb-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 242243a5814307de825db3428662d67b064e2cbc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610100049.FvaUUeCb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610100049.FvaUUeCb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/exynos-iommu.c:1434:39: warning: variable 'tmp' is uninitialized when used here [-Wuninitialized]
    1434 |         list_for_each_entry_continue_reverse(tmp, &owner->controllers,
         |                                              ^~~
   drivers/iommu/exynos-iommu.c:1406:35: note: initialize the variable 'tmp' to silence this warning
    1406 |         struct sysmmu_drvdata *data, *tmp;
         |                                          ^
         |                                           = NULL
   1 warning generated.


vim +/tmp +1434 drivers/iommu/exynos-iommu.c

  1402	
  1403	static struct iommu_device *exynos_iommu_probe_device(struct device *dev)
  1404	{
  1405		struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
  1406		struct sysmmu_drvdata *data, *tmp;
  1407	
  1408		if (!has_sysmmu(dev))
  1409			return ERR_PTR(-ENODEV);
  1410	
  1411		list_for_each_entry(data, &owner->controllers, owner_node) {
  1412			/*
  1413			 * SYSMMU will be runtime activated via device link
  1414			 * (dependency) to its master device, so there are no
  1415			 * direct calls to pm_runtime_get/put in this driver.
  1416			 */
  1417			data->link = device_link_add(dev, data->sysmmu,
  1418						     DL_FLAG_STATELESS |
  1419						     DL_FLAG_PM_RUNTIME);
  1420			if (!data->link) {
  1421				dev_err(dev, "Unable to link %s\n",
  1422					dev_name(data->sysmmu));
  1423				goto err_unlink;
  1424			}
  1425		}
  1426	
  1427		/* There is always at least one entry, see exynos_iommu_of_xlate() */
  1428		data = list_first_entry(&owner->controllers,
  1429					struct sysmmu_drvdata, owner_node);
  1430	
  1431		return &data->iommu;
  1432	
  1433	err_unlink:
> 1434		list_for_each_entry_continue_reverse(tmp, &owner->controllers,
  1435						     owner_node)
  1436			device_link_del(tmp->link);
  1437	
  1438		return ERR_PTR(-ENODEV);
  1439	}
  1440	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

