Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07FCCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 21:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECQO3z4tyFed5uL61M19jqo6v+bOIZFfTwy/er2eyVs=; b=R86QkbF4ktb1Zeb2+qDFGPgAiS
	0RssBLdnnkZ7k9IQHrbRWkeV2LsE0u9g8PHWBJ7mmB0OdnK/SJIPzk05PEYh4a28mEl1GB8SYyvh4
	LUlxOS3kdu2JnjoxJnLDWbP9WxsHo/J90/uaImLxnCJSVy+n5syqd9DmdexafPe+1DXULYcUekDRN
	Drq6fRZDPRnolQyxozDPLefLYnk+hxCQ5AY1jwyMAp8rPzk6CX/L/pLtCSsQ00v/9Kt4EzfbbFM0i
	eWLNAOpxHugX8R5HPRMwqs7X9zyqG/uxC4KeSoc7SMPXxrUP6bY1yTJZcsY1ylOaU1p7lHHxHRUJs
	NU9QAbYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv0Jl-00000008Tpl-0cnC;
	Sat, 06 Sep 2025 21:19:29 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv0Gz-00000008Teq-0t3F
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 21:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757193397; x=1788729397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rBLI7ukQHDWS6AwQcN6I5VytRlnwi7WAZKTS9iyO0tI=;
  b=VVY/7EPCdUu79lCjKXfthhgqEosisS5eD8DBK+tZnGzd7hyRHpBNZXD5
   mNs7lwQPLqQ2R6KLLrQB4qkvuEyzLKbCHI+mex/A5J2Ox8XbOjlVfhqTK
   EZcgWK1Xs6Ad0F9IY37o10xxuixb+1zXs48yW/8as3qDntdLFZ+LxKLEn
   ov+5JqcidzmAMor7xYeChynVmuR/iqtG3wSAzM8YCMra4vYqypTIAlnq6
   gKKk6yOvlpikdWynDGXD6qA9kRyaISO8Pe3QY/vV6q5qFtRgghjMy3vnM
   Xqj7DMfU/ZgEO+EqIOJyrN2ESeBxFd497qHGkfQGQQ6iJBByVgRV/Wb5s
   g==;
X-CSE-ConnectionGUID: 1werkrYiTYm0wA0KO05+Ow==
X-CSE-MsgGUID: JjXWgEufQ0qNNblOsWeR6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="62131858"
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="62131858"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 14:16:31 -0700
X-CSE-ConnectionGUID: m/SS9zIhS4m6vaHeaN13bg==
X-CSE-MsgGUID: iPkamp7WRvKSUK+pal2eOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="172366458"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Sep 2025 14:16:27 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv0Gm-0001nX-2E;
	Sat, 06 Sep 2025 21:16:24 +0000
Date: Sun, 7 Sep 2025 05:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wens@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v3 02/10] net: stmmac: Add support for Allwinner
 A523 GMAC200
Message-ID: <202509070456.CKA8CXUt-lkp@intel.com>
References: <20250906041333.642483-3-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906041333.642483-3-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_141637_296135_9F871FD7 
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

Hi Chen-Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/dt-bindings-net-sun8i-emac-Add-A523-GMAC200-compatible/20250906-121610
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250906041333.642483-3-wens%40kernel.org
patch subject: [PATCH net-next v3 02/10] net: stmmac: Add support for Allwinner A523 GMAC200
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20250907/202509070456.CKA8CXUt-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509070456.CKA8CXUt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070456.CKA8CXUt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c: In function 'sun55i_gmac200_set_syscon':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c:60:89: warning: format '%d' expects argument of type 'int', but argument 5 has type 'long unsigned int' [-Wformat=]
      60 |                                              "TX clock delay exceeds maximum (%d00ps > %d00ps)\n",
         |                                                                                        ~^
         |                                                                                         |
         |                                                                                         int
         |                                                                                        %ld
   drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c:74:89: warning: format '%d' expects argument of type 'int', but argument 5 has type 'long unsigned int' [-Wformat=]
      74 |                                              "RX clock delay exceeds maximum (%d00ps > %d00ps)\n",
         |                                                                                        ~^
         |                                                                                         |
         |                                                                                         int
         |                                                                                        %ld


vim +60 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c

    39	
    40	static int sun55i_gmac200_set_syscon(struct device *dev,
    41					     struct plat_stmmacenet_data *plat)
    42	{
    43		struct device_node *node = dev->of_node;
    44		struct regmap *regmap;
    45		u32 val, reg = 0;
    46		int ret;
    47	
    48		regmap = syscon_regmap_lookup_by_phandle(node, "syscon");
    49		if (IS_ERR(regmap))
    50			return dev_err_probe(dev, PTR_ERR(regmap), "Unable to map syscon\n");
    51	
    52		if (!of_property_read_u32(node, "tx-internal-delay-ps", &val)) {
    53			if (val % 100)
    54				return dev_err_probe(dev, -EINVAL,
    55						     "tx-delay must be a multiple of 100ps\n");
    56			val /= 100;
    57			dev_dbg(dev, "set tx-delay to %x\n", val);
    58			if (!FIELD_FIT(SYSCON_ETXDC_MASK, val))
    59				return dev_err_probe(dev, -EINVAL,
  > 60						     "TX clock delay exceeds maximum (%d00ps > %d00ps)\n",
    61						     val, FIELD_MAX(SYSCON_ETXDC_MASK));
    62	
    63			reg |= FIELD_PREP(SYSCON_ETXDC_MASK, val);
    64		}
    65	
    66		if (!of_property_read_u32(node, "rx-internal-delay-ps", &val)) {
    67			if (val % 100)
    68				return dev_err_probe(dev, -EINVAL,
    69						     "rx-delay must be a multiple of 100ps\n");
    70			val /= 100;
    71			dev_dbg(dev, "set rx-delay to %x\n", val);
    72			if (!FIELD_FIT(SYSCON_ERXDC_MASK, val))
    73				return dev_err_probe(dev, -EINVAL,
    74						     "RX clock delay exceeds maximum (%d00ps > %d00ps)\n",
    75						     val, FIELD_MAX(SYSCON_ERXDC_MASK));
    76	
    77			reg |= FIELD_PREP(SYSCON_ERXDC_MASK, val);
    78		}
    79	
    80		switch (plat->mac_interface) {
    81		case PHY_INTERFACE_MODE_MII:
    82			/* default */
    83			break;
    84		case PHY_INTERFACE_MODE_RGMII:
    85		case PHY_INTERFACE_MODE_RGMII_ID:
    86		case PHY_INTERFACE_MODE_RGMII_RXID:
    87		case PHY_INTERFACE_MODE_RGMII_TXID:
    88			reg |= SYSCON_EPIT | SYSCON_ETCS_INT_GMII;
    89			break;
    90		case PHY_INTERFACE_MODE_RMII:
    91			reg |= SYSCON_RMII_EN;
    92			break;
    93		default:
    94			return dev_err_probe(dev, -EINVAL, "Unsupported interface mode: %s",
    95					     phy_modes(plat->mac_interface));
    96		}
    97	
    98		ret = regmap_write(regmap, SYSCON_REG, reg);
    99		if (ret < 0)
   100			return dev_err_probe(dev, ret, "Failed to write to syscon\n");
   101	
   102		return 0;
   103	}
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

