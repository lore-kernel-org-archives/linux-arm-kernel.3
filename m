Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03087CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 06:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2myreG7B52eRaaZNn8tqnyQ5yDGx1IIPA6P1UOv+5Dc=; b=aEn9ew0rFKLWh7pMBHLlexLbmw
	MXO/a/H6NP+Jacnu+vFAwQSfLTrHYxRxgHVIY48uAXGzDKpn6nWTTENNqYrAtsUk0PTOsqX8sV8Q+
	IUeiyYy3UeYBiCP3zDbBGNht9Dqa2HFHYGghzrir7OFNQGbqwed3sT+t5yScCne63LybAMVea43ug
	O4RckpCAnd6bGqbJK7+z/PCTCuKk9ZjKMPMbPlcQMPADUTsQP2NszQR6SAieDd6bbHLsvFqeSdKT+
	xtkmdpObVYVgwDv3WIGPiCk4LSKI6ndA78muTdajFZ2w9QPDXav3IiqlgFlj0kZsHElfuFGpU6E8z
	oXj9PLLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37oJ-00000001XuI-3cRL;
	Mon, 29 Sep 2025 06:56:35 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37oH-00000001Xtp-3iL4;
	Mon, 29 Sep 2025 06:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759128994; x=1790664994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CPNJ0DoJOWsjWqUu7JhZ8h2za7aZcaHA/CMWvZn/9W8=;
  b=bt2egUodSrviBAJQtrQmPg3B84g8RJZcWIUPqsxoWmJhMfRZhcPXhQaU
   yRj3wnEUzHXB1ojCa0oFuji3BB9065jA66MA245PM+1i3bva2fm1KD60P
   /aeF/x6p6DnKtlQ+iutugMxBBQbmzbFMIoUSWjMi8ADLPYNfbgIeWMAUa
   g337DLgawUtyfzygUbeaLYchYo+kV7CnwbQ1iq4nIu7vLD9SY6p13qh7T
   BxlXoNPlslaTVvvwSYf4Wu0oaD/DW7O64ERXYfkUMNRIc5CvMYhZypF0R
   p2LoG3uEgV4ud8Ggu3oTXYPKD7WQI0yp2QNIQMepezig2u2VV5spovOsU
   w==;
X-CSE-ConnectionGUID: SDPLCvWIRLChJi+KyszBNQ==
X-CSE-MsgGUID: hxm0H1E2Tragyo/0YFLuOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61411865"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61411865"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 23:56:28 -0700
X-CSE-ConnectionGUID: 9E5dO3GkRtadc1zjR3AKTQ==
X-CSE-MsgGUID: ENISX4HsQnWcDb+ywlSk9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="178584086"
Received: from lkp-server02.sh.intel.com (HELO 62862f778ede) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 28 Sep 2025 23:56:26 -0700
Received: from kbuild by 62862f778ede with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v37o3-00003P-22;
	Mon, 29 Sep 2025 06:56:20 +0000
Date: Mon, 29 Sep 2025 14:54:39 +0800
From: kernel test robot <lkp@intel.com>
To: Haotian Zhang <vulab@iscas.ac.cn>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] clk: mediatek: Use devm_alloc for clk_data allocation to
 fix memory leak on probe error
