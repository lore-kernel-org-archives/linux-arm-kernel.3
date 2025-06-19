Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F33C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 05:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHQJh91PGchVv9izvCUQ6fZEw76Gtl1/pclZ1it05SA=; b=KZmg520XssHxXfKOCol6x5Bvxs
	BCGlsQiyIJB6Rr9CBbMrxysPC0jwG2Glc5484bJZGQMAosGpFK8BYIE+giKnJ2rr34bjklVsgMR/K
	BuIlI9mu5rCUVZIxRzl710R9wp0v+3SSMsCaaHKEx5R1P13Y+c7MOT0G/5/cbfBFVkXYG51uwALtP
	QTGPIBya9x9tI/wxd1EmJbScx2/7DVLQgg6TxfgBBX2X2O+Vjh5tI3knmxO2gdXa5VuX7BzbTHJ94
	Wf2YG+FlDo121nUakkojqJHMsfDrQssRQH9xhxzofIFcmbUzHou7bGRees7C7+Cltw8v7ATvyGMY5
	j6QPKD7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS7cg-0000000C2aq-1CqV;
	Thu, 19 Jun 2025 05:15:38 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS7aS-0000000C2Tv-0Jro
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 05:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750310000; x=1781846000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DaAeSgOKa5+ihHQK/CsgUn/s98z+5cTpCLLRShbyFBw=;
  b=Zfy31nN9MHw3L0mIATnEFVR4voSy9wYFRBGONp0XWrZPXcmbufLvM9t8
   tWZ19ACVMcOgma+pbhJ9G5a7ELuE6sNGm21MIS2qUf0M09vejP4uYOwQR
   B7sWBpPTuyXt1ZcDF1wO1G1HwPCS6FB9WCC+5WHxCr/wMIbQBMRCN/AUJ
   nlt0vRsjMEdtMmkQnLNgWPMkz/TBlVtZguYpPA2KNQbpOmKTavbIJAyHL
   d3yg3lYzvMvtv3w3+XlahCLKtcyi0U/FeMR3rV45ICDWbqXhdoQbhC63t
   bMgugQxL7GKb8go1e/OJAskcCqwvyShA3KqhMqbhTi/QvDE2zlHuK8+4f
   g==;
X-CSE-ConnectionGUID: SP8CR55PQNGyo01Ged4s2A==
X-CSE-MsgGUID: roPg/rmTSq6LPpUVL/KSpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="51784194"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="51784194"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 22:13:19 -0700
X-CSE-ConnectionGUID: Iy8XfeYmQ6aW1bvPafNrJw==
X-CSE-MsgGUID: cOabNmcPQp+yFRjQVpbmpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="151106260"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Jun 2025 22:13:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS7aJ-000KQE-1E;
	Thu, 19 Jun 2025 05:13:11 +0000
Date: Thu, 19 Jun 2025 13:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
	danielt@kernel.org, jingoohan1@gmail.com, neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, sven@kernel.org,
	alyssa@rosenzweig.io, neal@gompa.dev, deller@gmx.de,
	support.opensource@diasemi.com, duje.mihanovic@skole.hr
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 12/12] backlight: Do not include <linux/fb.h> in header
 file
Message-ID: <202506191230.WMfb29QM-lkp@intel.com>
References: <20250618122436.379013-13-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618122436.379013-13-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_221320_127031_50090B34 
X-CRM114-Status: GOOD (  11.64  )
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on v6.16-rc2 next-20250618]
[cannot apply to lee-backlight/for-backlight-next lee-leds/for-leds-next drm-exynos/exynos-drm-next linus/master lee-backlight/for-backlight-fixes drm-intel/for-linux-next drm-intel/for-linux-next-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/platform-x86-dell-uart-backlight-Use-blacklight-power-constant/20250618-203011
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250618122436.379013-13-tzimmermann%40suse.de
patch subject: [PATCH 12/12] backlight: Do not include <linux/fb.h> in header file
config: riscv-randconfig-001-20250619 (https://download.01.org/0day-ci/archive/20250619/202506191230.WMfb29QM-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506191230.WMfb29QM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506191230.WMfb29QM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/backlight/rt4831-backlight.c:215:49: error: array type has incomplete element type 'struct of_device_id'
     215 | static const struct of_device_id __maybe_unused rt4831_bl_of_match[] = {
         |                                                 ^~~~~~~~~~~~~~~~~~


vim +215 drivers/video/backlight/rt4831-backlight.c

190ccab3185eee ChiYuan Huang 2021-05-17  214  
190ccab3185eee ChiYuan Huang 2021-05-17 @215  static const struct of_device_id __maybe_unused rt4831_bl_of_match[] = {
190ccab3185eee ChiYuan Huang 2021-05-17  216  	{ .compatible = "richtek,rt4831-backlight", },
190ccab3185eee ChiYuan Huang 2021-05-17  217  	{}
190ccab3185eee ChiYuan Huang 2021-05-17  218  };
190ccab3185eee ChiYuan Huang 2021-05-17  219  MODULE_DEVICE_TABLE(of, rt4831_bl_of_match);
190ccab3185eee ChiYuan Huang 2021-05-17  220  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

