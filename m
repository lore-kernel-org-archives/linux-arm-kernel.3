Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E016CA6016
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 21:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gwI1dcyam2yk5wsB6eHTvF/ZEiZ3eztVF1fLP049Xs=; b=SpIyyoyllmJYjggnQO901M3FEy
	uTsstG4eJXwjOQGt/F7w0YMvFjFKdGluZt6ZA9dNNvEvCEidxbKK7FL5dkLr8GEMYVqVusl90eWUU
	+8y5fPWC9xTICDzORtYc4iG4Vgv1FLN4DqmF7rZ2keh2clU35khuaB793XyyyT0Lm2KzRTo0r58G9
	LvQzE/1Lmw8lkInfLknXr29Lf247QtU9ps2d49TwxoTxkerGm0ku50uaYLFctRfC935dBAIeXdEA1
	tZgOC8TaSvTG3VGKDmCMAJwBdIqr2AmvQOQlroWDlWw5FfbdJbW4a8NSg6c77WNNIbobTG633fT/4
	Wej+do4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEvr1-000000055s9-1FtS;
	Thu, 08 Oct 2026 21:40:43 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEvqw-000000055rK-1CUa;
	Thu, 08 Oct 2026 21:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791495638; x=1823031638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FonD0lPwatSwc9CLF+o0pnMjNadWk+XyTpxVZVqKIGE=;
  b=R1Pl+eUdAAsiLmhkT4CcHlyJcBtoFOhpnFb1AR2qVweEcRMf839wEujN
   vg3v3AbjUa0mKrUFfSpeHnojB8NY1fZzzHvT8xth8zn5jDHdPKRSg7jLJ
   dI22AEx/pC9RI0Z6brXn6NyksTze1PzJrkKg8wNgYeLCPpXBz/XuGYWJd
   BcP39bRmcyoAfNasTfaJaXFcpNkcbnlQnbkU4Km3XOqCtjSxabZEQbrsm
   ibiV/qAabZz7K/bPxwf+hPO2Bj/JBzK2s6JQMDvsktyjTzkPqbXSAQUsD
   P6AClyglC9nQyUHB7ho0k+UHOk/Z6eXuE89QlK5KoYiRe7aY4NZzCRSg6
   A==;
X-CSE-ConnectionGUID: s8ZrwzEySf6ShAs0UecnZQ==
X-CSE-MsgGUID: 1o7rcKVORYuesR6dbqlspg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="194299"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="194299"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 14:40:35 -0700
X-CSE-ConnectionGUID: xGEQVSFmQsOKbtW/QJ+sDQ==
X-CSE-MsgGUID: ozfbqNP5R/C4UprFnJ9UQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="1959551"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 08 Oct 2026 14:40:32 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEvqm-000000004vU-2wDG;
	Thu, 08 Oct 2026 21:40:28 +0000
