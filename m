Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58B3C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 21:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5XzMv+8i/tGR0v/5VTcsly1t4bB+llskpYgDn0DxQo=; b=0s+PDziLG2gFvC+d+iIvbwGVB7
	ZhfPDOciMP7ahMkYvyBti4SQhDqfS9o/SDG67Id085W8q1dgPfEs8cr73YNdIW740MR79IqjxOc3r
	kMwtEuSfUUBFgYBvZ/cl570XLJBgjxstPq+AfFlmsMJh4CNh+wZ35AmGkrZlF60JFhuke1xqwy8Sl
	9cGptyYsU7z69P75d9oGe7awfhvq9aaX3RgHWjx9+gXm2+Upux9UNMhBwgl3bPH8PGn6JAAdJFXyM
	DScEP2GkMwilj+mEvBYldfistKTm8rrxPTeWS/s1BuD8/VGaxatSJpz3AVyBN6rsayGj0M+Ge4eHF
	p95jHASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbRKS-0000000FYUb-0VxE;
	Fri, 24 Jan 2025 21:35:04 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbRJ8-0000000FYPr-3sIm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 21:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737754423; x=1769290423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZV+CoJSZ+wVV/344CBzff1eeJ9Hjk9q/8p3TD4Hsxtw=;
  b=XLdGDw13Y47ckAPGhYtgzC2Fjuj+85ZTZOuwXdDzlRDueh3D9owKG/rI
   kkdWGA5NR/skDse6t3MshfRtM4nYg3t/kesWfCqjvYBmQu+Z6a3fhCLP/
   RnI7eCBobElhBanloHddfZ9i9yOT0Ry7KsWJH1/1NjM7gJklH2xJHeyUh
   V9YHz3FKJ4VrqRBIphQvbRCtj6KfMq7kIeA9NGfj7+2prFO9mgeHsmCAz
   VLWSO5kzA5XvEjQSOFfyRRhHWnkr3A1i9BDgbjNkjLRGsWpSTZxAkpDkF
   lKxVD+BwHcu+WTpRijkbmvlL0eC3oSbvY3W0MMCVbRA7Jm5ukGEOHDMz6
   w==;
X-CSE-ConnectionGUID: d/MG9pkvSiKalvDoMxA9Lg==
X-CSE-MsgGUID: qlRSrek2QRat92+IbKOc3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49718513"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49718513"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 13:33:37 -0800
X-CSE-ConnectionGUID: g4+/9ZLtQsOQaUV3ZgoZ4w==
X-CSE-MsgGUID: CHXgLetET/Spk4p+CUHLlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="107782823"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jan 2025 13:33:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbRIw-000d9T-2h;
	Fri, 24 Jan 2025 21:33:30 +0000
Date: Sat, 25 Jan 2025 05:33:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/3] clk: scmi: Support spread spectrum
Message-ID: <202501250520.evxxfDdY-lkp@intel.com>
References: <20250124-clk-ssc-v1-3-2d39f6baf2af@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124-clk-ssc-v1-3-2d39f6baf2af@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_133342_974429_142D0C40 
X-CRM114-Status: GOOD (  12.05  )
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

Hi Peng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5ffa57f6eecefababb8cbe327222ef171943b183]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/clk-Introduce-clk_set_spread_spectrum/20250124-212050
base:   5ffa57f6eecefababb8cbe327222ef171943b183
patch link:    https://lore.kernel.org/r/20250124-clk-ssc-v1-3-2d39f6baf2af%40nxp.com
patch subject: [PATCH 3/3] clk: scmi: Support spread spectrum
config: i386-buildonly-randconfig-005-20250125 (https://download.01.org/0day-ci/archive/20250125/202501250520.evxxfDdY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501250520.evxxfDdY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501250520.evxxfDdY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/clk-scmi.c:298: warning: cannot understand function prototype: 'const char * const scmi_clk_ssc_allowlist[] = '


vim +298 drivers/clk/clk-scmi.c

   286	
   287	/**
   288	 * scmi_clk_ops_alloc() - Alloc and configure clock operations
   289	 * @dev: A device reference for devres
   290	 * @feats_key: A bitmap representing the desired clk_ops capabilities
   291	 *
   292	 * Allocate and configure a proper set of clock operations depending on the
   293	 * specifically required SCMI clock features.
   294	 *
   295	 * Return: A pointer to the allocated and configured clk_ops on success,
   296	 *	   or NULL on allocation failure.
   297	 */
 > 298	static const char * const scmi_clk_ssc_allowlist[] = {
   299		"fsl,imx95",
   300		NULL
   301	};
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

