Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82ECD19519
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 20:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+K/xbK8iCbX5ltA974THT0jzaFVUWkAu7grUFTzLBhY=; b=q8k+dRxaHCmuUWFKRZL5ljazKy
	LYHqd01phII8jVC6Q82A0A03DhEXm11HEjTU2khoRK4UzNX+7MnyC1naMf2Hdj0dIoNG/e8djmJ9e
	hetUvpZa2kiwh0GLd3qNmWrBfG2wQ7okrW7HyRw34M9RVEDVBQR/LRtvR/Qscht3Pv8PFLTH9giAp
	bLChsaTbgH14paa/e37FVYPsZDy7iyFbCSmHBSa4k5rBfygOWQ8YfoR9dmQuXMF8aTacbCkirGmUU
	brHyKGgRkvMu6wjQp1YyPVuT9xbhj+Gw2mW2VWc0Dxpw/j2uaywhn4LOd7a8dw970N6tY8ZY3JOtM
	hrNqKlMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTJB-0000000DDCP-3IZY;
	Mon, 26 Jan 2026 20:35:37 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTJ9-0000000DDC1-12pO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 20:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769459735; x=1800995735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hv73xovg7rs+ED9F7z8l/VwWVkfiGm/GSqfIJQSKT6M=;
  b=ncCWfv2HigwMk/nUL28y1V+KsHC+ovQqQQ9JLeOsgWo0oCy3Y47cs+ox
   VudJ5lW/bFqL/xjGl/BwXUsKgm3mgtaRFEVqQMh7s0nkVIhWIXo1alOnK
   0B+pOOlohR/sWnjS9iVjzGxXVxb7MqPe26LUDARsQ826rMu2UXbLEcD9X
   VAx1VhZGBeYbs3lSx5X27WQ7sgt1jO4S7vMuNpd3R/RZYmfgKFf6mt5py
   eaXpDn+4Vr5BrB2WBa5wAcGzAyi0jbBhCQyOmUBxF4ZnXO2PtLSQRyI0r
   xRZGJMtwpXu7jwKdrVl75EpRWn3L4o0r3St60M6enZlwEgF83/6gW9ftC
   A==;
X-CSE-ConnectionGUID: zc0TYaKORsGYeuqHI6hekg==
X-CSE-MsgGUID: Py8LJniJRDCqJ/mfFXBWFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70549001"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70549001"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 12:35:33 -0800
X-CSE-ConnectionGUID: sagnajPzQ5CRUn3YbCDE2w==
X-CSE-MsgGUID: nd9RHMb/SPikWc1P17fuuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="208125486"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Jan 2026 12:35:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkTJ2-00000000XfO-2ljl;
	Mon, 26 Jan 2026 20:35:28 +0000
Date: Tue, 27 Jan 2026 04:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: report active PHY interface
Message-ID: <202601270450.IAoLETfq-lkp@intel.com>
References: <E1vkLXO-00000005uxQ-31ZV@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vkLXO-00000005uxQ-31ZV@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_123535_325689_0CC533AF 
X-CRM114-Status: GOOD (  10.63  )
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
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260127/202601270450.IAoLETfq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270450.IAoLETfq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270450.IAoLETfq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c:41:10: warning: 'PHY_INTF_RGMII' macro redefined [-Wmacro-redefined]
      41 | #define  PHY_INTF_RGMII                 FIELD_PREP(PHY_INTF_MASK, 1)
         |          ^
   drivers/net/ethernet/stmicro/stmmac/common.h:328:9: note: previous definition is here
     328 | #define PHY_INTF_RGMII          1
         |         ^
   1 warning generated.


vim +/PHY_INTF_RGMII +41 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c

33a1a01e3afa724 Jisheng Zhang 2024-11-03  18  
33a1a01e3afa724 Jisheng Zhang 2024-11-03  19  #define GMAC_CLK_EN			0x00
33a1a01e3afa724 Jisheng Zhang 2024-11-03  20  #define  GMAC_TX_CLK_EN			BIT(1)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  21  #define  GMAC_TX_CLK_N_EN		BIT(2)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  22  #define  GMAC_TX_CLK_OUT_EN		BIT(3)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  23  #define  GMAC_RX_CLK_EN			BIT(4)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  24  #define  GMAC_RX_CLK_N_EN		BIT(5)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  25  #define  GMAC_EPHY_REF_CLK_EN		BIT(6)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  26  #define GMAC_RXCLK_DELAY_CTRL		0x04
33a1a01e3afa724 Jisheng Zhang 2024-11-03  27  #define  GMAC_RXCLK_BYPASS		BIT(15)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  28  #define  GMAC_RXCLK_INVERT		BIT(14)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  29  #define  GMAC_RXCLK_DELAY		GENMASK(4, 0)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  30  #define GMAC_TXCLK_DELAY_CTRL		0x08
33a1a01e3afa724 Jisheng Zhang 2024-11-03  31  #define  GMAC_TXCLK_BYPASS		BIT(15)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  32  #define  GMAC_TXCLK_INVERT		BIT(14)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  33  #define  GMAC_TXCLK_DELAY		GENMASK(4, 0)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  34  #define GMAC_PLLCLK_DIV			0x0c
33a1a01e3afa724 Jisheng Zhang 2024-11-03  35  #define  GMAC_PLLCLK_DIV_EN		BIT(31)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  36  #define  GMAC_PLLCLK_DIV_NUM		GENMASK(7, 0)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  37  #define GMAC_GTXCLK_SEL			0x18
33a1a01e3afa724 Jisheng Zhang 2024-11-03  38  #define  GMAC_GTXCLK_SEL_PLL		BIT(0)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  39  #define GMAC_INTF_CTRL			0x1c
33a1a01e3afa724 Jisheng Zhang 2024-11-03  40  #define  PHY_INTF_MASK			BIT(0)
33a1a01e3afa724 Jisheng Zhang 2024-11-03 @41  #define  PHY_INTF_RGMII			FIELD_PREP(PHY_INTF_MASK, 1)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  42  #define  PHY_INTF_MII_GMII		FIELD_PREP(PHY_INTF_MASK, 0)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  43  #define GMAC_TXCLK_OEN			0x20
33a1a01e3afa724 Jisheng Zhang 2024-11-03  44  #define  TXCLK_DIR_MASK			BIT(0)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  45  #define  TXCLK_DIR_OUTPUT		FIELD_PREP(TXCLK_DIR_MASK, 0)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  46  #define  TXCLK_DIR_INPUT		FIELD_PREP(TXCLK_DIR_MASK, 1)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  47  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

