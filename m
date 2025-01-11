Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D495DE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 07:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQ7weLWozXP3SLb2Wl0AtWwJfZ+nGTX1B49g/tWuzKM=; b=vXNwBDbtsYMEs5A8bjCdUYQtgZ
	986sjdqhe2Ndmdia5CnFpHcPoKzMgLKn01aXbyj+125UNCplg4okdGsFekwaN7g9q6101u2eA/Uc8
	VNFMx7j5TspIqTyE1yV1UZC9DvxZ0azkavLvI4d9WBcr5VtIv02yBxBcdPzxvP55a4TQm9Fxq8mq7
	H1kj+XP1S7rFlkIjibl+b9SAFNc570PLtgY2AGEVcOXKHOfR8rFXth24/o04RFlZ5LauXYOz82n/H
	KpPbbfh1vbqTHmCmtNcN8HOH02GM2NL/AzTcggbT84RjPmJxUTO2NmvmU0Y1IpYimDpKpVJqMam+M
	/LDRrjcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWWFZ-00000000Nu2-05tU;
	Sat, 11 Jan 2025 07:49:41 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWWEJ-00000000Nlb-0yH5;
	Sat, 11 Jan 2025 07:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736581703; x=1768117703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fo3Nyik4IoaUbdBCHzX/7gw3smsm4pD3krSrVo4Mm+o=;
  b=BF5eHiqYat8F27BpPWzP0hbLGH7VFkAopffl0BAyqLYR8A0/hosadKJA
   BwDG0QcM2KhzPBLEAixBqhFv4cNS0SM9Q73JhjATHDqy85YQl+8Ifl658
   2SBwjNGnpQhLHeiA3Yiiz5qdNGRPHVcSW5EZA3/T7al5HJdvqyALZbTg8
   AQaMp+APrOCy+QnFKSOVnWGGiIbfgO88JJyTUtpm71x+pB7G0M9doxPuv
   r5pjeyn1RSAl3O0/iTFptantXw/l+ltvX/jern9vsGdFTys7e9+7ndX2+
   5fCGIKJf0BJzhSMExlPHNFSxOJu1PKbO/K/7BdnUvpixZ6SDrJxPqnLCq
   w==;
X-CSE-ConnectionGUID: DwL2/38VQjWzoSxop+ZJsQ==
X-CSE-MsgGUID: 0KDljXZnTHyrqPFytfaHUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="54424943"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="54424943"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 23:48:17 -0800
X-CSE-ConnectionGUID: GiJZoRTOSeiC0hZFzYsRWg==
X-CSE-MsgGUID: VhYXp1TpQOeJ9sXXpdQuNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134841946"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2025 23:48:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWWE6-000KMF-29;
	Sat, 11 Jan 2025 07:48:10 +0000
Date: Sat, 11 Jan 2025 15:47:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ao Xu <ao.xu@amlogic.com>
Subject: Re: [PATCH 03/11] drm: meson: add S4 compatible for DRM driver
Message-ID: <202501111505.wNSI9zrC-lkp@intel.com>
References: <20250110-drm-s4-v1-3-cbc2d5edaae8@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110-drm-s4-v1-3-cbc2d5edaae8@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_234823_311959_7E2645C6 
X-CRM114-Status: GOOD (  11.63  )
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

Hi Ao,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab]

url:    https://github.com/intel-lab-lkp/linux/commits/Ao-Xu-via-B4-Relay/dt-bindings-display-meson-dw-hdmi-Add-compatible-for-S4-HDMI-controller/20250110-134113
base:   6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
patch link:    https://lore.kernel.org/r/20250110-drm-s4-v1-3-cbc2d5edaae8%40amlogic.com
patch subject: [PATCH 03/11] drm: meson: add S4 compatible for DRM driver
config: arm64-randconfig-002-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111505.wNSI9zrC-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111505.wNSI9zrC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111505.wNSI9zrC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/meson/meson_drv.c:541:3: error: no member named 'dev' in 'struct device'; did you mean 'devt'?
     541 |                 drm_err(dev, "suspend error: %d", ret);
         |                 ^
   include/drm/drm_print.h:601:2: note: expanded from macro 'drm_err'
     601 |         __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
         |         ^
   include/drm/drm_print.h:588:35: note: expanded from macro '__drm_printk'
     588 |         dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
         |                                          ^
   include/linux/device.h:794:10: note: 'devt' declared here
     794 |         dev_t                   devt;   /* dev_t, creates the sysfs "dev" */
         |                                 ^
   1 error generated.


vim +541 drivers/gpu/drm/meson/meson_drv.c

   530	
   531	static int __maybe_unused meson_drv_pm_suspend(struct device *dev)
   532	{
   533		int ret;
   534		struct meson_drm *priv = dev_get_drvdata(dev);
   535	
   536		if (!priv)
   537			return 0;
   538	
   539		ret = drm_mode_config_helper_suspend(priv->drm);
   540		if (unlikely(ret)) {
 > 541			drm_err(dev, "suspend error: %d", ret);
   542			return ret;
   543		}
   544	
   545		meson_setup_clk(priv, false);
   546	
   547		return ret;
   548	}
   549	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

