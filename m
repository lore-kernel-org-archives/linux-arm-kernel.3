Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE10C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIX6KgUEuWB58cWhmfVg+dsOT6YAHaFQ+rANluFHPpg=; b=OUl/v5TIVNKA5VCrm//gAreTkL
	6mlWxsJL46LsQ7tmjd4ACqapsDL6v2GcGyG3sCm92TJinLSaqwt5aP0Sz1a2332i5OFTJ81EOxJ78
	HxavERhE7EpL3335wBwdsCkaM0Xzjjm1zbeSh81rP1mg13IBLN3z2EYSo7Qd1xAcOUKY0P+g27Oy6
	HXJ296zaIZQa+1fE5vVaBkXF5KG1P/KcA5E9uDnSQyajB7z2BwTrUzSOXlVG2f5IIFxlLSofmDmNf
	Y2M40EZnVpk/9h7ddI1eGNWPlHxxVAYStD/QRCJsyu7Sv+jV3h7+nM91i6i33aSf3J12LuscQfBXW
	qGsQGz9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgnM5-0000000DBvE-2FHm;
	Sat, 08 Feb 2025 16:06:53 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgnKg-0000000DBkO-0qip
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 16:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739030726; x=1770566726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Up3R3tTo0WF2tM25OhGWnezyR3uKz7Ir9pL8p4zHP4=;
  b=i7Iw6IwPygp8bU4zQf7fuge6Km8nEIHmIv3onIMos+Ub57FtMyJd6o/C
   C/j6XjFIxBuGDU8P3Az/pjIyRDmJ5Hm4XBsSwd7bvJfAT0W7QObWZdYJX
   nDiA2EqvQ47uAm4WqtB2XXAIRVljUerlVcxKMGM7R3vYkBHJsE86yku38
   lasX2I5R8Ym4u6wcrZhTCOmPKc+Wk27Gz+38JJRPt6Gc1P2CdrdDGaztM
   YoSur3NyUivQkmdoOB6yaFh1RW31kNe9RihUMv1tAd1wzoSJuzd7j29mn
   nbeoZ+IpY55ByUTHVS2En8Vbv2HorlGulNg50D0Q1r5OoaOC1gm4E7wZk
   w==;
X-CSE-ConnectionGUID: 1MimJKf2RdaWaV+ySTsYcQ==
X-CSE-MsgGUID: +rgicDpaTdSCQfgn62tCig==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="27265512"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="27265512"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 08:05:25 -0800
X-CSE-ConnectionGUID: xxm7HiRqT8OWewmMmaOfAg==
X-CSE-MsgGUID: p65siFknQdO+3gJ8w+uhUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142672695"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Feb 2025 08:05:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgnKW-0010Gh-0j;
	Sat, 08 Feb 2025 16:05:16 +0000
Date: Sun, 9 Feb 2025 00:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 11/13] net: phy: Only rely on phy_port for
 PHY-driven SFP
