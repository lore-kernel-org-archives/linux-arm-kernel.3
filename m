Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C2BCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 09:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39wcl2WHXNtJd94YnQJEWlk/wamWBZG/CnzmqVAhKPU=; b=bWPiUQ6BG4Ib6p41YJi0lOZ2nQ
	HNwLxBgv68iO1XmFckgsIE7iQH0yHVSDApmDt4xqhBC6rdNPqScmqOgMtWR3Om8rYwpbxOJf6gLR+
	lT1aygq50heMTzW5PDjw/I5XX7OrIykhLsTNvqGjCzNGMKIjhHB6KMr6Up92jBGxxHqfsa74cUwn3
	kAJs+FlMNCm9Q2lgHbH6Apuj/szOqItX6ayJCBMNFYlmpFwGOaPtXRaaYYUb7ee0JaMtnstuHQI9y
	qWYmHu0HySXksY7Y8O1aNKLGFD5uIH1KJ4eDiwUu/lkJHp0DRMk/ZzWHA3XclRoNFQo/MZOGz3T/f
	jOHYueCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AUm-000000022Pc-2ind;
	Mon, 29 Sep 2025 09:48:36 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AUj-000000022P6-2Y1M;
	Mon, 29 Sep 2025 09:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759139314; x=1790675314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KHG16Xw+5eWJbib027Wh0wiUKjgw1T/ctp6Day8cStw=;
  b=BFjgS9lXDD1fv0jfxcjzBKt4DxvQqnj2x+MYLCDOaM1zImyFgl2rMWxP
   9I1lYHMd41LwGdB3KhPVmmWm6BCm/HqfPKCbnyuufbfdobqhMq2iLbXif
   cubMBHN8HOeUiPslnBhj46n4t7lvNjDh+utJPITznFn2gYfX79Nuu7Oz3
   DTPLgtswi9BrQXedZjdSPiTYlrwl48EhP7g0bJtDLZCIx4kWEYcdtfgya
   SWIqj+wjyc53OBKEY30TQW7SZJV9l2S5ZIOD7P/dta51wjhmxuGcOI+ju
   q7cC14n7i3rFr2u53avhHbMGbv7hmXZ2rrbggbsft2/TWyuiM7L2ssX2j
   w==;
X-CSE-ConnectionGUID: FNL+j3KeTouGhdByA/toTQ==
X-CSE-MsgGUID: KVbx5oVWSfqWWjtnKevxMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="64003373"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="64003373"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 02:48:28 -0700
X-CSE-ConnectionGUID: Bzw6+n8KSViQzx+VavmAmA==
X-CSE-MsgGUID: XE3RqHw8RoGH0CYN8GabXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="209139612"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Sep 2025 02:48:26 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3AUZ-00007v-2m;
	Mon, 29 Sep 2025 09:48:23 +0000
