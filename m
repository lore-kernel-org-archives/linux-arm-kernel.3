Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F40DC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 20:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6z7QFDFQQWZTPcIYG1N+mBlJl1O+AJOze8wDpcjoZsc=; b=UF4/rkfe+1tPq8rZ5bsbq7akqn
	5SFr8DCaNh4DusH6H/OkLnG9LZDr96fCnLXA8+n+RyLlvRhORDuqaJ3jLg6YKjQ8hQocurLMQeeYz
	rcnR/jGIW8EB1XxBeKVOpM8mzDI79Kolof2uXGQ0Se6/1/w6LexKHVVIDDuGQrPQ0viDDL1Xg3Rxd
	zw5grOT1/mXgjvuLdHzKnH1eZjCK7KiMt+r1q36JwSeI8VNtf50ZcKekQgbCVNgrMMfHFiePFYfcj
	in2Ttc76ax0AKxPY0KNHOhga5Wlc1hWv/Q4jxiXY9weNLXHSix2aGqkWSmZrLfWNn4qmPSbfrAqdO
	cimaOlPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucVGv-0000000B5zz-44TM;
	Thu, 17 Jul 2025 20:32:05 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucVEU-0000000B5k3-1B2h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 20:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752784175; x=1784320175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C6FdhU3UGgV2AuO9mM334Y3xFvIMzWgfEMGceIlV6tA=;
  b=QJgeC7mzrF50Mg9BWWp2LbyaB3n5aviU7Du0is17ICPkTSUk2247sc8V
   ZblH+Pim5JcOA2LuCIUPEfL3cac+mhSkreRoNK4kE9KwTLZaBQ6Hg/7TF
   cNDAQH0bJ/qh2M3X9lfaIpD3JI3uTKC1pNxRhuT+D3XFxr/PYxt7dHBY3
   QxiSyeGGT4phB+UVk0QjUi8LKySQcljk6mSJDf0/vYGpWomKLu7cI2UoU
   SL50RoPDVL55tidpERQn6CJKSwW2D+oUD1MZTCIjPBVKwTFNRJ8FOip3U
   PG0QPx5qLip4og6g44GAdyws40o1VzrD+z5P00leU8pJjGXEJbQkzO5Fy
   g==;
X-CSE-ConnectionGUID: l25hyWngSGCEWikS5jDPPg==
X-CSE-MsgGUID: Ub0gf1veSuO7zXERPLq+uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55199025"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="55199025"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 13:29:33 -0700
X-CSE-ConnectionGUID: IRcuRXtURFCGgyf33KkCAg==
X-CSE-MsgGUID: TM9lQl1yQcCDNX9X15Gm1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="158583072"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jul 2025 13:29:28 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucVEM-000E03-0r;
	Thu, 17 Jul 2025 20:29:26 +0000
Date: Fri, 18 Jul 2025 04:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 18/24] media: i2c: maxim-serdes: add MAX96717 driver
Message-ID: <202507180404.Rvs0GsdN-lkp@intel.com>
References: <20250716193111.942217-19-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716193111.942217-19-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_132934_364904_05388A65 
X-CRM114-Status: GOOD (  11.04  )
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

Hi Cosmin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250716]
[also build test WARNING on v6.16-rc6]
[cannot apply to robh/for-next staging/staging-testing staging/staging-next staging/staging-linus arm64/for-next/core linus/master v6.16-rc6 v6.16-rc5 v6.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/media-mc-Add-INTERNAL-pad-flag/20250717-033901
base:   next-20250716
patch link:    https://lore.kernel.org/r/20250716193111.942217-19-demonsingur%40gmail.com
patch subject: [PATCH v6 18/24] media: i2c: maxim-serdes: add MAX96717 driver
config: nios2-kismet-CONFIG_GENERIC_PINCONF-CONFIG_VIDEO_MAX96717-0-0 (https://download.01.org/0day-ci/archive/20250718/202507180404.Rvs0GsdN-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250718/202507180404.Rvs0GsdN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180404.Rvs0GsdN-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_PINCONF when selected by VIDEO_MAX96717
   WARNING: unmet direct dependencies detected for I2C_MUX
     Depends on [n]: I2C [=n]
     Selected by [y]:
     - VIDEO_MAXIM_SERDES [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y]
   
   WARNING: unmet direct dependencies detected for GENERIC_PINCONF
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - VIDEO_MAX96717 [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y]
   
   WARNING: unmet direct dependencies detected for GENERIC_PINMUX_FUNCTIONS
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - VIDEO_MAX96717 [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y]
   
   WARNING: unmet direct dependencies detected for GENERIC_PINCTRL_GROUPS
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - VIDEO_MAX96717 [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y]
   
   WARNING: unmet direct dependencies detected for I2C_ATR
     Depends on [n]: I2C [=n]
     Selected by [y]:
     - VIDEO_MAXIM_SERDES [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