Message-ID: <202509291432.RfHOsLVY-lkp@intel.com>
References: <20250929023621.1968-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929023621.1968-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_235634_004071_578E0C21 
X-CRM114-Status: GOOD (  13.95  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v6.17 next-20250926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haotian-Zhang/clk-mediatek-Use-devm_alloc-for-clk_data-allocation-to-fix-memory-leak-on-probe-error/20250929-103835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250929023621.1968-1-vulab%40iscas.ac.cn
patch subject: [PATCH] clk: mediatek: Use devm_alloc for clk_data allocation to fix memory leak on probe error
config: i386-buildonly-randconfig-001-20250929 (https://download.01.org/0day-ci/archive/20250929/202509291432.RfHOsLVY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250929/202509291432.RfHOsLVY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509291432.RfHOsLVY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/clk/mediatek/clk-mt6765.c:20:
   drivers/clk/mediatek/clk-mt6765.c: In function 'clk_mt6765_apmixed_probe':
>> include/dt-bindings/clock/mt6765-clk.h:32:41: error: passing argument 1 of 'mtk_devm_alloc_clk_data' makes pointer from integer without a cast [-Wint-conversion]
      32 | #define CLK_APMIXED_NR_CLK              22
         |                                         ^~
         |                                         |
         |                                         int
   drivers/clk/mediatek/clk-mt6765.c:739:44: note: in expansion of macro 'CLK_APMIXED_NR_CLK'
     739 |         clk_data = mtk_devm_alloc_clk_data(CLK_APMIXED_NR_CLK);
         |                                            ^~~~~~~~~~~~~~~~~~
   In file included from drivers/clk/mediatek/clk-mt6765.c:16:
   drivers/clk/mediatek/clk-mtk.h:234:68: note: expected 'struct device *' but argument is of type 'int'
     234 | struct clk_hw_onecell_data *mtk_devm_alloc_clk_data(struct device *dev,
         |                                                     ~~~~~~~~~~~~~~~^~~
>> drivers/clk/mediatek/clk-mt6765.c:739:20: error: too few arguments to function 'mtk_devm_alloc_clk_data'
     739 |         clk_data = mtk_devm_alloc_clk_data(CLK_APMIXED_NR_CLK);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mtk.h:234:29: note: declared here
     234 | struct clk_hw_onecell_data *mtk_devm_alloc_clk_data(struct device *dev,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt6765.c: In function 'clk_mt6765_top_probe':
   include/dt-bindings/clock/mt6765-clk.h:161:41: error: passing argument 1 of 'mtk_devm_alloc_clk_data' makes pointer from integer without a cast [-Wint-conversion]
     161 | #define CLK_TOP_NR_CLK                  126
         |                                         ^~~
         |                                         |
         |                                         int
   drivers/clk/mediatek/clk-mt6765.c:773:44: note: in expansion of macro 'CLK_TOP_NR_CLK'
     773 |         clk_data = mtk_devm_alloc_clk_data(CLK_TOP_NR_CLK);
         |                                            ^~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mtk.h:234:68: note: expected 'struct device *' but argument is of type 'int'
     234 | struct clk_hw_onecell_data *mtk_devm_alloc_clk_data(struct device *dev,
         |                                                     ~~~~~~~~~~~~~~~^~~
   drivers/clk/mediatek/clk-mt6765.c:773:20: error: too few arguments to function 'mtk_devm_alloc_clk_data'
     773 |         clk_data = mtk_devm_alloc_clk_data(CLK_TOP_NR_CLK);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mtk.h:234:29: note: declared here
     234 | struct clk_hw_onecell_data *mtk_devm_alloc_clk_data(struct device *dev,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt6765.c: In function 'clk_mt6765_ifr_probe':
   include/dt-bindings/clock/mt6765-clk.h:228:41: error: passing argument 1 of 'mtk_devm_alloc_clk_data' makes pointer from integer without a cast [-Wint-conversion]
     228 | #define CLK_IFR_NR_CLK                  64
         |                                         ^~
         |                                         |
         |                                         int
   drivers/clk/mediatek/clk-mt6765.c:813:44: note: in expansion of macro 'CLK_IFR_NR_CLK'
     813 |         clk_data = mtk_devm_alloc_clk_data(CLK_IFR_NR_CLK);
         |                                            ^~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mtk.h:234:68: note: expected 'struct device *' but argument is of type 'int'
     234 | struct clk_hw_onecell_data *mtk_devm_alloc_clk_data(struct device *dev,
         |                                                     ~~~~~~~~~~~~~~~^~~
   drivers/clk/mediatek/clk-mt6765.c:813:20: error: too few arguments to function 'mtk_devm_alloc_clk_data'
     813 |         clk_data = mtk_devm_alloc_clk_data(CLK_IFR_NR_CLK);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mtk.h:234:29: note: declared here
     234 | struct clk_hw_onecell_data *mtk_devm_alloc_clk_data(struct device *dev,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/mtk_devm_alloc_clk_data +32 include/dt-bindings/clock/mt6765-clk.h

eb7beb65ac30af Mars Cheng 2020-02-21   8  
eb7beb65ac30af Mars Cheng 2020-02-21   9  /* APMIXEDSYS */
eb7beb65ac30af Mars Cheng 2020-02-21  10  #define CLK_APMIXED_ARMPLL_L		0
eb7beb65ac30af Mars Cheng 2020-02-21  11  #define CLK_APMIXED_ARMPLL		1
eb7beb65ac30af Mars Cheng 2020-02-21  12  #define CLK_APMIXED_CCIPLL		2
eb7beb65ac30af Mars Cheng 2020-02-21  13  #define CLK_APMIXED_MAINPLL		3
eb7beb65ac30af Mars Cheng 2020-02-21  14  #define CLK_APMIXED_MFGPLL		4
eb7beb65ac30af Mars Cheng 2020-02-21  15  #define CLK_APMIXED_MMPLL		5
eb7beb65ac30af Mars Cheng 2020-02-21  16  #define CLK_APMIXED_UNIV2PLL		6
eb7beb65ac30af Mars Cheng 2020-02-21  17  #define CLK_APMIXED_MSDCPLL		7
eb7beb65ac30af Mars Cheng 2020-02-21  18  #define CLK_APMIXED_APLL1		8
eb7beb65ac30af Mars Cheng 2020-02-21  19  #define CLK_APMIXED_MPLL		9
eb7beb65ac30af Mars Cheng 2020-02-21  20  #define CLK_APMIXED_ULPOSC1		10
eb7beb65ac30af Mars Cheng 2020-02-21  21  #define CLK_APMIXED_ULPOSC2		11
eb7beb65ac30af Mars Cheng 2020-02-21  22  #define CLK_APMIXED_SSUSB26M		12
eb7beb65ac30af Mars Cheng 2020-02-21  23  #define CLK_APMIXED_APPLL26M		13
eb7beb65ac30af Mars Cheng 2020-02-21  24  #define CLK_APMIXED_MIPIC0_26M		14
eb7beb65ac30af Mars Cheng 2020-02-21  25  #define CLK_APMIXED_MDPLLGP26M		15
eb7beb65ac30af Mars Cheng 2020-02-21  26  #define CLK_APMIXED_MMSYS_F26M		16
eb7beb65ac30af Mars Cheng 2020-02-21  27  #define CLK_APMIXED_UFS26M		17
eb7beb65ac30af Mars Cheng 2020-02-21  28  #define CLK_APMIXED_MIPIC1_26M		18
eb7beb65ac30af Mars Cheng 2020-02-21  29  #define CLK_APMIXED_MEMPLL26M		19
eb7beb65ac30af Mars Cheng 2020-02-21  30  #define CLK_APMIXED_CLKSQ_LVPLL_26M	20
eb7beb65ac30af Mars Cheng 2020-02-21  31  #define CLK_APMIXED_MIPID0_26M		21
eb7beb65ac30af Mars Cheng 2020-02-21 @32  #define CLK_APMIXED_NR_CLK		22
eb7beb65ac30af Mars Cheng 2020-02-21  33  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

