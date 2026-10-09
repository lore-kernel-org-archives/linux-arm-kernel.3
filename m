Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6E2CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5ex2CTazk1R8WRU+vAPezFi6q5J/LLagLSJRnuDRYc=; b=Lu+R/66F+xqNlH8lmi5X1JTqTp
	msblNZZo75quWHDkML55npdIrKF4hAMZrjItY1/V9+B3dGdfQItzSF2FAI8KG+HgF5QKYq92hso80
	tkITdTxndG74SQTgHd5WiVg4icge/DWninxM8dITb/wBjMJcTqdKvLfkn/kB5uel4Opuh6BdmZpr4
	33sSiAc45rIB5prNatjBfmB213ll0o7HT2X3edNdVXR9X/DtofVi4n6+P7Q0awG2yUepai1yRbyY5
	CBt6FGzacdEgdcd14W2bBccU0iCKwZd/gQpkFVJ5zB2Cy4pY1Pl3tG7PUi8VtVP+u8jGrIdFmW8eo
	okXqJ4ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4W1-00000005fNw-1lil;
	Fri, 09 Oct 2026 06:55:37 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4Vy-00000005fNB-1dds;
	Fri, 09 Oct 2026 06:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791528935; x=1823064935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wrScaiao8aM1Apd+iV68JuZ4Yqy23EAz4nsNGL9lvAI=;
  b=egx6/31iuRhu9/hotoGS/u8bNVVDe4RMtawNkZcdHsPdtSgqdK/j4a4N
   0B75L28LrsJs01MmsilTz8TYxHF1hbAnfrJTIR/WdB9oCEtjNGBSbT48R
   x2QjchYfA5zmtY7xW9jlZsAlwXJHGOQySVnsUi+PU71C1UFIAT65lNWBW
   a6zbhrCqaT4hMiqkbosd2vBPQaEVbWyEatdcZnXaTdQnF/VvkLeMMLm+v
   RCUY9NTsSikiVGEw+WcD7ynVziJ5Tzkuv+jRBciRthn0EjvBNb3+6S5K0
   61AQgGHWshFmgFiSfUSquyHN6gbWv5YiDial3H+Tq+24Pa+eF8s4jQd6G
   w==;
X-CSE-ConnectionGUID: R3na2nU5S9yFz/BxGKVp/g==
X-CSE-MsgGUID: 0yWyGoToRxmYnKpiIii8og==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="221162"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="221162"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 23:52:46 -0700
X-CSE-ConnectionGUID: FAEFGBrfTCyKDWwun4N1GQ==
X-CSE-MsgGUID: Ul4G+r1aS3qnZLOftFkeGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="334648"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Oct 2026 23:52:41 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF4T8-000000005QI-1e7X;
	Fri, 09 Oct 2026 06:52:38 +0000
Date: Fri, 9 Oct 2026 14:52:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jacky Chou <jacky_chou@aspeedtech.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jacky Chou <jacky_chou@aspeedtech.com>
Subject: Re: [PATCH 2/3] phy: aspeed: Add ASPEED PCIe PHY driver
Message-ID: <202610091411.PPpH2lr3-lkp@intel.com>
References: <20261008-aspeed_pcie_phy-v1-2-96764937aef0@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-aspeed_pcie_phy-v1-2-96764937aef0@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_235534_492211_7F395611 
X-CRM114-Status: GOOD (  11.80  )
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

Hi Jacky,

kernel test robot noticed the following build errors:

