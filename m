Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54062C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 22:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0fVPN2r/0gi1SSaCJiROwbqLiIR5nSH3rOVglnJ/3+8=; b=rU9zw2eckMHSShW7W8Ykfxzixp
	ow1SpTrQ6qy+p6Z/ylMFGQNhKozYqFNINeD4trSmX3pIW53B9xhf3bV/ZppWr1p7toZ+f3vt0aEJ8
	cJz52QtCwIdcNAYeXa+lxXs7/mdDWq4pqcGabMGVr9xPExR0p079qlWCyZ+9x5YTeorxm/hjF/BQp
	9+AN918RUbPhu8wJGI/pwzsVvpbt/hL7hBjPo4DcH6Lu0KHwZFV+k+LZHB+yYhrtjZnpuHLAhlunR
	0n46AbWQnotmCoLS9XAUVNod1BlLGOWzk0GquwH5CF2KOdl4j3vsJoDzSVOMEdMcijhKqxM3Jct9A
	zWJa5aGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txCf4-000000079zq-1OHm;
	Tue, 25 Mar 2025 22:22:18 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txCdL-000000079iA-2M2c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 22:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742941232; x=1774477232;
  h=date:from:to:cc:subject:message-id;
  bh=/9njQhBC4Lc1qzswwxKxnWYCUSjaYWSpy2mtAK6FgrQ=;
  b=BQc9dvE4qi8Qy6VQpl5oewscR/Q183U+JeXB66mSsnHGe7khSy4sv3M6
   NsCepRt34sotqeXOiKsOSGf5H6HRhk0MP3e6r8kNWoi/e7J9b3vx9SkAp
   jtrG5Cbg7UgBVkxc9PCku/zaYReJK44ZqXLtSl4ygYi5szrKKhStamrCQ
   HYT2Otm+jC5iudTL4IkHi1IfeSo4t+el1N8eSpP/4LKbF6jtPYTJOnz6y
   46KvO175HwYfnB9djT/R88cPc6SlNM+M2lp96ZFGgs+eCEZlWH5ClEe17
   r5A/8WcuL94hEnFupMO6FIPm5OYir3/NYwlIrXFbRsxu3XccRnG5kJTTI
   A==;
X-CSE-ConnectionGUID: ZUnjC2owTNS8KNRm4HV6QA==
X-CSE-MsgGUID: P6p2LN0bRA2HLq4HmzKeGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44368884"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="44368884"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 15:20:31 -0700
X-CSE-ConnectionGUID: rv3WQtqhSXewMEnTFrSQWg==
X-CSE-MsgGUID: K2+SF3uUSQe3RdkETpZ6aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="129560565"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Mar 2025 15:20:29 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txCdG-0005EV-38;
	Tue, 25 Mar 2025 22:20:26 +0000
Date: Wed, 26 Mar 2025 06:19:44 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/arm] BUILD SUCCESS
 46367f09b2203f7c63f89293aea9279b875d0ff2
Message-ID: <202503260635.f1RYTIgk-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_152031_670709_474789DC 
X-CRM114-Status: UNSURE (   5.73  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/arm
branch HEAD: 46367f09b2203f7c63f89293aea9279b875d0ff2  ARM: davinci: always enable CONFIG_ARCH_DAVINCI_DA850

elapsed time: 1448m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250325    gcc-14.2.0
arc                   randconfig-002-20250325    gcc-13.3.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-21
arm                       imx_v4_v5_defconfig    clang-15
arm                        keystone_defconfig    gcc-14.2.0
arm                            mmp2_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                   randconfig-001-20250325    gcc-5.5.0
arm                   randconfig-002-20250325    gcc-5.5.0
arm                   randconfig-003-20250325    gcc-5.5.0
arm                   randconfig-004-20250325    clang-21
arm                       spear13xx_defconfig    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250325    gcc-9.5.0
arm64                 randconfig-002-20250325    clang-18
arm64                 randconfig-003-20250325    gcc-7.5.0
arm64                 randconfig-004-20250325    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250325    gcc-13.3.0
csky                  randconfig-002-20250325    gcc-14.2.0
hexagon                          alldefconfig    clang-21
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250325    clang-16
hexagon               randconfig-002-20250325    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250325    gcc-12
i386        buildonly-randconfig-002-20250325    clang-20
i386        buildonly-randconfig-003-20250325    gcc-12
i386        buildonly-randconfig-004-20250325    clang-20
i386        buildonly-randconfig-005-20250325    gcc-12
i386        buildonly-randconfig-006-20250325    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250325    gcc-14.2.0
loongarch             randconfig-002-20250325    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250325    gcc-7.5.0
nios2                 randconfig-002-20250325    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250325    gcc-12.4.0
parisc                randconfig-002-20250325    gcc-12.4.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250325    clang-21
powerpc               randconfig-002-20250325    clang-21
powerpc               randconfig-003-20250325    gcc-9.3.0
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250325    clang-15
powerpc64             randconfig-002-20250325    clang-21
powerpc64             randconfig-003-20250325    gcc-9.3.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                    nommu_k210_defconfig    clang-21
riscv                 randconfig-001-20250325    gcc-9.3.0
riscv                 randconfig-002-20250325    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250325    clang-18
s390                  randconfig-002-20250325    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250325    gcc-5.5.0
sh                    randconfig-002-20250325    gcc-11.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250325    gcc-8.5.0
sparc                 randconfig-002-20250325    gcc-6.5.0
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250325    gcc-8.5.0
sparc64               randconfig-002-20250325    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250325    clang-21
um                    randconfig-002-20250325    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250325    gcc-12
x86_64      buildonly-randconfig-002-20250325    clang-20
x86_64      buildonly-randconfig-003-20250325    gcc-12
x86_64      buildonly-randconfig-004-20250325    gcc-12
x86_64      buildonly-randconfig-005-20250325    clang-20
x86_64      buildonly-randconfig-006-20250325    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250325    gcc-8.5.0
xtensa                randconfig-002-20250325    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

