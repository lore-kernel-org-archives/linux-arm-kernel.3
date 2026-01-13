Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB86D29DC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 03:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVv62MZUrZPdRFByK56slRI8ijRLRgG7rdwfmDV8pAQ=; b=EMsClmYqQCm9YJUhZts8pCcYOP
	9qMJOrd+u+r26XUy74D94LAWLg5TfHaZ1Pu3Pc1TceNXCUHV0J23Ng6ZrEvEW1Mz1RCa5adB01obS
	EP3Uk5woJ2oDgFvzJS65hkTI6LOSjLBPjKBA8/4Kuu9vA+V40u5/mmp3zB0tyNtxRa/3w+cQi9rf/
	S2Lya/IEk4rBNO5YxeniFPnaYaZOUdbVU3PhCbfcEOroROyueQqDTGuFMRzUmk3+nEMIXju3lBZdO
	8EYYirR4Y4X1mtnwuENCn1r602a/t3D/p6Nl4yKiPPuVoz03IqEim7a9tY5Uood+VHEUtBzwtB9kn
	4bV6ZNDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfVIp-00000006Uus-093Z;
	Tue, 13 Jan 2026 03:42:43 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfVIl-00000006Uu6-0uvc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 03:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768275759; x=1799811759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wRx+TNLJBbL2ubl8LIvhEos4LxCfMOOdQi3XJl6jDyE=;
  b=mePDu0JAe8NxouW206yBW2Z8KhgkyES7Dav+pb3l0uoHlK5A1iAnzYf/
   6uDyUP1go7glL5mqi61wbTDcmChaYfQut+Nde5SB2YostLeEX2pWg4GXt
   +9nCsVfuwROYcY2z0T96xSSmJqn5Bo+pU5thluXGOmaE38gsEXZempqkQ
   BVjjfXp0F6GmulHx99/O/8b4eIf1+7gJXHs2a4fTJSL5KWR03ezgY67of
   vzPEI9o2QEYoB2AqvPz0WatmwvPjU5g3piqnvieOrUu4dOmTXNudPrXTi
   Q6r+UdMrF7Y67+MU2JbHu/ojcVe+wLyQH4aAzgfD8OENeHXDjzQy909yA
   g==;
X-CSE-ConnectionGUID: kZF/9YjCS9W+QxXKz9W8Uw==
X-CSE-MsgGUID: R2fD5bIkQ7+eN5bMtI0Ddg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="81009560"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="81009560"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:42:39 -0800
X-CSE-ConnectionGUID: Dp9NJNqyRymYSYWocfCcrQ==
X-CSE-MsgGUID: jSeE+nXDRt2HMQrAxmYNXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209098823"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jan 2026 19:42:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfVIe-00000000EB2-1gwZ;
	Tue, 13 Jan 2026 03:42:32 +0000
Date: Tue, 13 Jan 2026 11:41:52 +0800
From: kernel test robot <lkp@intel.com>
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Russell King <linux@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Cyrille Pitchen <cyrille.pitchen@microchip.com>
Subject: Re: [PATCH v4 2/5] drm/microchip: add a driver for the Microchip
 GFX2D GPU
Message-ID: <202601131146.aeqDjJy1-lkp@intel.com>
References: <20260112-cpitchen-mainline_gfx2d-v4-2-f210041ad343@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-cpitchen-mainline_gfx2d-v4-2-f210041ad343@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_194239_308496_E5A43AC5 
X-CRM114-Status: GOOD (  13.35  )
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

Hi Cyrille,

kernel test robot noticed the following build errors:

[auto build test ERROR on 38feb171b3f92d77e8061fafb5ddfffc2c13b672]

