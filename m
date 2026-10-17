Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF29FCCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 11:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpL//S2R6rEcoiBBVYxV78OAmkrxWi3F1OYqiWRVJ4M=; b=rhdSgfYIx7Qckk2CjnMaDLPvNO
	F2Xi8wYTSJCE38DGodQyCxxf3xbvR+aW5xhQ2lzTON+SvPIZJ1E5Udw3Z/ieiKBI6DSyGYFvzJpOj
	9mnbYuOaHT7jL2M7/2lCCozmLF4PlWG3gYCJLMuWeZOVIVptayy9VlosqPgVL5ATAd+Qv0DeUUUdL
	bJKV4jdQZwVXlapC86Tz8weaVCaPmQBb7QPXpg0H4xra5eLDdciCHgRml2MAUg3MnJQVzsvcPR7IG
	zdeZBUD7PBGgXsq6JEG5aDd+BbP4g8ycuKVGiAe4Z3V+jvmEi2EHO42lBkQj0UBJzIuK4+rUxSCN0
	KSczzf0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2vJ-00000004jb1-1Phe;
	Sat, 17 Oct 2026 11:50:01 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2vE-00000004jaL-3LF4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 11:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792237797; x=1823773797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I9rUXOsPvPb1Pr+yDalZ+a5oJd95FTQW828LowTVdXA=;
  b=TfJYTLVhXi4/vk7eUEytSoO/WNZKqxYmBhk9Ov9P80d4NoNWViSuNh7l
   olqD30Bkye6qnFa0sJX03+pnH+W3DkMjMSD4qMklXeXfsCVRh8c+1Hf8Y
   i9Juk4wh6YZWHUaIpcvdT9aNzj7kJBuDIxXnD/o3UhTJCkkol0kIHUACP
   kDCX53iYdqxcPcoGWfxwnNnuRsCGuOY9x5l5Cky2lhoAPvwsLEQ0HcaMk
   azZ1J530k5EzSCiDZqcVmQ+6M5srHLWx1/Voc4oXEyM6fHm7IIv1vqIuV
   cCyTGN8wmmGNSqQ8/Ipf1lPumhhxiMMHx55zxnPaiEZxEKPirTR19dp5R
   g==;
X-CSE-ConnectionGUID: cBdpQwDjS9KBWFuNqprEFg==
X-CSE-MsgGUID: qG/RxXmISEOEa6KI9wSLDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="890584"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="890584"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 04:49:54 -0700
X-CSE-ConnectionGUID: DYy1T7yHTp+E+xZibSr/fQ==
X-CSE-MsgGUID: jNHTC4sES8KGI2xa8NxPhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2248423"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Oct 2026 04:49:45 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xI2v0-00000000JL4-2aZn;
	Sat, 17 Oct 2026 11:49:42 +0000
Date: Sat, 17 Oct 2026 19:48:51 +0800
From: kernel test robot <lkp@intel.com>
To: Tomohiro Misono <misono.tomohiro@fujitsu.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kohei Enju <enju.kohei@fujitsu.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 4/4] irqchip/gicv3: Add workaround for FUJITSU-MONAKA
 erratum E#030003
Message-ID: <202610171939.VWCcPPra-lkp@intel.com>
References: <20261016-monaka-fix-for-upstream-v2-4-fc7ede7f9f48@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-monaka-fix-for-upstream-v2-4-fc7ede7f9f48@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_044958_651225_4C89B864 
X-CRM114-Status: GOOD (  10.56  )
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

Hi Tomohiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomohiro-Misono/arm64-cputype-Add-FUJITSU-MONAKA-definition/20261016-190045
base:   24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
patch link:    https://lore.kernel.org/r/20261016-monaka-fix-for-upstream-v2-4-fc7ede7f9f48%40fujitsu.com
patch subject: [PATCH v2 4/4] irqchip/gicv3: Add workaround for FUJITSU-MONAKA erratum E#030003
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261017/202610171939.VWCcPPra-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610171939.VWCcPPra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610171939.VWCcPPra-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:1892:34: error: use of undeclared identifier 'ARM_CPU_IMP_FUJITSU'
    1892 |         if (read_cpuid_implementor() != ARM_CPU_IMP_FUJITSU ||
         |                                         ^~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-gic-v3.c:1893:34: error: use of undeclared identifier 'FUJITSU_CPU_PART_MONAKA'
    1893 |             read_cpuid_part_number() != FUJITSU_CPU_PART_MONAKA)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/ARM_CPU_IMP_FUJITSU +1892 drivers/irqchip/irq-gic-v3.c

  1889	
  1890	static bool gic_enable_quirk_fujitsu_030003(void *data)
  1891	{
> 1892		if (read_cpuid_implementor() != ARM_CPU_IMP_FUJITSU ||
> 1893		    read_cpuid_part_number() != FUJITSU_CPU_PART_MONAKA)
  1894			return false;
  1895	
  1896		static_branch_enable(&gic_fujitsu_030003_erratum);
  1897		return true;
  1898	}
  1899	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

