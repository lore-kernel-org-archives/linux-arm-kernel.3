Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484DAC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 15:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZyVp/hP+HoVC3gWLnB5zGfe8RJjaNJ5mMe/AOM9X0s=; b=PsuS7OdHpFRI2kDgNxyuKLr+K1
	NZ9ADsAFtMURXUW7q9lv02Rsckx/SzBVRHRzJWWFiz0hXzIFwInJaKrNKey9YWsLjpb4spANlNsKI
	8hWhPKqNAyx5z08zHcOZ07EAmWBZex7apkg0FA9TSsBnoDzz11yZztV7w3O+7duPNX0zYjZJUc64x
	/SUFBjsg6oe5KFw9ckd5hgQ7lct+YqLVeuLdtH3ErGf0DndHt5BtW/d8X4XZ90273t7n6BTXYpw4c
	fYku1D7bOJ2qyegyS4Olp0gkvuYxhXYdaxGp3MXUiDbPDbRDdLdAaJeX60Iujt7xe2QjB+WRsf86y
	ZCsL9AkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujK2q-0000000DD8u-0Afd;
	Tue, 05 Aug 2025 15:57:44 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJ0W-0000000D4GC-0V79
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 14:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754405476; x=1785941476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6JJJUKSGwNvzbye1CXhMaN2YPY31Ne0NqIPIES62I2I=;
  b=mX4wZ7jT69BegcdH46iZfHl7QxyJQjbC4GBy+hKOrd/KwkqLobLnRtMH
   5xtA/eA37T4HNg1TFgcwwIslKNcCU/u04A6ffD6oBoi5RASyhokRdtAIV
   CmnneT6gf1iv8Jd32OG4VrF5qc+R6d2qGpB95jtt7a+gURYzUD17SEeRY
   Z4FcYeUagEwPx/as4pLV9vD9vfPh+ortV6okgIU33/GbbW+ReRZKC1onz
   ei/Phz78Usg3IDBPxdwTojEc+M9SFEs7JdJZb9jsc8ZAcSXrG32JrCCN8
   eW19lfbr9isOM90WaM2euWnD3GcPWvkTA8Ce2SbRtI9Yg6F1OrbSOHSAo
   g==;
X-CSE-ConnectionGUID: 1g/l4xi9RCy7jrRrHgApnw==
X-CSE-MsgGUID: 5+H05i15Tqmt9IthR4FLBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56780809"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="56780809"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 07:51:12 -0700
X-CSE-ConnectionGUID: dg9Yxn2AQQmm7J+UhiEFxg==
X-CSE-MsgGUID: WnuoX+2FRrmneZllg/7wMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="195476429"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Aug 2025 07:51:05 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujJ0E-0000d8-1a;
	Tue, 05 Aug 2025 14:51:00 +0000
Date: Tue, 5 Aug 2025 22:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 5/6] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
Message-ID: <202508052225.u407ulE0-lkp@intel.com>
References: <20250804104722.601440-6-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804104722.601440-6-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_075116_196245_F67998CC 
X-CRM114-Status: GOOD (  11.73  )
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

Hi Shengjiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on robh/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.16 next-20250805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/dt-bindings-display-imx-add-HDMI-PAI-for-i-MX8MP/20250804-185254
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250804104722.601440-6-shengjiu.wang%40nxp.com
patch subject: [PATCH v3 5/6] drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface
config: xtensa-randconfig-001-20250805 (https://download.01.org/0day-ci/archive/20250805/202508052225.u407ulE0-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508052225.u407ulE0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508052225.u407ulE0-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of lib/test_dynamic_debug.o: defined in discarded section `.exit.text' of lib/test_dynamic_debug.o
   `.exit.text' referenced in section `__jump_table' of lib/test_dynamic_debug.o: defined in discarded section `.exit.text' of lib/test_dynamic_debug.o
   xtensa-linux-ld: drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.o: in function `imx8mp_hdmi_pai_remove':
>> imx8mp-hdmi-pai.c:(.text+0x8c): undefined reference to `dw_hdmi_to_plat_data'
   xtensa-linux-ld: drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.o: in function `imx8mp_hdmi_pai_disable':
   imx8mp-hdmi-pai.c:(.text+0x9a): undefined reference to `dw_hdmi_to_plat_data'
>> xtensa-linux-ld: imx8mp-hdmi-pai.c:(.text+0xbc): undefined reference to `dw_hdmi_to_plat_data'
   xtensa-linux-ld: drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.o: in function `imx8mp_hdmi_pai_enable':
   imx8mp-hdmi-pai.c:(.text+0xd2): undefined reference to `dw_hdmi_to_plat_data'
   `.exit.text' referenced in section `__jump_table' of net/ceph/ceph_common.o: defined in discarded section `.exit.text' of net/ceph/ceph_common.o
   `.exit.text' referenced in section `__jump_table' of net/ceph/ceph_common.o: defined in discarded section `.exit.text' of net/ceph/ceph_common.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

