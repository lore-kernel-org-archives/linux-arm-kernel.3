Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E0DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 03:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlSOVj3RNQwrVssg9vrLY6RIAuEB4G02E9q2mSfLWEk=; b=wibvJibd5tYFCNoqWp3TOSo75K
	3PfF1fllv7Kc6md9frQwBOijUabA4aczY+xdNdMD76KQRV8vfa6ymCh9VILkBvNp3EexgcnXHEeRp
	EZqPBsxL7EBkUs8Hyo1HI51d2CmE0wJM6ODVtBPCc+E+MB49ptNsc3XbhWn2jxngAX4IsP4aYGIu+
	AIwF99NLBqBOAvpiFZ1yQI+Jx9HMOe4p0CjyLL43X+xTxfnXaWvGanQykhakQFjO1tIsPfcI/brMH
	PZAtAIK9fxvr/9NbqgTPwBctbkFQWL5iwDIUbgT6NA+1PH5XO4dSXo1MrMIE1iHoeyEfhX/O/Y05T
	QXyBQgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKUpn-00000006LO9-25Sr;
	Mon, 09 Dec 2024 03:53:23 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKUdy-00000006J99-2RUJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 03:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733715671; x=1765251671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ncK/sE8+KnlE+XPzzVk25YCDyXg/f1NqF+jwwsC606M=;
  b=HHyZMo3XGJP9tNSDMX9TWSlucSki+K1Asgyit8oT5WjdPj0oXSP/B7V5
   sufKNo2GRrabZ8oeJjurhXegPaKNDIZeEzT3OOUax1ixuwHqlCLxw978s
   IgsRpgL/wZo5tiUaPbsLfBhdGiRYkjclXvaXdyGb9D1dHNqZj6iBvYqNL
   Ol41dUBEmCMZVF3Ms3ZSKH+Vcl6oewNZFTLEEgm2hR7tZq1aP/07kQgq3
   0+uktZfQ9zDUeIc7gvDSVoxlyB1+XHhHsjhKiCym3abX+ZRM/MsyX0nfI
   Bw3WzfYQTyjxvDIzBum9YJ+wwK1rczGG4t2hqZ1mS1XWl5TdkaQR1Elet
   g==;
X-CSE-ConnectionGUID: 38EmR1LpRROz5InlY3KNJg==
X-CSE-MsgGUID: sIPDv7uyQP23bU0cH7uq1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33889105"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33889105"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 19:41:06 -0800
X-CSE-ConnectionGUID: X3YHOIjOT4KxtkQC+kKXTQ==
X-CSE-MsgGUID: nkT5gCzYSmOuxlFtB3DBpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95295523"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Dec 2024 19:41:02 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKUdn-0003kB-0K;
	Mon, 09 Dec 2024 03:40:59 +0000
Date: Mon, 9 Dec 2024 11:40:50 +0800
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
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Message-ID: <202412070721.9tZI9Ogl-lkp@intel.com>
References: <20241206172735.4310-3-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206172735.4310-3-towinchenmi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_194110_663666_785339AB 
X-CRM114-Status: GOOD (  11.52  )
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
config: arc-randconfig-001-20241207 (https://download.01.org/0day-ci/archive/20241207/202412070721.9tZI9Ogl-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070721.9tZI9Ogl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070721.9tZI9Ogl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/backlight/dwi_bl.c: In function 'dwi_bl_update_status':
>> drivers/video/backlight/dwi_bl.c:46:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
      46 |         cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
         |                ^~~~~~~~~~
   drivers/video/backlight/dwi_bl.c: In function 'dwi_bl_get_brightness':
>> drivers/video/backlight/dwi_bl.c:61:16: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      61 |         return FIELD_GET(DWI_BL_CMD_DATA, cmd);
         |                ^~~~~~~~~
   cc1: some warnings being treated as errors


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

