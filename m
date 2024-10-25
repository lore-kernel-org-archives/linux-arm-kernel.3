Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8911ED116FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 06:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFhQwEEGcZHVaQsK1EutkStYQSuMY2jH9QKdy86rNAI=; b=D+LyIaXfAd9yZvjRS5l0VrExCl
	OAHGK9Al6ztG7ph33M6qvH78UiZHSRJKgolqs+o92vNW2uc9eNEEdYi6ETPAYXyGzFJPAD2DEl9O5
	uR8RGBuEmm1i/hsrsw/uSj9pg6lBiEjfahj6/cz4VNQDQOI9nnTFa7KYdTNnTjy5H2yu2u7hDoVlQ
	tqCXf17ZXMyL54z01+3GDGGsZg7I81qaczF/kaH9HuycB1RzAgesTnt86wqE+551oiFttAqt97Ymi
	RMQimoHVlWBCDi0S6B3q2MqcjIdjy1tvUBUn07xm7DJ7m+sX5LpMLKi70LJh3TpC0UVijfhzNKcPt
	iWfiGs8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Dfe-00000002fT4-3TUW;
	Fri, 25 Oct 2024 06:19:38 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Dcx-00000002ewr-36lZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 06:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729837012; x=1761373012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c6V1Mv+taW3ICFO5XNnbFK4fCJZFIwQpzeF7YcNeRNs=;
  b=NChEKi3tRnPst4YYMXdVqTqNe8p7OjEmNW2M0aLB2l+vSlsIFjgSHBuP
   zLrQ7vrk+xwUXL0EYJRrOooglbzSeAZWDeIcFk5ns9PwYGU5rkmn/TI5Y
   2Fc0ajEZRaQc4xRNJdws6/QeuMrGyzqVh4ppwMHM9OstN3fgGk1FDeNqh
   OBW3v2pEeDBnCdnSfWPt/9b9+pTRQ/A42UYNEaBn3VLMlvUO9gCYcSuCn
   6tM2eGD7XzGlhH2fOyUog4TItLELs/dwvWnT2+jxZ5JximIzuVITgtJDD
   GEeZgC2L4hwLzjHMma0hSKWNL4Sm8IBfhm/PFURTszq8F0GzNFrrmbsZl
   Q==;
X-CSE-ConnectionGUID: lGEHe8pgQDmmvNiqKLgzWA==
X-CSE-MsgGUID: ImWOLi88T8u31PB46kytqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29274986"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29274986"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 23:16:49 -0700
X-CSE-ConnectionGUID: PKYOkV+QSeWAVUQvMAg3ZA==
X-CSE-MsgGUID: q+TANJcEReWiNuhgN2CKuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="118287858"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Oct 2024 23:16:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Dcn-000Xg8-1z;
	Fri, 25 Oct 2024 06:16:41 +0000
Date: Fri, 25 Oct 2024 14:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
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
Message-ID: <202410251345.nA1iHU0x-lkp@intel.com>
References: <20241024162240.2398664-2-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024162240.2398664-2-jani.nikula@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_231651_843678_66EB20A2 
X-CRM114-Status: GOOD (  14.27  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20241024]
[cannot apply to drm-exynos/exynos-drm-next shawnguo/for-next drm-xe/drm-xe-next linus/master v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-remove-driver-date-from-struct-drm_driver-and-all-drivers/20241025-002344
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241024162240.2398664-2-jani.nikula%40intel.com
patch subject: [PATCH 2/2] drm: remove driver date from struct drm_driver and all drivers
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241025/202410251345.nA1iHU0x-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251345.nA1iHU0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251345.nA1iHU0x-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/accel/qaic/qaic_drv.c:7:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/accel/qaic/qaic_drv.c:7:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/accel/qaic/qaic_drv.c:7:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/accel/qaic/qaic_drv.c:7:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/accel/qaic/qaic_drv.c:211:3: error: field designator 'date' does not refer to any field in type 'const struct drm_driver'
     211 |         .date                   = "20190618",
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/accel/qaic/qaic_drv.c:448:46: warning: shift count >= width of type [-Wshift-count-overflow]
     448 |         ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   17 warnings and 1 error generated.


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

