Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8CBCD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 15:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Eu1MY9ThiflDbAsrd25Y2w2lb1JYhs4VKGEDHpwBAmI=; b=nSZbtTo67Q9RR4TW0LWox8lskD
	2MoFEfaNtrhGp9oQ6uMVMJOX4A0MYN8qsr7T4vFRFuJHt6Rdcu7h4aocXTipsFLyEIwhp0TcKqGj6
	3z+UKkiyEeSTKM/x/6m3yL7dQx9HJsFTq+QKjk9fDYphV7pa3oMkc/i34MHrNszQWe6K9UQnJ4mn6
	Tuytmt85xTViBqo0+KWX9QFfBh5lejrGq00/PCzl4BwgRrTvspcW4GM9E9Ko9xbMtZPMEZd7ns3xg
	MNlbEsb97eqae7ysfy7HBV4NaE8KUu5Teuny+w5/thhapRjdOy+mCNLQrPxaG6z38mHn9P5lbNMvD
	mLhZ3UJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVsqM-00000001gRV-1lFC;
	Sat, 06 Jun 2026 15:21:50 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVsqK-00000001gR8-1GlD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 15:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780759308; x=1812295308;
  h=date:from:to:cc:subject:message-id;
  bh=4ViJJEgdsPeZXg5PLYBxJlsdSAjprD82MuBv/ewYwKg=;
  b=ROaweL1D8EvKhkWNWMD86m1F/gOmikwxM3hY0H5z3UL3IiePwvSgqgfX
   NJAmS+B3Z1QV47bMQlTE97UgexU1iFnKWmorKXN/QenlmJad0vwTlLsmr
   4T7PCpsbndhRmO9ZQ4nk5XcExo44MvyUnyQ/euuWio853AFz/my40Pg20
   7RcPqZJFnD2b0CBS9hRX/MJhSP5WVpxOTmc0DpZRqz7FMpd794NxS0OaZ
   hamlrEPFu2v3IXF7GxAL/WMJ4vfj1WWTK9OKjf1iiA8p7ImMDUpSBj5Ym
   rfmUkiPQLl2Ylh6EAXuO7TPjX2q4gAdLf6Bmkp9iga7SEyc4P4cVJWokt
   A==;
X-CSE-ConnectionGUID: a50r/+dWSByE04Sed9TIVA==
X-CSE-MsgGUID: fPB3jhpDRxGLCng0DqKZgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="107002719"
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="107002719"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 08:21:45 -0700
X-CSE-ConnectionGUID: o1Pq6BWYSlOM6Xw8j77xVw==
X-CSE-MsgGUID: JJg3wIUPQIScEoCw+dlJTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="249433650"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Jun 2026 08:21:44 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVsqC-00000000H62-1hij;
	Sat, 06 Jun 2026 15:21:40 +0000
