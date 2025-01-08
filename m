Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD95E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzM8GlgTz6gu8JnbqRAvC5pRWK90vC4C/5A6I/rRb8o=; b=fXESkkm8tuLXevnb/8iKSOhqjV
	uBnK/DLlqFIyBFVyAvaYDcJiJbVE8P4FA+gz2bgr1Qi7XWmy3ui4E4/TS080+kmetyr6R4x3qEYZe
	MJDGerzaDWTcFjj5xgoNnPnH9WxwMUiwVX+kULaKLy+Qw+NX9BGYMzMY4nmbVsBYQAtAyg71vytVK
	SsoGfGP/l4yyxJjKP0nfWhSf3+TzOdI1lk23jo7mzmhoovTjIrAPRlcf/V9uPecRh7Pgd7HpqVY+a
	xZSKAEBTjlgJLdiAy4Rd997fTaG85BbpBekMuS2EjLFGaH7OAejbTBWAkvduxc+EhbsubCG/9B4PY
	nRkIl5wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTzh-00000008AA6-0pfJ;
	Wed, 08 Jan 2025 11:13:01 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTtz-000000088ih-3Bpq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 11:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736334428; x=1767870428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KfteZbyV26PCsgidSMPbtLu3MzZ0qK03E76djIPw6lc=;
  b=RsBHEdIpIIju76SbO9VwsKNnbE7UZOlJeVTyxKaRUQ9Z2QSfT8sBFDan
   pW1722yHO0WmbMQ2NR5leYhfYHD7uE/RTTd27ZIFgPW1Hd5cKPAZFjWnO
   RQyVQ5b4R3cFKRHKK017ySY49VUtHJoI2MrkTvdHod8KAzHm8KgboqqJA
   mAC18rvtJJp164PPkrNEJK7B8j1/RGDzsWbMChZh3b1du/WurGbIYxvci
   2rLTp9sbbUPeKu6D6waySqmW5b9Y+jqZDsWlXE7C597+YzDiU7moT0/AD
   YGRmvZJgY1NCUSYLwEXf1YqJHse2bVn4uSi07PKk+NBsxxegJz7LtjBDL
   g==;
X-CSE-ConnectionGUID: T273jU2tRymyqs9qmZ2P5w==
X-CSE-MsgGUID: lFV8couHQZei+DFY4Ee0qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36437711"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36437711"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 03:07:06 -0800
X-CSE-ConnectionGUID: voMTk4fwS0yN6I6PUQIA2A==
X-CSE-MsgGUID: cpSxP4hASJuqIUJpEAA6IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="103548158"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jan 2025 03:07:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVTtq-000Fyd-2v;
	Wed, 08 Jan 2025 11:06:58 +0000
Date: Wed, 8 Jan 2025 19:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
Message-ID: <202501081822.A69smnpW-lkp@intel.com>
References: <20250107143900.988567-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107143900.988567-2-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_030707_842952_C14065DE 
X-CRM114-Status: GOOD (  14.19  )
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

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.13-rc6 next-20250107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/drm-bridge-imx8qxp-pxl2dpi-Use-dev_err_probe/20250107-224125
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250107143900.988567-2-alexander.stein%40ew.tq-group.com
patch subject: [PATCH v2 1/4] drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
config: arm-randconfig-004-20250108 (https://download.01.org/0day-ci/archive/20250108/202501081822.A69smnpW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081822.A69smnpW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081822.A69smnpW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:402:29: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     402 |                 return dev_err_probe(dev, ret, "failed to get regmap\n");
         |                                           ^~~
   drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:394:9: note: initialize the variable 'ret' to silence this warning
     394 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +402 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c

   388	
   389	static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
   390	{
   391		struct imx8qxp_pxl2dpi *p2d;
   392		struct device *dev = &pdev->dev;
   393		struct device_node *np = dev->of_node;
   394		int ret;
   395	
   396		p2d = devm_kzalloc(dev, sizeof(*p2d), GFP_KERNEL);
   397		if (!p2d)
   398			return -ENOMEM;
   399	
   400		p2d->regmap = syscon_node_to_regmap(np->parent);
   401		if (IS_ERR(p2d->regmap))
 > 402			return dev_err_probe(dev, ret, "failed to get regmap\n");
   403	
   404		ret = imx_scu_get_handle(&p2d->ipc_handle);
   405		if (ret)
   406			return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
   407	
   408		p2d->dev = dev;
   409	
   410		ret = of_property_read_u32(np, "fsl,sc-resource", &p2d->sc_resource);
   411		if (ret) {
   412			DRM_DEV_ERROR(dev, "failed to get SC resource %d\n", ret);
   413			return ret;
   414		}
   415	
   416		p2d->next_bridge = imx8qxp_pxl2dpi_find_next_bridge(p2d);
   417		if (IS_ERR(p2d->next_bridge))
   418			return dev_err_probe(dev, PTR_ERR(p2d->next_bridge),
   419					     "failed to find next bridge\n");
   420	
   421		ret = imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
   422		if (ret)
   423			return ret;
   424	
   425		ret = imx8qxp_pxl2dpi_parse_dt_companion(p2d);
   426		if (ret)
   427			return ret;
   428	
   429		platform_set_drvdata(pdev, p2d);
   430		pm_runtime_enable(dev);
   431	
   432		p2d->bridge.driver_private = p2d;
   433		p2d->bridge.funcs = &imx8qxp_pxl2dpi_bridge_funcs;
   434		p2d->bridge.of_node = np;
   435	
   436		drm_bridge_add(&p2d->bridge);
   437	
   438		return ret;
   439	}
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

