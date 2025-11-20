Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AF3CFA441
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 19:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzUXBmEHN/iqres10ats5Z8nJBQkiqheknthkfAaCE0=; b=VxnATwlvUarUSSBuyteTWCkQUp
	bY13qW5p4NWXSnh6Lw6igf+s9MFMA+ZwToW/0uX6XS6cAEyTgHyic7FQqMxhVxRLXM3Gjjmm1l+v9
	YLlSHcmkD2doDIkxChT4twRuYTUWA7xJcZ2UN3MwTdGvtX7Y3svGVqg/CNGahQRYj0EKl3w93PuIo
	BqyVZf0fDGmrRWcSCwSR6uIcsI10hKvMg/lqUmTHhzhNCE5DBJ1vGi19wVpjL66TD/GHbZWoVBaI0
	k9ZskiI8WIf2hSFFgw3HnoXRYbVfvMIiheV6WZHAtM7R5Qst3TbKLYkG/sImj9E3aSTx5tVKBIe4w
	36n/ztzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMAeg-00000007JFJ-1K0c;
	Thu, 20 Nov 2025 19:49:22 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMAed-00000007JEv-0Gru
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 19:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763668159; x=1795204159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lyeBpt+cvGIhcc68Nah0hMFJyBVsonJpHyKIen4I70k=;
  b=OGVsvlEKbe6+6d8AkRknBgK34KUZM+9r+1gB0IIy9ZgyHSmmWd9TQw2D
   Z60UQvyt6qpKA7uKPLlRQM2IzoN5aTDzeXHotj+EubRfrVUjMtVVzFW62
   kjHROES6XitMobJmDE7GHHuSE1xJ7LOU838oSlX0GeBHhfeQUahxv1ZT4
   BxzWNJ2+gtzR5J2sHZtI2IAjgEcLCtATLrOUdtuT8c6mLC5SL9GUWwP5/
   Hpso5o4x2gnJKbK6qXwD4xP8mPwDIsqIsjON1R1jBof3wMntRAS7PNift
   DNWSpR3DFwif87zQQ9aq/+wiyjMqVOVeMExCEwwa7AxC+0YdK2c2IaEZI
   g==;
X-CSE-ConnectionGUID: nBbt7+2/Qd+yVTP6AiSMYg==
X-CSE-MsgGUID: I3/Z9JyaRe+vKWul64Bzyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65841766"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="65841766"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 11:49:17 -0800
X-CSE-ConnectionGUID: +4YBvdTzTLGDfuiKK3FNpw==
X-CSE-MsgGUID: u0BX3zHXTuSv/S92bd4IzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="191281630"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Nov 2025 11:49:11 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMAeS-0004Vz-0v;
	Thu, 20 Nov 2025 19:49:08 +0000
Date: Fri, 21 Nov 2025 03:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net
Cc: oe-kbuild-all@lists.linux.dev,
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
Subject: Re: [PATCH net-next v17 03/15] net: phy: Introduce PHY ports
 representation
Message-ID: <202511210333.9rtKR1ph-lkp@intel.com>
References: <20251119195920.442860-4-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119195920.442860-4-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_114919_144937_DEFB0C93 
X-CRM114-Status: GOOD (  10.30  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/dt-bindings-net-Introduce-the-ethernet-connector-description/20251120-041558
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251119195920.442860-4-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next v17 03/15] net: phy: Introduce PHY ports representation
config: powerpc64-randconfig-r133-20251120 (https://download.01.org/0day-ci/archive/20251121/202511210333.9rtKR1ph-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210333.9rtKR1ph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210333.9rtKR1ph-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ethtool/common.c:463:12: sparse: sparse: symbol 'ethtool_link_medium_names' was not declared. Should it be static?

vim +/ethtool_link_medium_names +463 net/ethtool/common.c

   462	
 > 463	const char ethtool_link_medium_names[][ETH_GSTRING_LEN] = {
   464		[ETHTOOL_LINK_MEDIUM_BASET] = "BaseT",
   465		[ETHTOOL_LINK_MEDIUM_BASEK] = "BaseK",
   466		[ETHTOOL_LINK_MEDIUM_BASES] = "BaseS",
   467		[ETHTOOL_LINK_MEDIUM_BASEC] = "BaseC",
   468		[ETHTOOL_LINK_MEDIUM_BASEL] = "BaseL",
   469		[ETHTOOL_LINK_MEDIUM_BASED] = "BaseD",
   470		[ETHTOOL_LINK_MEDIUM_BASEE] = "BaseE",
   471		[ETHTOOL_LINK_MEDIUM_BASEF] = "BaseF",
   472		[ETHTOOL_LINK_MEDIUM_BASEV] = "BaseV",
   473		[ETHTOOL_LINK_MEDIUM_BASEMLD] = "BaseMLD",
   474		[ETHTOOL_LINK_MEDIUM_NONE] = "None",
   475	};
   476	static_assert(ARRAY_SIZE(ethtool_link_medium_names) == __ETHTOOL_LINK_MEDIUM_LAST);
   477	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

