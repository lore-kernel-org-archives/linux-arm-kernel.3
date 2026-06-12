Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC490CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 21:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WUZ7hsCV9empz6m5UNuNQoCXM+JL5LUhtEi1i9W966U=; b=utTKUbMQvg6lwVqqAsVeS6UoEE
	xvgKdFoEU6gKL7iiA6Cx3fzaZ+9doEy0VP8YO5rQa2WdblxKGOT0rs/FkjA/9LLlHFJOFBGcuTQPg
	DotC4llV76Jbsfgi8NvSe0nCQePbUqE48wz4EYCfpvTK/LF+Urfxp6g895U6FjxbaaOWqKwr+d+cn
	iNMHDEc8bsqRb0Qr4xsfT1NR0LPtVPNG8t7sbSgzcecz00/x+CIK6FA/l9TFHx9JTIq6VJqwb2A4A
	JjZbaY3P60oCzz7RZvpj4lhQJbS7CI/V1cL50NYM6lNTvYP4M7XTF1sdaSecJpceF3IFQhGaxC9zF
	ekjyi4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9E4-0000000Bb3b-1Khg;
	Fri, 12 Jun 2026 21:15:40 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY9E0-0000000Bb3F-2ERt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 21:15:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781298936; x=1812834936;
  h=date:from:to:cc:subject:message-id;
  bh=IuBdjQUWtbsoj4HIAEjglHjQB4sW56FMeenN52o3Cms=;
  b=H/tloi+4epLySYEcDCW02McfgnAJjN7+rzKIydPkzaK8m2N+0RqJCwRj
   LB1aFW6Gqyrn8QavTRwYHfTv1EHMr25tkSGE/Y4tc2njZJnqhXfNCqVVG
   uXi1sHPWHibLWT9DQRp1heorpLQ1/zOo+uysUgVPlCBAoXn8t7G3rtjdI
   jqBvgsRKg/zpqrxTi9i1eFgmMvh8afehrc82/IsxoEXgXBGBQoeoBiqUQ
   0m7LoDuHFahdcLz5+zocrSpqPB5Jbjj5DvCZy8ML0oaCVy7k05aFgFO0b
   wWlAyhc4+Ga9FdLYfKjhR7SREapXSB6vU9i3S3BsgalFMjulfvnOMI/Dz
   w==;
X-CSE-ConnectionGUID: rM3NQYIVTrO2GHUa5RoV2g==
X-CSE-MsgGUID: gTtTd0M1T5GYhie+siYO0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="86039024"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="86039024"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:15:32 -0700
X-CSE-ConnectionGUID: 9HXLM/cSTzizHk6dtUrefA==
X-CSE-MsgGUID: YWj7lKmZReuQUXJ0Bg+CHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="250835544"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2026 14:15:31 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY9Ds-00000000PKl-1G2e;
	Fri, 12 Jun 2026 21:15:28 +0000
Date: Sat, 13 Jun 2026 05:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: Gordon Ge <gordon.ge@bst.ai>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:bst/dt] BUILD SUCCESS
 6191a61ec9d9d8f1d1d1d6bfcb6d303be76c2804
