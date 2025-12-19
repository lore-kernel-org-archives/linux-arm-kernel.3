Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D085AD7494F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 04:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8CrdePke6nxgLLIV4YdooH1qhgfdhRfmGtb1gQBJnE=; b=Ni+fSkLxfWxZ7k4AWWZyJ4I/no
	6t8I92hN70HXaaNfFM2YFSCPgkHYSpL+kQ5+vn4aYgj5TgA4jNjE/xuPBkX8TEFvA/OF1CduvwRV3
	prC/nWzLtaRxX0HGpIeA94XVOkoOpYQ9tLHtR6hHfJpztToc5mKKTBOp6+zuc+AhxAGNqfmKOI+G+
	FYq1IYbGAfBctPIGG6YDaLSjUGcHk601H/B27DtpkwvUqfzLeVqasboA0llrKOuPEupV4m1k2lYwo
	dUfJU5r/r0tY5etXAXEBtuP/BeymuAlPp+bPS6KNZh/IdBNcEBmCtRe/CkYR4NTURvjQPiJWEcs6x
	VnEY4/4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWSV7-00000009c0j-05ni;
	Fri, 19 Dec 2025 04:54:01 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWSV4-00000009c0F-1LA2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 04:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766120038; x=1797656038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hE9E3Ug+7uhFPPxWAz/WZoEyJgKJTbWKXQ+/RMI7KXU=;
  b=Nr1OFW7mHZDq74wHDNj937ABQMVUYPLbMheujroRNR0fpMOyaoXWBsrf
   4R20Mwj5WblYd6Hopnk98rAcfjYt2nfJdsqzSSeObXqxWcqhq+vKGkEhi
   W13q0SwGZbCz5EwxSIpjibNWp5OZ/aI26TSr6NUETWBP1PcC1lZdNKJR6
   kniop9sHb8VEU12cet5BLOXrFh3kS/LfKFwixnuAh+oZ+uhQfLVfqi4F5
   gq/+cvGP5zrG6insMFLO48roxc/po3KebaU8NmGR04yqdP/cXcekvYmn4
   TjPQda2diRFOa4nRNZ14BczMHD0YmIu9YhVJuknlbGuspC++gwwLh1wyz
   w==;
X-CSE-ConnectionGUID: 7U39FNT7RWiHtujaZZwD+A==
X-CSE-MsgGUID: aAdM2YokSAS0X8XX6NZYhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68157672"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="68157672"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 20:53:55 -0800
X-CSE-ConnectionGUID: 8Bsyd2beRLaaC8ATL7Mnmg==
X-CSE-MsgGUID: zYXGz6aXQsKbYaNPzWnQsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198680831"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Dec 2025 20:53:49 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWSUs-0000000031h-3wlH;
	Fri, 19 Dec 2025 04:53:46 +0000
Date: Fri, 19 Dec 2025 12:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, bpf@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, arnd@arndb.de,
	catalin.marinas@arm.com, will@kernel.org, peterz@infradead.org,
	akpm@linux-foundation.org, mark.rutland@arm.com,
	harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
	rafael@kernel.org, daniel.lezcano@linaro.org, memxor@gmail.com,
	zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com,
	joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com, Ankur Arora <ankur.a.arora@oracle.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Christoph Lameter <cl@linux-foundation.org>
Subject: Re: [PATCH v8 03/12] arm64/delay: move some constants out to a
 separate header
Message-ID: <202512191227.TXFkHrQf-lkp@intel.com>
References: <20251215044919.460086-4-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215044919.460086-4-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_205358_377624_C2FBA983 
X-CRM114-Status: GOOD (  11.25  )
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

Hi Ankur,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]
[also build test ERROR on bpf/master linus/master arnd-asm-generic/master v6.19-rc1 next-20251218]
[cannot apply to arm64/for-next/core bpf-next/net]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ankur-Arora/asm-generic-barrier-Add-smp_cond_load_relaxed_timeout/20251215-130116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251215044919.460086-4-ankur.a.arora%40oracle.com
patch subject: [PATCH v8 03/12] arm64/delay: move some constants out to a separate header
config: x86_64-buildonly-randconfig-004-20251215 (https://download.01.org/0day-ci/archive/20251219/202512191227.TXFkHrQf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191227.TXFkHrQf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191227.TXFkHrQf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/rpmh-rsc.c:29:10: fatal error: 'asm/delay-const.h' file not found
      29 | #include <asm/delay-const.h>
         |          ^~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +29 drivers/soc/qcom/rpmh-rsc.c

     8	
     9	#include <linux/atomic.h>
    10	#include <linux/cpu_pm.h>
    11	#include <linux/delay.h>
    12	#include <linux/interrupt.h>
    13	#include <linux/io.h>
    14	#include <linux/iopoll.h>
    15	#include <linux/kernel.h>
    16	#include <linux/ktime.h>
    17	#include <linux/list.h>
    18	#include <linux/module.h>
    19	#include <linux/notifier.h>
    20	#include <linux/of.h>
    21	#include <linux/of_irq.h>
    22	#include <linux/of_platform.h>
    23	#include <linux/platform_device.h>
    24	#include <linux/pm_domain.h>
    25	#include <linux/pm_runtime.h>
    26	#include <linux/slab.h>
    27	#include <linux/spinlock.h>
    28	#include <linux/wait.h>
  > 29	#include <asm/delay-const.h>
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

