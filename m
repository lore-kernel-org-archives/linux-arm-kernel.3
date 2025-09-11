Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8D3CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 01:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmQwDbPe0d6D40ZEhjYJG3rJLTV4CqA24qelKYoIEx0=; b=kYCKvmRCcCY3yWHDX+5wtD9dIB
	DmcL1yuu4fzbwZuk711lgBwDnRm+OwBaK+IWybzsaCoDAmwSC5XMwmAStVMi5BfpGd7A8CUDR/nT+
	YF4qMlc69noflulLrax9kywM7RTp7S4epUDpEOYm5odpDBAM3VNTa3xlWJLWCci3MbTz55y444IJq
	SG01fqjKYZwFqRcBitdOQLt+DMS1wZmeOwp6kXmzX+mmMFmJpx2Ax1XrJFlEw9abbhvMR2HQs+Ngc
	Mr98GFc+EwQKl0Rwx3Gysmnvsa0B96W83L62sbY/agqRMNWBgKCNj/9acV3H9rC5UUA9hx4WefUTT
	X0IHoRmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVfw-000000002Ki-35ga;
	Thu, 11 Sep 2025 01:00:36 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVft-000000002Ip-1kWb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 01:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757552434; x=1789088434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XeSikDz3/rCknydEBrqESWnjjoPx806qZ8IdQkhjSTI=;
  b=J1YBhI435k5t7lRfQBCS+vAavpMt7DQ03Oqb5ZuJfwf15Tna7V89gK5L
   gUz+g7JgIc+VLo3cGq7NuARHMQ3ZJ57dRJrkd/cp5BQ8iC/vUKCdKNlZc
   4SNIJsltVg+iSUE1iUM+IijqFaZu+DUaD3if128SWL2XV0tXk1wjX6K1h
   cmLrU4FaBXceKxa0uXazQfYZMTKNuKzKov8f5T2c6twKNh2RAkcjxqNH9
   W37H6DCHaclmWNM8MqXjc6j+T8IjAJZWyMLwaRHmW5Uxb3YadkaLcyEim
   0BWkRUO0pSm6Uy3N11BAgWbB7EidKnp42xib8h+JbqxeVZWz1VgEutxZZ
   g==;
X-CSE-ConnectionGUID: b4CIZ3XmQcyVSnsMb6zBBw==
X-CSE-MsgGUID: QDjvmjJ2TLi8h4NvMxc9vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="85320734"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="85320734"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:00:30 -0700
X-CSE-ConnectionGUID: KgU3xY3NQhWIRsn18xSuHA==
X-CSE-MsgGUID: cHaGfah0QLCNJg8PMluWrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="173382583"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Sep 2025 18:00:23 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwVfg-0006OT-14;
	Thu, 11 Sep 2025 01:00:20 +0000
Date: Thu, 11 Sep 2025 08:59:53 +0800
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
Subject: Re: [PATCH net-next v12 09/18] net: phylink: Move sfp interface
 selection and filtering to phy_caps
Message-ID: <202509110810.9Kjzuszo-lkp@intel.com>
References: <20250909152617.119554-10-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909152617.119554-10-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_180033_477051_6AB3609B 
X-CRM114-Status: GOOD (  10.19  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/dt-bindings-net-Introduce-the-ethernet-connector-description/20250909-233858
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250909152617.119554-10-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next v12 09/18] net: phylink: Move sfp interface selection and filtering to phy_caps
config: arm-randconfig-001-20250910 (https://download.01.org/0day-ci/archive/20250911/202509110810.9Kjzuszo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110810.9Kjzuszo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509110810.9Kjzuszo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "phy_caps_filter_sfp_interfaces" [drivers/net/phy/phylink.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

