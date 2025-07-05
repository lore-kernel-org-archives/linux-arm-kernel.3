Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FEBC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 02:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G8dof/16bBT49vKoNWB8JbZ/SZmKzCj4xhkXFffZPcU=; b=pB5fB7Fk8y0PV51yoN2H+I8Ue4
	oV7OVx7eOIZ8PIwP5ekQdXwjN7ZkWgsCXyU1EwXS6r5BqR2uNq/T8Y5NPQWDdCLHms8BceeD0abvP
	mipJH+fZbPGfi3/GM2Cn+yvKz2Inh67U4MbWQV+dY1MZnDwTrW5d6kY8iAjt7gsKtu8OrmBxbpjBX
	617ykPhATa87TF7kQQLSa+egVK86E/4for0kcANWaydLFP+aFFJgcmDqJ8gpz1qtBGP5ODQDO5O70
	lX2bIh89Lzy0qmdrPHuB//U76xORm2kgw8R6rdFPHHm6TtmMcwnnGfKJiVBEZ33N9wGdQsi48WOPV
	gEBbhVFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXsdt-0000000Ftef-36SC;
	Sat, 05 Jul 2025 02:28:41 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXrUf-0000000Flv3-1vCM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 01:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751678105; x=1783214105;
  h=date:from:to:cc:subject:message-id;
  bh=c3HkO8U2MHe3oT33dYowMi8gsC+MBALZ71227OLjDBg=;
  b=WVdhxJO2AF0p4BDPE5U0J4MoXtEMIshCAdDGQz5c0zmzVLAsm8MxAYNG
   kP/6msxuk+2AX22NyBk4gp3UbR7LLI4WFKRKrSFdJA9R19FjVTn2/T0e4
   cxZUskH8xeZCR3l6te09aKDCLVs2cpaGcI4qSWEQZGTwolXTsmXNPyIid
   cSOotgFuCwF8lqE7eUQUVJFbm5wYKjC52TxCwegE6RTO0W5zYtIgvsze2
   T0rcZf0M6JPcnfz09Lz4D2Ykixlic3hKi2lVDl22Nk3jlGsbXuOkoAV0x
   zlcYoPmIQvhiM3Xm+epcfrRPukXpLcg/Z6uQLHh1zyn3tIhycbA8xgZA9
   Q==;
X-CSE-ConnectionGUID: 8qCBrKyKR7CVByFJ2EHGpg==
X-CSE-MsgGUID: 3f2eMevrQTu1LMJPlQXxvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53872393"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="53872393"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 18:15:02 -0700
X-CSE-ConnectionGUID: /PjBGXCkT6mzq0wkBPOlKw==
X-CSE-MsgGUID: 8hs36bv0SFiU67uf72WD0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="154829717"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jul 2025 18:15:01 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXrUY-0004BF-2O;
	Sat, 05 Jul 2025 01:14:58 +0000
Date: Sat, 05 Jul 2025 09:14:21 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/drivers] BUILD SUCCESS
 5f931b56848017c40b2975d96253ce0a341ef424
