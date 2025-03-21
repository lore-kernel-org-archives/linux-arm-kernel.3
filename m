Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A1AC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 06:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2d5zLiEjk77rpgprWYkN5m954yi/lHWKF1BTeX4GGlE=; b=MBOZjq5DI1t5OlT/1X21WEZP92
	ezJcjDrttDqwmsEpimQ00HzfgmeeM+nviKUSo1xmtDySkUlSAx6+Vglm7SHeYIgIMwx5TigDsK2ix
	mJvkkenQCfOuQ7OEvPA3eUYwbWg6UHoUxsJSaUgayea6G8IHWoz8fVcvm2VnCpvfj9rTWZj7bPwg4
	1wPMEXrgRPp4woZjfK25N8Xbw5h+W3Og3XUG0xTLJgaLcGvZ2DvDiJc5EJplOIJDbTE0eBZOJJo6h
	IUuuREo6HIjROK1EZ9g8EqceDrtvd0UToDxILQBFvF/IXm7au2vZkm4B2+CkxOeItA5YEtE+/tL2B
	YQuO32dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvVfn-0000000Dy6T-15cA;
	Fri, 21 Mar 2025 06:16:03 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvVe6-0000000DxtP-0cQS;
	Fri, 21 Mar 2025 06:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742537658; x=1774073658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HLEaxKvE4atjVNnvk1DK3mXeuEpJjws2WJUHQpfgQ/4=;
  b=YkEDYJVpqvsK5ESqU2BZkEjnx/jyo/Mv8w40NXribZPwwtCMVL7zdZHO
   O7H/PlfFAWg4WbqxK2AUZet1UbP0vgQjVrM389jrPKOTEa+YR4hfUTM9Z
   IN04MOwPtYjB4EhMyQOI64I19yWIC0TLOF9P8DZvXOWEMhMbHNNMhEHR8
   lHmUspUXJYQrMiVbO2dubCs4uqnTqyYxoW2FALwFZhf/B1qSAjWuOS+TF
   Uye8+CP+Sg7B4GoeVqupACQ2wOWrHeMpeRtjqSe2OE49DbF4wmXxCsFQO
   OjdUMI8ABwzkieEvKtkzTbAaxqMOEo/CI1UCqcfIGI/eeLJZgmTeE+lXG
   A==;
X-CSE-ConnectionGUID: ksi/NBepSkG3jcYd7wgR6w==
X-CSE-MsgGUID: c5NrsX6/RiCY14zY3Z04KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54013383"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="54013383"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 23:14:17 -0700
X-CSE-ConnectionGUID: dm1rutLFR82EWWTmbhyLZA==
X-CSE-MsgGUID: Hhys1a/5RT+disyeTze/Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="123331923"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 Mar 2025 23:14:11 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvVdt-00015Q-16;
	Fri, 21 Mar 2025 06:14:06 +0000
Date: Fri, 21 Mar 2025 14:12:55 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@airoha.com
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [net-next PATCH v13 10/14] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <202503211428.H4VdWHco-lkp@intel.com>
References: <20250315154407.26304-11-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315154407.26304-11-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_231418_254579_E657328F 
X-CRM114-Status: GOOD (  11.87  )
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

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-nvmem-Document-support-for-Airoha-AN8855-Switch-EFUSE/20250315-235040
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250315154407.26304-11-ansuelsmth%40gmail.com
patch subject: [net-next PATCH v13 10/14] mfd: an8855: Add support for Airoha AN8855 Switch MFD
config: i386-randconfig-006-20250321 (https://download.01.org/0day-ci/archive/20250321/202503211428.H4VdWHco-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503211428.H4VdWHco-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503211428.H4VdWHco-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/mfd/airoha-an8855.o: in function `an8855_core_probe':
>> drivers/mfd/airoha-an8855.c:376: undefined reference to `devm_mdio_regmap_init'


vim +376 drivers/mfd/airoha-an8855.c

   352	
   353	static int an8855_core_probe(struct mdio_device *mdiodev)
   354	{
   355		struct regmap *regmap, *regmap_phy;
   356		struct device *dev = &mdiodev->dev;
   357		struct an8855_core_priv *priv;
   358		struct gpio_desc *reset_gpio;
   359		u32 val;
   360		int ret;
   361	
   362		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   363		if (!priv)
   364			return -ENOMEM;
   365	
   366		priv->bus = mdiodev->bus;
   367		priv->switch_addr = mdiodev->addr;
   368		/* No DMA for mdiobus, mute warning for DMA mask not set */
   369		dev->dma_mask = &dev->coherent_dma_mask;
   370	
   371		regmap = devm_regmap_init(dev, NULL, priv, &an8855_regmap_config);
   372		if (IS_ERR(regmap))
   373			return dev_err_probe(dev, PTR_ERR(regmap),
   374					     "regmap initialization failed\n");
   375	
 > 376		regmap_phy = devm_mdio_regmap_init(dev, priv, &an8855_regmap_phy_config);
   377		if (IS_ERR(regmap_phy))
   378			return dev_err_probe(dev, PTR_ERR(regmap_phy),
   379					     "regmap phy initialization failed\n");
   380	
   381		reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
   382		if (IS_ERR(reset_gpio))
   383			return PTR_ERR(reset_gpio);
   384	
   385		if (reset_gpio) {
   386			usleep_range(100000, 150000);
   387			gpiod_set_value_cansleep(reset_gpio, 0);
   388			usleep_range(100000, 150000);
   389			gpiod_set_value_cansleep(reset_gpio, 1);
   390	
   391			/* Poll HWTRAP reg to wait for Switch to fully Init */
   392			ret = regmap_read_poll_timeout(regmap, AN8855_HWTRAP, val,
   393						       val, 20, 200000);
   394			if (ret)
   395				return ret;
   396		}
   397	
   398		ret = an8855_read_switch_id(dev, regmap);
   399		if (ret)
   400			return ret;
   401	
   402		/* Release global PHY power down */
   403		ret = regmap_write(regmap, AN8855_RG_GPHY_AFE_PWD, 0x0);
   404		if (ret)
   405			return ret;
   406	
   407		return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, an8855_core_childs,
   408					    ARRAY_SIZE(an8855_core_childs), NULL, 0,
   409					    NULL);
   410	}
   411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

