Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBCBE6B26E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 04:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zx+8w5DDpMiCW+6xSU1PPCUDQV87onLlSTkFDrSHaBA=; b=cBLXXTJULYp9C0o9B51nQJkOGi
	Q17cflk5VpYpAlxo00SFXs6IW0FZpFTkpZy069+xGTcYCVEOLTsjL7CwnObKrYJt9C6TQLp6fO6y9
	MTenK0rTKIlBk/qIazXRyX/HheJ24vsd34ySJE65QtId/YJnc8Exdhn/wUFyYzI2C/bbyKHlOQV51
	SkbhWHBUkttwCNVNWNjh80vrIZ2WVyHvCLLjE4KPWthGWPW2RweXbcm0eE3Ly0rPvwClYpUoJ7d/j
	kQVFKlgaceHtshM1yDDweeMVMoo0nEcgj2i3xi+fTyhgkvOyIP/7NgMPlyYy5tpiuBHTvGRUp3Yiq
	mO0pvj2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXtxR-0000000EV5z-2Qe1;
	Tue, 23 Dec 2025 04:25:13 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXtxK-0000000EV5H-2ZXm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 04:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766463906; x=1797999906;
  h=date:from:to:cc:subject:message-id;
  bh=e+5GcChVAmPCyIU6JKZ7VFnKQfN2qC3DX4BemW6C988=;
  b=ni1BCUC9orKq85jengLluX96nLqfwaAhq0OTy5yIHX+YYTgONs3Qt02d
   TUhon6AmvUDjdv4Os8wxqDHWBEHci4aV4VnypAmpYlj5g5DJi4HZX8ci2
   16iX6l/mUjz7jrItCicRVuFCUsej3lTjXOPuVn0qmo0DHWFuQ/l6lhnSR
   5Q05fcSGgYMSxP+r6N3MtrWgLEb0eCEYyKSn9mxWslsZ8KHq1H0dVqJls
   IpP5XVXBLfgS/4+wH/u9Cqv7tmxnB4MXG/B5oubZmcCl3Hr6vxO6rjYgJ
   EqRkp4czRW0I3S0RUp2ocUTfKmTHLlWGnZMU9VuMvFnXFGgaILWWZ5It9
   w==;
X-CSE-ConnectionGUID: 42UCPz8MQyuAhRBszMYeGA==
X-CSE-MsgGUID: KlKShO4zRguOD1c334ojkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="90974442"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="90974442"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 20:25:04 -0800
X-CSE-ConnectionGUID: oCfUfEEKSaKsNZJv5veydg==
X-CSE-MsgGUID: x+qmJgg0RdORwC18H8acrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="204740412"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Dec 2025 20:25:02 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXtwr-000000001SC-1ezS;
	Tue, 23 Dec 2025 04:24:42 +0000
Date: Tue, 23 Dec 2025 12:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: Nishanth Menon <nm@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:ti/fixes] BUILD SUCCESS
 cf5e8adebe77917a4cc95e43e461cdbd857591ce
Message-ID: <202512231228.39XCot5A-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_202506_723349_B88C1F8B 
X-CRM114-Status: UNSURE (   5.01  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git ti/fixes
branch HEAD: cf5e8adebe77917a4cc95e43e461cdbd857591ce  arm64: dts: ti: k3-am62-lp-sk-nand: Rename pinctrls to fix schema warnings

elapsed time: 1091m

configs tested: 145
configs skipped: 25

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251223    gcc-8.5.0
arc                   randconfig-002-20251223    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.1.0
arm                   randconfig-001-20251223    gcc-8.5.0
arm                   randconfig-002-20251223    gcc-8.5.0
arm                   randconfig-003-20251223    gcc-8.5.0
arm                   randconfig-004-20251223    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251223    gcc-15.1.0
arm64                 randconfig-002-20251223    gcc-15.1.0
arm64                 randconfig-003-20251223    gcc-15.1.0
arm64                 randconfig-004-20251223    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251223    gcc-15.1.0
csky                  randconfig-002-20251223    gcc-15.1.0
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251223    gcc-15.1.0
hexagon               randconfig-002-20251223    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251223    gcc-14
i386        buildonly-randconfig-002-20251223    gcc-14
i386        buildonly-randconfig-003-20251223    gcc-14
i386        buildonly-randconfig-004-20251223    gcc-14
i386        buildonly-randconfig-005-20251223    gcc-14
i386        buildonly-randconfig-006-20251223    gcc-14
i386                                defconfig    gcc-15.1.0
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251223    gcc-15.1.0
loongarch             randconfig-002-20251223    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                         10m50_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251223    gcc-15.1.0
nios2                 randconfig-002-20251223    gcc-15.1.0
openrisc                         allmodconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251223    clang-22
parisc                randconfig-002-20251223    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                    amigaone_defconfig    clang-22
powerpc                     mpc512x_defconfig    clang-22
powerpc                  mpc866_ads_defconfig    clang-22
powerpc               randconfig-001-20251223    clang-22
powerpc               randconfig-002-20251223    clang-22
powerpc                     tqm8548_defconfig    clang-22
powerpc64             randconfig-001-20251223    clang-22
powerpc64             randconfig-002-20251223    clang-22
riscv                            allmodconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251223    gcc-14.3.0
riscv                 randconfig-002-20251223    gcc-14.3.0
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251223    gcc-14.3.0
s390                  randconfig-002-20251223    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251223    gcc-14.3.0
sh                    randconfig-002-20251223    gcc-14.3.0
sh                   secureedge5410_defconfig    clang-22
sh                             sh03_defconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251223    clang-22
sparc                 randconfig-002-20251223    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251223    clang-22
sparc64               randconfig-002-20251223    clang-22
um                               allmodconfig    clang-19
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251223    clang-22
um                    randconfig-002-20251223    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251223    clang-20
x86_64      buildonly-randconfig-002-20251223    clang-20
x86_64      buildonly-randconfig-003-20251223    clang-20
x86_64      buildonly-randconfig-004-20251223    clang-20
x86_64      buildonly-randconfig-005-20251223    clang-20
x86_64      buildonly-randconfig-006-20251223    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20251223    gcc-14
x86_64                randconfig-072-20251223    gcc-14
x86_64                randconfig-073-20251223    gcc-14
x86_64                randconfig-074-20251223    gcc-14
x86_64                randconfig-075-20251223    gcc-14
x86_64                randconfig-076-20251223    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251223    clang-22
xtensa                randconfig-002-20251223    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

