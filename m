Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A42C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 06:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rNzutR3vb75bU50cFXU5SAIY2LqxdyCk6retyV6UhSU=; b=2pxHP03+IP927OHzOw5MlSz1uU
	XFAARd3+QB+z7kfJH63clnZYYozjf6lRgEtEaCbg/GZE2sefCdz3eZWjDWQMLkpiHD657ga+uNXy8
	OET0ELzxY19V0952U7OBcBj/OH+9Kcqy4xirfvgoN2peLFqxvoEzoTERwvz4qX02zyQaPepkZ330x
	tI9Rt2xXKCKqlFsMgqa+kythh/mdorfM04FEag8HiHqVt9L20oc6xfgifZaWCgjBatwoyVyxJKYOq
	BWwDHSwvQlWusKN+Q/UHv7C9rs9Sb5kSEibO/UGG/fw5PCUz+BVcgHZidrH6VTFi5SXSJAXzyLRWF
	HZqnm1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue6QO-00000001Ptu-38EV;
	Tue, 22 Jul 2025 06:24:28 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue6MR-00000001Pdb-1PBh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 06:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753165224; x=1784701224;
  h=date:from:to:cc:subject:message-id;
  bh=BdZWvg/Qnn3onow7mPerBb2+6G3xyU1Sy3hnSE95B8o=;
  b=RgsWSEQlm8Unv4G5F2lfSGK3Wd5AskBMak45IYyxKtLu1qqf6ee8g8Il
   nsg4YAf6d7OT+EbyU7bGDU5pAVKOGG08k43rI+5dufT/uTiMujPvwkT58
   s1lUOB++XVjzK84RxTZIww/+DjJgM1vaSS0Lxt8Lo2fGutXapBFn1C/Zx
   wD7eX7ZyOkRWSE979E83QxfA9NaRsNRbsRra0uqm9BrdkpN6UlguOCVfV
   X3aXEPknwOTh6PGGIITVRB+8JyVvNrHJBvl1Q7DPPK1iQ+n1w68uAR2MF
   LN8kBaLHM2j9Eyay4deuG3/qmHnFT2mlTrpYoW2rOW0NkPvVmjGSHjQ1q
   g==;
X-CSE-ConnectionGUID: qDPdNAK1S1K8lNq4yj4+gA==
X-CSE-MsgGUID: xjZ0GfgJTD6BJqsyEVH+kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="59060113"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="59060113"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 23:20:22 -0700
X-CSE-ConnectionGUID: lkk6x0LrQzCeXHhBfwReLA==
X-CSE-MsgGUID: r5Gem75NQMm7L5+h6DI+wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="182759636"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jul 2025 23:20:18 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue6MJ-000HWJ-29;
	Tue, 22 Jul 2025 06:20:15 +0000
Date: Tue, 22 Jul 2025 14:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD SUCCESS
 aee4eeec7e5e598f0b7da65405d43f9941f965a5
Message-ID: <202507221444.D8XrLXSE-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_232023_435077_46915342 
X-CRM114-Status: UNSURE (   5.74  )
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
branch HEAD: aee4eeec7e5e598f0b7da65405d43f9941f965a5  Merge tag 'arm-soc/for-6.17/drivers' of https://github.com/Broadcom/stblinux into soc/drivers

elapsed time: 885m

configs tested: 227
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250722    clang-22
arc                   randconfig-001-20250722    gcc-10.5.0
arc                   randconfig-002-20250722    clang-22
arc                   randconfig-002-20250722    gcc-11.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                      jornada720_defconfig    clang-22
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20250722    clang-22
arm                   randconfig-001-20250722    gcc-12.5.0
arm                   randconfig-002-20250722    clang-22
arm                   randconfig-003-20250722    clang-22
arm                   randconfig-003-20250722    gcc-8.5.0
arm                   randconfig-004-20250722    clang-17
arm                   randconfig-004-20250722    clang-22
arm                        spear6xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250722    clang-22
arm64                 randconfig-002-20250722    clang-22
arm64                 randconfig-003-20250722    clang-22
arm64                 randconfig-004-20250722    clang-22
arm64                 randconfig-004-20250722    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250722    gcc-11.5.0
csky                  randconfig-001-20250722    gcc-8.5.0
csky                  randconfig-002-20250722    gcc-15.1.0
csky                  randconfig-002-20250722    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250722    clang-20
hexagon               randconfig-001-20250722    gcc-8.5.0
hexagon               randconfig-002-20250722    clang-18
hexagon               randconfig-002-20250722    gcc-8.5.0
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
loongarch             randconfig-001-20250722    gcc-8.5.0
loongarch             randconfig-002-20250722    clang-22
loongarch             randconfig-002-20250722    gcc-8.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                          amiga_defconfig    gcc-15.1.0
m68k                          atari_defconfig    clang-22
m68k                        m5407c3_defconfig    clang-22
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        qi_lb60_defconfig    clang-22
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250722    gcc-11.5.0
nios2                 randconfig-001-20250722    gcc-8.5.0
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
powerpc                          allyesconfig    gcc-15.1.0
powerpc                  iss476-smp_defconfig    clang-22
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc               randconfig-001-20250722    gcc-13.4.0
powerpc               randconfig-001-20250722    gcc-8.5.0
powerpc               randconfig-002-20250722    clang-22
powerpc               randconfig-002-20250722    gcc-8.5.0
powerpc               randconfig-003-20250722    gcc-14.3.0
powerpc               randconfig-003-20250722    gcc-8.5.0
powerpc                     tqm5200_defconfig    clang-22
powerpc                     tqm8555_defconfig    gcc-15.1.0
powerpc                     tqm8560_defconfig    clang-22
powerpc64             randconfig-001-20250722    gcc-8.5.0
powerpc64             randconfig-002-20250722    clang-22
powerpc64             randconfig-002-20250722    gcc-8.5.0
powerpc64             randconfig-003-20250722    clang-22
powerpc64             randconfig-003-20250722    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
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
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20250722    clang-16
sh                    randconfig-001-20250722    gcc-15.1.0
sh                    randconfig-002-20250722    clang-16
sh                    randconfig-002-20250722    gcc-15.1.0
sh                          urquell_defconfig    clang-22
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
um                               allyesconfig    clang-19
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
xtensa                  cadence_csp_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250722    clang-16
xtensa                randconfig-001-20250722    gcc-15.1.0
xtensa                randconfig-002-20250722    clang-16
xtensa                randconfig-002-20250722    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

