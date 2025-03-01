Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41C8C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 20:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDeGD81LcvcGNEuhAUPD0VYikkC8nQkExLEUkP1mwEY=; b=WJYH196NQCn4+w4KDgIxjzP+BV
	N5GnNJ7cPRYHWumkWVVkNfOX0u8idK4rpBaVqBHvBtcxeXMLKSCmVnQSFT+SfvhgZrQiH+ISe0rph
	YB9gRfrej+jVuFoxoI0LgWPvHTKm04JwagcEBFQ0TeDZRwHjVw0zH2ZEf28piAXGOGXKLLR/fDsp0
	UD70Nf3JiBESMsnDJboA4tzoDZ7WG3f3w3eOIAdQNv9GLs8mLxEB305R8oRNBLNNukn1GtvxivqQP
	KhhGvnUBYTjyMs7JwzJu9ZYj8lWDsMukfyo2i6jivzp3vIEwfKL7knIQixf/SWoJwfOt/6x7iXi85
	CA7qJgYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toTLd-0000000EuqQ-14qc;
	Sat, 01 Mar 2025 20:22:09 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toTK5-0000000EucO-0ydr;
	Sat, 01 Mar 2025 20:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740860433; x=1772396433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rrQ//fnypHMrN3fd4zsduRE3QZa4hstc4Z87aOa0Lpo=;
  b=NP9ICqpNcfiH4HzBHROcha+tDUIyDuWr5QHPEZH8hFdZT01talFoa3AQ
   0cS8sAx8pEVH8gx0WK00XytFpq7wOY+bvg27Hiy2lT37eAlvR/tcR/9+m
   zeMThIBuUu0288wUjdOFygWZ+MriS+zZmtUYnCQmYEjxh8GDMIZZmELYh
   o+dmjEiJkmKmpO9qDIwN71Vpp1qe2udgvjxTtFG7kkcLvZQ3NNHOFhfaZ
   5XxU3pljxdt5GgBrF8PF0TdOMdiHQIU1Q+2STgI+t9bHboQDO1VMcDt8q
   gzfrfNdq1TGMxK9cxo/8h4+haw2le23GMfn319fH8zyhWlnnG4LAH7Jx8
   A==;
X-CSE-ConnectionGUID: jdMQXhswQJy470FBdtPa4A==
X-CSE-MsgGUID: BpgQ7iZBQlyjxpZpzrAZ5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="52411940"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="52411940"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 12:20:31 -0800
X-CSE-ConnectionGUID: xuVHpwFRQROXxCZ9NKWMIg==
X-CSE-MsgGUID: 2Mf5tN2yQliX1ZcvqY3OdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117501197"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Mar 2025 12:20:26 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toTJs-000GfD-1E;
	Sat, 01 Mar 2025 20:20:22 +0000
Date: Sun, 2 Mar 2025 04:19:55 +0800
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
Subject: Re: [PATCH net-next v2 8/8] net: phy: remove remaining PHY package
 related definitions from phy.h
Message-ID: <202503020420.v2TkGxj1-lkp@intel.com>
References: <6ad490fa-61ad-48b8-9660-bb525f756f41@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ad490fa-61ad-48b8-9660-bb525f756f41@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_122033_288063_B26601D8 
X-CRM114-Status: GOOD (  12.25  )
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
patch link:    https://lore.kernel.org/r/6ad490fa-61ad-48b8-9660-bb525f756f41%40gmail.com
patch subject: [PATCH net-next v2 8/8] net: phy: remove remaining PHY package related definitions from phy.h
config: arc-randconfig-001-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020420.v2TkGxj1-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020420.v2TkGxj1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020420.v2TkGxj1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/bcm54140.c: In function 'bcm54140_base_read_rdb':
   drivers/net/phy/bcm54140.c:436:15: error: implicit declaration of function '__phy_package_write'; did you mean '__phy_package_write_mmd'? [-Werror=implicit-function-declaration]
     436 |         ret = __phy_package_write(phydev, BCM54140_BASE_ADDR,
         |               ^~~~~~~~~~~~~~~~~~~
         |               __phy_package_write_mmd
   drivers/net/phy/bcm54140.c:441:15: error: implicit declaration of function '__phy_package_read'; did you mean '__phy_package_read_mmd'? [-Werror=implicit-function-declaration]
     441 |         ret = __phy_package_read(phydev, BCM54140_BASE_ADDR,
         |               ^~~~~~~~~~~~~~~~~~
         |               __phy_package_read_mmd
   drivers/net/phy/bcm54140.c: In function 'bcm54140_probe':
>> drivers/net/phy/bcm54140.c:594:9: error: implicit declaration of function 'devm_phy_package_join' [-Werror=implicit-function-declaration]
     594 |         devm_phy_package_join(&phydev->mdio.dev, phydev, priv->base_addr, 0);
         |         ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/devm_phy_package_join +594 drivers/net/phy/bcm54140.c

6937602ed3f9eb Michael Walle 2020-04-20  578  
6937602ed3f9eb Michael Walle 2020-04-20  579  static int bcm54140_probe(struct phy_device *phydev)
6937602ed3f9eb Michael Walle 2020-04-20  580  {
6937602ed3f9eb Michael Walle 2020-04-20  581  	struct bcm54140_priv *priv;
6937602ed3f9eb Michael Walle 2020-04-20  582  	int ret;
6937602ed3f9eb Michael Walle 2020-04-20  583  
6937602ed3f9eb Michael Walle 2020-04-20  584  	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
6937602ed3f9eb Michael Walle 2020-04-20  585  	if (!priv)
6937602ed3f9eb Michael Walle 2020-04-20  586  		return -ENOMEM;
6937602ed3f9eb Michael Walle 2020-04-20  587  
6937602ed3f9eb Michael Walle 2020-04-20  588  	phydev->priv = priv;
6937602ed3f9eb Michael Walle 2020-04-20  589  
6937602ed3f9eb Michael Walle 2020-04-20  590  	ret = bcm54140_get_base_addr_and_port(phydev);
6937602ed3f9eb Michael Walle 2020-04-20  591  	if (ret)
6937602ed3f9eb Michael Walle 2020-04-20  592  		return ret;
6937602ed3f9eb Michael Walle 2020-04-20  593  
dc9989f173289f Michael Walle 2020-05-06 @594  	devm_phy_package_join(&phydev->mdio.dev, phydev, priv->base_addr, 0);
dc9989f173289f Michael Walle 2020-05-06  595  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