Message-ID: <202502082347.tFufJ529-lkp@intel.com>
References: <20250207223634.600218-12-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207223634.600218-12-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_080526_258757_A4995FD1 
X-CRM114-Status: GOOD (  11.74  )
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

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-ethtool-Introduce-ETHTOOL_LINK_MEDIUM_-values/20250208-064223
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250207223634.600218-12-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next 11/13] net: phy: Only rely on phy_port for PHY-driven SFP
config: i386-buildonly-randconfig-005-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082347.tFufJ529-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082347.tFufJ529-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082347.tFufJ529-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/qcom/qca807x.c:698:12: error: use of undeclared identifier 'phy_sfp_attach'; did you mean 'phy_attach'?
     698 |         .attach = phy_sfp_attach,
         |                   ^~~~~~~~~~~~~~
         |                   phy_attach
   include/linux/phy.h:1912:20: note: 'phy_attach' declared here
    1912 | struct phy_device *phy_attach(struct net_device *dev, const char *bus_id,
         |                    ^
>> drivers/net/phy/qcom/qca807x.c:699:12: error: use of undeclared identifier 'phy_sfp_detach'; did you mean 'phy_detach'?
     699 |         .detach = phy_sfp_detach,
         |                   ^~~~~~~~~~~~~~
         |                   phy_detach
   include/linux/phy.h:1924:6: note: 'phy_detach' declared here
    1924 | void phy_detach(struct phy_device *phydev);
         |      ^
>> drivers/net/phy/qcom/qca807x.c:702:17: error: use of undeclared identifier 'phy_sfp_connect_phy'
     702 |         .connect_phy = phy_sfp_connect_phy,
         |                        ^
>> drivers/net/phy/qcom/qca807x.c:703:20: error: use of undeclared identifier 'phy_sfp_disconnect_phy'
     703 |         .disconnect_phy = phy_sfp_disconnect_phy,
         |                           ^
>> drivers/net/phy/qcom/qca807x.c:748:9: error: call to undeclared function 'phy_sfp_probe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     748 |                 ret = phy_sfp_probe(phydev, &qca807x_sfp_ops);
         |                       ^
   5 errors generated.


vim +698 drivers/net/phy/qcom/qca807x.c

d1cb613efbd3cd Robert Marko      2024-02-06  696  
d1cb613efbd3cd Robert Marko      2024-02-06  697  static const struct sfp_upstream_ops qca807x_sfp_ops = {
d1cb613efbd3cd Robert Marko      2024-02-06 @698  	.attach = phy_sfp_attach,
d1cb613efbd3cd Robert Marko      2024-02-06 @699  	.detach = phy_sfp_detach,
d1cb613efbd3cd Robert Marko      2024-02-06  700  	.module_insert = qca807x_sfp_insert,
d1cb613efbd3cd Robert Marko      2024-02-06  701  	.module_remove = qca807x_sfp_remove,
b2db6f4ace72e7 Maxime Chevallier 2024-08-21 @702  	.connect_phy = phy_sfp_connect_phy,
b2db6f4ace72e7 Maxime Chevallier 2024-08-21 @703  	.disconnect_phy = phy_sfp_disconnect_phy,
d1cb613efbd3cd Robert Marko      2024-02-06  704  };
d1cb613efbd3cd Robert Marko      2024-02-06  705  
d1cb613efbd3cd Robert Marko      2024-02-06  706  static int qca807x_probe(struct phy_device *phydev)
d1cb613efbd3cd Robert Marko      2024-02-06  707  {
d1cb613efbd3cd Robert Marko      2024-02-06  708  	struct device_node *node = phydev->mdio.dev.of_node;
d1cb613efbd3cd Robert Marko      2024-02-06  709  	struct qca807x_shared_priv *shared_priv;
d1cb613efbd3cd Robert Marko      2024-02-06  710  	struct device *dev = &phydev->mdio.dev;
d1cb613efbd3cd Robert Marko      2024-02-06  711  	struct phy_package_shared *shared;
d1cb613efbd3cd Robert Marko      2024-02-06  712  	struct qca807x_priv *priv;
d1cb613efbd3cd Robert Marko      2024-02-06  713  	int ret;
d1cb613efbd3cd Robert Marko      2024-02-06  714  
d1cb613efbd3cd Robert Marko      2024-02-06  715  	ret = devm_of_phy_package_join(dev, phydev, sizeof(*shared_priv));
d1cb613efbd3cd Robert Marko      2024-02-06  716  	if (ret)
d1cb613efbd3cd Robert Marko      2024-02-06  717  		return ret;
d1cb613efbd3cd Robert Marko      2024-02-06  718  
d1cb613efbd3cd Robert Marko      2024-02-06  719  	if (phy_package_probe_once(phydev)) {
d1cb613efbd3cd Robert Marko      2024-02-06  720  		ret = qca807x_phy_package_probe_once(phydev);
d1cb613efbd3cd Robert Marko      2024-02-06  721  		if (ret)
d1cb613efbd3cd Robert Marko      2024-02-06  722  			return ret;
d1cb613efbd3cd Robert Marko      2024-02-06  723  	}
d1cb613efbd3cd Robert Marko      2024-02-06  724  
d1cb613efbd3cd Robert Marko      2024-02-06  725  	shared = phydev->shared;
d1cb613efbd3cd Robert Marko      2024-02-06  726  	shared_priv = shared->priv;
d1cb613efbd3cd Robert Marko      2024-02-06  727  
d1cb613efbd3cd Robert Marko      2024-02-06  728  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
d1cb613efbd3cd Robert Marko      2024-02-06  729  	if (!priv)
d1cb613efbd3cd Robert Marko      2024-02-06  730  		return -ENOMEM;
d1cb613efbd3cd Robert Marko      2024-02-06  731  
d1cb613efbd3cd Robert Marko      2024-02-06  732  	priv->dac_full_amplitude = of_property_read_bool(node, "qcom,dac-full-amplitude");
d1cb613efbd3cd Robert Marko      2024-02-06  733  	priv->dac_full_bias_current = of_property_read_bool(node, "qcom,dac-full-bias-current");
d1cb613efbd3cd Robert Marko      2024-02-06  734  	priv->dac_disable_bias_current_tweak = of_property_read_bool(node,
d1cb613efbd3cd Robert Marko      2024-02-06  735  								     "qcom,dac-disable-bias-current-tweak");
d1cb613efbd3cd Robert Marko      2024-02-06  736  
1677293ed89166 Robert Marko      2024-03-05  737  #if IS_ENABLED(CONFIG_GPIOLIB)
d1cb613efbd3cd Robert Marko      2024-02-06  738  	/* Do not register a GPIO controller unless flagged for it */
d1cb613efbd3cd Robert Marko      2024-02-06  739  	if (of_property_read_bool(node, "gpio-controller")) {
d1cb613efbd3cd Robert Marko      2024-02-06  740  		ret = qca807x_gpio(phydev);
d1cb613efbd3cd Robert Marko      2024-02-06  741  		if (ret)
d1cb613efbd3cd Robert Marko      2024-02-06  742  			return ret;
d1cb613efbd3cd Robert Marko      2024-02-06  743  	}
1677293ed89166 Robert Marko      2024-03-05  744  #endif
d1cb613efbd3cd Robert Marko      2024-02-06  745  
d1cb613efbd3cd Robert Marko      2024-02-06  746  	/* Attach SFP bus on combo port*/
d1cb613efbd3cd Robert Marko      2024-02-06  747  	if (phy_read(phydev, QCA807X_CHIP_CONFIGURATION)) {
d1cb613efbd3cd Robert Marko      2024-02-06 @748  		ret = phy_sfp_probe(phydev, &qca807x_sfp_ops);
d1cb613efbd3cd Robert Marko      2024-02-06  749  		if (ret)
d1cb613efbd3cd Robert Marko      2024-02-06  750  			return ret;
d1cb613efbd3cd Robert Marko      2024-02-06  751  		linkmode_set_bit(ETHTOOL_LINK_MODE_FIBRE_BIT, phydev->supported);
d1cb613efbd3cd Robert Marko      2024-02-06  752  		linkmode_set_bit(ETHTOOL_LINK_MODE_FIBRE_BIT, phydev->advertising);
d1cb613efbd3cd Robert Marko      2024-02-06  753  	}
d1cb613efbd3cd Robert Marko      2024-02-06  754  
d1cb613efbd3cd Robert Marko      2024-02-06  755  	phydev->priv = priv;
d1cb613efbd3cd Robert Marko      2024-02-06  756  
d1cb613efbd3cd Robert Marko      2024-02-06  757  	return 0;
d1cb613efbd3cd Robert Marko      2024-02-06  758  }
d1cb613efbd3cd Robert Marko      2024-02-06  759  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

