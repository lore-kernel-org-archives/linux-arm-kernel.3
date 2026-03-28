Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FC510BA423
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 18:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tcnzVXBqpuo5K0GMgBb/lFC9jFImmD/zmMuMyV+f7w=; b=KCnlXt6ycIn+7NsOKUFEf35bik
	QQhkqL3cW6JPvr7aUlPaSgcKU3q9qosms0hgpcs8UwEfl7Te4t9T1K+Ehs6odwLIvV/bBKkh/ZwEP
	oyJucu6YNS48R/VhajVvczeB+BTanxufmVcrSX3Du0b5usG66wHZiPMQcsUzkbJk/Qmt4Mx4ZRQyA
	VnqcoK3A6hu26tZfTVRLlgN0oCLEy082atgGKIGf282LpQ35L32kK5++yMak3ZAxvN/263llcFSux
	zatYe1hRBCS702gwNX/jh1HJlCeKlUJ4mqWuC18sfIujEsFmn6HJ+07h610JsQb36VB4z4vAyp3r2
	ZuLjX6iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Yea-00000009Cmo-0JGS;
	Sat, 28 Mar 2026 18:45:00 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6YeW-00000009Clv-3BZY;
	Sat, 28 Mar 2026 18:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774723497; x=1806259497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kmwRtxXK8xGRADi3clGnSnpebF8WnxXlg30JofNOtQ0=;
  b=b1HuAN2q9dHRwN5vCND3THmvJIfzdd9JOcU/1MjahosVgLTTrUTq5f/7
   Jpg6RO0i/BTXJJb49RaKTO/F1gGqWpgX9pJkUdX74mXeZ5wkmg/rtNKZt
   HjIxpp/lN7PlrApWagkCtvmKxIgOzqfzzMP1tP5DWmbG//MY+t8s0m1u+
   BjKM0QanJxfn83R+3xD4HrGeQPI8mH8ju2viYnP7lLiFmxnlTHKHWhi9w
   2O9lJUufBOuIakqWxW7eZgl8HJavC4qBtadlkLr7XjRy+2SnrdahGDcPQ
   zIh8bwM8Q3k4l2reLHD/3zGBdJ0WZd37kt5X1U2+UsbfybfXTVeV3aHLq
   w==;
X-CSE-ConnectionGUID: jt/5pEGaSdSzVZXk3Zbjog==
X-CSE-MsgGUID: CeaPGfofRpaNzOOJViJykA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86845876"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="86845876"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 11:44:53 -0700
X-CSE-ConnectionGUID: Nc+Sx4DhReOMLCcTty2zpA==
X-CSE-MsgGUID: MRA0+ZK0Qme1YgjotqhzrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="230095910"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Mar 2026 11:44:49 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6YeL-00000000BgF-32UD;
	Sat, 28 Mar 2026 18:44:45 +0000
Date: Sun, 29 Mar 2026 02:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jay Liu <jay.liu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jay Liu <jay.liu@mediatek.com>
Subject: Re: [PATCH v4 5/6] drm/mediatek: Support multiple CCORR component
Message-ID: <202603290249.ZJ6ioqey-lkp@intel.com>
References: <20260324125315.4715-6-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324125315.4715-6-jay.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_114456_899479_986C4AA5 
X-CRM114-Status: GOOD (  13.23  )
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

Hi Jay,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next pza/reset/next linus/master v7.0-rc5 next-20260327]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jay-Liu/dt-bindings-display-mediatek-gamma-Add-support-for-MT8196/20260328-083359
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260324125315.4715-6-jay.liu%40mediatek.com
patch subject: [PATCH v4 5/6] drm/mediatek: Support multiple CCORR component
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260329/202603290249.ZJ6ioqey-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290249.ZJ6ioqey-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603290249.ZJ6ioqey-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_ddp_comp.c:461:10: error: 'DDP_COMPONENT_CCORR0' undeclared here (not in a function); did you mean 'DDP_COMPONENT_CCORR'?
     461 |         [DDP_COMPONENT_CCORR0]          = { MTK_DISP_CCORR,             0, &ddp_ccorr },
         |          ^~~~~~~~~~~~~~~~~~~~
         |          DDP_COMPONENT_CCORR
>> drivers/gpu/drm/mediatek/mtk_ddp_comp.c:461:10: error: array index in initializer not of integer type
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:461:10: note: (near initialization for 'mtk_ddp_matches')
>> drivers/gpu/drm/mediatek/mtk_ddp_comp.c:462:10: error: 'DDP_COMPONENT_CCORR1' undeclared here (not in a function); did you mean 'DDP_COMPONENT_CCORR'?
     462 |         [DDP_COMPONENT_CCORR1]          = { MTK_DISP_CCORR,             1, &ddp_ccorr },
         |          ^~~~~~~~~~~~~~~~~~~~
         |          DDP_COMPONENT_CCORR
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:462:10: error: array index in initializer not of integer type
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:462:10: note: (near initialization for 'mtk_ddp_matches')
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:463:43: warning: initialized field overwritten [-Woverride-init]
     463 |         [DDP_COMPONENT_COLOR0]          = { MTK_DISP_COLOR,             0, &ddp_color },
         |                                           ^
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:463:43: note: (near initialization for 'mtk_ddp_matches[4]')