[auto build test ERROR on ea01f446f0682a5e7bd7a275889a890b7e0c6e02]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacky-Chou/dt-bindings-phy-aspeed-Add-ASPEED-PCIe-PHY/20261008-192819
base:   ea01f446f0682a5e7bd7a275889a890b7e0c6e02
patch link:    https://lore.kernel.org/r/20261008-aspeed_pcie_phy-v1-2-96764937aef0%40aspeedtech.com
patch subject: [PATCH 2/3] phy: aspeed: Add ASPEED PCIe PHY driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261009/202610091411.PPpH2lr3-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 242243a5814307de825db3428662d67b064e2cbc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091411.PPpH2lr3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091411.PPpH2lr3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/aspeed/phy-aspeed-pcie.c:73:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |         writel(PCIE_UNLOCK, pcie_phy->reg + PEHR_LOCK);
         |         ^
   drivers/phy/aspeed/phy-aspeed-pcie.c:94:3: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      94 |                 writel(AST2600_PORT_TYPE(0x3), pcie_phy->reg + PEHR_GLOBAL);
         |                 ^
   drivers/phy/aspeed/phy-aspeed-pcie.c:94:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      94 |                 writel(AST2600_PORT_TYPE(0x3), pcie_phy->reg + PEHR_GLOBAL);
         |                        ^
   drivers/phy/aspeed/phy-aspeed-pcie.c:16:32: note: expanded from macro 'AST2600_PORT_TYPE'
      16 | #define  AST2600_PORT_TYPE(x)           FIELD_PREP(AST2600_PORT_TYPE_MASK, x)
         |                                         ^
   drivers/phy/aspeed/phy-aspeed-pcie.c:135:3: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     135 |                 writel(0, pcie_phy->reg + PEHR_MISC_278);
         |                 ^
   drivers/phy/aspeed/phy-aspeed-pcie.c:137:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     137 |                 writel(POSTED_DATA_CREDITS(0xc0) | POSTED_HEADER_CREDITS(0xa),
         |                        ^
   drivers/phy/aspeed/phy-aspeed-pcie.c:29:34: note: expanded from macro 'POSTED_DATA_CREDITS'
      29 | #define  POSTED_DATA_CREDITS(x)         FIELD_PREP(GENMASK(15, 0), x)
         |                                         ^
>> drivers/phy/aspeed/phy-aspeed-pcie.c:143:13: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     143 |                 cfg_val = readl(pcie_phy->reg + PEHR_MISC_60);
         |                           ^
   drivers/phy/aspeed/phy-aspeed-pcie.c:144:3: error: call to undeclared function 'FIELD_MODIFY'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     144 |                 FIELD_MODIFY(AST2700_PORT_TYPE_MASK, &cfg_val,
         |                 ^
   7 errors generated.


vim +/writel +73 drivers/phy/aspeed/phy-aspeed-pcie.c

    63	
    64	static int ast2600_phy_init(struct phy *phy)
    65	{
    66		struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
    67		int ret;
    68	
    69		ret = clk_prepare_enable(pcie_phy->clk);
    70		if (ret)
    71			return ret;
    72	
  > 73		writel(PCIE_UNLOCK, pcie_phy->reg + PEHR_LOCK);
    74	
    75		return 0;
    76	}
    77	
    78	static int ast2600_phy_exit(struct phy *phy)
    79	{
    80		struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
    81	
    82		clk_disable_unprepare(pcie_phy->clk);
    83	
    84		return 0;
    85	}
    86	
    87	static int ast2600_phy_set_mode(struct phy *phy, enum phy_mode mode,
    88					int submode)
    89	{
    90		struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
    91	
    92		switch (submode) {
    93		case PHY_MODE_PCIE_RC:
    94			writel(AST2600_PORT_TYPE(0x3), pcie_phy->reg + PEHR_GLOBAL);
    95			break;
    96		default:
    97			dev_err(&phy->dev, "Unsupported submode %d\n", submode);
    98			return -EINVAL;
    99		}
   100	
   101		return 0;
   102	}
   103	
   104	static const struct phy_ops ast2600_phy_ops = {
   105		.init		= ast2600_phy_init,
   106		.exit		= ast2600_phy_exit,
   107		.set_mode	= ast2600_phy_set_mode,
   108		.owner		= THIS_MODULE,
   109	};
   110	
   111	static int ast2700_phy_init(struct phy *phy)
   112	{
   113		struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
   114	
   115		return clk_prepare_enable(pcie_phy->clk);
   116	}
   117	
   118	static int ast2700_phy_exit(struct phy *phy)
   119	{
   120		struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
   121	
   122		clk_disable_unprepare(pcie_phy->clk);
   123	
   124		return 0;
   125	}
   126	
   127	static int ast2700_phy_set_mode(struct phy *phy, enum phy_mode mode,
   128					int submode)
   129	{
   130		struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
   131		u32 cfg_val;
   132	
   133		switch (submode) {
   134		case PHY_MODE_PCIE_RC:
   135			writel(0, pcie_phy->reg + PEHR_MISC_278);
   136			writel(SEL_INTERNAL_RESET, pcie_phy->reg + PEHR_MISC_280);
   137			writel(POSTED_DATA_CREDITS(0xc0) | POSTED_HEADER_CREDITS(0xa),
   138			       pcie_phy->reg + PEHR_MISC_70);
   139			writel(COMPLETION_DATA_CREDITS(0x30) | COMPLETION_HEADER_CREDITS(0x8),
   140			       pcie_phy->reg + PEHR_MISC_78);
   141			writel(LOCAL_SCALE_SUP, pcie_phy->reg + PEHR_MISC_58);
   142			writel(CONFIG_RC_DEVICE, pcie_phy->reg + PEHR_MISC_5C);
 > 143			cfg_val = readl(pcie_phy->reg + PEHR_MISC_60);
   144			FIELD_MODIFY(AST2700_PORT_TYPE_MASK, &cfg_val,
   145				     PORT_TYPE_ROOT);
   146			writel(cfg_val, pcie_phy->reg + PEHR_MISC_60);
   147			writel(ASSERT_INTERNAL_RESET | SET_TO_DOWNSTREAM,
   148			       pcie_phy->reg + PEHR_MISC_278);
   149			break;
   150		default:
   151			dev_err(&phy->dev, "Unsupported submode %d\n", submode);
   152			return -EINVAL;
   153		}
   154	
   155		return 0;
   156	}
   157	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

