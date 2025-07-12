Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A340C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 07:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=da+9bmvi3Jg89/BGQHoSjew3e4Qq37AJHsvC3r/iNQM=; b=hLQPL1ut8NZnapGfOfK/6KwrZx
	voVpR434C1C+bfM53EYoxcOfp/SIVgrgly+yovPlp0yD+ZPMF+7+Wizr6C2qfPEPMWsGqP7O5L6NB
	lBUODbIzkH30tkAd7n7VEf8zYa99s3rgXXnGAkUN8imwX23wLVQmUG340DsQ+Z2SjF1E6CCcyQ4WP
	0PlkFGv7iLx9XoSr5b1XPoG1mw0lOqD8Ha5vO6bWw3W+IIB3zXcfoAZP0Z/d8Z6QlGqd40+FEFs+2
	Pt95kWWre30NPEeK00YENegnXYDQa8Pyn/BzYI4XDXgkVDRA3pzfFIqNPOHjFwVP+tKVd0jVH+SBh
	j92UWO/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaUjx-0000000GMX3-3Z79;
	Sat, 12 Jul 2025 07:33:45 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaUhZ-0000000GMPs-2Qe1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 07:31:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752305478; x=1783841478;
  h=date:from:to:cc:subject:message-id;
  bh=MAluNc23D/neCm+nrplMJv21x6H60DDWPSV3f1ldhSw=;
  b=gDHG0pho0FVjQbzMSGkl5l5Rv7LsBmHU8PzjE4875Kc3k+9s35L5ht2O
   6raPSxEzxTdYIXdJuj7ercUeio2BePxRL8Kjy6XjalbX4BQkohZqmAFv+
   tERjhWu8RGsSAjnlBSzy1FJ0v5pvUJcW8Kj7SnYKBA/F12Kxg0CcdHPZL
   1Al8T30ynFIB8WEnnlGr7/utfuxtwQQKIb05DSQg3bjphKI6vtUAJXKXh
   QzS5HwiAZN/jwol5hESDIHkeesVbJBuiW2474gz69IeBkx6qPMgKXdOSB
   DeqMHQ+XZkj/IAvau19j2/ypLqKtOTEl/DOvQ92s7Bq7uciZU+D7Ri+W6
   w==;
X-CSE-ConnectionGUID: JY8xcxYHRS6b0Jc2dBhvKQ==
X-CSE-MsgGUID: 4Fp+1mC7SROrEEI/kLheUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54746176"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="54746176"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 00:31:13 -0700
X-CSE-ConnectionGUID: wDMkAPdQTz6aUM6X2Vra0Q==
X-CSE-MsgGUID: qek1eAQhQuqC2n8Nm5lUJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="193733313"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Jul 2025 00:31:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaUhR-000797-0C;
	Sat, 12 Jul 2025 07:31:09 +0000
Date: Sat, 12 Jul 2025 15:30:33 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 bda58e97c081104ecf8dd7bc864a3aa7a39b1486
Message-ID: <202507121520.5VsMlSmN-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_003117_660889_83B82024 
X-CRM114-Status: UNSURE (   5.72  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
branch HEAD: bda58e97c081104ecf8dd7bc864a3aa7a39b1486  Merge branch 'soc/newsoc' into for-next

elapsed time: 1167m

configs tested: 247
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-21
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
arm64                             allnoconfig    clang-21
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
csky                              allnoconfig    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250711    gcc-14.3.0
csky                  randconfig-001-20250712    gcc-11.5.0
csky                  randconfig-002-20250711    gcc-15.1.0
csky                  randconfig-002-20250712    gcc-11.5.0
hexagon                          alldefconfig    clang-21
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
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
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           gcw0_defconfig    clang-21
mips                           ip27_defconfig    gcc-15.1.0
mips                           xway_defconfig    clang-21
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
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
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc                          g5_defconfig    clang-21
powerpc                   motionpro_defconfig    clang-21
powerpc                  mpc866_ads_defconfig    clang-21
powerpc               randconfig-001-20250711    clang-18
powerpc               randconfig-001-20250712    gcc-11.5.0
powerpc               randconfig-002-20250711    clang-21
powerpc               randconfig-002-20250712    gcc-11.5.0
powerpc               randconfig-003-20250711    clang-21
powerpc               randconfig-003-20250712    gcc-11.5.0
powerpc                    sam440ep_defconfig    gcc-15.1.0
powerpc                     sequoia_defconfig    clang-21
powerpc                     skiroot_defconfig    clang-21
powerpc64             randconfig-001-20250711    clang-21
powerpc64             randconfig-002-20250711    clang-21
powerpc64             randconfig-002-20250712    gcc-11.5.0
powerpc64             randconfig-003-20250711    gcc-13.4.0
powerpc64             randconfig-003-20250712    gcc-11.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
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
sh                             sh03_defconfig    gcc-15.1.0
sh                              ul2_defconfig    clang-21
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