vim +461 drivers/gpu/drm/mediatek/mtk_ddp_comp.c

   456	
   457	static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX] = {
   458		[DDP_COMPONENT_AAL0]		= { MTK_DISP_AAL,		0, &ddp_aal },
   459		[DDP_COMPONENT_AAL1]		= { MTK_DISP_AAL,		1, &ddp_aal },
   460		[DDP_COMPONENT_BLS]		= { MTK_DISP_BLS,		0, NULL },
 > 461		[DDP_COMPONENT_CCORR0]		= { MTK_DISP_CCORR,		0, &ddp_ccorr },
 > 462		[DDP_COMPONENT_CCORR1]		= { MTK_DISP_CCORR,		1, &ddp_ccorr },
   463		[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,		0, &ddp_color },
   464		[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,		1, &ddp_color },
   465		[DDP_COMPONENT_DITHER0]		= { MTK_DISP_DITHER,		0, &ddp_dither },
   466		[DDP_COMPONENT_DP_INTF0]	= { MTK_DP_INTF,		0, &ddp_dpi },
   467		[DDP_COMPONENT_DP_INTF1]	= { MTK_DP_INTF,		1, &ddp_dpi },
   468		[DDP_COMPONENT_DPI0]		= { MTK_DPI,			0, &ddp_dpi },
   469		[DDP_COMPONENT_DPI1]		= { MTK_DPI,			1, &ddp_dpi },
   470		[DDP_COMPONENT_DRM_OVL_ADAPTOR]	= { MTK_DISP_OVL_ADAPTOR,	0, &ddp_ovl_adaptor },
   471		[DDP_COMPONENT_DSC0]		= { MTK_DISP_DSC,		0, &ddp_dsc },
   472		[DDP_COMPONENT_DSC1]		= { MTK_DISP_DSC,		1, &ddp_dsc },
   473		[DDP_COMPONENT_DSI0]		= { MTK_DSI,			0, &ddp_dsi },
   474		[DDP_COMPONENT_DSI1]		= { MTK_DSI,			1, &ddp_dsi },
   475		[DDP_COMPONENT_DSI2]		= { MTK_DSI,			2, &ddp_dsi },
   476		[DDP_COMPONENT_DSI3]		= { MTK_DSI,			3, &ddp_dsi },
   477		[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,		0, &ddp_gamma },
   478		[DDP_COMPONENT_MERGE0]		= { MTK_DISP_MERGE,		0, &ddp_merge },
   479		[DDP_COMPONENT_MERGE1]		= { MTK_DISP_MERGE,		1, &ddp_merge },
   480		[DDP_COMPONENT_MERGE2]		= { MTK_DISP_MERGE,		2, &ddp_merge },
   481		[DDP_COMPONENT_MERGE3]		= { MTK_DISP_MERGE,		3, &ddp_merge },
   482		[DDP_COMPONENT_MERGE4]		= { MTK_DISP_MERGE,		4, &ddp_merge },
   483		[DDP_COMPONENT_MERGE5]		= { MTK_DISP_MERGE,		5, &ddp_merge },
   484		[DDP_COMPONENT_OD0]		= { MTK_DISP_OD,		0, &ddp_od },
   485		[DDP_COMPONENT_OD1]		= { MTK_DISP_OD,		1, &ddp_od },
   486		[DDP_COMPONENT_OVL0]		= { MTK_DISP_OVL,		0, &ddp_ovl },
   487		[DDP_COMPONENT_OVL1]		= { MTK_DISP_OVL,		1, &ddp_ovl },
   488		[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,		0, &ddp_ovl },
   489		[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,		1, &ddp_ovl },
   490		[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,		2, &ddp_ovl },
   491		[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,		0, &ddp_postmask },
   492		[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,		0, NULL },
   493		[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,		1, NULL },
   494		[DDP_COMPONENT_PWM2]		= { MTK_DISP_PWM,		2, NULL },
   495		[DDP_COMPONENT_RDMA0]		= { MTK_DISP_RDMA,		0, &ddp_rdma },
   496		[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,		1, &ddp_rdma },
   497		[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,		2, &ddp_rdma },
   498		[DDP_COMPONENT_RDMA4]		= { MTK_DISP_RDMA,		4, &ddp_rdma },
   499		[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,		0, &ddp_ufoe },
   500		[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,		0, NULL },
   501		[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,		1, NULL },
   502	};
   503	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

