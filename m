Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0D3C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 19:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TojYZU5Lq9Ptstf3WmLFqMQkOTbmth19ZsyImu1WtMU=; b=UyEl1ID1K+TfGygWZ5iHu3IICb
	FzPr6A+4zfe6bU1Ds0EtLn0mxnAbVNhFjLDsvQLdFFBK1WqA6xnjW104EacMUPbjkiTIDIk3SfcPA
	v9YQn3qgrBvu4c58MC3qEQC4mQBPL74Po7pHFRu6h8jhFjY8ygYI2k/apRp8a5rjo/OcIDK5mt5HW
	+JSLduKSmf4LDIBX8sCGEOPP1SYmpkXZOoS4aIqX/ti3ZeyXdOcke0K2TAYEQRsre/dptX13miQUv
	UegtcYhGK3OZIrz5ZYB0CHS7ivcMMmdoIJbh6B+kquepOpmt/JFvJ3Xg0RRcps7lxVrEtO1P1AGa8
	GFQKmi3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toSHi-0000000Ep0T-118Q;
	Sat, 01 Mar 2025 19:14:02 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toSG9-0000000Eonx-1Yqi;
	Sat, 01 Mar 2025 19:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740856345; x=1772392345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DyVqMDTjFOtdYjGsdKm+c9WKb6UulDm2pWWftGGsFWw=;
  b=epzjBDxXwK30MnfPJLAKnFFCGClVii2Z86/Rt9vU+XvY3nZFgjVPULsm
   IX8JGMx9sulZw6wqdxx3Ps/qCMcvd6TXKefkyaIj8cCiGcwF7BBjUcqPN
   McA3FWmgeux4Ccli5NtCAz22720ii/o5qIJpn812bgS6qboeejLp5sGoV
   QacPSICddRn2yyAhMBjGk+n0aeUi6HrBaJXIaYbSJ94XKOkQc0NWcIcPy
   3csmKGeAW52rGJop3fyYWAJtTo1EEiR76AM8eKbnE0Fl+ubLVoHZOwnoV
   qZ7Ur2XqNI/GFvCnpDrWuuyWMKA0ysinBPpXAbwJ7jpX31HcSaCkHNDhG
   Q==;
X-CSE-ConnectionGUID: YZ9YMKERSheVWPSURqAgfA==
X-CSE-MsgGUID: ZYAL+mXcTd2AQBQpHZ1ziA==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="59312164"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="59312164"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 11:12:23 -0800
X-CSE-ConnectionGUID: ZKwj2oENQ26kcnYX2VV9KA==
X-CSE-MsgGUID: GIqMLBn7SBWjMx3cSMshMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117494432"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Mar 2025 11:12:18 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toSFo-000Gb8-0a;
	Sat, 01 Mar 2025 19:12:06 +0000
Date: Sun, 2 Mar 2025 03:10:48 +0800
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
Message-ID: <202503020223.C2TbkgPv-lkp@intel.com>
References: <edba99c5-0f95-40bd-8398-98d811068369@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edba99c5-0f95-40bd-8398-98d811068369@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_111225_453489_D377165E 
X-CRM114-Status: GOOD (  12.74  )
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
config: arc-randconfig-001-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020223.C2TbkgPv-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020223.C2TbkgPv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020223.C2TbkgPv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/bcm54140.c: In function 'bcm54140_base_read_rdb':
>> drivers/net/phy/bcm54140.c:436:15: error: implicit declaration of function '__phy_package_write'; did you mean '__phy_package_write_mmd'? [-Werror=implicit-function-declaration]
     436 |         ret = __phy_package_write(phydev, BCM54140_BASE_ADDR,
         |               ^~~~~~~~~~~~~~~~~~~
         |               __phy_package_write_mmd
>> drivers/net/phy/bcm54140.c:441:15: error: implicit declaration of function '__phy_package_read'; did you mean '__phy_package_read_mmd'? [-Werror=implicit-function-declaration]
     441 |         ret = __phy_package_read(phydev, BCM54140_BASE_ADDR,
         |               ^~~~~~~~~~~~~~~~~~
         |               __phy_package_read_mmd
   cc1: some warnings being treated as errors


vim +436 drivers/net/phy/bcm54140.c

4406d36dfdf1fb Michael Walle     2020-04-20  430  
6937602ed3f9eb Michael Walle     2020-04-20  431  static int bcm54140_base_read_rdb(struct phy_device *phydev, u16 rdb)
6937602ed3f9eb Michael Walle     2020-04-20  432  {
6937602ed3f9eb Michael Walle     2020-04-20  433  	int ret;
6937602ed3f9eb Michael Walle     2020-04-20  434  
dc9989f173289f Michael Walle     2020-05-06  435  	phy_lock_mdio_bus(phydev);
9eea577eb1155f Christian Marangi 2023-12-15 @436  	ret = __phy_package_write(phydev, BCM54140_BASE_ADDR,
9eea577eb1155f Christian Marangi 2023-12-15  437  				  MII_BCM54XX_RDB_ADDR, rdb);
6937602ed3f9eb Michael Walle     2020-04-20  438  	if (ret < 0)
6937602ed3f9eb Michael Walle     2020-04-20  439  		goto out;
6937602ed3f9eb Michael Walle     2020-04-20  440  
9eea577eb1155f Christian Marangi 2023-12-15 @441  	ret = __phy_package_read(phydev, BCM54140_BASE_ADDR,
9eea577eb1155f Christian Marangi 2023-12-15  442  				 MII_BCM54XX_RDB_DATA);
6937602ed3f9eb Michael Walle     2020-04-20  443  
6937602ed3f9eb Michael Walle     2020-04-20  444  out:
dc9989f173289f Michael Walle     2020-05-06  445  	phy_unlock_mdio_bus(phydev);
6937602ed3f9eb Michael Walle     2020-04-20  446  	return ret;
6937602ed3f9eb Michael Walle     2020-04-20  447  }
6937602ed3f9eb Michael Walle     2020-04-20  448  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

