Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D219CFD2E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 18:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMtBtDmGnWdlLUidJ1hEd/D5lLb4KymJzuiEK8+TAw0=; b=RG+vnfDjNM0VsZuvppJiLt6Nsw
	9ceHI/3roCVkdz4io84nrE4gCnD/IyIJQZbqdXeSmGRs9riZ+pAVZcDzqjLWB32666vqxcIeLgsur
	xvpQ4EZTM6Kz874FCCeBCfPxHfruF+8Prh2hh6UWtVnV0bzqyA37gImHc7MqE3Xw5byKWtjttGdYV
	VpVqZv4CEESxZfQwepftDWOjZXxsi8Wby5WLS+u+8vyvT98vSye0/xS4SHCcwrufHNH/QLgeMWrUq
	ns8vjbGmrszwx5NUZo7oURw9b68k0Mm8JBWeXCk7UzvJimSh1YGoX6dqZMVr/VyfgVXokTqscboHa
	sDKb1pfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMsXw-00000009no1-277q;
	Sat, 22 Nov 2025 18:41:20 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMsXt-00000009nne-32ka
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 18:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763836878; x=1795372878;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uh6fba18pbvtcVMxyxzgPBWrZ9i8/1sGN1sD1sLq4co=;
  b=Ry+JX9zdajr0Axfb030tVErg/56rz9U52l7CtXkiUaUPGN80Euq/BvKk
   L5nA2X3PTtCnSy0ImhMMlccpwQSvgmG+V1CnYiXXckr1hfxkazvTwrA3P
   kXY5tq1LK/zhDBC0R+daDAcv1UZnybIbbJ+1Zrvz6h8YvIZWmjUEobJtd
   mNsu6dC1muKumGMZFqaSS+KVKCf4ROJrdr1jo6U8yPNW3JBts1SnKifpK
   c9Pd2jitR7QkBsoPeFef0L526lmST1CcOfiVJrJ/sK1LkIo5cxbA1RRg5
   XWoV2yEIdKH6zbcBowqbFchBOo3fKAphhWRQnrXrjk3aEhn6rp1KjqnNP
   Q==;
X-CSE-ConnectionGUID: MLz9SPwIThibvIPgC+Tq9g==
X-CSE-MsgGUID: YOxM40LeQ4qBeIVCbcByTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="53469235"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="53469235"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 10:41:17 -0800
X-CSE-ConnectionGUID: GX2RLIrLT5qBDBNYgcnDaQ==
X-CSE-MsgGUID: IZMZCRR/Q2yDT+wCNFSm3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="191637140"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Nov 2025 10:41:13 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMsXn-0007l7-1R;
	Sat, 22 Nov 2025 18:41:11 +0000
Date: Sun, 23 Nov 2025 02:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Dharma Balasubiramani <dharma.b@microchip.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH 5/8] drm/atmel-hlcdc: use devm_drm_of_get_bridge()
Message-ID: <202511230240.NYBAiUV4-lkp@intel.com>
References: <20251121-lcd_cleanup_mainline-v1-5-2587e6fe4d67@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-lcd_cleanup_mainline-v1-5-2587e6fe4d67@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_104117_786549_387AFD47 
X-CRM114-Status: GOOD (  12.33  )
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

Hi Ludovic,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b]

