Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94340C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 13:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VTNxEN4E8stAmVFN0RbF1huoVtM27kt00kSeCM2k0ko=; b=VSrArQvo/ztpHbo9EPOJ9iimIo
	pmWYiRQx5ect1AV/alEWnplcMx4IGcNIhxckHa++j8eUquaMcdGfMd1k4pdCb5HSBJH3ZBVSNVRyB
	dnlLZlw2rDEwY/TzKbyRWgRYjgvGqiYKZMOA1Ki7etRyBGKoO0lEgHTrt0hWrUg5TzVAK1350BzLE
	P6fYE13lLV+El2vuqlzZRPF/DVK3S3fihzarcx9gK7/9/yH8AwqLMMw0E8jBesxT3cUFLbW13XdAD
	4mK84j0NgThENPZHkLI4Dj1KW8t8LpSx52bjI+D8WIJO5Wna7ymBfBWubfVtX63Mq5PQWcpNv4i4U
	D3wBYYHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xApFz-0000000GPIy-3JsB;
	Sun, 27 Sep 2026 13:49:31 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xApFx-0000000GPIa-0qH2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 13:49:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790516969; x=1822052969;
  h=date:from:to:cc:subject:message-id;
  bh=/kxuKsZXlRWxnWCaG+5I0FcUSi8IowP6O2T47J2PQgk=;
  b=NfbKDtI03nfcDkVUuimrTKKBolA7elAONWl/De+rperU3PvBAium19Lc
   4wm8Jy8gR4U0XQ9fQQ8waVkl3nTnBAVlxMl+Z371897YhZpFO+rMBswjV
   jM97KmLxW/0pbBMPpj0CuFLiihq1uavsYsPgsx9r9IT2GKu7sYTldmFVP
   QDbBjGrr8t6eysH0Cj5ZJdu9ngeU6FUP7AxPAii/iFoUqFDMAaSpmJ1i9
   oD8mW1eC5ngAd/Llcl8BLmEklEQQbv/6ndb4Vkf7nq5ZNMhd3NCInZVz0
   hGT2U3HqL8ez+34El67Vd7MvUUUr7J0q1VFyB1gyWe74Gm5biDZgYv0+G
   g==;
X-CSE-ConnectionGUID: TEVDaPU6TweIoDQtCTNuEA==
X-CSE-MsgGUID: Zc/fyWQhSj+O9hd2qpZ//w==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="89998751"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="89998751"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 06:49:26 -0700
X-CSE-ConnectionGUID: m1fQYDw1Q0uvg7RMCXSbNg==
X-CSE-MsgGUID: KIPAzirGRlCZZUHSYzBBBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="274939084"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Sep 2026 06:49:24 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xApFq-00000000Mul-0cF5;
	Sun, 27 Sep 2026 13:49:22 +0000
Date: Sun, 27 Sep 2026 21:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:ab8500-charger-dt] BUILD SUCCESS
 4b805deec8c84bac42a10a9f29e118469c2e0e68
