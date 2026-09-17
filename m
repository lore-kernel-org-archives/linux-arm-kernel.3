Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421A5C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huJYHmuvcXjAJQVgSmT/V8BPOrn1lpBlwYssdEv3PjQ=; b=RkHYCzBOeEtxyF4z5t6O1tYzGy
	c8sw/ldU6K6i8V6mwH1SSoTVov6Xe4G/oxw+hgxskZXW3M3fF46hwqHFukilbAT17+pdfv12bdnwB
	ql1aGETcUTrndL7g1SYrbIOcFKU0p5SM+VEU3gfNdjfY38qub86KHB14rCfquHvpKQBtNhWbPlxVq
	5YljB2MVEk4OiG99OaLpu8GlTPrh4/8gUudkc7EUZsu58YEcFbnV4SeWsmAXLbHdpao2LkLkit3f6
	vCQD5L5UFZ5BGlDpH5OvqZuHFzjIkDry+nHCg1Y7xTMHpo2GgSJtqp2yaqVHOJ6gBLH7K5pYedrIR
	Qd2TA7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Cch-0000000BTXw-3wX4;
	Thu, 17 Sep 2026 13:57:59 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ccd-0000000BTXE-2cXL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 13:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789653475; x=1821189475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mx3gficTDYddR9ZowafVEAXBGtTvRLt8DqNH3hi4f/M=;
  b=AefP0ZTXmECvDRWCbNeImTZ5cBpqDhe/QUy0xGyE+FwtlDbMpGTfJVK4
   tOYJFQtoWuaH6E/ovBTuwnX/E8+Kt6uftaa23CiwpHmKzF7v1/N3U1/ww
   ectzYspwQO/SQQjO3i/bl5BkQtd8XuEEWYiTMGV1ADI8+slFi/7ppdDoS
   oOLVX75U2xYS9fUTwq1eFd+RHJRk/PfMzsKIl6vgz5g6iPCH8YCmPbQRK
   b/GWOuz64/BPdcljRN+Hp+RfzaA5Dc6ro7ghWGVENrZUz6hXhqeE9oLyJ
   F/EbfOgOg4fEuDNC4mom0VR7j9d4w8qMu/q6v37zU2A1cHS//L72PMEAB
   w==;
X-CSE-ConnectionGUID: P6gGlD0xQcifCUgUTLlc1Q==
X-CSE-MsgGUID: tc7cGJgAQ9GjHYM9DX3BLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89210060"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89210060"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 06:57:54 -0700
X-CSE-ConnectionGUID: wEmSy5MOTBOitG1Ulztj4A==
X-CSE-MsgGUID: cpUIdU5pSoivgcC8Aqz+hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297299998"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Sep 2026 06:57:51 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7CcW-000000007vt-2BMc;
	Thu, 17 Sep 2026 13:57:48 +0000
Date: Thu, 17 Sep 2026 21:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, airlied@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	jernej.skrabec@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	samuel@sholland.org, simona@ffwll.ch, tzimmermann@suse.de,
	wens@kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Fix pdev reference leak in
 sun8i_r40_tcon_tv_set_mux()
Message-ID: <202609172103.AfhCF3XZ-lkp@intel.com>
References: <20260916182412.2091681-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916182412.2091681-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_065755_674048_80878F5C 
X-CRM114-Status: GOOD (  14.92  )
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

Hi Wentao,

kernel test robot noticed the following build errors:

[auto build test ERROR on sunxi/sunxi/for-next]
[also build test ERROR on daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v7.3-rc3 next-20260916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/drm-sun4i-Fix-pdev-reference-leak-in-sun8i_r40_tcon_tv_set_mux/20260916-182412
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20260916182412.2091681-1-vulab%40iscas.ac.cn
patch subject: [PATCH] drm/sun4i: Fix pdev reference leak in sun8i_r40_tcon_tv_set_mux()
config: alpha-randconfig-r1306-20260917 (https://download.01.org/0day-ci/archive/20260917/202609172103.AfhCF3XZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609172103.AfhCF3XZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609172103.AfhCF3XZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/sun4i/sun4i_tcon.c: In function 'sun4i_tcon_init_clocks':
>> drivers/gpu/drm/sun4i/sun4i_tcon.c:811:21: error: 'pdev' undeclared (first use in this function); did you mean 'dev'?
     811 |         put_device(&pdev->dev);
         |                     ^~~~
         |                     dev
   drivers/gpu/drm/sun4i/sun4i_tcon.c:811:21: note: each undeclared identifier is reported only once for each function it appears in


vim +811 drivers/gpu/drm/sun4i/sun4i_tcon.c

   785	
   786	static int sun4i_tcon_init_clocks(struct device *dev,
   787					  struct sun4i_tcon *tcon)
   788	{
   789		tcon->clk = devm_clk_get_enabled(dev, "ahb");
   790		if (IS_ERR(tcon->clk)) {
   791			dev_err(dev, "Couldn't get the TCON bus clock\n");
   792			return PTR_ERR(tcon->clk);
   793		}
   794	
   795		if (tcon->quirks->has_channel_0) {
   796			tcon->sclk0 = devm_clk_get_enabled(dev, "tcon-ch0");
   797			if (IS_ERR(tcon->sclk0)) {
   798				dev_err(dev, "Couldn't get the TCON channel 0 clock\n");
   799				return PTR_ERR(tcon->sclk0);
   800			}
   801		}
   802	
   803		if (tcon->quirks->has_channel_1) {
   804			tcon->sclk1 = devm_clk_get(dev, "tcon-ch1");
   805			if (IS_ERR(tcon->sclk1)) {
   806				dev_err(dev, "Couldn't get the TCON channel 1 clock\n");
   807				return PTR_ERR(tcon->sclk1);
   808			}
   809		}
   810	
 > 811		put_device(&pdev->dev);
   812	
   813		return 0;
   814	}
   815	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

