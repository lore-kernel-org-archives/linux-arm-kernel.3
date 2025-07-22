Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626ECC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 05:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zSX03aEhu+Yp8u8+wKfJLgLrav/dEUCqvVlpRQnWcSE=; b=FfxO1qh8TSvnfoJIBe3T5kAK+u
	ywekgWLOH+b4UDvsIJP0ZZAN9EM1Flr0dXsr0/BtOxLy1fUkgW1aXZ9xUVdzsOWXBzGP4y2H3Q1kv
	sJgpxTfZk2zB8X2ZFg69P9NhF9FQBlqJpXdMxJYOWsJ5nbnfVLrZtQV3CMgGI7GYHwpkG/tNcvDwO
	0t6iIacICewvx/icQFffLNNFfNeDj2FBk6uXw9scrB1kzvnurw8Q6mYEJF0n+ZJ7dRnI8ajWwzrR6
	G5TuNACiB2RAP25ejHIr/mvvR9fqTKf9ruDAyEABc7ZtSJWPLKMZachbK5ZR3rtR172jDHLkJY1db
	0J0OrI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5E3-00000001JMj-1snW;
	Tue, 22 Jul 2025 05:07:39 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5B9-00000001JBF-0CWv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 05:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753160679; x=1784696679;
  h=date:from:to:cc:subject:message-id;
  bh=W1FIaTPQqzuJjYc+vMwWR41RWdA0ehb4jDwm1xRz4CA=;
  b=Ipsuao2Oab5uLWj7+DPk8pDSUbsUfS9Iww4Dk7HVFo7e9EQfvS56kx8Q
   fXkmNNaNPiSWKdNkelrp38vMKfhVZIkH60rOy4eNXD37Y1qNPJ16OZeVe
   65Hk1Ieb5Us77kyDAh2OsK5rhxF0oxMj7OuiHaefMhSzZQBh2SWexZ+Qm
   ypwox6qlDkLGpG32KKQNC3J4Wydp+Y0oiinSGSFtQvc6RvIS131FRdARc
   5XqdwNRU/ckM7/sqlEy/Qxrsp4JpwRFtXbEW+KfqpbCucTOrgZ9DE82d8
   YC/oVvVT/T8ABaDpSbMxMjKjN28d/rAFoFnVxQoLDFx5EhSSnVlBwci45
   A==;
X-CSE-ConnectionGUID: zuhGtdUqSsKztgGb6forag==
X-CSE-MsgGUID: BtI+FcpNT6msEFQoWvoC+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55275783"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="55275783"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 22:03:10 -0700
X-CSE-ConnectionGUID: LsXYRRRiS6G523pLuzT/cw==
X-CSE-MsgGUID: 09vRzFocS12MvOIda2O8mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="159118578"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Jul 2025 22:03:09 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue59e-000HSt-2T;
	Tue, 22 Jul 2025 05:03:06 +0000
Date: Tue, 22 Jul 2025 13:03:00 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 d436d1d5edb3068cb8c9023e129008a5dc50e7a0
Message-ID: <202507221347.0cgDnTjt-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_220439_449665_010ED526 
X-CRM114-Status: UNSURE (   5.65  )
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
branch HEAD: d436d1d5edb3068cb8c9023e129008a5dc50e7a0  Merge tag 'mtk-dts64-for-v6.17' of https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux into soc/dt

elapsed time: 808m

