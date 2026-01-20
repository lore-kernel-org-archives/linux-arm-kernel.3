Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A539D262A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 22:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+W4N9020o5SHKPKefE+HnKULspM/h9WgQ/Covj9e3y4=; b=00lsBlN5H7kDSy2gTZXsuT5sZT
	qYORKMPj4qyLZEu3jf1VzBe4g11RgbwUKS5ilKR4qzsSeKkImYMiAdALPenK/+U/+YHVVhQAf3y12
	9SXcg8WmajXm5I4Xb/dmip5QUK91pL0Dg9pKpu3ym7d6g04E5T03z2j7kXeL5SCWgyyLB2o9H4GIE
	8bUK++QuSCGNqRAQPkWT59nzPX2vyi7z7evOqHNRBOYDiccmR5qcuFIjW8uaJOZVVU1tUliTcbbAE
	zOOJ1596/4MUdNMdK+oaCsxAHkV2wtHejFxoqkqFp12SeFQES+e3vUO1llAhRY2Ktls/zy6hbqVu8
	DJVYzBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viJpT-00000004W3Q-3UFS;
	Tue, 20 Jan 2026 22:04:03 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viJpR-00000004W35-0acL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 22:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768946641; x=1800482641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zip5ATIXcGnPOSFQUuvHx03GlQS1rEwh0UF9MXE7tg8=;
  b=Pwnej9w7BfLF8MtUgkiUFrBoSTRY0tx+HTmihZX2/ARgjbqUcOEkLJxJ
   uOxlomLIrYf5mscekSQQUHzc8lzPuM4xGbPZLx/R6xqkb8jO3c2chYrkq
   SUHgbk4QilDau4j7selRgTcmTxqqHi9L18UuUDWgq2CIFOfSMfmcUmr/6
   SO6VPvHOeHgrGroSUSq0LKlk5fBrz1KnTSzFUf/7IXMPw0ZQ/99f3u8yr
   HAON0mRI6X8TEjPqK4Dy40SEWkU1a/a7tZRddzL+FxSEa2XHKF+Qc6nsR
   rkn2xEYH9u7WZZd3pUnW3u07h4A0At93Uq8t/WwrOG2HOOIOL0NwGr25o
   Q==;
X-CSE-ConnectionGUID: Nf6F54EAQ5qbmPsTDvUIbw==
X-CSE-MsgGUID: 7bj/eJbgTv6hkwUQ0vbcFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80473248"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="80473248"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 14:03:59 -0800
X-CSE-ConnectionGUID: 73eAFPAGT/WDIQ971AOI4w==
X-CSE-MsgGUID: usykPe85S06Yq/5VD5O3Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="205879081"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Jan 2026 14:03:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viJpK-00000000Pbh-1pJw;
	Tue, 20 Jan 2026 22:03:54 +0000
Date: Wed, 21 Jan 2026 06:03:16 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Gu <gu_0233@qq.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Felix Gu <gu_0233@qq.com>
Subject: Re: [PATCH] firmware: arm_scpi: Fix device_node reference leak in
 scpi_probe()
Message-ID: <202601210508.3BaBN2n8-lkp@intel.com>
References: <tencent_845B889AF1A932F1347EE0C09F350E491009@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_845B889AF1A932F1347EE0C09F350E491009@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_140401_234914_C2721C5F 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

Hi Felix,

kernel test robot noticed the following build errors:

[auto build test ERROR on d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Gu/firmware-arm_scpi-Fix-device_node-reference-leak-in-scpi_probe/20260120-203159
base:   d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
patch link:    https://lore.kernel.org/r/tencent_845B889AF1A932F1347EE0C09F350E491009%40qq.com
patch subject: [PATCH] firmware: arm_scpi: Fix device_node reference leak in scpi_probe()
config: arm-randconfig-001-20260121 (https://download.01.org/0day-ci/archive/20260121/202601210508.3BaBN2n8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210508.3BaBN2n8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210508.3BaBN2n8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/arm_scpi.c:21:10: fatal error: 'linux/clean.h' file not found
      21 | #include <linux/clean.h>
         |          ^~~~~~~~~~~~~~~
   1 error generated.


vim +21 drivers/firmware/arm_scpi.c

    18	
    19	#include <linux/bitmap.h>
    20	#include <linux/bitfield.h>
  > 21	#include <linux/clean.h>
    22	#include <linux/device.h>
    23	#include <linux/err.h>
    24	#include <linux/export.h>
    25	#include <linux/io.h>
    26	#include <linux/kernel.h>
    27	#include <linux/list.h>
    28	#include <linux/mailbox_client.h>
    29	#include <linux/module.h>
    30	#include <linux/of.h>
    31	#include <linux/of_address.h>
    32	#include <linux/of_platform.h>
    33	#include <linux/platform_device.h>
    34	#include <linux/printk.h>
    35	#include <linux/property.h>
    36	#include <linux/pm_opp.h>
    37	#include <linux/scpi_protocol.h>
    38	#include <linux/slab.h>
    39	#include <linux/sort.h>
    40	#include <linux/spinlock.h>
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

