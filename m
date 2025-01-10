Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8BBE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 06:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZRigOy3wOFK0E6oGPoU0IDq2GanbKGIXsBlMZguoUM=; b=KA7EDlvmvOkXZdxg7BMyaS72E+
	8im5UM1wXMF1szMGmozHUTQaTCQHVnD7sDAkjqII6RSKyCw7xPKDTfbgutacmtuwdocixs7wzgN53
	Um//uPRUbdcpsEc/QkGDoNyN+N+bb0j+/eAouLfa+7a1TYJ+sgps0VzTefXMVZ04kicaOklkEBayU
	1APckscZ1XCeXmTbZ1gbx8boT1nQLjT5vMogKHrdli3oT7Rh6Q/fORd3ON0qBUOwyzKqawl9Xbslp
	a5QCnxBUf8OLXjskm9HlLpkayPCIG+FOf3ae2X9fgAyTlUM7+8SgDA3TSjGxBsI5A9bvT5ebMh4LR
	pRRguTZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW8jo-0000000EHzU-324V;
	Fri, 10 Jan 2025 06:43:20 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW8SE-0000000EFGr-02It;
	Fri, 10 Jan 2025 06:25:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736490310; x=1768026310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JNRPGPlyUeOYSMCCIReZWx4/A6kB9kI6sWqUW61ccvw=;
  b=TrRQAGzHvOMgWCztTO/KbSoJ/AZRM7l/rpGUR0V80bQwNp4TEhdj2JOv
   90FHuwvsXUdaEdjSah0tNuMlw5/1wuv90Uqryx7ElAsFV4P5ArIQCFUbY
   SgwATqSwzBlp4ZKlelnXnn6ufkQGXAPzsUSoj/GMNEd+OnprQiR/ynosD
   f/Ntd9Xn37EduKW8fQvJGRgWJ50McULu9pO0WbAeei+YNZzt209KGI/IC
   n7KKGZAcQIpgnnHrkutvzXMt0Ft2bP1U4DUe82kQuoQxIYNg4lkSZq4TL
   J1EvkP30TwEMHscUzbLqh8hw/ZYwTWGjGERvIw+GuIkKtSTE27qFFMZb+
   g==;
X-CSE-ConnectionGUID: lkzMIbzQSc+S0KLtQxqv0w==
X-CSE-MsgGUID: 4aDPTHRbQmq1H6yjUp3wWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36935802"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36935802"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 22:25:07 -0800
X-CSE-ConnectionGUID: wHSmfOucTXOWrcz09KdPMQ==
X-CSE-MsgGUID: hPBfvydBS6uD27k00ZqUVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104162427"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jan 2025 22:25:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW8S3-000IdZ-36;
	Fri, 10 Jan 2025 06:24:59 +0000
Date: Fri, 10 Jan 2025 14:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: Damon Ding <damon.ding@rock-chips.com>, heiko@sntech.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
	vkoul@kernel.org, sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
	dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com,
	hjc@rock-chips.com, algea.cao@rock-chips.com,
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v5 07/20] drm/rockchip: analogix_dp: Expand device data
 to support multiple edp display
Message-ID: <202501101445.xlso2z73-lkp@intel.com>
References: <20250109032725.1102465-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109032725.1102465-8-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_222510_083840_9613AD5A 
X-CRM114-Status: GOOD (  11.12  )
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

Hi Damon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on robh/for-next drm/drm-next drm-exynos/exynos-drm-next linus/master v6.13-rc6 next-20250109]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/phy-phy-rockchip-samsung-hdptx-Swap-the-definitions-of-LCPLL_REF-and-ROPLL_REF/20250109-113114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250109032725.1102465-8-damon.ding%40rock-chips.com
patch subject: [PATCH v5 07/20] drm/rockchip: analogix_dp: Expand device data to support multiple edp display
config: hexagon-randconfig-002-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101445.xlso2z73-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101445.xlso2z73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101445.xlso2z73-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:60: warning: Function parameter or struct member 'reg' not described in 'rockchip_dp_chip_data'


vim +60 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c

8f0ac5c4835291 Yakir Yang 2016-07-24  50  
d9c900b0270a18 Yakir Yang 2016-06-29  51  /**
d9c900b0270a18 Yakir Yang 2016-06-29  52   * struct rockchip_dp_chip_data - splite the grf setting of kind of chips
bbb8c3102ebf3b Damon Ding 2025-01-09  53   * @lcdc_sel: grf register field of lcdc_sel
d9c900b0270a18 Yakir Yang 2016-06-29  54   * @chip_type: specific chip type
d9c900b0270a18 Yakir Yang 2016-06-29  55   */
d9c900b0270a18 Yakir Yang 2016-06-29  56  struct rockchip_dp_chip_data {
bbb8c3102ebf3b Damon Ding 2025-01-09  57  	const struct rockchip_grf_reg_field lcdc_sel;
d9c900b0270a18 Yakir Yang 2016-06-29  58  	u32	chip_type;
26f1f37804f0d4 Damon Ding 2025-01-09  59  	u32	reg;
d9c900b0270a18 Yakir Yang 2016-06-29 @60  };
9e32e16e9e989f Yakir Yang 2016-03-29  61  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

