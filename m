Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8978AE68946
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 02:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=512vM9eEPojhDbBC2R+UB6fp2hTFX8GZ6IpU19z7uHo=; b=USOlBy4eEyc/46FU494mHOFF5M
	yKCrXOjSFVFHsMUZymU8v/BN8RBWwdw4tmo4tYyR1IFmM0fxWUBbKA3zspgsnM0PujTdvfSpSA56C
	K9qysGDfQcaTbc9dDmeh9jBLp/znA8Siq4d+Kz7eslt2TGomYt4GtdUQnhjEYk7XKHfjbTxVwAiNF
	o3ET3X/y1plC8I3ZvR2MYFWVFQ1wLcky6YmqjDDMl9DjPWDzgEhXfKieaJmUJ8Y742/OTUnZniDzW
	oxzquMx191/2j/2eh4UAJdG+n3Zu3QbDH1/+An4Fbl5rTbCWrbvS4uoRKp1k//s8IVUY3cGtZRkiG
	lDwWE/Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Kod-00000002LHo-1SGD;
	Thu, 31 Oct 2024 02:21:39 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Kmy-00000002L4g-1PTZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 02:19:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730341197; x=1761877197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YH+r+Dbnbl3Hh+y/hm/qgXZvFD8Qdh/Re1nEgUi7fU8=;
  b=CQwDDjPRaWKF3jXvI2r7DRKdvi54tmzHXY7IS+LSn9NAYP5Y4RuSUd38
   TR5FvIIc1o/BE0JGNLouX59/QRFoaUZHxA2ViktxejvujrKRQOEXPt0GB
   8+Ptj31nHRn4AgkLvV3dN58fPgyfnvAPyvR63axLpJEcWHKFmEs6pgl+0
   lcftHsjw2V5F+4KgwQPL2ds/NHO/8Ss6n31AvBCbqIk1niasvOiayK97W
   DSx7oj4C8sX6TswepLPWIQjHUXOYyfled79GbeIYzwr/m0YS8+L2HhWbx
   BmIR2bf8O38Bc5wwZF7nNc/DnPS95E2CzGoJotgZTAbgO4OIP4wW/DNaC
   A==;
X-CSE-ConnectionGUID: rVfvk25ZRvCvZbw/7TTGEg==
X-CSE-MsgGUID: NoIpkGCRSIuVztJarjKC9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47528335"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47528335"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 19:19:50 -0700
X-CSE-ConnectionGUID: mI53XOwBRq+BGEaUiyP8pg==
X-CSE-MsgGUID: Ce3NF40AQsq8i8qE4BOJKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="82039774"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Oct 2024 19:19:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Kmm-000fY8-1k;
	Thu, 31 Oct 2024 02:19:44 +0000
Date: Thu, 31 Oct 2024 10:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: alice.guo@oss.nxp.com, alexander.stein@ew.tq-group.com,
	wahrenst@gmx.net, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, "alice.guo" <alice.guo@nxp.com>
Subject: Re: [PATCH v3] soc: imx: Add SoC device register for i.MX9
Message-ID: <202410311056.PBPPOYmg-lkp@intel.com>
References: <20241030091336.3901440-1-alice.guo@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030091336.3901440-1-alice.guo@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_191956_479739_A5E11112 
X-CRM114-Status: GOOD (  12.36  )
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.12-rc5 next-20241030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/alice-guo-oss-nxp-com/soc-imx-Add-SoC-device-register-for-i-MX9/20241030-171525
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20241030091336.3901440-1-alice.guo%40oss.nxp.com
patch subject: [PATCH v3] soc: imx: Add SoC device register for i.MX9
config: hexagon-randconfig-001-20241031 (https://download.01.org/0day-ci/archive/20241031/202410311056.PBPPOYmg-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311056.PBPPOYmg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311056.PBPPOYmg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/soc-imx9.c:84:34: warning: unused variable 'imx9_soc_match' [-Wunused-const-variable]
   static const struct of_device_id imx9_soc_match[] = {
                                    ^
   1 warning generated.


vim +/imx9_soc_match +84 drivers/soc/imx/soc-imx9.c

    83	
  > 84	static const struct of_device_id imx9_soc_match[] = {
    85		{ .compatible = "fsl,imx93", },
    86		{ .compatible = "fsl,imx95", },
    87		{ }
    88	};
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

