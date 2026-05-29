Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EF0CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YGHrTRKfLh80gir8df3vdKVR4f1iq8eZHQEbCr0E4G4=; b=z1F803r8rJ6hZ7hadBXW9caIhM
	1MTeLPh9CzAfgNwB+N1jWrCYRYPpK3BT47ohfFdvQ3Kmu0SasNVqkDDSiUu5tCJmULBjEUJFiMksR
	gXjFTcBzwwc36MYd3DqTDPSzPIOW9mTpGP015F3zTDKX8A4IF+ea3o4mlRR/qyamAfQLTrEzOflUY
	a9DcbJMwrNn9NtJMnecVQlHTS6/mNzTYPuSBf07A79KrfLhrMUNyGoLDB/taKCm+CIOCFc9P14/2Y
	kpxt7hrdEU70gl4PCqzyCnIkF523PSlxe3ZzmQPS7dv/owwGbr0wDtmg/W3FGQl/7qBRRvyPDOb8m
	hV71ffPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT03i-00000007siR-2cFA;
	Fri, 29 May 2026 16:27:42 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT03g-00000007shy-12Dq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780072060; x=1811608060;
  h=date:from:to:cc:subject:message-id;
  bh=CWIThINteHHM68nnPX1Iik5rOZTHgtpoqvV2g1nTekU=;
  b=SPIJN2X9EKlSF6/LXpKFAf7s0IdZv5nsDyggnQdwM58qftWVgneFSy7W
   6nSZC3ROHiAA30CSeolCuwwa8MHYHKPCIXyxFKBAmj60FcoQMx/yBVJyi
   kspMLak9gSuVckEuBsi4Yb7rOt8QQkO83ZbYzAXQFEuG+9lzAk/+HfcN2
   HQ5nxx9SMjL+MkA84FK0Q9hKHJCW2J3O5dXR4Wbauj9x72UZNQm2F3eem
   UDc7DNQTGFZDiJLuGO7mZwh/HnaYQWxK7/0tBZMX1m3n5rnZeQ57pTaXo
   iMXvhxHDeTDpSRfBWuAplaL49neJVpaw7ROR7N4KiijGgcSxdcWXoX+ns
   A==;
X-CSE-ConnectionGUID: YKhhtlmyTcS2u5ZG4Pk3hw==
X-CSE-MsgGUID: ITHHc8QfTMa+3rpySl/5CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="106376707"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="106376707"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 09:27:39 -0700
X-CSE-ConnectionGUID: 5s3IJGBOSbSz48vbXk2EkA==
X-CSE-MsgGUID: SRwKuL8qT/+Nc0bw+ojMrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="266759328"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 May 2026 09:27:37 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT03b-000000007Uo-1mqm;
	Fri, 29 May 2026 16:27:35 +0000
Date: Sat, 30 May 2026 00:26:46 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 04e12996daf13eaa8e16c6312c02c7d71d96800a
Message-ID: <202605300040.7R9sw6un-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_092740_297691_44E6AEEE 
X-CRM114-Status: UNSURE (   5.61  )
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
branch HEAD: 04e12996daf13eaa8e16c6312c02c7d71d96800a  Merge tag 'imx-soc-fixes-for-v7.1' of git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into arm/fixes

elapsed time: 1091m

