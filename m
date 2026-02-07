Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C26EE6B70
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Feb 2026 01:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hy3MGONEL5Qm+vr/PFcnLdaACGnKyiHe6XnqxbgMM6o=; b=IrHyXd4rTHs11NdaGwpMrMJrsp
	bYN9+mzRwmyiY+r1yQ9ZH+WNHjXiiYnTc7BJsDbZUvOk+tR4XwFcZHvHA2Dx+GtUHSnPoJzHbDa2N
	6Wd5jhpABqWBd7W9d7ODMSQTggs2SKGiN7/EQ12lGcVCpd6JYXB5qeDBPT6D9vtJ7uLdgLQMD/tMl
	e+kOyIEvPBqf79rkBHmZaGZc7u4CLYreH9tpfypqwg9ytjfTXhwIV3h+zLUOoYTi+fQAl1DKHf93o
	uWCo6MCU0Z1y7DGuM7pYKKQowf6oVKoRVquIHWEOL4yENen4g2zWjpTZNxOGfSVphqs1BBYYU72cV
	eNlx2BqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voWw6-0000000C0cG-29Lh;
	Sat, 07 Feb 2026 01:16:34 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voWw3-0000000C0bt-409P
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Feb 2026 01:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770426993; x=1801962993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hh7SpEz8MKjpCWA1yMRyH7FgdwVcmZWj/58wW3MHj2w=;
  b=DRCn9HoDIb2iLz32r61xKaUXFBMrWWOHM8GRMOvMD+lgm78luOnmSsZY
   VITAeL9/hTe0XDvIep+yzG6StJZURoO8rWVbg6kW8VW7ec2flbkJyX55u
   SIRsPCt+XoayMVSUK+X0k35gRFpRIoSoWLnlc2quZB1o/o+k59TOnO43S
   tqTfmvGY9EVkcC9FCBhlErluqAhrS9o7p/iRAa19QWod4Poo9JyzdhTSv
   4zrDDyV3JauFCUF7ajKe0BnbSrCU3pB3zhahoCDwpSGIL35R3jdGJE8QZ
   pUgVsNwm9ysLoI2GQBX0dB6Yvd3oEBOVKa7kQVPLHA78NETXNzBv4J9df
   g==;
X-CSE-ConnectionGUID: 5m1Z35NPQoKilgQZAQ0PJQ==
X-CSE-MsgGUID: a0hOuY5DSGm6PPq3FBuhxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="83081183"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="83081183"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 17:16:30 -0800
X-CSE-ConnectionGUID: XjJi+sJWSxeHoT3mP8rEqw==
X-CSE-MsgGUID: iuJ4Za1KR4mB7oed6O6Y5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="248643780"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Feb 2026 17:16:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voWvu-00000000lJG-21FH;
	Sat, 07 Feb 2026 01:16:22 +0000
Date: Sat, 7 Feb 2026 09:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Zhang <jzhang918@gmail.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, jzhang918@gmail.com,
	jie.zhang@analog.com, horms@kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: fix oops when split header is enabled
Message-ID: <202602070917.7RxMgQNe-lkp@intel.com>
References: <20260206195643.11333-1-jie.zhang@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206195643.11333-1-jie.zhang@analog.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_171632_077854_BA597094 
X-CRM114-Status: GOOD (  13.32  )
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

Hi Jie,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Zhang/net-stmmac-fix-oops-when-split-header-is-enabled/20260207-035916
base:   net/main
patch link:    https://lore.kernel.org/r/20260206195643.11333-1-jie.zhang%40analog.com
patch subject: [PATCH net v2] net: stmmac: fix oops when split header is enabled
config: arc-hsdk_defconfig (https://download.01.org/0day-ci/archive/20260207/202602070917.7RxMgQNe-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070917.7RxMgQNe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070917.7RxMgQNe-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: In function 'stmmac_rx_buf2_len':
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5041:24: error: 'struct plat_stmmacenet_data' has no member named 'has_gmac4'
    5041 |         if (!priv->plat->has_gmac4 && (status & rx_not_ls))
         |                        ^~


vim +5041 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

  5014	
  5015	static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
  5016					       struct dma_desc *p,
  5017					       int status, unsigned int len)
  5018	{
  5019		int coe = priv->hw->rx_csum;
  5020		unsigned int plen = 0;
  5021	
  5022		/* Not split header, buffer is not available */
  5023		if (!priv->sph_active)
  5024			return 0;
  5025	
  5026		/* For GMAC4, when split header is enabled, in some rare cases, the
  5027		 * hardware does not fill buf2 of the first descriptor with payload.
  5028		 * Thus we cannot assume buf2 is always fully filled if it is not
  5029		 * the last descriptor. Otherwise, the length of buf2 of the second
  5030		 * descriptor will be calculated wrong and cause an oops.
  5031		 *
  5032		 * If this is the last descriptor, 'plen' is the length of the
  5033		 * received packet that was transferred to system memory.
  5034		 * Otherwise, it is the accumulated number of bytes that have been
  5035		 * transferred for the current packet.
  5036		 *
  5037		 * Thus 'plen - len' always gives the correct length of buf2.
  5038		 */
  5039	
  5040		/* Not GMAC4 and not last descriptor */
> 5041		if (!priv->plat->has_gmac4 && (status & rx_not_ls))
  5042			return priv->dma_conf.dma_buf_sz;
  5043	
  5044		/* GMAC4 or last descriptor */
  5045		plen = stmmac_get_rx_frame_len(priv, p, coe);
  5046	
  5047		return plen - len;
  5048	}
  5049	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

