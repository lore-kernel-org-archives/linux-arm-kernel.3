Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91150F3ED42
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 10:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=epd4iytnIGyxOlqFSKCuRuhrFgMvBf5YrmdM6MyGa8U=; b=bvZ0xyCNq/GezN7TyEOD1M267I
	siUFCgfJY8KYglnVXG1qMdnUF4QzapEGDEzibmXMZOgrumC5wD3ErjOCzB3IuOKi1Dg9vTUNUa1Uj
	8CMmxENENqdpND+ILGgvlIaSliOx2SBNkUEexe2/gbLMr5SQ5ntWRoC9fkPAG2C/W3DBqGFiWapfe
	mL7IxTDihO15YED+Ro9t0z7FZQx7nUfB+vAEMOt64ne7hkZjVsLzEvHSFZv9WnuKvcwed3R0o4qmf
	zwGCUs15L9yXOm/U+BXbj1z5SHLGaid01TuBolQo+qqJj3BnmpxL2pbdi6eLqvAc18E2fm8IkUN3C
	3G5KljUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBVhV-0000000DML2-3QWR;
	Sat, 11 Apr 2026 10:36:29 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBVhS-0000000DMKg-2jAz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 10:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775903787; x=1807439787;
  h=date:from:to:cc:subject:message-id;
  bh=MSwQffNizCjrvycl9YKJxhHBLE4eWHgLs8Z/oRY0qjY=;
  b=R7yv9BIYQm4+NlkYVBPNdFk45Yu1vPoQe1kKr2kLp7iMJ8wBpPzLuB7A
   fAA3DqLmDqKUZZrljSjkgn/cZv8sZDEiFoMnC0TxG40oatoDS73QnU2lg
   KPF/iHsXGdoko6SkQA8XtkSQ4PXo9zk5Yp42rN17wu6YKK1GxrWCJ07MF
   k8gC2CKf4C8ipXZRk1goVgylQEDsnbncyX/yCyGOIIdgkLeKI/m8jvK/T
   3TCAFrXx7bkB1Qli9gXOd9SHPfFo+y9oHPaNpS8VEzFWbVTX/HRNNjQBc
   NnJgTaiutQ3cKfPH+HkbL7jhLxxc7kSPKRw+ym0as6urSNd/uckORaVGQ
   Q==;
X-CSE-ConnectionGUID: rpyWfuW4Q0W0GA6uF9KALg==
X-CSE-MsgGUID: ND6xV0j2Q22M6Me2vQoGTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76785599"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="76785599"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 03:36:23 -0700
X-CSE-ConnectionGUID: 1YXSAKThQlGN344kS6KZZg==
X-CSE-MsgGUID: Swq682HjQYGjbQTRU6dROw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="233721471"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Apr 2026 03:36:21 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBVhK-0000000014u-31Jv;
	Sat, 11 Apr 2026 10:36:18 +0000
Date: Sat, 11 Apr 2026 18:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 249ca93803738427749b611f728601c8da41c2d1
Message-ID: <202604111817.06NIsjVB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_033626_741076_50A0A822 
X-CRM114-Status: UNSURE (   4.85  )
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
branch HEAD: 249ca93803738427749b611f728601c8da41c2d1  soc: document merges

elapsed time: 726m

configs tested: 180
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260411    gcc-12.5.0
arc                   randconfig-002-20260411    gcc-12.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                         nhk8815_defconfig    clang-23
arm                   randconfig-001-20260411    gcc-12.5.0
arm                   randconfig-002-20260411    gcc-12.5.0
arm                   randconfig-003-20260411    gcc-12.5.0
arm                   randconfig-004-20260411    gcc-12.5.0
arm                        shmobile_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260411    clang-23
arm64                 randconfig-002-20260411    clang-23
arm64                 randconfig-003-20260411    clang-23
arm64                 randconfig-004-20260411    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260411    clang-23
csky                  randconfig-002-20260411    clang-23
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260411    gcc-14.3.0
hexagon               randconfig-002-20260411    gcc-14.3.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260411    gcc-14
i386        buildonly-randconfig-002-20260411    gcc-14
i386        buildonly-randconfig-003-20260411    gcc-14
i386        buildonly-randconfig-004-20260411    gcc-14
i386        buildonly-randconfig-005-20260411    gcc-14
i386        buildonly-randconfig-006-20260411    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260411    clang-20
i386                  randconfig-002-20260411    clang-20
i386                  randconfig-003-20260411    clang-20
i386                  randconfig-004-20260411    clang-20
i386                  randconfig-005-20260411    clang-20
i386                  randconfig-006-20260411    clang-20
i386                  randconfig-007-20260411    clang-20
i386                  randconfig-011-20260411    clang-20
i386                  randconfig-012-20260411    clang-20
i386                  randconfig-013-20260411    clang-20
i386                  randconfig-014-20260411    clang-20
i386                  randconfig-015-20260411    clang-20
i386                  randconfig-016-20260411    clang-20
i386                  randconfig-017-20260411    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260411    gcc-14.3.0
loongarch             randconfig-002-20260411    gcc-14.3.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260411    gcc-14.3.0
nios2                 randconfig-002-20260411    gcc-14.3.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260411    gcc-11.5.0
parisc                randconfig-002-20260411    gcc-11.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260411    gcc-11.5.0
powerpc               randconfig-002-20260411    gcc-11.5.0
powerpc64             randconfig-001-20260411    gcc-11.5.0
powerpc64             randconfig-002-20260411    gcc-11.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260411    gcc-10.5.0
riscv                 randconfig-002-20260411    gcc-10.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260411    gcc-10.5.0
s390                  randconfig-002-20260411    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260411    gcc-10.5.0
sh                    randconfig-002-20260411    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260411    gcc-14
sparc                 randconfig-002-20260411    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260411    gcc-14
sparc64               randconfig-002-20260411    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260411    gcc-14
um                    randconfig-002-20260411    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260411    gcc-14
x86_64      buildonly-randconfig-002-20260411    gcc-14
x86_64      buildonly-randconfig-003-20260411    gcc-14
x86_64      buildonly-randconfig-004-20260411    gcc-14
x86_64      buildonly-randconfig-005-20260411    gcc-14
x86_64      buildonly-randconfig-006-20260411    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260411    gcc-14
x86_64                randconfig-002-20260411    gcc-14
x86_64                randconfig-003-20260411    gcc-14
x86_64                randconfig-004-20260411    gcc-14
x86_64                randconfig-005-20260411    gcc-14
x86_64                randconfig-006-20260411    gcc-14
x86_64                randconfig-011-20260411    clang-20
x86_64                randconfig-012-20260411    clang-20
x86_64                randconfig-013-20260411    clang-20
x86_64                randconfig-014-20260411    clang-20
x86_64                randconfig-015-20260411    clang-20
x86_64                randconfig-016-20260411    clang-20
x86_64                randconfig-071-20260411    clang-20
x86_64                randconfig-072-20260411    clang-20
x86_64                randconfig-073-20260411    clang-20
x86_64                randconfig-074-20260411    clang-20
x86_64                randconfig-075-20260411    clang-20
x86_64                randconfig-076-20260411    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260411    gcc-14
xtensa                randconfig-002-20260411    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

