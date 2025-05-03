Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E15C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 05:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwVtJGN2P3n7hu1QqjSz/+BfTucsQV0j4ZEfMEBE1eE=; b=fyGcOgPMEershn388nMfFonRe6
	2PyJqWhLOgjJSiIi4yyyB+0sQjtB0K/8JgYkCHLiJ1Nh1Jh5TN8L90kMdIEKHYvL/13wu+KQjK02b
	zaPyqo0MRWraTzpvKJh0tz2fKlRMuAhbLVmCcUD9iK5hm0D/mxvnaSKNkXhQPWqY5uA7py41uHYkR
	vux+L7Z3iXJThz2jbVub+PTm838acnrbOhn0EXjmwrMLPHXZYuv4WtWRw8wTNrKuxg80Zip7cMKWB
	OEiSg76bEPnDP7hk8uBRa8KQ2Kqw6q58EtvtrXVQgnKfqht3rn19/s/B9I13qI3/4RFZVXYEJVWc/
	H61CHDNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB5s6-00000003Xfo-2Pu2;
	Sat, 03 May 2025 05:57:10 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB5qC-00000003XXZ-3Pgd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 05:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746251713; x=1777787713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tSZgN38GyZ/t3oOtfszD05d8YL3guqdlHqC0NDAIMVw=;
  b=AQyObn0Zrgp7JSYfFBRAfl52IV/Pj5278lADroGVpk4QJGlgJLGDC2E0
   8VsJvHsV8DOUfsXEXWw1iN95k45exOg5JIyrfEWJH4RuceFFnr3zCQZEm
   f///wRYCKhRUfbzVfRkfWpVgYmokOX6M//izpbJIGZBSIBC9QWKQcaWrv
   C4cjrv0/+nSRbdg96HvPin+NKPE5GIrqylyHxvnNYDgvSUAJU00/oayez
   OEz2iOCy37zFnjeCFQxP3VACMFPNGEngM6DNS/+Xfqg8CqOTi/x1nGYX0
   e2u8XIMnVOSQhOdyg1BckzWKrZSUkQCP253c2cXl8kfSN3tPXy3LrYUgW
   A==;
X-CSE-ConnectionGUID: s4o0MOdSTt22Qs3CQ/DoRw==
X-CSE-MsgGUID: zHKSNqHbQmqnZi1iIGsp/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="70438295"
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="70438295"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 22:55:10 -0700
X-CSE-ConnectionGUID: n/mMcwarR2SZ4r5/MN4qvg==
X-CSE-MsgGUID: r2tKxmIVS4edHOFYga10Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="139974074"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 May 2025 22:55:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uB5q2-0005DV-2i;
	Sat, 03 May 2025 05:55:02 +0000
Date: Sat, 3 May 2025 13:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: Paresh Bhagat <p-bhagat@ti.com>, nm@ti.com, vigneshr@ti.com,
	praneeth@ti.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kristo@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, khasim@ti.com, v-singh1@ti.com,
	afd@ti.com
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: Add support for AM62D2-EVM
Message-ID: <202505031327.h8w4ttsK-lkp@intel.com>
References: <20250502153915.734932-4-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502153915.734932-4-p-bhagat@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_225512_924110_0406B070 
X-CRM114-Status: GOOD (  11.68  )
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

Hi Paresh,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc4 next-20250502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paresh-Bhagat/dt-bindings-arm-ti-Add-bindings-for-AM62D2-SoC/20250502-234223
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250502153915.734932-4-p-bhagat%40ti.com
patch subject: [PATCH v2 3/3] arm64: dts: ti: Add support for AM62D2-EVM
config: arm64-randconfig-003-20250503 (https://download.01.org/0day-ci/archive/20250503/202505031327.h8w4ttsK-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505031327.h8w4ttsK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505031327.h8w4ttsK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/ti/k3-am62d2-evm.dts:409.1-13 Label or path wkup_r5fss0 not found
>> Error: arch/arm64/boot/dts/ti/k3-am62d2-evm.dts:413.1-19 Label or path wkup_r5fss0_core0 not found
>> Error: arch/arm64/boot/dts/ti/k3-am62d2-evm.dts:419.1-12 Label or path mcu_r5fss0 not found
>> Error: arch/arm64/boot/dts/ti/k3-am62d2-evm.dts:423.1-18 Label or path mcu_r5fss0_core0 not found
>> Error: arch/arm64/boot/dts/ti/k3-am62d2-evm.dts:429.1-7 Label or path c7x_0 not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

