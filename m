Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243AFCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 10:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MBlRwXdBBPkL6SG2lcTFrxGxBUrcHy49EDYGMGeceZ8=; b=YhMZLR1F6922LKdy3rDTHowrdb
	oI1Q3jC74OuV/iHCUKW6UzJSh324oHHYI/x1/Qm3I9YNDbE294nd7mmctvxyCJ9LO7ICew0Eyi9w7
	Mi7nR4jLWtnqetby8h0vJUXYBgP3l8lNcPbDG55vRSL3Ji2YD6sWpRMdX70krRes4qugL5ud7ykx5
	oN4AdO87f0NhK39LnNEXd6WcA4E/hXE6pQ/BBaAVSpRM0UOOYHH3D7HM+0Y+Zg4wS2T2eSSOyL/OZ
	OvwoM6rcezc+o6zKcekGbl+VcjSm07pzTFSElK6jV76sP+YFshPmCMdjUVMzFbkPR7Bz1TH7ThKJR
	rXVKB+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwrb-0000000DM7G-3hym;
	Sat, 03 Oct 2026 10:21:07 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwrZ-0000000DM6Y-1XXO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 10:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791022866; x=1822558866;
  h=date:from:to:cc:subject:message-id;
  bh=/UG6gPlxwA1GDIz8PPAbptDOnWZE41CrSdPUrQEpNPk=;
  b=UczAMRJc97J4JHLdcPDHsc3dIczyIu81A/6zq+DbOovhyWtG6lk4O0eC
   yynRujHnYDmzD95N0xaMA1mSgq/QnpBm2Nhxoj+Q1W5NXoYryiBWgu45d
   ZV7hjlQWdRbybYNtEL07I4+nmdNvZyX1Mu8nfCFjGcWOg/oahJhY9fbx0
   j129tQTkRIH6b/dCR9tsTw3nQkqNTQj4UskT91iExQeir18M9gPBEIOuh
   WGqcuTsUvBYnCtUoR6liUIgBTv3S4dv8SqGSVMgUw+3yMDgsYnrkfgQSu
   EBzUhxWzbzx6oLJjDIa866HPZqBWgKo6Q0RcHtSz/4LsbOl2lJlrqFAwB
   w==;
X-CSE-ConnectionGUID: Y0lhEPxTQnupiixPiYOHBg==
X-CSE-MsgGUID: gGOr4BtbRJSEavUi37x7DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90983066"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90983066"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 03:21:04 -0700
X-CSE-ConnectionGUID: hJPg/MKOS/+upprfPbyWyA==
X-CSE-MsgGUID: ffPGNheZQpOnxfINsIlroA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="414939"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 03 Oct 2026 03:21:02 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCwrT-00000000TtX-2suw;
	Sat, 03 Oct 2026 10:20:59 +0000
Date: Sat, 03 Oct 2026 18:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc:arm] BUILD SUCCESS
 af4f7acd7b73780c7fece5d156e7d9a7791a60af
Message-ID: <202610031833.GjZrByl1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_032105_502807_ACCD6C3C 
X-CRM114-Status: UNSURE (   5.24  )
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
branch HEAD: af4f7acd7b73780c7fece5d156e7d9a7791a60af  ARM: axxia: remove entire platform

elapsed time: 2593m