Date: Mon, 29 Sep 2025 17:48:10 +0800
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
Message-ID: <202509291736.rboPY1Uj-lkp@intel.com>
References: <20250929023621.1968-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929023621.1968-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_024833_660995_FA361FCA 
X-CRM114-Status: GOOD (  13.91  )
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

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.17 next-20250926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haotian-Zhang/clk-mediatek-Use-devm_alloc-for-clk_data-allocation-to-fix-memory-leak-on-probe-error/20250929-103835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250929023621.1968-1-vulab%40iscas.ac.cn
patch subject: [PATCH] clk: mediatek: Use devm_alloc for clk_data allocation to fix memory leak on probe error
config: arc-randconfig-002-20250929 (https://download.01.org/0day-ci/archive/20250929/202509291736.rboPY1Uj-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250929/202509291736.rboPY1Uj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509291736.rboPY1Uj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/clk/mediatek/clk-mt6765.c:20:
   drivers/clk/mediatek/clk-mt6765.c: In function 'clk_mt6765_apmixed_probe':
>> include/dt-bindings/clock/mt6765-clk.h:32:29: warning: passing argument 1 of 'mtk_devm_alloc_clk_data' makes pointer from integer without a cast [-Wint-conversion]
    #define CLK_APMIXED_NR_CLK  22
                                ^~
   drivers/clk/mediatek/clk-mt6765.c:739:37: note: in expansion of macro 'CLK_APMIXED_NR_CLK'
     clk_data = mtk_devm_alloc_clk_data(CLK_APMIXED_NR_CLK);
                                        ^~~~~~~~~~~~~~~~~~
   In file included from drivers/clk/mediatek/clk-mt6765.c:16:
   drivers/clk/mediatek/clk-mtk.h:234:29: note: expected 'struct device *' but argument is of type 'int'
    struct clk_hw_onecell_data *mtk_devm_alloc_clk_data(struct device *dev,
                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt6765.c:739:13: error: too few arguments to function 'mtk_devm_alloc_clk_data'
     clk_data = mtk_devm_alloc_clk_data(CLK_APMIXED_NR_CLK);
                ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/clk/mediatek/clk-mt6765.c:16:
   drivers/clk/mediatek/clk-mtk.h:234:29: note: declared here
    struct clk_hw_onecell_data *mtk_devm_alloc_clk_data(struct device *dev,
                                ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/clk/mediatek/clk-mt6765.c:20:
   drivers/clk/mediatek/clk-mt6765.c: In function 'clk_mt6765_top_probe':
   include/dt-bindings/clock/mt6765-clk.h:161:26: warning: passing argument 1 of 'mtk_devm_alloc_clk_data' makes pointer from integer without a cast [-Wint-conversion]
    #define CLK_TOP_NR_CLK   126
                             ^~~
   drivers/clk/mediatek/clk-mt6765.c:773:37: note: in expansion of macro 'CLK_TOP_NR_CLK'
     clk_data = mtk_devm_alloc_clk_data(CLK_TOP_NR_CLK);
                                        ^~~~~~~~~~~~~~
   In file included from drivers/clk/mediatek/clk-mt6765.c:16:
   drivers/clk/mediatek/clk-mtk.h:234:29: note: expected 'struct device *' but argument is of type 'int'
    struct clk_hw_onecell_data *mtk_devm_alloc_clk_data(struct device *dev,
                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt6765.c:773:13: error: too few arguments to function 'mtk_devm_alloc_clk_data'
     clk_data = mtk_devm_alloc_clk_data(CLK_TOP_NR_CLK);
                ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/clk/mediatek/clk-mt6765.c:16:
   drivers/clk/mediatek/clk-mtk.h:234:29: note: declared here
    struct clk_hw_onecell_data *mtk_devm_alloc_clk_data(struct device *dev,
                                ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/clk/mediatek/clk-mt6765.c:20:
   drivers/clk/mediatek/clk-mt6765.c: In function 'clk_mt6765_ifr_probe':
   include/dt-bindings/clock/mt6765-clk.h:228:26: warning: passing argument 1 of 'mtk_devm_alloc_clk_data' makes pointer from integer without a cast [-Wint-conversion]
    #define CLK_IFR_NR_CLK   64
                             ^~
   drivers/clk/mediatek/clk-mt6765.c:813:37: note: in expansion of macro 'CLK_IFR_NR_CLK'
     clk_data = mtk_devm_alloc_clk_data(CLK_IFR_NR_CLK);
                                        ^~~~~~~~~~~~~~
   In file included from drivers/clk/mediatek/clk-mt6765.c:16:
   drivers/clk/mediatek/clk-mtk.h:234:29: note: expected 'struct device *' but argument is of type 'int'
    struct clk_hw_onecell_data *mtk_devm_alloc_clk_data(struct device *dev,
                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt6765.c:813:13: error: too few arguments to function 'mtk_devm_alloc_clk_data'
     clk_data = mtk_devm_alloc_clk_data(CLK_IFR_NR_CLK);
                ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/clk/mediatek/clk-mt6765.c:16:
   drivers/clk/mediatek/clk-mtk.h:234:29: note: declared here
    struct clk_hw_onecell_data *mtk_devm_alloc_clk_data(struct device *dev,
                                ^~~~~~~~~~~~~~~~~~~~~~~


vim +/mtk_devm_alloc_clk_data +32 include/dt-bindings/clock/mt6765-clk.h

eb7beb65ac30afb Mars Cheng 2020-02-21   8  
eb7beb65ac30afb Mars Cheng 2020-02-21   9  /* APMIXEDSYS */
eb7beb65ac30afb Mars Cheng 2020-02-21  10  #define CLK_APMIXED_ARMPLL_L		0
eb7beb65ac30afb Mars Cheng 2020-02-21  11  #define CLK_APMIXED_ARMPLL		1
eb7beb65ac30afb Mars Cheng 2020-02-21  12  #define CLK_APMIXED_CCIPLL		2
eb7beb65ac30afb Mars Cheng 2020-02-21  13  #define CLK_APMIXED_MAINPLL		3
eb7beb65ac30afb Mars Cheng 2020-02-21  14  #define CLK_APMIXED_MFGPLL		4
eb7beb65ac30afb Mars Cheng 2020-02-21  15  #define CLK_APMIXED_MMPLL		5
eb7beb65ac30afb Mars Cheng 2020-02-21  16  #define CLK_APMIXED_UNIV2PLL		6
eb7beb65ac30afb Mars Cheng 2020-02-21  17  #define CLK_APMIXED_MSDCPLL		7
eb7beb65ac30afb Mars Cheng 2020-02-21  18  #define CLK_APMIXED_APLL1		8
eb7beb65ac30afb Mars Cheng 2020-02-21  19  #define CLK_APMIXED_MPLL		9
eb7beb65ac30afb Mars Cheng 2020-02-21  20  #define CLK_APMIXED_ULPOSC1		10
eb7beb65ac30afb Mars Cheng 2020-02-21  21  #define CLK_APMIXED_ULPOSC2		11
eb7beb65ac30afb Mars Cheng 2020-02-21  22  #define CLK_APMIXED_SSUSB26M		12
eb7beb65ac30afb Mars Cheng 2020-02-21  23  #define CLK_APMIXED_APPLL26M		13
eb7beb65ac30afb Mars Cheng 2020-02-21  24  #define CLK_APMIXED_MIPIC0_26M		14
eb7beb65ac30afb Mars Cheng 2020-02-21  25  #define CLK_APMIXED_MDPLLGP26M		15
eb7beb65ac30afb Mars Cheng 2020-02-21  26  #define CLK_APMIXED_MMSYS_F26M		16
eb7beb65ac30afb Mars Cheng 2020-02-21  27  #define CLK_APMIXED_UFS26M		17
eb7beb65ac30afb Mars Cheng 2020-02-21  28  #define CLK_APMIXED_MIPIC1_26M		18
eb7beb65ac30afb Mars Cheng 2020-02-21  29  #define CLK_APMIXED_MEMPLL26M		19
eb7beb65ac30afb Mars Cheng 2020-02-21  30  #define CLK_APMIXED_CLKSQ_LVPLL_26M	20
eb7beb65ac30afb Mars Cheng 2020-02-21  31  #define CLK_APMIXED_MIPID0_26M		21
eb7beb65ac30afb Mars Cheng 2020-02-21 @32  #define CLK_APMIXED_NR_CLK		22
eb7beb65ac30afb Mars Cheng 2020-02-21  33  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

