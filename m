Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539E8CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 17:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nQGrtQvCIgnuaHXburjx+c053m9NZuNBHWjZ/Je5STY=; b=TIpeDzOVeDTBWMXIqL/EEVZvxl
	5n0cgPSlQezIbrmAlhxrzwn3jjAhQKbgLsq1iVLaZpdZ55EV8uIhrAoTKAlxQhaEKsWk6jHtUsOp2
	Zx7kS/owiNqb1Er+TY7G7yfmMoRElSJRQEFT/ZUdJR7Ys0Bkj+lzZY/gMrVK/xsUMrwcFeukjr85f
	A70gLVFXtOwb0zjKm8ZUtTSVs4qjRjz3Zc8Es3HugrTm/fdQuH+WZ6PtRD2b/c4aWuiUt9kI2qr7n
	X/2Z0wfaOnvmPZ39iS01MnlJV9si5qYlIjezNubDC/qNqu6V+yyAfzJLUGa0FaomHR8iwBgDRRjhv
	MeGEfTLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZiN-00000008fHd-035W;
	Tue, 16 Sep 2025 17:43:39 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZiJ-00000008fG6-3pJl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 17:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758044616; x=1789580616;
  h=date:from:to:cc:subject:message-id;
  bh=hRinaousG9UN/P2UK4R25B1edV17opc+TQU2173DbUg=;
  b=Vz1PjqCkyb0b7A30ki3c1Q8YybnBa83coEMkmcs0HV2f6Z4R0Q/rmIhP
   jZ7t4Cw47DSFZdtjQn/jT+SQlZRfXwj7BlhaLByLSMVwDh5k3xAmFg4YZ
   AZIfxjG+SyfOHjVIeJOHP4jAcIK5zSO6NIdnZIwu8px06BWxGLZWL/gs5
   BmS7jcGFwJRMy7iJhtpYvQGOpXBIt4UfdJflKewdiC0zK86Cxop2w+pV+
   VOHuM/MMCogqBu0BN7rqLFvi7neW9M0yBedZTdyKiehBZ0WQHuHzj2SUL
   geijzgY/uF8NVbLg7Nj1Fl6bVhdyY+qgkikNJMruoiDFLvgfeso4tlH4f
   Q==;
X-CSE-ConnectionGUID: 6uFhizPOS5OCjgKR/OWRgg==
X-CSE-MsgGUID: F4Pp7w0kSLaqnIgh8q0/QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60282222"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60282222"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 10:43:35 -0700
X-CSE-ConnectionGUID: BFjwYCBzRgSntBXK6Alesg==
X-CSE-MsgGUID: vv3wi9+rRLeok6TOtmllpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="179391455"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Sep 2025 10:43:33 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyZiF-0000b6-1C;
	Tue, 16 Sep 2025 17:43:31 +0000
Date: Wed, 17 Sep 2025 01:43:08 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:stm32/dt] BUILD SUCCESS
 53c18dc078bb6d9e9dfe2cc0671ab78588c44723
