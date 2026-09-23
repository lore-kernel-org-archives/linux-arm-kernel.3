Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F48AC98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 19:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuH/MLAZmcfHHtkzgNiL9wtNXyBut6Ax089eua6Di0g=; b=Sc82F5C1hxseany0RKS/yNfwEo
	LP/Gd4VPlfjOHSEJWeLsvroHnYBGYuFrk5KMkU561ayGW7RvqSzb0hwdXqcLeaTAnQta6i+baZuhM
	GrKqcAgghDjW4WRu4GWGpKJYgPqOqnz9Tbyo14azwp08D7oB3tZCdDWrfU8MPHpw1xc+7WSq4VY72
	wPkr0LJQeIUZhsOpWV2JkQ3a3Hz12ZWyxlgfkL8ryBvxmQsVCXou24qsy45YguP3z2KKCGFTMsW1r
	0gDP6ppSaA6AoIYryCyJsSQDoJuB3SAXog8r35opOe8P6p2pflW2DupYk+QrEkBZtXZHKzxt2yw65
	EczNkmDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9SYX-00000009Job-1kwn;
	Wed, 23 Sep 2026 19:23:01 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9SYS-00000009Jns-2tjZ;
	Wed, 23 Sep 2026 19:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790191376; x=1821727376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F8HR+tNPShG3HJOrfA/Cf+6loumebKWu/Yq0oyHeBHk=;
  b=evBCHtk65UTGgsRPc/rnoXCTs/ia5HZTEUg0WXGFivKvNsuUJqhue6Ox
   /AxT7QFiXWIMsNm9MJxuPMSCRsY2UOvcgeYv0pEHQfS0fnCmE4zKny20H
   MsxrQcOBrZxcXynDmUZwz9N2fQRjK/wl1deATTXcup+4l5Hvjdbf9Xelg
   fqT02u4Bm9512pjMHFKdaO2tkxJ//HfKIPOFusdyDMRebyO7IpC+T7kYA
   LquG9W99zJc6Bg1XOmh62iAlKKHT/UZTIdMC3+0X4reE2w08M7PEMRDYw
   w/Xq153iaCVjslrpRVyQVU5sgivRudvod2r12qic4mT2V5BbjIhNOLD+1
   g==;
X-CSE-ConnectionGUID: eQ3qeWX4QD2eUgOQY6qu8g==
X-CSE-MsgGUID: 4kvithxgQ4uG8waEolZv7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="94743775"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="94743775"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 12:22:54 -0700
X-CSE-ConnectionGUID: vojxitKfRJ6ARiM2ehI79w==
X-CSE-MsgGUID: BArZV53CQUKGHTBGi1IVMA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2026 12:22:52 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9SYL-000000000mt-3BSq;
	Wed, 23 Sep 2026 19:22:49 +0000
Date: Wed, 23 Sep 2026 21:22:36 +0200
From: kernel test robot <lkp@intel.com>
To: Coia Prant <coiaprant@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: Re: [PATCH net] net: ethernet: stmmac: dwmac-rk: fix bulk clock leak
 when the PHY clock fails
Message-ID: <202609232146.QdgAwbzd-lkp@intel.com>
References: <20260919174223.2356964-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919174223.2356964-1-coiaprant@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_122256_832681_619BBD6C 
X-CRM114-Status: UNSURE (   9.87  )
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

Hi Coia,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Coia-Prant/net-ethernet-stmmac-dwmac-rk-fix-bulk-clock-leak-when-the-PHY-clock-fails/20260920-014223
base:   net/main
patch link:    https://lore.kernel.org/r/20260919174223.2356964-1-coiaprant%40gmail.com
patch subject: [PATCH net] net: ethernet: stmmac: dwmac-rk: fix bulk clock leak when the PHY clock fails
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260923/202609232146.QdgAwbzd-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609232146.QdgAwbzd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609232146.QdgAwbzd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:1168:5: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
    1168 |                                 return ret;
         |                                 ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:1165:4: note: previous statement is here
    1165 |                         if (ret)
         |                         ^
>> drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:1177:2: warning: non-void function does not return a value in all control paths [-Wreturn-type]
    1177 |         } else {
         |         ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:1177:4: error: expected identifier or '('
    1177 |         } else {
         |           ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:1189:2: error: expected identifier or '('
    1189 |         return 0;
         |         ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:1190:1: error: extraneous closing brace ('}')
    1190 | }
         | ^
   2 warnings and 3 errors generated.


