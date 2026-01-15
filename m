Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65849D41161
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 10:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUtR5fZCMCFDv1L2fMuKGaJoYYlZ9nsRbdS8uOlBfMA=; b=HGuj+XT995OvpDHeQi2ZTlSF2I
	tz76mPNM90a70sL+4sizvGcIaAd4i2I10DDWL8glOk95vyboi6PKslwUWwA7/t9+H8fgCppovpJaH
	VTSkCtBa8bORNx7uzAmAFlxlG01X8xUWRztjB/b/Ihe0vpVRBqNhAph6NMcTgCqNM6tClugBrTzGq
	7w4cb9/NbGZoqYHmoz1UL7uogOAkGJ8v501zBfML9lqHuZuK3KCZBTylbtrDMcPmHe3UN1ffAZgfQ
	5assAsUkfOkNg7cXKdQyv0CJB4ROem2aj0svkHAqnujVzB0ajdfxDpshbSpBdtBWpxXawSFZQ7GSx
	7EuN9bsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKWN-0000000C9Ti-19cr;
	Thu, 15 Jan 2026 10:24:07 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKWK-0000000C9TJ-2yHN;
	Thu, 15 Jan 2026 10:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768472645; x=1800008645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p9miV0nNryyvHyd1FyrzdZUkZX6TLv1ioe/BqF8c1NU=;
  b=jRjRqbcwrVvgD4v2swy7XNyecUwR5mCapexxWS0KLD/0ePG523r74JxF
   ZXNdz7qygSeCj3IYjrNffeOK3pWl36lmlDc8Q50USe3KxiM2KF4t0S+nt
   p28WW1DQOp9GHDG+Lo78U8qDCtByKjtTL4bfsWL7byJY4EVNZuWkbRKgP
   Pj8T0lMNpaFAZzoGTzjXWRU3GzBvIoHOb0/qJ76Du8NKPOEbbG6epPvP6
   XCfOJ97D7h+CvlDQCLisfwyca/sHwrDkkghxJts9QPgjByKeWKkn1MQ31
   DOwlRVqfZl/xqPR0eYQvG+dxqRHTPl/yOHNZ1t5J81QESy6T/um0XNyUR
   Q==;
X-CSE-ConnectionGUID: wFQ7inWkTuaFo5eaKQPLlQ==
X-CSE-MsgGUID: izvHOQvtTFOfkjrj/c1m+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="68787905"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="68787905"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:24:02 -0800
X-CSE-ConnectionGUID: 1DP/q8OUSOaiDbgrzWpjsw==
X-CSE-MsgGUID: +4l+nVOsSCmGCnreoNkZIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209393799"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jan 2026 02:23:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgKWB-00000000HqG-0nOs;
	Thu, 15 Jan 2026 10:23:55 +0000
Date: Thu, 15 Jan 2026 18:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 03/14] phy: qcom-sgmii-eth: add .set_mode() and
 .validate() methods
Message-ID: <202601151700.IjgxseKd-lkp@intel.com>
References: <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_022404_784728_09ECFF0D 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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

Hi Russell,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-qcom-ethqos-remove-mac_base/20260115-054728
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vg4vs-00000003SFt-1Fje%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 03/14] phy: qcom-sgmii-eth: add .set_mode() and .validate() methods
config: powerpc-randconfig-002-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151700.IjgxseKd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151700.IjgxseKd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151700.IjgxseKd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:294:17: error: use of undeclared identifier 'PHY_INTERFACE_MODE_SGMII'
     294 |         if (submode == PHY_INTERFACE_MODE_SGMII ||
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:295:17: error: use of undeclared identifier 'PHY_INTERFACE_MODE_1000BASEX'
     295 |             submode == PHY_INTERFACE_MODE_1000BASEX)
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:298:17: error: use of undeclared identifier 'PHY_INTERFACE_MODE_2500BASEX'
     298 |         if (submode == PHY_INTERFACE_MODE_2500BASEX)
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/PHY_INTERFACE_MODE_SGMII +294 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c

   288	
   289	static int qcom_dwmac_sgmii_phy_speed(enum phy_mode mode, int submode)
   290	{
   291		if (mode != PHY_MODE_ETHERNET)
   292			return -EINVAL;
   293	
 > 294		if (submode == PHY_INTERFACE_MODE_SGMII ||
 > 295		    submode == PHY_INTERFACE_MODE_1000BASEX)
   296			return SPEED_1000;
   297	
 > 298		if (submode == PHY_INTERFACE_MODE_2500BASEX)
   299			return SPEED_2500;
   300	
   301		return -EINVAL;
   302	}
   303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

