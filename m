Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84F0CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2CdJ1mReM43G4dHOZpQLjlHFVT6UhxpeQUqOBViW2Ws=; b=e+Qu6Eqtbd7a/3+YUP69fG8W5/
	3Uh4JVdKeWNtZ8BDFx8zYB9CwCx+4C7WIHYwakcJpPwWIY2+HIkaIvatrCUU51WikeZNsJcWTEDij
	RinFoeX7pkkYbwK61nEzS5uPCS7uzi4bD3a95a1TTZNA8plY3fbSNcJuwZi7fGFyfDwTaNN/POChh
	VALBjk/DaNuptspDxdB+S0ylYPUQQLrJomu8E2fa1q/RJl6/NxzgU7M1xQfcXkRqhFeHYq/HVmPeD
	E/pQY7i67FHZbtAzDrxC/VVWlBFaJEE49sSd6XUu/heTzO9T6f3eDiLK+FoOB6a2eP4IoAgoV1zK8
	jWbt9Qfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9pi-00000007DzC-3m3o;
	Sat, 30 Aug 2025 00:52:42 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us8Vx-0000000717v-1BM5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 23:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756510093; x=1788046093;
  h=date:from:to:cc:subject:message-id;
  bh=Hc2bTbDcKoXvcCMDD93kppSxxXuKfZgk17ybwJuYKeI=;
  b=E1NVBoKDGM8KePpjHivRTOfdZVg3jWHiZE9+hqLYuIFCj9FEPrSgNN3e
   6EqbYTmExKqs6UCax1gPD+U6NPSTsk8xzrRsidCnrn+dpQAw1JZQXUGdw
   Zu3vOn5+wqy7u7fS3YRaYe9MkoODkhgl0cC5EGAnLzd5Fgkefgw1hy5y1
   Ixy7vBBQT5c7GF0Y60T0z79E+wSMDbh6rvGYthuoMyzNNhNeEyoRO0FE7
   d9bZjv846SAn9hv7RI9ccSouYY0uX4f8NMKhs0fEQxW+gkusl+g5cHsbF
   qw0Am+psAccI++QC/y5+xkKtz3lyqGkeALzAOnAPoevektcHhm9vPrchE
   Q==;
X-CSE-ConnectionGUID: pMbvYOJ1RWK2HBd0RvgtgQ==
X-CSE-MsgGUID: jg1J4ARyTuiQuaHkLz6NiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58511402"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="58511402"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 16:28:09 -0700
X-CSE-ConnectionGUID: qJNRR170SLKMbziUnRSIXg==
X-CSE-MsgGUID: Ty5LIZI9S7mJfhFv1mi5MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="169745957"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Aug 2025 16:28:08 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us8Uz-000V2z-1Z;
	Fri, 29 Aug 2025 23:27:45 +0000
Date: Sat, 30 Aug 2025 07:18:04 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:nomadik] BUILD SUCCESS
 d799c1bdeaaf9bf59611bd8ca7ff53bcf88a18ab
