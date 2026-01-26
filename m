Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B03D1950F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 19:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djAyQ8We47EShoelhYDOf7jvq3cP3A1rbA+yGsHtjpA=; b=dT3et3aLtJWdQdoeMGil14PCwz
	ia71dvM/P0CEE8/MdMDhoIsPWRQhAd05USyCAjgOBuItaFahpEIHZ6mW6yPhN9kg5Ra+2hCqFxTmI
	Rck+m/vFD0CRcFdfLeqLMLsiIzf5T4wM0nuq4VsE82/riB1u5I4ZAJ5wnCfZgFiaunvUy4FxIZr/I
	ddsljdFTsC9H0mRGd4paH5PHwjvTvjzwluNl4DP4sVCVtALhwqKvegUL5EQOqKosHP4O6ewamX97c
	G2S8Mpe8cXVAdE6i1gswWGjLcQ3A8suv/u96uuZJYl/4VWwiiMNynKUWhTa6FSXXlLmkNEXKRG8Ud
	8EXPqX8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRys-0000000D7nb-1kvu;
	Mon, 26 Jan 2026 19:10:34 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRyq-0000000D7n7-0tNa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 19:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769454632; x=1800990632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y8WZa5lTxZhinaJ1vI22gqo62u2Mkl4bP9hj4eR0CVE=;
  b=LqF7Z5BvMMGOM+/jX1yltktvFU+oenoLVU6IiLTHjPsMC2CMIiYqTOET
   8KCqqpv/JSz8VrGWSum9dwAiTSJdcV7L4TZdEFH9tOn7XFst2jvH+uOe+
   cyGx1zKwzUBqCiTabAR3cQaxQUoReV92/iTBRGHcvZ6Scl97dZyp5Odci
   LfmP1dkZQsxpO9wC58TfSy8a4myCOSastL4LlyWYInjQjpJ/TKB5mY95U
   I5uRfqsiGrB6B+rqKHfKBrs+aC74rU3NlgxIKp91X8b+J+QDlsjsZGPMd
   M2YWuTzlD5a/rOS+E+4ImnYojxMDuhnAHHiohJtTRUNkGy8UiyXELDk85
   w==;
X-CSE-ConnectionGUID: 7gGqPYdPQw2k8eisPV4fzA==
X-CSE-MsgGUID: 2mmisoPFTEuhq63RsEz/rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="58212098"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="58212098"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 11:10:29 -0800
X-CSE-ConnectionGUID: JQZN/nleR1mKrX8NgdsnHw==
X-CSE-MsgGUID: 9Fr2sKWUTraXYXXumoWrtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="212217771"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jan 2026 11:10:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkRyh-00000000Xbu-3oiy;
	Mon, 26 Jan 2026 19:10:23 +0000
Date: Tue, 27 Jan 2026 03:09:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: report active PHY interface
Message-ID: <202601270336.BzkH3lDa-lkp@intel.com>
References: <E1vkLXO-00000005uxQ-31ZV@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vkLXO-00000005uxQ-31ZV@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_111032_295356_4670532D 
X-CRM114-Status: GOOD (  11.61  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-report-active-PHY-interface/20260126-201908
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vkLXO-00000005uxQ-31ZV%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next] net: stmmac: report active PHY interface
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260127/202601270336.BzkH3lDa-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270336.BzkH3lDa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270336.BzkH3lDa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c:41:10: warning: 'PHY_INTF_RGMII' redefined
      41 | #define  PHY_INTF_RGMII                 FIELD_PREP(PHY_INTF_MASK, 1)
         |          ^~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/stmicro/stmmac/stmmac.h:20,
                    from drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h:12,
                    from drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c:17:
   drivers/net/ethernet/stmicro/stmmac/common.h:328:9: note: this is the location of the previous definition
     328 | #define PHY_INTF_RGMII          1
         |         ^~~~~~~~~~~~~~


vim +/PHY_INTF_RGMII +41 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c

33a1a01e3afa72 Jisheng Zhang 2024-11-03  18  
33a1a01e3afa72 Jisheng Zhang 2024-11-03  19  #define GMAC_CLK_EN			0x00
33a1a01e3afa72 Jisheng Zhang 2024-11-03  20  #define  GMAC_TX_CLK_EN			BIT(1)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  21  #define  GMAC_TX_CLK_N_EN		BIT(2)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  22  #define  GMAC_TX_CLK_OUT_EN		BIT(3)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  23  #define  GMAC_RX_CLK_EN			BIT(4)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  24  #define  GMAC_RX_CLK_N_EN		BIT(5)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  25  #define  GMAC_EPHY_REF_CLK_EN		BIT(6)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  26  #define GMAC_RXCLK_DELAY_CTRL		0x04
33a1a01e3afa72 Jisheng Zhang 2024-11-03  27  #define  GMAC_RXCLK_BYPASS		BIT(15)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  28  #define  GMAC_RXCLK_INVERT		BIT(14)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  29  #define  GMAC_RXCLK_DELAY		GENMASK(4, 0)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  30  #define GMAC_TXCLK_DELAY_CTRL		0x08
33a1a01e3afa72 Jisheng Zhang 2024-11-03  31  #define  GMAC_TXCLK_BYPASS		BIT(15)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  32  #define  GMAC_TXCLK_INVERT		BIT(14)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  33  #define  GMAC_TXCLK_DELAY		GENMASK(4, 0)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  34  #define GMAC_PLLCLK_DIV			0x0c
33a1a01e3afa72 Jisheng Zhang 2024-11-03  35  #define  GMAC_PLLCLK_DIV_EN		BIT(31)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  36  #define  GMAC_PLLCLK_DIV_NUM		GENMASK(7, 0)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  37  #define GMAC_GTXCLK_SEL			0x18
33a1a01e3afa72 Jisheng Zhang 2024-11-03  38  #define  GMAC_GTXCLK_SEL_PLL		BIT(0)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  39  #define GMAC_INTF_CTRL			0x1c
33a1a01e3afa72 Jisheng Zhang 2024-11-03  40  #define  PHY_INTF_MASK			BIT(0)
33a1a01e3afa72 Jisheng Zhang 2024-11-03 @41  #define  PHY_INTF_RGMII			FIELD_PREP(PHY_INTF_MASK, 1)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  42  #define  PHY_INTF_MII_GMII		FIELD_PREP(PHY_INTF_MASK, 0)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  43  #define GMAC_TXCLK_OEN			0x20
33a1a01e3afa72 Jisheng Zhang 2024-11-03  44  #define  TXCLK_DIR_MASK			BIT(0)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  45  #define  TXCLK_DIR_OUTPUT		FIELD_PREP(TXCLK_DIR_MASK, 0)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  46  #define  TXCLK_DIR_INPUT		FIELD_PREP(TXCLK_DIR_MASK, 1)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  47  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

