Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC49D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 23:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KfHHyw/9ZX+MViXoTm+sduFqkq7ZHNecm298cRFCh2o=; b=oZxY+q+ZqdXTTItmQ4nQCaj3JU
	D9k73V6qzmHe9CawdS4V1dA6J8edFhS6mLYXV8bmSLxlZwpft6/JT92g/R+aNOQtDSWe7vYSiOMg1
	gli1BoNVO2VVMuooVSvmnHyaX2fAxz2nCZfhbff5MxwhLv3b77gIhTbIH1VLnVSiyYnbN/Ywyo10q
	jH0E643Kz4M1YRhwjINuIvqA9rHr7PGbmZlCgG+VcQZ+c8OVgIK3XpFKeGCj0C79kk+5z+AEldDzn
	688zPa3EGM/Ww9/ZZN7fpU5QPOTrJQeuUqFd0Himzz+Z8CXquPJm26o/2XQ6U2LzogwTOxzE9JLDc
	dYHv+Kag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP7mc-000000012me-0Vuv;
	Fri, 28 Nov 2025 23:21:46 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP7mY-000000012mE-2PAM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 23:21:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764372102; x=1795908102;
  h=date:from:to:cc:subject:message-id;
  bh=hsmqWc6c1Z9AOze9I0BrYqSZ8kylAGnLyd1+aIIGDFw=;
  b=md2N5RhruL3li9IIy9i3oCc9tgTUea+6aL7PmelF2UFCnPSAcH7GwRn8
   T9UG8lZ7f3oSdPOu7P7jqrTOzwq3tXzquT63GNPDSxERo4N/qd/TnZzeC
   EL24DomV23xIATQSV4lIbZBJCaZ1FJ3OCFfxxv0Emd//dgQwQ1G9IUHjX
   9VwOp6QLoQI46Yn1xAmGtVrRH2+4VFL7m+/yonK2oos+p9qd7aIcv6Ms5
   /ENwip1qG0tO3Pb5sGDPyYkmAItxu00l4QHIXRk2Y4PSTyMjhnm0KyQjK
   xEIThGFcfjJt4vTCIJqEbEKDYjvFIHbvdf9XukD5+OJGlXhEhM7aYpv1F
   A==;
X-CSE-ConnectionGUID: jhZavPFRSeqxOhQ3QghLlw==
X-CSE-MsgGUID: hYWIs3AhRzyB20Q8CNgRTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66286026"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="66286026"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 15:21:42 -0800
X-CSE-ConnectionGUID: 2HN2YBV6ROyHikAw+79XzQ==
X-CSE-MsgGUID: l63VFCSVTfiwTR+yiXY2Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="198662518"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Nov 2025 15:21:39 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP7mU-000000006oT-0mVT;
	Fri, 28 Nov 2025 23:21:38 +0000
Date: Sat, 29 Nov 2025 07:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:drivers/reset-gpio] BUILD SUCCESS
 5fc4e4cf7a2268b5f73700fd1e8d02159f2417d8
