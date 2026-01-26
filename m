Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D4FD1951B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 22:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnroHu4LRQPkpA6KA6gRdMMHwWl2ZmnE6SSKUt67trc=; b=2+8FmakegcLGMi9wAke01KlEuR
	As/53jo44JctcwgmF/xcISA7R+GJcEyzC0MHtRxfo4WhMuh/N7hSqwi5XJeL0qwuYEu1De18lXlO8
	1zd7sJE1XAtzEFH8VjfvEdmhFXkIEu7NnaTXctSbnyZVeXDm7Nb4aCcFImvnbDErHjMQqlma/Bk02
	MKQA9SCDI8VCvxEOJtrKl5k31Gp+ctGp6Y+WQYi26rM6SAnjUd1ZL40ZRqru3Mc6s9u2QnMk2mg4y
	VzkEkY+huWWEu419ERpCDYLE3TAyTlP1yXIvHihV3H0NNlNZm1Eb3LRCVceF2U4MiSDayu5/wesMo
	ZnAHx0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkUvv-0000000DJCH-24rh;
	Mon, 26 Jan 2026 22:19:43 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkUvt-0000000DJBr-0znX;
	Mon, 26 Jan 2026 22:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769465981; x=1801001981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MfG5mNjjM2G02N3+AWG0P0JkfwOAvfM7VEWe3256V5c=;
  b=kuezKHBlz94YLBkkNKqb+GtckPIAF+CGROQ+etshkvzEEr0bJJpop+Qe
   phkwdkLZl6CXC8jW8teHovPl6Zc5qwxOjKRZZ9uH6ftNxoS4S9ciio4JW
   Gn1NfU7kHu/f6yYnYX6SVW//Yw2w9tOPv8Ao2eQzLv/NmLoJekyB/QXXh
   GgTPh8CaHcJT2AokOtT0xDgymDWW2nNKp8GrXBa2XwOOchYCubjQk/yjD
   ZGHd8mY6Laq6x2vQ6C2K/OVD1WpXr98cVW3VxyXfU8tbBIrCE1vXk65Y5
   tpPI+VEeH5wEt1dLs0HRJTpKkQY2lPqYQxjZfoVCC+P5UQcteKRVuDHET
   Q==;
X-CSE-ConnectionGUID: Icbc0CzBQiqi6id3/sA/WQ==
X-CSE-MsgGUID: pPInSF0KQGKq5uu7Xj7APg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82020718"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="82020718"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 14:19:40 -0800
X-CSE-ConnectionGUID: g4hHWet8R1qn9oh1nF18gQ==
X-CSE-MsgGUID: tuyl5+JHQhyy8v27GXZOhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="245405233"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Jan 2026 14:19:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkUvl-00000000Xjy-2AbJ;
	Mon, 26 Jan 2026 22:19:33 +0000
Date: Tue, 27 Jan 2026 06:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 08/22] net: stmmac: rk: convert rk3588 to
 mask-based interface mode config
Message-ID: <202601270652.AmCxSo3f-lkp@intel.com>
References: <E1vkL2I-00000005usu-42Hy@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vkL2I-00000005usu-42Hy@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_141941_315509_BE9F87DF 
X-CRM114-Status: GOOD (  10.70  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-rk-avoid-phy_power_on/20260126-234820
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vkL2I-00000005usu-42Hy%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next v2 08/22] net: stmmac: rk: convert rk3588 to mask-based interface mode config
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260127/202601270652.AmCxSo3f-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270652.AmCxSo3f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270652.AmCxSo3f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c: In function 'rk_write_gmac_grf_reg':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:132:24: warning: variable 'regmap' set but not used [-Wunused-but-set-variable]
     132 |         struct regmap *regmap;
         |                        ^~~~~~


vim +/regmap +132 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

   129	
   130	static int rk_write_gmac_grf_reg(struct rk_priv_data *bsp_priv, u32 val)
   131	{
 > 132		struct regmap *regmap;
   133	
   134		if (bsp_priv->ops->gmac_grf_reg_in_php)
   135			regmap = bsp_priv->php_grf;
   136		else
   137			regmap = bsp_priv->grf;
   138	
   139		return regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