Date: Fri, 9 Oct 2026 05:40:18 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jacky Chou <jacky_chou@aspeedtech.com>
Subject: Re: [PATCH 2/3] phy: aspeed: Add ASPEED PCIe PHY driver
Message-ID: <202610090555.gWYlVYEL-lkp@intel.com>
References: <20261008-aspeed_pcie_phy-v1-2-96764937aef0@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-aspeed_pcie_phy-v1-2-96764937aef0@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_144039_946999_6CB13B20 
X-CRM114-Status: GOOD (  12.60  )
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
config: csky-randconfig-1000-20261009 (https://download.01.org/0day-ci/archive/20261009/202610090555.gWYlVYEL-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610090555.gWYlVYEL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610090555.gWYlVYEL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io.h:12,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/csky/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from include/linux/cgroup.h:27,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/phy/phy.h:17,
                    from drivers/phy/aspeed/phy-aspeed-pcie.c:11:
   drivers/phy/aspeed/phy-aspeed-pcie.c: In function 'ast2600_phy_set_mode':
>> drivers/phy/aspeed/phy-aspeed-pcie.c:16:41: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      16 | #define  AST2600_PORT_TYPE(x)           FIELD_PREP(AST2600_PORT_TYPE_MASK, x)
         |                                         ^~~~~~~~~~
   arch/csky/include/asm/io.h:31:59: note: in definition of macro 'writel'
      31 | #define writel(v,c)             ({ wmb(); writel_relaxed((v),(c)); mb(); })
         |                                                           ^
   drivers/phy/aspeed/phy-aspeed-pcie.c:94:24: note: in expansion of macro 'AST2600_PORT_TYPE'
      94 |                 writel(AST2600_PORT_TYPE(0x3), pcie_phy->reg + PEHR_GLOBAL);
         |                        ^~~~~~~~~~~~~~~~~
   drivers/phy/aspeed/phy-aspeed-pcie.c: In function 'ast2700_phy_set_mode':
>> drivers/phy/aspeed/phy-aspeed-pcie.c:144:17: error: implicit declaration of function 'FIELD_MODIFY' [-Wimplicit-function-declaration]
     144 |                 FIELD_MODIFY(AST2700_PORT_TYPE_MASK, &cfg_val,
         |                 ^~~~~~~~~~~~


vim +/FIELD_PREP +16 drivers/phy/aspeed/phy-aspeed-pcie.c

    12	
    13	/* AST2600 PCIe Host Controller Registers */
    14	#define PEHR_GLOBAL		0x30
    15	#define  AST2600_PORT_TYPE_MASK		GENMASK(5, 4)
  > 16	#define  AST2600_PORT_TYPE(x)		FIELD_PREP(AST2600_PORT_TYPE_MASK, x)
    17	#define PEHR_LOCK		0x7c
    18	#define  PCIE_UNLOCK			0xa8
    19	
    20	/* AST2700 PEHR */
    21	#define PEHR_MISC_58		0x58
    22	#define  LOCAL_SCALE_SUP		BIT(0)
    23	#define PEHR_MISC_5C		0x5c
    24	#define  CONFIG_RC_DEVICE		BIT(30)
    25	#define PEHR_MISC_60		0x60
    26	#define  AST2700_PORT_TYPE_MASK		GENMASK(7, 4)
    27	#define  PORT_TYPE_ROOT			0x4
    28	#define PEHR_MISC_70		0x70
    29	#define  POSTED_DATA_CREDITS(x)		FIELD_PREP(GENMASK(15, 0), x)
    30	#define  POSTED_HEADER_CREDITS(x)	FIELD_PREP(GENMASK(27, 16), x)
    31	#define PEHR_MISC_78		0x78
    32	#define  COMPLETION_DATA_CREDITS(x)	FIELD_PREP(GENMASK(15, 0), x)
    33	#define  COMPLETION_HEADER_CREDITS(x)	FIELD_PREP(GENMASK(27, 16), x)
    34	#define PEHR_MISC_278		0x278
    35	#define  SET_TO_DOWNSTREAM		BIT(22)
    36	#define  ASSERT_INTERNAL_RESET		BIT(31)
    37	#define PEHR_MISC_280		0x280
    38	#define  SEL_INTERNAL_RESET		BIT(0)
    39	
    40	/**
    41	 * struct aspeed_pcie_phy - PCIe PHY information
    42	 * @dev: pointer to device structure
    43	 * @reg: PCIe host register base address
    44	 * @clk: PCIe reference clock
    45	 * @phy: pointer to PHY structure
    46	 * @platform: platform specific information
    47	 */
    48	struct aspeed_pcie_phy {
    49		struct device *dev;
    50		void __iomem *reg;
    51		struct clk *clk;
    52		struct phy *phy;
    53		const struct aspeed_pcie_phy_platform *platform;
    54	};
    55	
    56	/**
    57	 * struct aspeed_pcie_phy_platform - Platform information
    58	 * @phy_ops: phy operations
    59	 */
    60	struct aspeed_pcie_phy_platform {
    61		const struct phy_ops *phy_ops;
    62	};
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
    73		writel(PCIE_UNLOCK, pcie_phy->reg + PEHR_LOCK);
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
   143			cfg_val = readl(pcie_phy->reg + PEHR_MISC_60);
 > 144			FIELD_MODIFY(AST2700_PORT_TYPE_MASK, &cfg_val,
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

