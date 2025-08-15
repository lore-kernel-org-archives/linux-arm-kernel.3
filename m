Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3145DCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 03:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qW6GGEoW3JbHQ+0b94eNnAs601mOZeKLmjo5b3ELz+w=; b=0mSwDo4MO2EbpnwF9Wo0RdT9Nk
	N/93SnIxJ11Neu5X97NHGYWA4mHEdAWfJ6ErEoFVZDQSZN8asaN+zCTE25gBbiN+xLx1cqlS9bqSW
	TiIcvb21ogyk2pIeGu3kkafKtzWZdMokTGM4VY3ftoGANqYZkFGH7R4wdoqf+zzL/3WS7X1HNpIjk
	gWwkefuH1yHIGk9UjZbxsDfP/dxaxjAuJ5xgKS1jvI3reNZP6r9NjPOaMaAVu0EVETOstxNEZrSIl
	N4we06Krxe+0tP1/qggP8FexCFx32KMY7Petr+e2OvkyeeA9vGtAIsQ+U0UKAENkFa0oNLf6DPbnO
	iMOc5+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlME-00000001K6p-30RC;
	Fri, 15 Aug 2025 03:43:58 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uml5N-00000001IDv-1GhF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 03:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755228393; x=1786764393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5CtCyWuTgP/8clYLR9mQb2RLKdITFXhoF9CEAmqsi5s=;
  b=AZfO4dCA23WYOTJcty5uUo6Kmy/8L7x9JpPpXo2YDieuWtCBYXif9QJW
   S8IxHKAL74Qt0HxUS0e76N7tj8PlNL4NZ01Dfhp5rC5Q96RYnOqiJSZR4
   fLzaPcQqDCHCtdUnOMrwl28Cho1pvNcfPmYmH05Y6l9u+fqRCaqmZMZcm
   ST5hYqueo5QQowgRM0CuFUmmB0BRgHHHrWjg9CBlAChXRR+8uFAdyv1ks
   WIGaW7DLLrsgMc4j40/qMdnSJplpTxypfkAvQemh220oNdAiLTTUYT3WE
   iBi14wxTPZNIOzJuEETxwyHQM5rZgs9nVLwSZk+h28Kx5/cVgn8jKnW+L
   w==;
X-CSE-ConnectionGUID: fWCZm/yMS0S0+ywgHADK7A==
X-CSE-MsgGUID: 7m0aQG2fTAmry80B7IBmhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57465788"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57465788"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 20:26:31 -0700
X-CSE-ConnectionGUID: NPGfBA5+Th+3cPDrRLUODQ==
X-CSE-MsgGUID: oGTsP8FHQlCdwpSczOAxDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="197916558"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Aug 2025 20:26:25 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uml4v-000BVU-2v;
	Fri, 15 Aug 2025 03:26:10 +0000
Date: Fri, 15 Aug 2025 11:25:55 +0800
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
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v11 08/16] net: phy: Introduce generic SFP
 handling for PHY drivers
Message-ID: <202508151058.jqJsn9VB-lkp@intel.com>
References: <20250814135832.174911-9-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814135832.174911-9-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_202633_391223_E205C93B 
X-CRM114-Status: GOOD (  12.33  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/dt-bindings-net-Introduce-the-ethernet-connector-description/20250814-221559
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250814135832.174911-9-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next v11 08/16] net: phy: Introduce generic SFP handling for PHY drivers
config: i386-randconfig-013-20250815 (https://download.01.org/0day-ci/archive/20250815/202508151058.jqJsn9VB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151058.jqJsn9VB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151058.jqJsn9VB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phy_device.c:1625:47: warning: variable 'iface' is uninitialized when used here [-Wuninitialized]
    1625 |                 return port->ops->configure_mii(port, true, iface);
         |                                                             ^~~~~
   drivers/net/phy/phy_device.c:1597:2: note: variable 'iface' is declared here
    1597 |         phy_interface_t iface;
         |         ^
   1 warning generated.


vim +/iface +1625 drivers/net/phy/phy_device.c

  1589	
  1590	static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
  1591	{
  1592		struct phy_device *phydev = upstream;
  1593		struct phy_port *port;
  1594	
  1595		__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
  1596		DECLARE_PHY_INTERFACE_MASK(interfaces);
  1597		phy_interface_t iface;
  1598	
  1599		linkmode_zero(sfp_support);
  1600	
  1601		port = phy_get_sfp_port(phydev);
  1602		if (!port)
  1603			return -EINVAL;
  1604	
  1605		sfp_parse_support(phydev->sfp_bus, id, sfp_support, interfaces);
  1606	
  1607		if (phydev->n_ports == 1)
  1608			phydev->port = sfp_parse_port(phydev->sfp_bus, id, sfp_support);
  1609	
  1610		linkmode_and(sfp_support, port->supported, sfp_support);
  1611		linkmode_and(interfaces, interfaces, port->interfaces);
  1612	
  1613		if (linkmode_empty(sfp_support)) {
  1614			dev_err(&phydev->mdio.dev, "incompatible SFP module inserted, no common linkmode\n");
  1615			return -EINVAL;
  1616		}
  1617	
  1618		/* Check that this interface is supported */
  1619		if (!test_bit(iface, port->interfaces)) {
  1620			dev_err(&phydev->mdio.dev, "PHY %s does not support the SFP module's requested MII interfaces\n", phydev_name(phydev));
  1621			return -EINVAL;
  1622		}
  1623	
  1624		if (port->ops && port->ops->configure_mii)
> 1625			return port->ops->configure_mii(port, true, iface);
  1626	
  1627		return 0;
  1628	}
  1629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

