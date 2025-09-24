Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D339CCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 17:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/9j5vmJ4hrvShr9ivPZzPOHIhWnRzbwcr8xeM7YB00=; b=tQZSSQ471rvrEgkvI9jrYUb76X
	WuuNcocRP4SeRJbd5U4+NgFrUGxG3+ZKC1tiNWjS2ZlePoA5y0xsOEry0+1aanzuHrn+u3eNDtGtw
	d5zP3G20D/JA4c7G/0bZ5ISKkuhLWeauegME3uY2qwg5QI7R+xWGCKuDmrxG4KzAFTVlzmQofr5xN
	ajHA0MNTKIJba1sg0dtFnVzxoG6lhOgszaVAyU/Hl4zhI6DpPS2lbnedBNMy0T3Ts70oGBiltjxKq
	yoKaqrEjK5KJoyFCOuXVLKLqXMP1cXBQ1AVF8JEfNASRfXcB1Bjg8rEr86frepc5DEsn8HkofXbwd
	9UNSHNvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1SzE-00000001ztl-1Mqs;
	Wed, 24 Sep 2025 17:09:00 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1SzB-00000001zqX-0AQV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 17:08:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758733737; x=1790269737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aeWps3hGKLyWKjZOJweWrTxcCTaDaWqTIIpaS/fAWuQ=;
  b=kdtYYHnoX/d1zW5X2nXmjJEBQjXAKUV5+fsk6NYN9LjBfa5xKDbvygzX
   /y2JQmRZyOQPROzq9CjLliTD6aiugr2mSgViiog7tpRK7idFc4rE2Y/+L
   yf99AVdgqY+nBMm8jpe7YQWahPkZey5v+G5/3jGNKcyuIVoYby0t+2MqL
   AS/vavZTBIEFI/iNKClbUAfK2rr+ZCIlDi9fmwfKZAPfYoSH1xUN99tYW
   b183CoZ2XaNSEoAbnog9P15R1/xF2kT8MJ/xW4pn0cunj/ZGpE32kD0wb
   gKjwmk/Vo+/RalOnM5ARilBi0GVWs33kH8GWi7Jk4M1gm/BRVN7tdauFz
   Q==;
X-CSE-ConnectionGUID: XQxJ1d0tQBWHgUGt57urSg==
X-CSE-MsgGUID: FqTyU2JaRgqjktmOgy6a2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="83643416"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="83643416"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 10:08:45 -0700
X-CSE-ConnectionGUID: Yhq3NqxFTYOm0i0PtY1iGg==
X-CSE-MsgGUID: dDWvxP7bSZ+FFgPaJk9r+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="181473381"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Sep 2025 10:08:40 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1Sys-0004NB-0I;
	Wed, 24 Sep 2025 17:08:38 +0000
Date: Thu, 25 Sep 2025 01:07:45 +0800
From: kernel test robot <lkp@intel.com>
To: Shenwei Wang <shenwei.wang@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: Re: [PATCH v2 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Message-ID: <202509250023.gNpm32hs-lkp@intel.com>
References: <20250922200413.309707-4-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922200413.309707-4-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_100857_154954_80A928FE 
X-CRM114-Status: GOOD (  12.62  )
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

Hi Shenwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on brgl/gpio/for-next shawnguo/for-next linus/master v6.17-rc7 next-20250923]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenwei-Wang/dt-bindings-remoteproc-imx_rproc-Add-rpmsg-subnode-support/20250923-040844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20250922200413.309707-4-shenwei.wang%40nxp.com
patch subject: [PATCH v2 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
config: arm64-randconfig-r121-20250924 (https://download.01.org/0day-ci/archive/20250925/202509250023.gNpm32hs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509250023.gNpm32hs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509250023.gNpm32hs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-imx-rpmsg.c:410:44: sparse: sparse: Using plain integer as NULL pointer

vim +410 drivers/gpio/gpio-imx-rpmsg.c

   405	
   406	static void imx_rpmsg_gpio_remove_action(void *data)
   407	{
   408		struct imx_rpmsg_gpio_port *port = data;
   409	
 > 410		port->info.port_store[port->idx] = 0;
   411	}
   412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

