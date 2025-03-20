Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11E8C36000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 10:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWtEp4gHcSVvx6tBjlfpUNTEQlMvgGUN1eH71WxsVx4=; b=LlNZztEcJ7zMwGcZo4UOSqsghn
	W7rllCf9C4F79PdNVsyxfibo9QYHCSuNQkDr/ZtgcccqNcVyUS2IMFpGYYpedQglghkzydYQQZpYx
	Z6uNAXDzzq/SLWutcPAy+FkjvtnLrxw7zBSFwQxm/nD7ZDIzKbTMqUtCHI5NxFlW9goXV27De1rGZ
	N59+oBUCIbwewxMWsIxLhAu+0mf9EEkZgs2UprnTo8KkISEwfW76zBVlb8sCROqA66w6/pu8/3a5v
	/Jsg45VgUQUXIpqh5O7iOqj/HynYrk9dur6c5sZDBughl02jh+NDEZ/5HI37aOdC88zBCEsmTa0Yz
	yTMRgQ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCof-0000000BmWZ-3cWe;
	Thu, 20 Mar 2025 10:07:57 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCmy-0000000BmNW-1diE;
	Thu, 20 Mar 2025 10:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742465172; x=1774001172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1/W9ZnOxLtkGDumZwqSmDSGWKZan3W+vbsFUgU9wlvg=;
  b=OvGsA3s15NJmPYXGkZNduJR885eQS8qGopYWUNmnEax1AX9keVb1/BPb
   OPzYkyVJ4MvORdoc7M4wDGHTU1VRduwsGOQ8QRj7tV39l2zb0du2eoOFs
   iA68UCRxGRb3aRCAM9j+SbyZHvUqO6kTVUs6apei6oTUpFeIRF7xWNlje
   1TkzfD2syPhjH1YuK0Jcz/GUPlhcsuMPJCrQ+QlLUeKL2NYAAoD3x5OVi
   EsJffXLf3ZiZaBmdx3OJal4WZtd7t1iaXk6olOg42e0gKWu0zqrA96ACH
   MlCc1Z+CZHv+mNUN8vifuuOl/SxJV2XlvWGjiy+FDNLoFoZV2NYaIPnam
   w==;
X-CSE-ConnectionGUID: Q+bBUVnyRFKSpZny4t0qIg==
X-CSE-MsgGUID: 3OSXVKndSjO/oLLypbw1sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="47567615"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="47567615"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 03:06:09 -0700
X-CSE-ConnectionGUID: Fs4yULOuRSeeEEGeFKebWw==
X-CSE-MsgGUID: RfAYdKxjQ6Khx2MJlFA6HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="123511643"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 Mar 2025 03:06:04 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvCmo-0000Lr-0X;
	Thu, 20 Mar 2025 10:06:02 +0000
Date: Thu, 20 Mar 2025 18:05:57 +0800
From: kernel test robot <lkp@intel.com>
To: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com,
	jiebing chen <jiebing.chen@amlogic.com>
Subject: Re: [PATCH v4 5/6] clk: meson: axg-audio: Add the mclk pad div for
 s4 chip
Message-ID: <202503201714.sI6HIkYs-lkp@intel.com>
References: <20250319-audio_drvier-v4-5-686867fad719@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319-audio_drvier-v4-5-686867fad719@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_030612_472528_68C5A7A3 
X-CRM114-Status: GOOD (  15.72  )
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

Hi jiebing,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab]

