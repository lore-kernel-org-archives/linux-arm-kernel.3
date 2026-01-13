Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8EED29DC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 03:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/8Trr+R6mhpvWVr4igSvwacEs+82RPMVucapjT1Xlc=; b=zifu8Cs6/YhWYhln7qy/Rhe9vX
	mj9JklUSKbvesCmDE0itus/I0fNGO1pkYlVtTOwnPHo7R7K9VmulC6FecnDQLTnLj0k4EA8Pu4UAH
	b3IDGS/O1KiSRS3+6qoydOaZbkane/wjJyVsMOSXaoMTCY0IoFsMZ6LJZD0L4se+g7+0dWMcQatJ5
	c618+23L8Y5Fnl3QDHj8YkK1GREOll/vLgkryKNAIH/kNO03jfQ0dCteUS6gGiwKpODgH+nAz/siL
	yFIGzFeqbFZ+mUzh9+MT6g4EXfKGP1MU4kbhW0QrfnYUYvJxZMjCa96T6I8iYOt+5rOV25S6cdSdu
	0UZnI7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfVTS-00000006VX6-0SFa;
	Tue, 13 Jan 2026 03:53:42 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfVTO-00000006VWl-09O8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 03:53:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768276418; x=1799812418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/IRlg/HZqaWarHkvItRChuZKhbeASWJFIkTvLPcavzU=;
  b=eKfcxiAtWlC8rWX7aNs0zATyd1sWWCkgHr/HcFShCsumXy5qmLWfKms6
   LgK2qOWTZdJLArtK0zjsu2hcvIT9gxq/qE8J0yveG9dzkfq2kBtuBDOdH
   0Cmuk+bwG9FRiWQcTcAe5LIjgDubhZXBrkGjbiKAMoekDbSS+DCNMmL9I
   hQBX2DHnoRY7Ds+n9qR8OOlYSTi22Pi7XrB/pFM0d6z7juJDHwvS+941h
   LyGV4Jxra8JpQmi1ZA1PWJsOBCEM2fmNLDeuDXr7qXfoYfNz/1rjpH+YE
   GrNgfJHduN2EW3sMtrj++P9JqJcnOMBIflG6wNM6jF5RO9eTi0zDjL0nV
   w==;
X-CSE-ConnectionGUID: N9zZ0oaGRNKq4xVGD9jWww==
X-CSE-MsgGUID: 1LlbB4JBSNi2yKGOofWZ+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69613563"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69613563"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:53:37 -0800
X-CSE-ConnectionGUID: ZcgYCdDKQQa6FHqWUrNpng==
X-CSE-MsgGUID: mlgWcsnIQTGOQJ6oXCw5Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="227496203"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jan 2026 19:53:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfVTH-00000000EBU-1ImV;
	Tue, 13 Jan 2026 03:53:31 +0000
Date: Tue, 13 Jan 2026 11:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
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
Message-ID: <202601131106.zgy17BPH-lkp@intel.com>
References: <E1vfMO1-00000002kJF-33UK@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vfMO1-00000002kJF-33UK@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_195338_145482_191E0095 
X-CRM114-Status: GOOD (  10.82  )
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
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260113/202601131106.zgy17BPH-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131106.zgy17BPH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131106.zgy17BPH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c: In function 'ethqos_set_clk_tx_rate':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:188:1: warning: control reaches end of non-void function [-Wreturn-type]
     188 | }
         | ^


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

