Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF54CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 10:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kU9t4/ZxdJmr0gR4DXn0aX9gT0HxdHxth/zETAY38rw=; b=mx3KUrtn5/sbvrUJteI+RWG1Op
	Gfbxc9ZT4+dVZEmb+tPeMlJA/ld+yvGXtWz6b8zh+0Q5MD5lSWWr2hAn+26tFQKIrsbfUj2x92r+U
	tKJssA3/NFDXmBKAdwDKfLEbh9xW4Kqa6FufxTjBgmW0bwEi4fziPR3b88VMUY6t/SwYNfEz6DNNj
	Z7DLn6icx4JPZDVzrgFiOfzVj4jUSj/RD5WgcYiqiPQBCYS2/Twiophd7caFlMnePx7Dnt1MwcIkK
	8NL2RQMgD8C7yd7RrHJ25WZjueGS6Qf9A1G2ng1gQzHHcw5MyZbz1ZdddY1grcikUIC88Txj9WmxQ
	NEbpb4jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNH7-00000005Dih-2k7b;
	Tue, 02 Dec 2025 10:06:25 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNH5-00000005DiJ-0UsK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 10:06:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764669983; x=1796205983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oQlaqUeREC8Pc2NqxB4xgOj6FQuw9eUxeGBxZjH6Sgc=;
  b=JzwXiHP6zTkWrmWvrI6DDuSsD197Il5BaRTHLokTrp6woMvrLVj30Sgo
   NZMp1OWx9/3zIDFtYndkWMQyJeMQOKM18X58mHb3J39Xt8NL1/51S9EMC
   yXQ2ZWddGtENCPjpAecLhWuzHB/WvJFuDLl2WBBtE7BcOZikgnfVcaEtl
   tSRYEzrDgs74e95j5bBHYsLv/TSm3n6JPiZeFoceDLVWZH91rteKnqjLl
   EE7MZHpDCJPmlGEZ4kpu2BnyQvkbScH8Tdl02zO5CkFsqVvPrq3PIeugM
   S0GEciSTgDuy3qzMmMS11z+51rzaBVWsUuH28x5/po19ZyVC/g+HpZ04e
   A==;
X-CSE-ConnectionGUID: gb/aQNEPSGONjQAG+ZfaFQ==
X-CSE-MsgGUID: jaksGxVUQ8y1KgcSSRCM7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="69223302"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="69223302"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 02:06:21 -0800
X-CSE-ConnectionGUID: PITpErWwRNmDgKnxiyeQcw==
X-CSE-MsgGUID: 4OdsEXdETKmHXxBiAj8Kiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="217680052"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Dec 2025 02:06:15 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQNGv-000000009fR-1YFs;
	Tue, 02 Dec 2025 10:06:13 +0000
Date: Tue, 2 Dec 2025 18:06:03 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v6 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Message-ID: <202512021733.cIbkorvY-lkp@intel.com>
References: <20251201-v6-18-topic-imx93-parallel-display-v6-2-7b056e1e5b1e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-v6-18-topic-imx93-parallel-display-v6-2-7b056e1e5b1e@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_020623_219620_031BC690 
X-CRM114-Status: GOOD (  11.75  )
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

Hi Marco,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/dt-bindings-soc-imx93-media-blk-ctrl-Add-PDFC-subnode-to-schema-and-example/20251202-011707
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251201-v6-18-topic-imx93-parallel-display-v6-2-7b056e1e5b1e%40pengutronix.de
patch subject: [PATCH v6 2/3] drm/bridge: imx: Add i.MX93 parallel display format configuration support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251202/202512021733.cIbkorvY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021733.cIbkorvY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021733.cIbkorvY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/imx/imx93-pdfc.c:55:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      55 |                 val = FORMAT_RGB888_TO_RGB888;
         |                       ^
   drivers/gpu/drm/bridge/imx/imx93-pdfc.c:21:34: note: expanded from macro 'FORMAT_RGB888_TO_RGB888'
      21 | #define FORMAT_RGB888_TO_RGB888         FIELD_PREP(PARALLEL_DISP_FORMAT, 0)
         |                                         ^
   1 error generated.


vim +/FIELD_PREP +55 drivers/gpu/drm/bridge/imx/imx93-pdfc.c

    42	
    43	static void imx93_pdfc_bridge_atomic_enable(struct drm_bridge *bridge,
    44						    struct drm_atomic_state *state)
    45	{
    46		struct imx93_pdfc *pdfc = bridge->driver_private;
    47		const struct drm_bridge_state *bridge_state;
    48		unsigned int mask = PARALLEL_DISP_FORMAT;
    49		unsigned int val;
    50	
    51		bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
    52	
    53		switch (bridge_state->output_bus_cfg.format) {
    54		case MEDIA_BUS_FMT_RGB888_1X24:
  > 55			val = FORMAT_RGB888_TO_RGB888;
    56			if (pdfc->phy_bus_width == 18) {
    57				/*
    58				 * Can be valid if physical bus limitation exist,
    59				 * therefore use dev_dbg().
    60				 */
    61				dev_dbg(pdfc->dev, "Truncate two LSBs from each color\n");
    62				val = FORMAT_RGB888_TO_RGB666;
    63			}
    64			break;
    65		case MEDIA_BUS_FMT_RGB666_1X18:
    66			val = FORMAT_RGB888_TO_RGB666;
    67			break;
    68		case MEDIA_BUS_FMT_RGB565_1X16:
    69			val = FORMAT_RGB565_TO_RGB565;
    70			break;
    71		}
    72	
    73		regmap_update_bits(pdfc->regmap, pdfc->disp_mux_reg_off, mask, val);
    74	}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

