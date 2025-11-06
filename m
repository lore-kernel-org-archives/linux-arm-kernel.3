Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0205CCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 09:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCTli7fpsljsvOnEI6I1DC6ipVCdwGH4JjxLI266Dpg=; b=bz8SJa2zORQN7SYIU2qJq6tvOE
	UyKLFPrKWqICPPVKoXY7IcZwlFoRuPLjK5xC+bLAWRsplC1RfA/CjdGtlPlaWC4kdOPXVzW6dE+e1
	gyxFG0e0gntzuUuMQ6cMcWPlazugX3KPmgT3yPY4a5rXFrSvAvvTgfYzWj8/K8hC245tl1hLytw/S
	hXVUY9pvYfJz/qJ+OqPcteGt2EbQOg/Fr8cqaobQTr8ctCU/mWv8uh69TsIDT3hmsYhuVHs2WmBcz
	TypDZyD25gbFgh2e30orTP34uKBjZ/QZEnfwl4muMb6JII0Mr+RBV0svwiS53hi8dHztIbH0HmtgG
	Prk/RALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvxD-0000000F7pl-2XBQ;
	Thu, 06 Nov 2025 09:06:51 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvxA-0000000F7og-2HWU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 09:06:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762420009; x=1793956009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i3D2gBal5+YbLDjTq5ytrhJTTHuFXbJwZnfo0rk6QCQ=;
  b=JjBRz+D//IUvaGF7ZZ6K4cVpuvHAlEEXh6YjrwdBVW5Ax2Bxpok7jiTq
   BeWocKcRHFfeZ1yoyuStCXMeg1w8fAyOhOmIaEe9yG5LWGt9MtPoZIDZp
   xU0kWmnreRm7XO3E4jI0V8NKDAhReTnHjiQyepFmNrzhHpRZqepLMlyv8
   /pRBaRUtqd19baaEkSMB4aaXQ0b9w40olhfkXO1nyyrNolHNJ46D05fz0
   /DZSr+2jFmCC/ndgQbORw59/VbwEpcsZyB+XjSmvCO9RuQ0xJSZlO2siw
   YgmAsLM2KaKF2PJmwqZwI5ReUctvlKosuY1kZT192D0CBbeU6rP3jcFoH
   w==;
X-CSE-ConnectionGUID: K+J97nU8SL2OAb1kKph/oQ==
X-CSE-MsgGUID: 6yPxn7EXT9aGyQvbBJ8iCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64458912"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64458912"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 01:06:47 -0800
X-CSE-ConnectionGUID: 2/NgE5SQQ6eOREXwCKlqMw==
X-CSE-MsgGUID: zC1S65aLSVeEoNWP8khe0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="218366584"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 06 Nov 2025 01:06:44 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGvx3-000Tha-2Z;
	Thu, 06 Nov 2025 09:06:41 +0000
Date: Thu, 6 Nov 2025 17:06:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 09/11] net: stmmac: ingenic: simplify x2000
 mac_set_mode()
Message-ID: <202511061640.PHWz6zWt-lkp@intel.com>
References: <E1vGdXJ-0000000CloA-3yVc@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vGdXJ-0000000CloA-3yVc@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_010648_628069_ADF2924D 
X-CRM114-Status: GOOD (  12.30  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-ingenic-move-ingenic_mac_init/20251106-015834
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vGdXJ-0000000CloA-3yVc%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 09/11] net: stmmac: ingenic: simplify x2000 mac_set_mode()
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251106/202511061640.PHWz6zWt-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061640.PHWz6zWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061640.PHWz6zWt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:128:13: warning: variable 'val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     128 |         } else if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:142:2: note: uninitialized use occurs here
     142 |         val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
         |         ^~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:128:9: note: remove the 'if' if its condition is always true
     128 |         } else if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:123:18: note: initialize the variable 'val' to silence this warning
     123 |         unsigned int val;
         |                         ^
         |                          = 0
   1 warning generated.


vim +128 drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c

   118	
   119	static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
   120				      u8 phy_intf_sel)
   121	{
   122		struct ingenic_mac *mac = plat_dat->bsp_priv;
   123		unsigned int val;
   124	
   125		if (phy_intf_sel == PHY_INTF_SEL_RMII) {
   126			val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
   127			      FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
 > 128		} else if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
   129			if (mac->tx_delay == 0)
   130				val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN);
   131			else
   132				val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_DELAY) |
   133				      FIELD_PREP(MACPHYC_TX_DELAY_MASK, (mac->tx_delay + 9750) / 19500 - 1);
   134	
   135			if (mac->rx_delay == 0)
   136				val |= FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
   137			else
   138				val |= FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_DELAY) |
   139					   FIELD_PREP(MACPHYC_RX_DELAY_MASK, (mac->rx_delay + 9750) / 19500 - 1);
   140		}
   141	
   142		val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
   143	
   144		/* Update MAC PHY control register */
   145		return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
   146	}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