url:    https://github.com/intel-lab-lkp/linux/commits/jiebing-chen-via-B4-Relay/dt-bindings-clock-meson-Add-audio-power-domain-for-s4-soc/20250319-151110
base:   6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
patch link:    https://lore.kernel.org/r/20250319-audio_drvier-v4-5-686867fad719%40amlogic.com
patch subject: [PATCH v4 5/6] clk: meson: axg-audio: Add the mclk pad div for s4 chip
config: arm64-randconfig-001-20250320 (https://download.01.org/0day-ci/archive/20250320/202503201714.sI6HIkYs-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503201714.sI6HIkYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503201714.sI6HIkYs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/meson/axg-audio.c:2228:34: error: cannot assign to variable 'aud_regmap_config' with const-qualified type 'const struct regmap_config'
    2228 |                 aud_regmap_config.max_register = resource_size(res) - 4;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/clk/meson/axg-audio.c:2220:37: note: variable 'aud_regmap_config' declared const here
    2220 |                 static const struct regmap_config aud_regmap_config = {
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
    2221 |                         .reg_bits = 32,
         |                         ~~~~~~~~~~~~~~~
    2222 |                         .val_bits = 32,
         |                         ~~~~~~~~~~~~~~~
    2223 |                         .reg_stride = 4,
         |                         ~~~~~~~~~~~~~~~~
    2224 |                 };
         |                 ~
   drivers/clk/meson/axg-audio.c:2229:26: error: cannot assign to variable 'aud_regmap_config' with const-qualified type 'const struct regmap_config'
    2229 |                 aud_regmap_config.name =
         |                 ~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/clk/meson/axg-audio.c:2220:37: note: variable 'aud_regmap_config' declared const here
    2220 |                 static const struct regmap_config aud_regmap_config = {
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
    2221 |                         .reg_bits = 32,
         |                         ~~~~~~~~~~~~~~~
    2222 |                         .val_bits = 32,
         |                         ~~~~~~~~~~~~~~~
    2223 |                         .reg_stride = 4,
         |                         ~~~~~~~~~~~~~~~~
    2224 |                 };
         |                 ~
   2 errors generated.


vim +2228 drivers/clk/meson/axg-audio.c

  2175	
  2176	static int axg_audio_clkc_probe(struct platform_device *pdev)
  2177	{
  2178		struct device *dev = &pdev->dev;
  2179		const struct audioclk_data *data;
  2180		struct axg_audio_reset_data *rst;
  2181		struct regmap *map;
  2182		void __iomem *regs;
  2183		struct clk_hw *hw;
  2184		struct clk *clk;
  2185		int ret, i;
  2186	
  2187		data = of_device_get_match_data(dev);
  2188		if (!data)
  2189			return -EINVAL;
  2190	
  2191		regs = devm_platform_ioremap_resource(pdev, 0);
  2192		if (IS_ERR(regs))
  2193			return PTR_ERR(regs);
  2194	
  2195		axg_audio_regmap_cfg.max_register = data->max_register;
  2196		map = devm_regmap_init_mmio(dev, regs, &axg_audio_regmap_cfg);
  2197		if (IS_ERR(map)) {
  2198			dev_err(dev, "failed to init regmap: %ld\n", PTR_ERR(map));
  2199			return PTR_ERR(map);
  2200		}
  2201	
  2202		/* Get the mandatory peripheral clock */
  2203		clk = devm_clk_get_enabled(dev, "pclk");
  2204		if (IS_ERR(clk))
  2205			return PTR_ERR(clk);
  2206	
  2207		ret = device_reset(dev);
  2208		if (ret) {
  2209			dev_err_probe(dev, ret, "failed to reset device\n");
  2210			return ret;
  2211		}
  2212	
  2213		/* Populate regmap for the regmap backed clocks */
  2214		for (i = 0; i < data->regmap_clk_num; i++)
  2215			data->regmap_clks[i]->map = map;
  2216	
  2217		/* some amlogic chip clock pad reg domian is different */
  2218		if (audio_clock_pad_is_new_regmap(dev->of_node)) {
  2219			struct resource *res;
  2220			static const struct regmap_config aud_regmap_config = {
  2221				.reg_bits = 32,
  2222				.val_bits = 32,
  2223				.reg_stride = 4,
  2224			};
  2225			regs = devm_platform_get_and_ioremap_resource(pdev, 1, &res);
  2226			if (IS_ERR(regs))
  2227				return PTR_ERR(regs);
> 2228			aud_regmap_config.max_register = resource_size(res) - 4;
  2229			aud_regmap_config.name =
  2230				devm_kasprintf(dev, GFP_KERNEL, "%s-%s", dev->of_node->name, "pads");
  2231			map = devm_regmap_init_mmio(dev, regs, &aud_regmap_config);
  2232			/* Populate clk pad regmap for the regmap backed clocks */
  2233			for (i = 0; i < data->regmap_clk_pads_num; i++)
  2234				data->regmap_clks_pads[i]->map = map;
  2235		}
  2236		/* Take care to skip the registered input clocks */
  2237		for (i = AUD_CLKID_DDR_ARB; i < data->hw_clks.num; i++) {
  2238			const char *name;
  2239	
  2240			hw = data->hw_clks.hws[i];
  2241			/* array might be sparse */
  2242			if (!hw)
  2243				continue;
  2244	
  2245			name = hw->init->name;
  2246			ret = devm_clk_hw_register(dev, hw);
  2247			if (ret) {
  2248				dev_err(dev, "failed to register clock %s\n", name);
  2249				return ret;
  2250			}
  2251		}
  2252	
  2253		ret = devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
  2254		if (ret)
  2255			return ret;
  2256	
  2257		/* Stop here if there is no reset */
  2258		if (!data->reset_num)
  2259			return 0;
  2260	
  2261		rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
  2262		if (!rst)
  2263			return -ENOMEM;
  2264	
  2265		rst->map = map;
  2266		rst->offset = data->reset_offset;
  2267		rst->rstc.nr_resets = data->reset_num;
  2268		rst->rstc.ops = &axg_audio_rstc_ops;
  2269		rst->rstc.of_node = dev->of_node;
  2270		rst->rstc.owner = THIS_MODULE;
  2271	
  2272		return devm_reset_controller_register(dev, &rst->rstc);
  2273	}
  2274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

