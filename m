Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6653CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 04:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Niff0cY+3zKtJEokA62CF8EX1JGEDNP9i3wfgGE+H9w=; b=A7bZOFO8UZ2rY+sRj8fQCBUSHX
	HnMDEJU7cEH7yzfD1GWPrBvvhoeNfM7nQ1x1wovGyEKOov0EWVi/JWlDr/PUXwJDHlztxQWZLEYHo
	DNYK4j2hJ4WeD9FvYu8WQfb99Ay0NNcnZFF2K/M2lrdkGH5KMszoJhoi89yDu8bTvLjXo/fj1XxZt
	7sKREA3/fYeDLUIDprOU9isbmXq7Xa6+YWI7937FRqyUORIOCbq4Qsw9wMOyVTJjUX4NA0G1k19rg
	NaE7MjmBHYimXkWWHaT0X9TjUnqHETiZvj76o1+vNMg48NGtzHx0OvHI7B/gNH3ANJr9DNju+uC1a
	h09hFWZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9yM2-00000009UD4-0S5d;
	Sat, 18 Oct 2025 04:15:42 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9yLz-00000009UCf-1yiI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 04:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760760939; x=1792296939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xJ+JsUz4XbcP1v+4FsWXjV6AIbsUH9+FEb2iGeNwyHU=;
  b=a9o/lVmYKyCiV7Pzq52aUm92StDsKkSPfKPMnRynfjQONZqHnHwyzFxL
   DEB5cDSpu8+k14GxyjMou/3D+5GHMHuLfifnVbw28PGdO8B3wwNAnBVpR
   7IbHxjJIocSeA4Tcrr/Y12QV/McSPTBNDXdaoCz4lXjudywHdIRj5YPH6
   ioQaiZcrOrxERP6a0BZdT11ZhEUvdBuWUibxMi1kuYrrnLDdGfzzQBcts
   lnGYI0QwSwpVr7QL+365wqob+JzVauT8WZD9zkPsKL1pxifWPwoyHCZBH
   2dVKFUJ+3gh6T1ccBerxMJjcmMFdZYKeW4SyfjO0sofDFbmz7wy7AG8id
   w==;
X-CSE-ConnectionGUID: crd/wjBVTVCKc4fyAbax4Q==
X-CSE-MsgGUID: oiYA/Pj4T/G2beYaibnrdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="73650843"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="73650843"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 21:15:36 -0700
X-CSE-ConnectionGUID: vdSs8jYZR0+Zx8hwJkk8DQ==
X-CSE-MsgGUID: AOaCem9pThybXB/LUZKBSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="188197059"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 17 Oct 2025 21:15:31 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9yLg-00083H-2m;
	Sat, 18 Oct 2025 04:15:25 +0000
Date: Sat, 18 Oct 2025 12:15:08 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 3/8] clk: imx: add driver for imx8ulp's sim lpav
Message-ID: <202510181121.D3XVfMFh-lkp@intel.com>
References: <20251017112025.11997-4-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017112025.11997-4-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_211539_555614_29C76875 
X-CRM114-Status: GOOD (  16.20  )
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251018/202510181121.D3XVfMFh-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181121.D3XVfMFh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181121.D3XVfMFh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/imx/clk-imx8ulp-sim-lpav.c:52:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      52 |         kfree(adev);
         |         ^
>> drivers/clk/imx/clk-imx8ulp-sim-lpav.c:65:32: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
      65 |         struct auxiliary_device *adev __free(kfree) = NULL;
         |                                       ^
   include/linux/cleanup.h:213:33: note: expanded from macro '__free'
     213 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:30:1: note: expanded from here
      30 | __free_kfree
         | ^
   include/linux/gfp.h:381:13: note: '__free_pages' declared here
     381 | extern void __free_pages(struct page *page, unsigned int order);
         |             ^
>> drivers/clk/imx/clk-imx8ulp-sim-lpav.c:65:32: error: 'cleanup' function '__free_pages' must take 1 parameter
      65 |         struct auxiliary_device *adev __free(kfree) = NULL;
         |                                       ^
   include/linux/cleanup.h:213:33: note: expanded from macro '__free'
     213 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:30:1: note: expanded from here
      30 | __free_kfree
         | ^
>> drivers/clk/imx/clk-imx8ulp-sim-lpav.c:68:9: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      68 |         adev = kzalloc(sizeof(*adev), GFP_KERNEL);
         |                ^
>> drivers/clk/imx/clk-imx8ulp-sim-lpav.c:68:7: error: incompatible integer to pointer conversion assigning to 'struct auxiliary_device *' from 'int' [-Wint-conversion]
      68 |         adev = kzalloc(sizeof(*adev), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 errors generated.


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

