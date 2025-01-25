Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D6AC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 07:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mlc/7CuHosmAHaNFGQO7e424NJ2JcxIG5lxHjbxj34w=; b=NKgBHpml3LB1BErf39mxPbBcMr
	UP3WCVv3HDKf7gD8Wjy97EaLkx3VozLe7Qber6+A23ot8Lif2i1cpEsfclRqY4WsT4e63ntog2ClD
	VvCSQAKg6O7gOC/u+KuH4iLIsD5aSgtu85wP7w+M/wfXdcMsvLlGT8b9tTeJcOgIuhUcAaMcGlHyw
	+hk792GmwAWV8nCciKHiMKb7GjWt61pvuNH+FsFn4Dqs/2NE0T+jvI4JDBOxX6ilk5a7qZUe5XuZN
	mzk7IbqQpDtDi+FWjv2WHVHOKYNbgEqkkHMqJGHE3QmgO5w3stdJGo9gVrabpu5Zmh/AmiTc5355k
	BaMkIqTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbaEp-0000000GBjl-1uhn;
	Sat, 25 Jan 2025 07:05:51 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbaDW-0000000GBdk-40Bw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 07:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737788671; x=1769324671;
  h=date:from:to:cc:subject:message-id;
  bh=UQEhP0Hpd2F08qYS2gVORW0/3sW23TzKewMFvd4nbDQ=;
  b=BglmDYQa2sbVwJbv1n7RXo8TMjWE1Emzf0kBk/rh3up6UbNaMcZZiEsH
   p3c6IKq/DOlV1fSwZEmpdPZYfqYYOMDD+j5qQfXKgOUV1EOPXHe0tSHhV
   GvYBUFTAPQf/mvY2wXvXuDllOYEPlNpXsn/1manEs7nWCuG/h4eAljpHo
   EDClb/L0PT+byD7T9B8ciJAiViFajZhYECVFNWLVB48V2FMuDld9IQNNG
   xkQxT8usEfWzmuWWRzfrhWoWzxFPgdAaItxvkKSORDrJDsvMaGkxUJC8o
   K+DUBatZxh2guvdUsq/O9FfKo+2aEZMfxCxjhR5HdYHLvRcpuFu/nAfMV
   Q==;
X-CSE-ConnectionGUID: R3mRFJBYTM+mX4uuehC9/A==
X-CSE-MsgGUID: rnuIqiPFTa+6sqYc2XUy+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="63679884"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="63679884"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 23:04:27 -0800
X-CSE-ConnectionGUID: ZrYYIL8CQOW6gHcC0PowIw==
X-CSE-MsgGUID: EBj0IhCTR2i7OlX6T4YvsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145197304"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Jan 2025 23:04:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbaDP-000daN-3B;
	Sat, 25 Jan 2025 07:04:23 +0000
Date: Sat, 25 Jan 2025 15:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 3c9690f76d66f45f727e00c838faba9a3ef4e295
Message-ID: <202501251546.zA1h6Jma-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_230431_014609_4EAE86A6 
X-CRM114-Status: UNSURE (   5.47  )
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
branch HEAD: 3c9690f76d66f45f727e00c838faba9a3ef4e295  Merge tag 'aspeed-6.14-devicetree' of https://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into soc/dt

elapsed time: 1109m

configs tested: 129
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                        nsim_700_defconfig    gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-13.2.0
arc                   randconfig-001-20250124    gcc-13.2.0
arc                   randconfig-002-20250124    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-20
arm                   randconfig-001-20250124    clang-17
arm                   randconfig-002-20250124    gcc-14.2.0
arm                   randconfig-003-20250124    gcc-14.2.0
arm                   randconfig-004-20250124    clang-19
arm                          sp7021_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250124    clang-20
arm64                 randconfig-002-20250124    clang-20
arm64                 randconfig-003-20250124    clang-19
arm64                 randconfig-004-20250124    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250124    gcc-14.2.0
csky                  randconfig-002-20250124    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250124    clang-20
hexagon               randconfig-002-20250124    clang-14
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250124    clang-19
i386        buildonly-randconfig-002-20250124    clang-19
i386        buildonly-randconfig-003-20250124    gcc-12
i386        buildonly-randconfig-004-20250124    gcc-12
i386        buildonly-randconfig-005-20250124    gcc-12
i386        buildonly-randconfig-006-20250124    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250124    gcc-14.2.0
loongarch             randconfig-002-20250124    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250124    gcc-14.2.0
nios2                 randconfig-002-20250124    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250124    gcc-14.2.0
parisc                randconfig-002-20250124    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                 mpc8315_rdb_defconfig    clang-20
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250124    gcc-14.2.0
powerpc               randconfig-002-20250124    gcc-14.2.0
powerpc               randconfig-003-20250124    clang-20
powerpc                      tqm8xx_defconfig    clang-20
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250124    gcc-14.2.0
powerpc64             randconfig-002-20250124    clang-20
powerpc64             randconfig-003-20250124    clang-19
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250124    clang-19
riscv                 randconfig-002-20250124    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250124    gcc-14.2.0
s390                  randconfig-002-20250124    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250124    gcc-14.2.0
sh                    randconfig-002-20250124    gcc-14.2.0
sh                           se7751_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250124    gcc-14.2.0
sparc                 randconfig-002-20250124    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250124    gcc-14.2.0
sparc64               randconfig-002-20250124    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250124    gcc-12
um                    randconfig-002-20250124    clang-20
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250124    gcc-12
x86_64      buildonly-randconfig-002-20250124    gcc-12
x86_64      buildonly-randconfig-003-20250124    clang-19
x86_64      buildonly-randconfig-004-20250124    clang-19
x86_64      buildonly-randconfig-005-20250124    clang-19
x86_64      buildonly-randconfig-006-20250124    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  nommu_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250124    gcc-14.2.0
xtensa                randconfig-002-20250124    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

