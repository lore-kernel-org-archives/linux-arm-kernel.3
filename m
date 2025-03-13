Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA76C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 00:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyI2TsF87dOGRwZvS3FlUjBuuyoN4r04omegq8UEV9U=; b=EifuedLn/aubg0MUzGYqDcH8Ts
	ZE2Sgbhrdon3UJtQ8pnlfxOTE2QjHIODUsz1sbNj5N+vuy/8Z6ulnzBJW3ovyerpF0F+bPg2SgZjw
	ItTOgi/ZR+mK9nXZlrVK45PPBXdfayyKF3jsfwUu8TAUjBtdhQLuCLNmgIDlABfQbF7vNz+eYvmwp
	n3/AOz2Wq63n0UCVN9h7OYvFtOzy4Dw7iyboqMT6HMYG4xqVZvrygNUBchO+o9b39+k9d4hPVpPcO
	5PAp5pR9BvTq6XmjjQ8wdqY86xgRwYy0SZ1Ehvhn57qtyY2veU09YgN/cMr1vA9i4bTYHYtDSFReu
	VYz+4cug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsWK1-00000009oUJ-2rvn;
	Thu, 13 Mar 2025 00:21:13 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsWIM-00000009oNu-1JJn;
	Thu, 13 Mar 2025 00:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741825171; x=1773361171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OC2kJdO0bX1Vrlgy1KVz18BJpr1zZxwC8vQSJOOX8ws=;
  b=oIGgIbImdL+0tjrmhf5dBP0lEF6qhjdUtNfjHvuZa/KASLIMVXxYc1yU
   pnbR2r07iIBUFyNwLbtoZsH7/a/1lOVpykY5LO8nlbksQe/V8DYgsizvu
   zWuGQ0VcEhRARK+yVVGF+h+ST/XWpHKO/pv6WcWCiN7bbDXJy+lS8Cf6K
   YT6MnX4n0UkMgpH1BLr3YO5gjw4N1Ks/PayjoeChVcTPms3s1LI1oo6hh
   yfKka8WTQ1BVXnT/QEKkobfnw7iZQGwaWTw2YSBcwKOsicaXwjo2q+PRw
   r3/wtbVxsgOp6Dlw/MBNXM8T5PEQIbmIacYlie6EfxhQa4vYfSP6BZLzq
   g==;
X-CSE-ConnectionGUID: KI7Bp9+gRTmjwFYtIg/hXg==
X-CSE-MsgGUID: AUzVsINgTWK9/mGE2gqkmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42654591"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="42654591"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 17:19:30 -0700
X-CSE-ConnectionGUID: s3sqfxtzSe6SU3Vj1W6z7Q==
X-CSE-MsgGUID: nwNajwp9RgyA/BRF2hWX+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="125870236"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 12 Mar 2025 17:19:25 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsWIE-000908-2X;
	Thu, 13 Mar 2025 00:19:22 +0000
Date: Thu, 13 Mar 2025 08:19:09 +0800
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
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 3/4] clk: meson: a1: add the audio clock controller
 driver
Message-ID: <202503131003.x6L69hJL-lkp@intel.com>
References: <20250309180940.1322531-4-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309180940.1322531-4-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_171930_429165_ACF2B10C 
X-CRM114-Status: GOOD (  14.17  )
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
[also build test ERROR on robh/for-next krzk/for-next krzk-dt/for-next linus/master v6.14-rc6 next-20250312]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Dakinevich/clk-meson-axg-share-the-set-of-audio-helper-macros/20250310-022012
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250309180940.1322531-4-jan.dakinevich%40salutedevices.com
patch subject: [PATCH v6 3/4] clk: meson: a1: add the audio clock controller driver
config: arm64-randconfig-r131-20250312 (https://download.01.org/0day-ci/archive/20250313/202503131003.x6L69hJL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250313/202503131003.x6L69hJL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503131003.x6L69hJL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/meson/a1-audio.c: In function 'a1_audio_clkc_probe':
>> drivers/clk/meson/a1-audio.c:807:18: error: implicit declaration of function '__devm_auxiliary_device_create'; did you mean '__auxiliary_device_add'? [-Wimplicit-function-declaration]
     807 |         auxdev = __devm_auxiliary_device_create(dev, dev->driver->name,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  __auxiliary_device_add
>> drivers/clk/meson/a1-audio.c:807:16: error: assignment to 'struct auxiliary_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     807 |         auxdev = __devm_auxiliary_device_create(dev, dev->driver->name,
         |                ^


vim +807 drivers/clk/meson/a1-audio.c

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

