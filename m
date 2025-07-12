Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1895DC83F21
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 09:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/vpDHMBrA6z+fv0K5S/ZkT/+qqFN9zMbS9Vza9yhBDU=; b=xUC+iYJE4H3Bg0yw9cKQ2Wbvcu
	kkYGbY6irX5ifGPq6QGxb2Nqx6SmBFbsvtPATY6r0S6ROpCdbnND7qApI1NuLufsuIq0jIVOuy78h
	kJ8tEI500ETHRlje9rfmkZNHcnODZ01MNFQAZMbsIi6aw/hhg2uB0+PTCUL73BeaLh+k0l5Rlnfat
	TWuSqgUFnVUqTiJgsA2WkCVXXVA+mDgIHgDJ+x/eqfgiFNm/ReJR4vvx0Ex5DopQTmXIMLdSCs9Va
	ebeXYR+dB+OpK6vpv3kXMp2sCPS2EetZK5hLdb3q14aM6XeL7ES8OESxrDTi33RXOdMVjdMuacIvS
	xqhShRsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaWpq-0000000GUm3-3ElP;
	Sat, 12 Jul 2025 09:47:58 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaWnS-0000000GUf5-49S0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 09:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752313531; x=1783849531;
  h=date:from:to:cc:subject:message-id;
  bh=QIfk9v2pAP3OCi2Y9s6APul3bLmTeKX3TmFdn7wTOYM=;
  b=WioRNj236kyDPFlDbRBiD41h0P4gWQG0hhF4vWFCIVACoxDJ5P6EfaPv
   fgjQcqPxmwN7UYGMTgbMKN5d4w58lMUrSVR5SDB93Orz46OLoZPaFbZ25
   /3sAbpiPRs8IhbXzA+IytrBWE3IFLVfH1/9sR0+TU0M6nuWxx9AaxXfjj
   DyGKc90HPa/Q9wYyNQvxymuesXIL9s+hDpbbWNCZtWxlvFj259qgDy0Rp
   exgLLUs/niCeDBUT7ymsSAZThAJrlCB3iSvKLfeIxxgfUEfgLYFsasGz3
   xUebx2xl0YXd/AZkjy8iqfpfcw5hBrlEXOfnkW1AFhbmgFswTECX5F37V
   g==;
X-CSE-ConnectionGUID: bzm+8fXHRtaSj7b0ms33vQ==
X-CSE-MsgGUID: fAJZjoxrQHSH4MWGyBTNiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72038236"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="72038236"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 02:45:26 -0700
X-CSE-ConnectionGUID: +FtCXp03RlGgbjI7tWAkxA==
X-CSE-MsgGUID: jbknB0uAQEi89313A/c2Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="162219802"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Jul 2025 02:45:24 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaWnK-0007FD-0d;
	Sat, 12 Jul 2025 09:45:22 +0000
Date: Sat, 12 Jul 2025 17:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:newsoc/pxa1908] BUILD SUCCESS
 f3e7970d0e65d98ce964a997e9e990d802bffdfc
