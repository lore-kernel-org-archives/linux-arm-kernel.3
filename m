Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62794C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 11:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w0R1CIfTUrgxlrRRNYNYXdV189DwfKUVGsQiTXHXrMY=; b=dO+WCqz7zjFnMab6m0STANrR3r
	5zww3jGgL9z2tcD6wOxUozq2SrDgWbWFE3JzqoIL9OdzqxuwrWrxNGCOYw7ozgw81x2sHInUmJD9l
	wCVWmnm76z4QdEd2KTipHw5FZuX5jhQg8e+SNJZH3mMOtKEEPzcs332mNjT4yzfD3T5XrynM6GXaP
	VtXDk1bcLxwHiPa5I0N3VoLnAJ01ldK4vwVkfrmYPvStYPgIB5IHmE5YfwVrCWXyqvl4LY1rcS/J+
	eX6+gZHw/M7NMBf0BpXtsE9Rjgoj3ct6ZrFfnigwHWzbeLgmTxmY2HU68XW+GhdBuuY5V0oJzgxwP
	tqjDvSMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIR3k-00000003lSa-3CzH;
	Fri, 23 May 2025 11:59:32 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQyC-00000003krG-1HCD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 11:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748001228; x=1779537228;
  h=date:from:to:cc:subject:message-id;
  bh=SFae2ZOio+gQ8m2Z2fYFrhkq/LIqIA/AQplVZNyc+RQ=;
  b=VVShWK6aT7JQ/TS4ZR3WY4UHLbN4lwN6sgR3Yr93AWMlIrfDBmlI52h+
   RT8tEnYARlEvNtxvg6ifezEyJl7dzgK+nvspId1wDweK+xwnGMN/y1+Jg
   NBbLtGPa6hi/2XtPsNNBsgc8+b60mNR6Dp1xHDv7yuCRGV2OkCcdHlQn3
   ct3Gr3vVdnE0i62J9dS3iDoRLwPxk7GtyYV0Izzwx9xIjSRkFh7kJpTlM
   kULFQF2R1PtMLVdp/s1pTWxN3aqlj6WlSg0OL+QE7Le7rBepZSftEhW2f
   9IqMUfofRB5ZwjkHlLiiG7gOOfQXdyXHBO8BoI5A9vFg9nvgI42KRmPOs
   w==;
X-CSE-ConnectionGUID: RppTqrdoR5Oi+2l1f9LDZg==
X-CSE-MsgGUID: PXCgGPKYQUmiC5Q5PjQIUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50171370"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="50171370"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 04:53:47 -0700
X-CSE-ConnectionGUID: reDia+yJSCucOwDgZBsq5g==
X-CSE-MsgGUID: TvpDVxVjTheqtr8rJVFfzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="141610009"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 May 2025 04:53:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIQy8-000QME-1V;
	Fri, 23 May 2025 11:53:44 +0000
Date: Fri, 23 May 2025 19:53:18 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 c48cd2e82b6606dc171e89623599d40140645ce9
Message-ID: <202505231909.XDSfYWZw-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_045348_353313_CFFAF64F 
X-CRM114-Status: UNSURE (   5.05  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/dt
branch HEAD: c48cd2e82b6606dc171e89623599d40140645ce9  Merge tag 'juno-updates-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into soc/dt

elapsed time: 1450m

configs tested: 108
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                     nsimosci_hs_defconfig    gcc-14.2.0
arc                   randconfig-001-20250522    gcc-15.1.0
arc                   randconfig-002-20250522    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                        clps711x_defconfig    clang-21
arm                   randconfig-001-20250522    clang-21
arm                   randconfig-002-20250522    clang-21
arm                   randconfig-003-20250522    clang-18
arm                   randconfig-004-20250522    gcc-7.5.0
arm                        spear3xx_defconfig    clang-17
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250522    clang-21
arm64                 randconfig-002-20250522    gcc-7.5.0
arm64                 randconfig-003-20250522    clang-21
arm64                 randconfig-004-20250522    gcc-5.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250522    gcc-15.1.0
csky                  randconfig-002-20250522    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250522    clang-17
hexagon               randconfig-002-20250522    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250522    clang-20
i386        buildonly-randconfig-002-20250522    gcc-12
i386        buildonly-randconfig-003-20250522    gcc-12
i386        buildonly-randconfig-004-20250522    gcc-12
i386        buildonly-randconfig-005-20250522    gcc-12
i386        buildonly-randconfig-006-20250522    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250522    gcc-15.1.0
loongarch             randconfig-002-20250522    gcc-15.1.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                           sun3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      maltaaprp_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250522    gcc-9.3.0
nios2                 randconfig-002-20250522    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250522    gcc-6.5.0
parisc                randconfig-002-20250522    gcc-12.4.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250522    gcc-9.3.0
powerpc               randconfig-002-20250522    clang-21
powerpc               randconfig-003-20250522    gcc-7.5.0
powerpc64             randconfig-001-20250522    clang-21
powerpc64             randconfig-002-20250522    gcc-10.5.0
powerpc64             randconfig-003-20250522    gcc-7.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250522    gcc-9.3.0
riscv                 randconfig-002-20250522    clang-18
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250522    clang-19
s390                  randconfig-002-20250522    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                    randconfig-001-20250522    gcc-13.3.0
sh                    randconfig-002-20250522    gcc-13.3.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250522    gcc-14.2.0
sparc                 randconfig-002-20250522    gcc-6.5.0
sparc64               randconfig-001-20250522    gcc-14.2.0
sparc64               randconfig-002-20250522    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250522    gcc-12
um                    randconfig-002-20250522    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250522    clang-20
x86_64      buildonly-randconfig-002-20250522    gcc-12
x86_64      buildonly-randconfig-003-20250522    gcc-12
x86_64      buildonly-randconfig-004-20250522    gcc-12
x86_64      buildonly-randconfig-005-20250522    gcc-12
x86_64      buildonly-randconfig-006-20250522    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250522    gcc-14.2.0
xtensa                randconfig-002-20250522    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

