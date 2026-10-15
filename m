Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1575BCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qF3xIhL7oKwZtT1NVnqHk8c1Za3LLSTx1SBp9vbgeKE=; b=ZbjVTCFv10EuI3ToxLog+wAXKm
	Qk1Jt7JAh/bptC7M+FhnT3xqNYxKE6ZR1CykWVNN5131AdCtEhp5OcyGMYen3bj0nf6h5W4I0OXEC
	SmL6m12U7naXB33g09w11gnL+QBqMezCdLmPgEQdvCEVnLY4wiHIRPomq31bo4C1ensJq4l4f1ef+
	i9RB+ure52NEluK8k43edK/wd/HmnnKVAQjkMSguRsFJxHFhpYFRqS5Om+Qk6+zxc3GVvCdq9Ps1S
	Mib5n9mEvSRcS3QlgIWFUCh2vnSdkuZkk8akpjodLKVKDOvFIQ7+jdKL6rVdLY3h1pfob83Ld9DV1
	PmoIx6fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMSm-00000000O5R-0763;
	Thu, 15 Oct 2026 14:29:44 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMSi-00000000O4c-32oj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792074581; x=1823610581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ux8bYPBf+tPZGPkVOGqIDc2hrCy5YoJwGkED1by+PtM=;
  b=S22ER45C/p7u2M9+GVRJY5iFtH3LSxbiEEC2H4o/pT3BfxpSj1E55Xld
   3tGWVJnqwraTHpPMqG0tCohkzcAlZBGa6SMCuCgG4rgz4vqbgLECT/yJU
   6FRYwiR6QlwmgRPgmSUTuqrCt51JvlCKFO8VFQfW0WwbliyICe0EvTLzz
   zigj+kamj4rjD+yzneLAP6Ewgfq8oId2PdgcGFPcqJ4zxC/91seUCc3Gp
   3nWNKyKuMT42hbuowW8Sxx+ZH4GJZvUjsAPcr5t1CnD8jb2wwgM99/2G2
   d/dZ/dLcMf8JyuLDdo0F0xgMq1N7aIkYI6KBfwge240QID9HagGgdZRp0
   w==;
X-CSE-ConnectionGUID: P8GcdhjNQ8OxbkbMcv6v9A==
X-CSE-MsgGUID: L4jhAPt+SWaPtO2qCP2BSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="877388"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="877388"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:29:40 -0700
X-CSE-ConnectionGUID: 57vUb34KTa2iHrVIj9ofiA==
X-CSE-MsgGUID: oKxPacBOQyOt9AEtHla1/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1617076"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Oct 2026 07:29:37 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHMSc-00000000GeO-2Uqv;
	Thu, 15 Oct 2026 14:29:34 +0000
Date: Thu, 15 Oct 2026 22:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, arnd@arndb.de,
	stefandoesinger@gmail.com, krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 20/24] spi: zx: Add ZTE ZX family SPI flash controller
 driver
Message-ID: <202610152215.xgWnk9aT-lkp@intel.com>
References: <20261014072109.1759502-21-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-21-ghahramani.navid@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_072940_850162_166E8B72 
X-CRM114-Status: GOOD (  12.94  )
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

Hi Navid,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on soc/for-next linus/master v7.3-rc7]
[cannot apply to clk/clk-next next-20261012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Navid-Ghahremani/dt-bindings-arm-Add-ZTE-ZX279128S-platform-descriptions/20261014-082042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20261014072109.1759502-21-ghahramani.navid%40gmail.com
patch subject: [PATCH v2 20/24] spi: zx: Add ZTE ZX family SPI flash controller driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20261015/202610152215.xgWnk9aT-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610152215.xgWnk9aT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610152215.xgWnk9aT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-zx.c:473:4: warning: cast to smaller integer type 'unsigned int' from 'struct zx_qspi *' [-Wpointer-to-int-cast]
     473 |                         (unsigned int)qspi);
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
>> drivers/spi/spi-zx.c:706:17: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551614 to 4294967294 [-Wconstant-conversion]
     706 |         writel_relaxed(~ZX_QSPI_EN, qspi->io_base + ZX_QSPI_EN_REG);
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/io.h:88:39: note: expanded from macro 'writel_relaxed'
      88 | #define writel_relaxed(v, a) __writel(v, a)
         |                              ~~~~~~~~ ^
   2 warnings generated.


vim +706 drivers/spi/spi-zx.c

   701	
   702	static void zx_qspi_remove(struct platform_device *pdev)
   703	{
   704		struct zx_qspi *qspi = platform_get_drvdata(pdev);
   705	
 > 706		writel_relaxed(~ZX_QSPI_EN, qspi->io_base + ZX_QSPI_EN_REG);
   707	}
   708	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