Message-ID: <202606130510.DvLxxvVI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_141537_073805_D566C0A0 
X-CRM114-Status: UNSURE (   5.34  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git bst/dt
branch HEAD: 6191a61ec9d9d8f1d1d1d6bfcb6d303be76c2804  arm64: dts: bst: enable eMMC controller in C1200

elapsed time: 825m

configs tested: 241
configs skipped: 177

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260612    gcc-13.4.0
arc                   randconfig-002-20260612    gcc-13.4.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                         axm55xx_defconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260612    gcc-13.4.0
arm                   randconfig-002-20260612    gcc-13.4.0
arm                   randconfig-003-20260612    gcc-13.4.0
arm                   randconfig-004-20260612    gcc-13.4.0
arm                       spear13xx_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260612    gcc-13.4.0
arm64                 randconfig-002-20260612    gcc-13.4.0
arm64                 randconfig-003-20260612    gcc-13.4.0
arm64                 randconfig-004-20260612    gcc-13.4.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260612    gcc-13.4.0
csky                  randconfig-002-20260612    gcc-13.4.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260612    clang-23
hexagon               randconfig-001-20260612    gcc-11.5.0
hexagon               randconfig-001-20260613    clang-23
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260612    clang-23
hexagon               randconfig-002-20260612    gcc-11.5.0
hexagon               randconfig-002-20260613    clang-23
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260612    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260612    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260612    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260612    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260612    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260612    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260612    clang-22
i386                  randconfig-001-20260613    clang-22
i386                  randconfig-002-20260612    clang-22
i386                  randconfig-002-20260613    clang-22
i386                  randconfig-003-20260612    clang-22
i386                  randconfig-003-20260613    clang-22
i386                  randconfig-004-20260612    clang-22
i386                  randconfig-004-20260613    clang-22
i386                  randconfig-005-20260612    clang-22
i386                  randconfig-005-20260613    clang-22
i386                  randconfig-006-20260612    clang-22
i386                  randconfig-006-20260613    clang-22
i386                  randconfig-007-20260612    clang-22
i386                  randconfig-007-20260613    clang-22
i386                           randconfig-011    clang-22
i386                  randconfig-011-20260612    clang-22
i386                  randconfig-011-20260613    gcc-14
i386                           randconfig-012    clang-22
i386                  randconfig-012-20260612    clang-22
i386                  randconfig-012-20260613    gcc-14
i386                           randconfig-013    clang-22
i386                  randconfig-013-20260612    clang-22
i386                  randconfig-013-20260613    gcc-14
i386                           randconfig-014    clang-22
i386                  randconfig-014-20260612    clang-22
i386                  randconfig-014-20260613    gcc-14
i386                           randconfig-015    clang-22
i386                  randconfig-015-20260612    clang-22
i386                  randconfig-015-20260613    gcc-14
i386                           randconfig-016    clang-22
i386                  randconfig-016-20260612    clang-22
i386                  randconfig-016-20260613    gcc-14
i386                           randconfig-017    clang-22
i386                  randconfig-017-20260612    clang-22
i386                  randconfig-017-20260613    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260612    clang-23
loongarch             randconfig-001-20260612    gcc-11.5.0
loongarch             randconfig-001-20260613    clang-23
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260612    clang-23
loongarch             randconfig-002-20260612    gcc-11.5.0
loongarch             randconfig-002-20260613    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260612    clang-23
nios2                 randconfig-001-20260612    gcc-11.5.0
nios2                 randconfig-001-20260613    clang-23
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260612    clang-23
nios2                 randconfig-002-20260612    gcc-11.5.0
nios2                 randconfig-002-20260613    clang-23
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-23
parisc                              defconfig    gcc-16.1.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                  mpc885_ads_defconfig    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-11.5.0
riscv                 randconfig-001-20260612    gcc-11.5.0
riscv                 randconfig-001-20260613    gcc-10.5.0
riscv                          randconfig-002    gcc-11.5.0
riscv                 randconfig-002-20260612    gcc-11.5.0
riscv                 randconfig-002-20260613    gcc-10.5.0
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-11.5.0
s390                  randconfig-001-20260612    gcc-11.5.0
s390                  randconfig-001-20260613    gcc-10.5.0
s390                           randconfig-002    gcc-11.5.0
s390                  randconfig-002-20260612    gcc-11.5.0
s390                  randconfig-002-20260613    gcc-10.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-23
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-11.5.0
sh                    randconfig-001-20260612    gcc-11.5.0
sh                    randconfig-001-20260613    gcc-10.5.0
sh                             randconfig-002    gcc-11.5.0
sh                    randconfig-002-20260612    gcc-11.5.0
sh                    randconfig-002-20260613    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260612    gcc-8.5.0
sparc                 randconfig-001-20260613    gcc-13.4.0
sparc                 randconfig-002-20260612    gcc-8.5.0
sparc                 randconfig-002-20260613    gcc-13.4.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260612    gcc-8.5.0
sparc64               randconfig-001-20260613    gcc-13.4.0
sparc64               randconfig-002-20260612    gcc-8.5.0
sparc64               randconfig-002-20260613    gcc-13.4.0
um                               allmodconfig    clang-23
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260612    gcc-8.5.0
um                    randconfig-001-20260613    gcc-13.4.0
um                    randconfig-002-20260612    gcc-8.5.0
um                    randconfig-002-20260613    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260612    gcc-14
x86_64      buildonly-randconfig-002-20260612    gcc-14
x86_64      buildonly-randconfig-003-20260612    gcc-14
x86_64      buildonly-randconfig-004-20260612    gcc-14
x86_64      buildonly-randconfig-005-20260612    gcc-14
x86_64      buildonly-randconfig-006-20260612    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260612    clang-22
x86_64                randconfig-002-20260612    clang-22
x86_64                randconfig-003-20260612    clang-22
x86_64                randconfig-004-20260612    clang-22
x86_64                randconfig-005-20260612    clang-22
x86_64                randconfig-006-20260612    clang-22
x86_64                         randconfig-011    clang-22
x86_64                randconfig-011-20260612    clang-22
x86_64                         randconfig-012    clang-22
x86_64                randconfig-012-20260612    clang-22
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260612    clang-22
x86_64                         randconfig-014    clang-22
x86_64                randconfig-014-20260612    clang-22
x86_64                         randconfig-015    clang-22
x86_64                randconfig-015-20260612    clang-22
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260612    clang-22
x86_64                randconfig-071-20260612    gcc-14
x86_64                randconfig-071-20260613    clang-22
x86_64                randconfig-072-20260612    gcc-14
x86_64                randconfig-072-20260613    clang-22
x86_64                randconfig-073-20260612    gcc-14
x86_64                randconfig-073-20260613    clang-22
x86_64                randconfig-074-20260612    gcc-14
x86_64                randconfig-074-20260613    clang-22
x86_64                randconfig-075-20260612    gcc-14
x86_64                randconfig-075-20260613    clang-22
x86_64                randconfig-076-20260612    gcc-14
x86_64                randconfig-076-20260613    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260612    gcc-8.5.0
xtensa                randconfig-001-20260613    gcc-13.4.0
xtensa                randconfig-002-20260612    gcc-8.5.0
xtensa                randconfig-002-20260613    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

