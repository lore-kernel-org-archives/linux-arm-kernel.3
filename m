Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A0ECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 03:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEwtHmSL5BtzTNQnc9ruHdxSVG+6ysWNVzNzRsLAtuM=; b=yPxh6+9HvYRn9QZ6LZH2FYPXz7
	SY+R2ZY+MbSY26pIgSp+YsgZSDaI56MsS/bEdEmhj5ZhF51gypNg3wSPhhgROFsX65IYsA6EhM0mX
	AqTwJ5zwzysrwZcgBZuhUdudAM/+3/AQaQ59CcEnY+IdtMhyg/zuHyKSwiB22Tpneqyrt3DF40vRA
	ys+OEtUpWLGa8xWvklqYw6/e9cXFk3FTGeBIDzQebGI5cumkFE98vPk96SJjS5ok/gCfv7v5wdlii
	yO9Oer8FfLIvOHMeh5BUDdLgNPT3fV57adUrE6F1Isy8G7JLh17rw1eMrQn3VlvKxM2o60yGX3NeB
	dTiE6K1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7Rm-0000000B1yF-39z5;
	Tue, 04 Nov 2025 03:11:02 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7Rk-0000000B1xu-0dpE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 03:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762225860; x=1793761860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nasp7obvVZx/zW5fYzUXJMKnK906v8ptyaXO0ca9Boo=;
  b=cjKAkPh7BIiX9ns9MzFUPCuC4ii88kXAfEsy5Nm4fw0IWL2it7LcoSf/
   W7Y3E/K8HaHFT2gIsUbXjzyhU8ar0aUw0sVsXJ815l2PW1Sa0I2uxEIqJ
   4eJn/DPzGoozXPtmKWOpg+CtoflpHtxFnNPB3bYz/4d5w64l+czIwk8pE
   C/TxaZyeL8DXaS758I2pm49dezHSq+sMqvZjb53o98lWItfqWDhpKiAAs
   SihNXRsRIsCAHyb7NFtDow8mg39bTLOx/q3eHlcLmzgWflM4CL8G4fQHB
   UOj5u9KW4nMMXJuS8t/g4Vrf0PrzE3DGJqPSmDLFwajiooUxPQXoalx3H
   A==;
X-CSE-ConnectionGUID: wTr8QrBJTymTI/QyqdLkcQ==
X-CSE-MsgGUID: YyI8NuWfSi2Nkuv4glqLDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64230027"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="64230027"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 19:10:58 -0800
X-CSE-ConnectionGUID: Klu5rGQySFOcoXjRl282jw==
X-CSE-MsgGUID: oH3aw8ubRJiFJiwtRMte1w==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Nov 2025 19:10:53 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG7RZ-000QnM-34;
	Tue, 04 Nov 2025 03:10:50 +0000
Date: Tue, 4 Nov 2025 11:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jacky Chou <jacky_chou@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, taoren@meta.com,
	Jacky Chou <jacky_chou@aspeedtech.com>
Subject: Re: [PATCH net-next v3 4/4] net: ftgmac100: Add RGMII delay support
 for AST2600
Message-ID: <202511041023.QGAHaAZ3-lkp@intel.com>
References: <20251103-rgmii_delay_2600-v3-4-e2af2656f7d7@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103-rgmii_delay_2600-v3-4-e2af2656f7d7@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_191100_210036_CF5B822D 
X-CRM114-Status: GOOD (  14.96  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 01cc760632b875c4ad0d8fec0b0c01896b8a36d4]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacky-Chou/dt-bindings-net-ftgmac100-Add-delay-properties-for-AST2600/20251103-154258
base:   01cc760632b875c4ad0d8fec0b0c01896b8a36d4
patch link:    https://lore.kernel.org/r/20251103-rgmii_delay_2600-v3-4-e2af2656f7d7%40aspeedtech.com
patch subject: [PATCH net-next v3 4/4] net: ftgmac100: Add RGMII delay support for AST2600
config: arm-defconfig (https://download.01.org/0day-ci/archive/20251104/202511041023.QGAHaAZ3-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041023.QGAHaAZ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041023.QGAHaAZ3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/faraday/ftgmac100.c:1865:13: warning: variable 'rgmii_delay_unit' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1865 |         } else if (of_device_is_compatible(np, "aspeed,ast2600-mac23")) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/faraday/ftgmac100.c:1870:53: note: uninitialized use occurs here
    1870 |         rgmii_tx_delay = DIV_ROUND_CLOSEST(rgmii_tx_delay, rgmii_delay_unit);
         |                                                            ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/faraday/ftgmac100.c:1865:9: note: remove the 'if' if its condition is always true
    1865 |         } else if (of_device_is_compatible(np, "aspeed,ast2600-mac23")) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/faraday/ftgmac100.c:1844:22: note: initialize the variable 'rgmii_delay_unit' to silence this warning
    1844 |         u32 rgmii_delay_unit;
         |                             ^
         |                              = 0
   1 warning generated.


