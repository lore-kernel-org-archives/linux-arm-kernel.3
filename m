Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03252D29DC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 05:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qD4M8SXxlsbF3FqUMAGDuku8cKZrTRbMTdZ1JvdGgFM=; b=sCcgBFVE81OITd9GTLBEEivfyL
	Nt1G282F0hRH1aAiDVf7CQ1DWFIAu0kZUqlcjuHJqyXrzExzCu7nAZROuMf2fjmIpdDAdR1PhpLLu
	8uybIb7176yFWzoaOsceOfdagbZxIt17ZXoVrueBCi0Q49EQ7bAjPAP94reWx3Rf8ESfUFNpW8SDR
	dY405rnARbku7mdwECed1N9LYoCQ6HBrAPrOvgY2LBt8mcW7HdB7BYpkxdenL/1+yEKYRwYIHerLi
	CzNswdPzhImG5Uz2NnWExtLne1Hox7YlIKy/xvGGknLrS+KtNkxRzIamASIi3P81AgPBi4zG0X6Gs
	0m/shK3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfWnV-00000006Y25-1IcG;
	Tue, 13 Jan 2026 05:18:29 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfWnR-00000006Y1U-3WK1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 05:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768281506; x=1799817506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9iQZnMV3CUdtK45BwWJKiFUt0g3nkqqUh/ffW8zt9kc=;
  b=anpFuZWQRk5FXrmQHZEyWgEI5oTIjNhNStYKzYCGoFaY0SE9TWMgb8Mf
   RGD1bJGsv7EzoJZdGxXggB+ZpMqJfS4s3rk0IyePOpyLYtTSWujalqPka
   TsVsfjpx6xrDHe8SXhWf4MUVycy9Cr/uB1pLvo20cZw62avpqmMN3Z5V5
   g1nJDDsunaGd46E9vzELWM0151Qh6jTt7CuzpWOYHiOicn/Cv3izZ7HNM
   Lw+eOVNpS3Ph+Ywd2UWZ7UOYhRDFsDvqrBOQyAhCHmBlXWrAd2ZhyYfkQ
   4C3DFcD5LrcdZiJasHJ2bdOIYwGAeBgo1gm5gPx1fCDh63hnAjot4srKU
   g==;
X-CSE-ConnectionGUID: FQILU+duQvyu5WI2giLoIg==
X-CSE-MsgGUID: GHIO32olSjuobZ3ktryZlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73414873"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73414873"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 21:18:19 -0800
X-CSE-ConnectionGUID: 1LVxbLv/TOWxQqR2EIejXQ==
X-CSE-MsgGUID: 6cF0U2x3R2+ZEDw6B0G6xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208801024"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 21:18:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfWnE-00000000EFc-1LjW;
	Tue, 13 Jan 2026 05:18:12 +0000
Date: Tue, 13 Jan 2026 13:17:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 2/2] net: stmmac: qcom-ethqos: convert to
 set_clk_tx_rate() method
Message-ID: <202601131202.sz9WCQgh-lkp@intel.com>
References: <E1vfMO1-00000002kJF-33UK@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vfMO1-00000002kJF-33UK@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_211825_946221_7114ECB2 
X-CRM114-Status: GOOD (  11.37  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-qcom-ethqos-remove-mac_base/20260113-061245
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vfMO1-00000002kJF-33UK%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 2/2] net: stmmac: qcom-ethqos: convert to set_clk_tx_rate() method
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260113/202601131202.sz9WCQgh-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131202.sz9WCQgh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131202.sz9WCQgh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:188:1: warning: non-void function does not return a value in all control paths [-Wreturn-type]
     188 | }
         | ^
   1 warning generated.


vim +188 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

a7c30e62d4b895 Vinod Koul            2019-01-21  175  
a69650e88a5551 Russell King (Oracle  2026-01-12  176) static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
a69650e88a5551 Russell King (Oracle  2026-01-12  177) 				  phy_interface_t interface, int speed)
a7c30e62d4b895 Vinod Koul            2019-01-21  178  {
a69650e88a5551 Russell King (Oracle  2026-01-12  179) 	struct qcom_ethqos *ethqos = bsp_priv;
98f9928843331f Russell King (Oracle  2025-02-21  180) 	long rate;
98f9928843331f Russell King (Oracle  2025-02-21  181) 
a69650e88a5551 Russell King (Oracle  2026-01-12  182) 	if (!phy_interface_mode_is_rgmii(interface))
a69650e88a5551 Russell King (Oracle  2026-01-12  183) 		return 0;
26311cd112d05a Sarosh Hasan          2024-02-26  184  
98f9928843331f Russell King (Oracle  2025-02-21  185) 	rate = rgmii_clock(speed);
98f9928843331f Russell King (Oracle  2025-02-21  186) 	if (rate > 0)
a69650e88a5551 Russell King (Oracle  2026-01-12  187) 		clk_set_rate(ethqos->link_clk, rate * 2);
a7c30e62d4b895 Vinod Koul            2019-01-21 @188  }
a7c30e62d4b895 Vinod Koul            2019-01-21  189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

