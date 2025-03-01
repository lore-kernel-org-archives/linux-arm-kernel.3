Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708BAC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 19:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wr5l9sIqEomz5eozXw32UhnI/Jz5Shj5ZncrcwuPtAc=; b=jrUL9pvmA60zt8bHoyZyHelkFp
	ra958tO/KHmDiPZYuOzqimmQYRvIdzzNjqddC8w3XWt96IIflC+7J6fynPGoXmY+tg5R4q2/TwBXs
	CmUZJ+rLg2wfjOWsjt3CAyKZlsf6E2OXijD2wbsMdQ5alAjn91JTpgem0U7+mHn8Wf6qWGz14wyMi
	psUaeKaBnCCycB+/Xe751WBNUgwzHlXSl6QkNyWdhiYpUI6Cmfu02tYFXyA6SQTqH63t6zzwbMGu3
	Z6YpENKEhzVhCf5qE7IM+0pw6eGLW8Gl1VeV9SpTglBj6p/2ijl4XsKwyxYC1tJzV9W4eT9nBcl82
	F9NNSlQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toSV1-0000000Eq97-3YkV;
	Sat, 01 Mar 2025 19:27:47 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toSTR-0000000Eq1x-3nQ1;
	Sat, 01 Mar 2025 19:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740857170; x=1772393170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kgh0c47meoZDWfMVUZjQEqtme+w+1HSPoNcT4ynJ/ro=;
  b=DBAv/ABwi/Cmh6tRXWqvBaJ4GN9ep+ukLWzUajSH06KqLgcCsRdGN7No
   M4dEtynqd547LF3dO6Sso2VSnXPvxcEZ3X9mvMZIBhAuVVEsKkXEGmfOd
   fHgl+xVqWx2XrjCPXmtFwnBu0yRRG8c3vLqfIyxSdr3VZ9ZD18bQ/L9rw
   6wJrvh4iQ8vc5Xh2oWt572IWYqJ0QxU5D+6rpxpoz2d1rqIghQj1609Zx
   LOrMh1nKeVXZABo6av6uUh2AfjsMvMItKAlxsfIakWolz0wXPEgkTctWE
   IgU+4tvblzMncyg479aJrTxUycINGSTZVa5hd3bTfmVssy424fTioD3A4
   A==;
X-CSE-ConnectionGUID: 0hJpZm3zTG6lbV5nfiwKnA==
X-CSE-MsgGUID: zt0U8zpwRjCrvcdjOg89iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41958879"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41958879"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 11:26:09 -0800
X-CSE-ConnectionGUID: 6zm7FR3RQv2VBKgpt9eVSQ==
X-CSE-MsgGUID: ArHqyzkEQbubIfiIdkWtKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154800058"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Mar 2025 11:26:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toSSF-000GbW-2V;
	Sat, 01 Mar 2025 19:25:07 +0000
Date: Sun, 2 Mar 2025 03:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	David Miller <davem@davemloft.net>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Robert Marko <robimarko@gmail.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>
Subject: Re: [PATCH net-next v2 7/8] net: phy: move PHY package related code
 from phy.h to phy_package.c
Message-ID: <202503020328.FJG7PJon-lkp@intel.com>
References: <edba99c5-0f95-40bd-8398-98d811068369@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edba99c5-0f95-40bd-8398-98d811068369@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_112609_980730_91F2A0B9 
X-CRM114-Status: GOOD (  12.19  )
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