Message-ID: <202511290744.HvNt0pMQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_152142_678735_29302C3D 
X-CRM114-Status: UNSURE (   5.33  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git drivers/reset-gpio
branch HEAD: 5fc4e4cf7a2268b5f73700fd1e8d02159f2417d8  reset: gpio: use software nodes to setup the GPIO lookup

elapsed time: 1457m

configs tested: 205
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251128    gcc-8.5.0
arc                   randconfig-002-20251128    gcc-15.1.0
arc                   randconfig-002-20251128    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.1.0
arm                   randconfig-001-20251128    gcc-14.3.0
arm                   randconfig-001-20251128    gcc-8.5.0
arm                   randconfig-002-20251128    gcc-8.5.0
arm                   randconfig-003-20251128    clang-22
arm                   randconfig-003-20251128    gcc-8.5.0
arm                   randconfig-004-20251128    clang-17
arm                   randconfig-004-20251128    gcc-8.5.0
arm64                            allmodconfig    clang-16
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251128    gcc-15.1.0
arm64                 randconfig-002-20251128    gcc-15.1.0
arm64                 randconfig-003-20251128    gcc-15.1.0
arm64                 randconfig-004-20251128    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251128    gcc-15.1.0
csky                  randconfig-002-20251128    gcc-15.1.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251128    clang-22
hexagon               randconfig-002-20251128    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251128    gcc-13
i386        buildonly-randconfig-002-20251128    gcc-13
i386        buildonly-randconfig-003-20251128    gcc-13
i386        buildonly-randconfig-004-20251128    gcc-13
i386        buildonly-randconfig-005-20251128    gcc-13
i386        buildonly-randconfig-006-20251128    gcc-13
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251128    gcc-14
i386                  randconfig-002-20251128    gcc-14
i386                  randconfig-003-20251128    gcc-14
i386                  randconfig-004-20251128    gcc-14
i386                  randconfig-005-20251128    gcc-14
i386                  randconfig-006-20251128    gcc-14
i386                  randconfig-007-20251128    gcc-14
i386                  randconfig-011-20251128    gcc-14
i386                  randconfig-012-20251128    gcc-14
i386                  randconfig-013-20251128    gcc-14
i386                  randconfig-014-20251128    gcc-14
i386                  randconfig-015-20251128    gcc-14
i386                  randconfig-016-20251128    gcc-14
i386                  randconfig-017-20251128    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251128    clang-22
loongarch             randconfig-002-20251128    clang-22
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
m68k                        m5272c3_defconfig    gcc-15.1.0
m68k                        stmark2_defconfig    gcc-15.1.0
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                malta_qemu_32r6_defconfig    gcc-15.1.0
mips                  maltasmvp_eva_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251128    clang-22
nios2                 randconfig-002-20251128    clang-22
openrisc                         alldefconfig    gcc-15.1.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251128    gcc-14.3.0
parisc                randconfig-001-20251129    clang-22
parisc                randconfig-002-20251128    gcc-15.1.0
parisc                randconfig-002-20251129    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc                          g5_defconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-15.1.0
powerpc                 mpc8315_rdb_defconfig    gcc-15.1.0
powerpc                 mpc837x_rdb_defconfig    gcc-15.1.0
powerpc                     ppa8548_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251128    gcc-11.5.0
powerpc               randconfig-001-20251129    clang-22
powerpc               randconfig-002-20251128    clang-22
powerpc               randconfig-002-20251129    clang-22
powerpc64             randconfig-001-20251128    clang-22
powerpc64             randconfig-001-20251129    clang-22
powerpc64             randconfig-002-20251128    gcc-8.5.0
powerpc64             randconfig-002-20251129    clang-22
riscv                            allmodconfig    clang-16
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251128    gcc-15.1.0
riscv                 randconfig-002-20251128    gcc-15.1.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251128    gcc-15.1.0
s390                  randconfig-002-20251128    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                            hp6xx_defconfig    gcc-15.1.0
sh                    randconfig-001-20251128    gcc-15.1.0
sh                    randconfig-002-20251128    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251128    clang-22
sparc                 randconfig-002-20251128    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251128    clang-22
sparc64               randconfig-002-20251128    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251128    clang-22
um                    randconfig-002-20251128    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           alldefconfig    gcc-15.1.0
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251128    clang-20
x86_64      buildonly-randconfig-002-20251128    clang-20
x86_64      buildonly-randconfig-003-20251128    clang-20
x86_64      buildonly-randconfig-004-20251128    clang-20
x86_64      buildonly-randconfig-005-20251128    clang-20
x86_64      buildonly-randconfig-006-20251128    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251128    gcc-14
x86_64                randconfig-002-20251128    gcc-14
x86_64                randconfig-003-20251128    gcc-14
x86_64                randconfig-004-20251128    gcc-14
x86_64                randconfig-005-20251128    gcc-14
x86_64                randconfig-006-20251128    gcc-14
x86_64                randconfig-011-20251128    gcc-13
x86_64                randconfig-012-20251128    gcc-13
x86_64                randconfig-013-20251128    gcc-13
x86_64                randconfig-014-20251128    gcc-13
x86_64                randconfig-015-20251128    gcc-13
x86_64                randconfig-016-20251128    gcc-13
x86_64                randconfig-071-20251128    gcc-14
x86_64                randconfig-072-20251128    gcc-14
x86_64                randconfig-073-20251128    gcc-14
x86_64                randconfig-074-20251128    gcc-14
x86_64                randconfig-075-20251128    gcc-14
x86_64                randconfig-076-20251128    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251128    clang-22
xtensa                randconfig-002-20251128    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

