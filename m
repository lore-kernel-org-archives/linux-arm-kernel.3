Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077E6EBFD16
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqUs13AuYLbB4HM+grpmzCAk5Q960KW/IUA2Gp5a0D0=; b=XWKzmp1MLoEaitgTf/beEhXeMm
	5ocf3JvYU9vvMRUXQ4CWq1HWsqfOP/EZTR5M5AxP4k7fzsq8ATB8hZdFmzTgxQEwj3wNAZmv26pmX
	js7qqPoDcBPStPgdOIuHMhqd2aiwbPco1zDudPievxlSFXmzuybzY0xHHrLba9AEOe8EfIzpwI6Ws
	bPkz/ZJe0Pklh4Bq2I4h+oJogjykhtwFoo+9qQwvLhNLsLROUhgTRdqc3JlOufyiRqjZvkPIz44Ro
	nTkyFPM7ZWojsNeGQC/FS17C0xva19Q4vzqPnU7iJjj1CL73GwXWq0ryb/llHyZUlr56hfsqdM4mC
	Y0JENwvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCgs-0000000FGrt-37zr;
	Mon, 13 Apr 2026 08:30:42 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCgp-0000000FGqP-28fV;
	Mon, 13 Apr 2026 08:30:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776069039; x=1807605039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mC4b9blVrSSxsEsfe6mODT7VH4v0IjvfgofK16PIlzI=;
  b=cfWnAejL+Zoazq2ded07kURxxbXqcf1TIyC104d5y2pSHNBJGLjl9Xav
   OeOO1mJdcw4hfgcIZC+2TpPYAZHKJYn07qzfJ/r0G9oO4DeQxQSFsIuK9
   JEXQYSfnUhmfoKr7xwgOimoAcg3zlUX84imerj3SyeHt4jt8XxmVu9Nsm
   mY2BEExhcXTAEHwBmZJkOwW40nAYHzPK6YyMT0yxDP2W0XCp99Fkpy887
   oxLbM0cdP7u5Hjcpp0wgoouz1ORfglMTIxJI99J/LZQieIk+xdHb7M2kB
   oRxqTyr7SgyyHLufbs2PRlWM4ARbA98U2JjGSr8chsXqFhW/6KNwcTqdB
   w==;
X-CSE-ConnectionGUID: uV1iuY+IQJGDNHqrPsFKig==
X-CSE-MsgGUID: S6iTGdVVRZea3juuu8umhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76959712"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="76959712"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 01:30:37 -0700
X-CSE-ConnectionGUID: pux+DT/qR2euIJUypiOKCA==
X-CSE-MsgGUID: 24k/rZLcTMqwJWvnL57EPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="226559264"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Apr 2026 01:30:35 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCCgf-000000000DG-1nvK;
	Mon, 13 Apr 2026 08:30:30 +0000
Date: Mon, 13 Apr 2026 16:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: raspberrypi: Change dependency to ARCH_BCM2835
 and COMPILE_TEST
Message-ID: <202604130409.fOhpgXN6-lkp@intel.com>
References: <20260408081150.1710717-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408081150.1710717-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_013039_670013_56E853A7 
X-CRM114-Status: GOOD (  11.45  )
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260413/202604130409.fOhpgXN6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604130409.fOhpgXN6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604130409.fOhpgXN6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:531:3: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     531 |                 dsb(sy);
         |                 ^
>> drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:531:7: error: use of undeclared identifier 'sy'
     531 |                 dsb(sy);
         |                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:559:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     559 |         dsb(sy);         /* data barrier operation */
         |         ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:559:6: error: use of undeclared identifier 'sy'
     559 |         dsb(sy);         /* data barrier operation */
         |             ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:1944:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1944 |         DEBUG_VALUE(PARSE_HEADER, (int)(long)header);
         |         ^
   include/linux/raspberrypi/vchiq_core.h:71:37: note: expanded from macro 'DEBUG_VALUE'
      71 |         do { debug_ptr[DEBUG_ ## d] = (v); dsb(sy); } while (0)
         |                                            ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:1944:2: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:71:41: note: expanded from macro 'DEBUG_VALUE'
      71 |         do { debug_ptr[DEBUG_ ## d] = (v); dsb(sy); } while (0)
         |                                                ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:1946:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1946 |         DEBUG_VALUE(PARSE_MSGID, msgid);
         |         ^
   include/linux/raspberrypi/vchiq_core.h:71:37: note: expanded from macro 'DEBUG_VALUE'
      71 |         do { debug_ptr[DEBUG_ ## d] = (v); dsb(sy); } while (0)
         |                                            ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:1946:2: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:71:41: note: expanded from macro 'DEBUG_VALUE'
      71 |         do { debug_ptr[DEBUG_ ## d] = (v); dsb(sy); } while (0)
         |                                                ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:2059:4: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2059 |                         DEBUG_TRACE(PARSE_LINE);
         |                         ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:2059:4: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:2062:5: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2062 |                                 DEBUG_TRACE(PARSE_LINE);
         |                                 ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:2062:5: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:2097:4: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2097 |                         DEBUG_TRACE(PARSE_LINE);
         |                         ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:2097:4: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:2099:5: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2099 |                                 DEBUG_TRACE(PARSE_LINE);
         |                                 ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:2099:5: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:2132:4: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2132 |                         DEBUG_TRACE(PARSE_LINE);
         |                         ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:2132:4: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:2137:4: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2137 |                         DEBUG_TRACE(PARSE_LINE);
         |                         ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:665:3: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     665 |                 DEBUG_TRACE(SERVICE_CALLBACK_LINE);
         |                 ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
>> drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:665:3: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:667:3: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     667 |                 DEBUG_COUNT(COMPLETION_QUEUE_FULL_COUNT);
         |                 ^
   include/linux/raspberrypi/vchiq_core.h:73:33: note: expanded from macro 'DEBUG_COUNT'
      73 |         do { debug_ptr[DEBUG_ ## d]++; dsb(sy); } while (0)
         |                                        ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:667:3: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:73:37: note: expanded from macro 'DEBUG_COUNT'
      73 |         do { debug_ptr[DEBUG_ ## d]++; dsb(sy); } while (0)
         |                                            ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:675:3: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     675 |                 DEBUG_TRACE(SERVICE_CALLBACK_LINE);
         |                 ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:675:3: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:769:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     769 |         DEBUG_TRACE(SERVICE_CALLBACK_LINE);
         |         ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:769:2: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:804:4: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     804 |                         DEBUG_TRACE(SERVICE_CALLBACK_LINE);
         |                         ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:804:4: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:805:4: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     805 |                         DEBUG_COUNT(MSG_QUEUE_FULL_COUNT);
         |                         ^
   include/linux/raspberrypi/vchiq_core.h:73:33: note: expanded from macro 'DEBUG_COUNT'
      73 |         do { debug_ptr[DEBUG_ ## d]++; dsb(sy); } while (0)
         |                                        ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:805:4: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:73:37: note: expanded from macro 'DEBUG_COUNT'
      73 |         do { debug_ptr[DEBUG_ ## d]++; dsb(sy); } while (0)
         |                                            ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:810:5: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     810 |                                 DEBUG_TRACE(SERVICE_CALLBACK_LINE);
         |                                 ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:810:5: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:814:4: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     814 |                         DEBUG_TRACE(SERVICE_CALLBACK_LINE);
         |                         ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:814:4: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:839:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     839 |         DEBUG_TRACE(SERVICE_CALLBACK_LINE);
         |         ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:839:2: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   18 errors generated.
--
>> drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:213:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     213 |         DEBUG_TRACE(DEQUEUE_MESSAGE_LINE);
         |         ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
>> drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:213:2: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:228:4: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     228 |                         DEBUG_TRACE(DEQUEUE_MESSAGE_LINE);
         |                         ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:228:4: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:236:4: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     236 |                         DEBUG_TRACE(DEQUEUE_MESSAGE_LINE);
         |                         ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:236:4: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:279:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     279 |         DEBUG_TRACE(DEQUEUE_MESSAGE_LINE);
         |         ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:279:2: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:454:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     454 |         DEBUG_TRACE(AWAIT_COMPLETION_LINE);
         |         ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:454:2: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:460:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     460 |         DEBUG_TRACE(AWAIT_COMPLETION_LINE);
         |         ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:460:2: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:464:3: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     464 |                 DEBUG_TRACE(AWAIT_COMPLETION_LINE);
         |                 ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:464:3: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:469:4: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     469 |                         DEBUG_TRACE(AWAIT_COMPLETION_LINE);
         |                         ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:469:4: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:475:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     475 |         DEBUG_TRACE(AWAIT_COMPLETION_LINE);
         |         ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:475:2: error: use of undeclared identifier 'sy'
   include/linux/raspberrypi/vchiq_core.h:69:46: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                     ^
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:578:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     578 |         DEBUG_TRACE(AWAIT_COMPLETION_LINE);
         |         ^
   include/linux/raspberrypi/vchiq_core.h:69:42: note: expanded from macro 'DEBUG_TRACE'
      69 |         do { debug_ptr[DEBUG_ ## d] = __LINE__; dsb(sy); } while (0)
         |                                                 ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


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