vim +1177 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

7ad269ea1a2b7d Roger Chen            2014-12-29  1152  
7ad269ea1a2b7d Roger Chen            2014-12-29  1153  static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
7ad269ea1a2b7d Roger Chen            2014-12-29  1154  {
ea449f7fa0bf3f Sebastian Reichel     2023-04-07  1155  	int ret;
7ad269ea1a2b7d Roger Chen            2014-12-29  1156  
7ad269ea1a2b7d Roger Chen            2014-12-29  1157  	if (enable) {
7ad269ea1a2b7d Roger Chen            2014-12-29  1158  		if (!bsp_priv->clk_enabled) {
ea449f7fa0bf3f Sebastian Reichel     2023-04-07  1159  			ret = clk_bulk_prepare_enable(bsp_priv->num_clks,
ea449f7fa0bf3f Sebastian Reichel     2023-04-07  1160  						      bsp_priv->clks);
ea449f7fa0bf3f Sebastian Reichel     2023-04-07  1161  			if (ret)
ea449f7fa0bf3f Sebastian Reichel     2023-04-07  1162  				return ret;
7ad269ea1a2b7d Roger Chen            2014-12-29  1163  
ea449f7fa0bf3f Sebastian Reichel     2023-04-07  1164  			ret = clk_prepare_enable(bsp_priv->clk_phy);
ea449f7fa0bf3f Sebastian Reichel     2023-04-07  1165  			if (ret)
cb278e6780d874 Coia Prant            2026-09-20  1166  				clk_bulk_disable_unprepare(bsp_priv->num_clks,
cb278e6780d874 Coia Prant            2026-09-20  1167  							   bsp_priv->clks);
ea449f7fa0bf3f Sebastian Reichel     2023-04-07  1168  				return ret;
cb278e6780d874 Coia Prant            2026-09-20  1169  			}
23c94d63a7e395 David Wu              2018-06-28  1170  
5c1fc7cb81dfed Russell King (Oracle  2026-02-04  1171) 			rk_configure_io_clksel(bsp_priv);
5c1fc7cb81dfed Russell King (Oracle  2026-02-04  1172) 			rk_ungate_rmii_clock(bsp_priv);
2f2b60a0ec2826 David Wu              2022-08-30  1173  
7ad269ea1a2b7d Roger Chen            2014-12-29  1174  			mdelay(5);
7ad269ea1a2b7d Roger Chen            2014-12-29  1175  			bsp_priv->clk_enabled = true;
7ad269ea1a2b7d Roger Chen            2014-12-29  1176  		}
7ad269ea1a2b7d Roger Chen            2014-12-29 @1177  	} else {
7ad269ea1a2b7d Roger Chen            2014-12-29  1178  		if (bsp_priv->clk_enabled) {
5c1fc7cb81dfed Russell King (Oracle  2026-02-04  1179) 			rk_gate_rmii_clock(bsp_priv);
7f864458e9a6d2 Sebastian Reichel     2025-10-14  1180  
ea449f7fa0bf3f Sebastian Reichel     2023-04-07  1181  			clk_bulk_disable_unprepare(bsp_priv->num_clks,
ea449f7fa0bf3f Sebastian Reichel     2023-04-07  1182  						   bsp_priv->clks);
fecd4d7eef8b21 David Wu              2017-08-10  1183  			clk_disable_unprepare(bsp_priv->clk_phy);
fecd4d7eef8b21 David Wu              2017-08-10  1184  
7ad269ea1a2b7d Roger Chen            2014-12-29  1185  			bsp_priv->clk_enabled = false;
7ad269ea1a2b7d Roger Chen            2014-12-29  1186  		}
7ad269ea1a2b7d Roger Chen            2014-12-29  1187  	}
7ad269ea1a2b7d Roger Chen            2014-12-29  1188  
7ad269ea1a2b7d Roger Chen            2014-12-29  1189  	return 0;
7ad269ea1a2b7d Roger Chen            2014-12-29  1190  }
7ad269ea1a2b7d Roger Chen            2014-12-29  1191  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

