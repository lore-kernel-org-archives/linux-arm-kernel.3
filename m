Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91C1E67482
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 22:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaQVhvXE9fGnK+9SNupQlg/7DpSpEM9mV4SUdWLamV0=; b=Vq34Z42j972LaisT3W8gCgFv9e
	fFJ5rkaki+M8Tf6Str5WPINm74Op60gQhpMZR7ynInM3aw8gLxOZ7A3GJ0mz+rCub6SOdJUa1hSSp
	fddGWW5SXUeZIbxWlcVGRFiUF8RzROEZwDI7JlksIGii4rzsLYvtLAutOqqTWdK5xY6GNT2d7RC+R
	+YPIB3BfxPzkWtl2+RdTmZVWIx+1v2M8TNhmkwosQ5e0CgTf2Z/iJ9f3Eg3o/CXoRZU/Ii2XFyFGN
	bxD0AE6SqK6Z8c87AOYGL0rAfMtVnDlpuXmVudLspjmNSHkn6dtTT7/+4OZ5bWXpF5agt6r3QlIVT
	XYYm/3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXRYL-0000000Coas-08sY;
	Sun, 21 Dec 2025 22:05:25 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXRYH-0000000CoaE-32oF;
	Sun, 21 Dec 2025 22:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766354722; x=1797890722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PfQczwwXfMwazzAsoi+yBU2MNeNR6M8DPtWttCCbZak=;
  b=OzKBctV7/L11HPeSwWpKJ8cpMIyzCuoljd/NYYA5wS2PTD3sV1ZdDGu6
   VgPJS6meqRGbWvOYVmuK9TYYFfwwRff/KXWk1vP2Mik/HRnJmr5EmYSso
   uyNdUv9OYn5NjT1Z/FQCxR0B3UeqIQYrdjNIRdnWEvyBmaZo4M/1AcyxB
   YSCnaixT7Xq7WzEmB71/T+hhdSWz+RBD853NUb/LYNJCqJBOgkW0NIYs/
   Odpd0UX1kcyEHwVEATQmX4JF+robFpWkdwCzCEeYuuLX0v3OyONBByHSO
   av808yWec7M14oDFzSto9OJkgbuufYstyMq1zOn1j/DwubaV2mA10mG1e
   w==;
X-CSE-ConnectionGUID: JbZoBLGOQliqUF7xsxiWAQ==
X-CSE-MsgGUID: WK1gz5V0SqCtX9AxhmijKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67973893"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="67973893"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 14:05:20 -0800
X-CSE-ConnectionGUID: hVP3UqD3SyioJEOFWAonqQ==
X-CSE-MsgGUID: Ri6RMMUjS0Ow55Z9BHMCfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="236790262"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Dec 2025 14:05:17 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXRYA-000000000E9-3plt;
	Sun, 21 Dec 2025 22:05:14 +0000
Date: Mon, 22 Dec 2025 06:04:51 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Rajput <abhiraj21put@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, abhiraj21put@gmail.com
Subject: Re: [PATCH] drm/mediatek: Convert legacy DRM logging to drm_*
 helpers in mtk_crtc.c
Message-ID: <202512220515.z3QybJ8I-lkp@intel.com>
References: <20251217070303.689913-1-abhiraj21put@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217070303.689913-1-abhiraj21put@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_140521_813994_FA723A82 
X-CRM114-Status: GOOD (  12.58  )
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

Hi Abhishek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on pza/reset/next linus/master v6.19-rc1 next-20251219]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhishek-Rajput/drm-mediatek-Convert-legacy-DRM-logging-to-drm_-helpers-in-mtk_crtc-c/20251217-150453
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251217070303.689913-1-abhiraj21put%40gmail.com
patch subject: [PATCH] drm/mediatek: Convert legacy DRM logging to drm_* helpers in mtk_crtc.c
config: loongarch-randconfig-r062-20251218 (https://download.01.org/0day-ci/archive/20251222/202512220515.z3QybJ8I-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220515.z3QybJ8I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220515.z3QybJ8I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/lockdep.h:15,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/gpu/drm/mediatek/mtk_crtc.c:6:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   drivers/gpu/drm/mediatek/mtk_crtc.c: In function 'mtk_crtc_ddp_irq':
>> drivers/gpu/drm/mediatek/mtk_crtc.c:651:28: warning: unused variable 'dev' [-Wunused-variable]
     651 |         struct drm_device *dev = mtk_crtc->base.dev;
         |                            ^~~


vim +/dev +651 drivers/gpu/drm/mediatek/mtk_crtc.c

   645	
   646	static void mtk_crtc_ddp_irq(void *data)
   647	{
   648		struct drm_crtc *crtc = data;
   649		struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
   650		struct mtk_drm_private *priv = crtc->dev->dev_private;
 > 651		struct drm_device *dev = mtk_crtc->base.dev;
   652	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

