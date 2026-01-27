Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22359D25932
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 03:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+NonfGF3vbWZoL/HrzTpcNY7S9AwPVK8Usn1gdbCv9g=; b=GheXxQPVyHbx68YJ51PZbx6vhW
	G5j9AAerLJwW2AYWA3Qwm79jfHpwNd6jKHmEJigi1uJ4d/aevP3NW3WXYr5j+ZntgJiehiKzxlQPe
	caqag18YpH4TxpPSAwX4/s5mT7hpxjyzYiwUgCbOJeKUyOcIY0UOJBYp7NuibRJy17oN6qr0iFBwH
	NvUyobEoqiKeBx9b2ups7UfNWtqd0GV375LU75yC1MOGgLvG/Xp1onSM4UmDhF3GTcQ94z0sDX/3y
	jrJNDcs4Ehqag94u3U1ukgo1GRqGi6lNC8Fa3XFPAf7/QNETu6BkLut99b8k8My7jK01evela6p96
	863NjSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZwQ-0000000DbtH-2jzX;
	Tue, 27 Jan 2026 03:40:34 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZwO-0000000Dbss-27zF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 03:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769485233; x=1801021233;
  h=date:from:to:cc:subject:message-id;
  bh=EmBUWQvZM9U2DMQy0DzkU3aUdKcH340QXSeRHkqgUF8=;
  b=RKMJSlbs3nFIqdgCbpWnYJcqUDn3HwLL/SCnCOrRvywGKVHLlonVrvPB
   6CECdQ+a1N3DXz7izcA+yWDu8ug0e8h1qpUBwAWUnlse3CvSWJfXKn3t0
   OX0A44mphXKL6EXKdD8d0SksGDVH4PlZVsZLgxblEhs1CsJ6MRx+Dgm7/
   7jrwVPLgNKm0TEz9K/qTSA8tCp2/q7HKYPOG74fQKJWnSdCeCY+d5vUTF
   J6+zxAH2UOe6hwMPa62/WDV3C4ZfvTiL9mrQ9AhkmPZSe7XLxvo2zvu5f
   d7BDQ9cpwz77keR2fYQ2l62SkpNAZJ8ceAwwp3cEvFqvoq5kqC21B0zMq
   A==;
X-CSE-ConnectionGUID: 1KA4TP8kS++hveJ9ZDrgmQ==
X-CSE-MsgGUID: ZJnJFpzjQSSMfF1wr2fI3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88085105"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="88085105"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 19:40:32 -0800
X-CSE-ConnectionGUID: 6A6fShMnQsO00Sd1GpOccA==
X-CSE-MsgGUID: 3QkS+6NbThyEW6uJSpU1rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="211966375"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Jan 2026 19:40:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkZwJ-00000000Xxs-0PQS;
	Tue, 27 Jan 2026 03:40:27 +0000
Date: Tue, 27 Jan 2026 11:40:23 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:qcom/dt32] BUILD SUCCESS
 df7c440c904f754d8c94863a910d99e7ed8bbda9
