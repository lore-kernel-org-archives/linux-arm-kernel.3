Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D22D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nsIW7IAg+g/gXVSRmFLOK91Nrr9aPAD8bMkAZqYMoEA=; b=mKluKIChX5aj/+hiodvieBUL7q
	aQR1X3CgZlbjtW8Q5jtx6eWe52lUSxiFEYTkkrsLftqrDcFCbuCM1paCAsAzix8Khj0iScJ3N2dOV
	eCriltWGCcVS7rYtxYivxEDUCHaXwSfGbWs2tQIQ0QrX9i+QeJVoI7A+olSuyWu+QZ6ae8JVyptjL
	HeCZu+KIqEic5lui2MsB3Ax1XtEYgTFGB5HjffT323lJah6Mzp0Mw88TBbDvhOvasWSDwAWsozNtt
	LpdFdOQjF86hw3KFJmd9ICa6Ok57hqw8MyzxyiAjl3tA+Hsje3znkj8N0Z0uMYMgFWmEKtEU75ZlP
	3S0+PAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXsC-0000000GF7s-3eg3;
	Thu, 27 Nov 2025 09:01:08 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXsA-0000000GF7R-1yhf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764234066; x=1795770066;
  h=date:from:to:cc:subject:message-id;
  bh=QQ6GVheKpTay9XIQn6vW79eNyTyksEN2SY4LLdKh8x8=;
  b=DZa1QayO5zKXiRrgUB6waXrNvChHmNF4fMeeAuJTY8Mg2pfGikpNuyHk
   vfY4B+RtEeg9Qk+4m2ynCbhHRGGt3fU9YNqgIx17RwRqlBfp4RZEvwY+r
   Whobgb+2S5rq2Q+n/AaozoUiZCbVe+08gEhHki4IXRx4NTIEyOWodPUvh
   +f10c6BjZnxzoQMUXVT33gZokEpbXAONfyPzFmNC0WOf09QEal80mqov5
   AKAVpwwUkMuf+uUsuVVzLH54H96s3GjZm+6jOxFyOcUKPZapYX2Q3Bgh/
   36zd92HTnBmohUO74D3yKPhzSFCBine3R2uJ+U8E46D9ZgJkvqESPh75X
   w==;
X-CSE-ConnectionGUID: 8vNfeHP0S6Whd64nFJYsew==
X-CSE-MsgGUID: ufR3km8ARXqfXbPCbXMsPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66438848"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66438848"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 01:01:06 -0800
X-CSE-ConnectionGUID: sOadcZlpSDCTRppp52M7Hg==
X-CSE-MsgGUID: Bvut67BzSbaAK6h3lxXYvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="216530445"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Nov 2025 01:01:04 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOXs6-0000000044X-0my2;
	Thu, 27 Nov 2025 09:01:02 +0000
Date: Thu, 27 Nov 2025 17:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 e9191383d28da31831cee84bb04029d0e46c514b
Message-ID: <202511271706.MKGAN0h0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_010106_556612_A8BF1AC7 
X-CRM114-Status: UNSURE (   5.36  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/fixes
branch HEAD: e9191383d28da31831cee84bb04029d0e46c514b  Merge tag 'sunxi-fixes-for-6.18' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/fixes

elapsed time: 2460m

configs tested: 138
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251126    gcc-13.4.0
arc                   randconfig-001-20251127    clang-22
arc                   randconfig-002-20251126    gcc-11.5.0
arc                   randconfig-002-20251127    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                         axm55xx_defconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                            mmp2_defconfig    clang-19
arm                         mv78xx0_defconfig    clang-19
arm                   randconfig-001-20251126    clang-22
arm                   randconfig-001-20251127    clang-22
arm                   randconfig-002-20251126    clang-22
arm                   randconfig-002-20251127    clang-22
arm                   randconfig-003-20251126    clang-19
arm                   randconfig-003-20251127    clang-22
arm                   randconfig-004-20251126    clang-22
arm                   randconfig-004-20251127    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251127    gcc-15.1.0
arm64                 randconfig-002-20251127    gcc-15.1.0
arm64                 randconfig-003-20251127    gcc-15.1.0
arm64                 randconfig-004-20251127    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251127    gcc-15.1.0
csky                  randconfig-002-20251127    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251126    clang-22
hexagon               randconfig-001-20251127    gcc-15.1.0
hexagon               randconfig-002-20251126    clang-22
hexagon               randconfig-002-20251127    gcc-15.1.0
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386        buildonly-randconfig-001-20251127    clang-20
i386        buildonly-randconfig-002-20251127    clang-20
i386        buildonly-randconfig-003-20251127    clang-20
i386        buildonly-randconfig-004-20251127    clang-20
i386        buildonly-randconfig-005-20251127    clang-20
i386        buildonly-randconfig-006-20251127    clang-20
i386                                defconfig    gcc-15.1.0
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251126    gcc-15.1.0
loongarch             randconfig-001-20251127    gcc-15.1.0
loongarch             randconfig-002-20251126    clang-22
loongarch             randconfig-002-20251127    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                              allnoconfig    gcc-15.1.0
mips                          ath79_defconfig    clang-19
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251126    gcc-11.5.0
nios2                 randconfig-001-20251127    gcc-15.1.0
nios2                 randconfig-002-20251126    gcc-9.5.0
nios2                 randconfig-002-20251127    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251126    gcc-8.5.0
parisc                randconfig-001-20251127    gcc-13.4.0
parisc                randconfig-002-20251126    gcc-15.1.0
parisc                randconfig-002-20251127    gcc-13.4.0
parisc64                            defconfig    clang-19
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251126    gcc-10.5.0
powerpc               randconfig-001-20251127    gcc-13.4.0
powerpc               randconfig-002-20251126    gcc-8.5.0
powerpc               randconfig-002-20251127    gcc-13.4.0
powerpc                      tqm8xx_defconfig    clang-19
powerpc                        warp_defconfig    clang-19
powerpc64             randconfig-001-20251126    clang-19
powerpc64             randconfig-001-20251127    gcc-13.4.0
powerpc64             randconfig-002-20251126    clang-22
powerpc64             randconfig-002-20251127    gcc-13.4.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251126    gcc-10.5.0
riscv                 randconfig-001-20251127    gcc-12.5.0
riscv                 randconfig-002-20251126    clang-22
riscv                 randconfig-002-20251127    gcc-12.5.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251126    gcc-8.5.0
s390                  randconfig-001-20251127    gcc-12.5.0
s390                  randconfig-002-20251126    gcc-8.5.0
s390                  randconfig-002-20251127    gcc-12.5.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251126    gcc-14.3.0
sh                    randconfig-001-20251127    gcc-12.5.0
sh                    randconfig-002-20251126    gcc-11.5.0
sh                    randconfig-002-20251127    gcc-12.5.0
sh                   secureedge5410_defconfig    clang-19
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251127    clang-22
sparc                 randconfig-002-20251127    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251127    clang-22
sparc64               randconfig-002-20251127    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251127    clang-22
um                    randconfig-002-20251127    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251127    gcc-14
x86_64                randconfig-002-20251127    gcc-14
x86_64                randconfig-003-20251127    gcc-14
x86_64                randconfig-004-20251127    gcc-14
x86_64                randconfig-005-20251127    gcc-14
x86_64                randconfig-006-20251127    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251127    clang-22
xtensa                randconfig-002-20251127    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

