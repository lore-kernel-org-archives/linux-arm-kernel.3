Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE8FC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 03:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWNCbeBKvxxOUbIvlFwqhkFW85ttwZ/2J/QVGWuOg30=; b=UTtPMtgKX3vSaJKX09Fbyth8/Y
	g0aXIFtnOYBWcaZswsHLh5Hib2qSo1v+iMwyTtjYdIz5JvzlBwiHlfZ9urBi4Z0Gjmz6WkZz2AMTC
	0mRf1Yf4BlEUaVjCi9tkNGpyVviHRumE5iEvmiO0xaXZ0Lz/Kn1/qoILXoxcY6F04NNSud78vo4Ud
	HWcDyQta87emy+MA6NqrNZv+1Dru25yPXyV9dnHg1ErRti/WfxK8DZ5RN+pWB/GXu5BLm4zn8Nwv2
	aNNWIIj9rgZKFI3jUAiiB1cysb11B8weXh9zueQglDwYRO00WlRxj84Uudml57Ta4f0g83bv3XwbJ
	FB8BOR/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYF8-0000000C2Fc-0ZK5;
	Thu, 12 Jun 2025 03:04:42 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVar-0000000Bljw-0taz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 00:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749687297; x=1781223297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3+i/qQYgvBYTLJ9rk46HeDginwQWUDS8zT4mmWEEUrE=;
  b=hnFPhapWb3bF8EcweI5rpHeprV0XMdvGfBxeDYYWheOFwJKlM7qk/6xZ
   FHrvAWAcisfBGHUJNIYAZY6X65FAG+g20IITEgoXPPQzxiaHnGLwCY5/W
   413mn9TbuPmFYVL3b0pBU2/GYl0gRutlfY9cXmJe52xbTEg5FEJuvoAot
   rSxomsBZfzc6BxajarHn9M4K1SxqM7C+t6S8kwoEwtXwlhgYUxKV+286h
   6H7SiPnxa/SuNlJ8OcIe7y+lbAHFsLGuuAFeIVO4xGJlOSfuiVOQmduDC
   uKs2lvNw5ZIODMh3pmRIhrbr7dlNL9/07NCC49Wg/LAyD4pMRQgvgwaHW
   Q==;
X-CSE-ConnectionGUID: VPEtjox7SbiWjMZ5xskgIw==
X-CSE-MsgGUID: YqLAweYuT4S/WAXWJ5Catg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51727357"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="51727357"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 17:14:53 -0700
X-CSE-ConnectionGUID: 1f0u85CwQt2U7n5U0sxH2w==
X-CSE-MsgGUID: +x7J175lRBSblLkppAz+cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147842871"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jun 2025 17:14:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPVae-000Ax0-2r;
	Thu, 12 Jun 2025 00:14:44 +0000
Date: Thu, 12 Jun 2025 08:14:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org,
	Kory Maincent <kory.maincent@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Simon Horman <horms@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lei Wei <quic_leiwei@quicinc.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Robert Hancock <robert.hancock@calian.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [net-next PATCH v6 06/10] net: pcs: Add Xilinx PCS driver
Message-ID: <202506120722.o7HB1e60-lkp@intel.com>
References: <20250610233134.3588011-7-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610233134.3588011-7-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_171457_295675_197DAE76 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/dt-bindings-net-Add-Xilinx-PCS/20250611-143544
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250610233134.3588011-7-sean.anderson%40linux.dev
patch subject: [net-next PATCH v6 06/10] net: pcs: Add Xilinx PCS driver
config: sh-kismet-CONFIG_COMMON_CLK-CONFIG_PCS_XILINX-0-0 (https://download.01.org/0day-ci/archive/20250612/202506120722.o7HB1e60-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250612/202506120722.o7HB1e60-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120722.o7HB1e60-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for COMMON_CLK when selected by PCS_XILINX
   WARNING: unmet direct dependencies detected for COMMON_CLK
     Depends on [n]: !HAVE_LEGACY_CLK [=y]
     Selected by [y]:
     - PCS_XILINX [=y] && NETDEVICES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

