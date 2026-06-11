Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868EFCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 01:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2hhafQbBaAuQlbNjYQpnO/lB1n34JH4gP2PlCasBXnk=; b=NeQRoNS4q/vq1jTNnYiNJseoeJ
	c1bSxhSBf+GAC06XUdZACrt5RDc56wNqLfYCO9hMMG7xAYSTUpDvrROjVJOISgo3kJPOBPxPlHu4R
	gLaVjCmkWguwxazCZ8esjDgXXQywYEbcgsD/wUjQfUJDfDBpNzfb58HxddhbLCzqo287dqt3xFqxO
	IyFHCofuG9XKL2WZ2TS+xCUmBURpLmKil2fGPQI7cmyRjByc7ZGA4y6VXq38ePQxZvB9JmYYFJHaC
	eKwzNu3005/UqStgVtOZYoyBzMHxrKwgxlccGORHZNAW2LnfjRLTOHH6LKZXnzxCsqq6GH4LUFZbS
	8uHTvh0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXUh6-00000008XjX-1J20;
	Thu, 11 Jun 2026 01:58:56 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXUh1-00000008Xiv-1I2A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 01:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781143131; x=1812679131;
  h=date:from:to:cc:subject:message-id;
  bh=jehFkMsmlfyPJZJ40uQeQzrlj3oJmWdunyclQOQ2tHM=;
  b=Q4Wlv1nWdg7fzGQMYXXY35hpC+WVdcL/I/pvMVI1P1kI+9HwOdGNJB6a
   F9s6+jiy+mGD2AeEKaDjy5OtDAwshyFAeVo1jReL6+5mAZxVd3Br+qUBG
   6M0OCxgU1urtapfLb4x89A1bD7wus2K+zd/pOuZVQSnX/MVpRdqNRubOw
   UzlsKva4bXaNKZR/Bjblo8/UrB5AOc2sLmfeY69nLoatTG7ErKNNmUNL/
   fI8r+xToKg5KyprLpgUqOnL1ws4gmntg2w4BbKDgN9/ThzwEAm6fr3qzk
   ZkbWKRrc50yIWjjxwHvevAe9LLgOkHg2YWJRQLu6Drl7QZY93cCVlkR2e
   g==;
X-CSE-ConnectionGUID: 3G4pYP8ZReGvajCXaMJvhg==
X-CSE-MsgGUID: H6zi5487RM+f3Ia2kCzNVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84524054"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="84524054"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:58:48 -0700
X-CSE-ConnectionGUID: svUXGqLtRdGSSrNIAR0AKg==
X-CSE-MsgGUID: dTI3Fth7SvmRSpACcUKZ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251442953"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jun 2026 18:54:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXUcp-00000000M96-1fW4;
	Thu, 11 Jun 2026 01:54:31 +0000
Date: Thu, 11 Jun 2026 09:53:41 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:sophgo/dt] BUILD SUCCESS
 903a9364e40563faf4730dc63ad7446246f494ff
