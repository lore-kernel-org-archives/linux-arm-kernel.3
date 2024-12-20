Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38088E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 16:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+P12V1I0r+W5/jHz9FSS7SLl9bMfyv4tnYB+wEwLII=; b=S0ar0RYinIM20L28e/Ok9wexEC
	+amA4VVafwe20apHPkXzPC+4fyTODNXM4Ac6pPW5bVuxkwMSQBgl61MJ8dwwKakqj42TuiC114Lrh
	31JhJ0A0Wm8iSF+cxEyMwdW44U5YLirZB5clyCzfIv3c4cS38S/eoHqLt0yaOtGC+ZRkuUU/PXEu5
	BGC9CvQJAevFuYJdKCyLCYUEpmd1tFPYFFFSxfIkIqy/T+3VeLOs0A1lI9SjRG4YfMG94CWPjDy7+
	Vqzibq/PZwQ2keenSxXNbQbc4qzr7Jgb5EkavfgRLb+pluFXEHWp20HhZ9CAW6v5oLS5vkKzqfWDR
	5PRL7FQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfuL-00000005TQI-1vIS;
	Fri, 20 Dec 2024 16:31:21 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfqv-00000005SxN-2XtI;
	Fri, 20 Dec 2024 16:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734712069; x=1766248069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jxHFAYBCnlTrcSh9H+awIzGplyXuNovtWtAuZm7pl1I=;
  b=L23BlazE1g3T5AUTNwCKdDFxMyMvwrvBKPTAK3dmj1zBVQd23+Kz6eGF
   0brDJf5sJDoAqCrPDoQ2aR/n2cX9euuCr4k9dyM4Scv/SU09cx8A07R/2
   B2Si5cbF0Cs+UOWsjfGqptA30ePkX1w7ogiVxdrXY/G9Xus7Jsa65lsgM
   yrrtuLBel0krBGkea2RV1n30tH5D7xaVf0oR8qU/O6HoOFFq24zzlDB9A
   jvJRqn8xKgBVOtcmAW5fNlr3/u7gog+DMvUltFv+LJSThpqTHnw607bQp
   3SdJbgon/mrfzlc/zDB1JIgCxaXPd9wNNSiSjvWKkNVBKAd6TADbHbm8r
   w==;
X-CSE-ConnectionGUID: sp7nEyfuRdm3Ug6AdL+XDw==
X-CSE-MsgGUID: Jsc266jZS++5/qKXODKW0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35386487"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="35386487"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 08:27:49 -0800
X-CSE-ConnectionGUID: uhwcfmA7QfC75GZdThI05w==
X-CSE-MsgGUID: 7mYO4CX0STi+NZeBJWqDng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="98328861"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2024 08:27:46 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOfqp-0001P1-28;
	Fri, 20 Dec 2024 16:27:43 +0000
Date: Sat, 21 Dec 2024 00:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: ot907280 <ot_cathy.xu@mediatek.com>, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
	linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>,
	ot907280 <ot_cathy.xu@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: Add support for MT8196
Message-ID: <202412210007.sMeJEMYf-lkp@intel.com>
References: <20241211055454.17120-3-ot_cathy.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211055454.17120-3-ot_cathy.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_082749_687550_6790F481 
X-CRM114-Status: GOOD (  10.45  )
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

Hi ot907280,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ot907280/pinctrl-mediatek-Add-support-for-MT8196/20241211-140107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241211055454.17120-3-ot_cathy.xu%40mediatek.com
patch subject: [PATCH] pinctrl: mediatek: Add support for MT8196
config: sparc64-randconfig-r071-20241219 (https://download.01.org/0day-ci/archive/20241221/202412210007.sMeJEMYf-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210007.sMeJEMYf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210007.sMeJEMYf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sparc64-linux-ld: drivers/pinctrl/mediatek/pinctrl-mt8196.o:(.data+0xa0): undefined reference to `mtk_paris_pinctrl_pm_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

