Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA84ED116F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 05:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVt68Z/y86rSlrTA8oXUuUJZFOj9STogh+IlSBUcdBM=; b=UhvTQVJx1QRQmIpcmdYCO5Zp9I
	dvwNtarBBdKDyIurVGXkuwmuW6Ji3pybNPsJGLOcNGrSQsQA9b0Pv4ocuXyNeUpyb/BGbcnB15x/R
	ZV10XyIxfq+qo2Ckcz2uipRIQgGwBfwdD1IzxqCcAoCYf3WxeFYzrqfo2EYMQ7uBkywXvpwV8CE35
	9KKBLgkYd0M+w1u27imVOXwGjYp++0Bz52PUnk434a3XMB2BgEy3/kimpQeXL0nTPxbX4MoUXluOC
	HNVxPxFy0qZMZWFkkTgCR8ZMucgpEF5cmWKYTgyiTXMcY8hymrYVDxlbZSWWwqHrfOcx+O8Lce3DD
	gbNF/40A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4DC7-00000002bQf-3P2W;
	Fri, 25 Oct 2024 05:49:07 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4D91-00000002b5N-2IWc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 05:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729835156; x=1761371156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d6JyXPx+kHE4nYoocbnftXCWw7YO4qfXOoYUCXuMLxA=;
  b=VhdVuBg1oOL6bgOpCzlIf+zVqrWkNHYmnB31ZN4tB3n2NwbTT474mx5i
   wZ+nwqag2vUv/GkqpWBGFlMWe4/xAU0Iyy1wMKE6S6escFvTceUbqn5WX
   bNFCY4dMauQgmbZcWMohkg7cC0fVo/77zxDujjwuTlcuvzzWSdwVrdYkO
   WbukQcGzbrlZB1pjsu3F/sKAWE/p7UP4FQ2gXDjxFkcr8G2g/TThFRJxd
   hrAxbmLgAeUuzxGQmsctV+F05CTH1Cx+KTnRKxfS+l+gio8uVHZeCQNeh
   yyxjNIQQ25BF9QvM4W3+8DPfQJXqALOfRouMh+Jyi13paDfNc6b3cYZEx
   Q==;
X-CSE-ConnectionGUID: ETX1/qmrQa2/eYSgESs4Ag==
X-CSE-MsgGUID: lSODMoyDSfammsKlfaxZhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40868326"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="40868326"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 22:45:47 -0700
X-CSE-ConnectionGUID: 8RRHYjSZR/mmg5cNN9rESg==
X-CSE-MsgGUID: j9kwpRVPQfu+hTcVUF9OoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="104136408"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Oct 2024 22:45:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4D8m-000Xdu-1s;
	Fri, 25 Oct 2024 05:45:40 +0000
Date: Fri, 25 Oct 2024 13:44:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com,
	David Airlie <airlied@gmail.com>,
	Hamza Mahfooz <hamza.mahfooz@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Simon Ser <contact@emersion.fr>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	nouveau@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] drm: remove driver date from struct drm_driver and
 all drivers
Message-ID: <202410251351.r16zfufe-lkp@intel.com>
References: <20241024162240.2398664-2-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024162240.2398664-2-jani.nikula@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_224555_614562_08BE4D1A 
X-CRM114-Status: GOOD (  12.55  )
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

Hi Jani,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20241024]
[cannot apply to drm-exynos/exynos-drm-next shawnguo/for-next drm-xe/drm-xe-next linus/master v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-remove-driver-date-from-struct-drm_driver-and-all-drivers/20241025-002344
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241024162240.2398664-2-jani.nikula%40intel.com
patch subject: [PATCH 2/2] drm: remove driver date from struct drm_driver and all drivers
config: i386-buildonly-randconfig-004-20241025 (https://download.01.org/0day-ci/archive/20241025/202410251351.r16zfufe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251351.r16zfufe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251351.r16zfufe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/accel/qaic/qaic_drv.c:211:10: error: 'const struct drm_driver' has no member named 'date'
     211 |         .date                   = "20190618",
         |          ^~~~
>> drivers/accel/qaic/qaic_drv.c:211:35: warning: initialization of 'unsigned int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
     211 |         .date                   = "20190618",
         |                                   ^~~~~~~~~~
   drivers/accel/qaic/qaic_drv.c:211:35: note: (near initialization for 'qaic_accel_driver.driver_features')
   drivers/accel/qaic/qaic_drv.c:211:35: warning: initialized field overwritten [-Woverride-init]
   drivers/accel/qaic/qaic_drv.c:211:35: note: (near initialization for 'qaic_accel_driver.driver_features')


vim +211 drivers/accel/qaic/qaic_drv.c

c501ca23a6a306 Jeffrey Hugo 2023-03-27  205  
c501ca23a6a306 Jeffrey Hugo 2023-03-27  206  static const struct drm_driver qaic_accel_driver = {
c501ca23a6a306 Jeffrey Hugo 2023-03-27  207  	.driver_features	= DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
c501ca23a6a306 Jeffrey Hugo 2023-03-27  208  
c501ca23a6a306 Jeffrey Hugo 2023-03-27  209  	.name			= QAIC_NAME,
c501ca23a6a306 Jeffrey Hugo 2023-03-27  210  	.desc			= QAIC_DESC,
c501ca23a6a306 Jeffrey Hugo 2023-03-27 @211  	.date			= "20190618",
c501ca23a6a306 Jeffrey Hugo 2023-03-27  212  
c501ca23a6a306 Jeffrey Hugo 2023-03-27  213  	.fops			= &qaic_accel_fops,
c501ca23a6a306 Jeffrey Hugo 2023-03-27  214  	.open			= qaic_open,
c501ca23a6a306 Jeffrey Hugo 2023-03-27  215  	.postclose		= qaic_postclose,
c501ca23a6a306 Jeffrey Hugo 2023-03-27  216  
c501ca23a6a306 Jeffrey Hugo 2023-03-27  217  	.ioctls			= qaic_drm_ioctls,
c501ca23a6a306 Jeffrey Hugo 2023-03-27  218  	.num_ioctls		= ARRAY_SIZE(qaic_drm_ioctls),
c501ca23a6a306 Jeffrey Hugo 2023-03-27  219  	.gem_prime_import	= qaic_gem_prime_import,
c501ca23a6a306 Jeffrey Hugo 2023-03-27  220  };
c501ca23a6a306 Jeffrey Hugo 2023-03-27  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

