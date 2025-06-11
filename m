Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C405C71141
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PurUogPz4UY7qDnTVjFb+to1h8SXtAe0afH2UVF/ugI=; b=ZtlDqhdHhf9B2UbXE/7Z9TaB+9
	VefE1WA4aIyfxH0h2+G9ymqr1BsZoA3rlQ22GrIA4hkML2ChSsxbICNjSKQyMJzbZDQK6/qgi1M48
	7XoKP81fu5bzP+mw/FyQhcDS9aT5EA0M/Tqq8xPh7HZBFMis1vHZIGo+a9dB+0SnusoAuEBjIL4Iz
	YcA9luboOxWc6QRtNz9gDhiNP2LU4O/ldPV6tQA/02gg3hAuRqq8J5qZHU5RpeR9woyo+yUJKVXYM
	IgOcrzYwf+AP5YHU4I68Npups93t6DTy8CYX0dWcE4d8s/G5SABevf2F/7qkO58+h9c0l/SaLhsv/
	JyGrA4Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTzC-0000000BTsb-3gKG;
	Wed, 11 Jun 2025 22:31:58 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSVv-0000000BEJj-2xd6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 20:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749675459; x=1781211459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dWBcdnJcsF1wZyPPcP5u/i5J0eHQX2+KLoffvskyitU=;
  b=F59lHlMMV/A+y7olCRBcQILSBn9OH3xcCABpimxcKrIuXKQG/+ReAMcP
   kXLUCGN6u6i8yb1+Q5xbYI0mTBSXmEaf6orN/5qVhCbziB9WU0uJ/hw1m
   fJL50vy+cXAlPomcIrfvLGrG3YynU5CK0aDX2grN/7b6Z5kUEYFcMiyIc
   M4NKu8ivrnKLpOWansAtBObackRXLYGkaiG2MQc6w2HUXqjqVS04hTDvk
   c9PFErAQ8EtuwLSBAk7Vv1t/dHLsuH8LdQMnq8fytQMTgJo22R5OYt8ji
   0wVmER8hhtueTSxDxOkYFpR9LQDhdlNB9EuRBmLw/PGMruH344FDfr+/2
   w==;
X-CSE-ConnectionGUID: fcC34RRZT02tFQKU8qdEFw==
X-CSE-MsgGUID: rmkzVx+kSlOHBJDbxEdvew==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51931398"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="51931398"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 13:57:38 -0700
X-CSE-ConnectionGUID: wueuEkXlQKapcrFcczwfJA==
X-CSE-MsgGUID: s3VAqUaqSlmh/sgJgx5fHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147178731"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jun 2025 13:57:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPSVm-000ArO-27;
	Wed, 11 Jun 2025 20:57:30 +0000
Date: Thu, 12 Jun 2025 04:56:40 +0800
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
Subject: Re: [net-next PATCH v6 07/10] net: axienet: Convert to use PCS
 subsystem
Message-ID: <202506120442.emFFyhZj-lkp@intel.com>
References: <20250610233134.3588011-8-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610233134.3588011-8-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_135739_752183_A0B0E733 
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
patch link:    https://lore.kernel.org/r/20250610233134.3588011-8-sean.anderson%40linux.dev
patch subject: [net-next PATCH v6 07/10] net: axienet: Convert to use PCS subsystem
config: alpha-kismet-CONFIG_OF_DYNAMIC-CONFIG_XILINX_AXI_EMAC-0-0 (https://download.01.org/0day-ci/archive/20250612/202506120442.emFFyhZj-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250612/202506120442.emFFyhZj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120442.emFFyhZj-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_DYNAMIC when selected by XILINX_AXI_EMAC
   WARNING: unmet direct dependencies detected for OF_DYNAMIC
     Depends on [n]: OF [=n]
     Selected by [y]:
     - XILINX_AXI_EMAC [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && HAS_IOMEM [=y] && XILINX_DMA [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

