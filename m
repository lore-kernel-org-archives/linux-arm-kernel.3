Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9080CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 15:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGwK7A+dpYPFuDs4p60Hg7T4W18aXxxK3VMtpCvFaEg=; b=ve4ibuNrqFUAHTb90X0Ir8tuDo
	trc4V/79cN2tTlkT22szXqjquy/6LnkFfTXI9KhOS25ZK9b2ZMyEQUoOuuy7Q+CcX73QAUsyk7ydL
	dWWlWATJq/mEtcemyukIxY9es5Ygf1AufVUPLMyl2aBni3mMWO3w/myuPYY1bXNSmaQf1DZ2ORBaY
	feDLxakwJbL1GPPqfdOgpAFORYc3XZ48c9fFN5lurUhTxp1dimPhqtYu/t+6GPdJ3fYhlv7hs05qT
	RKmMf1oiQU+tJu/jp2E1mSnMewYI10jPtYkF4TX1vJU4l526yV3HDHGwTTKjzkhVD2bOQyTaw+0cS
	B/3BjHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9Hs-0000000A6jh-0e3g;
	Sat, 18 Oct 2025 15:56:08 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9Hm-0000000A6jE-1xD0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 15:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760802962; x=1792338962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1gVJ8CjsGwA0FTk/Tm3gXx44AUXg3U1s1eJGlpVlkHM=;
  b=nCDjVzEcJzV9ry7Jgo9Epj9G+o+HQQik0o6sFDtQHEHhDSUnsLym3l2t
   +5X46nAgfbDvPLeTJPgPH4pqbS/mWBHz3Fzwd/czuRbROio0ipT5+6Q83
   pLKz9LCLQHHRTbarNy9PN6nmStQm5S6EdA2y6uLiFKwbna8mF9z2lZTwL
   tAiD+xKmRo7+h/gyPFFU15QqjaQ+pNbWsq4NEJGpjUMewFOFiEyOspUb5
   3bnlIoDmccj1GKQ/Fi6bypi7PCurv7R77w8q0b5fBH+UfbHop0B+tQqaZ
   6b/CSDz476i7oXoCFcD+fur15L6tQzFW5NjLtfqYaey5ymtyAy4bofUOQ
   g==;
X-CSE-ConnectionGUID: oqpMam+eQyS3hr3nxCXV7g==
X-CSE-MsgGUID: AA1+t196TlK9sgjloaz7ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63138897"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="63138897"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 08:56:00 -0700
X-CSE-ConnectionGUID: I4TNBVbjTM+FEQOJ8MGs+Q==
X-CSE-MsgGUID: IsFoQzfXSWehBMmDnrDCzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="182985402"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 Oct 2025 08:55:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA9Hd-0008Nl-1H;
	Sat, 18 Oct 2025 15:55:53 +0000
Date: Sat, 18 Oct 2025 23:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 3/8] clk: imx: add driver for imx8ulp's sim lpav
Message-ID: <202510182350.57sb54Rm-lkp@intel.com>
References: <20251017112025.11997-4-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017112025.11997-4-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_085602_574998_2AC5146E 
X-CRM114-Status: GOOD (  15.62  )
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

Hi Laurentiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on pza/reset/next]
[also build test ERROR on abelvesa/clk/imx abelvesa/for-next linus/master v6.18-rc1 next-20251017]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurentiu-Mihalcea/reset-imx8mp-audiomix-Fix-bad-mask-values/20251017-192620
base:   https://git.pengutronix.de/git/pza/linux reset/next
patch link:    https://lore.kernel.org/r/20251017112025.11997-4-laurentiumihalcea111%40gmail.com
patch subject: [PATCH v2 3/8] clk: imx: add driver for imx8ulp's sim lpav
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20251018/202510182350.57sb54Rm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510182350.57sb54Rm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510182350.57sb54Rm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/imx/clk-imx8ulp-sim-lpav.c: In function 'clk_imx8ulp_sim_lpav_aux_reset_release':
>> drivers/clk/imx/clk-imx8ulp-sim-lpav.c:52:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
      52 |         kfree(adev);
         |         ^~~~~
   drivers/clk/imx/clk-imx8ulp-sim-lpav.c: In function 'clk_imx8ulp_sim_lpav_register_aux_reset':
>> drivers/clk/imx/clk-imx8ulp-sim-lpav.c:65:16: error: cleanup argument not a function
      65 |         struct auxiliary_device *adev __free(kfree) = NULL;
         |                ^~~~~~~~~~~~~~~~
>> drivers/clk/imx/clk-imx8ulp-sim-lpav.c:68:16: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
      68 |         adev = kzalloc(sizeof(*adev), GFP_KERNEL);
         |                ^~~~~~~
>> drivers/clk/imx/clk-imx8ulp-sim-lpav.c:68:14: error: assignment to 'struct auxiliary_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      68 |         adev = kzalloc(sizeof(*adev), GFP_KERNEL);
         |              ^


vim +/kfree +52 drivers/clk/imx/clk-imx8ulp-sim-lpav.c

    46	
    47	#ifdef CONFIG_RESET_CONTROLLER
    48	static void clk_imx8ulp_sim_lpav_aux_reset_release(struct device *dev)
    49	{
    50		struct auxiliary_device *adev = to_auxiliary_dev(dev);
    51	
  > 52		kfree(adev);
    53	}
    54	
    55	static void clk_imx8ulp_sim_lpav_unregister_aux_reset(void *data)
    56	{
    57		struct auxiliary_device *adev = data;
    58	
    59		auxiliary_device_delete(adev);
    60		auxiliary_device_uninit(adev);
    61	}
    62	
    63	static int clk_imx8ulp_sim_lpav_register_aux_reset(struct platform_device *pdev)
    64	{
  > 65		struct auxiliary_device *adev __free(kfree) = NULL;
    66		int ret;
    67	
  > 68		adev = kzalloc(sizeof(*adev), GFP_KERNEL);
    69		if (!adev)
    70			return -ENOMEM;
    71	
    72		adev->name = "reset";
    73		adev->dev.parent = &pdev->dev;
    74		adev->dev.release = clk_imx8ulp_sim_lpav_aux_reset_release;
    75	
    76		ret = auxiliary_device_init(adev);
    77		if (ret) {
    78			dev_err(&pdev->dev, "failed to initialize aux dev\n");
    79			return ret;
    80		}
    81	
    82		ret = auxiliary_device_add(adev);
    83		if (ret) {
    84			auxiliary_device_uninit(adev);
    85			dev_err(&pdev->dev, "failed to add aux dev\n");
    86			return ret;
    87		}
    88	
    89		return devm_add_action_or_reset(&pdev->dev,
    90						clk_imx8ulp_sim_lpav_unregister_aux_reset,
    91						no_free_ptr(adev));
    92	}
    93	#else
    94	static int clk_imx8ulp_sim_lpav_register_aux_reset(struct platform_device *pdev)
    95	{
    96		return 0;
    97	}
    98	#endif /* CONFIG_RESET_CONTROLLER */
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