Hi Heiner,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/net-phy-move-PHY-package-code-from-phy_device-c-to-own-source-file/20250301-055302
base:   net-next/main
patch link:    https://lore.kernel.org/r/edba99c5-0f95-40bd-8398-98d811068369%40gmail.com
patch subject: [PATCH net-next v2 7/8] net: phy: move PHY package related code from phy.h to phy_package.c
config: loongarch-randconfig-001-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020328.FJG7PJon-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020328.FJG7PJon-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020328.FJG7PJon-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/bcm54140.c: In function 'bcm54140_base_read_rdb':
   drivers/net/phy/bcm54140.c:436:15: error: implicit declaration of function '__phy_package_write'; did you mean '__phy_package_write_mmd'? [-Wimplicit-function-declaration]
     436 |         ret = __phy_package_write(phydev, BCM54140_BASE_ADDR,
         |               ^~~~~~~~~~~~~~~~~~~
         |               __phy_package_write_mmd
   drivers/net/phy/bcm54140.c:441:15: error: implicit declaration of function '__phy_package_read'; did you mean '__phy_package_read_mmd'? [-Wimplicit-function-declaration]
     441 |         ret = __phy_package_read(phydev, BCM54140_BASE_ADDR,
         |               ^~~~~~~~~~~~~~~~~~
         |               __phy_package_read_mmd
   drivers/net/phy/bcm54140.c: In function 'bcm54140_probe':
>> drivers/net/phy/bcm54140.c:599:13: error: implicit declaration of function 'phy_package_init_once'; did you mean 'phy_package_write_mmd'? [-Wimplicit-function-declaration]
     599 |         if (phy_package_init_once(phydev)) {
         |             ^~~~~~~~~~~~~~~~~~~~~
         |             phy_package_write_mmd


vim +599 drivers/net/phy/bcm54140.c

6937602ed3f9ebd Michael Walle 2020-04-20  578  
6937602ed3f9ebd Michael Walle 2020-04-20  579  static int bcm54140_probe(struct phy_device *phydev)
6937602ed3f9ebd Michael Walle 2020-04-20  580  {
6937602ed3f9ebd Michael Walle 2020-04-20  581  	struct bcm54140_priv *priv;
6937602ed3f9ebd Michael Walle 2020-04-20  582  	int ret;
6937602ed3f9ebd Michael Walle 2020-04-20  583  
6937602ed3f9ebd Michael Walle 2020-04-20  584  	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
6937602ed3f9ebd Michael Walle 2020-04-20  585  	if (!priv)
6937602ed3f9ebd Michael Walle 2020-04-20  586  		return -ENOMEM;
6937602ed3f9ebd Michael Walle 2020-04-20  587  
6937602ed3f9ebd Michael Walle 2020-04-20  588  	phydev->priv = priv;
6937602ed3f9ebd Michael Walle 2020-04-20  589  
6937602ed3f9ebd Michael Walle 2020-04-20  590  	ret = bcm54140_get_base_addr_and_port(phydev);
6937602ed3f9ebd Michael Walle 2020-04-20  591  	if (ret)
6937602ed3f9ebd Michael Walle 2020-04-20  592  		return ret;
6937602ed3f9ebd Michael Walle 2020-04-20  593  
dc9989f173289f3 Michael Walle 2020-05-06  594  	devm_phy_package_join(&phydev->mdio.dev, phydev, priv->base_addr, 0);
dc9989f173289f3 Michael Walle 2020-05-06  595  
4406d36dfdf1fbd Michael Walle 2020-04-20  596  #if IS_ENABLED(CONFIG_HWMON)
4406d36dfdf1fbd Michael Walle 2020-04-20  597  	mutex_init(&priv->alarm_lock);
4406d36dfdf1fbd Michael Walle 2020-04-20  598  
dc9989f173289f3 Michael Walle 2020-05-06 @599  	if (phy_package_init_once(phydev)) {
4406d36dfdf1fbd Michael Walle 2020-04-20  600  		ret = bcm54140_probe_once(phydev);
4406d36dfdf1fbd Michael Walle 2020-04-20  601  		if (ret)
4406d36dfdf1fbd Michael Walle 2020-04-20  602  			return ret;
4406d36dfdf1fbd Michael Walle 2020-04-20  603  	}
4406d36dfdf1fbd Michael Walle 2020-04-20  604  #endif
4406d36dfdf1fbd Michael Walle 2020-04-20  605  
6937602ed3f9ebd Michael Walle 2020-04-20  606  	phydev_dbg(phydev, "probed (port %d, base PHY address %d)\n",
6937602ed3f9ebd Michael Walle 2020-04-20  607  		   priv->port, priv->base_addr);
6937602ed3f9ebd Michael Walle 2020-04-20  608  
6937602ed3f9ebd Michael Walle 2020-04-20  609  	return 0;
6937602ed3f9ebd Michael Walle 2020-04-20  610  }
6937602ed3f9ebd Michael Walle 2020-04-20  611  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

