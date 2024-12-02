Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4777BD10DCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 08:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yx8P+nthwUIcyX0B2nH/kT6WVQgGpRphvxoiB54v1lQ=; b=nWPmr/e2iC+0L2pG0a26FAW8N4
	Cbwb0x4pJETUhosM6h1p9keMvoxIfAvZRNv3G8fDabDLuGmxD9P/PcanAVqTYR2l01SlVKMHCGidj
	MKrk353UDwUr0LsqohZXB/3h6U3ypxXjH3Mw1dc+WRN0HqWgcMXCO0ieN+hIEHt5tW14w/U8+f/lD
	exTFvh2c6DMw7Ozc8dtDg+/NJAqOFYFAgeMp5q57YmApdjUsdfaQsYd0QTLNbOtJdXSwXAEocNtYI
	vAf6rv8N5NnmZz4NEP5eqzQ4qYTltrigeYyVRvm7SQCMBT+lOsK4tF34dRWUvejsxQ1R/DFz2+NnC
	iJb6OoeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2Fq-00000005U6E-2IUD;
	Mon, 02 Dec 2024 08:58:06 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2CW-00000005TWR-1lXz;
	Mon, 02 Dec 2024 08:54:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733129680; x=1764665680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PONq1d8jm/n+OrIxFNgIUfhJojAh81OCYaZRqCUvHDM=;
  b=GLVtrtt/aAbItUqzV/qYTzxF012gM5ZaJs+v9jGcRskl4qG0xIp8kDpt
   FzcfznccpqtjGYHE+aWK1gBjttK/zsIEL4GSs3vH7P+n7XM7+3g8phU05
   t9K6hwDy3/ovHIOD6vmEV+tJywcYRUV98ZOInf/s5iSmI6UYKpCX0vZ3O
   Kg5PtI42aKzaytXD+wx4m/4uPvhDNPFga6nsm9J6wvXoac1o0Fle0P5RV
   HsFvctoPVRhp6MYQKWY5i0KZEeRIrEodAaSgAIqLU7Z0y4X6o+ig9xQtZ
   B1//p5/DBIAE4gCJszS+xCR6jTykMJSmjIznmSeKDCxk8qpLpk+jnFJes
   Q==;
X-CSE-ConnectionGUID: EjpEVMk9TemjahyETT5Hfg==
X-CSE-MsgGUID: /vaqinjjQ3G+crSfdtHchA==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="50700522"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="50700522"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 00:54:35 -0800
X-CSE-ConnectionGUID: qbAJGnRwRRCsBXcsRguvnA==
X-CSE-MsgGUID: WaVyTQKOSeCg2uYFMgFRUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="123902060"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 02 Dec 2024 00:54:29 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI2CI-0002Dj-12;
	Mon, 02 Dec 2024 08:54:26 +0000
Date: Mon, 2 Dec 2024 16:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org,
	kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
	francesco@dolcini.it, frank.li@nxp.com, dmitry.baryshkov@linaro.org,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v5 10/19] drm/imx: Add i.MX8qxp Display Controller pixel
 engine
Message-ID: <202412021617.HmlPGJLh-lkp@intel.com>
References: <20241202025635.1274467-11-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202025635.1274467-11-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_005440_495097_ED10CF49 
X-CRM114-Status: GOOD (  13.65  )
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

Hi Liu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.13-rc1 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liu-Ying/dt-bindings-display-imx-Add-i-MX8qxp-Display-Controller-processing-units/20241202-110331
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20241202025635.1274467-11-victor.liu%40nxp.com
patch subject: [PATCH v5 10/19] drm/imx: Add i.MX8qxp Display Controller pixel engine
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241202/202412021617.HmlPGJLh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412021617.HmlPGJLh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412021617.HmlPGJLh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/imx/dc/dc-fl.c: In function 'dc_fl_bind':
>> drivers/gpu/drm/imx/dc/dc-fl.c:136:57: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 3 [-Wformat-truncation=]
     136 |         snprintf(fu->name, sizeof(fu->name), "FetchLayer%d", fl->id);
         |                                                         ^~
   drivers/gpu/drm/imx/dc/dc-fl.c:136:46: note: directive argument in the range [0, 2147483647]
     136 |         snprintf(fu->name, sizeof(fu->name), "FetchLayer%d", fl->id);
         |                                              ^~~~~~~~~~~~~~
   drivers/gpu/drm/imx/dc/dc-fl.c:136:9: note: 'snprintf' output between 12 and 21 bytes into a destination of size 13
     136 |         snprintf(fu->name, sizeof(fu->name), "FetchLayer%d", fl->id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/imx/dc/dc-fw.c: In function 'dc_fw_bind':
>> drivers/gpu/drm/imx/dc/dc-fw.c:175:56: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 4 [-Wformat-truncation=]
     175 |         snprintf(fu->name, sizeof(fu->name), "FetchWarp%u", fw->id);
         |                                                        ^~
   drivers/gpu/drm/imx/dc/dc-fw.c:175:46: note: directive argument in the range [0, 2147483647]
     175 |         snprintf(fu->name, sizeof(fu->name), "FetchWarp%u", fw->id);
         |                                              ^~~~~~~~~~~~~
   drivers/gpu/drm/imx/dc/dc-fw.c:175:9: note: 'snprintf' output between 11 and 20 bytes into a destination of size 13
     175 |         snprintf(fu->name, sizeof(fu->name), "FetchWarp%u", fw->id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +136 drivers/gpu/drm/imx/dc/dc-fl.c

    92	
    93	static int dc_fl_bind(struct device *dev, struct device *master, void *data)
    94	{
    95		struct platform_device *pdev = to_platform_device(dev);
    96		struct dc_drm_device *dc_drm = data;
    97		struct dc_pe *pe = dc_drm->pe;
    98		void __iomem *base_cfg;
    99		struct dc_fl *fl;
   100		struct dc_fu *fu;
   101		int i;
   102	
   103		fl = devm_kzalloc(dev, sizeof(*fl), GFP_KERNEL);
   104		if (!fl)
   105			return -ENOMEM;
   106	
   107		fu = &fl->fu;
   108	
   109		base_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
   110		if (IS_ERR(base_cfg))
   111			return PTR_ERR(base_cfg);
   112	
   113		fu->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
   114						    &dc_fl_cfg_regmap_config);
   115		if (IS_ERR(fu->reg_cfg))
   116			return PTR_ERR(fu->reg_cfg);
   117	
   118		fl->id = of_alias_get_id(dev->of_node, "dc0-fetchlayer");
   119		if (fl->id < 0) {
   120			dev_err(dev, "failed to get alias id: %d\n", fl->id);
   121			return fl->id;
   122		}
   123	
   124		fu->link_id = LINK_ID_FETCHLAYER0;
   125		fu->id = DC_FETCHUNIT_FL0;
   126		for (i = 0; i < DC_FETCHUNIT_FRAC_NUM; i++) {
   127			fu->reg_baseaddr[i]		  = BASEADDRESS(i);
   128			fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES(i);
   129			fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION(i);
   130			fu->reg_layeroffset[i]		  = LAYEROFFSET(i);
   131			fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET(i);
   132			fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS(i);
   133			fu->reg_constantcolor[i]	  = CONSTANTCOLOR(i);
   134			fu->reg_layerproperty[i]	  = LAYERPROPERTY(i);
   135		}
 > 136		snprintf(fu->name, sizeof(fu->name), "FetchLayer%d", fl->id);
   137	
   138		dc_fl_set_ops(fu);
   139	
   140		pe->fu_disp[fu->id] = fu;
   141	
   142		return 0;
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