configs tested: 264
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2307-20261001    gcc-16.1.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                      haps_hs_smp_defconfig    gcc-16.1.0
arc                         nsim_700_defconfig    gcc-16.1.0
arc                   randconfig-1000-20261003    clang-17
arc                   randconfig-1001-20261003    clang-17
arc                  randconfig-r2308-20261001    gcc-16.1.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                           ixp4xx_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261003    clang-17
arm                   randconfig-1001-20261003    clang-17
arm                   randconfig-1002-20261003    clang-17
arm                   randconfig-1003-20261003    clang-17
arm                  randconfig-r2103-20261001    gcc-8.5.0  cocci
arm                  randconfig-r2201-20261001    gcc-16.1.0 smatch
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261003    gcc-9.5.0
arm64                 randconfig-1001-20261003    gcc-9.5.0
arm64                 randconfig-1002-20261003    gcc-9.5.0
arm64                 randconfig-1003-20261003    gcc-9.5.0
arm64                randconfig-r2303-20261001    gcc-15.2.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261003    gcc-9.5.0
csky                  randconfig-1001-20261003    gcc-9.5.0
csky                 randconfig-r2105-20261001    clang-24   cocci
csky                 randconfig-r2302-20261001    gcc-14     sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261003    gcc-16.1.0
hexagon               randconfig-1001-20261003    gcc-16.1.0
hexagon              randconfig-r2104-20261001    clang-24   cocci
hexagon              randconfig-r2106-20261001    clang-24   cocci
hexagon              randconfig-r2300-20261001    gcc-14     sparse
hexagon              randconfig-r2303-20261001    gcc-14     sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261003    gcc-14
i386        buildonly-randconfig-1001-20261003    gcc-14
i386        buildonly-randconfig-1002-20261003    gcc-14
i386        buildonly-randconfig-1003-20261003    gcc-14
i386        buildonly-randconfig-1004-20261003    gcc-14
i386        buildonly-randconfig-1005-20261003    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261003    gcc-14
i386                  randconfig-1001-20261003    gcc-14
i386                  randconfig-1002-20261003    gcc-14
i386                  randconfig-1003-20261003    gcc-14
i386                  randconfig-1004-20261003    gcc-14
i386                  randconfig-1005-20261003    gcc-14
i386                  randconfig-1006-20261003    gcc-14
i386                  randconfig-1007-20261003    gcc-14
i386                  randconfig-1008-20261003    gcc-14
i386                  randconfig-1009-20261003    gcc-14
i386                  randconfig-1010-20261003    gcc-14
i386                  randconfig-1011-20261003    gcc-14
i386                  randconfig-1012-20261003    gcc-14
i386                  randconfig-1013-20261003    gcc-14
i386                  randconfig-2100-20261001    gcc-14     cocci
i386                  randconfig-2101-20261001    gcc-14     cocci
i386                  randconfig-2102-20261001    gcc-14     cocci
i386                  randconfig-2103-20261001    gcc-14     cocci
i386                  randconfig-2200-20261001    clang-22   smatch
i386                  randconfig-2300-20261001    gcc-14     sparse
i386                  randconfig-2301-20261001    gcc-14     sparse
i386                  randconfig-2302-20261001    gcc-14     sparse
i386                 randconfig-r2103-20261001    gcc-9.5.0  cocci
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261003    gcc-16.1.0
loongarch             randconfig-1001-20261003    gcc-16.1.0
loongarch            randconfig-r2102-20261001    gcc-8.5.0  cocci
loongarch            randconfig-r2104-20261001    gcc-14     cocci
loongarch            randconfig-r2107-20261001    gcc-14     cocci
loongarch            randconfig-r2201-20261001    clang-18   smatch
loongarch            randconfig-r2202-20261001    clang-21   smatch
loongarch            randconfig-r2305-20261001    gcc-15.2.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5407c3_defconfig    gcc-16.1.0
m68k                        m5475evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2200-20261001    gcc-8.5.0  smatch
m68k                 randconfig-r2301-20261001    gcc-14     sparse
microblaze                        alldefconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                      cu1000-neo_defconfig    gcc-16.1.0
mips                      cu1830-neo_defconfig    gcc-16.1.0
mips                          db1xxx_defconfig    gcc-16.1.0
mips                 randconfig-r2100-20261001    gcc-8.5.0  cocci
mips                 randconfig-r2102-20261001    gcc-9.5.0  cocci
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261003    gcc-16.1.0
nios2                 randconfig-1001-20261003    gcc-16.1.0
nios2                randconfig-r2100-20261001    gcc-9.5.0  cocci
nios2                randconfig-r2101-20261001    gcc-9.5.0  cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2308-20261001    clang-20   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261003    gcc-11.5.0
parisc                randconfig-1001-20261003    gcc-11.5.0
parisc               randconfig-r2106-20261001    gcc-14     cocci
parisc               randconfig-r2107-20261001    clang-24   cocci
parisc               randconfig-r2200-20261001    gcc-8.5.0  smatch
parisc               randconfig-r2302-20261001    gcc-15.2.0 sparse
parisc               randconfig-r2304-20261001    gcc-15.2.0 sparse
parisc64                             defconfig    clang-24
powerpc                      akebono_defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    gcc-16.1.0
powerpc                      kmeter1_defconfig    gcc-16.1.0
powerpc                    lite5200b_defconfig    gcc-16.1.0
powerpc                      mpc5200_defconfig    gcc-16.1.0
powerpc                      rainier_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261003    gcc-11.5.0
powerpc               randconfig-1001-20261003    gcc-11.5.0
powerpc              randconfig-r2301-20261001    gcc-15.2.0 sparse
powerpc                          wii_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261003    gcc-11.5.0
powerpc64             randconfig-1001-20261003    gcc-11.5.0
powerpc64            randconfig-r2306-20261001    gcc-16.1.0 sparse
powerpc64            randconfig-r2309-20261001    clang-20   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261003    gcc-12.5.0
riscv                 randconfig-1001-20261003    gcc-12.5.0
riscv                 randconfig-2000-20261001    gcc-10.5.0
riscv                 randconfig-2001-20261001    gcc-10.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261003    gcc-12.5.0
s390                  randconfig-1001-20261003    gcc-12.5.0
s390                  randconfig-2000-20261001    gcc-10.5.0
s390                  randconfig-2001-20261001    gcc-10.5.0
s390                 randconfig-r2306-20261001    clang-20   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261003    gcc-12.5.0
sh                    randconfig-1001-20261003    gcc-12.5.0
sh                    randconfig-2000-20261001    gcc-10.5.0
sh                    randconfig-2001-20261001    gcc-10.5.0
sh                           rsk7201_defconfig    gcc-16.1.0
sh                           sdk7786_defconfig    gcc-16.1.0
sh                            se7206_defconfig    gcc-16.1.0
sh                    secureedge5410_defconfig    gcc-16.1.0
sh                    sh7724_generic_defconfig    gcc-16.1.0
sh                         sh7785lcr_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261003    clang-17
sparc                 randconfig-1001-20261003    clang-17
sparc                 randconfig-2000-20261001    clang-24
sparc                 randconfig-2001-20261001    clang-24
sparc                randconfig-r2309-20261001    gcc-16.1.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261003    clang-17
sparc64               randconfig-1001-20261003    clang-17
sparc64               randconfig-2000-20261001    clang-24
sparc64               randconfig-2001-20261001    clang-24
sparc64              randconfig-r2101-20261001    gcc-8.5.0  cocci
sparc64              randconfig-r2304-20261001    gcc-14     sparse
sparc64              randconfig-r2307-20261001    clang-20   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261003    clang-17
um                    randconfig-1001-20261003    clang-17
um                    randconfig-2000-20261001    clang-24
um                    randconfig-2001-20261001    clang-24
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261003    clang-22
x86_64      buildonly-randconfig-1001-20261003    clang-22
x86_64      buildonly-randconfig-1002-20261003    clang-22
x86_64      buildonly-randconfig-1003-20261003    clang-22
x86_64      buildonly-randconfig-1004-20261003    clang-22
x86_64      buildonly-randconfig-1005-20261003    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261003    clang-22
x86_64                randconfig-1001-20261003    clang-22
x86_64                randconfig-1002-20261003    clang-22
x86_64                randconfig-1003-20261003    clang-22
x86_64                randconfig-1004-20261003    clang-22
x86_64                randconfig-1005-20261003    clang-22
x86_64                randconfig-1006-20261003    clang-22
x86_64                randconfig-1007-20261003    clang-22
x86_64                randconfig-1008-20261003    clang-22
x86_64                randconfig-1009-20261003    clang-22
x86_64                randconfig-1010-20261003    clang-22
x86_64                randconfig-1011-20261003    clang-22
x86_64                randconfig-1012-20261003    clang-22
x86_64                randconfig-1013-20261003    clang-22
x86_64                randconfig-1014-20261003    clang-22
x86_64                randconfig-1015-20261003    clang-22
x86_64                randconfig-1016-20261003    clang-22
x86_64                randconfig-1017-20261003    clang-22
x86_64                randconfig-2100-20261001    gcc-14     cocci
x86_64                randconfig-2101-20261001    gcc-14     cocci
x86_64                randconfig-2102-20261001    gcc-14     cocci
x86_64                randconfig-2103-20261001    gcc-14     cocci
x86_64                randconfig-2200-20261001    clang-22   smatch
x86_64                randconfig-2300-20261001    gcc-14     sparse
x86_64                randconfig-2301-20261001    gcc-14     sparse
x86_64                randconfig-2302-20261001    gcc-14     sparse
x86_64               randconfig-r2105-20261001    gcc-14     cocci
x86_64               randconfig-r2202-20261001    clang-22   smatch
x86_64               randconfig-r2305-20261001    gcc-14     sparse
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
xtensa                randconfig-1000-20261003    clang-17
xtensa                randconfig-1001-20261003    clang-17
xtensa                randconfig-2000-20261001    clang-24
xtensa                randconfig-2001-20261001    clang-24
xtensa               randconfig-r2300-20261001    gcc-15.2.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

