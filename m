Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF77C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 00:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bwuQ5JYnB6lZmP6/02Pp+EFW5CJKUaTYhGcZzl3EhY=; b=KIoJK0ZW8kDmgHPnuBYSnOlKx0
	oSI5A76TACkmIXdTWK1V6MgL8pzCl+945MLqZcKt9wHL5/UTMIpgll2WtUVf5R/ae3jG0T9/QtkNX
	l70uzB6+QhevFF76FiLWZtE9GtaHE8aL/QLP9uzsSW21ro7bVoAcyrp1PkaVpKpfZiCixJIhsixC8
	8z/HDi4GNsVKqUiwcI6IQBldjMYHdIyb4eZRnz+DjMlkhbcmcwkkC5bD9/c9pTijO1AEM4a43pVxx
	NdVQqK9VMMLFDPSwdhP+gDVfpskZ0SeI0S/g2e/UBO+mrTaYOkj0qKufb1Jrp9SkruPr8pvcr08Nl
	yatpqlog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukAbF-00000001idd-3gvG;
	Fri, 08 Aug 2025 00:04:45 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukAYi-00000001iYq-1jgd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 00:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754611329; x=1786147329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OVvKRnCZPCkUikFXoenXFVKIrczw+FKb6AEftfO2P4w=;
  b=DMRvhqFVSr0pwS96mA7yZ2/U5iLfJRpUocNNdvHcx1vHQucCWIPD4YPl
   OXnCiqF0AK80c3gDbEUBs14QeRNRC9CjgH61OdksOT8+hWaGIed3SOEFP
   lyY6TtdrZKHtTVWrjRlyCrdANualteTokn3szLgZw6QNwUNZVxMtj+2dg
   7RdoPrx1YJuaYeLAfNBarbjsFbowFVbkSRf9NR7JwjbIPuF9Vhw+Hgyqq
   LpGkv8K64yWa7GOp9wEhVdc1bMHeC7ydWWR2ne+oRDwk/FRpuiDRs00ZL
   hFx5p5dxN9Q8UiDZwkmSgiXWEDM7UnMLy/+6ChlhM9Yd8QTbHhrzgByRR
   A==;
X-CSE-ConnectionGUID: SVxnZgUzRTO+sSff2dPN/g==
X-CSE-MsgGUID: 2m8s5hsgR+qY+qXZxSNhkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74414988"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="74414988"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 17:02:00 -0700
X-CSE-ConnectionGUID: K9G9rRQIT+mYRaMSHQtB3w==
X-CSE-MsgGUID: q4VJ23B+QR6CUoOx9V79fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="202356501"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Aug 2025 17:01:55 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukAYS-0003NS-0k;
	Fri, 08 Aug 2025 00:01:52 +0000
Date: Fri, 8 Aug 2025 08:00:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, David Wu <david.wu@rock-chips.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net] net: stmmac: rk: put the PHY clock on remove
Message-ID: <202508080746.BIDlKMy5-lkp@intel.com>
References: <E1ujwIY-007qKa-Ka@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1ujwIY-007qKa-Ka@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_170208_503230_AFD6EBB1 
X-CRM114-Status: GOOD (  10.54  )
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

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-rk-put-the-PHY-clock-on-remove/20250807-165054
base:   net/main
patch link:    https://lore.kernel.org/r/E1ujwIY-007qKa-Ka%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net] net: stmmac: rk: put the PHY clock on remove
config: arm-defconfig (https://download.01.org/0day-ci/archive/20250808/202508080746.BIDlKMy5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080746.BIDlKMy5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080746.BIDlKMy5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:1774:6: error: use of undeclared identifier 'plat'
    1774 |         if (plat->phy_node && bsp_priv->integrated_phy)
         |             ^~~~
   1 error generated.


vim +/plat +1774 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

  1765	
  1766	static void rk_gmac_remove(struct platform_device *pdev)
  1767	{
  1768		struct rk_priv_data *bsp_priv = get_stmmac_bsp_priv(&pdev->dev);
  1769	
  1770		stmmac_dvr_remove(&pdev->dev);
  1771	
  1772		rk_gmac_powerdown(bsp_priv);
  1773	
> 1774		if (plat->phy_node && bsp_priv->integrated_phy)
  1775			clk_put(bsp_priv->clk_phy);
  1776	}
  1777	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

