Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE3EC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 05:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ODuhIG2qWX3r5qwkbckzB8Gew8Lss9g4fS6RB1kPUc=; b=Mh11gBT998Iw71MFlRWF3ThQmD
	oGLu44L3MJtxmzIp/V5oLExmoMU8RW7CfNVVhC48KIedvXiO3jzBCxk/xd3L1ypRaOtyilbRGsSz1
	y9U0ZBNSuyUSc27E9UAjpKert4Lay1Nael+Lgv4/2Z1sh1AWXLCx/0Sc2AVE5QrtLk1gulyQ78+hk
	7KBcd8g80e1nGnca4PUFmK2SoJolNFYF9nw7k5PgvM7PAeZNYHeOePHtYWUeXuOVaEQRV0xODbrAz
	VRPDkkgpShYJvzTIgolVhAWUZcMnbWPSF44HVjmv7l1zvnjQCThnlkz0bItc8O3SKvXXuoMNkDdU8
	wvXH+AVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNmQx-00000001MBI-2CHo;
	Sat, 07 Jun 2025 05:49:35 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNmOl-00000001M6j-3ViK;
	Sat, 07 Jun 2025 05:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749275239; x=1780811239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5C3lLj8+AbKhyCtUA5RyohQ8t2Ydl8exCq8AJb7blUs=;
  b=jtMjxIUmqQuCjpHuzc/rDF2eqtPqRmnlWUKIOmZiXUzYC4Lh80GskO3D
   MXdM0Wvpg+qxG5IAPerXzfBOHqt7l/Z8WRQKSr5FNNvT0KkaZvuv5GvKI
   D8XyURO5x9xIvPGIBo7j0/0sFFgXijHktx79yvS/f7EbqSZaX37MMLp+5
   vB0hrVPyEJ/fW6D3frfVSxm5dWEHZDGvPTviGZ6YoATHpEyhs2Nk+9tmr
   sXur6e40xbhndandBscPSU8zi4OOgErjZ+jZFw37zlXtpeJ8p2kp75aKt
   xhOAbCZSMtHDoPFqAavLWk6Ay2GH/5hKoRFQ9UrYFG0Khj7im4DSnZNr7
   w==;
X-CSE-ConnectionGUID: 32jsJnA1SX+pV52KMqvzMg==
X-CSE-MsgGUID: B7lF9no4T3+AyNwxC+tKUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51420674"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="51420674"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 22:47:15 -0700
X-CSE-ConnectionGUID: gRFQIGf+THm/L1f2j86avw==
X-CSE-MsgGUID: 1n4MLOnHQoSB0ABW7+8A9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="146528813"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jun 2025 22:47:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNmOb-0005UP-1w;
	Sat, 07 Jun 2025 05:47:09 +0000
Date: Sat, 7 Jun 2025 13:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: Quentin Schulz <foss+kernel@0leil.net>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
	Daniel Semkowicz <dse@thaumatec.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 2/4] mfd: rk8xx-core: allow to customize RK806 reset
 mode
Message-ID: <202506071321.Ze0gsxC0-lkp@intel.com>
References: <20250605-rk8xx-rst-fun-v2-2-143d190596dd@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605-rk8xx-rst-fun-v2-2-143d190596dd@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_224719_952262_72C3EEEA 
X-CRM114-Status: GOOD (  12.12  )
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

Hi Quentin,

kernel test robot noticed the following build errors:

[auto build test ERROR on ec7714e4947909190ffb3041a03311a975350fe0]

url:    https://github.com/intel-lab-lkp/linux/commits/Quentin-Schulz/dt-bindings-mfd-rk806-allow-to-customize-PMIC-reset-mode/20250605-234243
base:   ec7714e4947909190ffb3041a03311a975350fe0
patch link:    https://lore.kernel.org/r/20250605-rk8xx-rst-fun-v2-2-143d190596dd%40cherry.de
patch subject: [PATCH v2 2/4] mfd: rk8xx-core: allow to customize RK806 reset mode
config: arc-randconfig-001-20250607 (https://download.01.org/0day-ci/archive/20250607/202506071321.Ze0gsxC0-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506071321.Ze0gsxC0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071321.Ze0gsxC0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/rk8xx-core.c: In function 'rk8xx_probe':
>> drivers/mfd/rk8xx-core.c:740:42: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     740 |                                          FIELD_PREP(RK806_RST_FUN_MSK, rst_fun));
         |                                          ^~~~~~~~~~


