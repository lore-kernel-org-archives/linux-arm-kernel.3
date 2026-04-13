Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB06FEBFD16
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TquuGzcnlo/oFnuEF0ZfeFE8UvRVk40Vjx+dP9d/FqQ=; b=kVS9N1VvHsY1BUpnYREr6PFFeP
	jv2v6sZ98MViZTjuv8k6Stj2ikU2GQjh+YBxRzY01858pJdtcgX/3TIMU0sB79cbkwoeTbSY9GaDV
	tI0YN5LSuO6IynnLBUGVIJ2YSutPkUSVNZRP82NJt1DyFsUJkKixXO+Vz2PdRpk4ElqXY4bwKGv7p
	xW/ComBwWnpI2EjACRVev2448Y6fJCbsEkPnPalMB8PeoRda7e5R40tniyvHCkxv1DUnNx/4eopxR
	aIQOqJbhkIg6VEDaZyfgTUCutkEc09DBD8xSQSGnKSIVDcsR4vbODaUCNBMddmTJMVLY0ibd+/RKZ
	HQQKkCXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCgx-0000000FGus-3wMa;
	Mon, 13 Apr 2026 08:30:47 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCgs-0000000FGr5-05Re;
	Mon, 13 Apr 2026 08:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776069042; x=1807605042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O7CSA22N2e6bRpNEXn1tHHML1mT+N7FE0sjso65PSJc=;
  b=gew69+eXwwFYNLmW2g2pdYEutpyZ7L0EDCoMaV+1mINTAsYLQAd6e9La
   FgVTYBamKZntu+lidfPzzKIdAT23arbknhH5I1hk82TrLKXcl/LVVsPHg
   cHYLU3J55jHsg12MqqDIFVt+fCdRBz4tqh0rtISOHfmhxYHnGsVhaB+DD
   lsX5F8GZzDKncGAt93ntM5YAfBoS+qLdgficMvX2KYxjI21ySATs9oC2F
   gaMtX0vUZP6wXcDO6wWDR25EBG/oOL+dQjVKK4LolP5BfPLzj5PVWmUh2
   sG2R6N8rCt+tZkmajbVWH4Ch37MA43qgihmPeRMeh5wSuNyOYtnNBEY1q
   A==;
X-CSE-ConnectionGUID: PI1Z0TnOTzefYOjEXG19ew==
X-CSE-MsgGUID: RjpOzI+6QTeosxG3sRzwYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76907248"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="76907248"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 01:30:42 -0700
X-CSE-ConnectionGUID: 2ms+3zBIQRqhHfnFptEF8g==
X-CSE-MsgGUID: Kvv9ahkMT/+CpKkgMRboYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="233756143"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Apr 2026 01:30:39 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCCgi-000000000DK-1bT3;
	Mon, 13 Apr 2026 08:30:33 +0000
Date: Mon, 13 Apr 2026 16:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: raspberrypi: Change dependency to ARCH_BCM2835
 and COMPILE_TEST
Message-ID: <202604130727.sB8gZrr6-lkp@intel.com>
References: <20260408081150.1710717-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408081150.1710717-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_013042_131963_9801129B 
X-CRM114-Status: GOOD (  17.84  )
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

Hi Chen-Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v7.0-rc7 next-20260410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/firmware-raspberrypi-Change-dependency-to-ARCH_BCM2835-and-COMPILE_TEST/20260412-210604
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20260408081150.1710717-1-wenst%40chromium.org
patch subject: [PATCH] firmware: raspberrypi: Change dependency to ARCH_BCM2835 and COMPILE_TEST
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260413/202604130727.sB8gZrr6-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604130727.sB8gZrr6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604130727.sB8gZrr6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c: In function 'remote_event_wait':
>> drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:531:17: error: implicit declaration of function 'dsb' [-Wimplicit-function-declaration]
     531 |                 dsb(sy);
         |                 ^~~
>> drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:531:21: error: 'sy' undeclared (first use in this function); did you mean 's8'?
     531 |                 dsb(sy);
         |                     ^~
         |                     s8
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:531:21: note: each undeclared identifier is reported only once for each function it appears in
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c: In function 'remote_event_signal':
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:559:13: error: 'sy' undeclared (first use in this function); did you mean 's8'?
     559 |         dsb(sy);         /* data barrier operation */
         |             ^~
         |             s8
   In file included from include/linux/raspberrypi/vchiq_arm.h:14,
                    from drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:18:
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c: In function 'parse_message':
>> include/linux/raspberrypi/vchiq_core.h:71:48: error: 'sy' undeclared (first use in this function); did you mean 's8'?
      71 |         do { debug_ptr[DEBUG_ ## d] = (v); dsb(sy); } while (0)
         |                                                ^~
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:1944:9: note: in expansion of macro 'DEBUG_VALUE'
    1944 |         DEBUG_VALUE(PARSE_HEADER, (int)(long)header);
         |         ^~~~~~~~~~~
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c: In function 'parse_rx_slots':
   include/linux/raspberrypi/vchiq_core.h:69:53: error: 'sy' undeclared (first use in this function); did you mean 's8'?
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^~
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:2213:17: note: in expansion of macro 'DEBUG_TRACE'
    2213 |                 DEBUG_TRACE(PARSE_LINE);
         |                 ^~~~~~~~~~~
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c: In function 'slot_handler_func':
   include/linux/raspberrypi/vchiq_core.h:73:44: error: 'sy' undeclared (first use in this function); did you mean 's8'?
      73 |         do { debug_ptr[DEBUG_ ## d]++; dsb(sy); } while (0)
         |                                            ^~
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:2314:17: note: in expansion of macro 'DEBUG_COUNT'
    2314 |                 DEBUG_COUNT(SLOT_HANDLER_COUNT);
         |                 ^~~~~~~~~~~
--
   In file included from drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:33:
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c: In function 'add_completion':
>> include/linux/raspberrypi/vchiq_core.h:69:49: error: implicit declaration of function 'dsb' [-Wimplicit-function-declaration]
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^~~
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:665:17: note: in expansion of macro 'DEBUG_TRACE'
     665 |                 DEBUG_TRACE(SERVICE_CALLBACK_LINE);
         |                 ^~~~~~~~~~~
   include/linux/raspberrypi/vchiq_core.h:69:53: error: 'sy' undeclared (first use in this function); did you mean 's8'?
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^~
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:665:17: note: in expansion of macro 'DEBUG_TRACE'
     665 |                 DEBUG_TRACE(SERVICE_CALLBACK_LINE);
         |                 ^~~~~~~~~~~
   include/linux/raspberrypi/vchiq_core.h:69:53: note: each undeclared identifier is reported only once for each function it appears in
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^~
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:665:17: note: in expansion of macro 'DEBUG_TRACE'
     665 |                 DEBUG_TRACE(SERVICE_CALLBACK_LINE);
         |                 ^~~~~~~~~~~
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c: In function 'service_callback':
   include/linux/raspberrypi/vchiq_core.h:69:53: error: 'sy' undeclared (first use in this function); did you mean 's8'?
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^~
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:769:9: note: in expansion of macro 'DEBUG_TRACE'
     769 |         DEBUG_TRACE(SERVICE_CALLBACK_LINE);
         |         ^~~~~~~~~~~
--
   In file included from drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:14:
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c: In function 'vchiq_ioc_dequeue_message':
>> include/linux/raspberrypi/vchiq_core.h:69:49: error: implicit declaration of function 'dsb' [-Wimplicit-function-declaration]
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^~~
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:213:9: note: in expansion of macro 'DEBUG_TRACE'
     213 |         DEBUG_TRACE(DEQUEUE_MESSAGE_LINE);
         |         ^~~~~~~~~~~
   include/linux/raspberrypi/vchiq_core.h:69:53: error: 'sy' undeclared (first use in this function); did you mean 's8'?
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^~
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:213:9: note: in expansion of macro 'DEBUG_TRACE'
     213 |         DEBUG_TRACE(DEQUEUE_MESSAGE_LINE);
         |         ^~~~~~~~~~~
   include/linux/raspberrypi/vchiq_core.h:69:53: note: each undeclared identifier is reported only once for each function it appears in
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^~
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:213:9: note: in expansion of macro 'DEBUG_TRACE'
     213 |         DEBUG_TRACE(DEQUEUE_MESSAGE_LINE);
         |         ^~~~~~~~~~~
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c: In function 'vchiq_ioc_await_completion':
   include/linux/raspberrypi/vchiq_core.h:69:53: error: 'sy' undeclared (first use in this function); did you mean 's8'?
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^~
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:454:9: note: in expansion of macro 'DEBUG_TRACE'
     454 |         DEBUG_TRACE(AWAIT_COMPLETION_LINE);
         |         ^~~~~~~~~~~


vim +/dsb +531 drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c

71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  513  
77cf3f5dcf35c8 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Nicolas Saenz Julienne 2019-05-09  514  /*
77cf3f5dcf35c8 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Nicolas Saenz Julienne 2019-05-09  515   * All the event waiting routines in VCHIQ used a custom semaphore
77cf3f5dcf35c8 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Nicolas Saenz Julienne 2019-05-09  516   * implementation that filtered most signals. This achieved a behaviour similar
77cf3f5dcf35c8 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Nicolas Saenz Julienne 2019-05-09  517   * to the "killable" family of functions. While cleaning up this code all the
77cf3f5dcf35c8 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Nicolas Saenz Julienne 2019-05-09  518   * routines where switched to the "interruptible" family of functions, as the
77cf3f5dcf35c8 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Nicolas Saenz Julienne 2019-05-09  519   * former was deemed unjustified and the use "killable" set all VCHIQ's
77cf3f5dcf35c8 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Nicolas Saenz Julienne 2019-05-09  520   * threads in D state.
c22502cb84d4c9 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Umang Jain             2024-07-03  521   *
c22502cb84d4c9 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Umang Jain             2024-07-03  522   * Returns: 0 on success, a negative error code on failure
77cf3f5dcf35c8 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Nicolas Saenz Julienne 2019-05-09  523   */
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  524  static inline int
4075fa9efc4ee6 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Dominic Braun          2018-12-14  525  remote_event_wait(wait_queue_head_t *wq, struct remote_event *event)
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  526  {
c22502cb84d4c9 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Umang Jain             2024-07-03  527  	int ret = 0;
c22502cb84d4c9 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Umang Jain             2024-07-03  528  
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  529  	if (!event->fired) {
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  530  		event->armed = 1;
35b7ebda57affc drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Michael Zoran          2016-10-19 @531  		dsb(sy);
c22502cb84d4c9 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Umang Jain             2024-07-03  532  		ret = wait_event_interruptible(*wq, event->fired);
c22502cb84d4c9 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Umang Jain             2024-07-03  533  		if (ret) {
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  534  			event->armed = 0;
c22502cb84d4c9 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Umang Jain             2024-07-03  535  			return ret;
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  536  		}
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  537  		event->armed = 0;
f6c99d86246ad4 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Phil Elwell            2022-06-24  538  		/* Ensure that the peer sees that we are not waiting (armed == 0). */
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  539  		wmb();
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  540  	}
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  541  
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  542  	event->fired = 0;
c22502cb84d4c9 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Umang Jain             2024-07-03  543  	return ret;
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  544  }
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  545  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

