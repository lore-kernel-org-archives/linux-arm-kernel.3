Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A9ED1BDE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 21:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/TSQb2lwM76VzQuHis0KjwfYuyQ33C5MCHOseVLNrU=; b=jhusHglIbHYMQUZqI6WU0hniRv
	UxqsP2AGJ1EtL3+pongwID/kW6nQLUayHd+FPu9WnqGu+2LVg5FQbZQB+cLt9Dq9tN/GXU5aeXaQl
	H9FTNzE2YDzpfhBgG9onT7rjaHeOpatuc/AWuqFS+RjihC0z6TAjhZuM3HNIXgxyry0ErqVweztSA
	/7y9624zYq1HB4nnc4Z/lfD8JhEr490aYQRnYNaaikKr71EYMURHq4c82UBcCekiBZdCPO8CZAqAi
	RAlmDGMVoXgrb4fbtSrz+RH4MXg/zPeIQBQ/bDtTaT7ZZZmQPygvOHZBgGh1I5+nqCZ3dGPhQaGWJ
	ihRTcuEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuL4-000000078w7-2LUG;
	Wed, 03 Dec 2025 21:24:42 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuL1-000000078v9-43iX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 21:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764797080; x=1796333080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0TehpwgFZ2L8M4iWs7xHgPxQr72Xb7Q3ZhPC0FXXTEo=;
  b=hclVrvkN72G9Zoh2SI4BnIPxQUjkglM/PGK1OfV0bTzfGUxejnjhDW3y
   XilRIfVhJTGg2eiq0pgwGjzPqRNR66i+UD+J/wbG0z9unECYLzCdPb3o9
   mzolXnGSvNh/qlc9M7kMxFu7s1MZQHWIsd9cDShgsRV8pMIPOcl3FIfjM
   4KX54PqzDF8UWwbXHHmwFHlsY5dICm9cvLHVexVPmMD0RG29zo7Bj1u6L
   VwHPj3HZ3Uj7ZWvyzuZMs+PLhaAprrFFnghJY18gTzDy0tQYmvgJ0R4aQ
   wUxlO5gqfYM65Tnk93qKPYIDg6Bp0kdqQVbEtgop6aUQvSAnseZDYoSjc
   Q==;
X-CSE-ConnectionGUID: d1gve/E5Q1yeUvzb0ttH5A==
X-CSE-MsgGUID: 9tT8PwxaTWKoFWFITOG++A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65806349"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="65806349"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 13:24:37 -0800
X-CSE-ConnectionGUID: uz3TUeTUSdeOiDsdaabYbA==
X-CSE-MsgGUID: Zf8w5r/eR8+XlNXN/lfV6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="194716772"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Dec 2025 13:24:34 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQuKt-00000000DAL-1ZRz;
	Wed, 03 Dec 2025 21:24:31 +0000
Date: Thu, 4 Dec 2025 05:24:24 +0800
From: kernel test robot <lkp@intel.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
Message-ID: <202512040546.yLIh1wBH-lkp@intel.com>
References: <20251203-csi_formatter-v1-2-eb9e1147b49e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-csi_formatter-v1-2-eb9e1147b49e@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_132440_021907_69BD8B22 
X-CRM114-Status: GOOD (  12.16  )
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

Hi Guoniu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1f2353f5a1af995efbf7bea44341aa0d03460b28]

url:    https://github.com/intel-lab-lkp/linux/commits/Guoniu-Zhou/media-dt-bindings-Add-CSI-Pixel-Formatter-DT-bindings/20251203-143208
base:   1f2353f5a1af995efbf7bea44341aa0d03460b28
patch link:    https://lore.kernel.org/r/20251203-csi_formatter-v1-2-eb9e1147b49e%40nxp.com
patch subject: [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20251204/202512040546.yLIh1wBH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040546.yLIh1wBH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040546.yLIh1wBH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/nxp/imx9-csi-formatter.c:763:12: warning: 'csi_formatter_system_resume' defined but not used [-Wunused-function]
     763 | static int csi_formatter_system_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/nxp/imx9-csi-formatter.c:758:12: warning: 'csi_formatter_system_suspend' defined but not used [-Wunused-function]
     758 | static int csi_formatter_system_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/csi_formatter_system_resume +763 drivers/media/platform/nxp/imx9-csi-formatter.c

   753	
   754	/* -----------------------------------------------------------------------------
   755	 * Suspend/resume
   756	 */
   757	
 > 758	static int csi_formatter_system_suspend(struct device *dev)
   759	{
   760		return pm_runtime_force_suspend(dev);
   761	}
   762	
 > 763	static int csi_formatter_system_resume(struct device *dev)
   764	{
   765		int ret;
   766	
   767		ret = pm_runtime_force_resume(dev);
   768		if (ret < 0) {
   769			dev_err(dev, "force resume %s failed!\n", dev_name(dev));
   770			return ret;
   771		}
   772	
   773		return 0;
   774	}
   775	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

