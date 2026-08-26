Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7A3C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 06:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10Pmqk0GKcsTMTGMObf9BW2pENFBkGKMIiwdM8IR49Q=; b=VOOZk8VDgsZEh2r+dqnOqynmQB
	zHaNwfkj2pyxlz1gQWnnY/c7DNDZldxO7GUAJRSPwXCsbuIzq9m0C+ScUvU5kw8okyP2EPIAVAiLc
	vl+KuOOdJIoRT5MBOd8voP/t8T7XFHGctpJl0J3z/uW4dp54HDp5LmUzmjIQxCEduZuDZQZi3+gfj
	43y0kgnuryGr5/QbGzOuqAo2RICDpsi85w6VB8SBPKXBrBfppcKsSsgEIqVLnq2EzqM0YrwiBuM83
	cO3sf0PIAp0Y9vL2/RUdSWwbS8I/a/9jJdC2I3BYX4k6/6+6vijJ1uhsgmK3fl5urBDc2T2cEluNB
	qDitWT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz7UZ-00000001z9E-1W1D;
	Wed, 26 Aug 2026 06:52:11 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz7UU-00000001z8D-3WGQ;
	Wed, 26 Aug 2026 06:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787727127; x=1819263127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wqWPTIvAKL83aGl0HiFpgUZP2uLr9zLOEr57abq342M=;
  b=Xw24+Y7mKrhlfZzzJ22SerFdc63vRsMYaOwMlTXD8LNeiyd0dqm9Xj1l
   7LUNGGPelkHz6SjidQ284dc6Hsp3YD1clm28hqfg0ksjgBN+c7YPcfP6i
   oTsxecIBFVB1NhdMxc7a52/wPe/5gTXq7zw7W6zaavxV7pLoIVldbIJy8
   5ZfK3n4/b5/B7VgKbOHmWOqfnVeG28FU+a1NyuaEJ4uulrmt2whXAFk6s
   tU+RzZDZDKNt7gzxmiKBZEeLl+C8ZpKc/FgKAV2PG27TB+sB+pzq/8VMW
   zmJ742XLgZtXmTdhvkSiakMoXWY6tH2MSBRFvk3EoeHACG/c0RHXaOo9Y
   w==;
X-CSE-ConnectionGUID: zR+yJ++gTJ+yk//XZPIhVg==
X-CSE-MsgGUID: D//retLxRyGdMU0woc77MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98536840"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="98536840"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 23:52:06 -0700
X-CSE-ConnectionGUID: Wmo/hLY9TVOKTT5iQ+30nA==
X-CSE-MsgGUID: c/E8q47PQtyQ9arsJUYhEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="268073434"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Aug 2026 23:52:01 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wz7UM-0000000077T-0xzT;
	Wed, 26 Aug 2026 06:51:58 +0000
Date: Wed, 26 Aug 2026 14:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andrew@lunn.ch, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, daniel@makrotopia.org,
	naseefkm@gmail.com, joey@tinyisr.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: Re: [PATCH net-next] net: phy: mediatek: add driver for EcoNet Fast
 Ethernet SoC PHYs
Message-ID: <202608261446.DGUqZP2A-lkp@intel.com>
References: <20260825180421.1804729-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825180421.1804729-1-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_235206_925376_A0945BA4 
X-CRM114-Status: GOOD (  10.05  )
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

Hi Caleb,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Caleb-James-DeLisle/net-phy-mediatek-add-driver-for-EcoNet-Fast-Ethernet-SoC-PHYs/20260825-180421
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260825180421.1804729-1-cjd%40cjdns.fr
patch subject: [PATCH net-next] net: phy: mediatek: add driver for EcoNet Fast Ethernet SoC PHYs
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260826/202608261446.DGUqZP2A-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260826/202608261446.DGUqZP2A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608261446.DGUqZP2A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/phy/mediatek/econet-fe-soc.c:184 function parameter 'phydev' not described in 'poll_cal_complete'
>> Warning: drivers/net/phy/mediatek/econet-fe-soc.c:184 function parameter 'ctx' not described in 'poll_cal_complete'
>> Warning: drivers/net/phy/mediatek/econet-fe-soc.c:233 function parameter 'phydev' not described in 'en751221_fephy_cal_cycle'
>> Warning: drivers/net/phy/mediatek/econet-fe-soc.c:233 expecting prototype for poll_cal_complete(). Prototype was for en751221_fephy_cal_cycle() instead
>> Warning: drivers/net/phy/mediatek/econet-fe-soc.c:184 function parameter 'phydev' not described in 'poll_cal_complete'
>> Warning: drivers/net/phy/mediatek/econet-fe-soc.c:184 function parameter 'ctx' not described in 'poll_cal_complete'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

