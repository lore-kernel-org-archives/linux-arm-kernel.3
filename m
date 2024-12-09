Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6870E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 04:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lH6BxlL+LIlSOkIzfnM5JN2p5ufz6XsSXI0MBwy8LH4=; b=fbd4PBO/uQaryNu9v/OoxOqp1p
	09/OONSjfuhnBlRIVwRldBwMu6emmwQSesvInWHR521ZaDKMYj6B4dDGfekjoRHmZ/pjnbdFYqFzB
	NDpNlnQO+kTSEgsmVcwoOAa+h/TezH3UmMV3Gj4vMbS08Yxzq1jGWqVWEj+M8ctkMgAj2tJ69u7Rb
	nv7eRnxfcQ7GqwG31X541Jhjr2ODfwwkWgnvPLmft7F65KGmFrhqUoUVMOsfweRIdG+EI4EGP0FRl
	cESEJL1a5KJZVb7zesopx665WMbkRPKlNgFf1vqPgTlPtRM5AEZfJWnJiVi5BFkaDqQWGFcwhSRHS
	yCOuPPYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKUyr-00000006Mk9-2UUR;
	Mon, 09 Dec 2024 04:02:45 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKUet-00000006JY5-2Db8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 03:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733715728; x=1765251728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jjCNDzZlfiFPST1Vis/4xXYsOg56hSTf+XAT+Z9Q2rE=;
  b=RyQH0EHvHV6WKj5tqN/kDh6vtFHEXIBhaqlOPrktF93zbNn9Tu+mn5Br
   tn56rRi8//AniAAUHykwk7ZLBv4Mc0jnSG4mcBZRWMvafdOAmcYw/OX6R
   SwiLvyhk0h/skYi3lfimW+u1FMfjf/KR/6qzQFPnEs+qytvhXKKUY5+FP
   tGmU5IxK6qiLNHjBBkLgPloiPAyu6JP+7i03xoke5MrDMJkKW5orq22c8
   UcfK/6rLsc3ZJgW/Rxx4mxNNvRdVKyd7D1+6ak+bHfKurMzIAmHdnHcuN
   sR4tURp8leuMY97wZMo2sRZIoa72anw9D7eSlFcXuf54h8d4CiH4o3wRk
   A==;
X-CSE-ConnectionGUID: Q34bcXxrRR6g7qBZZOrHKQ==
X-CSE-MsgGUID: B6AzrC+HT6KVM1YtT8GGZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34135609"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34135609"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 19:42:07 -0800
X-CSE-ConnectionGUID: Hbvqi3ZbQg6aI6/GpXdtlQ==
X-CSE-MsgGUID: 0/36i1gHQEmF+PLe0iTyfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94752221"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Dec 2024 19:42:02 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKUel-0003kL-0f;
	Mon, 09 Dec 2024 03:41:59 +0000
Date: Mon, 9 Dec 2024 11:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Chan <towinchenmi@gmail.com>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Message-ID: <202412070752.4Q1AOuGo-lkp@intel.com>
References: <20241206172735.4310-3-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206172735.4310-3-towinchenmi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_194207_615243_A3F2CDC0 
X-CRM114-Status: GOOD (  10.98  )
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

Hi Nick,

kernel test robot noticed the following build errors:

[auto build test ERROR on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Chan/dt-bindings-leds-backlight-apple-dwi-bl-Add-bindings-for-Apple-DWI-backlight/20241207-013254
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/20241206172735.4310-3-towinchenmi%40gmail.com
patch subject: [PATCH 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
config: hexagon-randconfig-001-20241207 (https://download.01.org/0day-ci/archive/20241207/202412070752.4Q1AOuGo-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070752.4Q1AOuGo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070752.4Q1AOuGo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/backlight/dwi_bl.c:46:9: error: implicit declaration of function 'FIELD_PREP' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
                  ^
>> drivers/video/backlight/dwi_bl.c:61:9: error: implicit declaration of function 'FIELD_GET' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return FIELD_GET(DWI_BL_CMD_DATA, cmd);
                  ^
   2 errors generated.


vim +/FIELD_PREP +46 drivers/video/backlight/dwi_bl.c

    37	
    38	static int dwi_bl_update_status(struct backlight_device *bl)
    39	{
    40		struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
    41	
    42		int brightness = backlight_get_brightness(bl);
    43	
    44		u32 cmd = 0;
    45	
  > 46		cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
    47		cmd |= FIELD_PREP(DWI_BL_CMD_TYPE, DWI_BL_CMD_TYPE_SET_BRIGHTNESS);
    48	
    49		writel(cmd, dwi_bl->base + DWI_BL_CMD);
    50		writel(DWI_BL_CTL_SEND, dwi_bl->base + DWI_BL_CTL);
    51	
    52		return 0;
    53	}
    54	
    55	static int dwi_bl_get_brightness(struct backlight_device *bl)
    56	{
    57		struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
    58	
    59		u32 cmd = readl(dwi_bl->base + DWI_BL_CMD);
    60	
  > 61		return FIELD_GET(DWI_BL_CMD_DATA, cmd);
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

