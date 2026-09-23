Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB72C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 02:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=76vyKJdYGA1EM9maiU5y4pWh2U1H/flWkf/60hPFVmI=; b=bhWLKpaEqJsyCJ8fdeFJWMiPTs
	PvCGLHzCz5giHOa4u8ZUL6cyxevkiLbnl/NY/7zJDOnHl91TicCxvTmo5SbLR4E6ijBshXLdPGGXn
	Uh/BhZbEMRE1GNYRHhqvYbfjKSjaROsIP7aqjHCxHOkMT1Nzy+zPDA+zPHVvQUcKSfua6pqFPOMtF
	B+fNvwu/7CBXmBvbL0Va0aqKJF2uEA58OZ0G15n6FSU+WJv39tcFvgT9Ms7pHcVkONCxX1LalmTFc
	5lZ8QWwcG7VXJZ3BM665jewPR42rlGkLYfIcC4O3/DMaSe70CRUHdxqw4HuRIT0QI246r/3o/rURL
	PUKjpg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9CcL-00000006vRc-1lkR;
	Wed, 23 Sep 2026 02:21:53 +0000
Received: from mgamail.intel.com ([192.198.163.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9CcI-00000006vR8-3k5s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 02:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790130111; x=1821666111;
  h=date:from:to:cc:subject:message-id;
  bh=Skz99mhit73RfmB0yACvWuciVQbxgP1HNgOTbzZP7W8=;
  b=JNLTYsQGgVsB/uyxF2H7bTX2qO1JMV+MwmnXyWUwhsWYzBoeOtYFFwyz
   NNRqnCKuAJS3JIKT3a+++3JgRq/mEeUSQIHnFrnaf/ALbQpKE0KxigDpx
   c+HLXyw6/6vbW0/PhNoHxMO7waPccRkTOl3MmZyL89+6u9Q+hk9lYQCkW
   CzqJRarv5Vgo1JNqXBOLEUmhFfRXcRXK4aqXj3unUC7vRb70C5ahMcZ4w
   BLAA3YkfL6STD87AbxlbbhEcpWE5n6M5O/3U6GCiS1PNXaT2aBQG8o/VK
   eEH5pQsGwojU92SIjmQ1q9+1G1APeDBt0gd3O4FUicSiNxOfQs6v6T+gI
   A==;
X-CSE-ConnectionGUID: 2KPRQ+hWQFSK5pAr2yqvHg==
X-CSE-MsgGUID: eeJInckCTXGCivwle24BeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1291653"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="1291653"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 19:21:47 -0700
X-CSE-ConnectionGUID: cK44rCGhSDitHKnKNP67Vg==
X-CSE-MsgGUID: qwM2IbVuTZWeTu7oyRUcTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="272598438"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Sep 2026 19:21:46 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9CcC-00000000GOf-03uH;
	Wed, 23 Sep 2026 02:21:44 +0000
Date: Wed, 23 Sep 2026 10:21:19 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:dma40-dt-disabled-channels] BUILD SUCCESS
 ba217a29651af999525a81d26aaac1eac89188a7
Message-ID: <202609231016.E2aKPcdz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_192150_973369_7FA2BF29 
X-CRM114-Status: UNSURE (   5.48  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/dma40-dt-disabled-channels
branch HEAD: ba217a29651af999525a81d26aaac1eac89188a7  dt-bindings: dma: dma40: Restore disabled-channels

elapsed time: 4996m

configs tested: 322
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
arc                               allmodconfig    clang-24
arc                               allmodconfig    gcc-16.1.0
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                          haps_hs_defconfig    gcc-16.1.0
arc                             hsdk_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260921    gcc-9.5.0
arc                   randconfig-1000-20260923    clang-24
arc                   randconfig-1001-20260921    gcc-15.2.0
arc                   randconfig-1001-20260923    clang-24
arm                                allnoconfig    clang-17
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                         multi_v7_defconfig    clang-20
arm                         mvebu_v7_defconfig    clang-24
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20260921    clang-24
arm                   randconfig-1000-20260923    clang-24
arm                   randconfig-1001-20260921    gcc-13.4.0
arm                   randconfig-1001-20260923    clang-24
arm                   randconfig-1002-20260921    gcc-15.2.0
arm                   randconfig-1002-20260923    clang-24
arm                   randconfig-1003-20260921    clang-24
arm                   randconfig-1003-20260923    clang-24
arm                  randconfig-r1307-20260921    gcc-8.5.0  sparse
arm                          s5pv210_defconfig    gcc-16.1.0
arm                         spear3xx_defconfig    clang-20
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260921    clang-24
arm64                 randconfig-1000-20260923    clang-24
arm64                 randconfig-1001-20260921    clang-24
arm64                 randconfig-1001-20260923    clang-24
arm64                 randconfig-1002-20260921    clang-24
arm64                 randconfig-1002-20260923    clang-24
arm64                 randconfig-1003-20260921    gcc-16.1.0
arm64                 randconfig-1003-20260923    clang-24
arm64                randconfig-r1302-20260923    clang-20   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260921    gcc-9.5.0
csky                  randconfig-1000-20260923    clang-24
csky                  randconfig-1001-20260921    gcc-11.5.0
csky                  randconfig-1001-20260923    clang-24
csky                 randconfig-r1306-20260923    gcc-16.1.0 sparse
hexagon                           allmodconfig    clang-24
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    clang-24
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    clang-24
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260921    clang-18
hexagon               randconfig-1000-20260923    gcc-8.5.0
hexagon               randconfig-1001-20260921    clang-17
hexagon               randconfig-1001-20260923    gcc-8.5.0
hexagon              randconfig-r1303-20260923    clang-20   sparse
i386                               allnoconfig    gcc-14
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20260921    clang-22
i386        buildonly-randconfig-1001-20260921    clang-22
i386        buildonly-randconfig-1002-20260921    clang-22
i386        buildonly-randconfig-1003-20260921    clang-22
i386        buildonly-randconfig-1004-20260921    gcc-14
i386        buildonly-randconfig-1005-20260921    clang-22
i386                                 defconfig    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260921    clang-22
i386                  randconfig-1001-20260921    clang-22
i386                  randconfig-1002-20260921    clang-22
i386                  randconfig-1003-20260921    gcc-14
i386                  randconfig-1004-20260921    gcc-13
i386                  randconfig-1005-20260921    clang-22
i386                  randconfig-1006-20260921    clang-22
i386                  randconfig-1007-20260921    gcc-14
i386                  randconfig-1007-20260923    gcc-14
i386                  randconfig-1008-20260921    clang-22
i386                  randconfig-1008-20260923    gcc-14
i386                  randconfig-1009-20260921    gcc-14
i386                  randconfig-1009-20260923    gcc-14
i386                  randconfig-1010-20260921    gcc-14
i386                  randconfig-1010-20260923    gcc-14
i386                  randconfig-1011-20260921    clang-22
i386                  randconfig-1011-20260923    gcc-14
i386                  randconfig-1012-20260921    clang-22
i386                  randconfig-1012-20260923    gcc-14
i386                  randconfig-1013-20260921    clang-22
i386                  randconfig-1013-20260923    gcc-14
i386                  randconfig-1300-20260921    clang-22   sparse
i386                  randconfig-1300-20260923    gcc-12     sparse
i386                  randconfig-1301-20260921    gcc-14     sparse
i386                  randconfig-1301-20260923    gcc-12     sparse
i386                  randconfig-1302-20260921    gcc-14     sparse
i386                  randconfig-1302-20260923    gcc-12     sparse
i386                 randconfig-r1304-20260923    clang-20   sparse
loongarch                         allmodconfig    clang-19
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    clang-20
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260921    clang-18
loongarch             randconfig-1000-20260923    gcc-8.5.0
loongarch             randconfig-1001-20260921    gcc-16.1.0
loongarch             randconfig-1001-20260923    gcc-8.5.0
m68k                              alldefconfig    gcc-16.1.0
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.1.0
m68k                           amiga_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                                 defconfig    gcc-16.1.0
m68k                        m5475evb_defconfig    clang-20
microblaze                        alldefconfig    clang-24
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze                           defconfig    gcc-16.1.0
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                         bcm47xx_defconfig    clang-24
mips                        bmips_be_defconfig    gcc-16.1.0
mips                      cu1000-neo_defconfig    gcc-16.1.0
mips                         qi_lb60_defconfig    clang-24
mips                 randconfig-r1303-20260921    gcc-10.5.0 sparse
mips                    sb1250_swarm_defconfig    clang-24
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                              allnoconfig    gcc-11.5.0
nios2                                defconfig    clang-24
nios2                                defconfig    gcc-11.5.0
nios2                 randconfig-1000-20260921    gcc-8.5.0
nios2                 randconfig-1000-20260923    gcc-8.5.0
nios2                 randconfig-1001-20260921    gcc-11.5.0
nios2                 randconfig-1001-20260923    gcc-8.5.0
nios2                randconfig-r1302-20260921    gcc-10.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                          allmodconfig    gcc-16.1.0
openrisc                           allnoconfig    clang-24
openrisc                           allnoconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r1305-20260923    clang-20   sparse
openrisc             randconfig-r1307-20260923    gcc-16.1.0 sparse
parisc                            alldefconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                             allnoconfig    gcc-16.1.0
parisc                            allyesconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260921    gcc-8.5.0
parisc                randconfig-1000-20260923    clang-22
parisc                randconfig-1001-20260921    gcc-13.4.0
parisc                randconfig-1001-20260923    clang-22
parisc               randconfig-r1309-20260921    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
parisc64                             defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                            allnoconfig    gcc-16.1.0
powerpc                      mpc83xx_defconfig    clang-24
powerpc                      rainier_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260921    clang-17
powerpc               randconfig-1000-20260923    clang-22
powerpc               randconfig-1001-20260921    clang-24
powerpc               randconfig-1001-20260923    clang-22
powerpc                     socrates_defconfig    clang-24
powerpc                   storcenter_defconfig    clang-20
powerpc                      tqm8540_defconfig    gcc-16.1.0
powerpc                       tqm8xx_defconfig    clang-20
powerpc                          wii_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260921    gcc-10.5.0
powerpc64             randconfig-1000-20260923    clang-22
powerpc64             randconfig-1001-20260921    gcc-8.5.0
powerpc64             randconfig-1001-20260923    clang-22
powerpc64            randconfig-r1301-20260921    clang-24   sparse
powerpc64            randconfig-r1308-20260923    gcc-16.1.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                              allnoconfig    gcc-16.1.0
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260921    gcc-12.5.0
riscv                 randconfig-1000-20260923    gcc-16.1.0
riscv                 randconfig-1001-20260921    gcc-8.5.0
riscv                 randconfig-1001-20260923    gcc-16.1.0
riscv                randconfig-r1309-20260923    gcc-16.1.0 sparse
s390                              allmodconfig    clang-24
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    clang-18
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260921    clang-24
s390                  randconfig-1000-20260923    gcc-16.1.0
s390                  randconfig-1001-20260921    clang-24
s390                  randconfig-1001-20260923    gcc-16.1.0
s390                 randconfig-r1304-20260921    clang-24   sparse
s390                 randconfig-r1305-20260921    clang-17   sparse
s390                 randconfig-r1306-20260921    clang-17   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                 allnoconfig    gcc-16.1.0
sh                                allyesconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                                   defconfig    gcc-16.1.0
sh                          ecovec24_defconfig    clang-24
sh                              espt_defconfig    gcc-16.1.0
sh                           r7785rp_defconfig    clang-20
sh                    randconfig-1000-20260921    gcc-9.5.0
sh                    randconfig-1000-20260923    gcc-16.1.0
sh                    randconfig-1001-20260921    gcc-16.1.0
sh                    randconfig-1001-20260923    gcc-16.1.0
sh                            se7343_defconfig    clang-20
sh                            se7343_defconfig    gcc-16.1.0
sparc                             alldefconfig    clang-20
sparc                              allnoconfig    clang-24
sparc                              allnoconfig    gcc-16.1.0
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260921    gcc-8.5.0
sparc                 randconfig-1001-20260921    gcc-11.5.0
sparc                randconfig-r1300-20260921    gcc-11.5.0 sparse
sparc                randconfig-r1308-20260921    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    clang-24
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260921    clang-21
sparc64               randconfig-1001-20260921    clang-22
sparc64              randconfig-r1301-20260923    clang-20   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-14
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    clang-24
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260921    gcc-14
um                    randconfig-1001-20260921    gcc-14
um                            x86_64_defconfig    clang-24
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20260921    clang-22
x86_64      buildonly-randconfig-1000-20260923    gcc-14
x86_64      buildonly-randconfig-1001-20260921    gcc-13
x86_64      buildonly-randconfig-1001-20260923    gcc-14
x86_64      buildonly-randconfig-1002-20260921    clang-22
x86_64      buildonly-randconfig-1002-20260923    gcc-14
x86_64      buildonly-randconfig-1003-20260921    clang-22
x86_64      buildonly-randconfig-1003-20260923    gcc-14
x86_64      buildonly-randconfig-1004-20260921    clang-22
x86_64      buildonly-randconfig-1004-20260923    gcc-14
x86_64      buildonly-randconfig-1005-20260921    clang-22
x86_64      buildonly-randconfig-1005-20260923    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260921    gcc-13
x86_64                randconfig-1000-20260923    gcc-14
x86_64                randconfig-1001-20260921    clang-22
x86_64                randconfig-1001-20260923    gcc-14
x86_64                randconfig-1002-20260921    gcc-14
x86_64                randconfig-1002-20260923    gcc-14
x86_64                randconfig-1003-20260921    gcc-14
x86_64                randconfig-1003-20260923    gcc-14
x86_64                randconfig-1004-20260921    clang-22
x86_64                randconfig-1004-20260923    gcc-14
x86_64                randconfig-1005-20260921    clang-22
x86_64                randconfig-1005-20260923    gcc-14
x86_64                randconfig-1006-20260921    gcc-14
x86_64                randconfig-1006-20260923    gcc-13
x86_64                randconfig-1007-20260921    clang-22
x86_64                randconfig-1007-20260923    gcc-13
x86_64                randconfig-1008-20260921    clang-22
x86_64                randconfig-1008-20260923    gcc-13
x86_64                randconfig-1009-20260921    clang-22
x86_64                randconfig-1009-20260923    gcc-13
x86_64                randconfig-1010-20260921    gcc-14
x86_64                randconfig-1010-20260923    gcc-13
x86_64                randconfig-1011-20260921    clang-22
x86_64                randconfig-1011-20260923    gcc-13
x86_64                randconfig-1012-20260921    clang-22
x86_64                randconfig-1012-20260923    gcc-14
x86_64                randconfig-1013-20260921    clang-22
x86_64                randconfig-1013-20260923    gcc-14
x86_64                randconfig-1014-20260921    clang-22
x86_64                randconfig-1014-20260923    gcc-14
x86_64                randconfig-1015-20260921    clang-22
x86_64                randconfig-1015-20260923    gcc-14
x86_64                randconfig-1016-20260921    clang-22
x86_64                randconfig-1016-20260923    gcc-14
x86_64                randconfig-1017-20260921    gcc-12
x86_64                randconfig-1017-20260923    gcc-14
x86_64                randconfig-1300-20260921    gcc-14     sparse
x86_64                randconfig-1300-20260923    gcc-12     sparse
x86_64                randconfig-1301-20260921    clang-22   sparse
x86_64                randconfig-1301-20260923    gcc-12     sparse
x86_64                randconfig-1302-20260921    clang-22   sparse
x86_64                randconfig-1302-20260923    gcc-12     sparse
x86_64               randconfig-r1300-20260923    clang-20   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                             allnoconfig    gcc-16.1.0
xtensa                            allyesconfig    clang-20
xtensa                            allyesconfig    gcc-16.1.0
xtensa                randconfig-1000-20260921    gcc-11.5.0
xtensa                randconfig-1001-20260921    gcc-9.5.0
xtensa                     xip_kc705_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

