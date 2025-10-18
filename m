Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9073FCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 11:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPhE7P7FuS/qPa7zqyeMrwzg8XYkJkmdI5yXJVLLIgo=; b=0o8dQOu5Pwyw62kgcyyrnz2wr3
	V3OAAJYUpF0hTzCRYJDXN9MykwgxCaJl/78MRDKSrKBEAsrpCwXktgNh7Yge7yPv0GLM9VO91klwk
	EjhLneTmdRG/rGoYsRgtRXb9ow+oyL0dOJHdESZ2mqgZyjgspoITTBujrQnq26Ez03vyDt8LFcEv9
	192vthQTdd/3UdxRG8EsT4CanhANG1oD5LsWkMt90PgHRjdGBxHAkfySuTD3UCTAv69WCjVqLeyT+
	DCx8xOS7oAhTgapoAf9s7MqHHQForqPiGE2D8AkOWj4B8kryYgmzL8XAvtzJQUo5TWvHf2pnBbzEt
	kXuC5CXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA5Cj-00000009rZf-0wEz;
	Sat, 18 Oct 2025 11:34:33 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA5Cg-00000009rZI-24Uq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 11:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760787270; x=1792323270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lxmXxI9NVNvUFbJkHjVwI4PAcvRKTU8tPXimX86qghE=;
  b=POo8/llh7yiC4HejEK65UFAQ/Ed1uBZA/lTx9qSEMkm64RoniGy2ijIL
   DCe3Gbh5wmWm5iN95MZqPAMwM4eQhVMNUs80f++E+2KW9ynOOa6ZpOWHK
   SkymuHW83PnhQDrKBTsakiPfltcqYa6Sa2YCvLZaKOGgPA+EauIz6FLQo
   QlZ5hGx9Ra/8RzYxpn1f3pkpL45MaETwVRYo+qMlDpkf80g1W5QqioT3l
   Y94QJ92F42h+MmESMnChW5EEJaHSwfWGo4k+OTSb5KPG3AWst1qzyasLa
   eNZ2p1GOgTXAClvFw6IuObyGIauZDJOGifukNUrhaHu041jcNdkst5rKZ
   A==;
X-CSE-ConnectionGUID: 5L+vlH8/SNm9ryyarit5hg==
X-CSE-MsgGUID: W6fIJVLfTK6/AcwJtQFMAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62902574"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62902574"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 04:34:24 -0700
X-CSE-ConnectionGUID: hItXz9+CR9+morbJD6EyVA==
X-CSE-MsgGUID: MR5JyuycRausU/z8Jyg5Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="182491676"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 Oct 2025 04:34:20 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA5CU-0008G9-0M;
	Sat, 18 Oct 2025 11:34:18 +0000
Date: Sat, 18 Oct 2025 19:33:56 +0800
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
Message-ID: <202510181949.IazLEB6V-lkp@intel.com>
References: <20251017112025.11997-4-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017112025.11997-4-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_043430_629111_CA86BCE0 
X-CRM114-Status: GOOD (  16.54  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on pza/reset/next]
[also build test WARNING on abelvesa/clk/imx abelvesa/for-next linus/master v6.18-rc1 next-20251017]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurentiu-Mihalcea/reset-imx8mp-audiomix-Fix-bad-mask-values/20251017-192620
base:   https://git.pengutronix.de/git/pza/linux reset/next
patch link:    https://lore.kernel.org/r/20251017112025.11997-4-laurentiumihalcea111%40gmail.com
patch subject: [PATCH v2 3/8] clk: imx: add driver for imx8ulp's sim lpav
config: xtensa-randconfig-r132-20251018 (https://download.01.org/0day-ci/archive/20251018/202510181949.IazLEB6V-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181949.IazLEB6V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181949.IazLEB6V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/imx/clk-imx8ulp-sim-lpav.c: In function 'clk_imx8ulp_sim_lpav_aux_reset_release':
   drivers/clk/imx/clk-imx8ulp-sim-lpav.c:52:9: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
      52 |         kfree(adev);
         |         ^~~~~
   drivers/clk/imx/clk-imx8ulp-sim-lpav.c: In function 'clk_imx8ulp_sim_lpav_register_aux_reset':
   drivers/clk/imx/clk-imx8ulp-sim-lpav.c:65:16: error: cleanup argument not a function
      65 |         struct auxiliary_device *adev __free(kfree) = NULL;
         |                ^~~~~~~~~~~~~~~~
   drivers/clk/imx/clk-imx8ulp-sim-lpav.c:68:16: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
      68 |         adev = kzalloc(sizeof(*adev), GFP_KERNEL);
         |                ^~~~~~~
>> drivers/clk/imx/clk-imx8ulp-sim-lpav.c:68:14: warning: assignment to 'struct auxiliary_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      68 |         adev = kzalloc(sizeof(*adev), GFP_KERNEL);
         |              ^
   cc1: some warnings being treated as errors


vim +68 drivers/clk/imx/clk-imx8ulp-sim-lpav.c

    62	
    63	static int clk_imx8ulp_sim_lpav_register_aux_reset(struct platform_device *pdev)
    64	{
    65		struct auxiliary_device *adev __free(kfree) = NULL;
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