configs tested: 189
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260529    clang-23
arc                   randconfig-002-20260529    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                         lpc32xx_defconfig    clang-17
arm                   randconfig-001-20260529    clang-23
arm                   randconfig-002-20260529    clang-23
arm                   randconfig-003-20260529    clang-23
arm                   randconfig-004-20260529    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260529    clang-23
arm64                 randconfig-002-20260529    clang-23
arm64                 randconfig-003-20260529    clang-23
arm64                 randconfig-004-20260529    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260529    clang-23
csky                  randconfig-002-20260529    clang-23
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260529    gcc-8.5.0
hexagon               randconfig-002-20260529    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260529    gcc-12
i386        buildonly-randconfig-002-20260529    gcc-12
i386        buildonly-randconfig-003-20260529    gcc-12
i386        buildonly-randconfig-004-20260529    gcc-12
i386        buildonly-randconfig-005-20260529    gcc-12
i386        buildonly-randconfig-006-20260529    gcc-12
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260529    gcc-14
i386                  randconfig-002-20260529    gcc-14
i386                  randconfig-003-20260529    gcc-14
i386                  randconfig-004-20260529    gcc-14
i386                  randconfig-005-20260529    gcc-14
i386                  randconfig-006-20260529    gcc-14
i386                  randconfig-007-20260529    gcc-14
i386                  randconfig-011-20260529    gcc-14
i386                  randconfig-012-20260529    gcc-14
i386                  randconfig-013-20260529    gcc-14
i386                  randconfig-014-20260529    gcc-14
i386                  randconfig-015-20260529    gcc-14
i386                  randconfig-016-20260529    gcc-14
i386                  randconfig-017-20260529    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260529    gcc-8.5.0
loongarch             randconfig-002-20260529    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            alldefconfig    gcc-11.5.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260529    gcc-8.5.0
nios2                 randconfig-002-20260529    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    clang-19
parisc                randconfig-001-20260529    clang-19
parisc                         randconfig-002    clang-19
parisc                randconfig-002-20260529    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                        randconfig-001    clang-19
powerpc               randconfig-001-20260529    clang-19
powerpc                        randconfig-002    clang-19
powerpc               randconfig-002-20260529    clang-19
powerpc64                      randconfig-001    clang-19
powerpc64             randconfig-001-20260529    clang-19
powerpc64                      randconfig-002    clang-19
powerpc64             randconfig-002-20260529    clang-19
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260529    gcc-15.2.0
riscv                 randconfig-002-20260529    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260529    gcc-15.2.0
s390                  randconfig-002-20260529    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260529    gcc-15.2.0
sh                    randconfig-002-20260529    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-11.5.0
sparc                 randconfig-001-20260529    gcc-11.5.0
sparc                          randconfig-002    gcc-11.5.0
sparc                 randconfig-002-20260529    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-11.5.0
sparc64               randconfig-001-20260529    gcc-11.5.0
sparc64                        randconfig-002    gcc-11.5.0
sparc64               randconfig-002-20260529    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-11.5.0
um                    randconfig-001-20260529    gcc-11.5.0
um                             randconfig-002    gcc-11.5.0
um                    randconfig-002-20260529    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260529    gcc-14
x86_64      buildonly-randconfig-002-20260529    gcc-14
x86_64      buildonly-randconfig-003-20260529    gcc-14
x86_64      buildonly-randconfig-004-20260529    gcc-14
x86_64      buildonly-randconfig-005-20260529    gcc-14
x86_64      buildonly-randconfig-006-20260529    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    clang-20
x86_64                randconfig-001-20260529    clang-20
x86_64                         randconfig-002    clang-20
x86_64                randconfig-002-20260529    clang-20
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260529    clang-20
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260529    clang-20
x86_64                         randconfig-005    clang-20
x86_64                randconfig-005-20260529    clang-20
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260529    clang-20
x86_64                randconfig-011-20260529    clang-20
x86_64                randconfig-012-20260529    clang-20
x86_64                randconfig-013-20260529    clang-20
x86_64                randconfig-014-20260529    clang-20
x86_64                randconfig-015-20260529    clang-20
x86_64                randconfig-016-20260529    clang-20
x86_64                randconfig-071-20260529    clang-20
x86_64                randconfig-072-20260529    clang-20
x86_64                randconfig-073-20260529    clang-20
x86_64                randconfig-074-20260529    clang-20
x86_64                randconfig-075-20260529    clang-20
x86_64                randconfig-076-20260529    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                         randconfig-001    gcc-11.5.0
xtensa                randconfig-001-20260529    gcc-11.5.0
xtensa                         randconfig-002    gcc-11.5.0
xtensa                randconfig-002-20260529    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

