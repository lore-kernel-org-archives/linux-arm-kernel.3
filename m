Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7E7C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 06:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pa7tuAG9HMU9wey2hnuWGU/FxuhhDcIAnnTd6+X3+a8=; b=Y1AoyWe7NWG4bUsZc63WwbnLKe
	MwT5D6/V2m2Nw3tRJ7bNVInTtlF9XrxMiE72pEQQjfus38TLNmLIzVfkjyCFlMYucP2sHWAC7bHMb
	91mT5FK9kXedGybmfT4G6t0AQdW/7+wX0fZGrN1/s8NC3u2sNW/Dk6QRU6yegLa4Ca2H7Eb8B2pKQ
	GLy9VXfMD+HUfuSN9ecddLNNQMTVwvynifWU72trUiXuvlrUB9nGwwsKw5zoQfsoCQpvsbo9MZeSm
	wpF9pI98xM2XTsuPVWgm6mWQgdXSCup2GWtrRXKxlpE15VhY6qhEKwL1kgEkOINoRTADzVR+8vy94
	nH4vWTQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm5fb-0000000AWjR-0OFq;
	Sun, 23 Feb 2025 06:40:55 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm5e5-0000000AWXC-2b1l
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 06:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740292762; x=1771828762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I+4KPvRzypPtuDrJMCOOp4HSPrPDgHBgGBkD6P6VHUI=;
  b=MlfEFbhL9jGYyJJCSsQHS27D5Qe5HAflnc+X24Ze1Yl1TtwUXukox42o
   GbJg+XDERZvn3DwtJdMvsWvBW2bmph7+DuOWxo9xVkfLBohECtcdBhADv
   MSyiD9Z8uAKgRxIU3/mSxZw5X56EeJKbkb6oVgL1ebOXxnD6jJenPA49V
   a17BvQdiPZEIOCUZDcRKIobZgiijvNYp83JcsbKSasd4BqpLEMMuOVOgt
   61IRnO5lhTqSHFlM62uJcDBI/nt3kUkWBBmxD/uobhMFxwEfdEoJhQaIE
   fB0PAwAwkW4tmNfIFBgxhVNFsfrttvv/FEsmfeQYDKUkcgJAfGhZVmZqp
   g==;
X-CSE-ConnectionGUID: xhhsVlvzTaa3N0lqv152ag==
X-CSE-MsgGUID: jLvqwp0LQ3+Tsruamudxhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="44849617"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="44849617"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 22:39:16 -0800
X-CSE-ConnectionGUID: 5uG0uvraSIuqsYe9IW/NcQ==
X-CSE-MsgGUID: ia23rpyKQ7SEVYI3PsLXiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="115719579"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Feb 2025 22:39:11 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm5ds-0007Al-2M;
	Sun, 23 Feb 2025 06:39:08 +0000
Date: Sun, 23 Feb 2025 14:38:46 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Simon Horman <horms@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 08/13] net: phy: phy_caps: Introduce
 link_caps_valid
Message-ID: <202502231409.QTfXTqrD-lkp@intel.com>
References: <20250222142727.894124-9-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222142727.894124-9-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_223921_740595_F4C58358 
X-CRM114-Status: GOOD (  10.10  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-phy-Extract-the-speed-duplex-to-linkmode-conversion-from-phylink/20250222-223310
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250222142727.894124-9-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next 08/13] net: phy: phy_caps: Introduce link_caps_valid
config: x86_64-buildonly-randconfig-004-20250223 (https://download.01.org/0day-ci/archive/20250223/202502231409.QTfXTqrD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502231409.QTfXTqrD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502231409.QTfXTqrD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phy_caps.c:152: warning: Function parameter or struct member 'speed' not described in 'phy_caps_valid'
>> drivers/net/phy/phy_caps.c:152: warning: Function parameter or struct member 'duplex' not described in 'phy_caps_valid'
>> drivers/net/phy/phy_caps.c:152: warning: Function parameter or struct member 'linkmodes' not described in 'phy_caps_valid'


vim +152 drivers/net/phy/phy_caps.c

   147	
   148	/**
   149	 * phy_caps_valid() - Validate a linkmodes set agains given speed and duplex
   150	 */
   151	bool phy_caps_valid(int speed, int duplex, const unsigned long *linkmodes)
 > 152	{
   153		int capa = speed_duplex_to_capa(speed, duplex);
   154	
   155		if (capa < 0)
   156			return false;
   157	
   158		return linkmode_intersects(link_caps[capa].linkmodes, linkmodes);
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

