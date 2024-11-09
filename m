Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2115AD5E361
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 09:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+c/PugqOTmJ2p/ZdOxRSvEvy9P2IHMT+zvmaGgSLhQ=; b=PQQcyo4zlLDe3DuSMiH58qPFPI
	JWQq2UpQVKiW+6FwqKcBfSs+6tHdUjlS3Qoqz1W0zqEOvGiut62168p3ksb9fd3DgXrQWH6Wva6l/
	AsYqwD0ZiPEpOZolZq6JpWyGW5KakVDpVjShdpV0t1Y4o2nKzkiUR0nljhs4zED1DvA8D0EimmJg3
	64ruPGORXMB/aboQMy9BmAORHybU9wIDVlAOjp9ap7BhdK34r2dfbV1USdRiQWIbVqn9FcTCIhsv+
	fFq24QL55YWgJUtykEX+2BGn7orPInQx5p7aM09n0JB2YTXpYMfwO18xxADMx6UJJwDm6pBy42ey7
	CCr0Tp5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9hjD-0000000CykH-1kvE;
	Sat, 09 Nov 2024 09:25:59 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9hh4-0000000CyYn-1BQc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 09:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731144226; x=1762680226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NWdc6EMsUXB5/nOupnFQ13csT4S7r9lLYnX2BdCkLTc=;
  b=L+hXbHPzf3IQUWX41uNqpbsZz3kl2SNdGUHtpHixiT8fbjVZ+iC8AgBh
   u2No9yCjbgUhTSCMY3hyO9mVPGP7+zDEII7tbYt5MILv0hMs4ISuHhRED
   7vv+grQ75DItPLcFZ08Xr4eoSv4ZLipEQ3NJQUJFAmYN2DiHGRYwIzpNm
   siuQJR5DB6PquCGwBAqOYwKWVU9WE9E9kC+a5AbrDHLMs4TpzztXdG1np
   dJXaXYG8vdi2Au3BlDAvGSlAiJZFBZoGinKTeUMBPnvY/thYR5vaEEtY0
   ASe7wAiqLNcNNp48bsNASNn7sUFZ9mWGN7ZYlrhy2blBbchzWB9+/oOmJ
   Q==;
X-CSE-ConnectionGUID: 7BJcu3dkR3atWZ5PI7Ou0Q==
X-CSE-MsgGUID: eq0gkom1SqaGZU+LLR9OHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34710215"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34710215"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 01:23:45 -0800
X-CSE-ConnectionGUID: WPJGY4SmQYexEQ3sCXycWA==
X-CSE-MsgGUID: YQftMoKgQumenDTFwfWP/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="116837805"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Nov 2024 01:23:40 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9hgv-000sFU-2j;
	Sat, 09 Nov 2024 09:23:37 +0000
Date: Sat, 9 Nov 2024 17:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux@armlinux.org.uk,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, varshini.rajendran@microchip.com,
	dharma.b@microchip.com, arnd@arndb.de,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, manikandan.m@microchip.com
Subject: Re: [PATCH v5 2/4] drm/bridge: add Microchip DSI controller support
 for sam9x7 SoC series
Message-ID: <202411091737.48zajeBW-lkp@intel.com>
References: <20241106093429.157131-3-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106093429.157131-3-manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_012346_422968_851F1A75 
X-CRM114-Status: GOOD (  12.32  )
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

Hi Manikandan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on drm-misc/drm-misc-next linus/master v6.12-rc6 next-20241108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikandan-Muralidharan/dt-bindings-display-bridge-add-sam9x75-mipi-dsi-binding/20241106-173638
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241106093429.157131-3-manikandan.m%40microchip.com
patch subject: [PATCH v5 2/4] drm/bridge: add Microchip DSI controller support for sam9x7 SoC series
config: nios2-randconfig-r133-20241109 (https://download.01.org/0day-ci/archive/20241109/202411091737.48zajeBW-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241109/202411091737.48zajeBW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411091737.48zajeBW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c:532:24: sparse: sparse: symbol 'dw_mipi_dsi_mchp_driver' was not declared. Should it be static?

vim +/dw_mipi_dsi_mchp_driver +532 drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c

   531	
 > 532	struct platform_driver dw_mipi_dsi_mchp_driver = {
   533		.probe		= dw_mipi_dsi_mchp_probe,
   534		.remove		= dw_mipi_dsi_mchp_remove,
   535		.driver		= {
   536			.of_match_table = dw_mipi_dsi_mchp_dt_ids,
   537			.name		= "dw-mipi-dsi-mchp",
   538			.pm		= &dw_mipi_dsi_mchp_pm_ops,
   539		},
   540	};
   541	module_platform_driver(dw_mipi_dsi_mchp_driver);
   542	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

