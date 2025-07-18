Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036FAC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 01:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9Pxx6O83iy0hNmgYJuqWyZbhvOSk0MMSBxIS2yd3e0=; b=16TISbPxs1PqD77okS2AnRf2MB
	beZ7Pth68lekuq0fjDC94y9z275QgZf/D0KffdchtEjT5mkqYvYfoEGYBP7mepo+FC4/SD65QzfW0
	Ht7ePT1rp/xs2H4dDRaSnsm6wQ26dT+VOqBtxM/v+zCWkH9I0YUTo5BpyFTR5VTYkk6/ltKZLccj8
	7fiRgyHW1ULJIpUWia+Uy72MGN46WUIq1qPuSTheC+WZvXDazrfaP6F1hyqs6G6Y191qdaL5jGoG9
	Lzuu9lSnG1bPOfGVrUKhBlM+tBtTJLLAvygRNJkmXD/epfZkQwIW7BUBRtc5dini7ehDZ44pC+Fte
	gK8rrJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uca5X-0000000BTK2-1zOg;
	Fri, 18 Jul 2025 01:40:39 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uca33-0000000BT1S-2Prd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 01:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752802686; x=1784338686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a7LNu8NM/J83vU8tzW57I182ndErEcS3Is01U9ZCDZI=;
  b=Uyy/hVaK8a1RxcAY1KQCwAQJVOKLzhFpyC8TEXstEbqxU4u0cwwc6O78
   M1fvku/wYHCdPty/+s0MAHCqunoB7uzqpgSmweJlJwOj5RQDwiSByb08W
   JYakT01pYC11kcHfcK8Sj1DcpyahcrxO8jawmr0Ow+9Hy0gsom13OiFX9
   PZMipGyyslviuSWdD2J9BYjQdKbfhM3pKj1ntBSxt0bHuJgp1jAhxbsDS
   cTNa2iFG/EC7HxML74XfQaMRaIfeQyg9DafrDX5D9HxMgAmN+9Q1EHYPa
   Z/oMr6/Gh59prC7x08dYvymleSzbxDuO88WeflbIL8pfQfYnTs3+Nh2q+
   w==;
X-CSE-ConnectionGUID: JCwgydjhQG68AZJzjWCyKQ==
X-CSE-MsgGUID: +RmfoadGS6C3gz/WI4yLqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="72661786"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="72661786"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 18:38:03 -0700
X-CSE-ConnectionGUID: jpucQ4OlRqKihWV4hGzGMg==
X-CSE-MsgGUID: oRZWHOB0Srq4cJKs1OFhPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="162216197"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jul 2025 18:37:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uca2u-000ECr-2H;
	Fri, 18 Jul 2025 01:37:56 +0000
Date: Fri, 18 Jul 2025 09:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 18/24] media: i2c: maxim-serdes: add MAX96717 driver
Message-ID: <202507180929.p1tVAhva-lkp@intel.com>
References: <20250716193111.942217-19-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716193111.942217-19-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_183805_652364_C1AF05B0 
X-CRM114-Status: GOOD (  13.42  )
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