Date: Sat, 06 Jun 2026 23:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 fb3fcb406b8882a91d1e51bae97101802fc991e1
Message-ID: <202606062333.yjm67nqL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_082148_395025_5985C827 
X-CRM114-Status: UNSURE (   5.10  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
branch HEAD: fb3fcb406b8882a91d1e51bae97101802fc991e1  soc: document merges

elapsed time: 2514m

configs tested: 281
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-17
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260605    gcc-8.5.0
arc                   randconfig-001-20260606    clang-23
arc                   randconfig-002-20260605    gcc-8.5.0
arc                   randconfig-002-20260606    clang-23
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-17
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260605    gcc-10.5.0
arm                   randconfig-001-20260606    clang-23
arm                   randconfig-002-20260605    gcc-13.4.0
arm                   randconfig-002-20260606    clang-23
arm                   randconfig-003-20260605    clang-23
arm                   randconfig-003-20260606    clang-23
arm                   randconfig-004-20260605    gcc-8.5.0
arm                   randconfig-004-20260606    clang-23
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-8.5.0
arm64                 randconfig-001-20260605    gcc-9.5.0
arm64                          randconfig-002    gcc-14.3.0
arm64                 randconfig-002-20260605    gcc-10.5.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260605    gcc-11.5.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260605    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-10.5.0
csky                  randconfig-001-20260605    gcc-16.1.0
csky                           randconfig-002    gcc-10.5.0
csky                  randconfig-002-20260605    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260605    clang-20
hexagon               randconfig-001-20260606    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260605    clang-23
hexagon               randconfig-002-20260606    gcc-11.5.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260605    clang-20
i386        buildonly-randconfig-001-20260606    gcc-13
i386                 buildonly-randconfig-002    clang-20
i386        buildonly-randconfig-002-20260605    clang-20
i386        buildonly-randconfig-002-20260606    gcc-13
i386                 buildonly-randconfig-003    clang-20
i386        buildonly-randconfig-003-20260605    clang-20
i386        buildonly-randconfig-003-20260606    gcc-13
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260605    clang-20
i386        buildonly-randconfig-004-20260606    gcc-13
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260605    gcc-12
i386        buildonly-randconfig-005-20260606    gcc-13
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260605    gcc-14
i386        buildonly-randconfig-006-20260606    gcc-13
i386                                defconfig    clang-22
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260605    clang-22
i386                  randconfig-001-20260606    clang-20
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260605    clang-22
i386                  randconfig-002-20260606    clang-20
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260605    gcc-14
i386                  randconfig-003-20260606    clang-20
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260605    gcc-14
i386                  randconfig-004-20260606    clang-20
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260605    clang-22
i386                  randconfig-005-20260606    clang-20
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260605    gcc-14
i386                  randconfig-006-20260606    clang-20
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260605    clang-22
i386                  randconfig-007-20260606    clang-20
i386                  randconfig-011-20260605    clang-22
i386                  randconfig-012-20260605    clang-22
i386                  randconfig-013-20260605    clang-22
i386                  randconfig-014-20260605    clang-22
i386                  randconfig-015-20260605    clang-22
i386                  randconfig-016-20260605    clang-22
i386                  randconfig-017-20260605    clang-22
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260605    clang-18
loongarch             randconfig-001-20260606    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260605    gcc-16.1.0
loongarch             randconfig-002-20260606    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-17
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-23
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-23
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      malta_kvm_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-17
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                               defconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260605    gcc-8.5.0
nios2                 randconfig-001-20260606    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260605    gcc-11.5.0
nios2                 randconfig-002-20260606    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-17
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-17
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260605    gcc-8.5.0
parisc                randconfig-001-20260606    gcc-8.5.0
parisc                randconfig-002-20260605    gcc-11.5.0
parisc                randconfig-002-20260606    gcc-8.5.0
parisc64                            defconfig    clang-23
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-17
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260605    gcc-8.5.0
powerpc               randconfig-001-20260606    gcc-8.5.0
powerpc               randconfig-002-20260605    gcc-9.5.0
powerpc               randconfig-002-20260606    gcc-8.5.0
powerpc                     tqm8560_defconfig    gcc-16.1.0
powerpc64             randconfig-001-20260605    clang-23
powerpc64             randconfig-001-20260606    gcc-8.5.0
powerpc64             randconfig-002-20260605    gcc-13.4.0
powerpc64             randconfig-002-20260606    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-17
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    clang-17
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-8.5.0
riscv                 randconfig-001-20260605    gcc-8.5.0
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260605    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-18
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-11.5.0
s390                  randconfig-001-20260605    clang-23
s390                           randconfig-002    clang-23
s390                  randconfig-002-20260605    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-17
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                             randconfig-001    gcc-16.1.0
sh                    randconfig-001-20260605    gcc-16.1.0
sh                             randconfig-002    gcc-14.3.0
sh                    randconfig-002-20260605    gcc-10.5.0
sparc                             allnoconfig    clang-17
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260605    gcc-8.5.0
sparc                 randconfig-002-20260605    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260605    clang-23
sparc64               randconfig-002-20260605    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260605    clang-23
um                    randconfig-002-20260605    clang-22
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-17
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260605    gcc-14
x86_64      buildonly-randconfig-001-20260606    gcc-14
x86_64      buildonly-randconfig-002-20260605    gcc-14
x86_64      buildonly-randconfig-002-20260606    gcc-14
x86_64      buildonly-randconfig-003-20260605    gcc-14
x86_64      buildonly-randconfig-003-20260606    gcc-14
x86_64      buildonly-randconfig-004-20260605    gcc-14
x86_64      buildonly-randconfig-004-20260606    gcc-14
x86_64      buildonly-randconfig-005-20260605    gcc-14
x86_64      buildonly-randconfig-005-20260606    gcc-14
x86_64      buildonly-randconfig-006-20260605    gcc-14
x86_64      buildonly-randconfig-006-20260606    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260605    clang-22
x86_64                randconfig-001-20260606    gcc-14
x86_64                randconfig-002-20260605    clang-22
x86_64                randconfig-002-20260606    gcc-14
x86_64                randconfig-003-20260605    clang-22
x86_64                randconfig-003-20260606    gcc-14
x86_64                randconfig-004-20260605    gcc-13
x86_64                randconfig-004-20260606    gcc-14
x86_64                randconfig-005-20260605    clang-22
x86_64                randconfig-005-20260606    gcc-14
x86_64                randconfig-006-20260605    gcc-14
x86_64                randconfig-006-20260606    gcc-14
x86_64                randconfig-011-20260605    clang-22
x86_64                randconfig-011-20260606    gcc-14
x86_64                randconfig-012-20260605    gcc-14
x86_64                randconfig-012-20260606    gcc-14
x86_64                randconfig-013-20260605    clang-22
x86_64                randconfig-013-20260606    gcc-14
x86_64                randconfig-014-20260605    clang-22
x86_64                randconfig-014-20260606    gcc-14
x86_64                randconfig-015-20260605    gcc-14
x86_64                randconfig-015-20260606    gcc-14
x86_64                randconfig-016-20260605    clang-22
x86_64                randconfig-016-20260606    gcc-14
x86_64                randconfig-071-20260605    gcc-14
x86_64                randconfig-072-20260605    gcc-14
x86_64                randconfig-073-20260605    clang-22
x86_64                randconfig-074-20260605    gcc-14
x86_64                randconfig-075-20260605    gcc-12
x86_64                randconfig-076-20260605    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-17
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260605    gcc-12.5.0
xtensa                randconfig-002-20260605    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

