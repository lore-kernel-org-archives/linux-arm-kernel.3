Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6840D29F9D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 06:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNsUUFVROgEAFUOuehxQDjiKtWvJbtWkNJ0nAOnJ+wc=; b=MWF82WKGYBXcGyBGX3BSSyFbVB
	GKO7XhIRrBgK0n0tps0op5OrQc53JdSoB2mQ/Hi97VTXlzwMZCFghXkdUc9POn1NpOT5lb6VRMwth
	FgtBp+qzxW73zqk2GE0KqiPxvk46T+r5UGpd3MsRBMBRvKfz4qfr6BWXlcXh1e3P95k5nv8djB3LY
	29wZCBEw0MFEQahofLDPXjwFhxmDxxb6u0oM+C591LTQ/gllm0S5Zh4FOz/FTqcN9hVF/n4AZHrGp
	fhaDYnP4Ed4yY91bts7ywCYq72rxW2tSywhDQJVesLNbYKZRlZj4ZhvS/jS6rl4rq9pFbhocS/HMi
	k9S4XbtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Zzf-000000023HJ-0ggH;
	Wed, 06 Nov 2024 06:58:19 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Zxw-0000000237U-1e9X;
	Wed, 06 Nov 2024 06:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730876192; x=1762412192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7Blh7p02YI4RwiQup76IUOMLyinN3Qo+MpfCB2iFvv8=;
  b=eiKQTj8He7m4DLB3sU9JC7vT5B8ICCmvbpboTZV0P77ju5rmHHoCKe2g
   qCyIA7iUeKtwRHq9TyszLoXMo7/lU/NUGMqwVxdkntnM5L2Mf0WKZsAIQ
   dUq4sD3mlDf/FfIs76lJSM22Ftl4U5/6nsnQmXoCkn3mRhdFb8VPv93b3
   5THn6q1xhmpY9U+UEwroFpm0M4nrQbavh3T7vd4jSxiUilR+dRysdtqXr
   P3t2wKPMefCnyFahFIuEX+642E/TGjLWvyKk2YjgVVX4K4Qhk4XynhDRG
   Ro1EQgl3fjVYwOAwAY881G6OPDJDwZMwxQWFT0TgT6S8A6NiayyS07nyr
   g==;
X-CSE-ConnectionGUID: ZomVP0eDTxOAvh0kDqALZA==
X-CSE-MsgGUID: Wa78mq0+Txm7nZexrHA1jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41285078"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="41285078"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 22:56:31 -0800
X-CSE-ConnectionGUID: suoCvPbpTgCv3vpY5bfu7w==
X-CSE-MsgGUID: 79adoSYUTq+OVmjKJvESiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84308090"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Nov 2024 22:56:12 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8ZxZ-000n1a-2o;
	Wed, 06 Nov 2024 06:56:09 +0000
Date: Wed, 6 Nov 2024 14:55:39 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, Steven Liu <Steven.Liu@mediatek.com>,
	"SkyLake.Huang" <skylake.huang@mediatek.com>
Subject: Re: [PATCH net-next v2 4/5] net: phy: mediatek: Integrate read/write
 page helper functions
Message-ID: <202411061420.eK9LoyP8-lkp@intel.com>
References: <20241105141911.13326-5-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105141911.13326-5-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_225632_734065_6257602B 
X-CRM114-Status: GOOD (  10.79  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Sky-Huang/net-phy-mediatek-Re-organize-MediaTek-ethernet-phy-drivers/20241105-222556
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241105141911.13326-5-SkyLake.Huang%40mediatek.com
patch subject: [PATCH net-next v2 4/5] net: phy: mediatek: Integrate read/write page helper functions
config: hexagon-randconfig-002-20241106 (https://download.01.org/0day-ci/archive/20241106/202411061420.eK9LoyP8-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061420.eK9LoyP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061420.eK9LoyP8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mtk_phy_read_page
   >>> referenced by mtk-ge.c
   >>>               drivers/net/phy/mediatek/mtk-ge.o:(mtk_gephy_driver) in archive vmlinux.a
   >>> referenced by mtk-ge.c
   >>>               drivers/net/phy/mediatek/mtk-ge.o:(mtk_gephy_driver) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mtk_phy_write_page
   >>> referenced by mtk-ge.c
   >>>               drivers/net/phy/mediatek/mtk-ge.o:(mtk_gephy_driver) in archive vmlinux.a
   >>> referenced by mtk-ge.c
   >>>               drivers/net/phy/mediatek/mtk-ge.o:(mtk_gephy_driver) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

