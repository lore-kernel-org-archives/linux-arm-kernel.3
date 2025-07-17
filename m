Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B87C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 20:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btnQhzarulwbLxm5Wfc2hc6orCS8fh/kqLPZHqU1lrU=; b=kmYRuwfu3opcVJ0MmL9gQTnXw3
	bOPy0GArm0WlHVHOOeR9joZEevIMva/4zwyW4rbKHWsvEfODv/6xIQYKgUxwNnp1Gbk89jXeMgfI5
	6zyrTxDh2SoHBhHG7lto6wWsF8a79zD8AiWcHzI90ehV0XaJ6o/LgOdiD+sT62yPVUqsLq0KGkkgA
	uhnmgQCISIWcPPvtFZsb3Zu6oI4AS9OFzExiqLmD1UbOe9bjL/UnOlRrUFGULXaBk5I14vz9dpDg3
	ei7AbRbdWQ1+aLxpaHUNN3VhOR98wG1k9hp64v2MTCKPY12rAyTrrn6x8c3G3fkAhSWkj8g9HHaja
	O+jA2VGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucVTz-0000000B7AH-1ROy;
	Thu, 17 Jul 2025 20:45:35 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucVP8-0000000B6Z3-05j9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 20:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752784835; x=1784320835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PdIbTdktWh/WBwrcyr3gCqj0Qy8ntRTyRqr3z/psMAs=;
  b=YRBojVwcrxX3CdYcyHMMjJEElpvASNG1SFW2jG9NXLXYPYb7OPJWNLex
   xjIMh4X/CqHs2rSnF71QWsFxzWwJJg7glcfL6+BWXTJDnfq6TBbQ7NFm5
   ASfLKtyajCUtNIGcPIiEpUkZF4PukmVLVSaBaVy6z/LZy48ibczcdg00p
   iN7svrvmriuJwR5Jo2YBCY0QVj3mGceFx8MP8ZzSDLwjnmUn4mU46fRL9
   O6ojCQzIo7RiqDTsBdcB0ras9H5yfEpPaF5T0Bz/l8THcoaJXF6Wgi0D6
   p4NrxKcVeI45/2OAqWCk/fPST37RPlPwrJn/m4Ro4y8iJcWSeE1/QYAM1
   w==;
X-CSE-ConnectionGUID: XjySN7+CSUeNXamI33ZAGg==
X-CSE-MsgGUID: 65qGBKqrSxCG/9VAS5afdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55200015"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="55200015"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 13:40:34 -0700
X-CSE-ConnectionGUID: IuN4fVvGSIalVbCR9aDz2Q==
X-CSE-MsgGUID: BkOKgBq2Qm2hEkuq4K7EAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="158585075"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jul 2025 13:40:29 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucVP1-000E0Z-0X;
	Thu, 17 Jul 2025 20:40:27 +0000
Date: Fri, 18 Jul 2025 04:39:46 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 19/24] media: i2c: maxim-serdes: add MAX96724 driver
Message-ID: <202507180433.nXvvwmFy-lkp@intel.com>
References: <20250716193111.942217-20-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716193111.942217-20-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_134034_271841_FD725988 
X-CRM114-Status: GOOD (  11.90  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250716]
[also build test ERROR on v6.16-rc6]
[cannot apply to robh/for-next staging/staging-testing staging/staging-next staging/staging-linus arm64/for-next/core linus/master v6.16-rc6 v6.16-rc5 v6.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/media-mc-Add-INTERNAL-pad-flag/20250717-033901
base:   next-20250716
patch link:    https://lore.kernel.org/r/20250716193111.942217-20-demonsingur%40gmail.com
patch subject: [PATCH v6 19/24] media: i2c: maxim-serdes: add MAX96724 driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250718/202507180433.nXvvwmFy-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180433.nXvvwmFy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180433.nXvvwmFy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/maxim-serdes/max96724.c:273:6: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     273 |                                  FIELD_PREP(MAX96724_PWR1_RESET_ALL, 1));
         |                                  ^
   drivers/media/i2c/maxim-serdes/max96724.c:494:6: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     494 |                                  FIELD_PREP(MAX96724_MIPI_TX10_CSI2_LANE_CNT,
         |                                  ^
   drivers/media/i2c/maxim-serdes/max96724.c:693:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     693 |                            FIELD_PREP(MAX96724_MIPI_TX13_MAP_SRC_DT,
         |                            ^
   drivers/media/i2c/maxim-serdes/max96724.c:741:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     741 |                                   FIELD_PREP(MAX96724_MIPI_TX57_TUN_DEST,
         |                                   ^
   drivers/media/i2c/maxim-serdes/max96724.c:914:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     914 |                             FIELD_PREP(MAX96724_PATGEN_0_VTG_MODE,
         |                             ^
   drivers/media/i2c/maxim-serdes/max96724.c:957:6: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     957 |                                  FIELD_PREP(MAX96724_VPRBS_PATGEN_CLK_SRC,
         |                                  ^
   drivers/media/i2c/maxim-serdes/max96724.c:985:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     985 |                                   FIELD_PREP(MAX96724_PATGEN_1_PATGEN_MODE,
         |                                   ^
   7 errors generated.


vim +/FIELD_PREP +273 drivers/media/i2c/maxim-serdes/max96724.c

   262	
   263	static int max96724_reset(struct max96724_priv *priv)
   264	{
   265		int ret;
   266	
   267		ret = max96724_wait_for_device(priv);
   268		if (ret)
   269			return ret;
   270	
   271		ret = regmap_update_bits(priv->regmap, MAX96724_PWR1,
   272					 MAX96724_PWR1_RESET_ALL,
 > 273					 FIELD_PREP(MAX96724_PWR1_RESET_ALL, 1));
   274		if (ret)
   275			return ret;
   276	
   277		fsleep(10000);
   278	
   279		return max96724_wait_for_device(priv);
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

