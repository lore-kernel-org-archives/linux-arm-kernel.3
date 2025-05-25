Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5B5C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 08:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Go5YcAQ39E7RYJlQxcuLliSqw1myHqiDhKgw/zeH7M=; b=eazuBnHq4r7YhVLcOCbjCYiYaM
	uiJxlkV2acor13SKz2dJ+Hn0P0gA7kgW6tD2+LA4KgPqiYnkH954agFbJYkseBB1qqdt8kVwv2M36
	s1Hm9XGdZcuICgwBQqzT5yj/Di3Mlw3o8zC5YtpO3T8gqYEtEa7NwfSPfEIkpSFDpNLfy9zDiIIPB
	MobuDOKsh0udGMHySos48bq+iyteRAkTUiv3B9MvszEQafXzzHWSnpqvuvFiT/20dA7txD6nLaClB
	HL1QhHK1YPRY9r1aVzeaxsLTUGIVJPChZRsiTgAzDoizWYdWYm54DZVZ0ciOXNDml9Uit7MPSNDEg
	D7hM3BYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ6mi-00000006kuW-3tWV;
	Sun, 25 May 2025 08:32:44 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ6kc-00000006ki0-3A79
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 08:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748161835; x=1779697835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X+gCXOXsYKVvislAM03W3reWMCip6O0Qe6ZtQ4W/bEY=;
  b=IHjZd/F8y5DlRDioLPqA3Gg6BZ7sgY1vPOX7H4f4WfemH+2t8t1PhopK
   /s12JbrwqDn5hiz9jXBM1517VjKDClSWfaW8cbdNci/PcGRDbjjvgz631
   1FbHBcKXSSWAw2ruze8GOirxehJT+DW4bdjbjFTj1obB6911KQXcktTKd
   rZrV3ZQzf0/lAguhGO5fNFOHKlDnrj32nDPKVjKc3VY6oOetAH4fuJwRp
   r0R9lmPokwNmloYBL9TAwVEE/LMcrVHyhMNkiqRhTRWdLkwHqtvxKOJzk
   lJz7H2j2BljAmcVBxZFmgyQPZlVYgCa2HJu3FAqty9vwvfzSfscF1avPL
   Q==;
X-CSE-ConnectionGUID: QO6Cn+cWRPiGO15/i2VttQ==
X-CSE-MsgGUID: ZGAHs5pFSoi5QjdY1SLv1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="50049069"
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="50049069"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 01:30:30 -0700
X-CSE-ConnectionGUID: CHrzet/zQQehuzWBXCFlUw==
X-CSE-MsgGUID: hssUZyPESOKzuGHr03rH2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="141765201"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 May 2025 01:30:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ6kS-000RhQ-1E;
	Sun, 25 May 2025 08:30:24 +0000
Date: Sun, 25 May 2025 16:30:03 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
	William Mcvicker <willmcvicker@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 2/2] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
Message-ID: <202505251653.TsYCp5Mq-lkp@intel.com>
References: <20250524-gs101-cpuidle-v1-2-aea77a7842a6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-gs101-cpuidle-v1-2-aea77a7842a6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_013034_857558_B1EED460 
X-CRM114-Status: GOOD (  11.06  )
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

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 176e917e010cb7dcc605f11d2bc33f304292482b]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Griffin/arm64-dts-exynos-gs101-Add-local-timer-stop-to-cpuidle-nodes/20250524-153138
base:   176e917e010cb7dcc605f11d2bc33f304292482b
patch link:    https://lore.kernel.org/r/20250524-gs101-cpuidle-v1-2-aea77a7842a6%40linaro.org
patch subject: [PATCH 2/2] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
config: arm64-randconfig-r132-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251653.TsYCp5Mq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20250525/202505251653.TsYCp5Mq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505251653.TsYCp5Mq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/samsung/exynos-pmu.c:593:32: warning: unused variable 'cpupm_pm_ops' [-Wunused-const-variable]
     593 | static const struct dev_pm_ops cpupm_pm_ops = {
         |                                ^~~~~~~~~~~~
   1 warning generated.


vim +/cpupm_pm_ops +593 drivers/soc/samsung/exynos-pmu.c

   592	
 > 593	static const struct dev_pm_ops cpupm_pm_ops = {
   594		.suspend_noirq = exynos_cpupm_suspend_noirq,
   595		.resume_noirq = exynos_cpupm_resume_noirq,
   596	};
   597	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

