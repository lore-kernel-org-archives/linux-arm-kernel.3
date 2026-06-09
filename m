Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3E1CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+8fDguGxy8oohflcodTncPHkHZ7SOvr+ZQteO3JTQvQ=; b=1wp9KC4ZWjUX7pLp1ZJikO+b19
	vIHBBkBcWXSEZOWVU3Q1vZcPCfudhNYaX6OmhAX5ih91a+tkM8FFYwEvinDTzTL3Opzh4qQ4lDcje
	i5eRqPm8CAlueQXLKRjxBjisy4rASvYeIDwnHgRT0Z7g89DtZrEYYQiyrViavjqMOmP6KIvk6+8XZ
	+eewkpNKrzgcA6Czd3k3oc5kPiAJqLi3TMqCXdFy+j9GEyKcyg/X1xUxEIj9Ch4QQFJtZ/HEAn4Sk
	ETb1uCNvduIj0EVLTDkEMFNRovoWYMdxzOEpyGXImsohH+TcW0O2Vulp17xoPbHylctsdGeVyPIwC
	3wEB0mrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtNx-00000005InH-2Nne;
	Tue, 09 Jun 2026 10:08:41 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtNv-00000005Imi-0wcG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 10:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780999719; x=1812535719;
  h=date:from:to:cc:subject:message-id;
  bh=EepPOBi6zRq5UJ2d1UUZ1v7dtjlEPMRhSzmxPCMHFfU=;
  b=dtmHzcglP90CjK8kFtKEtQuGHAbSWG5mYts93hfDopiaEhoXT5LPBOpf
   EdwRQSCQNlKugUYq1wyT+M310OIXUOmld+RmvT9JYIRhDxAh81khVKddu
   /U/JHHncFHvfJ35M+M0ow4USIkb7hIiKHSWFB3qhGgHux9PISNQkf5po+
   V54Dct3Pc4g7QUGu73zZAf4YEVRq9jh6CIynhBhuImN0hITQ9QRttQAnW
   NrqrjAyD3k1Ft9oBUaEWuhwThonk7nzzRXDBJdONfQOQux93omeGetR52
   FS+lbN7QhDSkVG1xCUL8XCEImjj7MseWhHLtXLGwX1ZhVixplWxokxWr1
   Q==;
X-CSE-ConnectionGUID: 2hGXxO/mQBiTs4lTHvJK5A==
X-CSE-MsgGUID: gpBMSDyvSC6nP57Jo13mOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85645859"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="85645859"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 03:08:23 -0700
X-CSE-ConnectionGUID: nG1qZ0mCSLS3wYTLNJ0Bmw==
X-CSE-MsgGUID: YqUjkoIXRUiwVkuTn1czMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="244964378"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Jun 2026 03:08:22 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWtNb-00000000JrI-0fTM;
	Tue, 09 Jun 2026 10:08:19 +0000
Date: Tue, 09 Jun 2026 18:07:28 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 7b93c5b05877bc5df662d4edd827936fa2d39fc4
Message-ID: <202606091819.xY6kjzBl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_030839_302800_1C03B4F1 
X-CRM114-Status: UNSURE (   5.43  )
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
branch HEAD: 7b93c5b05877bc5df662d4edd827936fa2d39fc4  Merge tag 'socfpga_dts_updates_for_v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into soc/dt

elapsed time: 6520m

configs tested: 85
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    gcc-16.1.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                 randconfig-001-20260609    clang-23
arm64                 randconfig-002-20260609    gcc-13.4.0
arm64                 randconfig-003-20260609    gcc-15.2.0
arm64                 randconfig-004-20260609    clang-23
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                  randconfig-001-20260609    gcc-9.5.0
csky                  randconfig-002-20260609    gcc-11.5.0
hexagon                          allmodconfig    clang-23
hexagon                           allnoconfig    clang-23
hexagon               randconfig-001-20260609    clang-18
hexagon               randconfig-002-20260609    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch             randconfig-001-20260609    clang-23
loongarch             randconfig-002-20260609    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20260609    gcc-11.5.0
nios2                 randconfig-002-20260609    gcc-11.5.0
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    gcc-16.1.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                 randconfig-002-20260609    clang-23
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                  randconfig-001-20260609    clang-23
s390                  randconfig-002-20260609    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                    randconfig-001-20260609    gcc-13.4.0
sh                    randconfig-002-20260609    gcc-11.5.0
sparc                             allnoconfig    gcc-16.1.0
sparc                 randconfig-001-20260609    gcc-16.1.0
sparc                          randconfig-002    gcc-11.5.0
sparc64                          allmodconfig    clang-20
sparc64                        randconfig-001    gcc-12.5.0
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                               allyesconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-004-20260609    gcc-14
x86_64      buildonly-randconfig-006-20260609    gcc-14
x86_64                randconfig-001-20260609    gcc-14
x86_64                randconfig-002-20260609    clang-22
x86_64                randconfig-003-20260609    gcc-14
x86_64                randconfig-004-20260609    clang-22
x86_64                randconfig-005-20260609    clang-22
x86_64                randconfig-006-20260609    clang-22
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