vim +/FIELD_PREP +740 drivers/mfd/rk8xx-core.c

   694	
   695	int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap *regmap)
   696	{
   697		struct rk808 *rk808;
   698		const struct rk808_reg_data *pre_init_reg;
   699		const struct mfd_cell *cells;
   700		int dual_support = 0;
   701		int nr_pre_init_regs;
   702		u32 rst_fun = 0;
   703		int nr_cells;
   704		int ret;
   705		int i;
   706	
   707		rk808 = devm_kzalloc(dev, sizeof(*rk808), GFP_KERNEL);
   708		if (!rk808)
   709			return -ENOMEM;
   710		rk808->dev = dev;
   711		rk808->variant = variant;
   712		rk808->regmap = regmap;
   713		dev_set_drvdata(dev, rk808);
   714	
   715		switch (rk808->variant) {
   716		case RK805_ID:
   717			rk808->regmap_irq_chip = &rk805_irq_chip;
   718			pre_init_reg = rk805_pre_init_reg;
   719			nr_pre_init_regs = ARRAY_SIZE(rk805_pre_init_reg);
   720			cells = rk805s;
   721			nr_cells = ARRAY_SIZE(rk805s);
   722			break;
   723		case RK806_ID:
   724			rk808->regmap_irq_chip = &rk806_irq_chip;
   725			pre_init_reg = rk806_pre_init_reg;
   726			nr_pre_init_regs = ARRAY_SIZE(rk806_pre_init_reg);
   727			cells = rk806s;
   728			nr_cells = ARRAY_SIZE(rk806s);
   729			dual_support = IRQF_SHARED;
   730	
   731			ret = device_property_read_u32(dev, "rockchip,reset-mode", &rst_fun);
   732			if (ret) {
   733				dev_dbg(dev,
   734					"rockchip,reset-mode property missing, not setting RST_FUN\n");
   735				break;
   736			}
   737	
   738			ret = regmap_update_bits(rk808->regmap, RK806_SYS_CFG3,
   739						 RK806_RST_FUN_MSK,
 > 740						 FIELD_PREP(RK806_RST_FUN_MSK, rst_fun));
   741			if (ret)
   742				return dev_err_probe(dev, ret, "RST_FUN write err\n");
   743			break;
   744		case RK808_ID:
   745			rk808->regmap_irq_chip = &rk808_irq_chip;
   746			pre_init_reg = rk808_pre_init_reg;
   747			nr_pre_init_regs = ARRAY_SIZE(rk808_pre_init_reg);
   748			cells = rk808s;
   749			nr_cells = ARRAY_SIZE(rk808s);
   750			break;
   751		case RK816_ID:
   752			rk808->regmap_irq_chip = &rk816_irq_chip;
   753			pre_init_reg = rk816_pre_init_reg;
   754			nr_pre_init_regs = ARRAY_SIZE(rk816_pre_init_reg);
   755			cells = rk816s;
   756			nr_cells = ARRAY_SIZE(rk816s);
   757			break;
   758		case RK818_ID:
   759			rk808->regmap_irq_chip = &rk818_irq_chip;
   760			pre_init_reg = rk818_pre_init_reg;
   761			nr_pre_init_regs = ARRAY_SIZE(rk818_pre_init_reg);
   762			cells = rk818s;
   763			nr_cells = ARRAY_SIZE(rk818s);
   764			break;
   765		case RK809_ID:
   766		case RK817_ID:
   767			rk808->regmap_irq_chip = &rk817_irq_chip;
   768			pre_init_reg = rk817_pre_init_reg;
   769			nr_pre_init_regs = ARRAY_SIZE(rk817_pre_init_reg);
   770			cells = rk817s;
   771			nr_cells = ARRAY_SIZE(rk817s);
   772			break;
   773		default:
   774			dev_err(dev, "Unsupported RK8XX ID %lu\n", rk808->variant);
   775			return -EINVAL;
   776		}
   777	
   778		if (!irq)
   779			return dev_err_probe(dev, -EINVAL, "No interrupt support, no core IRQ\n");
   780	
   781		ret = devm_regmap_add_irq_chip(dev, rk808->regmap, irq,
   782					       IRQF_ONESHOT | dual_support, -1,
   783					       rk808->regmap_irq_chip, &rk808->irq_data);
   784		if (ret)
   785			return dev_err_probe(dev, ret, "Failed to add irq_chip\n");
   786	
   787		for (i = 0; i < nr_pre_init_regs; i++) {
   788			ret = regmap_update_bits(rk808->regmap,
   789						pre_init_reg[i].addr,
   790						pre_init_reg[i].mask,
   791						pre_init_reg[i].value);
   792			if (ret)
   793				return dev_err_probe(dev, ret, "0x%x write err\n",
   794						     pre_init_reg[i].addr);
   795		}
   796	
   797		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells, nr_cells, NULL, 0,
   798				      regmap_irq_get_domain(rk808->irq_data));
   799		if (ret)
   800			return dev_err_probe(dev, ret, "failed to add MFD devices\n");
   801	
   802		if (device_property_read_bool(dev, "system-power-controller") ||
   803		    device_property_read_bool(dev, "rockchip,system-power-controller")) {
   804			ret = devm_register_sys_off_handler(dev,
   805					    SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_PRIO_HIGH,
   806					    &rk808_power_off, rk808);
   807			if (ret)
   808				return dev_err_probe(dev, ret,
   809						     "failed to register poweroff handler\n");
   810	
   811			switch (rk808->variant) {
   812			case RK809_ID:
   813			case RK817_ID:
   814				ret = devm_register_sys_off_handler(dev,
   815								    SYS_OFF_MODE_RESTART, SYS_OFF_PRIO_HIGH,
   816								    &rk808_restart, rk808);
   817				if (ret)
   818					dev_warn(dev, "failed to register rst handler, %d\n", ret);
   819				break;
   820			default:
   821				dev_dbg(dev, "pmic controlled board reset not supported\n");
   822				break;
   823			}
   824		}
   825	
   826		return 0;
   827	}
   828	EXPORT_SYMBOL_GPL(rk8xx_probe);
   829	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