Message-ID: <202601271118.2MqbnpSE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_194032_619511_19D45A4C 
X-CRM114-Status: UNSURE (   5.89  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git qcom/dt32
branch HEAD: df7c440c904f754d8c94863a910d99e7ed8bbda9  ARM: dts: qcom: msm8974: Start using rpmpd for power domains

elapsed time: 10790m

configs tested: 277
configs skipped: 265

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260120    clang-22
arc                   randconfig-001-20260127    gcc-14.3.0
arc                   randconfig-002-20260120    clang-22
arc                   randconfig-002-20260127    gcc-14.3.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                     am200epdkit_defconfig    clang-18
arm                     davinci_all_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                          exynos_defconfig    clang-18
arm                            hisi_defconfig    clang-22
arm                        mvebu_v7_defconfig    clang-22
arm                          pxa3xx_defconfig    clang-22
arm                   randconfig-001-20260120    clang-22
arm                   randconfig-001-20260127    gcc-14.3.0
arm                   randconfig-002-20260120    clang-22
arm                   randconfig-002-20260127    gcc-14.3.0
arm                   randconfig-003-20260120    clang-22
arm                   randconfig-003-20260127    gcc-14.3.0
arm                   randconfig-004-20260120    clang-22
arm                   randconfig-004-20260127    gcc-14.3.0
arm                         socfpga_defconfig    clang-22
arm                    vt8500_v6_v7_defconfig    clang-22
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260120    gcc-15.2.0
arm64                 randconfig-001-20260127    gcc-15.2.0
arm64                 randconfig-002-20260120    gcc-15.2.0
arm64                 randconfig-002-20260127    gcc-15.2.0
arm64                 randconfig-003-20260120    gcc-15.2.0
arm64                 randconfig-003-20260127    gcc-15.2.0
arm64                 randconfig-004-20260120    gcc-15.2.0
arm64                 randconfig-004-20260127    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260120    gcc-15.2.0
csky                  randconfig-001-20260127    gcc-15.2.0
csky                  randconfig-002-20260120    gcc-15.2.0
csky                  randconfig-002-20260127    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260120    gcc-12.5.0
hexagon               randconfig-001-20260127    gcc-15.2.0
hexagon               randconfig-002-20260120    gcc-12.5.0
hexagon               randconfig-002-20260127    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260120    gcc-14
i386        buildonly-randconfig-001-20260127    gcc-14
i386        buildonly-randconfig-002-20260120    gcc-14
i386        buildonly-randconfig-002-20260127    gcc-14
i386        buildonly-randconfig-003-20260120    gcc-14
i386        buildonly-randconfig-003-20260127    gcc-14
i386        buildonly-randconfig-004-20260120    gcc-14
i386        buildonly-randconfig-004-20260127    gcc-14
i386        buildonly-randconfig-005-20260120    gcc-14
i386        buildonly-randconfig-005-20260127    gcc-14
i386        buildonly-randconfig-006-20260120    gcc-14
i386        buildonly-randconfig-006-20260127    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260120    clang-20
i386                  randconfig-002-20260120    clang-20
i386                  randconfig-003-20260120    clang-20
i386                  randconfig-004-20260120    clang-20
i386                  randconfig-005-20260120    clang-20
i386                  randconfig-006-20260120    clang-20
i386                  randconfig-007-20260120    clang-20
i386                  randconfig-011-20260120    clang-20
i386                  randconfig-011-20260127    gcc-14
i386                  randconfig-012-20260120    clang-20
i386                  randconfig-012-20260127    gcc-14
i386                  randconfig-013-20260120    clang-20
i386                  randconfig-013-20260127    gcc-14
i386                  randconfig-014-20260120    clang-20
i386                  randconfig-014-20260127    gcc-14
i386                  randconfig-015-20260120    clang-20
i386                  randconfig-015-20260127    gcc-14
i386                  randconfig-016-20260120    clang-20
i386                  randconfig-016-20260127    gcc-14
i386                  randconfig-017-20260120    clang-20
i386                  randconfig-017-20260127    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260120    gcc-12.5.0
loongarch             randconfig-001-20260127    gcc-15.2.0
loongarch             randconfig-002-20260120    gcc-12.5.0
loongarch             randconfig-002-20260127    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                            gpr_defconfig    clang-18
mips                           ip22_defconfig    clang-22
mips                      loongson3_defconfig    clang-22
mips                          rb532_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260120    gcc-12.5.0
nios2                 randconfig-001-20260127    gcc-15.2.0
nios2                 randconfig-002-20260120    gcc-12.5.0
nios2                 randconfig-002-20260127    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260120    gcc-8.5.0
parisc                randconfig-001-20260127    gcc-11.5.0
parisc                randconfig-002-20260120    gcc-8.5.0
parisc                randconfig-002-20260127    gcc-11.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                      bamboo_defconfig    clang-22
powerpc                 canyonlands_defconfig    clang-22
powerpc                      katmai_defconfig    clang-18
powerpc                     mpc83xx_defconfig    clang-22
powerpc                  mpc885_ads_defconfig    clang-22
powerpc                      pcm030_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260120    gcc-8.5.0
powerpc               randconfig-001-20260127    gcc-11.5.0
powerpc               randconfig-002-20260120    gcc-8.5.0
powerpc               randconfig-002-20260127    gcc-11.5.0
powerpc                     tqm8548_defconfig    clang-22
powerpc                     tqm8548_defconfig    gcc-15.2.0
powerpc                         wii_defconfig    clang-18
powerpc64             randconfig-001-20260120    gcc-8.5.0
powerpc64             randconfig-001-20260127    gcc-11.5.0
powerpc64             randconfig-002-20260120    gcc-8.5.0
powerpc64             randconfig-002-20260127    gcc-11.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260120    gcc-13.4.0
riscv                 randconfig-001-20260127    clang-22
riscv                 randconfig-002-20260120    gcc-13.4.0
riscv                 randconfig-002-20260127    clang-22
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260120    gcc-13.4.0
s390                  randconfig-001-20260127    clang-22
s390                  randconfig-002-20260120    gcc-13.4.0
s390                  randconfig-002-20260127    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260120    gcc-13.4.0
sh                    randconfig-001-20260127    clang-22
sh                    randconfig-002-20260120    gcc-13.4.0
sh                    randconfig-002-20260127    clang-22
sh                          rsk7201_defconfig    clang-22
sparc                            alldefconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260120    gcc-8.5.0
sparc                 randconfig-001-20260127    gcc-15.2.0
sparc                 randconfig-002-20260120    gcc-8.5.0
sparc                 randconfig-002-20260127    gcc-15.2.0
sparc                       sparc32_defconfig    clang-18
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260120    gcc-8.5.0
sparc64               randconfig-001-20260127    gcc-15.2.0
sparc64               randconfig-002-20260120    gcc-8.5.0
sparc64               randconfig-002-20260127    gcc-15.2.0
um                               alldefconfig    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260120    gcc-8.5.0
um                    randconfig-001-20260127    gcc-15.2.0
um                    randconfig-002-20260120    gcc-8.5.0
um                    randconfig-002-20260127    gcc-15.2.0
um                           x86_64_defconfig    clang-18
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260120    gcc-14
x86_64      buildonly-randconfig-001-20260127    gcc-14
x86_64      buildonly-randconfig-002-20260120    gcc-14
x86_64      buildonly-randconfig-002-20260127    gcc-14
x86_64      buildonly-randconfig-003-20260120    gcc-14
x86_64      buildonly-randconfig-003-20260127    gcc-14
x86_64      buildonly-randconfig-004-20260120    gcc-14
x86_64      buildonly-randconfig-004-20260127    gcc-14
x86_64      buildonly-randconfig-005-20260120    gcc-14
x86_64      buildonly-randconfig-005-20260127    gcc-14
x86_64      buildonly-randconfig-006-20260120    gcc-14
x86_64      buildonly-randconfig-006-20260127    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260120    gcc-14
x86_64                randconfig-001-20260127    clang-20
x86_64                randconfig-002-20260120    gcc-14
x86_64                randconfig-002-20260127    clang-20
x86_64                randconfig-003-20260120    gcc-14
x86_64                randconfig-003-20260127    clang-20
x86_64                randconfig-004-20260120    gcc-14
x86_64                randconfig-004-20260127    clang-20
x86_64                randconfig-005-20260120    gcc-14
x86_64                randconfig-005-20260127    clang-20
x86_64                randconfig-006-20260120    gcc-14
x86_64                randconfig-006-20260127    clang-20
x86_64                randconfig-011-20260120    gcc-14
x86_64                randconfig-011-20260127    clang-20
x86_64                randconfig-012-20260120    gcc-14
x86_64                randconfig-012-20260127    clang-20
x86_64                randconfig-013-20260120    gcc-14
x86_64                randconfig-013-20260127    clang-20
x86_64                randconfig-014-20260120    gcc-14
x86_64                randconfig-014-20260127    clang-20
x86_64                randconfig-015-20260120    gcc-14
x86_64                randconfig-015-20260127    clang-20
x86_64                randconfig-016-20260120    gcc-14
x86_64                randconfig-016-20260127    clang-20
x86_64                randconfig-071-20260120    gcc-14
x86_64                randconfig-071-20260127    gcc-14
x86_64                randconfig-072-20260120    gcc-14
x86_64                randconfig-072-20260127    gcc-14
x86_64                randconfig-073-20260120    gcc-14
x86_64                randconfig-073-20260127    gcc-14
x86_64                randconfig-074-20260120    gcc-14
x86_64                randconfig-074-20260127    gcc-14
x86_64                randconfig-075-20260120    gcc-14
x86_64                randconfig-075-20260127    gcc-14
x86_64                randconfig-076-20260120    gcc-14
x86_64                randconfig-076-20260127    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                  audio_kc705_defconfig    gcc-15.2.0
xtensa                       common_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260120    gcc-8.5.0
xtensa                randconfig-001-20260127    gcc-15.2.0
xtensa                randconfig-002-20260120    gcc-8.5.0
xtensa                randconfig-002-20260127    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