Message-ID: <202508300754.6tOWZ0hg-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_162813_396239_D2257693 
X-CRM114-Status: UNSURE (   5.56  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git nomadik
branch HEAD: d799c1bdeaaf9bf59611bd8ca7ff53bcf88a18ab  ARM: nomadik: get the cache running normally

elapsed time: 1453m

configs tested: 195
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20250829    gcc-12.5.0
arc                   randconfig-001-20250829    gcc-8.5.0
arc                   randconfig-002-20250829    gcc-10.5.0
arc                   randconfig-002-20250829    gcc-12.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          exynos_defconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                         lpc18xx_defconfig    gcc-15.1.0
arm                   randconfig-001-20250829    gcc-10.5.0
arm                   randconfig-001-20250829    gcc-12.5.0
arm                   randconfig-002-20250829    clang-22
arm                   randconfig-002-20250829    gcc-12.5.0
arm                   randconfig-003-20250829    clang-22
arm                   randconfig-003-20250829    gcc-12.5.0
arm                   randconfig-004-20250829    clang-22
arm                   randconfig-004-20250829    gcc-12.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250829    clang-22
arm64                 randconfig-001-20250829    gcc-12.5.0
arm64                 randconfig-002-20250829    gcc-12.5.0
arm64                 randconfig-003-20250829    clang-22
arm64                 randconfig-003-20250829    gcc-12.5.0
arm64                 randconfig-004-20250829    gcc-12.5.0
arm64                 randconfig-004-20250829    gcc-9.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250829    clang-22
csky                  randconfig-001-20250829    gcc-9.5.0
csky                  randconfig-002-20250829    clang-22
csky                  randconfig-002-20250829    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250829    clang-22
hexagon               randconfig-002-20250829    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250829    clang-20
i386        buildonly-randconfig-001-20250829    gcc-12
i386        buildonly-randconfig-002-20250829    clang-20
i386        buildonly-randconfig-003-20250829    clang-20
i386        buildonly-randconfig-004-20250829    clang-20
i386        buildonly-randconfig-005-20250829    clang-20
i386        buildonly-randconfig-005-20250829    gcc-12
i386        buildonly-randconfig-006-20250829    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250829    clang-20
i386                  randconfig-002-20250829    clang-20
i386                  randconfig-003-20250829    clang-20
i386                  randconfig-004-20250829    clang-20
i386                  randconfig-005-20250829    clang-20
i386                  randconfig-006-20250829    clang-20
i386                  randconfig-007-20250829    clang-20
i386                  randconfig-011-20250829    clang-20
i386                  randconfig-012-20250829    clang-20
i386                  randconfig-013-20250829    clang-20
i386                  randconfig-014-20250829    clang-20
i386                  randconfig-015-20250829    clang-20
i386                  randconfig-016-20250829    clang-20
i386                  randconfig-017-20250829    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250829    clang-22
loongarch             randconfig-002-20250829    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                       bvme6000_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250829    clang-22
nios2                 randconfig-001-20250829    gcc-11.5.0
nios2                 randconfig-002-20250829    clang-22
nios2                 randconfig-002-20250829    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250829    clang-22
parisc                randconfig-001-20250829    gcc-14.3.0
parisc                randconfig-002-20250829    clang-22
parisc                randconfig-002-20250829    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     asp8347_defconfig    gcc-15.1.0
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250829    clang-22
powerpc               randconfig-001-20250829    gcc-13.4.0
powerpc               randconfig-002-20250829    clang-22
powerpc               randconfig-003-20250829    clang-22
powerpc               randconfig-003-20250829    gcc-12.5.0
powerpc64             randconfig-001-20250829    clang-22
powerpc64             randconfig-002-20250829    clang-22
powerpc64             randconfig-003-20250829    clang-22
powerpc64             randconfig-003-20250829    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250829    clang-20
x86_64      buildonly-randconfig-001-20250829    gcc-11
x86_64      buildonly-randconfig-002-20250829    clang-20
x86_64      buildonly-randconfig-002-20250829    gcc-11
x86_64      buildonly-randconfig-003-20250829    clang-20
x86_64      buildonly-randconfig-003-20250829    gcc-12
x86_64      buildonly-randconfig-004-20250829    clang-20
x86_64      buildonly-randconfig-005-20250829    clang-20
x86_64      buildonly-randconfig-006-20250829    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250829    gcc-12
x86_64                randconfig-002-20250829    gcc-12
x86_64                randconfig-003-20250829    gcc-12
x86_64                randconfig-004-20250829    gcc-12
x86_64                randconfig-005-20250829    gcc-12
x86_64                randconfig-006-20250829    gcc-12
x86_64                randconfig-007-20250829    gcc-12
x86_64                randconfig-008-20250829    gcc-12
x86_64                randconfig-071-20250829    clang-20
x86_64                randconfig-072-20250829    clang-20
x86_64                randconfig-073-20250829    clang-20
x86_64                randconfig-074-20250829    clang-20
x86_64                randconfig-075-20250829    clang-20
x86_64                randconfig-076-20250829    clang-20
x86_64                randconfig-077-20250829    clang-20
x86_64                randconfig-078-20250829    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

