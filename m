Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7377CC71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMGyN+/JJ9AY9kzdwHxf6TDJdXcMkPu4TkVyhOpjjNo=; b=fJX73x2oQxbNpMzsgz515mvfzk
	igv7NSVT9jNzJ09cavp3HnzBJNUcyv2WpNAOMKpQ676NM8kwMCrfY0IFAzxfOL4XkIZUfydwao0JU
	QdV+hMbWFJFdAEu+u8MndBsBljfSQpbde1ryN0KdKyPqGZ7r76VN8DDVOGjgiH3P74H4nczMiBrGm
	99Q0psfFjopr+rGRr2nPmDrljDr1jq+dhvnCzdMt5NIQYya8+zErefrvRr/TmGnau+EyrlxCABuGC
	Po86fzpGRM/z22CTascWhHWXBJbQy/BdlVoAiNAB2h+agUa4nq7WIa221I/MJBqZUNu8Y9aYvZh0E
	bURnnjyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUbV-0000000Be9s-337H;
	Wed, 11 Jun 2025 23:11:33 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTnN-0000000BSXF-1F39
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749680385; x=1781216385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wdxumVoCLJh+JMH/3Nh+7BhbG0x4FmGjuT4dteTeG34=;
  b=k+AZrdtkABy9GhzRskkDzRXfa11KOV7AODWSksh83R9qglTmPFHhxZ//
   9tUxYZUiT+cd73Bm4y+2T27sJKmEKS/pktQfC2dcMieos8ePMEawDqfXq
   OiQBfJ1Pf31F5A4u66RKUys16s5mGJD0HkuNKdqeV7ekbQCLxUZeivIzN
   J49Qw8upx1OdCUT0twirzXuEEtxfoi3u2KSH46MhKP3eswpHSyxOW0Gxe
   X85K5ptTGTgfNKPhCHgpGIKYWHmW1D1vzwU6P0nU/jmJ97ye1rqqhwMBi
   o+X4Yf0Zvkdjy6t6AJIOLgNTug6+ybebekXUSk7H17II+bkO64cbdmk02
   A==;
X-CSE-ConnectionGUID: mU8Kb8MBQoKOmhn7354dyg==
X-CSE-MsgGUID: QOzccanLRGq3VtyXwSOs6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51717617"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="51717617"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 15:19:45 -0700
X-CSE-ConnectionGUID: n3Gn2FfVQuGQfZa8mq2jOw==
X-CSE-MsgGUID: 5nLAmQBUSYWRx003nnH4eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147315997"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2025 15:19:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPTnE-000Ati-1g;
	Wed, 11 Jun 2025 22:19:36 +0000
Date: Thu, 12 Jun 2025 06:19:16 +0800
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
Message-ID: <202506120616.NvIbQEgS-lkp@intel.com>
References: <20250610233134.3588011-8-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610233134.3588011-8-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_151945_368318_B0777351 
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
config: alpha-kismet-CONFIG_OF_DYNAMIC-CONFIG_XILINX_AXI_EMAC_PCS_COMPAT-0-0 (https://download.01.org/0day-ci/archive/20250612/202506120616.NvIbQEgS-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250612/202506120616.NvIbQEgS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120616.NvIbQEgS-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_DYNAMIC when selected by XILINX_AXI_EMAC_PCS_COMPAT
   WARNING: unmet direct dependencies detected for OF_DYNAMIC
     Depends on [n]: OF [=n]
     Selected by [y]:
     - XILINX_AXI_EMAC [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && HAS_IOMEM [=y] && XILINX_DMA [=y]
     - XILINX_AXI_EMAC_PCS_COMPAT [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && XILINX_AXI_EMAC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