Message-ID: <202609272135.xtUE88qt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_064929_312634_065A2A2B 
X-CRM114-Status: UNSURE (   5.31  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ab8500-charger-dt
branch HEAD: 4b805deec8c84bac42a10a9f29e118469c2e0e68  ARM: dts: ux500: Use AB8505 charger compatible

elapsed time: 1805m

configs tested: 266
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2102-20260927    gcc-8.5.0  cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                  nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260927    gcc-11.5.0
arc                   randconfig-1001-20260927    gcc-11.5.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                   randconfig-1000-20260927    gcc-11.5.0
arm                   randconfig-1001-20260927    gcc-11.5.0
arm                   randconfig-1002-20260927    gcc-11.5.0
arm                   randconfig-1003-20260927    gcc-11.5.0
arm                  randconfig-r2107-20260927    clang-17   cocci
arm                  randconfig-r2107-20260927    gcc-8.5.0  cocci
arm                           sp7021_defconfig    gcc-11.5.0
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260927    clang-17
arm64                 randconfig-1001-20260927    clang-17
arm64                 randconfig-1002-20260927    clang-17
arm64                 randconfig-1003-20260927    clang-17
arm64                randconfig-r2202-20260927    gcc-10.5.0 smatch
arm64                randconfig-r2305-20260927    gcc-15.2.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260927    clang-17
csky                  randconfig-1001-20260927    clang-17
csky                 randconfig-r2106-20260927    clang-17   cocci
csky                 randconfig-r2300-20260927    gcc-15.2.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260927    gcc-11.5.0
hexagon               randconfig-1001-20260927    gcc-11.5.0
hexagon              randconfig-r2104-20260927    clang-24   cocci
hexagon              randconfig-r2304-20260927    gcc-15.2.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260927    clang-22
i386        buildonly-randconfig-1001-20260927    clang-22
i386        buildonly-randconfig-1002-20260927    clang-22
i386        buildonly-randconfig-1003-20260927    clang-22
i386        buildonly-randconfig-1004-20260927    clang-22
i386        buildonly-randconfig-1005-20260927    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260927    clang-22
i386                  randconfig-1001-20260927    clang-22
i386                  randconfig-1002-20260927    clang-22
i386                  randconfig-1003-20260927    clang-22
i386                  randconfig-1004-20260927    clang-22
i386                  randconfig-1005-20260927    clang-22
i386                  randconfig-1006-20260927    clang-22
i386                  randconfig-1007-20260927    gcc-14
i386                  randconfig-1008-20260927    gcc-14
i386                  randconfig-1009-20260927    gcc-14
i386                  randconfig-1010-20260927    gcc-14
i386                  randconfig-1011-20260927    gcc-14
i386                  randconfig-1012-20260927    gcc-14
i386                  randconfig-1013-20260927    gcc-14
i386                  randconfig-2100-20260927    clang-22   cocci
i386                  randconfig-2101-20260927    clang-22   cocci
i386                  randconfig-2102-20260927    clang-22   cocci
i386                  randconfig-2103-20260927    clang-22   cocci
i386                  randconfig-2200-20260927    clang-22   smatch
i386                  randconfig-2300-20260927    clang-22   sparse
i386                  randconfig-2301-20260927    clang-22   sparse
i386                  randconfig-2302-20260927    clang-22   sparse
i386                 randconfig-r2101-20260927    gcc-8.5.0  cocci
i386                 randconfig-r2107-20260927    clang-24   cocci
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260927    gcc-11.5.0
loongarch             randconfig-1001-20260927    gcc-11.5.0
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    gcc-11.5.0
m68k                 randconfig-r2301-20260927    gcc-15.2.0 sparse
m68k                            sun3_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2100-20260927    gcc-8.5.0  cocci
microblaze           randconfig-r2202-20260927    gcc-13.4.0 smatch
microblaze           randconfig-r2304-20260927    clang-24   sparse
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                         bcm47xx_defconfig    gcc-11.5.0
mips                   cavium_octeon_defconfig    gcc-16.1.0
mips                          db1xxx_defconfig    gcc-16.1.0
mips                           eyeq6_defconfig    gcc-16.1.0
mips                      eyeq6lplus_defconfig    gcc-16.1.0
mips                        lemote2f_defconfig    gcc-16.1.0
mips                 randconfig-r2305-20260927    clang-24   sparse
nios2                             alldefconfig    gcc-11.5.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260927    gcc-11.5.0
nios2                 randconfig-1001-20260927    gcc-11.5.0
nios2                randconfig-r2103-20260927    gcc-8.5.0  cocci
nios2                randconfig-r2303-20260927    gcc-15.2.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc                     or1ksim_defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20260927    gcc-13.4.0 cocci
openrisc             randconfig-r2106-20260927    clang-24   cocci
openrisc             randconfig-r2200-20260927    gcc-16.1.0 smatch
openrisc             randconfig-r2300-20260927    clang-24   sparse
openrisc             randconfig-r2301-20260927    clang-24   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260927    clang-24
parisc                randconfig-1001-20260927    clang-24
parisc               randconfig-r2103-20260927    gcc-13.4.0 cocci
parisc               randconfig-r2104-20260927    gcc-8.5.0  cocci
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc               randconfig-1000-20260927    clang-24
powerpc               randconfig-1001-20260927    clang-24
powerpc              randconfig-r2105-20260927    clang-17   cocci
powerpc              randconfig-r2302-20260927    gcc-15.2.0 sparse
powerpc                      tqm8541_defconfig    gcc-11.5.0
powerpc                      tqm8541_defconfig    gcc-16.1.0
powerpc                      tqm8548_defconfig    gcc-11.5.0
powerpc                      tqm8555_defconfig    gcc-11.5.0
powerpc                      tqm8560_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260927    clang-24
powerpc64             randconfig-1001-20260927    clang-24
powerpc64            randconfig-r2102-20260927    gcc-13.4.0 cocci
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260927    gcc-16.1.0
riscv                 randconfig-1001-20260927    gcc-16.1.0
riscv                 randconfig-2000-20260927    clang-24
riscv                 randconfig-2001-20260927    clang-24
riscv                randconfig-r2201-20260927    gcc-8.5.0  smatch
riscv                randconfig-r2307-20260927    clang-24   sparse
riscv                randconfig-r2308-20260927    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                           debug_defconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260927    gcc-16.1.0
s390                  randconfig-1001-20260927    gcc-16.1.0
s390                  randconfig-2000-20260927    clang-24
s390                  randconfig-2001-20260927    clang-24
s390                 randconfig-r2105-20260927    gcc-8.5.0  cocci
s390                 randconfig-r2302-20260927    clang-24   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           polaris_defconfig    gcc-16.1.0
sh                           r7780mp_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260927    gcc-16.1.0
sh                    randconfig-1001-20260927    gcc-16.1.0
sh                    randconfig-2000-20260927    clang-24
sh                    randconfig-2001-20260927    clang-24
sh                   randconfig-r2200-20260927    gcc-13.4.0 smatch
sh                             titan_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260927    clang-24
sparc                 randconfig-1001-20260927    clang-24
sparc                 randconfig-2000-20260927    gcc-16.1.0
sparc                 randconfig-2001-20260927    gcc-16.1.0
sparc                randconfig-r2105-20260927    clang-24   cocci
sparc                randconfig-r2106-20260927    gcc-8.5.0  cocci
sparc                randconfig-r2306-20260927    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260927    clang-24
sparc64               randconfig-1001-20260927    clang-24
sparc64               randconfig-2000-20260927    gcc-16.1.0
sparc64               randconfig-2001-20260927    gcc-16.1.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260927    clang-24
um                    randconfig-1001-20260927    clang-24
um                    randconfig-2000-20260927    gcc-16.1.0
um                    randconfig-2001-20260927    gcc-16.1.0
um                   randconfig-r2202-20260927    gcc-14     smatch
um                   randconfig-r2303-20260927    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260927    gcc-14
x86_64      buildonly-randconfig-1001-20260927    gcc-14
x86_64      buildonly-randconfig-1002-20260927    gcc-14
x86_64      buildonly-randconfig-1003-20260927    gcc-14
x86_64      buildonly-randconfig-1004-20260927    gcc-14
x86_64      buildonly-randconfig-1005-20260927    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260927    clang-22
x86_64                randconfig-1001-20260927    clang-22
x86_64                randconfig-1002-20260927    clang-22
x86_64                randconfig-1003-20260927    clang-22
x86_64                randconfig-1004-20260927    clang-22
x86_64                randconfig-1005-20260927    clang-22
x86_64                randconfig-1006-20260927    clang-22
x86_64                randconfig-1007-20260927    clang-22
x86_64                randconfig-1008-20260927    clang-22
x86_64                randconfig-1009-20260927    clang-22
x86_64                randconfig-1010-20260927    clang-22
x86_64                randconfig-1011-20260927    clang-22
x86_64                randconfig-1012-20260927    clang-22
x86_64                randconfig-1013-20260927    clang-22
x86_64                randconfig-1014-20260927    clang-22
x86_64                randconfig-1015-20260927    clang-22
x86_64                randconfig-1016-20260927    clang-22
x86_64                randconfig-1017-20260927    clang-22
x86_64                randconfig-2100-20260927    clang-22   cocci
x86_64                randconfig-2101-20260927    clang-22   cocci
x86_64                randconfig-2102-20260927    clang-22   cocci
x86_64                randconfig-2103-20260927    clang-22   cocci
x86_64                randconfig-2200-20260927    gcc-14     smatch
x86_64                randconfig-2300-20260927    clang-22   sparse
x86_64                randconfig-2300-20260927    gcc-14     sparse
x86_64                randconfig-2301-20260927    clang-22   sparse
x86_64                randconfig-2301-20260927    gcc-14     sparse
x86_64                randconfig-2302-20260927    clang-22   sparse
x86_64                randconfig-2302-20260927    gcc-13     sparse
x86_64               randconfig-r2201-20260927    clang-22   smatch
x86_64               randconfig-r2202-20260927    gcc-13     smatch
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20260927    clang-24
xtensa                randconfig-1001-20260927    clang-24
xtensa                randconfig-2000-20260927    gcc-16.1.0
xtensa                randconfig-2001-20260927    gcc-16.1.0
xtensa               randconfig-r2100-20260927    gcc-13.4.0 cocci
xtensa               randconfig-r2104-20260927    clang-17   cocci
xtensa               randconfig-r2201-20260927    gcc-16.1.0 smatch
xtensa               randconfig-r2309-20260927    clang-24   sparse
xtensa                     smp_lx200_defconfig    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

