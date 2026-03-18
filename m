Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFF4103E199
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0CvuPfD7COIo+8HMLflUkIZ3jbTrFEH+1E4Pt2c8nQ=; b=tvQ76oUljovwQkstRuEf2J4HRA
	86D/thQSLHJ4WbJcixntJjmxW3lhEojnW72O0wISVRTgYDLZ8uqGCzEeNTG46Z6baRM5nCvGJMJN5
	sRMrJc1td32LR+j+2fj6MgK6IkF4VCMGbm4dE0KwsEfyBwVZlkesm1jnuM5Iz8y4cqdhKTQV/Z2oY
	gkcJNk4AVXAI5tz+RewaTF44jx1xgm2UWdpQK/Mvcw8V2u60u/ION4Hc9ap/AEFOMZ6ieZ88H8kpi
	ORVjbaYjgBsI7BvF1/deu5WzTi3juROFLZUyErXHiN5l862plTl6PbmzwWUWrQMD6VzONvIJb5ava
	uJ6qCoUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sTQ-00000008egS-3mwZ;
	Wed, 18 Mar 2026 15:06:16 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sTN-00000008efv-43l9;
	Wed, 18 Mar 2026 15:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773846374; x=1805382374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4mKNZGsMnx96h+U53BOOHWYmauvrjAENdqFmFNmU85o=;
  b=QX8BqEsoSg7/cWcxRA/J1PeInvxNe74oOXZ1XQHzpF23LDVWVc4lcy2O
   aRP983VpaIa7zK8G87i6bcruWdbiM38B4vKfWKHPj0nUnUsHdb8FKEZ69
   9rq2darau/tp7F83DsnAfrwtE9ivUAYEmHNRtTch70kCyHjWX15ujI4sx
   0guK16mVDzGsXJ52h/GHHhSufS1YdT0KY7cT+nuHZGWZgNtoCOb8Mpawz
   oBgQPIUfuLSEg/U3ADaVJRd7dc2n93hIgJYI0a7CAu+Ggk+WCsJSrTY8q
   0spjIb9nyU92PY7rkLptN7WGcf2ZFlt0mqbfNIcVVBENH0ne77Gd/4TWS
   Q==;
X-CSE-ConnectionGUID: uCimlx0JTr2o2FlJnfAITQ==
X-CSE-MsgGUID: 75dHdsk6R56fKf8pEQfVJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74601746"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74601746"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 08:06:08 -0700
X-CSE-ConnectionGUID: 45FZNnEETzigI3hiwWOn+w==
X-CSE-MsgGUID: 9Lplwp4OTDGMa1328tMtMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="227341270"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2026 08:06:04 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2sTC-0000000031t-0fMK;
	Wed, 18 Mar 2026 15:06:02 +0000
Date: Wed, 18 Mar 2026 23:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH v3 01/17] spi: axiado: Use helper function
 devm_clk_get_enabled()
Message-ID: <202603182309.Rj2JxGYZ-lkp@intel.com>
References: <a78f25f1b15b90121e9723ecb5bd606bbb1868d4.1773733017.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a78f25f1b15b90121e9723ecb5bd606bbb1868d4.1773733017.git.xiaopei01@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_080614_089374_C502A756 
X-CRM114-Status: GOOD (  13.28  )
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

Hi Pei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on next-20260317]
[cannot apply to atorgue-stm32/stm32-next rockchip/for-next xilinx-xlnx/master clk/clk-next shawnguo/for-next soc/for-next linus/master v7.0-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pei-Xiao/spi-axiado-Use-helper-function-devm_clk_get_enabled/20260318-110300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/a78f25f1b15b90121e9723ecb5bd606bbb1868d4.1773733017.git.xiaopei01%40kylinos.cn
patch subject: [PATCH v3 01/17] spi: axiado: Use helper function devm_clk_get_enabled()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260318/202603182309.Rj2JxGYZ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182309.Rj2JxGYZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182309.Rj2JxGYZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-axiado.c: In function 'ax_spi_remove':
>> drivers/spi/spi-axiado.c:865:24: warning: unused variable 'xspi' [-Wunused-variable]
     865 |         struct ax_spi *xspi = spi_controller_get_devdata(ctlr);
         |                        ^~~~


vim +/xspi +865 drivers/spi/spi-axiado.c

e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  853  
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  854  /**
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  855   * ax_spi_remove - Remove method for the SPI driver
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  856   * @pdev:	Pointer to the platform_device structure
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  857   *
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  858   * This function is called if a device is physically removed from the system or
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  859   * if the driver module is being unloaded. It frees all resources allocated to
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  860   * the device.
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  861   */
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  862  static void ax_spi_remove(struct platform_device *pdev)
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  863  {
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  864  	struct spi_controller *ctlr = platform_get_drvdata(pdev);
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07 @865  	struct ax_spi *xspi = spi_controller_get_devdata(ctlr);
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  866  
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  867  	spi_unregister_controller(ctlr);
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  868  
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  869  	pm_runtime_set_suspended(&pdev->dev);
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  870  	pm_runtime_disable(&pdev->dev);
e75a6b00ad7962a Vladimir Moravcevic 2026-01-07  871  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