configs tested: 200
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250722    clang-22
arc                   randconfig-001-20250722    gcc-10.5.0
arc                   randconfig-002-20250722    clang-22
arc                   randconfig-002-20250722    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                      jornada720_defconfig    clang-22
arm                   randconfig-001-20250722    clang-22
arm                   randconfig-001-20250722    gcc-12.5.0
arm                   randconfig-002-20250722    clang-22
arm                   randconfig-003-20250722    clang-22
arm                   randconfig-003-20250722    gcc-8.5.0
arm                   randconfig-004-20250722    clang-17
arm                   randconfig-004-20250722    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250722    clang-22
arm64                 randconfig-002-20250722    clang-22
arm64                 randconfig-003-20250722    clang-22
arm64                 randconfig-004-20250722    clang-22
arm64                 randconfig-004-20250722    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250722    gcc-11.5.0
csky                  randconfig-002-20250722    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250722    clang-20
hexagon               randconfig-002-20250722    clang-18
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250722    gcc-12
i386        buildonly-randconfig-002-20250722    gcc-12
i386        buildonly-randconfig-003-20250722    clang-20
i386        buildonly-randconfig-003-20250722    gcc-12
i386        buildonly-randconfig-004-20250722    gcc-12
i386        buildonly-randconfig-005-20250722    clang-20
i386        buildonly-randconfig-005-20250722    gcc-12
i386        buildonly-randconfig-006-20250722    clang-20
i386        buildonly-randconfig-006-20250722    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250722    clang-20
i386                  randconfig-002-20250722    clang-20
i386                  randconfig-003-20250722    clang-20
i386                  randconfig-004-20250722    clang-20
i386                  randconfig-005-20250722    clang-20
i386                  randconfig-006-20250722    clang-20
i386                  randconfig-007-20250722    clang-20
i386                  randconfig-011-20250722    clang-20
i386                  randconfig-012-20250722    clang-20
i386                  randconfig-013-20250722    clang-20
i386                  randconfig-014-20250722    clang-20
i386                  randconfig-015-20250722    clang-20
i386                  randconfig-016-20250722    clang-20
i386                  randconfig-017-20250722    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250722    gcc-15.1.0
loongarch             randconfig-002-20250722    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
m68k                        m5407c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250722    gcc-11.5.0
nios2                 randconfig-002-20250722    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250722    gcc-8.5.0
parisc                randconfig-002-20250722    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                  iss476-smp_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250722    gcc-13.4.0
powerpc               randconfig-002-20250722    clang-22
powerpc               randconfig-003-20250722    gcc-14.3.0
powerpc                     tqm5200_defconfig    gcc-15.1.0
powerpc                     tqm8560_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250722    gcc-8.5.0
powerpc64             randconfig-002-20250722    clang-22
powerpc64             randconfig-003-20250722    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250722    clang-16
riscv                 randconfig-002-20250722    clang-16
riscv                 randconfig-002-20250722    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250722    clang-16
s390                  randconfig-001-20250722    clang-22
s390                  randconfig-002-20250722    clang-16
s390                  randconfig-002-20250722    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250722    clang-16
sh                    randconfig-001-20250722    gcc-15.1.0
sh                    randconfig-002-20250722    clang-16
sh                    randconfig-002-20250722    gcc-15.1.0
sh                          urquell_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250722    clang-16
sparc                 randconfig-001-20250722    gcc-13.4.0
sparc                 randconfig-002-20250722    clang-16
sparc                 randconfig-002-20250722    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250722    clang-16
sparc64               randconfig-001-20250722    gcc-8.5.0
sparc64               randconfig-002-20250722    clang-16
sparc64               randconfig-002-20250722    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250722    clang-16
um                    randconfig-001-20250722    gcc-12
um                    randconfig-002-20250722    clang-16
um                    randconfig-002-20250722    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250722    gcc-12
x86_64      buildonly-randconfig-002-20250722    gcc-12
x86_64      buildonly-randconfig-003-20250722    gcc-12
x86_64      buildonly-randconfig-004-20250722    clang-20
x86_64      buildonly-randconfig-004-20250722    gcc-12
x86_64      buildonly-randconfig-005-20250722    gcc-12
x86_64      buildonly-randconfig-006-20250722    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250722    clang-20
x86_64                randconfig-002-20250722    clang-20
x86_64                randconfig-003-20250722    clang-20
x86_64                randconfig-004-20250722    clang-20
x86_64                randconfig-005-20250722    clang-20
x86_64                randconfig-006-20250722    clang-20
x86_64                randconfig-007-20250722    clang-20
x86_64                randconfig-008-20250722    clang-20
x86_64                randconfig-071-20250722    gcc-12
x86_64                randconfig-072-20250722    gcc-12
x86_64                randconfig-073-20250722    gcc-12
x86_64                randconfig-074-20250722    gcc-12
x86_64                randconfig-075-20250722    gcc-12
x86_64                randconfig-076-20250722    gcc-12
x86_64                randconfig-077-20250722    gcc-12
x86_64                randconfig-078-20250722    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250722    clang-16
xtensa                randconfig-001-20250722    gcc-15.1.0
xtensa                randconfig-002-20250722    clang-16
xtensa                randconfig-002-20250722    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

