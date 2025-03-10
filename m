Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE337C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 17:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eu103H/ZBHQdW8rl7KfvRhVz8cPnd/l6MaOlHmDTbgM=; b=TDL2FBaEFN1tFqNl+5db9Rt9uS
	V0cv36/smDgm/q+FpwcZ045XYL+s3+Iv/CzP2GwXbfEUy7lfEuTQ1fopxrvUygjO4Hgxjfyjj3Zfm
	4V2roapS2l/xCPIR/LY9OoqNLFqX81MG6dhQCJCKcqV4I+EUpw3tFVazEco9cU/z2O2PRqbz9HM/b
	j0pCeo0mCez/eCk3SJKo+XqHow2/3o0awBkQeBPDci+lSALdgP0/imIvi+OXlYPtvl+8v+5YFJAC8
	82nNZ1nH+EwqT0Kzwv04Jk7GHf7nuoSoJD9cTSTimhKs9bQkyQfsibNVzSYpwXs9QY+qT5l5lJ7ml
	WUUMp5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgmt-00000003U1A-2OLy;
	Mon, 10 Mar 2025 17:19:35 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgee-00000003Sdz-1XRu;
	Mon, 10 Mar 2025 17:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741626664; x=1773162664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=voNjo21o3BJ1yoO1GHLS+0pcetuEukpGtYife/kyYB8=;
  b=LPKKrdw1zz3PD5NatTc/ffPR0m+c+NhU7rnz1lezwivPdX8w1BOJDxv1
   ueWOH/l5cRIDtJ5Wf8dRiGTAEltHZEFydImmo2p8PQMdFfEkO9OcHJIrv
   TBf3sHhqwNroZyKUxY1jIHyZoV0J/j/jddjzRkHj4Qpfyl3rrgKmmGchI
   GZG2RpA2RA+2qD0JivGDB5TBz/2eNkcyMgKznOP1Lt4oDHbPfbhSGIM2Q
   N8xND+bzUMKnA3fA52xtAJgaIzS9QELUr3KM14koGvErP3kkDaOdhL30u
   Ioiu6UVLTVj2tDFg+NaWDEX84EK1y8nyYkBpefnAwJwYUGywN54n8RRYZ
   w==;
X-CSE-ConnectionGUID: t6y+PY1MQJeiNUG1QMeVLQ==
X-CSE-MsgGUID: TeUGw4vmRfq9uwSJrc3WzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="45427064"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="45427064"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 10:11:02 -0700
X-CSE-ConnectionGUID: rcALvII3SWuG40FzH3koiw==
X-CSE-MsgGUID: ZncTHJjsQEyr2ybwv6q34A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="120070023"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 10 Mar 2025 10:10:59 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trgeT-0004W8-1G;
	Mon, 10 Mar 2025 17:10:54 +0000
Date: Tue, 11 Mar 2025 01:10:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 3/4] clk: meson: a1: add the audio clock controller
 driver
Message-ID: <202503110016.L1KdYGVj-lkp@intel.com>
References: <20250309180940.1322531-4-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309180940.1322531-4-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_101104_417633_1818DE28 
X-CRM114-Status: GOOD (  14.97  )
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

Hi Jan,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on robh/for-next krzk/for-next krzk-dt/for-next linus/master v6.14-rc6 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Dakinevich/clk-meson-axg-share-the-set-of-audio-helper-macros/20250310-022012
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250309180940.1322531-4-jan.dakinevich%40salutedevices.com
patch subject: [PATCH v6 3/4] clk: meson: a1: add the audio clock controller driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250311/202503110016.L1KdYGVj-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503110016.L1KdYGVj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503110016.L1KdYGVj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/meson/a1-audio.c:807:11: error: call to undeclared function '__devm_auxiliary_device_create'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     807 |         auxdev = __devm_auxiliary_device_create(dev, dev->driver->name,
         |                  ^
   drivers/clk/meson/a1-audio.c:807:11: note: did you mean '__auxiliary_device_add'?
   include/linux/auxiliary_bus.h:221:5: note: '__auxiliary_device_add' declared here
     221 | int __auxiliary_device_add(struct auxiliary_device *auxdev, const char *modname);
         |     ^
>> drivers/clk/meson/a1-audio.c:807:9: error: incompatible integer to pointer conversion assigning to 'struct auxiliary_device *' from 'int' [-Wint-conversion]
     807 |         auxdev = __devm_auxiliary_device_create(dev, dev->driver->name,
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     808 |                                                 data->rst_drvname, NULL, 0);
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/__devm_auxiliary_device_create +807 drivers/clk/meson/a1-audio.c

   748	
   749	static int a1_audio_clkc_probe(struct platform_device *pdev)
   750	{
   751		struct device *dev = &pdev->dev;
   752		const struct a1_audio_data *data;
   753		struct auxiliary_device *auxdev;
   754		struct regmap *map;
   755		void __iomem *base;
   756		struct clk *clk;
   757		unsigned int i;
   758		int ret;
   759	
   760		data = device_get_match_data(dev);
   761		if (!data)
   762			return -EINVAL;
   763	
   764		clk = devm_clk_get_enabled(dev, "pclk");
   765		if (IS_ERR(clk))
   766			return PTR_ERR(clk);
   767	
   768		base = devm_platform_ioremap_resource(pdev, 0);
   769		if (IS_ERR(base))
   770			return PTR_ERR(base);
   771	
   772		map = devm_regmap_init_mmio(dev, base, &a1_audio_regmap_cfg);
   773		if (IS_ERR(map))
   774			return PTR_ERR(map);
   775	
   776		ret = device_reset(dev);
   777		if (ret)
   778			return ret;
   779	
   780		for (i = 0; i < data->hw_clks.num; i++) {
   781			struct clk_hw *hw = data->hw_clks.hws[i];
   782			struct clk_regmap *clk_regmap = to_clk_regmap(hw);
   783	
   784			if (!hw)
   785				continue;
   786	
   787			clk_regmap->map = map;
   788		}
   789	
   790		for (i = 0; i < data->hw_clks.num; i++) {
   791			struct clk_hw *hw;
   792	
   793			hw = data->hw_clks.hws[i];
   794			if (!hw)
   795				continue;
   796	
   797			ret = devm_clk_hw_register(dev, hw);
   798			if (ret)
   799				return ret;
   800		}
   801	
   802		ret = devm_of_clk_add_hw_provider(dev, meson_clk_hw_get,
   803						  (void *)&data->hw_clks);
   804		if (ret)
   805			return ret;
   806	
 > 807		auxdev = __devm_auxiliary_device_create(dev, dev->driver->name,
   808							data->rst_drvname, NULL, 0);
   809		if (!auxdev)
   810			return -ENODEV;
   811	
   812		return 0;
   813	}
   814	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

