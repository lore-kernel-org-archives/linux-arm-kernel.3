Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A63CD75E5B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 15:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9un9Se2HbyP+i0dB1C/xr0W+Xe6SArM61RkSkhEm0Ns=; b=2CYlPNRYBResUuujflWGmQ9+HY
	ca5JLmKz1frza35ZabAZ6pi0agspG+M9Fq6r472N31x3Q7i4zmNAzFrVmUJ1bRnOQkWL3QdGAME/q
	S0CYr+r86pKvQqwcpI7pUPXFLeNtr6q25TAk6tfCn4rmOj9ienMqmrXba8yBSkMHj1wVoE7RJcBM2
	a5obD9+Defb16wFJG8PjEvzUV1aSYQ5AbGMi4XZwcZtmI5X1qUaft7FXI+GzuB+8Rdi+/6QW4c5lr
	an8ssK8t8hNp1iY5EOQhoZ3L8YaHSvMnKYmGKjYdFkI/5tQQBJ/oPiZAl8Uq0Ezr8bZE05Bmb7rM1
	yctnjzdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEV9M-00000002gdy-1FiH;
	Fri, 22 Nov 2024 15:00:48 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEV8O-00000002gUz-3jwd;
	Fri, 22 Nov 2024 14:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732287589; x=1763823589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GkCbSmjhBBgXZcXWF7U1crMu95bSOWEu0XweMi7WfYI=;
  b=h5XoaWOJ5XyiP4I75mHFAXCxsI8DErB4jgWdBLKNRNf4CswsX/HQWUPJ
   9kEIrhIuBVLctdjO7S2uhzFRwPsPeFIWg32Y5s09nu00ql4UwB/77cMC3
   mBjvFTNMEW7F79F67tQsj7dEu2wwnc67+yh1nm1Dixs5ggBP1h02Si+5c
   7SMcm3sLLR+Mwor5OZL5y/BzEMgSOFsMHR/0KD7La0DKWQix3212EbUld
   LQuT+otJe9KoRgvVvTLUxe6yJafB2KHYykC7ujbPdJZpDtLlMZFbLC1sh
   zM10msSe5vy+vI3NOtebRCB6dWWauF5XoxNYcHr+SakyibqEgHcHpGHsG
   g==;
X-CSE-ConnectionGUID: tLEd/VVETWCdK0YuoEGq1A==
X-CSE-MsgGUID: dpFKaYHKSfiex1jKwDCKVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="31803418"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="31803418"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 06:59:45 -0800
X-CSE-ConnectionGUID: X/vZvrrqSM6nIRO9u/AdxQ==
X-CSE-MsgGUID: SNnfAXWDTluSkmRUnCgJUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="95544425"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Nov 2024 06:59:40 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEV8D-000401-19;
	Fri, 22 Nov 2024 14:59:37 +0000
Date: Fri, 22 Nov 2024 22:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chunkuang.hu@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de,
	airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 3/7] drm/mediatek: mtk_cec: Switch to register as
 module_platform_driver
Message-ID: <202411222245.WS9U5m9I-lkp@intel.com>
References: <20241120124512.134278-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120124512.134278-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_065948_931751_98DD35EF 
X-CRM114-Status: GOOD (  11.33  )
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

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on pza/reset/next linus/master drm-misc/drm-misc-next v6.12 next-20241122]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-Add-binding-for-HDMIv2-DDC/20241121-132321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241120124512.134278-4-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v1 3/7] drm/mediatek: mtk_cec: Switch to register as module_platform_driver
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241122/202411222245.WS9U5m9I-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411222245.WS9U5m9I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411222245.WS9U5m9I-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/gpu/drm/mediatek/mtk_hdmi.o: in function `mtk_hdmitx_init':
>> drivers/gpu/drm/mediatek/mtk_hdmi.c:1812: multiple definition of `init_module'; drivers/gpu/drm/mediatek/mtk_cec.o:drivers/gpu/drm/mediatek/mtk_cec.c:249: first defined here
   aarch64-linux-ld: drivers/gpu/drm/mediatek/mtk_hdmi.o: in function `mtk_hdmitx_exit':
>> drivers/gpu/drm/mediatek/mtk_hdmi.c:1818: multiple definition of `cleanup_module'; drivers/gpu/drm/mediatek/mtk_cec.o:drivers/gpu/drm/mediatek/mtk_cec.c:249: first defined here


vim +1812 drivers/gpu/drm/mediatek/mtk_hdmi.c

8f83f26891e125 Jie Qiu       2016-01-04  1810  
8f83f26891e125 Jie Qiu       2016-01-04  1811  static int __init mtk_hdmitx_init(void)
8f83f26891e125 Jie Qiu       2016-01-04 @1812  {
446b8c542f8551 Philipp Zabel 2017-03-17  1813  	return platform_register_drivers(mtk_hdmi_drivers,
446b8c542f8551 Philipp Zabel 2017-03-17  1814  					 ARRAY_SIZE(mtk_hdmi_drivers));
8f83f26891e125 Jie Qiu       2016-01-04  1815  }
8f83f26891e125 Jie Qiu       2016-01-04  1816  
8f83f26891e125 Jie Qiu       2016-01-04  1817  static void __exit mtk_hdmitx_exit(void)
8f83f26891e125 Jie Qiu       2016-01-04 @1818  {
446b8c542f8551 Philipp Zabel 2017-03-17  1819  	platform_unregister_drivers(mtk_hdmi_drivers,
446b8c542f8551 Philipp Zabel 2017-03-17  1820  				    ARRAY_SIZE(mtk_hdmi_drivers));
8f83f26891e125 Jie Qiu       2016-01-04  1821  }
8f83f26891e125 Jie Qiu       2016-01-04  1822  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

