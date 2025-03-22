Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E0CC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 12:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8OaSKvDgRDbyg7nuzM5MC3SB7PMw0Wext8Y6DaVRvr8=; b=SXcecE/rjPA7ZEQyd/wnD7con3
	WUSCNuirag+fY2JR6AzdTY/JuVkL+52EHE36Jau4R/V7dLm1LrRQpSI0eJYufOwR2rUwGrRTqy91f
	fgbb7ekOsh9zkkiPpp2WbLpSWp21hB0qQRl5ITZF6d1huB7F93BmgUK6YQeKaJOv1PGjs776SRcBN
	/N8JopSEV0g6jwjYufMhNLxrK9AxmYFN7FcDycPWN4k74iqKK1XEt9nbD5vft5+Lo/s5k6md10j5p
	tKmEzm4O22T6Y0EqFWR8njFf5N6Zms/Cb1qzkLkwRrAljZbdzM3TlEG2GZX+2pfWKhVKxzxKhQgc5
	nMY0kMpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxYn-0000000HMri-35WB;
	Sat, 22 Mar 2025 12:02:41 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxX7-0000000HMiN-1G6z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 12:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742644857; x=1774180857;
  h=date:from:to:cc:subject:message-id;
  bh=waUCqcbr3Ms9dgNM7eumBm4aHObimbyt1LXUZ2GT7Fg=;
  b=UQvhY8Mwc1OYFtZOJ8XCM8b67yIUrUM67H/S2/OpiLGm7eAC7NK/+aLC
   O4rIKENt45MUQ3+pvNXPEKew/Nbr9XrWZkJQ7XGsKBM6bJokARSGYusl4
   kdqoTk5Yh85g3LhID8hu6h3c1607tEEicUGTzyeMB5l6rx0k7++ll0iXj
   fKif731hX+Bx7EoATDnO++3Xrot2iLppx+138wB2/Nf99HMXqSygvDzQ0
   bjYSXziaq9Z3q9e79WAEkniWKPNsN+VbjlHKUA2lbtTkUf5mGJ0UbY5vt
   qQ9r/59iWnjgIWwbr0XTijjOHspAccUdLCkN2UbcVSaViMcgPgVHQcoXk
   g==;
X-CSE-ConnectionGUID: 0P0w2fUYSdSiSR2nvemsfQ==
X-CSE-MsgGUID: TITLgXNiTFy0vm/h0NSbTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="61423528"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="61423528"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 05:00:55 -0700
X-CSE-ConnectionGUID: EMX4ZHDZRGy7Aje82O5zIQ==
X-CSE-MsgGUID: 93RHG9vqRdK1i0TbWjyD+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="128687482"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Mar 2025 05:00:53 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvxX1-00028F-1t;
	Sat, 22 Mar 2025 12:00:51 +0000
Date: Sat, 22 Mar 2025 20:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD REGRESSION
 cf2ae5e5b68b06b4c8bceb42d46fa311e6db9a60
Message-ID: <202503222040.UjFfXpC9-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_050057_392870_AB7412C0 
X-CRM114-Status: UNSURE (   4.42  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
branch HEAD: cf2ae5e5b68b06b4c8bceb42d46fa311e6db9a60  Merge tag 'soc_fsl-6.15-1' of https://github.com/chleroy/linux into soc/drivers

Error/Warning (recently discovered and may have been fixed):

    turris-omnia-mcu-gpio.c:(.text+0x1596): undefined reference to `__ffsdi2'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- (.text):undefined-reference-to-__ffsdi2
|   `-- alpha-linux-ld:(.text):undefined-reference-to-__ffsdi2
|-- arm-allmodconfig
|   `-- ERROR:__ffsdi2-drivers-platform-cznic-turris-omnia-mcu.ko-undefined
|-- i386-allmodconfig
|   `-- ERROR:__ffsdi2-drivers-platform-cznic-turris-omnia-mcu.ko-undefined
|-- i386-allyesconfig
|   `-- turris-omnia-mcu-gpio.c:(.text):undefined-reference-to-__ffsdi2
|-- m68k-allmodconfig
|   `-- ERROR:__ffsdi2-drivers-platform-cznic-turris-omnia-mcu.ko-undefined
|-- m68k-allyesconfig
|   `-- turris-omnia-mcu-gpio.c:(.text):undefined-reference-to-__ffsdi2
|-- parisc-allmodconfig
|   `-- ERROR:__ffsdi2-drivers-platform-cznic-turris-omnia-mcu.ko-undefined
|-- sh-allmodconfig
|   `-- ERROR:__ffsdi2-drivers-platform-cznic-turris-omnia-mcu.ko-undefined
|-- sh-allyesconfig
|   `-- (.text):undefined-reference-to-__ffsdi2
`-- sparc-allmodconfig
    `-- ERROR:__ffsdi2-drivers-platform-cznic-turris-omnia-mcu.ko-undefined

elapsed time: 1448m

configs tested: 113
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250321    gcc-13.3.0
arc                   randconfig-002-20250321    gcc-11.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          exynos_defconfig    clang-21
arm                   randconfig-001-20250321    clang-19
arm                   randconfig-002-20250321    gcc-9.3.0
arm                   randconfig-003-20250321    gcc-5.5.0
arm                   randconfig-004-20250321    clang-21
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250321    gcc-5.5.0
arm64                 randconfig-002-20250321    gcc-5.5.0
arm64                 randconfig-003-20250321    clang-20
arm64                 randconfig-004-20250321    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250321    gcc-13.3.0
csky                  randconfig-002-20250321    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250321    clang-21
hexagon               randconfig-002-20250321    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250321    clang-20
i386        buildonly-randconfig-002-20250321    clang-20
i386        buildonly-randconfig-003-20250321    clang-20
i386        buildonly-randconfig-004-20250321    clang-20
i386        buildonly-randconfig-005-20250321    clang-20
i386        buildonly-randconfig-006-20250321    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250321    gcc-14.2.0
loongarch             randconfig-002-20250321    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                        mvme147_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250321    gcc-13.3.0
nios2                 randconfig-002-20250321    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250321    gcc-8.5.0
parisc                randconfig-002-20250321    gcc-6.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250321    clang-21
powerpc               randconfig-002-20250321    gcc-7.5.0
powerpc               randconfig-003-20250321    gcc-7.5.0
powerpc64             randconfig-001-20250321    gcc-5.5.0
powerpc64             randconfig-002-20250321    clang-16
powerpc64             randconfig-003-20250321    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250321    clang-21
riscv                 randconfig-002-20250321    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250321    clang-16
s390                  randconfig-002-20250321    gcc-8.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250321    gcc-7.5.0
sh                    randconfig-002-20250321    gcc-7.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250321    gcc-12.4.0
sparc                 randconfig-002-20250321    gcc-6.5.0
sparc64               randconfig-001-20250321    gcc-10.5.0
sparc64               randconfig-002-20250321    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250321    gcc-12
um                    randconfig-002-20250321    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250321    clang-20
x86_64      buildonly-randconfig-002-20250321    clang-20
x86_64      buildonly-randconfig-003-20250321    gcc-12
x86_64      buildonly-randconfig-004-20250321    clang-20
x86_64      buildonly-randconfig-005-20250321    clang-20
x86_64      buildonly-randconfig-006-20250321    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250321    gcc-6.5.0
xtensa                randconfig-002-20250321    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