Message-ID: <202507050908.lI3OhBC0-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_181505_558283_6BE9E152 
X-CRM114-Status: UNSURE (   5.09  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
branch HEAD: 5f931b56848017c40b2975d96253ce0a341ef424  Merge tag 'renesas-drivers-for-v6.17-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers

elapsed time: 941m

configs tested: 239
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-21
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250704    gcc-8.5.0
arc                   randconfig-001-20250705    clang-21
arc                   randconfig-002-20250704    gcc-15.1.0
arc                   randconfig-002-20250705    clang-21
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                          gemini_defconfig    gcc-15.1.0
arm                          pxa168_defconfig    gcc-15.1.0
arm                   randconfig-001-20250704    gcc-8.5.0
arm                   randconfig-001-20250705    clang-21
arm                   randconfig-002-20250704    clang-21
arm                   randconfig-002-20250705    clang-21
arm                   randconfig-003-20250704    gcc-8.5.0
arm                   randconfig-003-20250705    clang-21
arm                   randconfig-004-20250704    gcc-13.4.0
arm                   randconfig-004-20250705    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250704    gcc-14.3.0
arm64                 randconfig-001-20250705    clang-21
arm64                 randconfig-002-20250704    clang-21
arm64                 randconfig-002-20250705    clang-21
arm64                 randconfig-003-20250704    clang-16
arm64                 randconfig-003-20250705    clang-21
arm64                 randconfig-004-20250704    gcc-10.5.0
arm64                 randconfig-004-20250705    clang-21
csky                              allnoconfig    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250704    gcc-15.1.0
csky                  randconfig-001-20250705    gcc-9.3.0
csky                  randconfig-002-20250704    gcc-15.1.0
csky                  randconfig-002-20250705    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250704    clang-21
hexagon               randconfig-001-20250705    gcc-9.3.0
hexagon               randconfig-002-20250704    clang-21
hexagon               randconfig-002-20250705    gcc-9.3.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250704    gcc-12
i386        buildonly-randconfig-001-20250705    gcc-12
i386        buildonly-randconfig-002-20250704    clang-20
i386        buildonly-randconfig-002-20250705    gcc-12
i386        buildonly-randconfig-003-20250704    clang-20
i386        buildonly-randconfig-003-20250705    gcc-12
i386        buildonly-randconfig-004-20250704    clang-20
i386        buildonly-randconfig-004-20250705    gcc-12
i386        buildonly-randconfig-005-20250704    clang-20
i386        buildonly-randconfig-005-20250705    gcc-12
i386        buildonly-randconfig-006-20250704    clang-20
i386        buildonly-randconfig-006-20250705    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250705    gcc-12
i386                  randconfig-002-20250705    gcc-12
i386                  randconfig-003-20250705    gcc-12
i386                  randconfig-004-20250705    gcc-12
i386                  randconfig-005-20250705    gcc-12
i386                  randconfig-006-20250705    gcc-12
i386                  randconfig-007-20250705    gcc-12
i386                  randconfig-011-20250705    clang-20
i386                  randconfig-012-20250705    clang-20
i386                  randconfig-013-20250705    clang-20
i386                  randconfig-014-20250705    clang-20
i386                  randconfig-015-20250705    clang-20
i386                  randconfig-016-20250705    clang-20
i386                  randconfig-017-20250705    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250704    gcc-15.1.0
loongarch             randconfig-001-20250705    gcc-9.3.0
loongarch             randconfig-002-20250704    gcc-15.1.0
loongarch             randconfig-002-20250705    gcc-9.3.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         rt305x_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250704    gcc-8.5.0
nios2                 randconfig-001-20250705    gcc-9.3.0
nios2                 randconfig-002-20250704    gcc-10.5.0
nios2                 randconfig-002-20250705    gcc-9.3.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250704    gcc-14.3.0
parisc                randconfig-001-20250705    gcc-9.3.0
parisc                randconfig-002-20250704    gcc-8.5.0
parisc                randconfig-002-20250705    gcc-9.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                       ebony_defconfig    gcc-15.1.0
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250704    clang-21
powerpc               randconfig-001-20250705    gcc-9.3.0
powerpc               randconfig-002-20250704    gcc-9.3.0
powerpc               randconfig-002-20250705    gcc-9.3.0
powerpc               randconfig-003-20250704    clang-21
powerpc               randconfig-003-20250705    gcc-9.3.0
powerpc64             randconfig-001-20250704    clang-18
powerpc64             randconfig-001-20250705    gcc-9.3.0
powerpc64             randconfig-002-20250704    gcc-10.5.0
powerpc64             randconfig-002-20250705    gcc-9.3.0
powerpc64             randconfig-003-20250704    clang-18
powerpc64             randconfig-003-20250705    gcc-9.3.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250704    clang-21
riscv                 randconfig-001-20250705    gcc-12
riscv                 randconfig-002-20250704    clang-21
riscv                 randconfig-002-20250705    gcc-12
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250704    gcc-15.1.0
s390                  randconfig-001-20250705    gcc-12
s390                  randconfig-002-20250704    gcc-8.5.0
s390                  randconfig-002-20250705    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250704    gcc-15.1.0
sh                    randconfig-001-20250705    gcc-12
sh                    randconfig-002-20250704    gcc-13.4.0
sh                    randconfig-002-20250705    gcc-12
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250704    gcc-11.5.0
sparc                 randconfig-001-20250705    gcc-12
sparc                 randconfig-002-20250704    gcc-8.5.0
sparc                 randconfig-002-20250705    gcc-12
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250704    gcc-13.4.0
sparc64               randconfig-001-20250705    gcc-12
sparc64               randconfig-002-20250704    clang-20
sparc64               randconfig-002-20250705    gcc-12
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250704    clang-21
um                    randconfig-001-20250705    gcc-12
um                    randconfig-002-20250704    clang-21
um                    randconfig-002-20250705    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250704    clang-20
x86_64      buildonly-randconfig-001-20250705    gcc-12
x86_64      buildonly-randconfig-002-20250704    gcc-12
x86_64      buildonly-randconfig-002-20250705    gcc-12
x86_64      buildonly-randconfig-003-20250704    clang-20
x86_64      buildonly-randconfig-003-20250705    gcc-12
x86_64      buildonly-randconfig-004-20250704    clang-20
x86_64      buildonly-randconfig-004-20250705    gcc-12
x86_64      buildonly-randconfig-005-20250704    clang-20
x86_64      buildonly-randconfig-005-20250705    gcc-12
x86_64      buildonly-randconfig-006-20250704    gcc-12
x86_64      buildonly-randconfig-006-20250705    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250705    clang-20
x86_64                randconfig-002-20250705    clang-20
x86_64                randconfig-003-20250705    clang-20
x86_64                randconfig-004-20250705    clang-20
x86_64                randconfig-005-20250705    clang-20
x86_64                randconfig-006-20250705    clang-20
x86_64                randconfig-007-20250705    clang-20
x86_64                randconfig-008-20250705    clang-20
x86_64                randconfig-071-20250705    clang-20
x86_64                randconfig-072-20250705    clang-20
x86_64                randconfig-073-20250705    clang-20
x86_64                randconfig-074-20250705    clang-20
x86_64                randconfig-075-20250705    clang-20
x86_64                randconfig-076-20250705    clang-20
x86_64                randconfig-077-20250705    clang-20
x86_64                randconfig-078-20250705    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250704    gcc-12.4.0
xtensa                randconfig-001-20250705    gcc-12
xtensa                randconfig-002-20250704    gcc-15.1.0
xtensa                randconfig-002-20250705    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

