Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363C4E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 18:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyhA+PH4ivnpGFL2q8cUCpHulFJtFtBdVJ0rHLtZggg=; b=Y22vStBe/Rw91hAa/H1RTyeuDm
	0ZkCeeGz2kPy6OSX64NfNrjN4EcylMhX+tEpviGx1h0z7zWXH2WLgeHEkCzHA/3V/i9PzAow0LYm8
	IUIO0xwY/zRIWlSxGxj1ZmRpZAsPe+d2dgpaFPHdrebVz4pAEUbo0boJ7VWK8ILutxgQlaM+WaVLM
	1Gy/68iWS5vf3iY93ASxhtKdnD0CmIrf52ptRWz32slPNXZT5gYGxNI6pwRrcxGaxwfkodnxCe7G0
	uARBhtKuwwKii18hZKSn6AwoxMO+kjuyBg8lMfmJDOX15YuW4mLYlN/PC5f3iMDZLVXC6xX1pikwz
	EPmxHDgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP4W3-00000007JJF-1UJz;
	Sat, 21 Dec 2024 18:47:55 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP4Ur-00000007J8L-0LFi;
	Sat, 21 Dec 2024 18:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734806801; x=1766342801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zJuK4EGPag3rRSoZW/226OQJu7iD2ASDZu2A91lYscY=;
  b=fOCgghDH4XTTRGYK3Am81AecTyhxjua5IWiyoAsQpYYyk+aWfqCoKDSM
   TxKNOfIzURGEppAgj4G1TsPqcaOUtOrlNz6d3+j/HjykUO+VaVOxXAbB5
   vFkrVigGsg1i3eRcBTom2B0ByxO3516UytyGX4E/SuETRHK8liLQ+reJK
   VjTndL0O9H2+aGAf32z+CFWcBB6Pdj6WxtsyV9w4lMvT5MuoPobXWLmBX
   LiQsXkVoPWAKaZEc0fgUTGmKlC0Y8xUWprhGqjIzZZvKsFVfEPN8QOShc
   TdScv6BZtv8eOo6GJzCLKeKESbghRHi0jwwhpnxdwH41q1dgVA/tLdjlT
   g==;
X-CSE-ConnectionGUID: tRvNTje4QQ+QLLieRD9ecg==
X-CSE-MsgGUID: iPPk6QclQf2yEOshqopD7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="22918777"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="22918777"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 10:46:38 -0800
X-CSE-ConnectionGUID: jNutlilzQvadKrwMSzmgOw==
X-CSE-MsgGUID: A6DngFlURoewyjIgoGJkAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="103886653"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Dec 2024 10:46:32 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP4Uf-0002PD-2q;
	Sat, 21 Dec 2024 18:46:29 +0000
Date: Sun, 22 Dec 2024 02:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	John Cox <john.cox@raspberrypi.com>,
	Dom Cobley <dom@raspberrypi.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 5/7] media: platform: Add Raspberry Pi HEVC decoder driver
Message-ID: <202412220205.Gf2N9CUb-lkp@intel.com>
References: <20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_104641_141766_B6556894 
X-CRM114-Status: GOOD (  10.95  )
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

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on e90c9612ac3969cb8206029a26bcd2b6f5d4a942]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Stevenson/RFC-media-Add-media_request_-pin-unpin-API/20241221-002633
base:   e90c9612ac3969cb8206029a26bcd2b6f5d4a942
patch link:    https://lore.kernel.org/r/20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e%40raspberrypi.com
patch subject: [PATCH 5/7] media: platform: Add Raspberry Pi HEVC decoder driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241222/202412220205.Gf2N9CUb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220205.Gf2N9CUb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220205.Gf2N9CUb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/raspberrypi/hevc_dec/hevc_d.c:14:
   In file included from include/linux/platform_device.h:13:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2223:
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
>> drivers/media/platform/raspberrypi/hevc_dec/hevc_d.c:24:10: fatal error: 'hevc_d_h265.h' file not found
      24 | #include "hevc_d_h265.h"
         |          ^~~~~~~~~~~~~~~
   4 warnings and 1 error generated.
--
   In file included from drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c:14:
   In file included from include/media/videobuf2-dma-contig.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
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
>> drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c:21:10: fatal error: 'hevc_d_h265.h' file not found
      21 | #include "hevc_d_h265.h"
         |          ^~~~~~~~~~~~~~~
   4 warnings and 1 error generated.
--
   In file included from drivers/media/platform/raspberrypi/hevc_dec/hevc_d_h265.c:17:
   In file included from include/media/videobuf2-dma-contig.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
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
>> drivers/media/platform/raspberrypi/hevc_dec/hevc_d_h265.c:20:10: fatal error: 'hevc_d_h265.h' file not found
      20 | #include "hevc_d_h265.h"
         |          ^~~~~~~~~~~~~~~
   4 warnings and 1 error generated.


vim +24 drivers/media/platform/raspberrypi/hevc_dec/hevc_d.c

    22	
    23	#include "hevc_d.h"
  > 24	#include "hevc_d_h265.h"
    25	#include "hevc_d_video.h"
    26	#include "hevc_d_hw.h"
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

