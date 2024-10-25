Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEB1D0C5F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkcdfzXbvS0BpBzaxww66kx5tdJY21WTs7v1/tF0r0g=; b=E7Tl5wSi7d7GF29znVkFNlwUxa
	QsH78NAvBpP8b8+KMLiLbIaguwY13FntQWIz008HB3os37l8t0KsBODAn+ANFqtwd6qW62pwApSp5
	A1HUrM+wjvjV6wlE5GZnbAadC4UlJhzThE/B25lWrV8PWFVJlyA9RikSxGbByXTAHGCvrpKncrXOS
	B0d5+0+ypjbq8X9er2k6uhuWX8KhPMCgWKjJJeWbFyec+7DIMrn9M3xFIJ45CfeEu18cdWFWMI7lc
	UJbKbx3PZLnk2nrbqTJt9XJb9agIdyZmWawP/t27E66BWQYWSOLDlLJb7OM675aA9P0r18+Vg9TAb
	o34JHhiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GxT-00000003FOq-1Z61;
	Fri, 25 Oct 2024 09:50:15 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Gv6-00000003F0b-0KcZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 09:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729849668; x=1761385668;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=6rbifKS/b/8sjhIHVhRdr8q9RaoX7LEiMZO8Aw36+T4=;
  b=EhFlpJUwma2PzJ7T3JOl/pvB31nNnAa+aC5WCK5rF/40nA79CteOai6T
   hHS8pD30qi9wp6Sn2ranB0Dd7UkBWQPs6mOcj3AuH43R5k9QNB9xlQYyL
   sIGi/0IphOeMqcRXEACAhT/km15466tJyq+/8Osf6ip0mgT8J3GtYh1Ca
   hlR+61bUsq2sGQp9bmZhObTIyIBBJ+IwdO3hplxp+HeDQcX/fkzqLeTG3
   0XX7LODMNj4nVr8B2LtiCeaayErYOcoV4Tq/P/NeYhPp4Vqz133ZbcjoP
   cp62ffzN9W1gvuATVmKQB1z5CzW+F8tjOEWwWi8G7Fz2ukWGvZfUr11h+
   g==;
X-CSE-ConnectionGUID: lnn0DWfdSB2Oj1gPOGbJog==
X-CSE-MsgGUID: CB9uIBeIRfq+kUxsniHPIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="46996338"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="46996338"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:47:45 -0700
X-CSE-ConnectionGUID: KEo2T9dkTJus/LCCLp7lIw==
X-CSE-MsgGUID: stIku8ljRxKprzLmkTjRng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="81038257"
Received: from zzombora-mobl1.ti.intel.com (HELO localhost) ([10.245.246.193])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:47:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, David Airlie <airlied@gmail.com>, Hamza
 Mahfooz <hamza.mahfooz@amd.com>, Javier Martinez
 Canillas <javierm@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Simon Ser
 <contact@emersion.fr>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 nouveau@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] drm: remove driver date from struct drm_driver and
 all drivers
In-Reply-To: <202410251351.r16zfufe-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241024162240.2398664-2-jani.nikula@intel.com>
 <202410251351.r16zfufe-lkp@intel.com>
Date: Fri, 25 Oct 2024 12:47:35 +0300
Message-ID: <878qucqzt4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_024748_141448_7C9D100B 
X-CRM114-Status: GOOD (  14.26  )
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

On Fri, 25 Oct 2024, kernel test robot <lkp@intel.com> wrote:
> Hi Jani,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on drm-misc/drm-misc-next]
> [also build test WARNING on next-20241024]
> [cannot apply to drm-exynos/exynos-drm-next shawnguo/for-next drm-xe/drm-xe-next linus/master v6.12-rc4]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-remove-driver-date-from-struct-drm_driver-and-all-drivers/20241025-002344
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/20241024162240.2398664-2-jani.nikula%40intel.com
> patch subject: [PATCH 2/2] drm: remove driver date from struct drm_driver and all drivers
> config: i386-buildonly-randconfig-004-20241025 (https://download.01.org/0day-ci/archive/20241025/202410251351.r16zfufe-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251351.r16zfufe-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410251351.r16zfufe-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/accel/qaic/qaic_drv.c:211:10: error: 'const struct drm_driver' has no member named 'date'
>      211 |         .date                   = "20190618",
>          |          ^~~~
>>> drivers/accel/qaic/qaic_drv.c:211:35: warning: initialization of 'unsigned int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
>      211 |         .date                   = "20190618",
>          |                                   ^~~~~~~~~~
>    drivers/accel/qaic/qaic_drv.c:211:35: note: (near initialization for 'qaic_accel_driver.driver_features')
>    drivers/accel/qaic/qaic_drv.c:211:35: warning: initialized field overwritten [-Woverride-init]
>    drivers/accel/qaic/qaic_drv.c:211:35: note: (near initialization for 'qaic_accel_driver.driver_features')

Hrmh, looks like I missed all of drivers/accel, I'll send an update
later.

BR,
Jani.


>
>
> vim +211 drivers/accel/qaic/qaic_drv.c
>
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  205  
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  206  static const struct drm_driver qaic_accel_driver = {
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  207  	.driver_features	= DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  208  
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  209  	.name			= QAIC_NAME,
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  210  	.desc			= QAIC_DESC,
> c501ca23a6a306 Jeffrey Hugo 2023-03-27 @211  	.date			= "20190618",
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  212  
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  213  	.fops			= &qaic_accel_fops,
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  214  	.open			= qaic_open,
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  215  	.postclose		= qaic_postclose,
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  216  
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  217  	.ioctls			= qaic_drm_ioctls,
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  218  	.num_ioctls		= ARRAY_SIZE(qaic_drm_ioctls),
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  219  	.gem_prime_import	= qaic_gem_prime_import,
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  220  };
> c501ca23a6a306 Jeffrey Hugo 2023-03-27  221  

-- 
Jani Nikula, Intel

