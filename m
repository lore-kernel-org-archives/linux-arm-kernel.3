Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0FCD149CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WquX2cl7IffjuB5Igjt7I2WQrOobM1hAp+Qhi1fing=; b=I+2RLnbUlSph40o7BtUYCFimZU
	y7OgfkhSdyTsPkpVqHz1XEboScuxWFCdcs4K4dcKtsPzV+Q0RiBxLPGVr/yO9mf2Ik3PuJYzmARbA
	vGv5DHOsFg7B/pPrMOnjHpO93GqyTzgwAS5le1wLz+lZ8IcxJgAoQggJrsFhH552giPTnp6nhpuoN
	5hEmDex//gMVQ+IYdprN5jYMma1UAEYapY/blKTpPn5DzjzIGqoCRPn+NjdjP849aUcqCL6K9R8oh
	wsxJJ/WVAnk3JWEMTJRFQWr2m6VOzsNYFoqCejQWNr185iOD1ryAwwLRIrqf5N6+FEDBNAclduJRB
	J+d3HSxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nry-00000004Wxm-1bW5;
	Fri, 25 Oct 2024 17:13:02 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NqO-00000004WkS-1q4Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729876285; x=1761412285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MYQYsh2ZM0F5hLiv9jWAnO8EjpYfnIqM2b9zMJRm42c=;
  b=ikZDEar7QA1SpCS2AIP+nuBrjwkz9yralhRHQzqyv+LsGdq7kUy2ksHW
   arO3xxopYCxe6dVqE8QRtMPu/XO1m9TVgzf0IRD/kK6otkJDTkuOrJuiu
   Rb2meY6Oa3iX6ebG5omcJf9JXSw83zTzage+ua1y0v+JCj5ixXbM6a5xN
   nT+BPNL00ZVYxl0U2rwmsJc+dUjK81/pvmXMTqHr4mGP+dznDYDGCnDFb
   ZJfSB3f1VGfMUU9p5zMlt8aJgAhhHXjAHLyEUAL2p2o27TBCt/NFwETD2
   4cWthQk5YfPaxuFY6iExhFFS6jojBpF2KWggCHz8HxU4KXWqrQvjpgpxa
   g==;
X-CSE-ConnectionGUID: 4td2QrfNTUuVKSGdQ/RqWA==
X-CSE-MsgGUID: 60qUbQSFTBuBf7H974DBSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29497042"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29497042"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 10:11:24 -0700
X-CSE-ConnectionGUID: W8ffi6AWRIKUCKXfgRWWzw==
X-CSE-MsgGUID: jBgwIuxpQcCrOIKJrpn2Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="81267315"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Oct 2024 10:11:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4NqH-000Yeq-1K;
	Fri, 25 Oct 2024 17:11:17 +0000
Date: Sat, 26 Oct 2024 01:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Vladimir Oltean <olteanv@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: Re: [PATCH net-next v4 3/6] net: stmmac: Refactor FPE functions to
 generic version
Message-ID: <202410260025.sME33DwY-lkp@intel.com>
References: <cfc647f0d031517f9ec9095235a574aad9dc2c95.1729757625.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfc647f0d031517f9ec9095235a574aad9dc2c95.1729757625.git.0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_101124_587978_38D58523 
X-CRM114-Status: GOOD (  11.79  )
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

Hi Furong,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Furong-Xu/net-stmmac-Introduce-separate-files-for-FPE-implementation/20241024-163526
base:   net-next/main
patch link:    https://lore.kernel.org/r/cfc647f0d031517f9ec9095235a574aad9dc2c95.1729757625.git.0x1207%40gmail.com
patch subject: [PATCH net-next v4 3/6] net: stmmac: Refactor FPE functions to generic version
config: arm-spear13xx_defconfig (https://download.01.org/0day-ci/archive/20241026/202410260025.sME33DwY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260025.sME33DwY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260025.sME33DwY-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.o: in function `stmmac_fpe_configure':
>> drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c:205:(.text+0x154): undefined reference to `__ffsdi2'


vim +205 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c

   191	
   192	void stmmac_fpe_configure(struct stmmac_priv *priv, u32 num_txq, u32 num_rxq,
   193				  bool tx_enable, bool pmac_enable)
   194	{
   195		struct stmmac_fpe_cfg *cfg = &priv->fpe_cfg;
   196		const struct stmmac_fpe_reg *reg = cfg->reg;
   197		void __iomem *ioaddr = priv->ioaddr;
   198		u32 value;
   199	
   200		if (tx_enable) {
   201			cfg->fpe_csr = STMMAC_MAC_FPE_CTRL_STS_EFPE;
   202			value = readl(ioaddr + reg->rxq_ctrl1_reg);
   203			value &= ~reg->fprq_mask;
   204			/* Keep this SHIFT, FIELD_PREP() expects a constant mask :-/ */
 > 205			value |= (num_rxq - 1) << __bf_shf(reg->fprq_mask);
   206			writel(value, ioaddr + reg->rxq_ctrl1_reg);
   207		} else {
   208			cfg->fpe_csr = 0;
   209		}
   210		writel(cfg->fpe_csr, ioaddr + reg->mac_fpe_reg);
   211	
   212		value = readl(ioaddr + reg->int_en_reg);
   213	
   214		if (pmac_enable) {
   215			if (!(value & reg->int_en_bit)) {
   216				/* Dummy read to clear any pending masked interrupts */
   217				readl(ioaddr + reg->mac_fpe_reg);
   218	
   219				value |= reg->int_en_bit;
   220			}
   221		} else {
   222			value &= ~reg->int_en_bit;
   223		}
   224	
   225		writel(value, ioaddr + reg->int_en_reg);
   226	}
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