Hi Cosmin,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250716]
[cannot apply to robh/for-next staging/staging-testing staging/staging-next staging/staging-linus arm64/for-next/core linus/master v6.16-rc6 v6.16-rc5 v6.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/media-mc-Add-INTERNAL-pad-flag/20250717-033901
base:   next-20250716
patch link:    https://lore.kernel.org/r/20250716193111.942217-19-demonsingur%40gmail.com
patch subject: [PATCH v6 18/24] media: i2c: maxim-serdes: add MAX96717 driver
config: x86_64-randconfig-003-20250717 (https://download.01.org/0day-ci/archive/20250718/202507180929.p1tVAhva-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180929.p1tVAhva-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180929.p1tVAhva-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/i2c/maxim-serdes/max96717.o: in function `max96717_conf_pin_config_get':
>> drivers/media/i2c/maxim-serdes/max96717.c:485: undefined reference to `pinctrl_dev_get_drvdata'
   ld: drivers/media/i2c/maxim-serdes/max96717.o: in function `max96717_conf_pin_config_set':
   drivers/media/i2c/maxim-serdes/max96717.c:655: undefined reference to `pinctrl_dev_get_drvdata'
   ld: drivers/media/i2c/maxim-serdes/max96717.o: in function `max96717_mux_set':
   drivers/media/i2c/maxim-serdes/max96717.c:712: undefined reference to `pinctrl_dev_get_drvdata'
   ld: drivers/media/i2c/maxim-serdes/max96717.o: in function `max96717_gpiochip_probe':
>> drivers/media/i2c/maxim-serdes/max96717.c:1553: undefined reference to `devm_pinctrl_register_and_init'
>> ld: drivers/media/i2c/maxim-serdes/max96717.c:1557: undefined reference to `pinctrl_enable'
   ld: drivers/media/i2c/maxim-serdes/max96717.o: in function `pinconf_generic_dt_node_to_map_pin':
>> include/linux/pinctrl/pinconf-generic.h:219: undefined reference to `pinconf_generic_dt_node_to_map'
>> ld: drivers/media/i2c/maxim-serdes/max96717.o:(.rodata+0xa68): undefined reference to `pinconf_generic_dt_free_map'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GENERIC_PINCONF
   Depends on [n]: PINCTRL [=n]
   Selected by [y]:
   - VIDEO_MAX96717 [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y]
   WARNING: unmet direct dependencies detected for GENERIC_PINMUX_FUNCTIONS
   Depends on [n]: PINCTRL [=n]
   Selected by [y]:
   - VIDEO_MAX96717 [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y]
   WARNING: unmet direct dependencies detected for GENERIC_PINCTRL_GROUPS
   Depends on [n]: PINCTRL [=n]
   Selected by [y]:
   - VIDEO_MAX96717 [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y]


vim +485 drivers/media/i2c/maxim-serdes/max96717.c

   480	
   481	static int max96717_conf_pin_config_get(struct pinctrl_dev *pctldev,
   482						unsigned int offset,
   483						unsigned long *config)
   484	{
 > 485		struct max96717_priv *priv = pinctrl_dev_get_drvdata(pctldev);
   486		u32 param = pinconf_to_config_param(*config);
   487		unsigned int reg, mask, val, en_val;
   488		int ret;
   489	
   490		ret = max96717_get_pin_config_reg(offset, param, &reg, &mask, &en_val);
   491		if (ret)
   492			return ret;
   493	
   494		switch (param) {
   495		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
   496		case PIN_CONFIG_DRIVE_PUSH_PULL:
   497		case PIN_CONFIG_BIAS_DISABLE:
   498		case PIN_CONFIG_BIAS_PULL_DOWN:
   499		case PIN_CONFIG_BIAS_PULL_UP:
   500		case MAX96717_PINCTRL_JITTER_COMPENSATION_EN:
   501		case MAX96717_PINCTRL_TX_EN:
   502		case MAX96717_PINCTRL_RX_EN:
   503		case PIN_CONFIG_OUTPUT_ENABLE:
   504		case PIN_CONFIG_INPUT_ENABLE:
   505			ret = regmap_read(priv->regmap, reg, &val);
   506			if (ret)
   507				return ret;
   508	
   509			val = field_get(mask, val) == en_val;
   510			if (!val)
   511				return -EINVAL;
   512	
   513			break;
   514		case MAX96717_PINCTRL_PULL_STRENGTH_HIGH:
   515		case MAX96717_PINCTRL_INPUT_VALUE:
   516		case PIN_CONFIG_OUTPUT:
   517			ret = regmap_read(priv->regmap, reg, &val);
   518			if (ret)
   519				return ret;
   520	
   521			val = field_get(mask, val) == en_val;
   522			break;
   523		case MAX96717_PINCTRL_TX_ID:
   524		case MAX96717_PINCTRL_RX_ID:
   525		case PIN_CONFIG_SLEW_RATE:
   526			ret = regmap_read(priv->regmap, reg, &val);
   527			if (ret)
   528				return ret;
   529	
   530			val = field_get(mask, val);
   531			break;
   532		default:
   533			return -ENOTSUPP;
   534		}
   535	
   536		switch (param) {
   537		case PIN_CONFIG_BIAS_PULL_DOWN:
   538		case PIN_CONFIG_BIAS_PULL_UP:
   539			*config = pinconf_to_config_packed(MAX96717_PINCTRL_PULL_STRENGTH_HIGH, 0);
   540	
   541			ret = max96717_conf_pin_config_get(pctldev, offset, config);
   542			if (ret)
   543				return ret;
   544	
   545			val = pinconf_to_config_argument(*config);
   546			if (val)
   547				val = MAX96717_BIAS_PULL_STRENGTH_1000000_OHM;
   548			else
   549				val = MAX96717_BIAS_PULL_STRENGTH_40000_OHM;
   550	
   551			break;
   552		case MAX96717_PINCTRL_TX_ID:
   553			*config = pinconf_to_config_packed(MAX96717_PINCTRL_TX_EN, 0);
   554	
   555			ret = max96717_conf_pin_config_get(pctldev, offset, config);
   556			if (ret)
   557				return ret;
   558	
   559			break;
   560		case MAX96717_PINCTRL_RX_ID:
   561			*config = pinconf_to_config_packed(MAX96717_PINCTRL_RX_EN, 0);
   562	
   563			ret = max96717_conf_pin_config_get(pctldev, offset, config);
   564			if (ret)
   565				return ret;
   566	
   567			break;
   568		default:
   569			break;
   570		}
   571	
   572		*config = pinconf_to_config_packed(param, val);
   573	
   574		return 0;
   575	}
   576	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