url:    https://github.com/intel-lab-lkp/linux/commits/Cyrille-Pitchen/dt-bindings-gpu-add-bindings-for-the-Microchip-GFX2D-GPU/20260112-192254
base:   38feb171b3f92d77e8061fafb5ddfffc2c13b672
patch link:    https://lore.kernel.org/r/20260112-cpitchen-mainline_gfx2d-v4-2-f210041ad343%40microchip.com
patch subject: [PATCH v4 2/5] drm/microchip: add a driver for the Microchip GFX2D GPU
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260113/202601131146.aeqDjJy1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131146.aeqDjJy1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131146.aeqDjJy1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/microchip/mchp_gfx2d_cmd.c: In function 'mchp_gfx2d_enable_exend':
>> drivers/gpu/drm/microchip/mchp_gfx2d_cmd.c:44:9: error: implicit declaration of function 'drm_dbg'; did you mean 'dev_dbg'? [-Wimplicit-function-declaration]
      44 |         drm_dbg(&priv->drm, "enable EXEND interrupt\n");
         |         ^~~~~~~
         |         dev_dbg
--
>> drivers/gpu/drm/microchip/mchp_gfx2d_drv.c:61:10: error: 'const struct drm_driver' has no member named 'date'
      61 |         .date = "20240716",
         |          ^~~~
>> drivers/gpu/drm/microchip/mchp_gfx2d_drv.c:61:17: error: initialization of 'unsigned int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
      61 |         .date = "20240716",
         |                 ^~~~~~~~~~
   drivers/gpu/drm/microchip/mchp_gfx2d_drv.c:61:17: note: (near initialization for 'mchp_gfx2d_drm_driver.driver_features')
   drivers/gpu/drm/microchip/mchp_gfx2d_drv.c:62:28: warning: initialized field overwritten [-Woverride-init]
      62 |         .driver_features = DRIVER_GEM | DRIVER_RENDER,
         |                            ^~~~~~~~~~
   drivers/gpu/drm/microchip/mchp_gfx2d_drv.c:62:28: note: (near initialization for 'mchp_gfx2d_drm_driver.driver_features')
   drivers/gpu/drm/microchip/mchp_gfx2d_drv.c: In function 'mchp_gfx2d_thread':
>> drivers/gpu/drm/microchip/mchp_gfx2d_drv.c:98:9: error: implicit declaration of function 'drm_dbg'; did you mean 'dev_dbg'? [-Wimplicit-function-declaration]
      98 |         drm_dbg(&priv->drm, "enter IRQ thread\n");
         |         ^~~~~~~
         |         dev_dbg
   drivers/gpu/drm/microchip/mchp_gfx2d_drv.c: At top level:
>> drivers/gpu/drm/microchip/mchp_gfx2d_drv.c:344:10: error: 'struct platform_driver' has no member named 'remove_new'; did you mean 'remove'?
     344 |         .remove_new = mchp_gfx2d_remove,
         |          ^~~~~~~~~~
         |          remove
--
   drivers/gpu/drm/microchip/mchp_gfx2d_gem.c: In function 'mchp_gfx2d_gem_create':
>> drivers/gpu/drm/microchip/mchp_gfx2d_gem.c:127:17: error: implicit declaration of function 'drm_dbg'; did you mean 'dev_dbg'? [-Wimplicit-function-declaration]
     127 |                 drm_dbg(dev, "failed to allocate buffer with size %zu\n", size);
         |                 ^~~~~~~
         |                 dev_dbg
   drivers/gpu/drm/microchip/mchp_gfx2d_gem.c: In function 'mchp_gfx2d_gem_prime_import_sg_table':
>> drivers/gpu/drm/microchip/mchp_gfx2d_gem.c:201:9: error: implicit declaration of function 'drm_dbg_prime' [-Wimplicit-function-declaration]
     201 |         drm_dbg_prime(dev, "dma_addr = %pad, size = %zu\n",
         |         ^~~~~~~~~~~~~


vim +44 drivers/gpu/drm/microchip/mchp_gfx2d_cmd.c

    41	
    42	static void mchp_gfx2d_enable_exend(struct mchp_gfx2d_device *priv)
    43	{
  > 44		drm_dbg(&priv->drm, "enable EXEND interrupt\n");
    45		writel(GFX2D_IRQ_EXEND, priv->regs + GFX2D_IE);
    46	}
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

