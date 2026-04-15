Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B91F43832
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HeTGYpYRcTPpuqcRTG+Zwn8RI1u5djzA1MbNiSWOWrY=; b=D8NTH4VbaNJCAzb+6KQdBAOELY
	epNSFAv6GRSTe/NVedWtMK5ItyfrdH2Oc8PiD/j7nabk1r4VBFw7BJxUEaQUi/BtVQxsfxjrD0iXF
	JxA7BnD3MycQLHdBIO0Ph/n9D/uuMyURRxFFA8QZd4fTmHN49WXRNYhW7DBw8ObrTE7IJhPBBaMa0
	GEvgUXgo5De1T1IbtqmTZMbQAFcURszVgw4tpbjI5hPO9HUQ2S6oYoZj46IhQhmv//TOe50MuZB/4
	SMKcIbh2wxmjA+gY39MVWFhj+vU6ve4BqCI9GBkNEOcNadafbRHD6AKLczo3GQYAP9FWmHaJSp+Ap
	fKaCJasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1ug-00000001ICf-1Eky;
	Wed, 15 Apr 2026 15:12:22 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1ud-00000001IC3-0Vgv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 15:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776265939; x=1807801939;
  h=date:from:to:cc:subject:message-id;
  bh=SOQGz/fDRQywRRXewcUYBKGX7+7cvSid0fRAgaj8tH4=;
  b=U15ukBPlhO5XlUVUYej/tcJCteGTzD3bNQ1jOzGLwFjvcWwRHoSla8Y4
   ktD7mKqTiOMFZsYUWhLVfEmnLvWHqJFiwwks2VCT/fxOp4PFPZSlpm9UQ
   P0BFFLQ6StWMFe2oVr4OTOil6gPlLQHYupxg2xrQypY/r5No+/uvA9uZ2
   vAWLcKgXz8lejIzOwjiVOVXS9htdjz5GIYkONkqwVGmkoMSfSbxeWWJqT
   Wrpwov7mnPduKeGKtysGSkOt1pQuCEXJe8+vBj/F7X0aV+24lz//l3haJ
   rvg0jDRiil7VZsfSWWC8TictW8yjOMD6GMEiIzeJCSK221Wlc2edH4ioR
   A==;
X-CSE-ConnectionGUID: wH0iG2bwSEyY2K0L7lPyQQ==
X-CSE-MsgGUID: Nb05yJCRTA2CNxjw1B3Qog==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77122679"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77122679"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 08:12:18 -0700
X-CSE-ConnectionGUID: dT0SoCwqToS/0SbKUOFm3w==
X-CSE-MsgGUID: RMKA1zcLRv+X3hwcP7ssQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="229600155"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Apr 2026 08:12:17 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD1uX-000000000cT-3nAo;
	Wed, 15 Apr 2026 15:12:14 +0000
Date: Wed, 15 Apr 2026 23:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 a578ece7a274f9c4d69eda571a16d9fc47501cd0
Message-ID: <202604152317.5wkn82dw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_081219_206602_A00A0494 
X-CRM114-Status: UNSURE (   4.87  )
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
branch HEAD: a578ece7a274f9c4d69eda571a16d9fc47501cd0  soc: document merges

elapsed time: 1188m

configs tested: 179
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260415    gcc-13.4.0
arc                   randconfig-002-20260415    gcc-15.2.0
arc                    vdk_hs38_smp_defconfig    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260415    clang-23
arm                   randconfig-002-20260415    clang-23
arm                   randconfig-003-20260415    gcc-8.5.0
arm                   randconfig-004-20260415    clang-17
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260415    gcc-15.2.0
arm64                 randconfig-002-20260415    gcc-14.3.0
arm64                 randconfig-003-20260415    gcc-13.4.0
arm64                 randconfig-004-20260415    clang-19
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260415    gcc-9.5.0
csky                  randconfig-002-20260415    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260415    clang-18
hexagon               randconfig-001-20260415    clang-23
hexagon               randconfig-002-20260415    clang-18
hexagon               randconfig-002-20260415    clang-23
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386        buildonly-randconfig-001-20260415    clang-20
i386        buildonly-randconfig-002-20260415    gcc-14
i386        buildonly-randconfig-004-20260415    gcc-14
i386        buildonly-randconfig-005-20260415    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20260415    gcc-14
i386                  randconfig-002-20260415    clang-20
i386                  randconfig-003-20260415    gcc-13
i386                  randconfig-004-20260415    clang-20
i386                  randconfig-005-20260415    clang-20
i386                  randconfig-011-20260415    gcc-14
i386                  randconfig-012-20260415    clang-20
i386                  randconfig-013-20260415    gcc-14
i386                  randconfig-014-20260415    gcc-14
i386                  randconfig-015-20260415    clang-20
i386                  randconfig-016-20260415    gcc-14
i386                  randconfig-017-20260415    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260415    clang-18
loongarch             randconfig-002-20260415    clang-18
loongarch             randconfig-002-20260415    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260415    clang-18
nios2                 randconfig-001-20260415    gcc-10.5.0
nios2                 randconfig-002-20260415    clang-18
nios2                 randconfig-002-20260415    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260415    gcc-9.5.0
parisc                randconfig-002-20260415    gcc-9.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                     akebono_defconfig    clang-23
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260415    gcc-9.5.0
powerpc               randconfig-002-20260415    gcc-9.5.0
powerpc64             randconfig-001-20260415    gcc-9.5.0
powerpc64             randconfig-002-20260415    gcc-9.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260415    clang-23
riscv                 randconfig-001-20260415    gcc-9.5.0
riscv                 randconfig-002-20260415    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260415    clang-23
s390                  randconfig-001-20260415    gcc-15.2.0
s390                  randconfig-002-20260415    clang-23
s390                  randconfig-002-20260415    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260415    clang-23
sh                    randconfig-001-20260415    gcc-13.4.0
sh                    randconfig-002-20260415    clang-23
sh                    randconfig-002-20260415    gcc-11.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260415    gcc-8.5.0
sparc                 randconfig-002-20260415    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260415    clang-23
sparc64               randconfig-002-20260415    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260415    clang-23
um                    randconfig-002-20260415    clang-23
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260415    clang-20
x86_64      buildonly-randconfig-002-20260415    clang-20
x86_64      buildonly-randconfig-002-20260415    gcc-13
x86_64      buildonly-randconfig-003-20260415    clang-20
x86_64      buildonly-randconfig-003-20260415    gcc-14
x86_64      buildonly-randconfig-004-20260415    clang-20
x86_64      buildonly-randconfig-005-20260415    clang-20
x86_64      buildonly-randconfig-006-20260415    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20260415    clang-20
x86_64                randconfig-072-20260415    clang-20
x86_64                randconfig-073-20260415    gcc-13
x86_64                randconfig-074-20260415    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260415    gcc-8.5.0
xtensa                randconfig-002-20260415    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

