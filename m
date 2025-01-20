Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741E7C02182
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 19:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sh3mT3bHbxsXFi8J23gbXty5pbdqhTtc1zefMkkFG0U=; b=3fboHA8pEHuXjAdELs/pUivdN6
	Juqq1qt0FewwqhQJFgWDQbchFrDIBg4vwVykmHQplffsYPzYGVeESLWAHhp/Vbgn9c9r/+xYob3XS
	FTVsoPQmlyNapv7T1tlx3F9eb0d7bnDOtYzHatDATciqdrIKQ1hQbUFrGx0D4Hsos2j9yqOuzi/z3
	jsoLmUewgA96dIqcdqkwPpe6aGUUu7b+7QSdIKZ1VhdJs4a3fqBonG1sSCPS0cdnD3SAbD48yjJus
	5Bd6mBox+ksRSxnDRLEldJyVjgk+PQQJIGu2cLcp2zG+8xQYrPrchPuw5K6F5WxlftUf0D5k18I7N
	xEfKL7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZxi5-00000006LM9-26Vm;
	Mon, 20 Jan 2025 19:45:21 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZxgo-00000006LBc-0rTM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 19:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737402242; x=1768938242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KIwQ96tcbKsNvtTiJ7Sp5Kac727a4bUVsOQMTqS4RJg=;
  b=YuWJlFifQmd9aOE9vnCErFLmLmc4mEg8Fc8WzMs1PhAvpRBfVEuJKJsN
   O+gnspmzdw363mFvjadopdfsAXJQc5RfpuobmyO6CUMJLewWv1c5JkIs8
   DeDnotaru8cW3nhQ4mDYEBwEvCpQ8WCcAMOf+si+bqa9NoggpJqip6pee
   n7Diomi6CxGwC4urxZVekMH/zrLLzvNxuCwnXy7xMtsvQA6maN6UYeDQc
   DGFb7QYVuYlvIQCJcNnYSetHg4pP8KVSpbbqMsm+RB+RcwAWAw/m1y4yu
   e7qzF0v6GLN2XfMRQwDSd0gG88yJ9j01MFU7I4YN6U7llrhjyRp9jAo02
   A==;
X-CSE-ConnectionGUID: 0bzm1IKTTRi/qXDq7Hhtng==
X-CSE-MsgGUID: JefHfgJRRZSNd0yM88SudA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37681908"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="37681908"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 11:43:57 -0800
X-CSE-ConnectionGUID: zmRDdNRTRJ6GTy6M+h+jzQ==
X-CSE-MsgGUID: kPy9akuURPWUJQvFuXE8rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="106419830"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jan 2025 11:43:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZxgd-000Wvf-2W;
	Mon, 20 Jan 2025 19:43:51 +0000
Date: Tue, 21 Jan 2025 03:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v12 4/5] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <202501210346.wYxcOI66-lkp@intel.com>
References: <20250120-imx-se-if-v12-4-c5ec9754570c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-imx-se-if-v12-4-c5ec9754570c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_114402_288214_2AE5B55D 
X-CRM114-Status: GOOD (  12.89  )
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

Hi Pankaj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-add-imx-se-to-other_interfaces/20250120-193050
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250120-imx-se-if-v12-4-c5ec9754570c%40nxp.com
patch subject: [PATCH v12 4/5] firmware: imx: add driver for NXP EdgeLock Enclave
config: arm64-randconfig-002-20250121 (https://download.01.org/0day-ci/archive/20250121/202501210346.wYxcOI66-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210346.wYxcOI66-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210346.wYxcOI66-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/imx/se_ctrl.c:505:12: warning: 'se_resume' defined but not used [-Wunused-function]
     505 | static int se_resume(struct device *dev)
         |            ^~~~~~~~~
>> drivers/firmware/imx/se_ctrl.c:491:12: warning: 'se_suspend' defined but not used [-Wunused-function]
     491 | static int se_suspend(struct device *dev)
         |            ^~~~~~~~~~
   drivers/firmware/imx/se_ctrl.c:228:12: warning: 'se_load_firmware' defined but not used [-Wunused-function]
     228 | static int se_load_firmware(struct se_if_priv *priv)
         |            ^~~~~~~~~~~~~~~~


vim +/se_resume +505 drivers/firmware/imx/se_ctrl.c

   490	
 > 491	static int se_suspend(struct device *dev)
   492	{
   493		struct se_if_priv *priv = dev_get_drvdata(dev);
   494		struct se_fw_load_info *load_fw;
   495		int ret = 0;
   496	
   497		load_fw = get_load_fw_instance(priv);
   498	
   499		if (load_fw->imem_mgmt)
   500			ret = se_save_imem_state(priv, &load_fw->imem);
   501	
   502		return ret;
   503	}
   504	
 > 505	static int se_resume(struct device *dev)
   506	{
   507		struct se_if_priv *priv = dev_get_drvdata(dev);
   508		struct se_fw_load_info *load_fw;
   509	
   510		load_fw = get_load_fw_instance(priv);
   511	
   512		if (load_fw->imem_mgmt)
   513			se_restore_imem_state(priv, &load_fw->imem);
   514	
   515		return 0;
   516	}
   517	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

