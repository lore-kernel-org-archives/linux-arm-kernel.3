Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1FBC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 15:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Et8zaeSAZUlEQ0+gC27ZaeDPugP4CHgxQeCHd7RhhjY=; b=KhcbDK3roE80LfEGwbdcy2kXVP
	vyQgl2rMRUg7SJOU9Ol0y/H4KzsPId52HwBI+TCYSb/C9ZC9dzHNBfPHGEjfvpo7l1PuHj6pGtRw8
	zh1LBhvp9KmKdz08o+cEsYRgezH72czrIe4E7kNktpjHUmycQ3fz+jPfiUaGN1BW3il7FLlTtGiWP
	UX2aVZmYWoHJbQvDlZOowevI988Sa9i9mcbRF8GvVcMOY7qi/mb19xMZq6kC8y4ngAdmS6EV3DyJp
	ahkw09ZCgd70ZA9V1L1flQ0FQpmxRGWkEn/hUfaDyqqxpTV36Cw9wR1mQK9nb/fvpDl5PT9aakHc4
	dNsyv+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgmr5-0000000D8z5-11Dt;
	Sat, 08 Feb 2025 15:34:51 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgmpg-0000000D8qQ-1H38
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 15:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739028804; x=1770564804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4MfKlmgKA16abJaUXilG0XVt+qrQnkw/jnRZF3C8eKc=;
  b=oB5hxA3ZPa6snA99IRlZJsGcJlDSya/bPAWyE0EwNvbP1oN619J3UF5r
   iaUWh13XVZ8WtZkViCSnw2x7kP8t6o5ZFKjC8pTegRfUc+DPS6Or5d7uS
   AUqop6vsfK7PcO/tPK+NSbzrdiOY13holHliDTrHu2R68566LJ+47a45H
   4XrKVVX7LXmw4PPQKmrJtOyMNskUE9Fvcd3aBVvc4G1IK0rg8UziTDxiA
   9CBG3rnzrLyoqwoAUEA/cl+oTFGG2ZyOPjC9L4GycC98zLxV+CqWobEji
   x1il5Uy4y0KQ4BNytFVRXUfaDKLZem2zDCEYxShY6kD27hIeMVmiZ8dPr
   g==;
X-CSE-ConnectionGUID: 4kjyBUKVQFWaKnJDjUiTBw==
X-CSE-MsgGUID: h0pD5mfFSQeR3BHcs8BUqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39565337"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39565337"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:33:19 -0800
X-CSE-ConnectionGUID: F79XaquyTfmgwlWFQzGcEg==
X-CSE-MsgGUID: ZJmfoK3cRaiIBCKdfEjLMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="111618617"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2025 07:33:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgmpS-0010C7-2e;
	Sat, 08 Feb 2025 15:33:10 +0000
Date: Sat, 8 Feb 2025 23:32:35 +0800
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
Subject: Re: [PATCH net-next 06/13] net: phy: Intrduce generic SFP handling
 for PHY drivers
Message-ID: <202502082328.PaOrs2Uu-lkp@intel.com>
References: <20250207223634.600218-7-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207223634.600218-7-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_073324_424724_8848B901 
X-CRM114-Status: GOOD (  10.44  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-ethtool-Introduce-ETHTOOL_LINK_MEDIUM_-values/20250208-064223
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250207223634.600218-7-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next 06/13] net: phy: Intrduce generic SFP handling for PHY drivers
config: i386-buildonly-randconfig-004-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082328.PaOrs2Uu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082328.PaOrs2Uu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082328.PaOrs2Uu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/phy_device.c:3682: warning: Function parameter or struct member 'phydev' not described in 'phy_get_sfp_port'


vim +3682 drivers/net/phy/phy_device.c

  3677	
  3678	/**
  3679	 * phy_get_sfp_port() - Returns the first valid SFP port of a PHY
  3680	 */
  3681	struct phy_port *phy_get_sfp_port(struct phy_device *phydev)
> 3682	{
  3683		struct phy_port *port;
  3684		list_for_each_entry(port, &phydev->ports, head)
  3685			if (port->active && port->is_serdes)
  3686				return port;
  3687	
  3688		return NULL;
  3689	}
  3690	EXPORT_SYMBOL_GPL(phy_get_sfp_port);
  3691	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

