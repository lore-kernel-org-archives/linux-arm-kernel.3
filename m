Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0191C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 16:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOCr/MTNScis2/c2uoVg+lg4uLcVIUiw466cIskrmsI=; b=s5+mHEklrCwQ/kniMIsQL2bFF6
	l0vaunQPMHg6JIeT33fzedPxrM4j+w9a6+6R8TQ3LYZx8JmIgx4xXgNITeMgTdfSixXOaQMXLrp4y
	LCQOv2eMriNVGvhTbd67/q/k6KMg2kzCjWy0qMCL/k/Gc6xDFZM4jJiCWR1fzZ42Kc8Dtm95WH3Wr
	txJxcJ/tZfkjq4mXNbixTP0thIJCJDjkp6XV5nuIM2WChpzDvd8mhuJ4exXhCOaR04T9lTLkHG2qG
	el/g5NpvOl6HNw/eZa+KzntxcenpHtL2Infhi+eqB7rbdnQIgAXA9A5gzXRO6Q7QZ4SY94rqUpeon
	1Wn2GuHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgnVn-0000000DCf6-3QvF;
	Sat, 08 Feb 2025 16:16:55 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgnUO-0000000DCVU-39oW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 16:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739031329; x=1770567329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qjV1wjKjlXBB7aJHZrNgaXYHC6q7WnBZJMd9PbbzIxQ=;
  b=dZ7SFyxtPoC5PoA3YHIu2nfk5BBS6hhBnDwjPj8CnoFkIwsk7lhfgmkK
   CPWz/az1EgjqpHH6vOfPR9VucOWo3ot5zWya1p4Q+JCgZZek61phqxl/d
   RmfiJ7dBK95H0Q9pt7MuADgiL/qwa7cSV6/XDjDcuntRwfiTiTp/2vJ6F
   kCUz+KEh06sDEwxErk4dTYK1O5EspBgbRbYm6yFZBXdfXlJ6mu9CRnuCi
   /1MXAflKmaMbAnumpVl36gDuie3C2LwwvdBmuhUkdyO28BZgY7IyKkzFH
   CAjkU+RUH4X7UTttfgnjXfmJx5VDs1hua2pyvIurN2xGDvDvx5Zx9Uz1U
   A==;
X-CSE-ConnectionGUID: GWQQJGSnS0GzBrDRACnJlg==
X-CSE-MsgGUID: vfOpRFhaT7CEDaMrLEkb4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="27266062"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="27266062"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 08:15:28 -0800
X-CSE-ConnectionGUID: u7esEy1ORdW8L+jgc21u/A==
X-CSE-MsgGUID: 7p6bmWiyR/eQipD6rm+wmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142673942"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Feb 2025 08:15:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgnUF-0010J1-1s;
	Sat, 08 Feb 2025 16:15:19 +0000
Date: Sun, 9 Feb 2025 00:15:18 +0800
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
Subject: Re: [PATCH net-next 12/13] net: phy: dp83822: Add SFP support
 through the phy_port interface
Message-ID: <202502090056.jTCOvIPk-lkp@intel.com>
References: <20250207223634.600218-13-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207223634.600218-13-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_081528_803541_787AD01A 
X-CRM114-Status: GOOD (  12.45  )
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
patch link:    https://lore.kernel.org/r/20250207223634.600218-13-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next 12/13] net: phy: dp83822: Add SFP support through the phy_port interface
config: i386-buildonly-randconfig-004-20250208 (https://download.01.org/0day-ci/archive/20250209/202502090056.jTCOvIPk-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090056.jTCOvIPk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090056.jTCOvIPk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/dp83822.c:916:43: error: use of undeclared identifier 'interfaces'
     916 |                 __set_bit(PHY_INTERFACE_MODE_100BASEFX, interfaces);
         |                                                         ^
>> drivers/net/phy/dp83822.c:916:13: error: use of undeclared identifier 'PHY_INTERFACE_MODE_100BASEFX'; did you mean 'PHY_INTERFACE_MODE_100BASEX'?
     916 |                 __set_bit(PHY_INTERFACE_MODE_100BASEFX, interfaces);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           PHY_INTERFACE_MODE_100BASEX
   include/linux/bitops.h:54:48: note: expanded from macro '__set_bit'
      54 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                                           ^
   include/linux/bitops.h:44:25: note: expanded from macro 'bitop'
      44 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^
   include/linux/phy.h:140:2: note: 'PHY_INTERFACE_MODE_100BASEX' declared here
     140 |         PHY_INTERFACE_MODE_100BASEX,
         |         ^
>> drivers/net/phy/dp83822.c:916:43: error: use of undeclared identifier 'interfaces'
     916 |                 __set_bit(PHY_INTERFACE_MODE_100BASEFX, interfaces);
         |                                                         ^
>> drivers/net/phy/dp83822.c:916:43: error: use of undeclared identifier 'interfaces'
   drivers/net/phy/dp83822.c:916:13: error: use of undeclared identifier 'PHY_INTERFACE_MODE_100BASEFX'
     916 |                 __set_bit(PHY_INTERFACE_MODE_100BASEFX, interfaces);
         |                           ^
>> drivers/net/phy/dp83822.c:916:43: error: use of undeclared identifier 'interfaces'
     916 |                 __set_bit(PHY_INTERFACE_MODE_100BASEFX, interfaces);
         |                                                         ^
   drivers/net/phy/dp83822.c:916:13: error: use of undeclared identifier 'PHY_INTERFACE_MODE_100BASEFX'
     916 |                 __set_bit(PHY_INTERFACE_MODE_100BASEFX, interfaces);
         |                           ^
>> drivers/net/phy/dp83822.c:916:43: error: use of undeclared identifier 'interfaces'
     916 |                 __set_bit(PHY_INTERFACE_MODE_100BASEFX, interfaces);
         |                                                         ^
   8 errors generated.


vim +/interfaces +916 drivers/net/phy/dp83822.c

   899	
   900			if (dp83822->fx_enabled) {
   901				port->lanes = 1;
   902				port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASEF) |
   903						BIT(ETHTOOL_LINK_MEDIUM_BASEX);
   904			} else {
   905				/* This PHY can only to 100BaseTX max, so on 2 lanes */
   906				port->lanes = 2;
   907				port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASET);
   908			}
   909		}
   910	
   911		/* If attached from SFP, is_serdes is set, but not the mediums. */
   912		if (port->is_serdes)
   913			dp83822->fx_enabled = true;
   914	
   915		if (dp83822->fx_enabled)
 > 916			__set_bit(PHY_INTERFACE_MODE_100BASEFX, interfaces);
   917	
   918		return 0;
   919	}
   920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

