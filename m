Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21552EED628
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 17:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xo1zfFOrpx9ToCKbwUkMuT7WGkFpFw8oNHe7AZu9NSU=; b=WEEp7rbtq+LPb0vP2eoKcO1VK8
	jJ4HBzSdxUDGvUjWEFQq650rei9ey0ulp9AgV6GNbSnt4kN2jChPS92vSd1dKU7j/rZUlJJrKK49R
	lge//q198QGgTtdHqukqQSCpPT5fuxHhy34zs5YGjQaZDc5HwLLZIYSydYGv7GftW50CenJJ/mpPp
	cvOde9v6V8eDk3K9tq3h2U0zuEfjKWydO42BN2dLPolF1QMWEqJYArCz7GpCfVldRx7PX5Z4xttlj
	ywZ7Rr3IZhLbXMs5zwPFl/0O4deoqQyvsg6XCZ1C9kMUhUy12v6lKB5SaAbFFB870l0PQ7rcUcpGj
	qqbiZGVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjCC-00000008aMS-49Hm;
	Fri, 02 Jan 2026 17:44:17 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjCA-00000008aM6-2mWO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 17:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767375855; x=1798911855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KOZ5foOUSxYaKCChUnSfgSGAhjJZijduMAvs7fjhWnQ=;
  b=BdcbgCyIJXunKdxYc0Bww/GNU63zKGP0DnMudrOPSM+UbyK0msEnufja
   A49Eng0EsNNWsvnQQmjBZL0f3AQ19bbkVRIpG/x44H6PqewK+SV/+f6si
   GdTFmrpCeDJ+j8bB5QFQ8WDdURCB6AdieHIrOfwjJhKUI8KG94R8j7DP6
   pRDev+s+CMr52OrU8HsDe015Blvu3PNjbF81VpZ9Ou7zzgp97GXHb2Myo
   nLxIdUYVshNBQ6YAP+6ut0Jqcb3k2eV7PGF4cpuIUxgHY4+HWdRbGMO4v
   UYFOInManELHF0tK8j4oHC8IMNeSfC8j7lqt02paDil811sjmEjcs7Heg
   A==;
X-CSE-ConnectionGUID: W47iGAprTw+6KF3/RS3FvA==
X-CSE-MsgGUID: LtZmrXRcQIypEwBPZ/NF6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68850816"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="68850816"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 09:44:14 -0800
X-CSE-ConnectionGUID: bAvvsgMxSXaUZ4i9QLqufw==
X-CSE-MsgGUID: lJ3tcmuLSl6pj5WjLyGVng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="202818406"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jan 2026 09:44:09 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbjC3-000000002Nt-095Q;
	Fri, 02 Jan 2026 17:44:07 +0000
Date: Sat, 3 Jan 2026 01:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ruidong Tian <tianruidong@linux.alibaba.com>, catalin.marinas@arm.com,
	will@kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com,
	sudeep.holla@arm.com, xueshuai@linux.alibaba.com,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
	lenb@kernel.org, tony.luck@intel.com, bp@alien8.de,
	yazen.ghannam@amd.com, misono.tomohiro@fujitsu.com,
	fengwei_yin@linux.alibaba.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	tianruidong@linux.alibaba.com
Subject: Re: [PATCH v5 16/17] ras: AEST: support vendor node CMN700
Message-ID: <202601030129.ltAsW4vh-lkp@intel.com>
References: <20251230091342.50404-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230091342.50404-1-tianruidong@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_094414_785232_F0F20307 
X-CRM114-Status: GOOD (  11.40  )
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

Hi Ruidong,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge ras/edac-for-next linus/master v6.19-rc3 next-20251219]
[cannot apply to arm64/for-next/core tip/smp/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ruidong-Tian/ACPI-AEST-Parse-the-AEST-table/20251230-172000
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20251230091342.50404-1-tianruidong%40linux.alibaba.com
patch subject: [PATCH v5 16/17] ras: AEST: support vendor node CMN700
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260103/202601030129.ltAsW4vh-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601030129.ltAsW4vh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601030129.ltAsW4vh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/arm-cmn.c:5:10: fatal error: 'asm/arm-cmn.h' file not found
       5 | #include <asm/arm-cmn.h>
         |          ^~~~~~~~~~~~~~~
   1 error generated.


vim +5 drivers/perf/arm-cmn.c

     4	
   > 5	#include <asm/arm-cmn.h>
     6	#include <linux/acpi.h>
     7	#include <linux/bitfield.h>
     8	#include <linux/bitops.h>
     9	#include <linux/debugfs.h>
    10	#include <linux/interrupt.h>
    11	#include <linux/io.h>
    12	#include <linux/io-64-nonatomic-lo-hi.h>
    13	#include <linux/kernel.h>
    14	#include <linux/list.h>
    15	#include <linux/module.h>
    16	#include <linux/of.h>
    17	#include <linux/perf_event.h>
    18	#include <linux/platform_device.h>
    19	#include <linux/slab.h>
    20	#include <linux/sort.h>
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