url:    https://github.com/intel-lab-lkp/linux/commits/Ludovic-Desroches/drm-atmel-hlcdc-use-managed-device-resources-for-the-display-controller/20251121-231107
base:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
patch link:    https://lore.kernel.org/r/20251121-lcd_cleanup_mainline-v1-5-2587e6fe4d67%40microchip.com
patch subject: [PATCH 5/8] drm/atmel-hlcdc: use devm_drm_of_get_bridge()
config: arm-randconfig-001-20251123 (https://download.01.org/0day-ci/archive/20251123/202511230240.NYBAiUV4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230240.NYBAiUV4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511230240.NYBAiUV4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c:100:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     100 |         if (bridge) {
         |             ^~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c:106:9: note: uninitialized use occurs here
     106 |         return ret;
         |                ^~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c:100:2: note: remove the 'if' if its condition is always true
     100 |         if (bridge) {
         |         ^~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c:75:9: note: initialize the variable 'ret' to silence this warning
      75 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +100 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c

b6e075c3cb6e57d Peter Rosin       2018-08-25   67  
6bee9b78a7a5ea2 Boris Brezillon   2017-05-18   68  static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
17a8e03e7e97d34 Boris Brezillon   2016-01-06   69  {
b6e075c3cb6e57d Peter Rosin       2018-08-25   70  	struct atmel_hlcdc_rgb_output *output;
b6e075c3cb6e57d Peter Rosin       2018-08-25   71  	struct device_node *ep;
17a8e03e7e97d34 Boris Brezillon   2016-01-06   72  	struct drm_bridge *bridge;
ec29c94011469e7 Ludovic Desroches 2025-11-21   73  	struct atmel_hlcdc_dc *dc = dev->dev_private;
ec29c94011469e7 Ludovic Desroches 2025-11-21   74  	struct drm_crtc *crtc = dc->crtc;
17a8e03e7e97d34 Boris Brezillon   2016-01-06   75  	int ret;
1a396789f65a227 Boris Brezillon   2015-01-06   76  
524bfe4ade6dbed Ludovic Desroches 2025-11-21   77  	bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, endpoint);
524bfe4ade6dbed Ludovic Desroches 2025-11-21   78  	if (IS_ERR(bridge))
524bfe4ade6dbed Ludovic Desroches 2025-11-21   79  		return PTR_ERR(bridge);
6bee9b78a7a5ea2 Boris Brezillon   2017-05-18   80  
e38758ed5aece5d Ludovic Desroches 2025-11-21   81  	output = drmm_simple_encoder_alloc(dev, struct atmel_hlcdc_rgb_output,
e38758ed5aece5d Ludovic Desroches 2025-11-21   82  					   encoder, DRM_MODE_ENCODER_NONE);
e38758ed5aece5d Ludovic Desroches 2025-11-21   83  	if (IS_ERR(output))
e38758ed5aece5d Ludovic Desroches 2025-11-21   84  		return PTR_ERR(output);
e38758ed5aece5d Ludovic Desroches 2025-11-21   85  
e38758ed5aece5d Ludovic Desroches 2025-11-21   86  	ep = of_graph_get_endpoint_by_regs(dev->dev->of_node, 0, endpoint);
e38758ed5aece5d Ludovic Desroches 2025-11-21   87  	if (!ep)
e38758ed5aece5d Ludovic Desroches 2025-11-21   88  		return -ENODEV;
b6e075c3cb6e57d Peter Rosin       2018-08-25   89  
b6e075c3cb6e57d Peter Rosin       2018-08-25   90  	output->bus_fmt = atmel_hlcdc_of_bus_fmt(ep);
b6e075c3cb6e57d Peter Rosin       2018-08-25   91  	of_node_put(ep);
b6e075c3cb6e57d Peter Rosin       2018-08-25   92  	if (output->bus_fmt < 0) {
3379655524e613e Eslam Khafagy     2025-08-14   93  		drm_err(dev, "endpoint %d: invalid bus width\n", endpoint);
17a8e03e7e97d34 Boris Brezillon   2016-01-06   94  		return -EINVAL;
b6e075c3cb6e57d Peter Rosin       2018-08-25   95  	}
1a396789f65a227 Boris Brezillon   2015-01-06   96  
1a396789f65a227 Boris Brezillon   2015-01-06   97  
ec29c94011469e7 Ludovic Desroches 2025-11-21   98  	output->encoder.possible_crtcs = drm_crtc_mask(crtc);
17a8e03e7e97d34 Boris Brezillon   2016-01-06   99  
17a8e03e7e97d34 Boris Brezillon   2016-01-06 @100  	if (bridge) {
a25b988ff83f3ca Laurent Pinchart  2020-02-26  101  		ret = drm_bridge_attach(&output->encoder, bridge, NULL, 0);
17a8e03e7e97d34 Boris Brezillon   2016-01-06  102  		if (!ret)
17a8e03e7e97d34 Boris Brezillon   2016-01-06  103  			return 0;
17a8e03e7e97d34 Boris Brezillon   2016-01-06  104  	}
1a396789f65a227 Boris Brezillon   2015-01-06  105  
1a396789f65a227 Boris Brezillon   2015-01-06  106  	return ret;
1a396789f65a227 Boris Brezillon   2015-01-06  107  }
1a396789f65a227 Boris Brezillon   2015-01-06  108  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