Message-ID: <202606110930.vVPxglg0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_185851_811964_E0E39A71 
X-CRM114-Status: UNSURE (   4.72  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git sophgo/dt
branch HEAD: 903a9364e40563faf4730dc63ad7446246f494ff  riscv: dts: sophgo: reduce SG2042 MSI count to 16

elapsed time: 2231m

configs tested: 295
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260610    gcc-8.5.0
arc                   randconfig-001-20260611    gcc-14.3.0
arc                   randconfig-002-20260610    gcc-9.5.0
arc                   randconfig-002-20260611    gcc-14.3.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                        mvebu_v7_defconfig    clang-23
arm                   randconfig-001-20260610    clang-23
arm                   randconfig-001-20260611    gcc-14.3.0
arm                   randconfig-002-20260610    clang-20
arm                   randconfig-002-20260611    gcc-14.3.0
arm                   randconfig-003-20260610    clang-23
arm                   randconfig-003-20260611    gcc-14.3.0
arm                   randconfig-004-20260610    clang-23
arm                   randconfig-004-20260611    gcc-14.3.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260610    gcc-11.5.0
arm64                 randconfig-001-20260611    gcc-14.3.0
arm64                 randconfig-002-20260610    gcc-9.5.0
arm64                 randconfig-002-20260611    gcc-14.3.0
arm64                 randconfig-003-20260610    gcc-8.5.0
arm64                 randconfig-003-20260611    gcc-14.3.0
arm64                 randconfig-004-20260610    clang-23
arm64                 randconfig-004-20260611    gcc-14.3.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260610    gcc-9.5.0
csky                  randconfig-001-20260611    gcc-14.3.0
csky                  randconfig-002-20260610    gcc-11.5.0
csky                  randconfig-002-20260611    gcc-14.3.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260610    clang-23
hexagon               randconfig-001-20260611    clang-17
hexagon               randconfig-002-20260610    clang-22
hexagon               randconfig-002-20260611    clang-17
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    clang-22
i386        buildonly-randconfig-001-20260610    gcc-14
i386        buildonly-randconfig-001-20260611    clang-22
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260610    gcc-14
i386        buildonly-randconfig-002-20260611    clang-22
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260610    gcc-14
i386        buildonly-randconfig-003-20260611    clang-22
i386                 buildonly-randconfig-004    clang-22
i386        buildonly-randconfig-004-20260610    gcc-14
i386        buildonly-randconfig-004-20260611    clang-22
i386                 buildonly-randconfig-005    clang-22
i386        buildonly-randconfig-005-20260610    gcc-14
i386        buildonly-randconfig-005-20260611    clang-22
i386                 buildonly-randconfig-006    clang-22
i386        buildonly-randconfig-006-20260610    clang-22
i386        buildonly-randconfig-006-20260611    clang-22
i386                                defconfig    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260610    gcc-14
i386                  randconfig-001-20260611    gcc-14
i386                  randconfig-002-20260610    gcc-14
i386                  randconfig-002-20260611    gcc-14
i386                  randconfig-003-20260610    clang-22
i386                  randconfig-003-20260611    gcc-14
i386                  randconfig-004-20260610    gcc-14
i386                  randconfig-004-20260611    gcc-14
i386                  randconfig-005-20260610    clang-22
i386                  randconfig-005-20260611    gcc-14
i386                  randconfig-006-20260610    gcc-14
i386                  randconfig-006-20260611    gcc-14
i386                  randconfig-007-20260610    gcc-14
i386                  randconfig-007-20260611    gcc-14
i386                  randconfig-011-20260610    clang-22
i386                  randconfig-011-20260611    gcc-14
i386                  randconfig-012-20260610    clang-22
i386                  randconfig-012-20260611    gcc-14
i386                  randconfig-013-20260610    clang-22
i386                  randconfig-013-20260611    gcc-14
i386                  randconfig-014-20260610    clang-22
i386                  randconfig-014-20260611    gcc-14
i386                  randconfig-015-20260610    clang-22
i386                  randconfig-015-20260611    gcc-14
i386                  randconfig-016-20260610    clang-22
i386                  randconfig-016-20260611    gcc-14
i386                  randconfig-017-20260610    gcc-14
i386                  randconfig-017-20260611    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260610    gcc-16.1.0
loongarch             randconfig-001-20260611    clang-17
loongarch             randconfig-002-20260610    gcc-16.1.0
loongarch             randconfig-002-20260611    clang-17
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                                defconfig    gcc-16.1.0
m68k                        mvme16x_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260610    gcc-11.5.0
nios2                 randconfig-001-20260611    clang-17
nios2                 randconfig-002-20260610    gcc-11.5.0
nios2                 randconfig-002-20260611    clang-17
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
openrisc                 simple_smp_defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260610    gcc-8.5.0
parisc                randconfig-001-20260611    gcc-13.4.0
parisc                randconfig-002-20260610    gcc-8.5.0
parisc                randconfig-002-20260611    gcc-13.4.0
parisc64                            defconfig    clang-23
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260610    gcc-9.5.0
powerpc               randconfig-001-20260611    gcc-13.4.0
powerpc               randconfig-002-20260610    clang-23
powerpc               randconfig-002-20260611    gcc-13.4.0
powerpc64             randconfig-001-20260610    clang-23
powerpc64             randconfig-001-20260611    gcc-13.4.0
powerpc64             randconfig-002-20260610    gcc-10.5.0
powerpc64             randconfig-002-20260611    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260610    gcc-15.2.0
riscv                 randconfig-001-20260611    gcc-12.5.0
riscv                 randconfig-002-20260610    gcc-8.5.0
riscv                 randconfig-002-20260611    gcc-12.5.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260610    clang-23
s390                  randconfig-001-20260611    gcc-12.5.0
s390                  randconfig-002-20260610    clang-23
s390                  randconfig-002-20260611    gcc-12.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260610    gcc-16.1.0
sh                    randconfig-001-20260611    gcc-12.5.0
sh                    randconfig-002-20260610    gcc-16.1.0
sh                    randconfig-002-20260611    gcc-12.5.0
sh                   sh7770_generic_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260610    gcc-8.5.0
sparc                 randconfig-001-20260611    gcc-15.2.0
sparc                 randconfig-002-20260610    gcc-14.3.0
sparc                 randconfig-002-20260611    gcc-15.2.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260610    gcc-12.5.0
sparc64               randconfig-001-20260611    gcc-15.2.0
sparc64               randconfig-002-20260610    clang-23
sparc64               randconfig-002-20260611    gcc-15.2.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260610    clang-23
um                    randconfig-001-20260611    gcc-15.2.0
um                    randconfig-002-20260610    clang-18
um                    randconfig-002-20260611    gcc-15.2.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260610    clang-22
x86_64      buildonly-randconfig-001-20260611    gcc-14
x86_64      buildonly-randconfig-002-20260610    gcc-14
x86_64      buildonly-randconfig-002-20260611    gcc-14
x86_64      buildonly-randconfig-003-20260610    clang-22
x86_64      buildonly-randconfig-003-20260611    gcc-14
x86_64      buildonly-randconfig-004-20260610    clang-22
x86_64      buildonly-randconfig-004-20260611    gcc-14
x86_64      buildonly-randconfig-005-20260610    gcc-14
x86_64      buildonly-randconfig-005-20260611    gcc-14
x86_64      buildonly-randconfig-006-20260610    gcc-14
x86_64      buildonly-randconfig-006-20260611    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260610    clang-22
x86_64                randconfig-001-20260611    gcc-14
x86_64                randconfig-002-20260610    clang-22
x86_64                randconfig-002-20260611    gcc-14
x86_64                randconfig-003-20260610    gcc-13
x86_64                randconfig-003-20260611    gcc-14
x86_64                randconfig-004-20260610    clang-22
x86_64                randconfig-004-20260611    gcc-14
x86_64                randconfig-005-20260610    clang-22
x86_64                randconfig-005-20260611    gcc-14
x86_64                randconfig-006-20260610    gcc-13
x86_64                randconfig-006-20260611    gcc-14
x86_64                randconfig-011-20260611    clang-22
x86_64                randconfig-011-20260611    gcc-14
x86_64                randconfig-012-20260611    gcc-14
x86_64                randconfig-013-20260611    gcc-14
x86_64                randconfig-014-20260611    gcc-14
x86_64                randconfig-015-20260611    gcc-14
x86_64                randconfig-016-20260611    clang-22
x86_64                randconfig-016-20260611    gcc-14
x86_64                randconfig-071-20260610    gcc-14
x86_64                randconfig-071-20260611    clang-22
x86_64                randconfig-072-20260610    clang-22
x86_64                randconfig-072-20260611    clang-22
x86_64                randconfig-073-20260610    clang-22
x86_64                randconfig-073-20260611    clang-22
x86_64                randconfig-074-20260610    gcc-14
x86_64                randconfig-074-20260611    clang-22
x86_64                randconfig-075-20260610    gcc-14
x86_64                randconfig-075-20260611    clang-22
x86_64                randconfig-076-20260610    clang-22
x86_64                randconfig-076-20260611    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260610    gcc-8.5.0
xtensa                randconfig-001-20260611    gcc-15.2.0
xtensa                randconfig-002-20260610    gcc-8.5.0
xtensa                randconfig-002-20260611    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

