Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35207FA3728
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 16:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiXoIhZXqbH4WSMEmhh+FWvDqNneq8/8kjfeIEfXpaM=; b=wVXElJlb6fSECTy2lawxzFH4ZC
	QGZ8/pxcvSN7wvNInrcoa6jxaACcF0DlDSFaZPqDN1Kgk2xf1998Q8zqocGydV2mPh6fcPFSOd3kh
	qoS5EMPWN3ayiZXiSjc9JcS+x0WdjAZ5jbZX4W2bX0qlL+V1jQjreX2VZF30XI8B1tPMAY7SGZRJV
	VC7hKnaj7lEl1axy3n/Z/tN8wpf7Wah+ZCjsLCwhkCpoDvPUv1DklL7vb9Mou+W8A6vfm5hyvExg6
	WnIxZMm/PMZTXmTQ8MjRJHRgITeC2i7y6ky2C+6Be4/V2Hn2g8N0hpOYffwx9j9WWOnJfnTlB0an5
	wq7xfrtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiNr-00000008Vpy-2xU5;
	Fri, 02 Jan 2026 16:52:15 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiNo-00000008VpY-3amr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 16:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767372732; x=1798908732;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8V8fLvUiGyIBRMLZV4pVuc+83WP4F3JFApJ+XuTFOos=;
  b=cDjQgvptmhZhHRGtR8/eFgOohkPmTEpukA7htsEIlFE7EbngigeGVyfT
   dprp7AFyhDjJRYO44ejD8iQ+y1niz8Eyu/PWDUCxHmTtFNiwIrfljPysk
   mQYAK01e4Eb5qgqocWlABUT0B03uk43xiE/xNVK22vlqmY9G+GHa4qsOg
   Ly2Zlm2/hsQMLnRl62Q17MdtLFBWNgQ990f1OG9sf6T6ESdUStp/fOWUF
   mrqZ9QhnBrOTyZEUahroxUv8K6KYJyE1b7elbTwCH1fz1oS3/kdJH0qJ0
   R+uQWI8GWaFTIjzjtdHRUQaqumjJVG8p4ROVPbmKlRSKtlD0MYCXGnIlk
   A==;
X-CSE-ConnectionGUID: qlu3JpUnQQKMNjxCPgPlBw==
X-CSE-MsgGUID: rgnQoscdREmRIvEkF8QP8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="86447227"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="86447227"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 08:52:11 -0800
X-CSE-ConnectionGUID: AtlIZsjJRxaIYByQkePOyA==
X-CSE-MsgGUID: 7oYYZE7eQnyR4Qc6dhv6GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="239301491"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Jan 2026 08:52:08 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbiNh-000000002MP-2IRD;
	Fri, 02 Jan 2026 16:52:05 +0000
Date: Sat, 3 Jan 2026 00:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ruidong Tian <tianruidong@linux.alibaba.com>, catalin.marinas@arm.com,
	will@kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com,
	sudeep.holla@arm.com, xueshuai@linux.alibaba.com,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
	lenb@kernel.org, tony.luck@intel.com, bp@alien8.de,
	yazen.ghannam@amd.com, misono.tomohiro@fujitsu.com,
	fengwei_yin@linux.alibaba.com
Cc: oe-kbuild-all@lists.linux.dev, tianruidong@linux.alibaba.com
Subject: Re: [PATCH v5 16/17] ras: AEST: support vendor node CMN700
Message-ID: <202601030052.0TftLGp4-lkp@intel.com>
References: <20251230091342.50404-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230091342.50404-1-tianruidong@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_085212_932352_E79327B6 
X-CRM114-Status: GOOD (  12.19  )
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260103/202601030052.0TftLGp4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601030052.0TftLGp4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601030052.0TftLGp4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/arm-cmn.c:5:10: fatal error: asm/arm-cmn.h: No such file or directory
       5 | #include <asm/arm-cmn.h>
         |          ^~~~~~~~~~~~~~~
   compilation terminated.


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