vim +1865 drivers/net/ethernet/faraday/ftgmac100.c

  1838	
  1839	static int ftgmac100_set_ast2600_rgmii_delay(struct platform_device *pdev,
  1840						     u32 rgmii_tx_delay,
  1841						     u32 rgmii_rx_delay)
  1842	{
  1843		struct device_node *np = pdev->dev.of_node;
  1844		u32 rgmii_delay_unit;
  1845		struct regmap *scu;
  1846		int dly_mask;
  1847		int dly_reg;
  1848		int id;
  1849	
  1850		scu = syscon_regmap_lookup_by_phandle(np, "scu");
  1851		if (IS_ERR(scu)) {
  1852			dev_err(&pdev->dev, "failed to get scu");
  1853			return PTR_ERR(scu);
  1854		}
  1855	
  1856		id = of_alias_get_id(np, "ethernet");
  1857		if (id < 0 || id > 3) {
  1858			dev_err(&pdev->dev, "get wrong alise id %d\n", id);
  1859			return -EINVAL;
  1860		}
  1861	
  1862		if (of_device_is_compatible(np, "aspeed,ast2600-mac01")) {
  1863			dly_reg = AST2600_MAC01_CLK_DLY;
  1864			rgmii_delay_unit = AST2600_MAC01_CLK_DLY_UNIT;
> 1865		} else if (of_device_is_compatible(np, "aspeed,ast2600-mac23")) {
  1866			dly_reg = AST2600_MAC23_CLK_DLY;
  1867			rgmii_delay_unit = AST2600_MAC23_CLK_DLY_UNIT;
  1868		}
  1869	
  1870		rgmii_tx_delay = DIV_ROUND_CLOSEST(rgmii_tx_delay, rgmii_delay_unit);
  1871		if (rgmii_tx_delay >= 32) {
  1872			dev_err(&pdev->dev,
  1873				"The index %u of TX delay setting is out of range\n",
  1874				rgmii_tx_delay);
  1875			return -EINVAL;
  1876		}
  1877	
  1878		rgmii_rx_delay = DIV_ROUND_CLOSEST(rgmii_rx_delay, rgmii_delay_unit);
  1879		if (rgmii_rx_delay >= 32) {
  1880			dev_err(&pdev->dev,
  1881				"The index %u of RX delay setting is out of range\n",
  1882				rgmii_rx_delay);
  1883			return -EINVAL;
  1884		}
  1885	
  1886		/* Due to the hardware design reason, for MAC23 on AST2600, the zero
  1887		 * delay ns on RX is configured by setting value 0x1a.
  1888		 * List as below:
  1889		 * 0x1a -> 0   ns, 0x1b -> 0.25 ns, ... , 0x1f -> 1.25 ns,
  1890		 * 0x00 -> 1.5 ns, 0x01 -> 1.75 ns, ... , 0x19 -> 7.75 ns, 0x1a -> 0 ns
  1891		 */
  1892		if (of_device_is_compatible(np, "aspeed,ast2600-mac23"))
  1893			rgmii_rx_delay = (AST2600_MAC23_RX_DLY_0_NS + rgmii_rx_delay) &
  1894					 AST2600_MAC_TX_RX_DLY_MASK;
  1895	
  1896		if (id == 0 || id == 2) {
  1897			dly_mask = ASPEED_MAC0_2_TX_DLY | ASPEED_MAC0_2_RX_DLY;
  1898			rgmii_tx_delay = FIELD_PREP(ASPEED_MAC0_2_TX_DLY, rgmii_tx_delay);
  1899			rgmii_rx_delay = FIELD_PREP(ASPEED_MAC0_2_RX_DLY, rgmii_rx_delay);
  1900		} else {
  1901			dly_mask = ASPEED_MAC1_3_TX_DLY | ASPEED_MAC1_3_RX_DLY;
  1902			rgmii_tx_delay = FIELD_PREP(ASPEED_MAC1_3_TX_DLY, rgmii_tx_delay);
  1903			rgmii_rx_delay = FIELD_PREP(ASPEED_MAC1_3_RX_DLY, rgmii_rx_delay);
  1904		}
  1905	
  1906		regmap_update_bits(scu, dly_reg, dly_mask, rgmii_tx_delay | rgmii_rx_delay);
  1907	
  1908		return 0;
  1909	}
  1910	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