Message-ID: <202509170102.3LI5t37S-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_104336_019579_81EF0E3A 
X-CRM114-Status: UNSURE (   5.18  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git stm32/dt
branch HEAD: 53c18dc078bb6d9e9dfe2cc0671ab78588c44723  arm64: dts: st: fix memory region size on stm32mp235f-dk

elapsed time: 1488m

configs tested: 237
configs skipped: 5

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
arc                   randconfig-001-20250916    clang-22
arc                   randconfig-001-20250916    gcc-8.5.0
arc                   randconfig-002-20250916    clang-22
arc                   randconfig-002-20250916    gcc-8.5.0
arc                           tb10x_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                            mmp2_defconfig    gcc-15.1.0
arm                       netwinder_defconfig    gcc-15.1.0
arm                          pxa910_defconfig    gcc-15.1.0
arm                   randconfig-001-20250916    clang-22
arm                   randconfig-001-20250916    gcc-11.5.0
arm                   randconfig-002-20250916    clang-22
arm                   randconfig-003-20250916    clang-22
arm                   randconfig-003-20250916    gcc-12.5.0
arm                   randconfig-004-20250916    clang-22
arm                           sama7_defconfig    gcc-15.1.0
arm                        spear6xx_defconfig    gcc-15.1.0
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250916    clang-18
arm64                 randconfig-001-20250916    clang-22
arm64                 randconfig-002-20250916    clang-22
arm64                 randconfig-003-20250916    clang-22
arm64                 randconfig-004-20250916    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250916    clang-22
csky                  randconfig-001-20250916    gcc-14.3.0
csky                  randconfig-002-20250916    clang-22
csky                  randconfig-002-20250916    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250916    clang-22
hexagon               randconfig-002-20250916    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250916    clang-20
i386        buildonly-randconfig-001-20250916    gcc-14
i386        buildonly-randconfig-002-20250916    clang-20
i386        buildonly-randconfig-002-20250916    gcc-14
i386        buildonly-randconfig-003-20250916    clang-20
i386        buildonly-randconfig-004-20250916    clang-20
i386        buildonly-randconfig-004-20250916    gcc-14
i386        buildonly-randconfig-005-20250916    clang-20
i386        buildonly-randconfig-005-20250916    gcc-14
i386        buildonly-randconfig-006-20250916    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250916    clang-20
i386                  randconfig-002-20250916    clang-20
i386                  randconfig-003-20250916    clang-20
i386                  randconfig-004-20250916    clang-20
i386                  randconfig-005-20250916    clang-20
i386                  randconfig-006-20250916    clang-20
i386                  randconfig-007-20250916    clang-20
i386                  randconfig-011-20250916    gcc-14
i386                  randconfig-012-20250916    gcc-14
i386                  randconfig-013-20250916    gcc-14
i386                  randconfig-014-20250916    gcc-14
i386                  randconfig-015-20250916    gcc-14
i386                  randconfig-016-20250916    gcc-14
i386                  randconfig-017-20250916    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250916    clang-18
loongarch             randconfig-001-20250916    clang-22
loongarch             randconfig-002-20250916    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                            q40_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq5_defconfig    gcc-15.1.0
mips                           ip32_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250916    clang-22
nios2                 randconfig-001-20250916    gcc-11.5.0
nios2                 randconfig-002-20250916    clang-22
nios2                 randconfig-002-20250916    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250916    clang-22
parisc                randconfig-001-20250916    gcc-9.5.0
parisc                randconfig-002-20250916    clang-22
parisc                randconfig-002-20250916    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20250916    clang-16
powerpc               randconfig-001-20250916    clang-22
powerpc               randconfig-002-20250916    clang-22
powerpc               randconfig-003-20250916    clang-22
powerpc64             randconfig-001-20250916    clang-22
powerpc64             randconfig-002-20250916    clang-22
powerpc64             randconfig-002-20250916    gcc-8.5.0
powerpc64             randconfig-003-20250916    clang-22
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250916    clang-22
riscv                 randconfig-001-20250916    gcc-15.1.0
riscv                 randconfig-002-20250916    gcc-10.5.0
riscv                 randconfig-002-20250916    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250916    gcc-13.4.0
s390                  randconfig-001-20250916    gcc-15.1.0
s390                  randconfig-002-20250916    gcc-15.1.0
s390                  randconfig-002-20250916    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250916    gcc-15.1.0
sh                    randconfig-002-20250916    gcc-15.1.0
sh                           se7619_defconfig    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250916    gcc-15.1.0
sparc                 randconfig-001-20250916    gcc-8.5.0
sparc                 randconfig-002-20250916    gcc-15.1.0
sparc                 randconfig-002-20250916    gcc-8.5.0
sparc                       sparc32_defconfig    gcc-15.1.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250916    gcc-11.5.0
sparc64               randconfig-001-20250916    gcc-15.1.0
sparc64               randconfig-002-20250916    clang-22
sparc64               randconfig-002-20250916    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250916    gcc-14
um                    randconfig-001-20250916    gcc-15.1.0
um                    randconfig-002-20250916    clang-19
um                    randconfig-002-20250916    gcc-15.1.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250916    clang-20
x86_64      buildonly-randconfig-001-20250916    gcc-14
x86_64      buildonly-randconfig-002-20250916    clang-20
x86_64      buildonly-randconfig-003-20250916    clang-20
x86_64      buildonly-randconfig-004-20250916    clang-20
x86_64      buildonly-randconfig-005-20250916    clang-20
x86_64      buildonly-randconfig-006-20250916    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250916    clang-20
x86_64                randconfig-002-20250916    clang-20
x86_64                randconfig-003-20250916    clang-20
x86_64                randconfig-004-20250916    clang-20
x86_64                randconfig-005-20250916    clang-20
x86_64                randconfig-006-20250916    clang-20
x86_64                randconfig-007-20250916    clang-20
x86_64                randconfig-008-20250916    clang-20
x86_64                randconfig-071-20250916    gcc-14
x86_64                randconfig-072-20250916    gcc-14
x86_64                randconfig-073-20250916    gcc-14
x86_64                randconfig-074-20250916    gcc-14
x86_64                randconfig-075-20250916    gcc-14
x86_64                randconfig-076-20250916    gcc-14
x86_64                randconfig-077-20250916    gcc-14
x86_64                randconfig-078-20250916    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250916    gcc-15.1.0
xtensa                randconfig-001-20250916    gcc-8.5.0
xtensa                randconfig-002-20250916    gcc-15.1.0
xtensa                randconfig-002-20250916    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