Message-ID: <202507121732.uV1qbZ4x-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_024531_130118_1A6CA8EE 
X-CRM114-Status: UNSURE (   5.66  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git newsoc/pxa1908
branch HEAD: f3e7970d0e65d98ce964a997e9e990d802bffdfc  MAINTAINERS: add myself as Marvell PXA1908 maintainer

elapsed time: 1301m

configs tested: 245
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250711    gcc-8.5.0
arc                   randconfig-001-20250712    gcc-13.4.0
arc                   randconfig-002-20250711    gcc-8.5.0
arc                   randconfig-002-20250712    gcc-13.4.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                   randconfig-001-20250711    clang-19
arm                   randconfig-001-20250712    gcc-13.4.0
arm                   randconfig-002-20250711    clang-21
arm                   randconfig-002-20250712    gcc-13.4.0
arm                   randconfig-003-20250711    gcc-15.1.0
arm                   randconfig-003-20250712    gcc-13.4.0
arm                   randconfig-004-20250711    clang-20
arm                   randconfig-004-20250712    gcc-13.4.0
arm                        spear6xx_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250711    clang-18
arm64                 randconfig-001-20250712    gcc-13.4.0
arm64                 randconfig-002-20250711    clang-21
arm64                 randconfig-002-20250712    gcc-13.4.0
arm64                 randconfig-003-20250711    gcc-12.3.0
arm64                 randconfig-003-20250712    gcc-13.4.0
arm64                 randconfig-004-20250711    clang-21
arm64                 randconfig-004-20250712    gcc-13.4.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250711    gcc-14.3.0
csky                  randconfig-001-20250712    gcc-11.5.0
csky                  randconfig-002-20250711    gcc-15.1.0
csky                  randconfig-002-20250712    gcc-11.5.0
hexagon                          alldefconfig    clang-21
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250711    clang-19
hexagon               randconfig-001-20250712    gcc-11.5.0
hexagon               randconfig-002-20250711    clang-21
hexagon               randconfig-002-20250712    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250711    gcc-12
i386        buildonly-randconfig-001-20250712    gcc-12
i386        buildonly-randconfig-002-20250711    gcc-12
i386        buildonly-randconfig-002-20250712    gcc-12
i386        buildonly-randconfig-003-20250711    clang-20
i386        buildonly-randconfig-003-20250712    gcc-12
i386        buildonly-randconfig-004-20250711    clang-20
i386        buildonly-randconfig-004-20250712    gcc-12
i386        buildonly-randconfig-005-20250711    gcc-11
i386        buildonly-randconfig-005-20250712    gcc-12
i386        buildonly-randconfig-006-20250711    clang-20
i386        buildonly-randconfig-006-20250712    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250712    gcc-12
i386                  randconfig-002-20250712    gcc-12
i386                  randconfig-003-20250712    gcc-12
i386                  randconfig-004-20250712    gcc-12
i386                  randconfig-005-20250712    gcc-12
i386                  randconfig-006-20250712    gcc-12
i386                  randconfig-007-20250712    gcc-12
i386                  randconfig-011-20250712    gcc-12
i386                  randconfig-012-20250712    gcc-12
i386                  randconfig-013-20250712    gcc-12
i386                  randconfig-014-20250712    gcc-12
i386                  randconfig-015-20250712    gcc-12
i386                  randconfig-016-20250712    gcc-12
i386                  randconfig-017-20250712    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250711    clang-21
loongarch             randconfig-001-20250712    gcc-11.5.0
loongarch             randconfig-002-20250711    clang-21
loongarch             randconfig-002-20250712    gcc-11.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250711    gcc-10.5.0
nios2                 randconfig-001-20250712    gcc-11.5.0
nios2                 randconfig-002-20250711    gcc-14.2.0
nios2                 randconfig-002-20250712    gcc-11.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250711    gcc-12.4.0
parisc                randconfig-001-20250712    gcc-11.5.0
parisc                randconfig-002-20250711    gcc-14.3.0
parisc                randconfig-002-20250712    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                          g5_defconfig    gcc-15.1.0
powerpc                   motionpro_defconfig    clang-21
powerpc               randconfig-001-20250711    clang-18
powerpc               randconfig-001-20250712    gcc-11.5.0
powerpc               randconfig-002-20250711    clang-21
powerpc               randconfig-002-20250712    gcc-11.5.0
powerpc               randconfig-003-20250711    clang-21
powerpc               randconfig-003-20250712    gcc-11.5.0
powerpc                     sequoia_defconfig    clang-17
powerpc                     skiroot_defconfig    clang-21
powerpc64             randconfig-001-20250711    clang-21
powerpc64             randconfig-002-20250711    clang-21
powerpc64             randconfig-002-20250712    gcc-11.5.0
powerpc64             randconfig-003-20250711    gcc-13.4.0
powerpc64             randconfig-003-20250712    gcc-11.5.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250711    gcc-8.5.0
riscv                 randconfig-001-20250712    gcc-8.5.0
riscv                 randconfig-002-20250711    gcc-12.4.0
riscv                 randconfig-002-20250712    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250711    clang-21
s390                  randconfig-001-20250712    gcc-8.5.0
s390                  randconfig-002-20250711    gcc-10.5.0
s390                  randconfig-002-20250712    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250711    gcc-12.4.0
sh                    randconfig-001-20250712    gcc-8.5.0
sh                    randconfig-002-20250711    gcc-15.1.0
sh                    randconfig-002-20250712    gcc-8.5.0
sh                              ul2_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250711    gcc-10.3.0
sparc                 randconfig-001-20250712    gcc-8.5.0
sparc                 randconfig-002-20250711    gcc-12.4.0
sparc                 randconfig-002-20250712    gcc-8.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250711    gcc-8.5.0
sparc64               randconfig-001-20250712    gcc-8.5.0
sparc64               randconfig-002-20250711    gcc-8.5.0
sparc64               randconfig-002-20250712    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250711    clang-20
um                    randconfig-001-20250712    gcc-8.5.0
um                    randconfig-002-20250711    clang-19
um                    randconfig-002-20250712    gcc-8.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250711    clang-20
x86_64      buildonly-randconfig-001-20250712    gcc-12
x86_64      buildonly-randconfig-002-20250711    clang-20
x86_64      buildonly-randconfig-002-20250712    gcc-12
x86_64      buildonly-randconfig-003-20250711    clang-20
x86_64      buildonly-randconfig-003-20250712    gcc-12
x86_64      buildonly-randconfig-004-20250711    gcc-12
x86_64      buildonly-randconfig-004-20250712    gcc-12
x86_64      buildonly-randconfig-005-20250711    clang-20
x86_64      buildonly-randconfig-005-20250712    gcc-12
x86_64      buildonly-randconfig-006-20250711    gcc-12
x86_64      buildonly-randconfig-006-20250712    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250712    clang-20
x86_64                randconfig-002-20250712    clang-20
x86_64                randconfig-003-20250712    clang-20
x86_64                randconfig-004-20250712    clang-20
x86_64                randconfig-005-20250712    clang-20
x86_64                randconfig-006-20250712    clang-20
x86_64                randconfig-007-20250712    clang-20
x86_64                randconfig-008-20250712    clang-20
x86_64                randconfig-071-20250712    clang-20
x86_64                randconfig-072-20250712    clang-20
x86_64                randconfig-073-20250712    clang-20
x86_64                randconfig-074-20250712    clang-20
x86_64                randconfig-075-20250712    clang-20
x86_64                randconfig-076-20250712    clang-20
x86_64                randconfig-077-20250712    clang-20
x86_64                randconfig-078-20250712    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250711    gcc-9.3.0
xtensa                randconfig-001-20250712    gcc-8.5.0
xtensa                randconfig-002-20250711    gcc-14.3.0
xtensa                randconfig-002-20250712    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

