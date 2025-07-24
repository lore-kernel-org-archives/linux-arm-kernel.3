Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCEAC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+iAufx7EfPzwlkAH/Yme/sG8Jt4E+HOVWg0GKsKy0sY=; b=OUlQaLUKh0vggdn/D+yUQbT6r8
	mGzzgAONyH2WRKLJHRyi70OXyy/9e3sq3YACusUFSLAJWeUkv5V1tCZDhA3IwgIUYttQJKgGJu14F
	ac2rqbuc8ozFCd30mtPEq9qopvCz4S6YQM5qtUwNg7JP0JzlRq7nSgj5emb41i069gQSOKgPg3c7o
	DHeZeMCe5WosG0uYKdJ9wweBl6Byx+JSnEJBwa4TdmvBZh8pRlJLd3iMeR2H+zvnTmLsvIW5MpK+E
	I1gFkFX6JgBzo1cZdQbPdSu1fIHjNSMq1XP9FDbTmy7whKt3W2J0y4XX61HEQPLpXefOD55lrVBG1
	PQEOKU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewN8-00000007ZDp-2sAp;
	Thu, 24 Jul 2025 13:52:34 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uet9Q-00000007CRA-18xu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 10:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753352773; x=1784888773;
  h=date:from:to:cc:subject:message-id;
  bh=rRgo8t/VAQMx0wdRQZI4YsKM0NHb3+gLPKQXwdGQ9K0=;
  b=kRztbKZLYsJCck9T43fb8pPhE4K/4PanR4NxrcTpRFglc+AgF3alVxRX
   3AhOIzslIJV3P6NvxISLIKotXekv4CdBdtlO4lWbIdQa5hOFvF5Rd40cF
   AmHD98SI3+dQFohml5tBj9pB+Kx2kTurFRpvLtapkoWDSryuxYVZUhs5o
   CkTaD9EOfBO+I974bgn6ZxqA6Gdps1Pb2kFfJdDxOZ+QernoP19eTdPnB
   YpXmxHr4Z7HWJ1EUhkKYtl5tZ7kL6ofmYLJEYG/Acwa0dcHnuo/vCMiS+
   jiLo+8R0Ypa3VvTEFLGToDJeBdYQnhzm8UQKPGdCOzt+3L3UloQw3EFev
   g==;
X-CSE-ConnectionGUID: sE+Ug0O6SfW32zRdJSWxjg==
X-CSE-MsgGUID: zSEbrxwXQEK4epAqrQQjSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55807953"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="55807953"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 03:26:11 -0700
X-CSE-ConnectionGUID: 2RZtA+I6SnaxNq6a0m5SGQ==
X-CSE-MsgGUID: lElv4k3HQJGlN+Ghr4GF8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="191080349"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jul 2025 03:26:10 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uet9L-000KJX-0N;
	Thu, 24 Jul 2025 10:26:07 +0000
Date: Thu, 24 Jul 2025 18:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:sophgo/sg2000] BUILD SUCCESS
 fe4fd701938197c2bceeeff670da3ace9b488d09
Message-ID: <202507241833.TmbKPVy5-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_032612_326479_6A840DED 
X-CRM114-Status: UNSURE (   5.19  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git sophgo/sg2000
branch HEAD: fe4fd701938197c2bceeeff670da3ace9b488d09  arm64: defconfig: Enable rudimentary Sophgo SG2000 support

elapsed time: 775m

configs tested: 114
configs skipped: 115

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250724    clang-22
arc                   randconfig-002-20250724    clang-22
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                   randconfig-001-20250724    clang-22
arm                   randconfig-002-20250724    clang-22
arm                   randconfig-003-20250724    clang-22
arm                   randconfig-004-20250724    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                 randconfig-001-20250724    clang-22
arm64                 randconfig-001-20250724    gcc-8.5.0
arm64                 randconfig-002-20250724    clang-22
arm64                 randconfig-003-20250724    clang-22
arm64                 randconfig-003-20250724    gcc-13.4.0
arm64                 randconfig-004-20250724    clang-22
csky                              allnoconfig    clang-22
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250724    gcc-12
i386        buildonly-randconfig-002-20250724    gcc-12
i386        buildonly-randconfig-003-20250724    gcc-12
i386        buildonly-randconfig-004-20250724    gcc-12
i386        buildonly-randconfig-005-20250724    gcc-12
i386        buildonly-randconfig-006-20250724    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250724    clang-20
i386                  randconfig-002-20250724    clang-20
i386                  randconfig-003-20250724    clang-20
i386                  randconfig-004-20250724    clang-20
i386                  randconfig-005-20250724    clang-20
i386                  randconfig-006-20250724    clang-20
i386                  randconfig-007-20250724    clang-20
i386                  randconfig-011-20250724    gcc-12
i386                  randconfig-012-20250724    gcc-12
i386                  randconfig-013-20250724    gcc-12
i386                  randconfig-014-20250724    gcc-12
i386                  randconfig-015-20250724    gcc-12
i386                  randconfig-016-20250724    gcc-12
i386                  randconfig-017-20250724    gcc-12
loongarch                         allnoconfig    clang-22
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-22
powerpc                           allnoconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250724    gcc-13.4.0
riscv                 randconfig-002-20250724    gcc-13.4.0
s390                              allnoconfig    clang-22
s390                                defconfig    gcc-12
s390                  randconfig-001-20250724    gcc-13.4.0
s390                  randconfig-002-20250724    gcc-13.4.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250724    gcc-13.4.0
sh                    randconfig-002-20250724    gcc-13.4.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250724    gcc-13.4.0
sparc                 randconfig-002-20250724    gcc-13.4.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250724    gcc-13.4.0
sparc64               randconfig-002-20250724    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250724    gcc-13.4.0
um                    randconfig-002-20250724    gcc-13.4.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250724    gcc-12
x86_64      buildonly-randconfig-002-20250724    gcc-12
x86_64      buildonly-randconfig-003-20250724    gcc-12
x86_64      buildonly-randconfig-004-20250724    gcc-12
x86_64      buildonly-randconfig-005-20250724    gcc-12
x86_64      buildonly-randconfig-006-20250724    gcc-12
x86_64                              defconfig    clang-20
x86_64                randconfig-001-20250724    gcc-12
x86_64                randconfig-002-20250724    gcc-12
x86_64                randconfig-003-20250724    gcc-12
x86_64                randconfig-004-20250724    gcc-12
x86_64                randconfig-005-20250724    gcc-12
x86_64                randconfig-006-20250724    gcc-12
x86_64                randconfig-007-20250724    gcc-12
x86_64                randconfig-008-20250724    gcc-12
x86_64                randconfig-071-20250724    clang-20
x86_64                randconfig-072-20250724    clang-20
x86_64                randconfig-073-20250724    clang-20
x86_64                randconfig-074-20250724    clang-20
x86_64                randconfig-075-20250724    clang-20
x86_64                randconfig-076-20250724    clang-20
x86_64                randconfig-077-20250724    clang-20
x86_64                randconfig-078-20250724    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250724    gcc-13.4.0
xtensa                randconfig-002-20250724    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

