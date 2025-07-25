Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7373EC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 02:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5eCnxZLukn/ubt05PykTo/YwwMpLSJ69OngbYE/cW4=; b=eymKgzozPqr5CxcHnySwJVKmny
	gICdlRR0Jt6GSA+Hjv556+VX91ehZ38cgTMmOrhl0EebImSBFIVYmiHJ3suFO4Y04LQWWE8UvliN7
	3ZhgN0HM/HBotfx6d4hUMrNGoO4Hz8GOM3HMO6Lg6cLb+k8mbikc0ATqjdPP1xnfhu4MebbHSpIkG
	WXDass/J8CkPQtmsTDTs+0ubqOp2pcmxhnIMubPYLC5iLxZb0QlrzRWxZKpFTTQQ8jmFhKjViaunt
	T2xmv/3nw1/AUKTuP6PK4fa6oNP+xoSGqb7hcN/dnBGe10yNxDAuPlJTJ1m5bCZyKJTXDyNnRNPyM
	/lPCEbDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf8CJ-00000008tw8-2fK3;
	Fri, 25 Jul 2025 02:30:11 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf89r-00000008tlV-3gPD;
	Fri, 25 Jul 2025 02:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753410460; x=1784946460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Khfr6GJFMEPyxoF5TtbNyRQfS0y6Twazz2yM+2molDY=;
  b=SB5tsRuWT2P4eb2jQZqakjx3RMakfz0TfVF5fAfyPv9q0+e6YiMziF+h
   O7krGDVhtrcTAcEZy1aQfNtYDIPM4gBKdMRwMBD0tLlhN5OwTuuCNqalB
   jPJgtgljLqKlIP7vNwqmBfkd0fPOu4phgEoX0R/dlfqHLMGfSmdnf+0QP
   oj6N4cft1zFWzSyMWw0n6rEXG6H8DbZ96Pr7KS2u0d1Bw+JWuJyWDAbu+
   NE7eX78mHZn2x9STHS5C+jJiWhJaZU8Kzx2lCW4nviyRujFfHGsypHmZ/
   g2DwYzuieKOCOuuLmbr4TWKMmUVOf4x5frUHEW8PdDQ42Rcq/2Ze1Yhkn
   g==;
X-CSE-ConnectionGUID: i1h/c+WhSTC5CSc+siQzfw==
X-CSE-MsgGUID: GluG7s9qRkScEh+RIzAOKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="43352933"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; 
   d="scan'208";a="43352933"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 19:27:39 -0700
X-CSE-ConnectionGUID: bLSRn50RQC6VQhsJrY0bkA==
X-CSE-MsgGUID: qPdZrQ5FRW2cHtvxPARCvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; 
   d="scan'208";a="164883627"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jul 2025 19:27:33 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uf89i-000KzD-0K;
	Fri, 25 Jul 2025 02:27:30 +0000
Date: Fri, 25 Jul 2025 10:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
	sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
	alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
	andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
	l.stach@pengutronix.de, dianders@chromium.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v3 08/14] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Message-ID: <202507251021.A6WmQ4di-lkp@intel.com>
References: <20250724080304.3572457-9-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-9-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_192739_985261_9F558B98 
X-CRM114-Status: GOOD (  11.26  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20250724]
[cannot apply to drm-exynos/exynos-drm-next rockchip/for-next linus/master v6.16-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/drm-bridge-analogix_dp-Formalize-the-struct-analogix_dp_device/20250724-160804
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250724080304.3572457-9-damon.ding%40rock-chips.com
patch subject: [PATCH v3 08/14] drm/bridge: analogix_dp: Apply drm_bridge_connector helper
config: x86_64-buildonly-randconfig-003-20250725 (https://download.01.org/0day-ci/archive/20250725/202507251021.A6WmQ4di-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507251021.A6WmQ4di-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507251021.A6WmQ4di-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1346:12: error: incompatible function pointer types initializing 'enum drm_connector_status (*)(struct drm_bridge *, struct drm_connector *)' with an expression of type 'enum drm_connector_status (struct drm_bridge *)' [-Wincompatible-function-pointer-types]
    1346 |         .detect = analogix_dp_bridge_detect,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1346 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c

  1333	
  1334	static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
  1335		.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
  1336		.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
  1337		.atomic_reset = drm_atomic_helper_bridge_reset,
  1338		.atomic_pre_enable = analogix_dp_bridge_atomic_pre_enable,
  1339		.atomic_enable = analogix_dp_bridge_atomic_enable,
  1340		.atomic_disable = analogix_dp_bridge_atomic_disable,
  1341		.atomic_post_disable = analogix_dp_bridge_atomic_post_disable,
  1342		.atomic_check = analogix_dp_bridge_atomic_check,
  1343		.attach = analogix_dp_bridge_attach,
  1344		.get_modes = analogix_dp_bridge_get_modes,
  1345		.edid_read = analogix_dp_bridge_edid_read,
> 1346		.detect = analogix_dp_bridge_detect,
  1347	};
  1348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

