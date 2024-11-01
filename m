Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B799E67490
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 00:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yANkLDlzSL43/hAXZpZR6vsEzAnivYrHjeOWQqdIjJk=; b=iiHMdn7kO2mwPu7quMsV/Zw/jB
	izslna+U0UexAbY8TwYmAHNuDsPryxcjHAA7xsT2mgvHpsIQbEPmjGkMxnN7Jt4ONrURXkZ46etVF
	8Qvtb2gG0EXnnL+vVx2JZSlinL8hbHIV3UyyiZm7bgLgSo1Pg7SAAR1Wnd4xP44XhQOgl58c5zcEP
	X4Vbm9JvGvgDfNku+M+7Yg8BATAc/KIl1sqzkHf8qXrLBc7pTsOD9QrPzbg4Q+5cC1Z885BG8rK/R
	9/WW2I17TwAUytrtTYLcOqwe5w0bDMLPrQLL+3wdegTREy8+3azIgTxH377dRNvUpX3ddLMlB76xg
	lXRTtUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fUy-00000005IEj-2gk8;
	Fri, 01 Nov 2024 00:26:44 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fTG-00000005Hj4-1jjz;
	Fri, 01 Nov 2024 00:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730420698; x=1761956698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HgGI0MztuDXM0kkbhNu/WK25UzLMgeMemdDEF+M6Yis=;
  b=WSjca7tWvSzF1h3IliouvoyXuMmtM9cCCPfJwQ8sWdn1tkN+72jveYg5
   kQzcUmrSXbpIHDgtnTXoIzOGyBesyt+KGgMStbfj4gxBj9bRC9mbs3mSL
   8ssVbscLcobFpAXFlXVpdXDCYti7f+UYF6xvthH2n6fkdN7qA2GCUzxaK
   0rV6m+UqfSd8u+yq/JySCmeQPPvlwzaoWG4lj8ccNmriftKnuSZQ6eNut
   +EloYR3TXefV6kuuiBKYFHS1xienOvgdGnicNHrPXqdbvVywEbGeVmfnu
   92GAUvavw7wWbIz6/ywyrGI36N8P79zn8r63vaNL/cPPnXkrTA1cUTCpa
   g==;
X-CSE-ConnectionGUID: 7TkBM3UUQMq13HsbRvC8xg==
X-CSE-MsgGUID: 39pjs5cMRLqexgBzCrMNyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="33988277"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="33988277"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 17:24:56 -0700
X-CSE-ConnectionGUID: RzYv7uP7THeQKpbmmHYBZA==
X-CSE-MsgGUID: 96x6eHVSQbyORU8dcMijjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="82323066"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Oct 2024 17:24:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6fT7-000gsN-2M;
	Fri, 01 Nov 2024 00:24:49 +0000
Date: Fri, 1 Nov 2024 08:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sky Huang <SkyLake.Huang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Steven Liu <Steven.Liu@mediatek.com>,
	"SkyLake.Huang" <skylake.huang@mediatek.com>
Subject: Re: [PATCH net-next 4/5] net: phy: mediatek: Integrate read/write
 page helper functions
Message-ID: <202411010814.EOjx8juJ-lkp@intel.com>
References: <20241030103554.29218-5-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030103554.29218-5-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_172458_569489_4A5AFB70 
X-CRM114-Status: GOOD (  10.52  )
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

Hi Sky,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sky-Huang/net-phy-mediatek-Re-organize-MediaTek-ethernet-phy-drivers/20241030-184043
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241030103554.29218-5-SkyLake.Huang%40mediatek.com
patch subject: [PATCH net-next 4/5] net: phy: mediatek: Integrate read/write page helper functions
config: i386-randconfig-004-20241101 (https://download.01.org/0day-ci/archive/20241101/202411010814.EOjx8juJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010814.EOjx8juJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010814.EOjx8juJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/net/phy/mediatek/mtk-ge.o:(.data+0xb4): undefined reference to `mtk_phy_read_page'
>> ld: drivers/net/phy/mediatek/mtk-ge.o:(.data+0xb8): undefined reference to `mtk_phy_write_page'
   ld: drivers/net/phy/mediatek/mtk-ge.o:(.data+0x1c8): undefined reference to `mtk_phy_read_page'
   ld: drivers/net/phy/mediatek/mtk-ge.o:(.data+0x1cc): undefined reference to `mtk_phy_write_page'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

