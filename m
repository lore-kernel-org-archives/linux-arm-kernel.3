Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68142CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 16:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4slDyr7KGiE0XZi52LNTVAi2VJmkRfwRlKup7c0Bk20=; b=beFvBponTUrJExdfDah78E6aER
	skbtT/NFbr5oCT73F6U2Gr+imzV0T02D5xdsaaBdcyziuUXsb/UeC2DXZ1+u9ANVxklkfiUQN5lS0
	y8gk3Y24EiN+IPXmo2kXY+m0yhr7FMarWJSyqJT4qmITGv32GD9WNKDl9YN0DXI6WUchth7X5avK4
	5abZpgAgsiJ45Tm8CuqWIfE9f2YclKSrXBGN+8ivKeNTPvPFyri5TSEyYeOsU6lC+n1HIA7Yy8Vkh
	aVH1OKk2/jGb7FxO7XbmFwxAPhzfpp2ik61T6NC18Mq4dnMjjNeHI5xBFBemBrhw9B0WUa+z6jq7O
	moOtVTTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTXO-00000000rWY-1vT8;
	Tue, 02 Sep 2025 16:07:14 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPui-0000000H9hw-1spe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756815304; x=1788351304;
  h=date:from:to:cc:subject:message-id;
  bh=e2F3ZVHt6Zu7j4Lf/YimEF3074Xtr6ges17IEiu0Z40=;
  b=VTU476Brs2B8q6EZkDRPpfQBSvyNS03CyczEH1ohVnvDp2URbqMVoxQ9
   vjQAbx+iwAv9O+9Js20o5O7EWGiQC7W7BIYQ1iAR5DJ9Xw4bkmpsuY3s4
   /CtedwQuZzZqXMSuPr4QwHcq/YhvpUwx6mDyR8iL0hJykCULVXkQsGSy3
   j2IbEyHmy3RKEO0JD+x3nC2LU6b1f/yJ2DDfmJYLHcnEcHf43qmfD1Tw8
   NjS60UauqCPCjP+GJJrsZYbH7H1EXJ4KkBdqjqoFah97XB7ezQFEUS1ch
   Dx/X47pIUhJvRA3mfe/t6iXx+dMWFP5gNSzreV/s/w6SJ2tZ/yG0O2aLn
   w==;
X-CSE-ConnectionGUID: XRkzoacPTHCf2bdIDhV4RA==
X-CSE-MsgGUID: nFca5c/LS7251K/Vk4lEOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="76686159"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="76686159"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 05:15:02 -0700
X-CSE-ConnectionGUID: Xy1Ty1j+QQqm8Kk0ehoDAA==
X-CSE-MsgGUID: alQNMqb/TT+K5XWLwc+OAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="208455123"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Sep 2025 05:15:00 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utPuI-0001xJ-1t;
	Tue, 02 Sep 2025 12:14:44 +0000
Date: Tue, 02 Sep 2025 20:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 cea9c89d46c62b5fdc719c60bc7b2e3abd8c0153
Message-ID: <202509022045.qKenSjUO-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_051504_500024_70791AF2 
X-CRM114-Status: UNSURE (   5.63  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/dt
branch HEAD: cea9c89d46c62b5fdc719c60bc7b2e3abd8c0153  Merge tag 'sti-dt-for-v6.18-round1' of https://git.kernel.org/pub/scm/linux/kernel/git/pchotard/sti into soc/dt

elapsed time: 1497m

configs tested: 154
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250902    gcc-11.5.0
arc                   randconfig-002-20250902    gcc-9.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20250902    gcc-15.1.0
arm                   randconfig-002-20250902    gcc-8.5.0
arm                   randconfig-003-20250902    clang-22
arm                   randconfig-004-20250902    clang-22
arm                           stm32_defconfig    gcc-15.1.0
arm                    vt8500_v6_v7_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250902    gcc-8.5.0
arm64                 randconfig-002-20250902    clang-22
arm64                 randconfig-003-20250902    gcc-12.5.0
arm64                 randconfig-004-20250902    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250902    gcc-14.3.0
csky                  randconfig-002-20250902    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250902    clang-18
hexagon               randconfig-002-20250902    clang-22
i386                             alldefconfig    gcc-12
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250902    clang-20
i386        buildonly-randconfig-002-20250902    clang-20
i386        buildonly-randconfig-003-20250902    gcc-12
i386        buildonly-randconfig-004-20250902    clang-20
i386        buildonly-randconfig-005-20250902    gcc-12
i386        buildonly-randconfig-006-20250902    clang-20
i386                                defconfig    clang-20
i386                  randconfig-011-20250902    gcc-12
i386                  randconfig-012-20250902    gcc-12
i386                  randconfig-013-20250902    gcc-12
i386                  randconfig-014-20250902    gcc-12
i386                  randconfig-015-20250902    gcc-12
i386                  randconfig-016-20250902    gcc-12
i386                  randconfig-017-20250902    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250902    clang-22
loongarch             randconfig-002-20250902    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
m68k                        mvme147_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    gcc-15.1.0
mips                         db1xxx_defconfig    clang-22
mips                      maltaaprp_defconfig    clang-22
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250902    gcc-9.5.0
nios2                 randconfig-002-20250902    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250902    gcc-8.5.0
parisc                randconfig-002-20250902    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250902    gcc-9.5.0
powerpc               randconfig-002-20250902    gcc-8.5.0
powerpc               randconfig-003-20250902    gcc-11.5.0
powerpc                     skiroot_defconfig    clang-22
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250902    gcc-12.5.0
powerpc64             randconfig-002-20250902    clang-22
powerpc64             randconfig-003-20250902    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250902    gcc-13.4.0
riscv                 randconfig-002-20250902    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250902    clang-22
s390                  randconfig-002-20250902    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250902    gcc-12.5.0
sh                    randconfig-002-20250902    gcc-12.5.0
sh                          rsk7269_defconfig    gcc-15.1.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250902    gcc-14.3.0
sparc                 randconfig-002-20250902    gcc-8.5.0
sparc                       sparc32_defconfig    gcc-15.1.0
sparc64               randconfig-001-20250902    clang-20
sparc64               randconfig-002-20250902    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250902    gcc-12
um                    randconfig-002-20250902    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250902    clang-20
x86_64      buildonly-randconfig-002-20250902    clang-20
x86_64      buildonly-randconfig-003-20250902    clang-20
x86_64      buildonly-randconfig-004-20250902    clang-20
x86_64      buildonly-randconfig-004-20250902    gcc-12
x86_64      buildonly-randconfig-005-20250902    clang-20
x86_64      buildonly-randconfig-005-20250902    gcc-12
x86_64      buildonly-randconfig-006-20250902    clang-20
x86_64      buildonly-randconfig-006-20250902    gcc-12
x86_64                              defconfig    gcc-11
x86_64                randconfig-001-20250902    clang-20
x86_64                randconfig-002-20250902    clang-20
x86_64                randconfig-003-20250902    clang-20
x86_64                randconfig-004-20250902    clang-20
x86_64                randconfig-005-20250902    clang-20
x86_64                randconfig-006-20250902    clang-20
x86_64                randconfig-007-20250902    clang-20
x86_64                randconfig-008-20250902    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250902    gcc-9.5.0
xtensa                randconfig-002-20250902    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

