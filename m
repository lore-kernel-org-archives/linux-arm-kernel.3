Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3FCCC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 05:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTefudUOIMhv7UBh8pwkS/cjy0B36XdA6+uyE55CwNs=; b=memgZpzBexbBZVoDccTwIzKn6f
	q91lpzML97mnadVgYBD1AB3eaWEYwpRgkQSgcYcKIPCRZ8ohgfefIaL9rL0QC+QvLP7RFybVriq//
	it1S2+DZ5/4y7v+5QrKqr6ZAPcjpIhsSJIQAjZ2afkrKjV88I4H48BodjSHzU6OGNNXThxT1xogk8
	Cbw0/G/cVne7ozur0i18KngY2HqOQFALyE6j4pl9rBrhkrhf9UUCq8pFuhXwhps2JNryFjzi8Upm7
	BD1L8qLXDjWeAdlUAC0qA+mAeClvJs16PnZMn5TI+OsQ5EhcRsUfpsVClNwxlCCKFaTKHbQL3SSr2
	Dv1Wz6Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHDg5-0000000GqAF-2ly0;
	Thu, 15 Oct 2026 05:06:53 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHDg2-0000000Gq9n-37et;
	Thu, 15 Oct 2026 05:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792040811; x=1823576811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rPrN/b17tzrrWFqjgXZe93Dbw+hG8QAaSFVecQYWGdw=;
  b=fluiyHCpyIuJvXdx4XhMVSv/L/zXvTtcmE8/g+l7H7Iw60L7FnCeSDiZ
   1t4O+8ip46tYZ9HqZNhcc1cyiz6DQIMujrYsLKsMTXdUQLDyZUWNETlwS
   BBtEVWOL2zeDnQq+MJ5PXNPnPNotCGoSuEPchQMWGYfrLiNcyfEB8S/T0
   mwDwfxOqLlxCd/hS1YzMPIrqVdyVZ5bw8Xmb82P/veDpQpgVxPK8gwNxs
   h9OZOzCEQxz5+tro39XUjyXTxeYf81Q9ErBAmrzkOBZywvNtTR8jQYyf2
   MPH08zDmgDIlRcM3mHV6nLxQUHJ6jAX9VkO70vGf7ioaFruA3KCLRxwy/
   A==;
X-CSE-ConnectionGUID: yOI9e1Q9RV6Cp7xDncTRKQ==
X-CSE-MsgGUID: Bef2YbdFRFiZ1gHmBYW0GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="808554"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="808554"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 22:06:50 -0700
X-CSE-ConnectionGUID: 8jAOmFopSaOf2TggeW3cqg==
X-CSE-MsgGUID: 8tGAU8DZTY63RexvDIrB6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1847050"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Oct 2026 22:06:45 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHDfu-00000000FqJ-0wLc;
	Thu, 15 Oct 2026 05:06:42 +0000
Date: Thu, 15 Oct 2026 13:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	Joris Vaisvila <joey@tinyisr.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3 5/6] net: phy: mediatek: add calibration
 logic for AN7581
Message-ID: <202610151259.WmaEeHMH-lkp@intel.com>
References: <20261014071739.216345-6-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014071739.216345-6-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_220650_862573_0E9C4E3F 
X-CRM114-Status: GOOD (  11.10  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phy-mediatek-export-__mtk_tr_write/20261014-091732
base:   net-next/main
patch link:    https://lore.kernel.org/r/20261014071739.216345-6-ansuelsmth%40gmail.com
patch subject: [PATCH net-next v3 5/6] net: phy: mediatek: add calibration logic for AN7581
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261015/202610151259.WmaEeHMH-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610151259.WmaEeHMH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610151259.WmaEeHMH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/mediatek/airoha-ge-soc.c:1522:3: warning: variable 'shared' is uninitialized when used here [-Wuninitialized]
    1522 |                 shared->phydev_p0 = phydev;
         |                 ^~~~~~
   drivers/net/phy/mediatek/airoha-ge-soc.c:1501:37: note: initialize the variable 'shared' to silence this warning
    1501 |         struct airoha_socphy_shared *shared;
         |                                            ^
         |                                             = NULL
   1 warning generated.


vim +/shared +1522 drivers/net/phy/mediatek/airoha-ge-soc.c

  1498	
  1499	static int an7581_phy_probe(struct phy_device *phydev)
  1500	{
  1501		struct airoha_socphy_shared *shared;
  1502		struct mtk_socphy_priv *priv;
  1503		struct pinctrl *pinctrl;
  1504		int ret;
  1505	
  1506		/* Toggle pinctrl to enable PHY LED */
  1507		pinctrl = devm_pinctrl_get_select(&phydev->mdio.dev, "gbe-led");
  1508		if (IS_ERR(pinctrl))
  1509			dev_err(&phydev->mdio.bus->dev,
  1510				"Failed to setup PHY LED pinctrl\n");
  1511	
  1512		ret = devm_phy_package_join(&phydev->mdio.dev, phydev, 0,
  1513					    sizeof(struct airoha_socphy_shared));
  1514		if (ret)
  1515			return ret;
  1516	
  1517		priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
  1518		if (!priv)
  1519			return -ENOMEM;
  1520	
  1521		if (phydev->mdio.addr == AIROHA_DEFAULT_PORT0_ADDR)
> 1522			shared->phydev_p0 = phydev;
  1523	
  1524		phydev->priv = priv;
  1525	
  1526		return 0;
  1527	}
  1528	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

