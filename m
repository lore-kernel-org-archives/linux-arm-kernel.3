Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34373D3610E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 19:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rJ8OjMarO1f0kXcMSe37gM44KQQpMZTNvMWqhkN6Zw=; b=O+bCzUP/voxKPq7qVAtj2jAinr
	1cCMAsKNYy/DHhPf06fwGJDZvt20zx4GQtDOCxaXyvjdAQAZEhWZ7SA2K92F78AH18A194YgofSlK
	UeBtcemKZ+EB97bvTisbg+T5I9j8RsWdJo9jHgQOAfxPVTBvFrl6G8g40cBBlH/G0vTeZNgLtkOgP
	Bqa9KFNW0fJP9gFvc5C2QbflA2yIhpOf+MZkMXlwgoFTf8Kp14/82RlrIokTbmacwssIiRQ5L+jGg
	nEubrma3nD+oO/6gSplLgUR9QpzI8akm+lduCMxWrzYYsS5FbjMkKNnoPStp99k96BVsmvKo+bgTh
	HORQ6F8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8P3Z-00000000Wwt-020V;
	Tue, 05 Nov 2024 19:17:37 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8P1p-00000000WkB-3Far;
	Tue, 05 Nov 2024 19:15:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730834150; x=1762370150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9Shq7F5zshytH1TIeEjlYPA2wyJYy7tpdhCPane9pqc=;
  b=ctzZ44VX4zU6Qfsml76ta/k2S/NzL2yg/UO/ADcCFZ4E8S2zF8Za89Vh
   fZnrBy2AUWSbFROel5SZmi5y/fPdh1IyvH3yH+sNMEj5xcnxylSqpdGNL
   F2HG4lB0w3vG87PROcZ4EKjWm72B2EpGePbEGtgbeRo5G//Ix9jGXZuYe
   ePW0KLpaHVgsHvwwrXw+atvLLkRxScuEcqSjoYAASI7M/+6AcP0oY+wwJ
   RO6kBGcFJtRk36rjWjtLuXw/XA8v1iaYI9TR2XcOLDxf2ctKvNzmz4CLh
   5uJH/RaoBwCtqj4p8lzw1NNi/DYYm00vcZVZ9WZz8+yAiFyIamO9VmPQv
   w==;
X-CSE-ConnectionGUID: PDzMDsMLTG+VDGVrPd2Czg==
X-CSE-MsgGUID: GxV1dDzzRcS0xnj2noXVZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42001998"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="42001998"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 11:15:47 -0800
X-CSE-ConnectionGUID: wR4K5R08S7SJ1rmt0i2Ouw==
X-CSE-MsgGUID: ktw9GgY6Tl2VnQ74Ya5blg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="84248501"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2024 11:15:44 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8P1h-000mNN-2I;
	Tue, 05 Nov 2024 19:15:41 +0000
Date: Wed, 6 Nov 2024 03:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>, vkoul@kernel.org, kishon@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, quentin.schulz@cherry.de,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	heiko@sntech.de, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v2 2/2] phy: rockchip: Add Samsung CSI/DSI Combo DCPHY
 driver
Message-ID: <202411060336.yBL7jGAs-lkp@intel.com>
References: <20241104111121.99274-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104111121.99274-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_111549_908903_6E50CB76 
X-CRM114-Status: GOOD (  13.07  )
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

Hi Heiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on robh/for-next linus/master v6.12-rc6 next-20241105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/dt-bindings-phy-Add-Rockchip-MIPI-CSI-DSI-PHY-schema/20241104-193646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20241104111121.99274-3-heiko%40sntech.de
patch subject: [PATCH v2 2/2] phy: rockchip: Add Samsung CSI/DSI Combo DCPHY driver
config: m68k-randconfig-r113-20241105 (https://download.01.org/0day-ci/archive/20241106/202411060336.yBL7jGAs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241106/202411060336.yBL7jGAs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060336.yBL7jGAs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:1630:34: warning: 'samsung_mipi_dcphy_of_match' defined but not used [-Wunused-const-variable=]
    1630 | static const struct of_device_id samsung_mipi_dcphy_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/samsung_mipi_dcphy_of_match +1630 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c

  1629	
> 1630	static const struct of_device_id samsung_mipi_dcphy_of_match[] = {
  1631		{
  1632			.compatible = "rockchip,rk3576-mipi-dcphy",
  1633			.data = &rk3576_samsung_mipi_dcphy_plat_data,
  1634		}, {
  1635			.compatible = "rockchip,rk3588-mipi-dcphy",
  1636			.data = &rk3588_samsung_mipi_dcphy_plat_data,
  1637		},
  1638		{ /* sentinel */ }
  1639	};
  1640	MODULE_DEVICE_TABLE(of, samsung_mipi_dcphy_of_match);
  1641	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

