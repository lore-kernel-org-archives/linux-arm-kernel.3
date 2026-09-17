Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7003CC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 20:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDONWVVIZU8H42EHkjWcB4aqmSBzE1naxZ+EUsVGdKM=; b=DPCs5X6rtIESjoYJQDfBh3nUpg
	LsX16Pa5uSzADPFzcoFlsbUFrApm/kSmucip44+iMevOjpsUAijru9Hg5TaStlHr2gnEFSI3ViqCH
	YZBGg/hT8HnGbdToawAA2/kkxY7mbxlODMZeEvcKrW/jUgvtufEaxqYmRNF1s+bsRXR1pD6PgDjV2
	whds6m6nQw0xrcwlbt+UKUCIS2yvGv5KOHd8j1rWOPLI77GhTI0YyUOWLO36xi+VGTMJGPUTL85VA
	dewJDX3U78n0d3oA64u0vEfpeTmKwaMOUXMvvnsyOCBT/VPw0h35x5lWpGVzVoXP37hM/WxvGwE1i
	A14NrDqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IkJ-0000000CQhg-1GQa;
	Thu, 17 Sep 2026 20:30:15 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IkH-0000000CQh9-0KKR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 20:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789677013; x=1821213013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O4E/r/TO4Ia/0BjZxJmv84fyinvl9/+1ynT1NWdhvas=;
  b=Y/O9H4/JvHtY233JWEPekKTQrT47IzeBjH2m2xL0I4gZeAarqOYsKruj
   tW2acy7rx8ifiOxI+LWOxmoAhsaTsJZTI/bGoUaZMcMtaqd6omlCUGdRS
   8GVKrupUQ0JcC5hzhrTG8IebXj7LS33kOPzxKft7/Z9GHiCDnlw8xvWzs
   6IpIHgnWvvo2ZMgWjbhcrkdyXeORb5QdOx02gBmp9dZZRW8P05r4kJu1B
   cEAfnN/AsbYafHz5OKofO91wUxW7MGBVZfJg9YqsgGIxci8SMwIvvc07f
   gmAokr81FsUUug0dyCkw9JJTU/NbjdqF8KXC3qKfPFFhmUWSUlPFTuybD
   g==;
X-CSE-ConnectionGUID: 8cCsNA1xT2Wwkb55ADtzdQ==
X-CSE-MsgGUID: Ey738OC+T2mMH915lD/TvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90007926"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90007926"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 13:30:12 -0700
X-CSE-ConnectionGUID: dSxZsrCVRm6JjrCxhaBwiw==
X-CSE-MsgGUID: LwfJGjC0QIGxUw/0hFem2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267777446"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2026 13:30:08 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7Ik9-000000008TJ-42b7;
	Thu, 17 Sep 2026 20:30:05 +0000
Date: Fri, 18 Sep 2026 04:29:06 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, airlied@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, samuel@sholland.org, simona@ffwll.ch,
	tzimmermann@suse.de, wens@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Fix pdev reference leak in
 sun8i_r40_tcon_tv_set_mux()
Message-ID: <202609180443.vTkwAZL6-lkp@intel.com>
References: <20260916182412.2091681-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916182412.2091681-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_133013_137407_191F65DC 
X-CRM114-Status: GOOD (  12.21  )
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260918/202609180443.vTkwAZL6-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7252edd9aa82ef1c570ff6694ef7f4763a8a5d2f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180443.vTkwAZL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180443.vTkwAZL6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/sun4i/sun4i_tcon.c:811:14: error: use of undeclared identifier 'pdev'; did you mean 'dev'?
     811 |         put_device(&pdev->dev);
         |                     ^~~~
         |                     dev
   drivers/gpu/drm/sun4i/sun4i_tcon.c:786:50: note: 'dev' declared here
     786 | static int sun4i_tcon_init_clocks(struct device *dev,
         |                                                  ^
>> drivers/gpu/drm/sun4i/sun4i_tcon.c:811:20: error: no member named 'dev' in 'struct device'
     811 |         put_device(&pdev->dev);
         |                     ~~~~  ^
   2 errors generated.


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

